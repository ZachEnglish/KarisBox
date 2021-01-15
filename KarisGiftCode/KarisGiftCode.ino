/*
  KarisGiftCode

  Small toy for my child. The physical box has several LEDs and switches, 8 RGB LEDs and a
  small vibration motor.

  The ATtiny85 controls the power for everything through several transistors, thus making it
  not possible to accidently leave it all powered on for a long time when inactive. Never
  actually "off", just in a sleep mode until the reset button is pressed.
*/

#include <avr/sleep.h> //for putting the ATtiny85 nigh-nigh
#include <avr/power.h> //ditto
#include <Adafruit_NeoPixel.h> //for talking to the RGB LEDs


//Stolen from the intertubes. Macro that tells the ATtiny85 to disable the analog to digital converter to save power.
#define adc_disable() (ADCSRA &= ~(1<<ADEN)) // disable ADC (before power-off)


#define NUMBER_OF_RGB_LEDS 8

#define PIN_RGB            0
#define PIN_LED_CUTOFF     1
#define PIN_VIBRATE_DRIVE  2
#define PIN_VIBRATE_SWITCH 3
#define PIN_RGB_SWITCH     4


//#define INACTIVE_TIME (90*1000) //90 seconds converted to milliseconds
#define INACTIVE_TIME (15*1000) //just for testing, I don't have that much patience

#define BUTTON_CHECK_TIME 10 //wait 10 milliseconds between checking the buttons' state

#define RGB_WIPE_DELAY    50
#define RGB_RAINBOW_DELAY 1


//Make an object/variable to talk to the RGB strip. Tell it how many LEDs there are
//and what pin to talk to them on. Also how to format some of the data.
Adafruit_NeoPixel rgbStrip(NUMBER_OF_RGB_LEDS, PIN_RGB, NEO_GRB + NEO_KHZ800);


unsigned long g_time_of_last_action = 0;
unsigned long g_time_to_check_buttons_again = 0;
unsigned long g_time_of_vibration_start = INACTIVE_TIME * 2; //make sure the vibration doesn't start unless the button is pressed!
unsigned long g_time_of_RGB_current_mode_start = 0;
uint32_t      g_current_RGB_color = rgbStrip.Color(0, 0, 0);
int           g_last_pixel = -1;
long          g_first_RGB_pixel_hue = 0;
long          g_last_rainbow_loop = -1;
bool          g_last_rgb_button_state = false;
bool          g_last_vibrate_button_state = false;

int g_rgb_state = 0;
int g_rgb_last_processed_state = -1;


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
  rgbStrip.setBrightness(50); //turn down the brightness (save power and eyeballs). 0-255
}



// the loop function runs over and over again until it puts itself to sleep.
void loop() {
  unsigned long current_time = millis();

  if (current_time >= g_time_to_check_buttons_again) { //basic debounce logic, only check the buttons so often.
    do_buttons(current_time);
    g_time_to_check_buttons_again = current_time + BUTTON_CHECK_TIME;
  }

  do_rgb(current_time);
  do_vibrate(current_time);

  if (ready_to_sleep(current_time)) {
    go_to_sleep();
    //bye bye
  }
}


void do_buttons(unsigned long current_time) {
  //Get the state of the buttons. Invert the logic to make true/high when pressed
  bool current_rgb_button_state = !digitalRead(PIN_RGB_SWITCH);
  bool current_vibrate_button_state = !digitalRead(PIN_VIBRATE_SWITCH);

  //if it is pressed now and it wasn't last time we checked...
  if (current_rgb_button_state && !g_last_rgb_button_state) {
    change_rgb_mode(current_time);
    reset_sleep_timer(current_time);
  }

  if (current_vibrate_button_state && !g_last_vibrate_button_state) {
    start_vibrate(current_time);
    reset_sleep_timer(current_time);
  }

  g_last_rgb_button_state = current_rgb_button_state;
  g_last_vibrate_button_state = current_rgb_button_state;
}


void change_rgb_mode(unsigned long current_time) {
  g_rgb_state++;
  g_time_of_RGB_current_mode_start = current_time;

  if (g_rgb_state > 2) {
    g_rgb_state = 0;
  }
  switch (g_rgb_state) {
    case 0:
      g_current_RGB_color = rgbStrip.Color(255, 0, 0);
      break;
    case 1:
      g_current_RGB_color = rgbStrip.Color(0, 255, 0);
      break;
    case 2:
      g_current_RGB_color = rgbStrip.Color(0, 0, 255);
      break;
  }
}


void reset_sleep_timer(unsigned long current_time) {
  g_time_of_last_action = current_time;
}


void start_vibrate(unsigned long current_time) {
  g_time_of_vibration_start = current_time;
  turn_on_vibrate_motor();
}


void do_rgb(unsigned long current_time) {
  unsigned long time_since_entering_RGB_state = current_time - g_time_of_RGB_current_mode_start;

  switch (g_rgb_state) {
    case 0:
    case 1:
    case 2:
      int current_pixel = ( time_since_entering_RGB_state / RGB_WIPE_DELAY ) % rgbStrip.numPixels();
      if (current_pixel != g_last_pixel) {
        g_last_pixel = current_pixel;
        progress_color_wipe(current_pixel);
      }
      break;
    case 3:
      //g_first_RGB_pixel_hue
      long rainbow_loop_counter = time_since_entering_RGB_state / RGB_RAINBOW_DELAY;
      if (rainbow_loop_counter != g_last_rainbow_loop){
        g_last_rainbow_loop = rainbow_loop_counter;
        progress_rainbow();
      }
      break;
  }
}

void progress_color_wipe(int pixel) {
  rgbStrip.setPixelColor(pixel, g_current_RGB_color);
  rgbStrip.show();
}

void progress_rainbow(){
  for (int i = 0; i < rgbStrip.numPixels(); i++) {
    int pixelHue = g_first_RGB_pixel_hue + (i * 65536L / rgbStrip.numPixels());
    rgbStrip.setPixelColor(i, rgbStrip.gamma32(rgbStrip.ColorHSV(pixelHue)));
  }
  g_first_RGB_pixel_hue += 256;
  rgbStrip.show();
}

void old_do_rgb(unsigned long current_time) {
  if (g_rgb_state != g_rgb_last_processed_state) {
    switch (g_rgb_state) {
      case 0:
        colorWipe(rgbStrip.Color(255,   0,   0), 50); // Red
        break;
      case 1:
        colorWipe(rgbStrip.Color(  0, 255,   0), 50); // Green
        break;
      case 2:
        colorWipe(rgbStrip.Color(  0,   0, 255), 50); // Blue
        break;
    }
    g_rgb_last_processed_state = g_rgb_state;
  }
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

  if (digitalRead(PIN_VIBRATE_DRIVE)) { //was on, so turn it off
    if (
      ( difference >= 500 && difference < 1000 ) ||
      ( difference >= 1500 && difference < 2500 ) ||
      ( difference >= 3000 && difference < 3500 ) ||
      ( difference >= 4000 )
    ) {
      turn_off_vibrate_motor();
    }
  }
  else { //motor was off - so turn it ON
    if (
      ( difference >= 1000 && difference < 1500 ) ||
      ( difference >= 2500 && difference < 3000 ) ||
      ( difference >= 3500 && difference < 4000 )
    ) {
      turn_on_vibrate_motor();
    }
  }
}


void turn_on_vibrate_motor() {
  digitalWrite(PIN_VIBRATE_DRIVE, HIGH);
}


void turn_off_vibrate_motor() {
  digitalWrite(PIN_VIBRATE_DRIVE, LOW);
}


//has it been sitting long enough to turn off?
bool ready_to_sleep(unsigned long current_time) {
  if ( (current_time - g_time_of_last_action) > INACTIVE_TIME ) {
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
//using inpput_pullup because the intertubes says it could save power in some situations
void turn_off_outputs() {
  pinMode(PIN_RGB, INPUT_PULLUP);
  pinMode(PIN_LED_CUTOFF, INPUT_PULLUP);
  pinMode(PIN_VIBRATE_DRIVE, INPUT_PULLUP);
}









// Fill strip pixels one after another with a color. Strip is NOT cleared
// first; anything there will be covered pixel by pixel. Pass in color
// (as a single 'packed' 32-bit value, which you can get by calling
// strip.Color(red, green, blue) as shown in the loop() function above),
// and a delay time (in milliseconds) between pixels.
void colorWipe(uint32_t color, int wait) {
  for (int i = 0; i < rgbStrip.numPixels(); i++) { // For each pixel in strip...
    rgbStrip.setPixelColor(i, color);         //  Set pixel's color (in RAM)
    rgbStrip.show();                          //  Update strip to match
    delay(wait);                           //  Pause for a moment
  }
}

// Rainbow cycle along whole strip. Pass delay time (in ms) between frames.
void rainbow(int wait) {
  // Hue of first pixel runs 5 complete loops through the color wheel.
  // Color wheel has a range of 65536 but it's OK if we roll over, so
  // just count from 0 to 5*65536. Adding 256 to firstPixelHue each time
  // means we'll make 5*65536/256 = 1280 passes through this outer loop:
  for (long firstPixelHue = 0; firstPixelHue < 5 * 65536; firstPixelHue += 256) {
    for (int i = 0; i < rgbStrip.numPixels(); i++) { // For each pixel in strip...
      // Offset pixel hue by an amount to make one full revolution of the
      // color wheel (range of 65536) along the length of the strip
      // (strip.numPixels() steps):
      int pixelHue = firstPixelHue + (i * 65536L / rgbStrip.numPixels());
      // strip.ColorHSV() can take 1 or 3 arguments: a hue (0 to 65535) or
      // optionally add saturation and value (brightness) (each 0 to 255).
      // Here we're using just the single-argument hue variant. The result
      // is passed through strip.gamma32() to provide 'truer' colors
      // before assigning to each pixel:
      rgbStrip.setPixelColor(i, rgbStrip.gamma32(rgbStrip.ColorHSV(pixelHue)));
    }
    rgbStrip.show(); // Update strip with new contents
    delay(wait);  // Pause for a moment
  }
}
