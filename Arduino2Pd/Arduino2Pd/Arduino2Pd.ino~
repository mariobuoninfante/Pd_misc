/*---------------------------------------------------Arduino2Pd v0.1--------------------------------------------- */

/*
  Arduino2Pd is a sketch that allows you to send data to Pure Data
  file "ArduinoSerial.pd" abstraction, using a simple protocol that
  allows Pure Data patch to receive data in a range from 0 - 1023;
*/

//--------------------------------FUNCTIONS------------------------------

void analog2Pd(int input, byte sensor_nr )
{
  // 1 arg = value to be sent to Pd;
  // 2 arg = sensor number, starting from 0 (i.e. with Arduino Uno you can have 0,1,2,3,4 or 5);
  
  int value, multiplier, offset;
  
  offset = sensor_nr * 1024;
  value = constrain(input, 0, 1023) + offset;
  multiplier = value/256;
  sendMsg(value, multiplier, sensor_nr);
}

//-------------------------------------
//-------------------------------------

void sendMsg(int value, int multiplier, byte sensor_nr)
{  
  // it sends 3 values to Pd over serial port
  
  Serial.write(value);
  Serial.write(multiplier);
  Serial.write(sensor_nr);  
}

//--------------------------------SETUP------------------------------

void setup()
{
  Serial.begin(9600);
}

//--------------------------------LOOP------------------------------

void loop()
{
  if(Serial.available() > 0)
  {
    // put your code here in place of the example code;
    
    
    // example code;
    
    analog2Pd(-500, 0); // values are scaled into a range from 0 to 1023 - then this value will be shown as "0";
    analog2Pd(100, 1);
    analog2Pd(200, 2);
    analog2Pd(300, 3);
    analog2Pd(400, 4);
    analog2Pd(2000, 5); // values are scaled into a range from 0 to 1023 - then this value will be shown as "1023"; 
    
    // end of the example code;
  }
  
  delay(1);
}
