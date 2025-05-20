#include "matrix.h"
#include "taster.h"
#include "morse.h"

#include <stdint.h>
#include <8051.h>
#include <stdbool.h>

#define PIN_TASTER 52

volatile uint16_t minDahTimeMs = 1000;
volatile uint16_t deltaT = 0;
volatile uint16_t t = 0;
volatile TasterState state = UP;
volatile uint64_t timeMeasured = 0;

morse_t dits = {0};
morse_t empty = {0};

int index = 0;
char lastChar = '+';

char ditsToChar(morse_t* dits) {
  switch(*(uint16_t *) dits) {
    case U_MORSE_A: return 'A';
        break;
    case U_MORSE_B: return 'B';
        break;
    case U_MORSE_C: return 'C';
        break;
    case U_MORSE_D: return 'D';
        break;
    case U_MORSE_E: return 'E';
        break;
    case U_MORSE_F: return 'F';
        break;
    case U_MORSE_G: return 'G';
        break;
    case U_MORSE_H: return 'H';
        break;
    case U_MORSE_I: return 'I';
        break;
    case U_MORSE_J: return 'J';
        break;
    case U_MORSE_K: return 'K';
        break;
    case U_MORSE_L: return 'L';
        break;
    case U_MORSE_M: return 'M';
        break;
    case U_MORSE_N: return 'N';
        break;
    case U_MORSE_O: return 'O';
        break;
    case U_MORSE_P: return 'P';
        break;
    case U_MORSE_Q: return 'Q';
        break;
    case U_MORSE_R: return 'R';
        break;
    case U_MORSE_S: return 'S';
        break;
    case U_MORSE_T: return 'T';
        break;
    case U_MORSE_U: return 'U';
        break;
    case U_MORSE_V: return 'V';
        break;
    case U_MORSE_W: return 'W';
        break;
    case U_MORSE_X: return 'X';
        break;
    case U_MORSE_Y: return 'Y';
        break;
    case U_MORSE_Z: return 'Z';
        break;

    // Ziffern 0–9
    case U_MORSE_0: return '0';
        break;
    case U_MORSE_1: return '1';
        break;
    case U_MORSE_2: return '2';
        break;
    case U_MORSE_3: return '3';
        break;
    case U_MORSE_4: return '4';
        break;
    case U_MORSE_5: return '5';
        break;
    case U_MORSE_6: return '6';
        break;
    case U_MORSE_7: return '7';
        break;
    case U_MORSE_8: return '8';
        break;
    case U_MORSE_9: return '9';
        break;

    default:
        return '+';
  }

  return '+';
}

void loop(void);

int main() {
  matrix_setup();

  TMOD = 0x01;
  TH0 = 0xFC;
  TL0 = 0x18;

  ET0=1;
  EA=1;
  TR0 = 1;

  morse_cpy(&dits, &empty);

  while(1) {
    loop();
  }
}

void loop() {

  if (deltaT != 0) {
    if (state == UP) {
      if (deltaT < minDahTimeMs) {
	dits.pattern = dits.pattern & (0xFF - (1 << (7 - index)));
      } else {
	dits.pattern = dits.pattern | (1 << (7-index));
      }

      dits.size++;
      index++;
      if (index == 5) {
        lastChar = ditsToChar(&dits);
        morse_cpy(&dits, &empty);
        index = 0;
      }
    }

    deltaT = 0;
  }

  if (state == UP) {
    if (t >= minDahTimeMs) {

      if (index > 0) {
        lastChar = ditsToChar(&dits);
      }
      morse_cpy(&dits, &empty);

      index = 0;

      deltaT = 0;
      t = 0;
    }
  }

  matrix_draw(lastChar);
}

void ISR_Timer0(void) __interrupt 1 {
  TH0 = 0xFC;
  TL0 = 0x18;

  t++;

  if (state == UP) {
    if (P3_2 == 0) {
      state = DOWN;
      deltaT = t;
      t=0;
    }
    
  } else {
    if (P3_2 == 1) {
      state = UP;
      deltaT = t;
      t=0;
    }
  }    
}
