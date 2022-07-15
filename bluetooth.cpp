
#include <SoftwareSerial.h>

SoftwareSerial hc06(2, 3);

void setup() {
  Serial.begin(9600);
  hc06.begin(9600);
  delay(1000);

}

void loop() {
 if (hc06.available()) {
      Serial.print("Teste Maroto");
 }
  delay(2000);
  
}
//Não funcionou no app porem com o serial monitor foi!