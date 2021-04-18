/*
* Arduino Wireless Communication Tutorial
*     Example 1 - Transmitter Code
*                
* Created by Dejan Nedelkovski, www.HowToMechatronics.com
* Modified by Kirk Boyd, kirkboyd.xyz; Apr 9, 2021
* Library: TMRh20/RF24, https://github.com/tmrh20/RF24/
*/
//Teensy 4.0 Side
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>
#define hallPin1 A9
#define hallPin2 A8

RF24 radio(6, 5); // CE, CSN

const byte address[6] = "10501";

void setup() {
  radio.begin();
  radio.openWritingPipe(address);
  radio.setPALevel(RF24_PA_MIN);
  radio.stopListening();
  pinMode(hallPin1,INPUT);
  pinMode(hallPin2,INPUT);
}

void loop() {
  int data1[] = {analogRead(hallPin1),analogRead(hallPin2)};
  Serial.print(data1[0]);
  Serial.print(" ");
  Serial.println(data1[1]);
  radio.write(&data1[0], sizeof(data1[0]));
  radio.write(&data1[1], sizeof(data1[1]));
//  const char text[] = "Butts!";
//  radio.write(&text, sizeof(text));
//  delay(1000);
}
