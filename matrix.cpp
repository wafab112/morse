#include "matrix.hpp"
#include "muster.hpp"
#include "Arduino.h"
#include <stdio.h>
#include <stdint.h>

#define PIN_ROW_0 36
#define PIN_ROW_1 44
#define PIN_ROW_2 22
#define PIN_ROW_3 42
#define PIN_ROW_4 34
#define PIN_ROW_5 24
#define PIN_ROW_6 32

#define PIN_COL_B 30
#define PIN_COL_C 28
#define PIN_COL_D 38
#define PIN_COL_E 26
#define PIN_COL_F 40

int rows[] = {PIN_ROW_0, PIN_ROW_1, PIN_ROW_2, PIN_ROW_3, PIN_ROW_4, PIN_ROW_5, PIN_ROW_6};
int cols[] = {PIN_COL_B, PIN_COL_C, PIN_COL_D, PIN_COL_E, PIN_COL_F};

void matrix_draw(char c) {
  uint64_t active_muster;

  if (c > 0x60 && c < 0x7b) {
    c -= 32;
  }

  switch (c) {
    case 'A': active_muster = musterA;
    break;
    case 'B': active_muster = musterB;
    break;
    case 'C': active_muster = musterC;
    break;
    case 'D': active_muster = musterD;
    break;
    case 'E': active_muster = musterE;
    break;
    case 'F': active_muster = musterF;
    break;
    case 'G': active_muster = musterG;
    break;
    case 'H': active_muster = musterH;
    break;
    case 'I': active_muster = musterI;
    break;
    case 'J': active_muster = musterJ;
    break;
    case 'K': active_muster = musterK;
    break;
    case 'L': active_muster = musterL;
    break;
    case 'M': active_muster = musterM;
    break;
    case 'N': active_muster = musterN;
    break;
    case 'O': active_muster = musterO;
    break;
    case 'P': active_muster = musterP;
    break;
    case 'Q': active_muster = musterQ;
    break;
    case 'R': active_muster = musterR;
    break;
    case 'S': active_muster = musterS;
    break;
    case 'T': active_muster = musterT;
    break;
    case 'U': active_muster = musterU;
    break;
    case 'V': active_muster = musterV;
    break;
    case 'W': active_muster = musterW;
    break;
    case 'X': active_muster = musterX;
    break;
    case 'Y': active_muster = musterY;
    break;
    case 'Z': active_muster = musterZ;
    break;

    case '0': active_muster = muster0;
    break;
    case '1': active_muster = muster1;
    break;
    case '2': active_muster = muster2;
    break;
    case '3': active_muster = muster3;
    break;
    case '4': active_muster = muster4;
    break;
    case '5': active_muster = muster5;
    break;
    case '6': active_muster = muster6;
    break;
    case '7': active_muster = muster7;
    break;
    case '8': active_muster = muster8;
    break;
    case '9': active_muster = muster9;
    break;

    default: active_muster = musterErr;
    break;
  }

  for (int i=0; i<5; i++) {
    matrix_reset_cols();
    matrix_reset_rows();
    digitalWrite(cols[i], LOW);

    for (int j = 0; j<7; j++) {
      int index = 5*(6-j) + (4 - i);
      bool val = (active_muster >> (34 - index)) & 1;
      if (val) {
        digitalWrite(rows[j], HIGH);
      }
    }
  }
}

void matrix_setup() {
  // put your setup code here, to run once:
  pinMode(PIN_ROW_0, OUTPUT);
  pinMode(PIN_ROW_1, OUTPUT);
  pinMode(PIN_ROW_2, OUTPUT);
  pinMode(PIN_ROW_3, OUTPUT);
  pinMode(PIN_ROW_4, OUTPUT);
  pinMode(PIN_ROW_5, OUTPUT);
  pinMode(PIN_ROW_6, OUTPUT);

  pinMode(PIN_COL_B, OUTPUT);
  pinMode(PIN_COL_C, OUTPUT);
  pinMode(PIN_COL_D, OUTPUT);
  pinMode(PIN_COL_E, OUTPUT);
  pinMode(PIN_COL_F, OUTPUT);

  matrix_reset();
}

void matrix_reset() {
  matrix_reset_rows();

  matrix_reset_cols();
}

void matrix_reset_rows() {
  for (int i = 0; i<7; i++) {
    digitalWrite(rows[i], LOW);
  }
}

void matrix_reset_cols() {
  for (int i = 0; i<5; i++) {
    digitalWrite(cols[i], HIGH);
  }
}