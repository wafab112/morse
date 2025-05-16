#include "matrix.h"
#include "muster.h"

#include <stdint.h>
#include <stdbool.h>
#include <8051.h>

#define PIN_ROW_1 P1_1
#define PIN_ROW_2 P1_2
#define PIN_ROW_3 P1_3
#define PIN_ROW_4 P1_4
#define PIN_ROW_5 P1_5
#define PIN_ROW_6 P1_6
#define PIN_ROW_7 P1_7

#define PIN_COL_1 P1_0
#define PIN_COL_2 P3_7
#define PIN_COL_3 P3_5
#define PIN_COL_4 P3_4
#define PIN_COL_5 P3_3

void set_col(int col) {
  switch (col) {
  case 0: P1_0 = 1;
  break;
  case 1: P3_7 = 1;
  break;
  case 2: P3_5 = 1;
  break;
  case 3: P3_4 = 1;
  break;
  case 4: P3_3 = 1;
  break;
  };
}

void reset_col(int col) {
  switch (col) {
  case 0: P1_0 = 0;
  break;
  case 1: P3_7 = 0;
  break;
  case 2: P3_5 = 0;
  break;
  case 3: P3_4 = 0;
  break;
  case 4: P3_3 = 0;
  break;
  };
}

void set_row(int row) {
  P1 = P1 | (1 << (row + 1));
}

void reset_row(int row) {
  P1 = P1 & (0xFF - (1 << (row+1)));
}

static uint64_t charToMuster(char c) {
  switch (c) {
    case 'A': return musterA;
    break;
    case 'B': return musterB;
    break;
    case 'C': return musterC;
    break;
    case 'D': return musterD;
    break;
    case 'E': return musterE;
    break;
    case 'F': return musterF;
    break;
    case 'G': return musterG;
    break;
    case 'H': return musterH;
    break;
    case 'I': return musterI;
    break;
    case 'J': return musterJ;
    break;
    case 'K': return musterK;
    break;
    case 'L': return musterL;
    break;
    case 'M': return musterM;
    break;
    case 'N': return musterN;
    break;
    case 'O': return musterO;
    break;
    case 'P': return musterP;
    break;
    case 'Q': return musterQ;
    break;
    case 'R': return musterR;
    break;
    case 'S': return musterS;
    break;
    case 'T': return musterT;
    break;
    case 'U': return musterU;
    break;
    case 'V': return musterV;
    break;
    case 'W': return musterW;
    break;
    case 'X': return musterX;
    break;
    case 'Y': return musterY;
    break;
    case 'Z': return musterZ;
    break;

    case '0': return muster0;
    break;
    case '1': return muster1;
    break;
    case '2': return muster2;
    break;
    case '3': return muster3;
    break;
    case '4': return muster4;
    break;
    case '5': return muster5;
    break;
    case '6': return muster6;
    break;
    case '7': return muster7;
    break;
    case '8': return muster8;
    break;
    case '9': return muster9;
    break;

    case '+': return musterErr;
    break;

    default: return musterErr;
    break;
  }
}

void matrix_draw(char c) {
  uint64_t active_muster;

  if (c > 0x60 && c < 0x7b) {
    c -= 32;
  }

  active_muster = charToMuster(c);

  for (int i=0; i<5; i++) {
    matrix_reset_cols();
    matrix_reset_rows();
    set_col(i);

    for (int j = 0; j<7; j++) {
      int index = 5*j + i;
      bool val = (active_muster >> (34 - index)) & 1;
      if (val) {
	reset_row(j);
      }
    }
  }
}

void matrix_setup() {
  matrix_reset();
}

void matrix_reset() {
  matrix_reset_rows();

  matrix_reset_cols();
}

void matrix_reset_rows() {
  for (int i = 0; i<7; i++) {
    set_row(i);
  }
}

void matrix_reset_cols() {
  for (int i = 0; i<5; i++) {
    reset_col(i);
  }
}
