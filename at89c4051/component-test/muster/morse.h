#ifndef MORSE_H_FILE
#define MORSE_H_FILE

#include <stdint.h>

#define DIT 0
#define DAH 1

typedef struct {
	uint8_t pattern;
	uint8_t size;	
} morse_t;

void morse_cpy(morse_t* dest, morse_t* src) {
	dest->pattern = src->pattern;
	dest->size = src->size;
}

#define MORSE_A (morse_t) {0x40, 2}
#define U_MORSE_A 0x0240
#define MORSE_B (morse_t) {0x80, 4}
#define U_MORSE_B 0x0480
#define MORSE_C (morse_t) {0xA0, 4}
#define U_MORSE_C 0x04A0
#define MORSE_D (morse_t) {0x80, 3}
#define U_MORSE_D 0x0380
#define MORSE_E (morse_t) {0x00, 1}
#define U_MORSE_E 0x0100
#define MORSE_F (morse_t) {0x20, 4}
#define U_MORSE_F 0x0420
#define MORSE_G (morse_t) {0xC0, 3}
#define U_MORSE_G 0x03C0
#define MORSE_H (morse_t) {0x00, 4}
#define U_MORSE_H 0x0400
#define MORSE_I (morse_t) {0x00, 2}
#define U_MORSE_I 0x0200
#define MORSE_J (morse_t) {0x70, 4}
#define U_MORSE_J 0x0470
#define MORSE_K (morse_t) {0xA0, 3}
#define U_MORSE_K 0x03A0
#define MORSE_L (morse_t) {0x40, 4}
#define U_MORSE_L 0x0440
#define MORSE_M (morse_t) {0xC0, 2}
#define U_MORSE_M 0x02C0
#define MORSE_N (morse_t) {0x80, 2}
#define U_MORSE_N 0x0280
#define MORSE_O (morse_t) {0xE0, 3}
#define U_MORSE_O 0x03E0
#define MORSE_P (morse_t) {0x60, 4}
#define U_MORSE_P 0x0460
#define MORSE_Q (morse_t) {0xD0, 4}
#define U_MORSE_Q 0x04D0
#define MORSE_R (morse_t) {0x40, 3}
#define U_MORSE_R 0x0340
#define MORSE_S (morse_t) {0x00, 3}
#define U_MORSE_S 0x0300
#define MORSE_T (morse_t) {0x80, 1}
#define U_MORSE_T 0x0180
#define MORSE_U (morse_t) {0x20, 3}
#define U_MORSE_U 0x0320
#define MORSE_V (morse_t) {0x10, 4}
#define U_MORSE_V 0x0410
#define MORSE_W (morse_t) {0x60, 3}
#define U_MORSE_W 0x0360
#define MORSE_X (morse_t) {0x90, 4}
#define U_MORSE_X 0x0490
#define MORSE_Y (morse_t) {0xB0, 4}
#define U_MORSE_Y 0x04B0
#define MORSE_Z (morse_t) {0xC0, 4}
#define U_MORSE_Z 0x04C0

#define MORSE_0 (morse_t) {0xF8, 5}
#define U_MORSE_0 0x05F8
#define MORSE_1 (morse_t) {0x78, 5}
#define U_MORSE_1 0x0578
#define MORSE_2 (morse_t) {0x38, 5}
#define U_MORSE_2 0x0538
#define MORSE_3 (morse_t) {0x18, 5}
#define U_MORSE_3 0x0518
#define MORSE_4 (morse_t) {0x08, 5}
#define U_MORSE_4 0x0508
#define MORSE_5 (morse_t) {0x00, 5}
#define U_MORSE_5 0x0500
#define MORSE_6 (morse_t) {0x80, 5}
#define U_MORSE_6 0x0580
#define MORSE_7 (morse_t) {0xC0, 5}
#define U_MORSE_7 0x05C0
#define MORSE_8 (morse_t) {0xE0, 5}
#define U_MORSE_8 0x05E0
#define MORSE_9 (morse_t) {0xF0, 5}
#define U_MORSE_9 0x05F0

#endif
