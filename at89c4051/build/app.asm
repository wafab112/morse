;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _morse_cpy_PARM_2
	.globl _ISR_Timer0
	.globl _main
	.globl _ditsToChar
	.globl _morse_cpy
	.globl _matrix_setup
	.globl _matrix_draw
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _lastChar
	.globl _index
	.globl _empty
	.globl _dits
	.globl _timeMeasured
	.globl _state
	.globl _t
	.globl _deltaT
	.globl _minDahTimeMs
	.globl _loop
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_minDahTimeMs::
	.ds 2
_deltaT::
	.ds 2
_t::
	.ds 2
_state::
	.ds 1
_timeMeasured::
	.ds 8
_dits::
	.ds 2
_empty::
	.ds 2
_index::
	.ds 2
_lastChar::
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
_morse_cpy_PARM_2:
	.ds 3
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_ISR_Timer0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	main.c:13: volatile uint16_t minDahTimeMs = 1000;
	mov	_minDahTimeMs,#0xe8
	mov	(_minDahTimeMs + 1),#0x03
;	main.c:14: volatile uint16_t deltaT = 0;
	clr	a
	mov	_deltaT,a
	mov	(_deltaT + 1),a
;	main.c:15: volatile uint16_t t = 0;
	mov	_t,a
	mov	(_t + 1),a
;	main.c:16: volatile TasterState state = UP;
	mov	_state,#0x01
;	main.c:17: volatile uint64_t timeMeasured = 0;
	mov	_timeMeasured,a
	mov	(_timeMeasured + 1),a
	mov	(_timeMeasured + 2),a
	mov	(_timeMeasured + 3),a
	mov	(_timeMeasured + 4),a
	mov	(_timeMeasured + 5),a
	mov	(_timeMeasured + 6),a
	mov	(_timeMeasured + 7),a
;	main.c:19: morse_t dits = {0};
;	1-genFromRTrack replaced	mov	_dits,#0x00
	mov	_dits,a
;	main.c:20: morse_t empty = {0};
;	1-genFromRTrack replaced	mov	_empty,#0x00
	mov	_empty,a
;	main.c:22: int index = 0;
	mov	_index,a
	mov	(_index + 1),a
;	main.c:23: char lastChar = '+';
	mov	_lastChar,#0x2b
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'morse_cpy'
;------------------------------------------------------------
;src                       Allocated with name '_morse_cpy_PARM_2'
;dest                      Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	morse.h:14: void morse_cpy(morse_t* dest, morse_t* src) {
;	-----------------------------------------
;	 function morse_cpy
;	-----------------------------------------
_morse_cpy:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	morse.h:15: dest->pattern = src->pattern;
	mov	r2,_morse_cpy_PARM_2
	mov	r3,(_morse_cpy_PARM_2 + 1)
	mov	r4,(_morse_cpy_PARM_2 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	morse.h:16: dest->size = src->size;
	inc	r5
	cjne	r5,#0x00,00103$
	inc	r6
00103$:
	inc	r2
	cjne	r2,#0x00,00104$
	inc	r3
00104$:
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
;	morse.h:17: }
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'ditsToChar'
;------------------------------------------------------------
;dits                      Allocated to registers r6 r5 r7 
;------------------------------------------------------------
;	main.c:25: char ditsToChar(morse_t* dits) {
;	-----------------------------------------
;	 function ditsToChar
;	-----------------------------------------
_ditsToChar:
;	main.c:26: switch(*(uint16_t *) dits) {
	mov	r5,dph
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	cjne	r6,#0x00,00285$
	cjne	r7,#0x01,00285$
	ljmp	00105$
00285$:
	cjne	r6,#0x80,00286$
	cjne	r7,#0x01,00286$
	ljmp	00120$
00286$:
	cjne	r6,#0x00,00287$
	cjne	r7,#0x02,00287$
	ljmp	00109$
00287$:
	cjne	r6,#0x40,00288$
	cjne	r7,#0x02,00288$
	ljmp	00101$
00288$:
	cjne	r6,#0x80,00289$
	cjne	r7,#0x02,00289$
	ljmp	00114$
00289$:
	cjne	r6,#0xc0,00290$
	cjne	r7,#0x02,00290$
	ljmp	00113$
00290$:
	cjne	r6,#0x00,00291$
	cjne	r7,#0x03,00291$
	ljmp	00119$
00291$:
	cjne	r6,#0x20,00292$
	cjne	r7,#0x03,00292$
	ljmp	00121$
00292$:
	cjne	r6,#0x40,00293$
	cjne	r7,#0x03,00293$
	ljmp	00118$
00293$:
	cjne	r6,#0x60,00294$
	cjne	r7,#0x03,00294$
	ljmp	00123$
00294$:
	cjne	r6,#0x80,00295$
	cjne	r7,#0x03,00295$
	ljmp	00104$
00295$:
	cjne	r6,#0xa0,00296$
	cjne	r7,#0x03,00296$
	ljmp	00111$
00296$:
	cjne	r6,#0xc0,00297$
	cjne	r7,#0x03,00297$
	ljmp	00107$
00297$:
	cjne	r6,#0xe0,00298$
	cjne	r7,#0x03,00298$
	ljmp	00115$
00298$:
	cjne	r6,#0x00,00299$
	cjne	r7,#0x04,00299$
	ljmp	00108$
00299$:
	cjne	r6,#0x10,00300$
	cjne	r7,#0x04,00300$
	ljmp	00122$
00300$:
	cjne	r6,#0x20,00301$
	cjne	r7,#0x04,00301$
	ljmp	00106$
00301$:
	cjne	r6,#0x40,00302$
	cjne	r7,#0x04,00302$
	ljmp	00112$
00302$:
	cjne	r6,#0x60,00303$
	cjne	r7,#0x04,00303$
	ljmp	00116$
00303$:
	cjne	r6,#0x70,00304$
	cjne	r7,#0x04,00304$
	ljmp	00110$
00304$:
	cjne	r6,#0x80,00305$
	cjne	r7,#0x04,00305$
	ljmp	00102$
00305$:
	cjne	r6,#0x90,00306$
	cjne	r7,#0x04,00306$
	ljmp	00124$
00306$:
	cjne	r6,#0xa0,00307$
	cjne	r7,#0x04,00307$
	ljmp	00103$
00307$:
	cjne	r6,#0xb0,00308$
	cjne	r7,#0x04,00308$
	ljmp	00125$
00308$:
	cjne	r6,#0xc0,00309$
	cjne	r7,#0x04,00309$
	ljmp	00126$
00309$:
	cjne	r6,#0xd0,00310$
	cjne	r7,#0x04,00310$
	ljmp	00117$
00310$:
	cjne	r6,#0x00,00311$
	cjne	r7,#0x05,00311$
	ljmp	00132$
00311$:
	cjne	r6,#0x08,00312$
	cjne	r7,#0x05,00312$
	ljmp	00131$
00312$:
	cjne	r6,#0x18,00313$
	cjne	r7,#0x05,00313$
	ljmp	00130$
00313$:
	cjne	r6,#0x38,00314$
	cjne	r7,#0x05,00314$
	ljmp	00129$
00314$:
	cjne	r6,#0x78,00315$
	cjne	r7,#0x05,00315$
	ljmp	00128$
00315$:
	cjne	r6,#0x80,00316$
	cjne	r7,#0x05,00316$
	ljmp	00133$
00316$:
	cjne	r6,#0xc0,00317$
	cjne	r7,#0x05,00317$
	ljmp	00134$
00317$:
	cjne	r6,#0xe0,00318$
	cjne	r7,#0x05,00318$
	ljmp	00135$
00318$:
	cjne	r6,#0xf0,00319$
	cjne	r7,#0x05,00319$
	ljmp	00136$
00319$:
	cjne	r6,#0xf8,00320$
	cjne	r7,#0x05,00320$
	ljmp	00127$
00320$:
	ljmp	00137$
;	main.c:27: case U_MORSE_A: return 'A';
00101$:
	mov	dpl,#0x41
	ret
;	main.c:29: case U_MORSE_B: return 'B';
00102$:
	mov	dpl,#0x42
	ret
;	main.c:31: case U_MORSE_C: return 'C';
00103$:
	mov	dpl,#0x43
	ret
;	main.c:33: case U_MORSE_D: return 'D';
00104$:
	mov	dpl,#0x44
	ret
;	main.c:35: case U_MORSE_E: return 'E';
00105$:
	mov	dpl,#0x45
	ret
;	main.c:37: case U_MORSE_F: return 'F';
00106$:
	mov	dpl,#0x46
	ret
;	main.c:39: case U_MORSE_G: return 'G';
00107$:
	mov	dpl,#0x47
	ret
;	main.c:41: case U_MORSE_H: return 'H';
00108$:
	mov	dpl,#0x48
	ret
;	main.c:43: case U_MORSE_I: return 'I';
00109$:
	mov	dpl,#0x49
	ret
;	main.c:45: case U_MORSE_J: return 'J';
00110$:
	mov	dpl,#0x4a
	ret
;	main.c:47: case U_MORSE_K: return 'K';
00111$:
	mov	dpl,#0x4b
	ret
;	main.c:49: case U_MORSE_L: return 'L';
00112$:
	mov	dpl,#0x4c
	ret
;	main.c:51: case U_MORSE_M: return 'M';
00113$:
	mov	dpl,#0x4d
	ret
;	main.c:53: case U_MORSE_N: return 'N';
00114$:
	mov	dpl,#0x4e
	ret
;	main.c:55: case U_MORSE_O: return 'O';
00115$:
	mov	dpl,#0x4f
	ret
;	main.c:57: case U_MORSE_P: return 'P';
00116$:
	mov	dpl,#0x50
;	main.c:59: case U_MORSE_Q: return 'Q';
	ret
00117$:
	mov	dpl,#0x51
;	main.c:61: case U_MORSE_R: return 'R';
	ret
00118$:
	mov	dpl,#0x52
;	main.c:63: case U_MORSE_S: return 'S';
	ret
00119$:
	mov	dpl,#0x53
;	main.c:65: case U_MORSE_T: return 'T';
	ret
00120$:
	mov	dpl,#0x54
;	main.c:67: case U_MORSE_U: return 'U';
	ret
00121$:
	mov	dpl,#0x55
;	main.c:69: case U_MORSE_V: return 'V';
	ret
00122$:
	mov	dpl,#0x56
;	main.c:71: case U_MORSE_W: return 'W';
	ret
00123$:
	mov	dpl,#0x57
;	main.c:73: case U_MORSE_X: return 'X';
	ret
00124$:
	mov	dpl,#0x58
;	main.c:75: case U_MORSE_Y: return 'Y';
	ret
00125$:
	mov	dpl,#0x59
;	main.c:77: case U_MORSE_Z: return 'Z';
	ret
00126$:
	mov	dpl,#0x5a
;	main.c:81: case U_MORSE_0: return '0';
	ret
00127$:
	mov	dpl,#0x30
;	main.c:83: case U_MORSE_1: return '1';
	ret
00128$:
	mov	dpl,#0x31
;	main.c:85: case U_MORSE_2: return '2';
	ret
00129$:
	mov	dpl,#0x32
;	main.c:87: case U_MORSE_3: return '3';
	ret
00130$:
	mov	dpl,#0x33
;	main.c:89: case U_MORSE_4: return '4';
	ret
00131$:
	mov	dpl,#0x34
;	main.c:91: case U_MORSE_5: return '5';
	ret
00132$:
	mov	dpl,#0x35
;	main.c:93: case U_MORSE_6: return '6';
	ret
00133$:
	mov	dpl,#0x36
;	main.c:95: case U_MORSE_7: return '7';
	ret
00134$:
	mov	dpl,#0x37
;	main.c:97: case U_MORSE_8: return '8';
	ret
00135$:
	mov	dpl,#0x38
;	main.c:99: case U_MORSE_9: return '9';
	ret
00136$:
	mov	dpl,#0x39
;	main.c:102: default:
	ret
00137$:
;	main.c:103: return '+';
	mov	dpl,#0x2b
;	main.c:106: return '+';
;	main.c:107: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	main.c:111: int main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c:112: matrix_setup();
	lcall	_matrix_setup
;	main.c:114: TMOD = 0x01;
	mov	_TMOD,#0x01
;	main.c:115: TH0 = 0xFC;
	mov	_TH0,#0xfc
;	main.c:116: TL0 = 0x18;
	mov	_TL0,#0x18
;	main.c:118: ET0=1;
;	assignBit
	setb	_ET0
;	main.c:119: EA=1;
;	assignBit
	setb	_EA
;	main.c:120: TR0 = 1;
;	assignBit
	setb	_TR0
;	main.c:122: morse_cpy(&dits, &empty);
	mov	_morse_cpy_PARM_2,#_empty
	mov	(_morse_cpy_PARM_2 + 1),#0x00
	mov	(_morse_cpy_PARM_2 + 2),#0x40
	mov	dptr,#_dits
	mov	b,#0x40
	lcall	_morse_cpy
;	main.c:124: while(1) {
00102$:
;	main.c:125: loop();
	lcall	_loop
;	main.c:127: }
	sjmp	00102$
;------------------------------------------------------------
;Allocation info for local variables in function 'loop'
;------------------------------------------------------------
;	main.c:129: void loop() {
;	-----------------------------------------
;	 function loop
;	-----------------------------------------
_loop:
;	main.c:131: if (deltaT != 0) {
	mov	a,_deltaT
	orl	a,(_deltaT + 1)
	jnz	00146$
	ljmp	00109$
00146$:
;	main.c:132: if (state == UP) {
	mov	a,#0x01
	cjne	a,_state,00147$
	sjmp	00148$
00147$:
	ljmp	00107$
00148$:
;	main.c:133: if (deltaT < minDahTimeMs) {
	clr	c
	mov	a,_deltaT
	subb	a,_minDahTimeMs
	mov	a,(_deltaT + 1)
	subb	a,(_minDahTimeMs + 1)
	jnc	00102$
;	main.c:134: dits.pattern = dits.pattern & (0xFF - (1 << (7 - index)));
	mov	r7,_index
	mov	a,#0x07
	clr	c
	subb	a,r7
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	00152$
00150$:
	add	a,acc
00152$:
	djnz	b,00150$
	mov	r7,a
	mov	a,#0xff
	clr	c
	subb	a,r7
	mov	r7,a
	mov	r6,_dits
	anl	a,r6
	mov	_dits,a
	sjmp	00103$
00102$:
;	main.c:136: dits.pattern = dits.pattern | (1 << (7-index));
	mov	r7,_index
	mov	a,#0x07
	clr	c
	subb	a,r7
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	00155$
00153$:
	add	a,acc
00155$:
	djnz	b,00153$
	mov	r7,a
	mov	r6,_dits
	orl	a,r6
	mov	_dits,a
00103$:
;	main.c:139: dits.size++;
	mov	a,(_dits + 0x0001)
	mov	r7,a
	inc	a
	mov	(_dits + 0x0001),a
;	main.c:140: index++;
	inc	_index
	clr	a
	cjne	a,_index,00156$
	inc	(_index + 1)
00156$:
;	main.c:141: if (index == 5) {
	mov	a,#0x05
	cjne	a,_index,00157$
	clr	a
	cjne	a,(_index + 1),00157$
	sjmp	00158$
00157$:
	sjmp	00107$
00158$:
;	main.c:142: lastChar = ditsToChar(&dits);
	mov	dptr,#_dits
	mov	b,#0x40
	lcall	_ditsToChar
	mov	_lastChar,dpl
;	main.c:143: morse_cpy(&dits, &empty);
	mov	_morse_cpy_PARM_2,#_empty
	mov	(_morse_cpy_PARM_2 + 1),#0x00
	mov	(_morse_cpy_PARM_2 + 2),#0x40
	mov	dptr,#_dits
	mov	b,#0x40
	lcall	_morse_cpy
;	main.c:144: index = 0;
	clr	a
	mov	_index,a
	mov	(_index + 1),a
00107$:
;	main.c:148: deltaT = 0;
	clr	a
	mov	_deltaT,a
	mov	(_deltaT + 1),a
00109$:
;	main.c:151: if (state == UP) {
	mov	a,#0x01
	cjne	a,_state,00115$
;	main.c:152: if (t >= minDahTimeMs) {
	clr	c
	mov	a,_t
	subb	a,_minDahTimeMs
	mov	a,(_t + 1)
	subb	a,(_minDahTimeMs + 1)
;	main.c:154: if (index > 0) {
	jc	00115$
	clr	a
	subb	a,_index
	mov	a,#(0x00 ^ 0x80)
	mov	b,(_index + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	00111$
;	main.c:155: lastChar = ditsToChar(&dits);
	mov	dptr,#_dits
	mov	b,#0x40
	lcall	_ditsToChar
	mov	_lastChar,dpl
00111$:
;	main.c:157: morse_cpy(&dits, &empty);
	mov	_morse_cpy_PARM_2,#_empty
	mov	(_morse_cpy_PARM_2 + 1),#0x00
	mov	(_morse_cpy_PARM_2 + 2),#0x40
	mov	dptr,#_dits
	mov	b,#0x40
	lcall	_morse_cpy
;	main.c:159: index = 0;
	clr	a
	mov	_index,a
	mov	(_index + 1),a
;	main.c:161: deltaT = 0;
	mov	_deltaT,a
	mov	(_deltaT + 1),a
;	main.c:162: t = 0;
	mov	_t,a
	mov	(_t + 1),a
00115$:
;	main.c:166: matrix_draw(lastChar);
	mov	dpl,_lastChar
;	main.c:167: }
	ljmp	_matrix_draw
;------------------------------------------------------------
;Allocation info for local variables in function 'ISR_Timer0'
;------------------------------------------------------------
;	main.c:169: void ISR_Timer0(void) __interrupt 1 {
;	-----------------------------------------
;	 function ISR_Timer0
;	-----------------------------------------
_ISR_Timer0:
	push	acc
	push	psw
;	main.c:170: TH0 = 0xFC;
	mov	_TH0,#0xfc
;	main.c:171: TL0 = 0x18;
	mov	_TL0,#0x18
;	main.c:173: t++;
	mov	a,#0x01
	add	a,_t
	mov	_t,a
	clr	a
	addc	a,(_t + 1)
	mov	(_t + 1),a
;	main.c:175: if (state == UP) {
	mov	a,#0x01
	cjne	a,_state,00106$
;	main.c:176: if (P3_2 == 0) {
	jb	_P3_2,00108$
;	main.c:177: state = DOWN;
	mov	_state,#0x00
;	main.c:178: deltaT = t;
	mov	_deltaT,_t
	mov	(_deltaT + 1),(_t + 1)
;	main.c:179: t=0;
	clr	a
	mov	_t,a
	mov	(_t + 1),a
	sjmp	00108$
00106$:
;	main.c:183: if (P3_2 == 1) {
	jnb	_P3_2,00108$
;	main.c:184: state = UP;
	mov	_state,#0x01
;	main.c:185: deltaT = t;
	mov	_deltaT,_t
	mov	(_deltaT + 1),(_t + 1)
;	main.c:186: t=0;
	clr	a
	mov	_t,a
	mov	(_t + 1),a
00108$:
;	main.c:189: }
	pop	psw
	pop	acc
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
