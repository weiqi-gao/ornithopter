#define hallpin1 6 //analog pin 6
#define hallpin2 7 //analog pin 7

void setup() {
  pinMode(hallpin1, INPUT);
  pinMode(hallpin2, INPUT);
  Serial.begin(115200);
}

void loop() {
  //Serial.print("Hall 1 (board): ");
  //Serial.print(analogRead(hallpin1));
  Serial.print("Hall: ");
  Serial.println(analogRead(hallpin2));

}
