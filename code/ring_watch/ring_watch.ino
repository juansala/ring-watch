// Date and time functions using a PCF8523 RTC connected via I2C and Wire lib
#include "RTClib.h"
#include <SoftwareSerial.h>

// ATtiny Outputs
const int Red = 0;
const int Green = 1;
const int Blue = 4;
const int White = 3;
volatile uint8_t* Port[] = {&OCR0A, &OCR0B, &OCR1A, &OCR1B};

// FSM
int state;
unsigned long timer;
const int INIT = 0;
const int SHOW = 1;
const int STANDBY = 2;

// Hour-hand color labels (0->12, 1->1, ..., 11->11)
const int RED = 0; 
const int ORANGE = 1;
const int YELLOW = 2;
const int LEAF_GREEN = 3;
const int GREEN = 4;
const int SPRING_GREEN = 5;
const int SKY_BLUE = 6;
const int LIGHT_BLUE = 7;
const int BLUE = 8;
const int PURPLE = 9;
const int HOT_PINK = 10;
const int MAGENTA = 11;


RTC_PCF8523 rtc;
SoftwareSerial mySerial(3, 4);

char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

int current_hour;
int current_minutes;
int tens_digit;
int ones_digit;
bool pm;

void setup () {
  
//  mySerial.begin(2400); // TODO: Find a way to toggle serial on/off so that it doesn't cause timing issues. Apparently, this line messes up the PWM counters for the RGB (and even programming)!
//  mySerial.println("Program started.");
  
  if (! rtc.begin()) {
//    mySerial.println("Couldn't find RTC");
//    mySerial.flush();
    abort();
  }

  if (! rtc.initialized() || rtc.lostPower()) {
//    mySerial.println("RTC is NOT initialized, let's set the time!");
    // When time needs to be set on a new device, or after a power loss, the
    // following line sets the RTC to the date & time this sketch was compiled
    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
    // This line sets the RTC with an explicit date & time, for example to set
    // January 21, 2014 at 3am you would call:
    // rtc.adjust(DateTime(2014, 1, 21, 3, 0, 0));
    //
    // Note: allow 2 seconds after inserting battery or applying external power
    // without battery before calling adjust(). This gives the PCF8523's
    // crystal oscillator time to stabilize. If you call adjust() very quickly
    // after the RTC is powered, lostPower() may still return true.
  }

  // When time needs to be re-set on a previously configured device, the
  // following line sets the RTC to the date & time this sketch was compiled
  // rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
  // This line sets the RTC with an explicit date & time, for example to set
  // January 21, 2014 at 3am you would call:
  // rtc.adjust(DateTime(2014, 1, 21, 3, 0, 0));

  // When the RTC was stopped and stays connected to the battery, it has
  // to be restarted by clearing the STOP bit. Let's do this to ensure
  // the RTC is running.
  rtc.start();
  
   // The PCF8523 can be calibrated for:
  //        - Aging adjustment
  //        - Temperature compensation
  //        - Accuracy tuning
  // The offset mode to use, once every two hours or once every minute.
  // The offset Offset value from -64 to +63. See the Application Note for calculation of offset values.
  // https://www.nxp.com/docs/en/application-note/AN11247.pdf
  // The deviation in parts per million can be calculated over a period of observation. Both the drift (which can be negative)
  // and the observation period must be in seconds. For accuracy the variation should be observed over about 1 week.
  // Note: any previous calibration should cancelled prior to any new observation period.
  // Example - RTC gaining 43 seconds in 1 week
  float drift = 43; // seconds plus or minus over oservation period - set to 0 to cancel previous calibration.
  float period_sec = (7 * 86400);  // total obsevation period in seconds (86400 = seconds in 1 day:  7 days = (7 * 86400) seconds )
  float deviation_ppm = (drift / period_sec * 1000000); //  deviation in parts per million (μs)
  float drift_unit = 4.34; // use with offset mode PCF8523_TwoHours
  // float drift_unit = 4.069; //For corrections every min the drift_unit is 4.069 ppm (use with offset mode PCF8523_OneMinute)
  int offset = round(deviation_ppm / drift_unit);
  // rtc.calibrate(PCF8523_TwoHours, offset); // Un-comment to perform calibration once drift (seconds) and observation period (seconds) are correct
  // rtc.calibrate(PCF8523_TwoHours, 0); // Un-comment to cancel previous calibration

//  mySerial.print("Offset is "); mySerial.println(offset); // Print to control offset

  // ATtiny PWM setup
  pinMode(Red, OUTPUT);
  pinMode(Green, OUTPUT);
  pinMode(Blue, OUTPUT);
  pinMode(White, OUTPUT);
  // Configure counter/timer0 for fast PWM on PB0 and PB1
  TCCR0A = 3<<COM0A0 | 3<<COM0B0 | 3<<WGM00;
  TCCR0B = 0<<WGM02 | 3<<CS00; // Optional; already set
  // Configure counter/timer1 for fast PWM on PB4
  TCCR1 = 1<<CTC1 | 1<<PWM1A | 3<<COM1A0 | 7<<CS10;
  GTCCR = 1<<PWM1B | 3<<COM1B0;
  // Interrupts on OC1A match and overflow
  TIMSK = TIMSK | 1<<OCIE1A | 1<<TOIE1;

  timer = millis();
  state = INIT;

}

ISR(TIMER1_COMPA_vect) {
  if (!bitRead(TIFR,TOV1)) bitSet(PORTB, White);
}

ISR(TIMER1_OVF_vect) {
  bitClear(PORTB, White);
}

void setColor(int R, int G, int B) {
  OCR0B = 256 - G; //G
  OCR1B = 256 - B; // B
  OCR1A = 256 - R; //R
}

void clockFSM(int input){
  switch(input){
    case INIT:
//      setColor(255,1,255);
      if (millis() - timer > 50){
        state = SHOW;
        timer = millis();
      }
      break;

    case SHOW:
//      setColor(255,1,255); //hour
//      delay(1500);
//      setColor(1,255,255); //minute
//      delay(1500);
//      setColor(255,255,1); //minute
//      delay(1500);
      colorMap(current_hour);
      delay(1500);
      colorMap(tens_digit);
      delay(1500);
      colorMap(ones_digit);
      delay(1500);
      if (pm)
        setColor(1,1,1); //AM or PM
      else
        setColor(255,255,255);
      delay(1500);
      state = STANDBY;
      break;

    case STANDBY: // TODO: add if condition to go back to SHOW if hour/minute changes?
      colorMap(current_hour);
      break;
  }
  
}

void colorMap(int color){
  switch(color){
    case RED:
      setColor(255,1,1);
    break;

    case ORANGE:
      setColor(255,128,1);
    break;

    case YELLOW:
     setColor(255,255,1);
    break;

    case LEAF_GREEN:
     setColor(128,255,1);
    break;

    case GREEN:
     setColor(1,255,1);
    break;

    case SPRING_GREEN:
     setColor(1,255,128);
    break;

    case SKY_BLUE:
     setColor(1,255,255);
    break;

    case LIGHT_BLUE:
     setColor(1,128,255);
    break;

    case BLUE:
      setColor(1,1,255);
    break;

    case PURPLE:
     setColor(128,1,255);
    break;

    case HOT_PINK:
     setColor(255,1,255);
    break;

    case MAGENTA:
     setColor(255,1,128);
    break;
  }
}

void loop () {
    DateTime now = rtc.now();
//    int temp = 1;
    int temp = (int) now.hour();
    pm = (temp >= 12) ? true:false;
    current_hour =  temp >= 12 ? temp - 12: temp;
    current_minutes = now.minute();
    ones_digit = current_minutes % 10; // get ones digit from minutes
    if (current_minutes >= 10)
      tens_digit = (current_minutes - ones_digit)/10 % 10; // gets tens digit from minutes if double digits
    else
      tens_digit = 0;
    clockFSM(state); //TODO: find a way to only update the color less frequently (?) to avoid programming issues
    
//    setColor(255, 255,1);
//    mySerial.print(now.year(), DEC);
//    mySerial.print('/');
//    mySerial.print(now.month(), DEC);
//    mySerial.print('/');
//    mySerial.print(now.day(), DEC);
//    mySerial.print(" (");
//    mySerial.print(daysOfTheWeek[now.dayOfTheWeek()]);
//    mySerial.print(") ");
//    mySerial.print(now.hour(), DEC);
//    mySerial.print(':');
//    mySerial.print(now.minute(), DEC);
//    mySerial.print(':');
//    mySerial.print(now.second(), DEC);
//    mySerial.println();
    
//    delay(3000);
}
