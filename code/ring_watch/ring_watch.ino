// Date and time functions using a PCF8523 RTC connected via I2C and Wire lib
#include "RTClib.h"
#include <SoftwareSerial.h>

RTC_PCF8523 rtc;
SoftwareSerial mySerial(3, 4);

char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

void setup () {
  
  mySerial.begin(2400);
  mySerial.println("Program started.");
  
  if (! rtc.begin()) {
    mySerial.println("Couldn't find RTC");
    mySerial.flush();
    abort();
  }

  if (! rtc.initialized() || rtc.lostPower()) {
    mySerial.println("RTC is NOT initialized, let's set the time!");
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

  mySerial.print("Offset is "); mySerial.println(offset); // Print to control offset

}

void loop () {
    DateTime now = rtc.now();

    mySerial.print(now.year(), DEC);
    mySerial.print('/');
    mySerial.print(now.month(), DEC);
    mySerial.print('/');
    mySerial.print(now.day(), DEC);
    mySerial.print(" (");
    mySerial.print(daysOfTheWeek[now.dayOfTheWeek()]);
    mySerial.print(") ");
    mySerial.print(now.hour(), DEC);
    mySerial.print(':');
    mySerial.print(now.minute(), DEC);
    mySerial.print(':');
    mySerial.print(now.second(), DEC);
    mySerial.println();

    mySerial.print(" since midnight 1/1/1970 = ");
    mySerial.print(now.unixtime());
    mySerial.print("s = ");
    mySerial.print(now.unixtime() / 86400L);
    mySerial.println("d");

    // calculate a date which is 7 days, 12 hours and 30 seconds into the future
    DateTime future (now + TimeSpan(7,12,30,6));

    mySerial.print(" now + 7d + 12h + 30m + 6s: ");
    mySerial.print(future.year(), DEC);
    mySerial.print('/');
    mySerial.print(future.month(), DEC);
    mySerial.print('/');
    mySerial.print(future.day(), DEC);
    mySerial.print(' ');
    mySerial.print(future.hour(), DEC);
    mySerial.print(':');
    mySerial.print(future.minute(), DEC);
    mySerial.print(':');
    mySerial.print(future.second(), DEC);
    mySerial.println();

    mySerial.println();
    delay(3000);
}
