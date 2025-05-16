;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module matrix
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _reset_row
	.globl _set_row
	.globl _reset_col
	.globl _set_col
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
	.globl _matrix_draw
	.globl _matrix_setup
	.globl _matrix_reset
	.globl _matrix_reset_rows
	.globl _matrix_reset_cols
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
_matrix_draw_active_muster_65536_29:
	.ds 8
_matrix_draw_i_131072_31:
	.ds 2
_matrix_draw_j_262144_33:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'is_col_port3'
;------------------------------------------------------------
;col                       Allocated to registers r6 r7 
;------------------------------------------------------------
;	matrix.c:22: static bool is_col_port3(int col) {
;	-----------------------------------------
;	 function is_col_port3
;	-----------------------------------------
_is_col_port3:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r6,dpl
	mov	r7,dph
;	matrix.c:23: if (col == 0) {
	mov	a,r6
	orl	a,r7
;	matrix.c:24: return false;
	jnz	00102$
	mov	dpl,a
	ret
00102$:
;	matrix.c:26: return true;
	mov	dpl,#0x01
;	matrix.c:27: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'get_pin_of_col'
;------------------------------------------------------------
;col                       Allocated to registers r6 r7 
;------------------------------------------------------------
;	matrix.c:29: static bool get_pin_of_col(int col) {
;	-----------------------------------------
;	 function get_pin_of_col
;	-----------------------------------------
_get_pin_of_col:
	mov	r6,dpl
	mov	r7,dph
;	matrix.c:30: if (col == 1) {
	cjne	r6,#0x01,00102$
	cjne	r7,#0x00,00102$
;	matrix.c:31: return 7;
	mov	dpl,#0x01
	ret
00102$:
;	matrix.c:34: if (col == 2) {
	cjne	r6,#0x02,00104$
	cjne	r7,#0x00,00104$
;	matrix.c:35: return 5;
	mov	dpl,#0x01
	ret
00104$:
;	matrix.c:38: if (col == 3) {
	cjne	r6,#0x03,00106$
	cjne	r7,#0x00,00106$
;	matrix.c:39: return 4;
	mov	dpl,#0x01
	ret
00106$:
;	matrix.c:42: if (col == 4) {
	cjne	r6,#0x04,00108$
	cjne	r7,#0x00,00108$
;	matrix.c:43: return 3;
	mov	dpl,#0x01
	ret
00108$:
;	matrix.c:46: return -1;
	mov	dpl,#0x01
;	matrix.c:47: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'set_col'
;------------------------------------------------------------
;col                       Allocated to registers r6 r7 
;------------------------------------------------------------
;	matrix.c:49: void set_col(int col) {
;	-----------------------------------------
;	 function set_col
;	-----------------------------------------
_set_col:
	mov	r6,dpl
	mov	r7,dph
;	matrix.c:50: switch (col) {
	cjne	r6,#0x00,00129$
	cjne	r7,#0x00,00129$
	sjmp	00101$
00129$:
	cjne	r6,#0x01,00130$
	cjne	r7,#0x00,00130$
	sjmp	00102$
00130$:
	cjne	r6,#0x02,00131$
	cjne	r7,#0x00,00131$
	sjmp	00103$
00131$:
	cjne	r6,#0x03,00132$
	cjne	r7,#0x00,00132$
	sjmp	00104$
00132$:
;	matrix.c:51: case 0: P1_0 = 1;
	cjne	r6,#0x04,00107$
	cjne	r7,#0x00,00107$
	sjmp	00105$
00101$:
;	assignBit
	setb	_P1_0
;	matrix.c:52: break;
;	matrix.c:53: case 1: P3_7 = 1;
	ret
00102$:
;	assignBit
	setb	_P3_7
;	matrix.c:54: break;
;	matrix.c:55: case 2: P3_5 = 1;
	ret
00103$:
;	assignBit
	setb	_P3_5
;	matrix.c:56: break;
;	matrix.c:57: case 3: P3_4 = 1;
	ret
00104$:
;	assignBit
	setb	_P3_4
;	matrix.c:58: break;
;	matrix.c:59: case 4: P3_3 = 1;
	ret
00105$:
;	assignBit
	setb	_P3_3
;	matrix.c:61: };
00107$:
;	matrix.c:62: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'reset_col'
;------------------------------------------------------------
;col                       Allocated to registers r6 r7 
;------------------------------------------------------------
;	matrix.c:64: void reset_col(int col) {
;	-----------------------------------------
;	 function reset_col
;	-----------------------------------------
_reset_col:
	mov	r6,dpl
	mov	r7,dph
;	matrix.c:65: switch (col) {
	cjne	r6,#0x00,00129$
	cjne	r7,#0x00,00129$
	sjmp	00101$
00129$:
	cjne	r6,#0x01,00130$
	cjne	r7,#0x00,00130$
	sjmp	00102$
00130$:
	cjne	r6,#0x02,00131$
	cjne	r7,#0x00,00131$
	sjmp	00103$
00131$:
	cjne	r6,#0x03,00132$
	cjne	r7,#0x00,00132$
	sjmp	00104$
00132$:
;	matrix.c:66: case 0: P1_0 = 0;
	cjne	r6,#0x04,00107$
	cjne	r7,#0x00,00107$
	sjmp	00105$
00101$:
;	assignBit
	clr	_P1_0
;	matrix.c:67: break;
;	matrix.c:68: case 1: P3_7 = 0;
	ret
00102$:
;	assignBit
	clr	_P3_7
;	matrix.c:69: break;
;	matrix.c:70: case 2: P3_5 = 0;
	ret
00103$:
;	assignBit
	clr	_P3_5
;	matrix.c:71: break;
;	matrix.c:72: case 3: P3_4 = 0;
	ret
00104$:
;	assignBit
	clr	_P3_4
;	matrix.c:73: break;
;	matrix.c:74: case 4: P3_3 = 0;
	ret
00105$:
;	assignBit
	clr	_P3_3
;	matrix.c:76: };
00107$:
;	matrix.c:77: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'set_row'
;------------------------------------------------------------
;row                       Allocated to registers r6 r7 
;------------------------------------------------------------
;	matrix.c:79: void set_row(int row) {
;	-----------------------------------------
;	 function set_row
;	-----------------------------------------
_set_row:
;	matrix.c:80: P1 = P1 | (1 << (row + 1));
	mov	a,dpl
	inc	a
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	00105$
00103$:
	add	a,acc
00105$:
	djnz	b,00103$
	mov	r6,_P1
	orl	a,r6
	mov	_P1,a
;	matrix.c:81: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'reset_row'
;------------------------------------------------------------
;row                       Allocated to registers r6 r7 
;------------------------------------------------------------
;	matrix.c:83: void reset_row(int row) {
;	-----------------------------------------
;	 function reset_row
;	-----------------------------------------
_reset_row:
;	matrix.c:84: P1 = P1 & (0xFF - (1 << (row+1)));
	mov	a,dpl
	inc	a
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	00105$
00103$:
	add	a,acc
00105$:
	djnz	b,00103$
	mov	r7,a
	mov	a,#0xff
	clr	c
	subb	a,r7
	mov	r6,_P1
	anl	a,r6
	mov	_P1,a
;	matrix.c:85: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'charToMuster'
;------------------------------------------------------------
;c                         Allocated to registers r7 
;------------------------------------------------------------
;	matrix.c:87: static uint64_t charToMuster(char c) {
;	-----------------------------------------
;	 function charToMuster
;	-----------------------------------------
_charToMuster:
	mov	r7,dpl
;	matrix.c:88: switch (c) {
	cjne	r7,#0x2b,00150$
00150$:
	jnc	00151$
	ljmp	00138$
00151$:
	mov	a,r7
	add	a,#0xff - 0x5a
	jnc	00152$
	ljmp	00138$
00152$:
	mov	a,r7
	add	a,#0xd5
	mov	r7,a
	add	a,#(00153$-3-.)
	movc	a,@a+pc
	mov	dpl,a
	mov	a,r7
	add	a,#(00154$-3-.)
	movc	a,@a+pc
	mov	dph,a
	clr	a
	jmp	@a+dptr
00153$:
	.db	00137$
	.db	00138$
	.db	00138$
	.db	00138$
	.db	00138$
	.db	00127$
	.db	00128$
	.db	00129$
	.db	00130$
	.db	00131$
	.db	00132$
	.db	00133$
	.db	00134$
	.db	00135$
	.db	00136$
	.db	00138$
	.db	00138$
	.db	00138$
	.db	00138$
	.db	00138$
	.db	00138$
	.db	00138$
	.db	00101$
	.db	00102$
	.db	00103$
	.db	00104$
	.db	00105$
	.db	00106$
	.db	00107$
	.db	00108$
	.db	00109$
	.db	00110$
	.db	00111$
	.db	00112$
	.db	00113$
	.db	00114$
	.db	00115$
	.db	00116$
	.db	00117$
	.db	00118$
	.db	00119$
	.db	00120$
	.db	00121$
	.db	00122$
	.db	00123$
	.db	00124$
	.db	00125$
	.db	00126$
00154$:
	.db	00137$>>8
	.db	00138$>>8
	.db	00138$>>8
	.db	00138$>>8
	.db	00138$>>8
	.db	00127$>>8
	.db	00128$>>8
	.db	00129$>>8
	.db	00130$>>8
	.db	00131$>>8
	.db	00132$>>8
	.db	00133$>>8
	.db	00134$>>8
	.db	00135$>>8
	.db	00136$>>8
	.db	00138$>>8
	.db	00138$>>8
	.db	00138$>>8
	.db	00138$>>8
	.db	00138$>>8
	.db	00138$>>8
	.db	00138$>>8
	.db	00101$>>8
	.db	00102$>>8
	.db	00103$>>8
	.db	00104$>>8
	.db	00105$>>8
	.db	00106$>>8
	.db	00107$>>8
	.db	00108$>>8
	.db	00109$>>8
	.db	00110$>>8
	.db	00111$>>8
	.db	00112$>>8
	.db	00113$>>8
	.db	00114$>>8
	.db	00115$>>8
	.db	00116$>>8
	.db	00117$>>8
	.db	00118$>>8
	.db	00119$>>8
	.db	00120$>>8
	.db	00121$>>8
	.db	00122$>>8
	.db	00123$>>8
	.db	00124$>>8
	.db	00125$>>8
	.db	00126$>>8
;	matrix.c:89: case 'A': return musterA;
00101$:
	mov	dptr,#0xc631
	mov	b,#0x1f
	mov	a,#0xa3
	mov	r4,#0x03
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:91: case 'B': return musterB;
00102$:
	mov	dptr,#0x463e
	mov	b,#0x1f
	mov	a,#0xa3
	mov	r4,#0x07
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:93: case 'C': return musterC;
00103$:
	mov	dptr,#0x420f
	mov	b,#0x08
	mov	a,#0xe1
	mov	r4,#0x03
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:95: case 'D': return musterD;
00104$:
	mov	dptr,#0xc63e
	mov	b,#0x18
	mov	a,#0xa3
	mov	r4,#0x07
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:97: case 'E': return musterE;
00105$:
	mov	dptr,#0xc21f
	mov	b,#0x0f
	mov	a,#0xe1
	mov	r4,#0x07
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:99: case 'F': return musterF;
00106$:
	mov	dptr,#0x4210
	mov	b,#0x0f
	mov	a,#0xe1
	mov	r4,#0x07
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:101: case 'G': return musterG;
00107$:
	mov	dptr,#0xc62e
	mov	b,#0x0b
	mov	a,#0xe1
	mov	r4,#0x03
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:103: case 'H': return musterH;
00108$:
	mov	dptr,#0xc631
	mov	b,#0x1f
	mov	a,#0x63
	mov	r4,#0x04
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:105: case 'I': return musterI;
00109$:
	mov	dptr,#0x109f
	mov	b,#0x42
	mov	a,#0xc8
	mov	r4,#0x07
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:107: case 'J': return musterJ;
00110$:
	mov	dptr,#0x4a4c
	mov	b,#0x21
	mov	a,#0x84
	mov	r4,#0x00
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:109: case 'K': return musterK;
00111$:
	mov	dptr,#0x5251
	mov	b,#0x4c
	mov	a,#0x65
	mov	r4,#0x04
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:111: case 'L': return musterL;
00112$:
	mov	dptr,#0x421f
	mov	b,#0x08
	mov	a,#0x21
	mov	r4,#0x04
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:113: case 'M': return musterM;
00113$:
	mov	dptr,#0xc631
	mov	b,#0x58
	mov	a,#0x77
	mov	r4,#0x04
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:115: case 'N': return musterN;
00114$:
	mov	dptr,#0xce31
	mov	b,#0x9a
	mov	a,#0x63
	mov	r4,#0x04
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:117: case 'O': return musterO;
00115$:
	mov	dptr,#0xc62e
	mov	b,#0x18
	mov	a,#0xa3
	mov	r4,#0x03
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:119: case 'P': return musterP;
00116$:
	mov	dptr,#0x4210
	mov	b,#0x1f
	mov	a,#0xa3
	mov	r4,#0x07
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:121: case 'Q': return musterQ;
00117$:
	mov	dptr,#0xd66f
	mov	b,#0x18
	mov	a,#0xa3
	mov	r4,#0x03
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:123: case 'R': return musterR;
00118$:
	mov	dptr,#0x5251
	mov	b,#0x1f
	mov	a,#0xa3
	mov	r4,#0x07
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:125: case 'S': return musterS;
00119$:
	mov	dptr,#0x043e
	mov	b,#0x07
	mov	a,#0xe1
	mov	r4,#0x03
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:127: case 'T': return musterT;
00120$:
	mov	dptr,#0x1084
	mov	b,#0x42
	mov	a,#0xc8
	mov	r4,#0x07
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:129: case 'U': return musterU;
00121$:
	mov	dptr,#0xc62e
	mov	b,#0x18
	mov	a,#0x63
	mov	r4,#0x04
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:131: case 'V': return musterV;
00122$:
	mov	dptr,#0xc544
	mov	b,#0x18
	mov	a,#0x63
	mov	r4,#0x04
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:133: case 'W': return musterW;
00123$:
	mov	dptr,#0xd771
	mov	b,#0x18
	mov	a,#0x63
	mov	r4,#0x04
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:135: case 'X': return musterX;
00124$:
	mov	dptr,#0x2a31
	mov	b,#0xa2
	mov	a,#0x62
	mov	r4,#0x04
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:137: case 'Y': return musterY;
00125$:
	mov	dptr,#0x1084
	mov	b,#0xa2
	mov	a,#0x62
	mov	r4,#0x04
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:139: case 'Z': return musterZ;
00126$:
	mov	dptr,#0x221f
	mov	b,#0x22
	mov	a,#0xc2
	mov	r4,#0x07
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:142: case '0': return muster0;
00127$:
	mov	dptr,#0xe72e
	mov	b,#0x3a
	mov	a,#0xa7
	mov	r4,#0x03
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:144: case '1': return muster1;
00128$:
	mov	dptr,#0x109f
	mov	b,#0x42
	mov	a,#0x19
	mov	r4,#0x01
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:146: case '2': return muster2;
00129$:
	mov	dptr,#0x111f
	mov	b,#0x11
	mov	a,#0xa2
	mov	r4,#0x03
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:148: case '3': return muster3;
00130$:
	mov	dptr,#0x062e
	mov	b,#0x13
	mov	a,#0xa2
	mov	r4,#0x03
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:150: case '4': return muster4;
00131$:
	mov	dptr,#0x7c42
	mov	b,#0xa9
	mov	a,#0x8c
	mov	r4,#0x00
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:152: case '5': return muster5;
00132$:
	mov	dptr,#0x862e
	mov	b,#0xe0
	mov	a,#0xe1
	mov	r4,#0x07
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	ret
;	matrix.c:154: case '6': return muster6;
00133$:
	mov	dptr,#0x462e
	mov	b,#0x0f
	mov	a,#0xa3
	mov	r4,#0x03
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
;	matrix.c:156: case '7': return muster7;
	ret
00134$:
	mov	dptr,#0x1084
	mov	b,#0x22
	mov	a,#0xc2
	mov	r4,#0x07
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
;	matrix.c:158: case '8': return muster8;
	ret
00135$:
	mov	dptr,#0x462e
	mov	b,#0x17
	mov	a,#0xa3
	mov	r4,#0x03
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
;	matrix.c:160: case '9': return muster9;
	ret
00136$:
	mov	dptr,#0x862e
	mov	b,#0x17
	mov	a,#0xa3
	mov	r4,#0x03
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
;	matrix.c:163: case '+': return musterErr;
	ret
00137$:
	mov	dptr,#0xffff
	mov	a,#0xff
	mov	b,a
	mov	r4,#0x07
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
;	matrix.c:166: default: return musterErr;
	ret
00138$:
	mov	dptr,#0xffff
	mov	a,#0xff
	mov	b,a
	mov	r4,#0x07
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
;	matrix.c:168: }
;	matrix.c:169: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'matrix_draw'
;------------------------------------------------------------
;c                         Allocated to registers r7 
;active_muster             Allocated with name '_matrix_draw_active_muster_65536_29'
;i                         Allocated with name '_matrix_draw_i_131072_31'
;j                         Allocated with name '_matrix_draw_j_262144_33'
;index                     Allocated to registers 
;val                       Allocated to registers r7 
;------------------------------------------------------------
;	matrix.c:171: void matrix_draw(char c) {
;	-----------------------------------------
;	 function matrix_draw
;	-----------------------------------------
_matrix_draw:
;	matrix.c:174: if (c > 0x60 && c < 0x7b) {
	mov	a,dpl
	mov	r7,a
	add	a,#0xff - 0x60
	jnc	00102$
	cjne	r7,#0x7b,00147$
00147$:
	jnc	00102$
;	matrix.c:175: c -= 32;
	mov	ar6,r7
	mov	a,r6
	add	a,#0xe0
	mov	r7,a
00102$:
;	matrix.c:178: active_muster = charToMuster(c);
	mov	dpl,r7
	lcall	_charToMuster
	mov	_matrix_draw_active_muster_65536_29,dpl
	mov	(_matrix_draw_active_muster_65536_29 + 1),dph
	mov	(_matrix_draw_active_muster_65536_29 + 2),b
	mov	(_matrix_draw_active_muster_65536_29 + 3),a
	mov	(_matrix_draw_active_muster_65536_29 + 4),r4
	mov	(_matrix_draw_active_muster_65536_29 + 5),r5
	mov	(_matrix_draw_active_muster_65536_29 + 6),r6
	mov	(_matrix_draw_active_muster_65536_29 + 7),r7
;	matrix.c:180: for (int i=0; i<5; i++) {
	clr	a
	mov	_matrix_draw_i_131072_31,a
	mov	(_matrix_draw_i_131072_31 + 1),a
00112$:
	clr	c
	mov	a,_matrix_draw_i_131072_31
	subb	a,#0x05
	mov	a,(_matrix_draw_i_131072_31 + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jc	00149$
	ret
00149$:
;	matrix.c:181: matrix_reset_cols();
	lcall	_matrix_reset_cols
;	matrix.c:182: matrix_reset_rows();
	lcall	_matrix_reset_rows
;	matrix.c:183: set_col(i);
	mov	dpl,_matrix_draw_i_131072_31
	mov	dph,(_matrix_draw_i_131072_31 + 1)
	lcall	_set_col
;	matrix.c:185: for (int j = 0; j<7; j++) {
	clr	a
	mov	_matrix_draw_j_262144_33,a
	mov	(_matrix_draw_j_262144_33 + 1),a
00109$:
	clr	c
	mov	a,_matrix_draw_j_262144_33
	subb	a,#0x07
	mov	a,(_matrix_draw_j_262144_33 + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00113$
;	matrix.c:186: int index = 5*j + i;
	mov	a,_matrix_draw_j_262144_33
	mov	b,#0x05
	mul	ab
	mov	r3,a
	mov	a,_matrix_draw_i_131072_31
	add	a,r3
;	matrix.c:187: bool val = (active_muster >> (34 - index)) & 1;
	setb	c
	subb	a,#0x22
	cpl	a
	mov	r3,a
	mov	b,r3
	inc	b
	mov	r0,_matrix_draw_active_muster_65536_29
	mov	r1,(_matrix_draw_active_muster_65536_29 + 1)
	mov	r2,(_matrix_draw_active_muster_65536_29 + 2)
	mov	r3,(_matrix_draw_active_muster_65536_29 + 3)
	mov	r4,(_matrix_draw_active_muster_65536_29 + 4)
	mov	r5,(_matrix_draw_active_muster_65536_29 + 5)
	mov	r6,(_matrix_draw_active_muster_65536_29 + 6)
	mov	r7,(_matrix_draw_active_muster_65536_29 + 7)
	sjmp	00152$
00151$:
	clr	c
	mov	a,r7
	rrc	a
	mov	r7,a
	mov	a,r6
	rrc	a
	mov	r6,a
	mov	a,r5
	rrc	a
	mov	r5,a
	mov	a,r4
	rrc	a
	mov	r4,a
	mov	a,r3
	rrc	a
	mov	r3,a
	mov	a,r2
	rrc	a
	mov	r2,a
	mov	a,r1
	rrc	a
	mov	r1,a
	mov	a,r0
	rrc	a
	mov	r0,a
00152$:
	djnz	b,00151$
	mov	a,r0
	anl	a,#0x01
;	matrix.c:188: if (val) {
	mov	r7,a
	jz	00110$
;	matrix.c:189: reset_row(j);
	mov	dpl,_matrix_draw_j_262144_33
	mov	dph,(_matrix_draw_j_262144_33 + 1)
	lcall	_reset_row
00110$:
;	matrix.c:185: for (int j = 0; j<7; j++) {
	inc	_matrix_draw_j_262144_33
	clr	a
	cjne	a,_matrix_draw_j_262144_33,00109$
	inc	(_matrix_draw_j_262144_33 + 1)
	sjmp	00109$
00113$:
;	matrix.c:180: for (int i=0; i<5; i++) {
	inc	_matrix_draw_i_131072_31
	clr	a
	cjne	a,_matrix_draw_i_131072_31,00155$
	inc	(_matrix_draw_i_131072_31 + 1)
00155$:
;	matrix.c:193: }
	ljmp	00112$
;------------------------------------------------------------
;Allocation info for local variables in function 'matrix_setup'
;------------------------------------------------------------
;	matrix.c:195: void matrix_setup() {
;	-----------------------------------------
;	 function matrix_setup
;	-----------------------------------------
_matrix_setup:
;	matrix.c:196: matrix_reset();
;	matrix.c:197: }
	ljmp	_matrix_reset
;------------------------------------------------------------
;Allocation info for local variables in function 'matrix_reset'
;------------------------------------------------------------
;	matrix.c:199: void matrix_reset() {
;	-----------------------------------------
;	 function matrix_reset
;	-----------------------------------------
_matrix_reset:
;	matrix.c:200: matrix_reset_rows();
	lcall	_matrix_reset_rows
;	matrix.c:202: matrix_reset_cols();
;	matrix.c:203: }
	ljmp	_matrix_reset_cols
;------------------------------------------------------------
;Allocation info for local variables in function 'matrix_reset_rows'
;------------------------------------------------------------
;i                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	matrix.c:205: void matrix_reset_rows() {
;	-----------------------------------------
;	 function matrix_reset_rows
;	-----------------------------------------
_matrix_reset_rows:
;	matrix.c:206: for (int i = 0; i<7; i++) {
	mov	r6,#0x00
	mov	r7,#0x00
00103$:
	clr	c
	mov	a,r6
	subb	a,#0x07
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00105$
;	matrix.c:207: set_row(i);
	mov	dpl,r6
	mov	dph,r7
	push	ar7
	push	ar6
	lcall	_set_row
	pop	ar6
	pop	ar7
;	matrix.c:206: for (int i = 0; i<7; i++) {
	inc	r6
	cjne	r6,#0x00,00103$
	inc	r7
	sjmp	00103$
00105$:
;	matrix.c:209: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'matrix_reset_cols'
;------------------------------------------------------------
;i                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	matrix.c:211: void matrix_reset_cols() {
;	-----------------------------------------
;	 function matrix_reset_cols
;	-----------------------------------------
_matrix_reset_cols:
;	matrix.c:212: for (int i = 0; i<5; i++) {
	mov	r6,#0x00
	mov	r7,#0x00
00103$:
	clr	c
	mov	a,r6
	subb	a,#0x05
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00105$
;	matrix.c:213: reset_col(i);
	mov	dpl,r6
	mov	dph,r7
	push	ar7
	push	ar6
	lcall	_reset_col
	pop	ar6
	pop	ar7
;	matrix.c:212: for (int i = 0; i<5; i++) {
	inc	r6
	cjne	r6,#0x00,00103$
	inc	r7
	sjmp	00103$
00105$:
;	matrix.c:215: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
