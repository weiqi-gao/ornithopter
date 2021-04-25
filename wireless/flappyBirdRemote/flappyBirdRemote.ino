/* Flappy Bird!
* Remote Side [whatever ends up recieving data (and sending control signals for debugging)]       
* Kirk Boyd, kirkboyd.xyz; Apr 18, 2021
* Adapted from parts of examples by Dejan Nedelkovski, www.HowToMechatronics.com
* Library: TMRh20/RF24, https://github.com/tmrh20/RF24/
*/

/* Libraries */
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>


/* Pins/Ports */
#define potPin A0

/* Radio Setup */
RF24 radio(7, 8); // CE, CSN
const byte addresses[][6] = {"10501","10502"};

<<<<<<< HEAD
/* Dynamic Variables */
int pot1 = 0;

||||||| merged common ancestors
=======
/* Dynamic Variables */
int pot1raw = 0;
int pot1map = 0;
int data1[2];
int accelData[3];

/* Setup Loop */
>>>>>>> ea3e99832f9634960033d32fc5de214777dacb10
void setup() {
  Serial.begin(115200);
  pinMode(potPin,INPUT);
  radio.begin();
  radio.openWritingPipe(addresses[0]);
  radio.openReadingPipe(1, addresses[1]);
  radio.setPALevel(RF24_PA_MIN);
  //radio.startListening();
}

void loop() {
<<<<<<< HEAD
  
  if (map(analogRead(A0),0,1023,0,180) != pot1){
    radio.stopListening();    
    pot1 = analogRead(A0);
    pot1 = map(pot1, 0, 1023, 0, 180);
    Serial.print("Pot: ");
    Serial.print(pot1);
    radio.write(&pot1, sizeof(pot1));
    Serial.print("\t\t");
  }
  else {Serial.print("\t\t");}    
  radio.startListening();
  delay(3);
  if (radio.available()) {
    int data1[2];
    radio.read(&data1[0], sizeof(data1[0]));
    radio.read(&data1[1], sizeof(data1[1]));
    Serial.print(data1[0]);
    Serial.print(" ");
    Serial.println(data1[1]);
  }
  Serial.println();
||||||| merged common ancestors
  radio.stopListening();
  int pot1 = analogRead(A0);
  pot1 = map(pot1, 0, 1023, 0, 180);
  Serial.println(pot1);
  radio.write(&pot1, sizeof(pot1));
//  if (radio.available()) {
//    int data1[2];
//    radio.read(&data1[0], sizeof(data1[0]));
//    radio.read(&data1[1], sizeof(data1[1]));
//    Serial.print(data1[0]);
//    Serial.print(" ");
//    Serial.println(data1[1]);
//    char text[32] = "";
//    radio.read(&text, sizeof(text));
//    Serial.println(text);
//  }
=======
  
  if (map(analogRead(A0),0,1023,0,180) != pot1raw){
    radio.stopListening();    
    pot1raw = analogRead(A0);
    pot1raw = map(pot1raw, 0, 1023, 0, 180);
    Serial.print("Pot: ");
    Serial.print(pot1raw);
    radio.write(&pot1raw, sizeof(pot1raw));
    Serial.print("\t\t");
  }
  else {Serial.print("\t\t");}
  //delay(5);
  radio.startListening();
  if (radio.available()) {
    radio.read(&data1[0], sizeof(data1[0]));
    radio.read(&data1[1], sizeof(data1[1]));
    radio.read(&accelData[0], sizeof(accelData[0]));
    radio.read(&accelData[1], sizeof(accelData[1]));
    radio.read(&accelData[2], sizeof(accelData[2]));
    Serial.print("Hall Sensors: ");
    Serial.print(data1[0]);
    Serial.print(" ");
    Serial.print(data1[1]);  
    Serial.print("\t");
    Serial.print("Accelerometer: ");
    Serial.print(accelData[0]);
    Serial.print(" ");
    Serial.print(accelData[1]);
    Serial.print(" "); 
    Serial.print(accelData[2]);
    Serial.print(" ");   
  }
  Serial.println();
>>>>>>> ea3e99832f9634960033d32fc5de214777dacb10
}
