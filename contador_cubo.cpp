#include <HCSR04.h>

// DEFINIÇÕES DE PINOS
#define pinTrig 8
#define pinEcho 9
#define pinLedVerde 5
#define pinLedA 6
#define pinLedVerm 10

// DEFINIÇÃO DE PARAMETROS
#define distObstaculo 40 // DISTANCIA EM CM PARA CONSIDERAR QUE HÁ OBSTÁCULO A FRENTE
#define distMin 5
#define distMax 50
#define tempoLeitura 100 // INTERVALO MINIMO ENTRE CADA LEITURA

#define DEBUG // DEIXAR DESCOMENTADO PARA RECEBER MAIS INFORMAÇÕES NO MONITOR SERIAL

// DECLARAÇÃO DE VARIÁVEIS
boolean reset = false;
boolean flag = false;

boolean contando = false;
boolean obstaculo = false;


byte tempo;

unsigned long controleLeitura; // VARIÁVEL PARA CONTROLAR TEMPO ENTRE AS LEITURAS

// INSTANCIANDO OBJETOS
HCSR04 sensorHCSR04(pinTrig, pinEcho);

void setup()
{
#ifdef DEBUG
    Serial.begin(9600);
    Serial.println(F("| ============================================= |"));
    Serial.println(F("|           Cronometro de cubo mágico           |"));
    Serial.println(F("| ============================================= |"));
#endif

    pinMode(pinLedVerde, OUTPUT);
    pinMode(pinLedVerm, OUTPUT);
    pinMode(pinLedA, OUTPUT);

#ifdef DEBUG
    Serial.println("Fim do Setup");
#endif
    delay(2000);
}

void loop()
{
    // Serial.print("Valor sensor: ");
    printf("%f", sensorHCSR04.dist());
    if (reset)
    {
        while (sensorHCSR04.dist() > distObstaculo && flag)
        {digitalWrite(pinLedVerde, HIGH);
      
            controleLeitura = millis();

            Serial.print("Tempo:");
            Serial.println(controleLeitura);
               delay(500);
            

            digitalWrite(pinLedA, LOW);
            digitalWrite(pinLedVerm, LOW); 
            contando = true;
        }
        if (sensorHCSR04.dist() <= distObstaculo && contando)
        {
            flag = false;
controleLeitura +=500;
            Serial.println("PAROUUU");
            Serial.print("Tempo:");
            Serial.println(controleLeitura);
            digitalWrite(pinLedVerde, LOW);

            digitalWrite(pinLedA, LOW);
            digitalWrite(pinLedVerm, HIGH);
            reset = false;
        }
        // digitalWrite(pinLedVerde, LOW);
        // digitalWrite(pinLedVerm, LOW);
        // digitalWrite(pinLedA, LOW);
        while (sensorHCSR04.dist() > distObstaculo && contando == false)
        {
            flag = false;
            //Serial.print("Agurdando cubo na base");
            digitalWrite(pinLedA, HIGH);
            delay(100);
            digitalWrite(pinLedVerde, LOW);
            digitalWrite(pinLedVerm, LOW);
            digitalWrite(pinLedA, LOW);
            delay(100);
        }
        while (sensorHCSR04.dist() <= distObstaculo && contando == false)
        {
            flag = true;
            Serial.println("Cubo na base");
            
            digitalWrite(pinLedA, HIGH);
        }
    }
    else
    {

       
        while (sensorHCSR04.dist() > distMin)
        { 
          //Serial.println("Aguardando reset");

            digitalWrite(pinLedA, LOW);
            digitalWrite(pinLedVerde, LOW);
            digitalWrite(pinLedVerm, HIGH);
            if (sensorHCSR04.dist() <= distMin)
            {
                
                break;
            }
        }
        flag = false;
        
        while (sensorHCSR04.dist() <= distMin)
        {
          //Serial.println("Reset?");
            digitalWrite(pinLedVerm, HIGH);
            delay(400);
            digitalWrite(pinLedVerde, LOW);
            digitalWrite(pinLedA, LOW);
            digitalWrite(pinLedVerm, LOW);
            delay(200);
            if (sensorHCSR04.dist() > distMin)
            {
            
                flag = true;
            }
        }
        if (flag && sensorHCSR04.dist() > distMin)
        {
            Serial.println("Resetado");
            reset = true;

            flag = false;
        }
    }
}