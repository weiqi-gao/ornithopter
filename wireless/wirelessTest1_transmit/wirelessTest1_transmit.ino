/*
* Arduino Wireless Communication Tutorial
*     Example 1 - Transmitter Code
*                
* Created by Dejan Nedelkovski, www.HowToMechatronics.com
* Modified by Kirk Boyd, kirkboyd.xyz; Apr 9, 2021
* Library: TMRh20/RF24, https://github.com/tmrh20/RF24/
*/

#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>

RF24 radio(7, 8); // CE, CSN

const byte address[6] = "10501";

void setup() {
  radio.begin();
  radio.openWritingPipe(address);
  radio.setPALevel(RF24_PA_MIN);
  radio.stopListening();
}

void loop() {
  const char text[] = "Butts!";
  radio.write(&text, sizeof(text));
  delay(1000);
}
