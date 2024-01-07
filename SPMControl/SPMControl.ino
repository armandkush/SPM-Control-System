/*
 * Code based on work by plusAlpha Designs on Printables.com and work by Iliyas Tursynbek in 2021 at alaris.kz 
 * Adapted and expanded by Muhammad Kushairi 2023, University of Nottingham
 * Calculated values of input angle joints theta is obtained from ikm_position_control.m 
 * Check if COM port and BaudRate is the same as matlab code.
 *
 *
 * 
 * 
 * 
 *
 * 
 *
 * 
 */
#include <Math.h>
#include <Servo.h>

Servo servo1;
Servo servo2;
Servo servo3;

void setup() 
{
  Serial.begin(9600);
  servo1.attach(9);
  servo2.attach(10);
  servo3.attach(11);
  
  pinMode(7, INPUT);

  servo1.write(90);
  servo2.write(90);
  servo3.write(90);

}

void loop() 
{  

  //Calibrate Mode
  //The Gear Stack Should be assembled when the servo-motors are in
  //the 90 deg position
  //Position distal links to 120 deg apart.
  //Run before attaching gears to the base. 
  /*
  servo1.write(90);
  servo2.write(90);
  servo3.write(90);
  delay(2000); 
   */


  //Code for directly controlling joints by inputting desired euler angles of platform (yaw(x), pitch(y),roll(z)
  //Uses input from IKM.m
  /*if (Serial.available() > 2) {
    int angle1 = Serial.read();
    int angle2 = Serial.read();
    int angle3 = Serial.read();
    servo1.write(angle1);
    servo2.write(angle2);
    servo3.write(angle3);
    */

  


  //Code for running experimental trial for testing.
  //Toggle Servo1
  for(int j = 0; j<3; j++)
  {
    for(int i = 90; i<140; i+=1)
    {
      servo1.write(i);
      delay(30);
    }
  
    for(int i = 140; i>40; i-=1)
    {
      servo1.write(i);
      delay(30);
    }
  
    for(int i = 40; i<90; i+=1)
    {
      servo1.write(i);
      delay(30);
    }  
  }

  servo1.write(90);

  //Toggle Servo2
  for(int j = 0; j<3; j++)
  {
    for(int i = 90; i<140; i+=1)
    {
      servo2.write(i);
      delay(30);
    }
  
    for(int i = 140; i>40; i-=1)
    {
      servo2.write(i);
      delay(30);
    }
  
    for(int i = 40; i<90; i+=1)
    {
      servo2.write(i);
      delay(30);
    }  
  }

  servo2.write(90);

  //Toggle Servo3
  for(int j = 0; j<3; j++)
  {
    for(int i = 90; i<140; i+=1)
    {
      servo3.write(i);
      delay(30);
    }
  
    for(int i = 140; i>40; i-=1)
    {
      servo3.write(i);
      delay(30);
    }
  
    for(int i = 40; i<90; i+=1)
    {
      servo3.write(i);
      delay(30);
    }  
  }

  servo3.write(90);
  
 /* Extra motion codes for demonstration.

  //Rotate Stage
  for(int j = 0; j<3; j++)
  {
    for(int i = 90; i<160; i+=1)
    {
      servo1.write(i);
      servo2.write(i);
      servo3.write(i);
      delay(20);
    }
  
    for(int i = 160; i>20; i-=1)
    {
      servo1.write(i);
      servo2.write(i);
      servo3.write(i);
      delay(20);
    }
  
    for(int i = 20; i<90; i+=1)
    {
      servo1.write(i);
      servo2.write(i);
      servo3.write(i);
      delay(20);
    }  
  }
*/
/*

  //Circle at an angle
  double angle = 0;
  double servoAngle1 = 0;
  double servoAngle2 = 0;
  double servoAngle3 = 0;
  
  for(int i = 0; i<1000; i++)
  {
    angle = ((double)i)/24;
    servoAngle1 = 90+ 30*sin(angle);
    servoAngle2 = 90+ 30*sin(angle + 2* PI/3);
    servoAngle3 = 90+ 30*sin(angle + 4*PI/3);
    servo1.write(servoAngle1);
    servo2.write(servoAngle2);
    servo3.write(servoAngle3);
    delay(20);
  }
  */

/*
  //quick move
  servo1.write(90);
  servo2.write(90);
  servo3.write(90);

  delay(500);
  servo2.write(60);
  delay(400);
  servo3.write(120);
  delay(400);
  servo1.write(75);
  delay(400);
  servo3.write(105);
  delay(400);
  servo1.write(110);
  delay(400);
  servo2.write(75);
  delay(400);
  servo3.write(65);
  delay(400);
  servo1.write(90);
  delay(400);
  servo3.write(115);
  delay(400);
  servo2.write(120);
  delay(400);
  servo1.write(60);
  delay(400);

*/
/*

  //random move
  servo1.write(90);
  servo2.write(90);
  servo3.write(90);

  for(int j = 0; j<10; j++)
  {
    servo1.write((int)random(50,130));    
    servo2.write((int)random(50,130));    
    servo3.write((int)random(50,130));
    delay(600);    
  }
*/
  
}
