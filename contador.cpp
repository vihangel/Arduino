//inclui a biblioteca do LCD
//http://www.arduino.cc/en/Tutorial/LiquidCrystalDisplay
#include <LiquidCrystal.h>

#include <HCSR04.h>

//DEFINIÇÕES DO HARDWARE DE DESENVOLVIMENTO
//Entradas
#define CHAVE A0

LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
/*
   Respectivamente
   LCD RS pin to digital pin 12
   LCD Enable pin to digital pin 11
   LCD R/W pin to ground
   LCD D4 pin to digital pin 5
   LCD D5 pin to digital pin 4
   LCD D6 pin to digital pin 3
   LCD D7 pin to digital pin 2
*/



// DEFINIÇÕES DE PINOS
#define trig 8
#define echo 9
#define led  4

// DEFINIÇÃO DE PARAMETROS
#define distObstaculo 30  // DISTANCIA EM CM PARA CONSIDERAR QUE HÁ OBSTÁCULO A FRENTE
#define tempoLeitura  100 // INTERVALO MINIMO ENTRE CADA LEITURA (MILISEGUNDOS)

#define DEBUG // DEIXAR DESCOMENTADO PARA RECEBER MAIS INFORMAÇÕES NO MONITOR SERIAL

// DECLARAÇÃO DE VARIÁVEIS
boolean       obstaculo = false;
boolean       parar = false;
boolean       novaLeitura;
boolean       mediaSensor[medidaDist]; // ARRAY PARA ARMAZENAR OS ULTIMOS VALORES E CONTROLAR DECISÃO
byte          posicao;
byte          contaObstaculo = 0;
unsigned long controleLeitura; // VARIÁVEL PARA CONTROLAR TEMPO ENTRE AS LEITURAS
int conta = 0; //A variável int armazena um valor de 16 bits.

// INSTANCIANDO OBJETOS
HCSR04 sensorHCSR04(trig,echo);


void setup() {
  #ifdef DEBUG 
    Serial.begin(9600);
    Serial.println(F("| ============================================== |"));
    Serial.println(F("| Contador com sensor de obstáculos Ultrassonico |"));
    Serial.println(F("| ============================================== |"));
  #endif
  lcd.begin(16, 2);

  
  pinMode(CHAVE,INPUT);
  lcd.setCursor(0, 0); //escreve no LCD (linha,Coluna)

  pinMode(led , OUTPUT);
  
  delay(2000);
}

void loop() {

  novaLeitura = false;
  
  if (millis() - controleLeitura > tempoLeitura){
    if (sensorHCSR04.dist() <= distObstaculo){
      obstaculo = true;
      novaLeitura = true;
    } else { 
      obstaculo = false;
      novaLeitura = true;
    }
    controleLeitura = millis();
  }

  if (novaLeitura == true){
    
    mediaSensor[posicao] = obstaculo;
    posicao = posicao + 1;
  
    for (byte i = 0 ; i < medidaDist ; i++){
      if (mediaSensor[i] == 1) contaObstaculo++;
    }
  
    if ( contaObstaculo >= ((medidaDist/2) +1)){
      if(parar == false){
        parar = true;
        Serial.println("PARA!!!");
        digitalWrite(led,HIGH);
      }
    } else {
      if(parar == true){
        parar = false;
        Serial.println("Caminho Livre");
        digitalWrite(led,LOW);
      }
    }
  
    contaObstaculo = 0;
    if ( posicao > medidaDist ){
      posicao = 0;
    }
  }
  
  //Botão, mudar para o sensor
  if(digitalRead(CHAVE)==HIGH)
  {
  conta = conta + 1;
  lcd.setCursor(0, 0);
  lcd.print("Contador");
  lcd.setCursor(0, 1);
  lcd.print(conta);
  }
  while(digitalRead(CHAVE)==HIGH);
 
}