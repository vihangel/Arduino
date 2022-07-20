#include <HCSR04.h>

#include <LiquidCrystal.h>
// DEFINIÇÕES DE PINOS
#define pinTrig 8
#define pinEcho 9
#define pinLedVerde 5
#define pinLedA 6
#define pinLedVerm 7

// LSD
const int rs = 12, en = 11, d4 = 5, d5 = 4, d6 = 3, d7 = 2;

LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

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

    lcd.begin(16, 2);
    lcd.print("| ============================================= |");
    lcd.print("|           Cronometro de cubo mágico           |");
    lcd.print("| ============================================= |");

    // Print a message to the LCD.

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
        if (sensorHCSR04.dist() > distObstaculo && contando == false)
        {
            lcd.print("|           Aguardando cubo na base           |");
            Serial.print("Aguardando cubo na base");
            while (sensorHCSR04.dist() > distObstaculo && contando == false)
            {
                flag = false;
                // Serial.print("Agurdando cubo na base");
                digitalWrite(pinLedA, HIGH);
                delay(100);
                digitalWrite(pinLedVerde, LOW);
                digitalWrite(pinLedVerm, LOW);
                digitalWrite(pinLedA, LOW);
                delay(100);
            }
        }

        if (sensorHCSR04.dist() <= distObstaculo && contando == false)
        {
            lcd.print("|           Cubo na base           |");
            Serial.println("Cubo na base");
            delay(500);
            while (sensorHCSR04.dist() <= distObstaculo && contando == false)
            {
                flag = true;

                digitalWrite(pinLedA, HIGH);
            }
        }

        // digitalWrite(pinLedVerde, LOW);
        // digitalWrite(pinLedVerm, LOW);
        // digitalWrite(pinLedA, LOW);

        if (sensorHCSR04.dist() > distObstaculo && flag)
        {

            digitalWrite(pinLedVerde, HIGH);

            controleLeitura = millis() - 1000;
            Serial.print("Tempo inicial: ");
            Serial.println(millis());
            Serial.println(controleLeitura);

            digitalWrite(pinLedA, LOW);
            digitalWrite(pinLedVerm, LOW);
            contando = true;
            delay(1000);
            while (sensorHCSR04.dist() > distObstaculo && flag)
            {
                lcd.print(millis() - controleLeitura);
                delay(100);
            }
        }
        if (sensorHCSR04.dist() <= distObstaculo && contando)
        {
            flag = false;

            Serial.println("PAROUUU");
            Serial.print("Tempo final:");
            lcd.print("|           Tempo final:           |");
            lcd.print(millis() - controleLeitura);
            Serial.println(millis() - controleLeitura);
            digitalWrite(pinLedVerde, LOW);

            digitalWrite(pinLedA, LOW);
            digitalWrite(pinLedVerm, HIGH);
            reset = false;
        }
    }
    else
    {
        flag = false;
        reset = false;
        if (sensorHCSR04.dist() > distMin)
        {
            // Serial.println("Aguardando reset");

            digitalWrite(pinLedA, LOW);
            digitalWrite(pinLedVerde, LOW);
            digitalWrite(pinLedVerm, HIGH);
        }

        while (sensorHCSR04.dist() <= distMin)
        {
            // Serial.println("Reset?");
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
            contando = false;
            flag = false;
        }
    }
}