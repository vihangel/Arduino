#include <HCSR04.h>

// DEFINIÇÕES DE PINOS
#define pinTrig 8
#define pinEcho 9
#define pinLedVerde 5
#define pinLedA 6
#define pinLedVerm 10

// DEFINIÇÃO DE PARAMETROS
#define distObstaculo 10 // DISTANCIA EM CM PARA CONSIDERAR QUE HÁ OBSTÁCULO A FRENTE
#define distMin 5
#define distMax 50
#define tempoLeitura 100 // INTERVALO MINIMO ENTRE CADA LEITURA

#define DEBUG // DEIXAR DESCOMENTADO PARA RECEBER MAIS INFORMAÇÕES NO MONITOR SERIAL

// DECLARAÇÃO DE VARIÁVEIS
boolean reset = false;
boolean flag = false;
boolean contando = false;
boolean obstaculo = false;
boolean parar = false;
boolean piscaAmarelo = false;
byte tempo;
byte contaObstaculo = 0;
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
        {

            Serial.print("Contando");

            digitalWrite(pinLedVerde, HIGH);

            digitalWrite(pinLedA, LOW);
            digitalWrite(pinLedVerm, LOW);
            contando = true;
        }
        if (sensorHCSR04.dist() <= distObstaculo && contando)
        {
            flag = false;
            Serial.print("PAROUUU");

            digitalWrite(pinLedVerde, LOW);

            digitalWrite(pinLedA, LOW);
            digitalWrite(pinLedVerm, HIGH);
        }
        // digitalWrite(pinLedVerde, LOW);
        // digitalWrite(pinLedVerm, LOW);
        // digitalWrite(pinLedA, LOW);
        while (sensorHCSR04.dist() > distObstaculo && contando == false)
        {
            Serial.print("Agurdando cubo na base");
            digitalWrite(pinLedA, HIGH);
            delay(100);
            digitalWrite(pinLedVerde, LOW);
            digitalWrite(pinLedVerm, LOW);
            digitalWrite(pinLedA, LOW);
            delay(100);
        }
        if (sensorHCSR04.dist() <= distObstaculo && contando == false)
        {
            flag = true;
            Serial.print("Cubo na base");

            digitalWrite(pinLedA, HIGH);
        }
    }
    else
    {

        Serial.println("Aguardando reset");
        while (sensorHCSR04.dist() > distMin)
        {

            digitalWrite(pinLedA, LOW);
            digitalWrite(pinLedVerde, LOW);
            digitalWrite(pinLedVerm, HIGH);
            if (sensorHCSR04.dist() <= distMin)
            {
                Serial.println("Aquii");
                break;
            }
        }
        flag = false;
        Serial.println("Reset?");
        while (sensorHCSR04.dist() <= distMin)
        {
            digitalWrite(pinLedVerm, HIGH);
            delay(400);
            digitalWrite(pinLedVerde, LOW);
            digitalWrite(pinLedA, LOW);
            digitalWrite(pinLedVerm, LOW);
            delay(200);
            if (sensorHCSR04.dist() > distMin)
            {
                Serial.println("Passou aqui?");
                flag = true;
            }
        }
        if (flag && sensorHCSR04.dist() > distMin)
        {
            Serial.println("Passando aqui?");

            reset = true;

            flag = false;
        }
    }
}