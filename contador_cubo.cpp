#include <HCSR04.h>

// DEFINIÇÕES DE PINOS
#define pinTrig 8
#define pinEcho 9
#define pinLedVerde 5
#define pinLedA 6
#define pinLedVerm 7

// DEFINIÇÃO DE PARAMETROS
#define distObstaculo 30 // DISTANCIA EM CM PARA CONSIDERAR QUE HÁ OBSTÁCULO A FRENTE
#define distMin 5
#define distMax 50
#define tempoLeitura 100 // INTERVALO MINIMO ENTRE CADA LEITURA

#define DEBUG // DEIXAR DESCOMENTADO PARA RECEBER MAIS INFORMAÇÕES NO MONITOR SERIAL

// DECLARAÇÃO DE VARIÁVEIS
boolean reset = false;
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

    if (reset)
    {
        if (obstaculo)
        {
            // contando
            // Mostrar no LDC tempo
            if (sensorHCSR04.dist() <= distObstaculo)
            {
                tempo += 1;
                Serial.print("Tempo: ");
                Serial.println(tempo);
                reset = false;
                //é para sair dq e mostrar o ultimo tempo
            }
            else
            {
                digitalWrite(pinLedA, LOW);
                digitalWrite(pinLedVerm, LOW);
                digitalWrite(pinLedVerde, HIGH);
                Serial.print("Tempo: ");
                tempo += 1;
                Serial.println(tempo);
            }
        }
        else
        {
            if (sensorHCSR04.dist() <= distObstaculo)
            {
                
                // Cubo esta na região indicada
                digitalWrite(pinLedVerm, LOW);
                digitalWrite(pinLedVerde, LOW);
                digitalWrite(pinLedVerm, LOW);
                digitalWrite(pinLedA, HIGH);
                Serial.println("Ta na base");
                if (sensorHCSR04.dist() > distObstaculo)
                {
                    obstaculo = true;
                    tempo = 0;
                }
                // PiscaLed
            }
            else
            {
                 digitalWrite(pinLedVerm, LOW);
                // Aguardando cubo na região indicada
                Serial.print("Aguardando cubo");
                if (piscaAmarelo)
                {
                    
                    digitalWrite(pinLedA, LOW);
                }
                else
                {
                    digitalWrite(pinLedA, HIGH);
                }
            }
        }
    }
    else
    {
        // Precisa ser resetado
        if (sensorHCSR04.dist() <= distMin)
        {
            digitalWrite(pinLedA, LOW);
            digitalWrite(pinLedVerde, LOW);
            digitalWrite(pinLedVerm, LOW);
            reset = true;
            obstaculo = false;
               delay(1000);
          
        }
        else
        {
            Serial.println("Aguardando reset");
            digitalWrite(pinLedA, LOW);
            digitalWrite(pinLedVerde, LOW);
            digitalWrite(pinLedVerm, HIGH);
        }
    }

    delay(100);
}