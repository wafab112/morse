#include "matrix.hpp"

#define PIN_TASTER 52

volatile uint16_t deltaT = 0;
volatile bool state = false;

void setup() {
  matrix_setup();

  Serial.begin(9600);

  TCCR2A = 0x00; // Wave Form Generation Mode 0: Normal Mode; OC2A disconnected
  TCCR2B = (1<<CS22); // prescaler = 1024
  TIMSK2 = (1<<TOIE2);
  TCNT2 = 6;

  pinMode(PIN_TASTER, INPUT);
}

void loop() {
  
  /*for (char i = 0x30; i < 0x3a; i++) {
    for (int j = 0; j < 3000; j++) {
      matrix_draw(i);
    }
  }

  for (char i = 0x41; i < 0x5b; i++) {
    for (int j = 0; j < 3000; j++) {
      matrix_draw(i);
    }
  }*/

  if (deltaT != 0) {
    if (state) {
      Serial.print("PRESSED for ");
    } else {
      Serial.print("NOT PRESSED for ");
    }
    Serial.println(deltaT);

    deltaT = 0;
  }
}

ISR(TIMER2_OVF_vect) {
  static uint16_t t=0;
  TCNT2 = 6;

  if (!state) {
    if (digitalRead(PIN_TASTER) == LOW) {
      state = true;
      deltaT = t;
      t=0;
      return;
    }

    t++;
  } else {
    if (digitalRead(PIN_TASTER) == HIGH) {
      state = false;
      deltaT = t;
      t=0;
      return;
    }

    t++;
  }
}

