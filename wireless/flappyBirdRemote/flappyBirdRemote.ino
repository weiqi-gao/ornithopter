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


/* Pins/Ports */
#define potPin A0

/* Radio Setup */
RF24 radio(7, 8); // CE, CSN
const byte addresses[][6] = {"10501","10502"};

/* Dynamic Variables */
int pot1 = 0;

void setup() {
  Serial.begin(9600);
  pinMode(potPin,INPUT);
  radio.begin();
  radio.openWritingPipe(addresses[0]);
  radio.openReadingPipe(1, addresses[1]);
  radio.setPALevel(RF24_PA_MIN);
  //radio.startListening();
}

void loop() {
  
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
}
