#include "matrix.hpp"
#include "taster.hpp"
#include <stdint.h>
#include <string.h>

#define PIN_TASTER 52

volatile uint16_t minDahTimeMs = 1000;
volatile uint16_t deltaT = 0;
volatile uint16_t t = 0;
volatile TasterState state = UP;
volatile bool parisTest = false;
volatile uint32_t timeMeasured = 0;

char dits[] = "     ";
int index = 0;
char lastChar = '+';

char ditsToChar(char* dits) {
  dits[index] = 0;

  if (strcmp(dits, ".-") == 0) {
    return 'A';
  } else if (strcmp(dits, "-...") == 0) {
    return 'B';
  } else if (strcmp(dits, "-.-.") == 0) {
    return 'C';
  } else if (strcmp(dits, "-..") == 0) {
    return 'D';
  } else if (strcmp(dits, ".") == 0) {
    return 'E';
  } else if (strcmp(dits, "..-.") == 0) {
    return 'F';
  } else if (strcmp(dits, "--.") == 0) {
    return 'G';
  } else if (strcmp(dits, "....") == 0) {
    return 'H';
  } else if (strcmp(dits, "..") == 0) {
    return 'I';
  } else if (strcmp(dits, ".---") == 0) {
    return 'J';
  } else if (strcmp(dits, "-.-") == 0) {
    return 'K';
  } else if (strcmp(dits, ".-..") == 0) {
    return 'L';
  } else if (strcmp(dits, "--") == 0) {
    return 'M';
  } else if (strcmp(dits, "-.") == 0) {
    return 'N';
  } else if (strcmp(dits, "---") == 0) {
    return 'O';
  } else if (strcmp(dits, ".--.") == 0) {
    return 'P';
  } else if (strcmp(dits, "--.-") == 0) {
    return 'Q';
  } else if (strcmp(dits, ".-.") == 0) {
    return 'R';
  } else if (strcmp(dits, "...") == 0) {
    return 'S';
  } else if (strcmp(dits, "-") == 0) {
    return 'T';
  } else if (strcmp(dits, "..-") == 0) {
    return 'U';
  } else if (strcmp(dits, "...-") == 0) {
    return 'V';
  } else if (strcmp(dits, ".--") == 0) {
    return 'W';
  } else if (strcmp(dits, "-..-") == 0) {
    return 'X';
  } else if (strcmp(dits, "-.--") == 0) {
    return 'Y';
  } else if (strcmp(dits, "--..") == 0) {
    return 'Z';
  } else if (strcmp(dits, ".----") == 0) {
    return '1';
  } else if (strcmp(dits, "..---") == 0) {
    return '2';
  } else if (strcmp(dits, "...--") == 0) {
    return '3';
  } else if (strcmp(dits, "....-") == 0) {
    return '4';
  } else if (strcmp(dits, ".....") == 0) {
    return '5';
  } else if (strcmp(dits, "-....") == 0) {
    return '6';
  } else if (strcmp(dits, "--...") == 0) {
    return '7';
  } else if (strcmp(dits, "---..") == 0) {
    return '8';
  } else if (strcmp(dits, "----.") == 0) {
    return '9';
  } else if (strcmp(dits, "-----") == 0) {
    return '0';
  } 

  return '+';
}

void setup() {
  matrix_setup();

  Serial.begin(9600);

  TCCR2A = 0x00; // Wave Form Generation Mode 0: Normal Mode; OC2A disconnected
  TCCR2B = (1<<CS22); // prescaler
  TIMSK2 = (1<<TOIE2);
  TCNT2 = 6;

  pinMode(PIN_TASTER, INPUT);

  strcpy(dits, "     ");
}

void loop() {

  if (parisTest) return;

  if (deltaT != 0) {
    if (state == UP) {
      if (deltaT < minDahTimeMs) {
        dits[index] = '.';
      } else {
        dits[index] = '-';
      }

      index++;
      if (index == 5) {
        lastChar = ditsToChar(dits);
        Serial.print(dits);
        Serial.print("\n");
        strcpy(dits, "     ");
        index = 0;
      }
    }

    deltaT = 0;
  }

  if (state == UP) {
    if (t >= minDahTimeMs) {

      if (index > 0) {
        lastChar = ditsToChar(dits);
        Serial.print(dits);
        Serial.print("\n");
      }
      strcpy(dits, "      ");

      index = 0;

      deltaT = 0;
      t = 0;
    }
  }

  matrix_draw(lastChar);
}

static testParis(uint16_t deltaT) {
  if (parisTest) {
    timeMeasured++;

    if (state == DOWN) {
      if (deltaT >= 4000) {
        Serial.print("END time for dit (ms): ");
        minDahTimeMs = 2 * ((timeMeasured - deltaT) / 50);
        parisTest = false;
        Serial.print(minDahTimeMs);
      }
    }
  }
}

ISR(TIMER2_OVF_vect) {
  TCNT2 = 6;

  t++;

  if (state == UP) {
    if (digitalRead(PIN_TASTER) == HIGH) {
      state = DOWN;
      deltaT = t;
      t=0;
    }
    
  } else {
    if (digitalRead(PIN_TASTER) == LOW) {
      state = UP;
      deltaT = t;
      t=0;
    }
  }    

  testParis(t);
}
