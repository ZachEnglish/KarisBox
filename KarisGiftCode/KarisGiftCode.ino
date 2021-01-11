/*
  KarisBox

  Small toy for my child. The physical box has several LEDs and switches, 8 RGB LEDs and a
  small vibration motor.

  The ATtiny85 controls the power for everything through several transistors, thus making it
  not possible to accidently leave it all powered on for a long time when inactive.
*/

#include <avr/sleep.h>
#include <Adafruit_NeoPixel.h>
#include <avr/power.h>

//Stolen from the intertubes. tells the ATtiny85 to disable the analog to digital converter.
#define adc_disable() (ADCSRA &= ~(1<<ADEN)) // disable ADC (before power-off)

#define NUMBER_OF_RGB_LEDS 8

#define PIN_RGB            0
#define PIN_LED_CUTOFF     1
#define PIN_VIBRATE_DRIVE  2
#define PIN_VIBRATE_SWITCH 3
#define PIN_RGB_SWITCH     4

#define INACTIVE_TIME (15*1000) //just for testing, don't have that much patience
//#define INACTIVE_TIME (90*1000) //90 seconds converted to milliseconds
#define BUTTON_CHECK_TIME 10 //wait 10 milliseconds between checking the buttons' state

Adafruit_NeoPixel rgbStrip(NUMBER_OF_RGB_LEDS, PIN_RGB, NEO_GRB + NEO_KHZ800);

unsigned long time_of_last_action = 0;
unsigned long time_of_next_button_check = 0;
unsigned long time_of_vibration_start = INACTIVE_TIME * 2;
bool last_rgb_button = false;
bool last_vibrate_button = false;

int rgb_state = 0;
int rgb_last_processed_state = -1;

// the setup function runs once when you press reset or power the board
void setup() {

//TODO: Check if this is actually being used. Don't think so.
#if defined(__AVR_ATtiny85__) && (F_CPU == 16000000)
  clock_prescale_set(clock_div_1);
#endif

  //initialize pins
  pinMode(PIN_RGB, OUTPUT);
  pinMode(PIN_LED_CUTOFF, OUTPUT);
  pinMode(PIN_VIBRATE_DRIVE, OUTPUT);
  pinMode(PIN_VIBRATE_SWITCH, INPUT_PULLUP);
  pinMode(PIN_RGB_SWITCH, INPUT_PULLUP);
  
  //save power by disabling the anolog to digital converter, not using it anyway
  adc_disable();

  digitalWrite(PIN_LED_CUTOFF, HIGH);
  
  rgbStrip.begin();
  rgbStrip.show();
  rgbStrip.setBrightness(50);
}

// the loop function runs over and over again forever
void loop() {
  unsigned long current_time = millis();

  if(current_time >= time_of_next_button_check){
    bool current_rgb_button = !digitalRead(PIN_RGB_SWITCH);
    bool current_vibrate_button = !digitalRead(PIN_VIBRATE_SWITCH);
  
    if(current_rgb_button && !last_rgb_button){
      change_rgb_mode();
      reset_timer(current_time);
    }
  
    if(current_vibrate_button && !last_vibrate_button){
      start_vibrate(current_time);
      reset_timer(current_time);
    }
  
    last_rgb_button = current_rgb_button;
    last_vibrate_button = current_rgb_button;
    time_of_next_button_check = current_time + BUTTON_CHECK_TIME;
  }

  do_rgb();
  do_vibrate(current_time);

  if(ready_to_sleep(current_time)){
    go_to_sleep();
    //bye bye
  }
}


void turn_off_outputs(){
  //pinMode(PIN_RGB, INPUT); //If this is not done the RGB LEDs ground through this data pin and still light up/draw power.
  pinMode(PIN_LED_CUTOFF, INPUT); //this just saves power for some reason. Effectively stops driving the transistors high.
  pinMode(PIN_VIBRATE_DRIVE, INPUT); //this just saves power for some reason
}


//go to sleep and never come back. Have to reset to come back. Thankfully a button exists for that!
void go_to_sleep(){
  turn_off_outputs();
  set_sleep_mode(SLEEP_MODE_PWR_DOWN);
  sleep_enable();
  sleep_cpu();
}


bool ready_to_sleep(unsigned long current){
  if( (current - time_of_last_action) > INACTIVE_TIME ){
    return true;
  }
  return false;
}


void change_rgb_mode(){
  rgb_state++;

  if(rgb_state > 2){
    rgb_state = 0;
  }
}

void do_rgb(){
  if(rgb_state != rgb_last_processed_state){
    switch(rgb_state){
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
    rgb_last_processed_state = rgb_state;
  }
}


void turn_on_vibrate_motor(){
  digitalWrite(PIN_VIBRATE_DRIVE, HIGH);
}


void turn_off_vibrate_motor(){
  digitalWrite(PIN_VIBRATE_DRIVE, LOW);
}


void start_vibrate(unsigned long current){
  time_of_vibration_start = current;
  turn_on_vibrate_motor();
}


//want 0.5 second pulse, 0.5 second wait, 0.5 second pulse, 1 second wait, then repeat the pulses
void do_vibrate(unsigned long current){
  unsigned long difference = current - time_of_vibration_start; //this should never go negative

  if(digitalRead(PIN_VIBRATE_DRIVE)){ //was on, so turn it off
    if(
      ( difference >= 500 && difference < 1000 ) ||
      ( difference >= 1500 && difference < 2500 ) ||
      ( difference >= 3000 && difference < 3500 ) ||
      ( difference >= 4000 )
      ){
        turn_off_vibrate_motor();
      }
  }
  else{ //motor was off - so turn it ON
    if(
      ( difference >= 1000 && difference < 1500 ) ||
      ( difference >= 2500 && difference < 3000 ) ||
      ( difference >= 3500 && difference < 4000 )
      ){
        turn_on_vibrate_motor();
      }
  }
}


void reset_timer(unsigned long current){
  time_of_last_action = current;
}


// Fill strip pixels one after another with a color. Strip is NOT cleared
// first; anything there will be covered pixel by pixel. Pass in color
// (as a single 'packed' 32-bit value, which you can get by calling
// strip.Color(red, green, blue) as shown in the loop() function above),
// and a delay time (in milliseconds) between pixels.
void colorWipe(uint32_t color, int wait) {
  for(int i=0; i<rgbStrip.numPixels(); i++) { // For each pixel in strip...
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
  for(long firstPixelHue = 0; firstPixelHue < 5*65536; firstPixelHue += 256) {
    for(int i=0; i<rgbStrip.numPixels(); i++) { // For each pixel in strip...
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
