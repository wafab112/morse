#include "matrix.h"
#include "taster.h"
#include "morse.h"

#include <stdint.h>
#include <8051.h>
#include <stdbool.h>

#define PIN_TASTER 52

volatile uint32_t t = 0;
char lastChar = 'A'-1;

void loop(void);

int main() {
  matrix_setup();

  TMOD = 0x01;
  TH0 = 0xFC;
  TL0 = 0x18;

  ET0 = 1;
  EA = 1;

  TR0 = 1;

  while(1) {
    loop();
  }
}

void loop() {
  matrix_draw(lastChar);
}

void ISR_Timer0(void) __interrupt 1 {
  TH0 = 0xFC;
  TL0 = 0x18;

  t++;

  t = t % 1000;

  if (t == 0) {
  	lastChar++;
  }
}
