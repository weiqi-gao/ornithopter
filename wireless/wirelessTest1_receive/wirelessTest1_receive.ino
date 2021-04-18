/*
* Arduino Wireless Communication Tutorial
*       Example 1 - Receiver Code
*                
* by Dejan Nedelkovski, www.HowToMechatronics.com
* Modified by Kirk Boyd, kirkboyd.xyz; Apr 9, 2021
* Library: TMRh20/RF24, https://github.com/tmrh20/RF24/
*/
//Arduino Nano Side
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>

RF24 radio(7, 8); // CE, CSN

const byte address[6] = "10501";

void setup() {
  Serial.begin(9600);
  radio.begin();
  radio.openReadingPipe(0, address);
  radio.setPALevel(RF24_PA_MIN);
  radio.startListening();
}

void loop() {
  if (radio.available()) {
    int data1[2];
    radio.read(&data1[0], sizeof(data1[0]));
    radio.read(&data1[1], sizeof(data1[1]));
    Serial.print(data1[0]);
    Serial.print(" ");
    Serial.println(data1[1]);
//    char text[32] = "";
//    radio.read(&text, sizeof(text));
//    Serial.println(text);
  }
}
