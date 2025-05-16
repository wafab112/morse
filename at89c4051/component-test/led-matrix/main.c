#include "matrix.h"
#include "taster.h"
#include "morse.h"

#include <stdint.h>
#include <8051.h>
#include <stdbool.h>

#define PIN_TASTER 52

volatile uint16_t t = 0;

void loop(void);

int main() {
  matrix_setup();

  //TMOD = 0x01;
  //TH0 = 0xFC;
  //TL0 = 0x18;
  //TR0 = 1;
  
  set_col(0);
  set_col(1);
  reset_col(2);
  set_col(3);
  set_col(4);

  reset_row(0);
  set_row(1);
  set_row(2);
  set_row(3);
  set_row(4);
  set_row(5);
  set_row(6);

  while(1) {
    loop();
  }
}

void loop() {
}

//void ISR_Timer0(void) __interrupt 1 {
  //t++;

  //TH0 = 0xFC;
  //TL0 = 0x18;
//}
