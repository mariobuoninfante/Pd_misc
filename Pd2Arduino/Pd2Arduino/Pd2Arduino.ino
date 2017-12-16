/*---------------------------------------------------Pd2Arduino v0.1--------------------------------------------- */

/*
  Pd2Arduino is a sketch that allows you to send data from Pure Data
  to Arduino, using a Pd patch "Pd2Arduino.pd";
*/

//--------------------------------GLOBAL VARIABLES-----------------------

char pd_in[14] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; // data from Pd (1 per digital pin);

//--------------------------------FUNCTIONS------------------------------

void Pd_receive(char *input)
{  
  byte nr = 14;  
  Serial.readBytes(input ,nr);
}

//-------------------------------------
//-------------------------------------

//--------------------------------SETUP------------------------------

void setup()
{
  Serial.begin(9600);
  pinMode(2, OUTPUT); // i.e. digital output and a PWM output;
  pinMode(3,OUTPUT);
}

//--------------------------------LOOP------------------------------

void loop()
{
  if(Serial.available() > 0)
  {
    /* read Pd incoming data; */
    Pd_receive(pd_in);
    
    /* i.e. it sends 2 values coming from Pd to digital out 2 and PWM out 3; */
    digitalWrite(2, pd_in[0]);
    analogWrite(3, pd_in[1]);        
  }
   
  delay(1);
}
