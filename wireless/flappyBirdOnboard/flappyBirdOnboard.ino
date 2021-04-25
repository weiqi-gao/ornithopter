/* Flappy Bird!
* Teensy 4.0 Side [on the birdo]       
* Kirk Boyd, kirkboyd.xyz; Apr 18 , 2021
* Adapted from parts of examples by Dejan Nedelkovski, www.HowToMechatronics.com
* Library: TMRh20/RF24, https://github.com/tmrh20/RF24/
*/

/* Libraries */
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>
#include <PWMServo.h>

/* Pins/Ports */
#define escPin 2 //digital pin 2 for pwm signal
#define hallPin1 A9 //analog port 9 (pin 23 on Teensy)
#define hallPin2 A8 //analog port 8 (pin 22 on Teensy)

/* Radio Setup*/
RF24 radio(6, 5); // CE, CSN
const byte addresses[][6] = {"10501","10502"};

/* ESC Setup */
PWMServo ESC;
const int pwmMin = 1000;
const int pwmMax = 2000;

/* Variables */
int pot1 = 0;

void setup() {
  Serial.begin(9600);
  radio.begin();
  radio.openWritingPipe(addresses[1]);
  radio.openReadingPipe(1, addresses[0]);
  radio.setPALevel(RF24_PA_MIN);
  //radio.stopListening();
  pinMode(hallPin1,INPUT);
  pinMode(hallPin2,INPUT); 
  //pinMode(escPin,OUTPUT); //we will write PWM signals to control the motor speed
  ESC.attach(escPin,pwmMin,pwmMax);
}

void loop() {
  radio.startListening();
  delay(3);
  if(radio.available()){ //check if there is a signal coming in
    //while(radio.available()){
      radio.read(&pot1,sizeof(pot1)); //recieve potentiometer value
      Serial.print("Pot: ");
      Serial.println(pot1);
      //Serial.print("\t");
      ESC.write(pot1); //write potentiometer val to esc
    //}
    //radio.stopListening();
  }
  else{ 
    //Serial.print("\t\t");
    //radio.stopListening();
  }
  
  radio.stopListening();
  int data1[] = {analogRead(hallPin1),analogRead(hallPin2)};
  //Serial.print("Hall Sensors: ");
  //Serial.print(data1[0]);
  //Serial.print(" ");
  //Serial.print(data1[1]);
  radio.write(&data1[0], sizeof(data1[0]));
  radio.write(&data1[1], sizeof(data1[1]));
  //Serial.println();
}
