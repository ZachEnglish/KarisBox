/*
  KarisGiftCode

  Small toy for my child. The physical box has several LEDs and switches, 7 RGB LEDs and a
  small vibration motor.

  The ATtiny85 controls the power for everything through several transistors, thus making it
  not possible to accidently leave it all powered on for a long time when inactive. Never
  actually "off", just in a sleep mode until the reset button is pressed.

  Code and HW schematic can be found @ https://github.com/ZachEnglish/KarisBox
*/

#include <avr/sleep.h> //for putting the ATtiny85 nigh-nigh
#include <avr/power.h> //ditto
#include <Adafruit_NeoPixel.h> //for talking to the RGB LEDs
#include <EEPROM.h> //for saving state before shutting so when it boots back up it picks up where it left off
#include <limits.h> //gives us the ULONG_MAX define used to make sure we never accidentally turn on the vibration motor


//Stolen from the intertubes. Macro that tells the ATtiny85 to disable the analog to digital converter to save power.
#define adc_disable() (ADCSRA &= ~(1<<ADEN)) // disable ADC (before power-off)


#define NUMBER_OF_RGB_LEDS 7

#define PIN_RGB            0 //data line out to the RGB LEDs
#define PIN_LED_CUTOFF     1 //signal to all LED and RGB LED transistors
#define PIN_VIBRATE_DRIVE  2 //signal to vibration motor transistor
#define PIN_VIBRATE_SWITCH 3 //input from button/switch to initiate vibrate sequence
#define PIN_RGB_SWITCH     4 //input form button/switch to change RGB state


#define INACTIVE_TIME (90UL*1000UL) //90 seconds converted to milliseconds

#define BUTTON_CHECK_TIME 10 //wait 10 milliseconds between checking the buttons' state

#define RGB_WIPE_DELAY         100 //wait 100 milliseconds between changing RGB leds to the new color to give a "wipe" look
#define RGB_RAINBOW_FAST_DELAY 5   //wait 1 millisecond between hue changes while doing the fast rainbow
#define RGB_RAINBOW_SLOW_DELAY 20  //wait 1 millisecond between hue changes while doing the slow rainbow

//the states for the RGB LEDs. When the button is pressed the program should cycle through these.
enum RGB_modes {
  RGB_modes_first,
  RGB_RAINBOW_COUNT_0 = 0,
  RGB_RAINBOW_COUNT_1 = 1,
  RGB_RAINBOW_COUNT_2 = 2,
  RGB_RAINBOW_COUNT_3 = 3,
  RGB_RAINBOW_COUNT_4 = 4,
  RGB_RAINBOW_COUNT_5 = 5,
  RGB_RAINBOW_COUNT_6 = 6,
  RGB_RAINBOW_COUNT_7 = 7,
  RGB_RED_WIPE,
  RGB_GREEN_WIPE,
  RGB_BLUE_WIPE,
  RGB_RAINBOW_FAST,
  RGB_RAINBOW_SLOW,
  RGB_modes_count
};


//Make an object/variable to talk to the RGB strip. Tell it how many LEDs there are
//and what pin to talk to them on. Also how to format some of the data.
Adafruit_NeoPixel rgbStrip(NUMBER_OF_RGB_LEDS, PIN_RGB, NEO_GRB + NEO_KHZ800);


unsigned long g_time_of_last_action = 0;
unsigned long g_time_of_vibration_start = ULONG_MAX / 2; //make sure the vibration doesn't start unless the button is pressed!
unsigned long g_time_of_rgb_current_mode_start = 0;
uint32_t      g_current_rgb_color = rgbStrip.Color(255, 0, 0);
long          g_first_rgb_pixel_hue = 0;
RGB_modes     g_rgb_mode = RGB_modes_first;


// the setup function runs once when you power on the board or press reset
void setup() {
  //initialize pins
  pinMode(PIN_RGB, OUTPUT);
  pinMode(PIN_LED_CUTOFF, OUTPUT);
  pinMode(PIN_VIBRATE_DRIVE, OUTPUT);
  pinMode(PIN_VIBRATE_SWITCH, INPUT_PULLUP);
  pinMode(PIN_RGB_SWITCH, INPUT_PULLUP);

  //save power by disabling the anolog to digital converter, not using it anyway
  adc_disable();

  digitalWrite(PIN_LED_CUTOFF, HIGH); //HIGH leaves the LEDs able to turn on. LOW turns off the circuit.

  rgbStrip.begin(); //initialize the RGB strip
  rgbStrip.show(); //push out the empty buffer so the strip goes clear (in case it had something in it)
  rgbStrip.setBrightness(15); //turn down the brightness (save power and eyeballs). 0-255

  restore_rgb_mode_from_eeprom();
}


// the loop function runs over and over again until it puts itself to sleep.
void loop() {
  static unsigned long time_to_check_buttons_again = 0;
  unsigned long current_time = millis();

  if (current_time >= time_to_check_buttons_again) { //basic debounce logic, only check the buttons so often.
    do_buttons(current_time);
    time_to_check_buttons_again = current_time + BUTTON_CHECK_TIME;
  }

  do_rgb(current_time);
  do_vibrate(current_time);

  if (ready_to_sleep(current_time)) {
    go_to_sleep();
    //bye bye
  }
}


void do_buttons(unsigned long current_time) {
  if (rgb_button_has_been_pressed()) {
    change_rgb_mode(current_time);
    reset_sleep_timer(current_time);
  }

  if (vibrate_button_has_been_pressed()) {
    start_vibrate(current_time);
    reset_sleep_timer(current_time);
  }
}

bool rgb_button_has_been_pressed() {
  static bool last_rgb_button_state = false;
  //Get the state of the button. Invert the logic to make true/high when pressed
  bool current_rgb_button_state = !digitalRead(PIN_RGB_SWITCH);
  bool pressed;

  //if it is pressed now and it wasn't last time we checked...
  if (current_rgb_button_state && !last_rgb_button_state) {
    pressed = true;
  }
  else {
    pressed = false;
  }

  last_rgb_button_state = current_rgb_button_state;
  return pressed;
}

bool vibrate_button_has_been_pressed() {
  static bool last_vibrate_button_state = false;
  //Get the state of the button. Invert the logic to make true/high when pressed
  bool current_vibrate_button_state = !digitalRead(PIN_VIBRATE_SWITCH);
  bool pressed;

  if (current_vibrate_button_state && !last_vibrate_button_state) {
    pressed = true;
  }
  else {
    pressed = false;
  }

  last_vibrate_button_state = current_vibrate_button_state;
  return pressed;
}

void change_rgb_mode(unsigned long current_time) {
  g_rgb_mode = g_rgb_mode + 1;

  save_current_rgb_mode_to_eeprom();

  if (g_rgb_mode >= RGB_modes_count) {
    g_rgb_mode = RGB_modes_first;
  }

  g_time_of_rgb_current_mode_start = current_time;
}

void reset_sleep_timer(unsigned long current_time) {
  g_time_of_last_action = current_time;
}

void start_vibrate(unsigned long current_time) {
  g_time_of_vibration_start = current_time;
  turn_on_vibrate_motor();
}

void do_rgb(unsigned long current_time) {
  unsigned long time_since_entering_RGB_state = current_time - g_time_of_rgb_current_mode_start;

  switch (g_rgb_mode) {
    case RGB_RAINBOW_COUNT_0:
    case RGB_RAINBOW_COUNT_1:
    case RGB_RAINBOW_COUNT_2:
    case RGB_RAINBOW_COUNT_3:
    case RGB_RAINBOW_COUNT_4:
    case RGB_RAINBOW_COUNT_5:
    case RGB_RAINBOW_COUNT_6:
    case RGB_RAINBOW_COUNT_7:
      do_rgb_count(g_rgb_mode);
      break;
    case RGB_RED_WIPE:
      g_current_rgb_color = rgbStrip.Color(255, 0, 0);
      do_color_wipe(time_since_entering_RGB_state);
      break;
    case RGB_GREEN_WIPE:
      g_current_rgb_color = rgbStrip.Color(0, 255, 0);
      do_color_wipe(time_since_entering_RGB_state);
      break;
    case RGB_BLUE_WIPE:
      g_current_rgb_color = rgbStrip.Color(0, 0, 255);
      do_color_wipe(time_since_entering_RGB_state);
      break;
    case RGB_RAINBOW_FAST:
      do_rgb_rainbow(time_since_entering_RGB_state, RGB_RAINBOW_FAST_DELAY);
      break;
    case RGB_RAINBOW_SLOW:
      do_rgb_rainbow(time_since_entering_RGB_state, RGB_RAINBOW_SLOW_DELAY);
      break;
  }
}

void do_rgb_count(int current_count) {
  calculate_and_push_pixels_for_rainbow(current_count);
  rgbStrip.show();
}

void do_color_wipe(unsigned long time_in_state) {
  static unsigned long last_rgb_pixel_updated = NUMBER_OF_RGB_LEDS;
  unsigned long current_pixel = ( time_in_state / RGB_WIPE_DELAY ) % rgbStrip.numPixels();

  if (current_pixel != last_rgb_pixel_updated) {
    last_rgb_pixel_updated = current_pixel;
    progress_color_wipe(current_pixel);
  }
}

void progress_color_wipe(int pixel) {
  rgbStrip.setPixelColor(pixel, g_current_rgb_color);
  rgbStrip.show();
}

void do_rgb_rainbow(unsigned long time_in_state, unsigned long delay) {
  static unsigned long last_rainbow_loop = 0;
  unsigned long rainbow_loop_counter = 0;

  if (delay == 0) {
    delay = 1;
  }

  rainbow_loop_counter = time_in_state / delay;
  if (rainbow_loop_counter != last_rainbow_loop) {
    last_rainbow_loop = rainbow_loop_counter;
    progress_rainbow();
  }
}

void progress_rainbow() {
  calculate_and_push_pixels_for_rainbow(rgbStrip.numPixels());
  advance_rainbow_hue();
  rgbStrip.show();
}

void calculate_and_push_pixels_for_rainbow(int how_many_turned_on) {
  for (int i = 0; i < how_many_turned_on; i++) {
    int pixelHue = g_first_rgb_pixel_hue + (i * 65536L / rgbStrip.numPixels());
    rgbStrip.setPixelColor(i, rgbStrip.gamma32(rgbStrip.ColorHSV(pixelHue)));
  }
  for (int i = how_many_turned_on; i < rgbStrip.numPixels(); i++) {
    rgbStrip.setPixelColor(i, 0);
  }
}

void advance_rainbow_hue() {
  g_first_rgb_pixel_hue += 256;
}

//want 0.5 second pulse, 0.5 second wait, 0.5 second pulse, 1 second wait, then repeat the pulses
// 0.0 seconds - turned on (by start_vibrate())
// 0.5 seconds - turn off
// 1.0 seconds - turn on
// 1.5 seconds - turn off
// 2.5 seconds - turn on
// 3.0 seconds - turn off
// 3.5 seconds - turn on
// 4.0 seconds - turn off
void do_vibrate(unsigned long current) {
  unsigned long difference = current - g_time_of_vibration_start; //this should never go negative

  if ( vibrate_should_be_off( difference ) ) {
    if ( is_vibrate_motor_on() ) {
      turn_off_vibrate_motor();
    }
  }
  else { //should be on
    if ( is_vibrate_motor_on() == false ) {
      turn_on_vibrate_motor();
    }
  }
}

// 0.5 seconds - turn off
// 1.5 seconds - turn off
// 3.0 seconds - turn off
// 4.0 seconds - turn off
bool vibrate_should_be_off(unsigned long diff) {
  if (( diff >= 500 && diff < 1000 ) ||
      ( diff >= 1500 && diff < 2500 ) ||
      ( diff >= 3000 && diff < 3500 ) ||
      ( diff >= 4000 )
     ) {
    return true;
  }
  else
  {
    return false;
  }
}

bool is_vibrate_motor_on() {
  return ( digitalRead(PIN_VIBRATE_DRIVE) == HIGH );
}

void turn_on_vibrate_motor() {
  digitalWrite(PIN_VIBRATE_DRIVE, HIGH);
}

void turn_off_vibrate_motor() {
  digitalWrite(PIN_VIBRATE_DRIVE, LOW);
}

//has it been sitting long enough to turn off?
bool ready_to_sleep(unsigned long current_time) {
  if ( (current_time - g_time_of_last_action) > (unsigned long)INACTIVE_TIME ) {
    return true;
  }
  return false;
}

//go to sleep and never come back. Have to reset to come back. Thankfully a button exists for that!
void go_to_sleep() {
  turn_off_outputs();
  set_sleep_mode(SLEEP_MODE_PWR_DOWN);
  sleep_enable();
  sleep_cpu();
}

//power is saved on the ATtiny85 by setting outputs to inputs before sleeping
//used inpput_pullup because the intertubes says it could save power in some situations
//in my real world testing, though, it definitely did NOT save power. Went back to just
//INPUT.
void turn_off_outputs() {
  pinMode(PIN_RGB, INPUT);
  pinMode(PIN_LED_CUTOFF, INPUT);
  pinMode(PIN_VIBRATE_DRIVE, INPUT);
}

void save_current_rgb_mode_to_eeprom() {
  EEPROM.write(0, g_rgb_mode);
}

void restore_rgb_mode_from_eeprom() {
  RGB_modes mode_read_in_eeprom = EEPROM.read(0);

  if (rgb_mode_is_out_of_bounds(mode_read_in_eeprom)) {
    initialize_rgb_mode(&mode_read_in_eeprom);
  }

  g_rgb_mode = mode_read_in_eeprom;
}

bool rgb_mode_is_out_of_bounds(RGB_modes mode_to_test) {
  return mode_to_test >= RGB_modes_count;
}

void initialize_rgb_mode(RGB_modes *mode_to_init) {
  *mode_to_init = RGB_modes_first;
  EEPROM.write(0, *mode_to_init);
}
