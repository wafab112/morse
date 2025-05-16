                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _morse_cpy_PARM_2
                                     12 	.globl _ISR_Timer0
                                     13 	.globl _main
                                     14 	.globl _ditsToChar
                                     15 	.globl _morse_cpy
                                     16 	.globl _matrix_setup
                                     17 	.globl _matrix_draw
                                     18 	.globl _CY
                                     19 	.globl _AC
                                     20 	.globl _F0
                                     21 	.globl _RS1
                                     22 	.globl _RS0
                                     23 	.globl _OV
                                     24 	.globl _F1
                                     25 	.globl _P
                                     26 	.globl _PS
                                     27 	.globl _PT1
                                     28 	.globl _PX1
                                     29 	.globl _PT0
                                     30 	.globl _PX0
                                     31 	.globl _RD
                                     32 	.globl _WR
                                     33 	.globl _T1
                                     34 	.globl _T0
                                     35 	.globl _INT1
                                     36 	.globl _INT0
                                     37 	.globl _TXD
                                     38 	.globl _RXD
                                     39 	.globl _P3_7
                                     40 	.globl _P3_6
                                     41 	.globl _P3_5
                                     42 	.globl _P3_4
                                     43 	.globl _P3_3
                                     44 	.globl _P3_2
                                     45 	.globl _P3_1
                                     46 	.globl _P3_0
                                     47 	.globl _EA
                                     48 	.globl _ES
                                     49 	.globl _ET1
                                     50 	.globl _EX1
                                     51 	.globl _ET0
                                     52 	.globl _EX0
                                     53 	.globl _P2_7
                                     54 	.globl _P2_6
                                     55 	.globl _P2_5
                                     56 	.globl _P2_4
                                     57 	.globl _P2_3
                                     58 	.globl _P2_2
                                     59 	.globl _P2_1
                                     60 	.globl _P2_0
                                     61 	.globl _SM0
                                     62 	.globl _SM1
                                     63 	.globl _SM2
                                     64 	.globl _REN
                                     65 	.globl _TB8
                                     66 	.globl _RB8
                                     67 	.globl _TI
                                     68 	.globl _RI
                                     69 	.globl _P1_7
                                     70 	.globl _P1_6
                                     71 	.globl _P1_5
                                     72 	.globl _P1_4
                                     73 	.globl _P1_3
                                     74 	.globl _P1_2
                                     75 	.globl _P1_1
                                     76 	.globl _P1_0
                                     77 	.globl _TF1
                                     78 	.globl _TR1
                                     79 	.globl _TF0
                                     80 	.globl _TR0
                                     81 	.globl _IE1
                                     82 	.globl _IT1
                                     83 	.globl _IE0
                                     84 	.globl _IT0
                                     85 	.globl _P0_7
                                     86 	.globl _P0_6
                                     87 	.globl _P0_5
                                     88 	.globl _P0_4
                                     89 	.globl _P0_3
                                     90 	.globl _P0_2
                                     91 	.globl _P0_1
                                     92 	.globl _P0_0
                                     93 	.globl _B
                                     94 	.globl _ACC
                                     95 	.globl _PSW
                                     96 	.globl _IP
                                     97 	.globl _P3
                                     98 	.globl _IE
                                     99 	.globl _P2
                                    100 	.globl _SBUF
                                    101 	.globl _SCON
                                    102 	.globl _P1
                                    103 	.globl _TH1
                                    104 	.globl _TH0
                                    105 	.globl _TL1
                                    106 	.globl _TL0
                                    107 	.globl _TMOD
                                    108 	.globl _TCON
                                    109 	.globl _PCON
                                    110 	.globl _DPH
                                    111 	.globl _DPL
                                    112 	.globl _SP
                                    113 	.globl _P0
                                    114 	.globl _lastChar
                                    115 	.globl _index
                                    116 	.globl _empty
                                    117 	.globl _dits
                                    118 	.globl _timeMeasured
                                    119 	.globl _state
                                    120 	.globl _t
                                    121 	.globl _deltaT
                                    122 	.globl _minDahTimeMs
                                    123 	.globl _loop
                                    124 ;--------------------------------------------------------
                                    125 ; special function registers
                                    126 ;--------------------------------------------------------
                                    127 	.area RSEG    (ABS,DATA)
      000000                        128 	.org 0x0000
                           000080   129 _P0	=	0x0080
                           000081   130 _SP	=	0x0081
                           000082   131 _DPL	=	0x0082
                           000083   132 _DPH	=	0x0083
                           000087   133 _PCON	=	0x0087
                           000088   134 _TCON	=	0x0088
                           000089   135 _TMOD	=	0x0089
                           00008A   136 _TL0	=	0x008a
                           00008B   137 _TL1	=	0x008b
                           00008C   138 _TH0	=	0x008c
                           00008D   139 _TH1	=	0x008d
                           000090   140 _P1	=	0x0090
                           000098   141 _SCON	=	0x0098
                           000099   142 _SBUF	=	0x0099
                           0000A0   143 _P2	=	0x00a0
                           0000A8   144 _IE	=	0x00a8
                           0000B0   145 _P3	=	0x00b0
                           0000B8   146 _IP	=	0x00b8
                           0000D0   147 _PSW	=	0x00d0
                           0000E0   148 _ACC	=	0x00e0
                           0000F0   149 _B	=	0x00f0
                                    150 ;--------------------------------------------------------
                                    151 ; special function bits
                                    152 ;--------------------------------------------------------
                                    153 	.area RSEG    (ABS,DATA)
      000000                        154 	.org 0x0000
                           000080   155 _P0_0	=	0x0080
                           000081   156 _P0_1	=	0x0081
                           000082   157 _P0_2	=	0x0082
                           000083   158 _P0_3	=	0x0083
                           000084   159 _P0_4	=	0x0084
                           000085   160 _P0_5	=	0x0085
                           000086   161 _P0_6	=	0x0086
                           000087   162 _P0_7	=	0x0087
                           000088   163 _IT0	=	0x0088
                           000089   164 _IE0	=	0x0089
                           00008A   165 _IT1	=	0x008a
                           00008B   166 _IE1	=	0x008b
                           00008C   167 _TR0	=	0x008c
                           00008D   168 _TF0	=	0x008d
                           00008E   169 _TR1	=	0x008e
                           00008F   170 _TF1	=	0x008f
                           000090   171 _P1_0	=	0x0090
                           000091   172 _P1_1	=	0x0091
                           000092   173 _P1_2	=	0x0092
                           000093   174 _P1_3	=	0x0093
                           000094   175 _P1_4	=	0x0094
                           000095   176 _P1_5	=	0x0095
                           000096   177 _P1_6	=	0x0096
                           000097   178 _P1_7	=	0x0097
                           000098   179 _RI	=	0x0098
                           000099   180 _TI	=	0x0099
                           00009A   181 _RB8	=	0x009a
                           00009B   182 _TB8	=	0x009b
                           00009C   183 _REN	=	0x009c
                           00009D   184 _SM2	=	0x009d
                           00009E   185 _SM1	=	0x009e
                           00009F   186 _SM0	=	0x009f
                           0000A0   187 _P2_0	=	0x00a0
                           0000A1   188 _P2_1	=	0x00a1
                           0000A2   189 _P2_2	=	0x00a2
                           0000A3   190 _P2_3	=	0x00a3
                           0000A4   191 _P2_4	=	0x00a4
                           0000A5   192 _P2_5	=	0x00a5
                           0000A6   193 _P2_6	=	0x00a6
                           0000A7   194 _P2_7	=	0x00a7
                           0000A8   195 _EX0	=	0x00a8
                           0000A9   196 _ET0	=	0x00a9
                           0000AA   197 _EX1	=	0x00aa
                           0000AB   198 _ET1	=	0x00ab
                           0000AC   199 _ES	=	0x00ac
                           0000AF   200 _EA	=	0x00af
                           0000B0   201 _P3_0	=	0x00b0
                           0000B1   202 _P3_1	=	0x00b1
                           0000B2   203 _P3_2	=	0x00b2
                           0000B3   204 _P3_3	=	0x00b3
                           0000B4   205 _P3_4	=	0x00b4
                           0000B5   206 _P3_5	=	0x00b5
                           0000B6   207 _P3_6	=	0x00b6
                           0000B7   208 _P3_7	=	0x00b7
                           0000B0   209 _RXD	=	0x00b0
                           0000B1   210 _TXD	=	0x00b1
                           0000B2   211 _INT0	=	0x00b2
                           0000B3   212 _INT1	=	0x00b3
                           0000B4   213 _T0	=	0x00b4
                           0000B5   214 _T1	=	0x00b5
                           0000B6   215 _WR	=	0x00b6
                           0000B7   216 _RD	=	0x00b7
                           0000B8   217 _PX0	=	0x00b8
                           0000B9   218 _PT0	=	0x00b9
                           0000BA   219 _PX1	=	0x00ba
                           0000BB   220 _PT1	=	0x00bb
                           0000BC   221 _PS	=	0x00bc
                           0000D0   222 _P	=	0x00d0
                           0000D1   223 _F1	=	0x00d1
                           0000D2   224 _OV	=	0x00d2
                           0000D3   225 _RS0	=	0x00d3
                           0000D4   226 _RS1	=	0x00d4
                           0000D5   227 _F0	=	0x00d5
                           0000D6   228 _AC	=	0x00d6
                           0000D7   229 _CY	=	0x00d7
                                    230 ;--------------------------------------------------------
                                    231 ; overlayable register banks
                                    232 ;--------------------------------------------------------
                                    233 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        234 	.ds 8
                                    235 ;--------------------------------------------------------
                                    236 ; internal ram data
                                    237 ;--------------------------------------------------------
                                    238 	.area DSEG    (DATA)
      000008                        239 _minDahTimeMs::
      000008                        240 	.ds 2
      00000A                        241 _deltaT::
      00000A                        242 	.ds 2
      00000C                        243 _t::
      00000C                        244 	.ds 2
      00000E                        245 _state::
      00000E                        246 	.ds 1
      00000F                        247 _timeMeasured::
      00000F                        248 	.ds 8
      000017                        249 _dits::
      000017                        250 	.ds 2
      000019                        251 _empty::
      000019                        252 	.ds 2
      00001B                        253 _index::
      00001B                        254 	.ds 2
      00001D                        255 _lastChar::
      00001D                        256 	.ds 1
                                    257 ;--------------------------------------------------------
                                    258 ; overlayable items in internal ram 
                                    259 ;--------------------------------------------------------
                                    260 	.area	OSEG    (OVR,DATA)
      00002A                        261 _morse_cpy_PARM_2:
      00002A                        262 	.ds 3
                                    263 	.area	OSEG    (OVR,DATA)
                                    264 ;--------------------------------------------------------
                                    265 ; Stack segment in internal ram 
                                    266 ;--------------------------------------------------------
                                    267 	.area	SSEG
      00002D                        268 __start__stack:
      00002D                        269 	.ds	1
                                    270 
                                    271 ;--------------------------------------------------------
                                    272 ; indirectly addressable internal ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area ISEG    (DATA)
                                    275 ;--------------------------------------------------------
                                    276 ; absolute internal ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area IABS    (ABS,DATA)
                                    279 	.area IABS    (ABS,DATA)
                                    280 ;--------------------------------------------------------
                                    281 ; bit data
                                    282 ;--------------------------------------------------------
                                    283 	.area BSEG    (BIT)
                                    284 ;--------------------------------------------------------
                                    285 ; paged external ram data
                                    286 ;--------------------------------------------------------
                                    287 	.area PSEG    (PAG,XDATA)
                                    288 ;--------------------------------------------------------
                                    289 ; external ram data
                                    290 ;--------------------------------------------------------
                                    291 	.area XSEG    (XDATA)
                                    292 ;--------------------------------------------------------
                                    293 ; absolute external ram data
                                    294 ;--------------------------------------------------------
                                    295 	.area XABS    (ABS,XDATA)
                                    296 ;--------------------------------------------------------
                                    297 ; external initialized ram data
                                    298 ;--------------------------------------------------------
                                    299 	.area XISEG   (XDATA)
                                    300 	.area HOME    (CODE)
                                    301 	.area GSINIT0 (CODE)
                                    302 	.area GSINIT1 (CODE)
                                    303 	.area GSINIT2 (CODE)
                                    304 	.area GSINIT3 (CODE)
                                    305 	.area GSINIT4 (CODE)
                                    306 	.area GSINIT5 (CODE)
                                    307 	.area GSINIT  (CODE)
                                    308 	.area GSFINAL (CODE)
                                    309 	.area CSEG    (CODE)
                                    310 ;--------------------------------------------------------
                                    311 ; interrupt vector 
                                    312 ;--------------------------------------------------------
                                    313 	.area HOME    (CODE)
      000000                        314 __interrupt_vect:
      000000 02 00 11         [24]  315 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  316 	reti
      000004                        317 	.ds	7
      00000B 02 03 CD         [24]  318 	ljmp	_ISR_Timer0
                                    319 ;--------------------------------------------------------
                                    320 ; global & static initialisations
                                    321 ;--------------------------------------------------------
                                    322 	.area HOME    (CODE)
                                    323 	.area GSINIT  (CODE)
                                    324 	.area GSFINAL (CODE)
                                    325 	.area GSINIT  (CODE)
                                    326 	.globl __sdcc_gsinit_startup
                                    327 	.globl __sdcc_program_startup
                                    328 	.globl __start__stack
                                    329 	.globl __mcs51_genXINIT
                                    330 	.globl __mcs51_genXRAMCLEAR
                                    331 	.globl __mcs51_genRAMCLEAR
                                    332 ;	main.c:13: volatile uint16_t minDahTimeMs = 1000;
      00006A 75 08 E8         [24]  333 	mov	_minDahTimeMs,#0xe8
      00006D 75 09 03         [24]  334 	mov	(_minDahTimeMs + 1),#0x03
                                    335 ;	main.c:14: volatile uint16_t deltaT = 0;
      000070 E4               [12]  336 	clr	a
      000071 F5 0A            [12]  337 	mov	_deltaT,a
      000073 F5 0B            [12]  338 	mov	(_deltaT + 1),a
                                    339 ;	main.c:15: volatile uint16_t t = 0;
      000075 F5 0C            [12]  340 	mov	_t,a
      000077 F5 0D            [12]  341 	mov	(_t + 1),a
                                    342 ;	main.c:16: volatile TasterState state = UP;
      000079 75 0E 01         [24]  343 	mov	_state,#0x01
                                    344 ;	main.c:17: volatile uint64_t timeMeasured = 0;
      00007C F5 0F            [12]  345 	mov	_timeMeasured,a
      00007E F5 10            [12]  346 	mov	(_timeMeasured + 1),a
      000080 F5 11            [12]  347 	mov	(_timeMeasured + 2),a
      000082 F5 12            [12]  348 	mov	(_timeMeasured + 3),a
      000084 F5 13            [12]  349 	mov	(_timeMeasured + 4),a
      000086 F5 14            [12]  350 	mov	(_timeMeasured + 5),a
      000088 F5 15            [12]  351 	mov	(_timeMeasured + 6),a
      00008A F5 16            [12]  352 	mov	(_timeMeasured + 7),a
                                    353 ;	main.c:19: morse_t dits = {0};
                                    354 ;	1-genFromRTrack replaced	mov	_dits,#0x00
      00008C F5 17            [12]  355 	mov	_dits,a
                                    356 ;	main.c:20: morse_t empty = {0};
                                    357 ;	1-genFromRTrack replaced	mov	_empty,#0x00
      00008E F5 19            [12]  358 	mov	_empty,a
                                    359 ;	main.c:22: int index = 0;
      000090 F5 1B            [12]  360 	mov	_index,a
      000092 F5 1C            [12]  361 	mov	(_index + 1),a
                                    362 ;	main.c:23: char lastChar = '+';
      000094 75 1D 2B         [24]  363 	mov	_lastChar,#0x2b
                                    364 	.area GSFINAL (CODE)
      000097 02 00 0E         [24]  365 	ljmp	__sdcc_program_startup
                                    366 ;--------------------------------------------------------
                                    367 ; Home
                                    368 ;--------------------------------------------------------
                                    369 	.area HOME    (CODE)
                                    370 	.area HOME    (CODE)
      00000E                        371 __sdcc_program_startup:
      00000E 02 02 BA         [24]  372 	ljmp	_main
                                    373 ;	return from main will return to caller
                                    374 ;--------------------------------------------------------
                                    375 ; code
                                    376 ;--------------------------------------------------------
                                    377 	.area CSEG    (CODE)
                                    378 ;------------------------------------------------------------
                                    379 ;Allocation info for local variables in function 'morse_cpy'
                                    380 ;------------------------------------------------------------
                                    381 ;src                       Allocated with name '_morse_cpy_PARM_2'
                                    382 ;dest                      Allocated to registers r5 r6 r7 
                                    383 ;------------------------------------------------------------
                                    384 ;	morse.h:14: void morse_cpy(morse_t* dest, morse_t* src) {
                                    385 ;	-----------------------------------------
                                    386 ;	 function morse_cpy
                                    387 ;	-----------------------------------------
      00009A                        388 _morse_cpy:
                           000007   389 	ar7 = 0x07
                           000006   390 	ar6 = 0x06
                           000005   391 	ar5 = 0x05
                           000004   392 	ar4 = 0x04
                           000003   393 	ar3 = 0x03
                           000002   394 	ar2 = 0x02
                           000001   395 	ar1 = 0x01
                           000000   396 	ar0 = 0x00
      00009A AD 82            [24]  397 	mov	r5,dpl
      00009C AE 83            [24]  398 	mov	r6,dph
      00009E AF F0            [24]  399 	mov	r7,b
                                    400 ;	morse.h:15: dest->pattern = src->pattern;
      0000A0 AA 2A            [24]  401 	mov	r2,_morse_cpy_PARM_2
      0000A2 AB 2B            [24]  402 	mov	r3,(_morse_cpy_PARM_2 + 1)
      0000A4 AC 2C            [24]  403 	mov	r4,(_morse_cpy_PARM_2 + 2)
      0000A6 8A 82            [24]  404 	mov	dpl,r2
      0000A8 8B 83            [24]  405 	mov	dph,r3
      0000AA 8C F0            [24]  406 	mov	b,r4
      0000AC 12 09 30         [24]  407 	lcall	__gptrget
      0000AF 8D 82            [24]  408 	mov	dpl,r5
      0000B1 8E 83            [24]  409 	mov	dph,r6
      0000B3 8F F0            [24]  410 	mov	b,r7
      0000B5 12 09 15         [24]  411 	lcall	__gptrput
                                    412 ;	morse.h:16: dest->size = src->size;
      0000B8 0D               [12]  413 	inc	r5
      0000B9 BD 00 01         [24]  414 	cjne	r5,#0x00,00103$
      0000BC 0E               [12]  415 	inc	r6
      0000BD                        416 00103$:
      0000BD 0A               [12]  417 	inc	r2
      0000BE BA 00 01         [24]  418 	cjne	r2,#0x00,00104$
      0000C1 0B               [12]  419 	inc	r3
      0000C2                        420 00104$:
      0000C2 8A 82            [24]  421 	mov	dpl,r2
      0000C4 8B 83            [24]  422 	mov	dph,r3
      0000C6 8C F0            [24]  423 	mov	b,r4
      0000C8 12 09 30         [24]  424 	lcall	__gptrget
      0000CB 8D 82            [24]  425 	mov	dpl,r5
      0000CD 8E 83            [24]  426 	mov	dph,r6
      0000CF 8F F0            [24]  427 	mov	b,r7
                                    428 ;	morse.h:17: }
      0000D1 02 09 15         [24]  429 	ljmp	__gptrput
                                    430 ;------------------------------------------------------------
                                    431 ;Allocation info for local variables in function 'ditsToChar'
                                    432 ;------------------------------------------------------------
                                    433 ;dits                      Allocated to registers r6 r5 r7 
                                    434 ;------------------------------------------------------------
                                    435 ;	main.c:25: char ditsToChar(morse_t* dits) {
                                    436 ;	-----------------------------------------
                                    437 ;	 function ditsToChar
                                    438 ;	-----------------------------------------
      0000D4                        439 _ditsToChar:
                                    440 ;	main.c:26: switch(*(uint16_t *) dits) {
      0000D4 AD 83            [24]  441 	mov	r5,dph
      0000D6 12 09 30         [24]  442 	lcall	__gptrget
      0000D9 FE               [12]  443 	mov	r6,a
      0000DA A3               [24]  444 	inc	dptr
      0000DB 12 09 30         [24]  445 	lcall	__gptrget
      0000DE FF               [12]  446 	mov	r7,a
      0000DF BE 00 06         [24]  447 	cjne	r6,#0x00,00285$
      0000E2 BF 01 03         [24]  448 	cjne	r7,#0x01,00285$
      0000E5 02 02 36         [24]  449 	ljmp	00105$
      0000E8                        450 00285$:
      0000E8 BE 80 06         [24]  451 	cjne	r6,#0x80,00286$
      0000EB BF 01 03         [24]  452 	cjne	r7,#0x01,00286$
      0000EE 02 02 72         [24]  453 	ljmp	00120$
      0000F1                        454 00286$:
      0000F1 BE 00 06         [24]  455 	cjne	r6,#0x00,00287$
      0000F4 BF 02 03         [24]  456 	cjne	r7,#0x02,00287$
      0000F7 02 02 46         [24]  457 	ljmp	00109$
      0000FA                        458 00287$:
      0000FA BE 40 06         [24]  459 	cjne	r6,#0x40,00288$
      0000FD BF 02 03         [24]  460 	cjne	r7,#0x02,00288$
      000100 02 02 26         [24]  461 	ljmp	00101$
      000103                        462 00288$:
      000103 BE 80 06         [24]  463 	cjne	r6,#0x80,00289$
      000106 BF 02 03         [24]  464 	cjne	r7,#0x02,00289$
      000109 02 02 5A         [24]  465 	ljmp	00114$
      00010C                        466 00289$:
      00010C BE C0 06         [24]  467 	cjne	r6,#0xc0,00290$
      00010F BF 02 03         [24]  468 	cjne	r7,#0x02,00290$
      000112 02 02 56         [24]  469 	ljmp	00113$
      000115                        470 00290$:
      000115 BE 00 06         [24]  471 	cjne	r6,#0x00,00291$
      000118 BF 03 03         [24]  472 	cjne	r7,#0x03,00291$
      00011B 02 02 6E         [24]  473 	ljmp	00119$
      00011E                        474 00291$:
      00011E BE 20 06         [24]  475 	cjne	r6,#0x20,00292$
      000121 BF 03 03         [24]  476 	cjne	r7,#0x03,00292$
      000124 02 02 76         [24]  477 	ljmp	00121$
      000127                        478 00292$:
      000127 BE 40 06         [24]  479 	cjne	r6,#0x40,00293$
      00012A BF 03 03         [24]  480 	cjne	r7,#0x03,00293$
      00012D 02 02 6A         [24]  481 	ljmp	00118$
      000130                        482 00293$:
      000130 BE 60 06         [24]  483 	cjne	r6,#0x60,00294$
      000133 BF 03 03         [24]  484 	cjne	r7,#0x03,00294$
      000136 02 02 7E         [24]  485 	ljmp	00123$
      000139                        486 00294$:
      000139 BE 80 06         [24]  487 	cjne	r6,#0x80,00295$
      00013C BF 03 03         [24]  488 	cjne	r7,#0x03,00295$
      00013F 02 02 32         [24]  489 	ljmp	00104$
      000142                        490 00295$:
      000142 BE A0 06         [24]  491 	cjne	r6,#0xa0,00296$
      000145 BF 03 03         [24]  492 	cjne	r7,#0x03,00296$
      000148 02 02 4E         [24]  493 	ljmp	00111$
      00014B                        494 00296$:
      00014B BE C0 06         [24]  495 	cjne	r6,#0xc0,00297$
      00014E BF 03 03         [24]  496 	cjne	r7,#0x03,00297$
      000151 02 02 3E         [24]  497 	ljmp	00107$
      000154                        498 00297$:
      000154 BE E0 06         [24]  499 	cjne	r6,#0xe0,00298$
      000157 BF 03 03         [24]  500 	cjne	r7,#0x03,00298$
      00015A 02 02 5E         [24]  501 	ljmp	00115$
      00015D                        502 00298$:
      00015D BE 00 06         [24]  503 	cjne	r6,#0x00,00299$
      000160 BF 04 03         [24]  504 	cjne	r7,#0x04,00299$
      000163 02 02 42         [24]  505 	ljmp	00108$
      000166                        506 00299$:
      000166 BE 10 06         [24]  507 	cjne	r6,#0x10,00300$
      000169 BF 04 03         [24]  508 	cjne	r7,#0x04,00300$
      00016C 02 02 7A         [24]  509 	ljmp	00122$
      00016F                        510 00300$:
      00016F BE 20 06         [24]  511 	cjne	r6,#0x20,00301$
      000172 BF 04 03         [24]  512 	cjne	r7,#0x04,00301$
      000175 02 02 3A         [24]  513 	ljmp	00106$
      000178                        514 00301$:
      000178 BE 40 06         [24]  515 	cjne	r6,#0x40,00302$
      00017B BF 04 03         [24]  516 	cjne	r7,#0x04,00302$
      00017E 02 02 52         [24]  517 	ljmp	00112$
      000181                        518 00302$:
      000181 BE 60 06         [24]  519 	cjne	r6,#0x60,00303$
      000184 BF 04 03         [24]  520 	cjne	r7,#0x04,00303$
      000187 02 02 62         [24]  521 	ljmp	00116$
      00018A                        522 00303$:
      00018A BE 70 06         [24]  523 	cjne	r6,#0x70,00304$
      00018D BF 04 03         [24]  524 	cjne	r7,#0x04,00304$
      000190 02 02 4A         [24]  525 	ljmp	00110$
      000193                        526 00304$:
      000193 BE 80 06         [24]  527 	cjne	r6,#0x80,00305$
      000196 BF 04 03         [24]  528 	cjne	r7,#0x04,00305$
      000199 02 02 2A         [24]  529 	ljmp	00102$
      00019C                        530 00305$:
      00019C BE 90 06         [24]  531 	cjne	r6,#0x90,00306$
      00019F BF 04 03         [24]  532 	cjne	r7,#0x04,00306$
      0001A2 02 02 82         [24]  533 	ljmp	00124$
      0001A5                        534 00306$:
      0001A5 BE A0 06         [24]  535 	cjne	r6,#0xa0,00307$
      0001A8 BF 04 03         [24]  536 	cjne	r7,#0x04,00307$
      0001AB 02 02 2E         [24]  537 	ljmp	00103$
      0001AE                        538 00307$:
      0001AE BE B0 06         [24]  539 	cjne	r6,#0xb0,00308$
      0001B1 BF 04 03         [24]  540 	cjne	r7,#0x04,00308$
      0001B4 02 02 86         [24]  541 	ljmp	00125$
      0001B7                        542 00308$:
      0001B7 BE C0 06         [24]  543 	cjne	r6,#0xc0,00309$
      0001BA BF 04 03         [24]  544 	cjne	r7,#0x04,00309$
      0001BD 02 02 8A         [24]  545 	ljmp	00126$
      0001C0                        546 00309$:
      0001C0 BE D0 06         [24]  547 	cjne	r6,#0xd0,00310$
      0001C3 BF 04 03         [24]  548 	cjne	r7,#0x04,00310$
      0001C6 02 02 66         [24]  549 	ljmp	00117$
      0001C9                        550 00310$:
      0001C9 BE 00 06         [24]  551 	cjne	r6,#0x00,00311$
      0001CC BF 05 03         [24]  552 	cjne	r7,#0x05,00311$
      0001CF 02 02 A2         [24]  553 	ljmp	00132$
      0001D2                        554 00311$:
      0001D2 BE 08 06         [24]  555 	cjne	r6,#0x08,00312$
      0001D5 BF 05 03         [24]  556 	cjne	r7,#0x05,00312$
      0001D8 02 02 9E         [24]  557 	ljmp	00131$
      0001DB                        558 00312$:
      0001DB BE 18 06         [24]  559 	cjne	r6,#0x18,00313$
      0001DE BF 05 03         [24]  560 	cjne	r7,#0x05,00313$
      0001E1 02 02 9A         [24]  561 	ljmp	00130$
      0001E4                        562 00313$:
      0001E4 BE 38 06         [24]  563 	cjne	r6,#0x38,00314$
      0001E7 BF 05 03         [24]  564 	cjne	r7,#0x05,00314$
      0001EA 02 02 96         [24]  565 	ljmp	00129$
      0001ED                        566 00314$:
      0001ED BE 78 06         [24]  567 	cjne	r6,#0x78,00315$
      0001F0 BF 05 03         [24]  568 	cjne	r7,#0x05,00315$
      0001F3 02 02 92         [24]  569 	ljmp	00128$
      0001F6                        570 00315$:
      0001F6 BE 80 06         [24]  571 	cjne	r6,#0x80,00316$
      0001F9 BF 05 03         [24]  572 	cjne	r7,#0x05,00316$
      0001FC 02 02 A6         [24]  573 	ljmp	00133$
      0001FF                        574 00316$:
      0001FF BE C0 06         [24]  575 	cjne	r6,#0xc0,00317$
      000202 BF 05 03         [24]  576 	cjne	r7,#0x05,00317$
      000205 02 02 AA         [24]  577 	ljmp	00134$
      000208                        578 00317$:
      000208 BE E0 06         [24]  579 	cjne	r6,#0xe0,00318$
      00020B BF 05 03         [24]  580 	cjne	r7,#0x05,00318$
      00020E 02 02 AE         [24]  581 	ljmp	00135$
      000211                        582 00318$:
      000211 BE F0 06         [24]  583 	cjne	r6,#0xf0,00319$
      000214 BF 05 03         [24]  584 	cjne	r7,#0x05,00319$
      000217 02 02 B2         [24]  585 	ljmp	00136$
      00021A                        586 00319$:
      00021A BE F8 06         [24]  587 	cjne	r6,#0xf8,00320$
      00021D BF 05 03         [24]  588 	cjne	r7,#0x05,00320$
      000220 02 02 8E         [24]  589 	ljmp	00127$
      000223                        590 00320$:
      000223 02 02 B6         [24]  591 	ljmp	00137$
                                    592 ;	main.c:27: case U_MORSE_A: return 'A';
      000226                        593 00101$:
      000226 75 82 41         [24]  594 	mov	dpl,#0x41
      000229 22               [24]  595 	ret
                                    596 ;	main.c:29: case U_MORSE_B: return 'B';
      00022A                        597 00102$:
      00022A 75 82 42         [24]  598 	mov	dpl,#0x42
      00022D 22               [24]  599 	ret
                                    600 ;	main.c:31: case U_MORSE_C: return 'C';
      00022E                        601 00103$:
      00022E 75 82 43         [24]  602 	mov	dpl,#0x43
      000231 22               [24]  603 	ret
                                    604 ;	main.c:33: case U_MORSE_D: return 'D';
      000232                        605 00104$:
      000232 75 82 44         [24]  606 	mov	dpl,#0x44
      000235 22               [24]  607 	ret
                                    608 ;	main.c:35: case U_MORSE_E: return 'E';
      000236                        609 00105$:
      000236 75 82 45         [24]  610 	mov	dpl,#0x45
      000239 22               [24]  611 	ret
                                    612 ;	main.c:37: case U_MORSE_F: return 'F';
      00023A                        613 00106$:
      00023A 75 82 46         [24]  614 	mov	dpl,#0x46
      00023D 22               [24]  615 	ret
                                    616 ;	main.c:39: case U_MORSE_G: return 'G';
      00023E                        617 00107$:
      00023E 75 82 47         [24]  618 	mov	dpl,#0x47
      000241 22               [24]  619 	ret
                                    620 ;	main.c:41: case U_MORSE_H: return 'H';
      000242                        621 00108$:
      000242 75 82 48         [24]  622 	mov	dpl,#0x48
      000245 22               [24]  623 	ret
                                    624 ;	main.c:43: case U_MORSE_I: return 'I';
      000246                        625 00109$:
      000246 75 82 49         [24]  626 	mov	dpl,#0x49
      000249 22               [24]  627 	ret
                                    628 ;	main.c:45: case U_MORSE_J: return 'J';
      00024A                        629 00110$:
      00024A 75 82 4A         [24]  630 	mov	dpl,#0x4a
      00024D 22               [24]  631 	ret
                                    632 ;	main.c:47: case U_MORSE_K: return 'K';
      00024E                        633 00111$:
      00024E 75 82 4B         [24]  634 	mov	dpl,#0x4b
      000251 22               [24]  635 	ret
                                    636 ;	main.c:49: case U_MORSE_L: return 'L';
      000252                        637 00112$:
      000252 75 82 4C         [24]  638 	mov	dpl,#0x4c
      000255 22               [24]  639 	ret
                                    640 ;	main.c:51: case U_MORSE_M: return 'M';
      000256                        641 00113$:
      000256 75 82 4D         [24]  642 	mov	dpl,#0x4d
      000259 22               [24]  643 	ret
                                    644 ;	main.c:53: case U_MORSE_N: return 'N';
      00025A                        645 00114$:
      00025A 75 82 4E         [24]  646 	mov	dpl,#0x4e
      00025D 22               [24]  647 	ret
                                    648 ;	main.c:55: case U_MORSE_O: return 'O';
      00025E                        649 00115$:
      00025E 75 82 4F         [24]  650 	mov	dpl,#0x4f
      000261 22               [24]  651 	ret
                                    652 ;	main.c:57: case U_MORSE_P: return 'P';
      000262                        653 00116$:
      000262 75 82 50         [24]  654 	mov	dpl,#0x50
                                    655 ;	main.c:59: case U_MORSE_Q: return 'Q';
      000265 22               [24]  656 	ret
      000266                        657 00117$:
      000266 75 82 51         [24]  658 	mov	dpl,#0x51
                                    659 ;	main.c:61: case U_MORSE_R: return 'R';
      000269 22               [24]  660 	ret
      00026A                        661 00118$:
      00026A 75 82 52         [24]  662 	mov	dpl,#0x52
                                    663 ;	main.c:63: case U_MORSE_S: return 'S';
      00026D 22               [24]  664 	ret
      00026E                        665 00119$:
      00026E 75 82 53         [24]  666 	mov	dpl,#0x53
                                    667 ;	main.c:65: case U_MORSE_T: return 'T';
      000271 22               [24]  668 	ret
      000272                        669 00120$:
      000272 75 82 54         [24]  670 	mov	dpl,#0x54
                                    671 ;	main.c:67: case U_MORSE_U: return 'U';
      000275 22               [24]  672 	ret
      000276                        673 00121$:
      000276 75 82 55         [24]  674 	mov	dpl,#0x55
                                    675 ;	main.c:69: case U_MORSE_V: return 'V';
      000279 22               [24]  676 	ret
      00027A                        677 00122$:
      00027A 75 82 56         [24]  678 	mov	dpl,#0x56
                                    679 ;	main.c:71: case U_MORSE_W: return 'W';
      00027D 22               [24]  680 	ret
      00027E                        681 00123$:
      00027E 75 82 57         [24]  682 	mov	dpl,#0x57
                                    683 ;	main.c:73: case U_MORSE_X: return 'X';
      000281 22               [24]  684 	ret
      000282                        685 00124$:
      000282 75 82 58         [24]  686 	mov	dpl,#0x58
                                    687 ;	main.c:75: case U_MORSE_Y: return 'Y';
      000285 22               [24]  688 	ret
      000286                        689 00125$:
      000286 75 82 59         [24]  690 	mov	dpl,#0x59
                                    691 ;	main.c:77: case U_MORSE_Z: return 'Z';
      000289 22               [24]  692 	ret
      00028A                        693 00126$:
      00028A 75 82 5A         [24]  694 	mov	dpl,#0x5a
                                    695 ;	main.c:81: case U_MORSE_0: return '0';
      00028D 22               [24]  696 	ret
      00028E                        697 00127$:
      00028E 75 82 30         [24]  698 	mov	dpl,#0x30
                                    699 ;	main.c:83: case U_MORSE_1: return '1';
      000291 22               [24]  700 	ret
      000292                        701 00128$:
      000292 75 82 31         [24]  702 	mov	dpl,#0x31
                                    703 ;	main.c:85: case U_MORSE_2: return '2';
      000295 22               [24]  704 	ret
      000296                        705 00129$:
      000296 75 82 32         [24]  706 	mov	dpl,#0x32
                                    707 ;	main.c:87: case U_MORSE_3: return '3';
      000299 22               [24]  708 	ret
      00029A                        709 00130$:
      00029A 75 82 33         [24]  710 	mov	dpl,#0x33
                                    711 ;	main.c:89: case U_MORSE_4: return '4';
      00029D 22               [24]  712 	ret
      00029E                        713 00131$:
      00029E 75 82 34         [24]  714 	mov	dpl,#0x34
                                    715 ;	main.c:91: case U_MORSE_5: return '5';
      0002A1 22               [24]  716 	ret
      0002A2                        717 00132$:
      0002A2 75 82 35         [24]  718 	mov	dpl,#0x35
                                    719 ;	main.c:93: case U_MORSE_6: return '6';
      0002A5 22               [24]  720 	ret
      0002A6                        721 00133$:
      0002A6 75 82 36         [24]  722 	mov	dpl,#0x36
                                    723 ;	main.c:95: case U_MORSE_7: return '7';
      0002A9 22               [24]  724 	ret
      0002AA                        725 00134$:
      0002AA 75 82 37         [24]  726 	mov	dpl,#0x37
                                    727 ;	main.c:97: case U_MORSE_8: return '8';
      0002AD 22               [24]  728 	ret
      0002AE                        729 00135$:
      0002AE 75 82 38         [24]  730 	mov	dpl,#0x38
                                    731 ;	main.c:99: case U_MORSE_9: return '9';
      0002B1 22               [24]  732 	ret
      0002B2                        733 00136$:
      0002B2 75 82 39         [24]  734 	mov	dpl,#0x39
                                    735 ;	main.c:102: default:
      0002B5 22               [24]  736 	ret
      0002B6                        737 00137$:
                                    738 ;	main.c:103: return '+';
      0002B6 75 82 2B         [24]  739 	mov	dpl,#0x2b
                                    740 ;	main.c:106: return '+';
                                    741 ;	main.c:107: }
      0002B9 22               [24]  742 	ret
                                    743 ;------------------------------------------------------------
                                    744 ;Allocation info for local variables in function 'main'
                                    745 ;------------------------------------------------------------
                                    746 ;	main.c:111: int main() {
                                    747 ;	-----------------------------------------
                                    748 ;	 function main
                                    749 ;	-----------------------------------------
      0002BA                        750 _main:
                                    751 ;	main.c:112: matrix_setup();
      0002BA 12 08 C0         [24]  752 	lcall	_matrix_setup
                                    753 ;	main.c:114: TMOD = 0x01;
      0002BD 75 89 01         [24]  754 	mov	_TMOD,#0x01
                                    755 ;	main.c:115: TH0 = 0xFC;
      0002C0 75 8C FC         [24]  756 	mov	_TH0,#0xfc
                                    757 ;	main.c:116: TL0 = 0x18;
      0002C3 75 8A 18         [24]  758 	mov	_TL0,#0x18
                                    759 ;	main.c:118: ET0=1;
                                    760 ;	assignBit
      0002C6 D2 A9            [12]  761 	setb	_ET0
                                    762 ;	main.c:119: EA=1;
                                    763 ;	assignBit
      0002C8 D2 AF            [12]  764 	setb	_EA
                                    765 ;	main.c:120: TR0 = 1;
                                    766 ;	assignBit
      0002CA D2 8C            [12]  767 	setb	_TR0
                                    768 ;	main.c:122: morse_cpy(&dits, &empty);
      0002CC 75 2A 19         [24]  769 	mov	_morse_cpy_PARM_2,#_empty
      0002CF 75 2B 00         [24]  770 	mov	(_morse_cpy_PARM_2 + 1),#0x00
      0002D2 75 2C 40         [24]  771 	mov	(_morse_cpy_PARM_2 + 2),#0x40
      0002D5 90 00 17         [24]  772 	mov	dptr,#_dits
      0002D8 75 F0 40         [24]  773 	mov	b,#0x40
      0002DB 12 00 9A         [24]  774 	lcall	_morse_cpy
                                    775 ;	main.c:124: while(1) {
      0002DE                        776 00102$:
                                    777 ;	main.c:125: loop();
      0002DE 12 02 E3         [24]  778 	lcall	_loop
                                    779 ;	main.c:127: }
      0002E1 80 FB            [24]  780 	sjmp	00102$
                                    781 ;------------------------------------------------------------
                                    782 ;Allocation info for local variables in function 'loop'
                                    783 ;------------------------------------------------------------
                                    784 ;	main.c:129: void loop() {
                                    785 ;	-----------------------------------------
                                    786 ;	 function loop
                                    787 ;	-----------------------------------------
      0002E3                        788 _loop:
                                    789 ;	main.c:131: if (deltaT != 0) {
      0002E3 E5 0A            [12]  790 	mov	a,_deltaT
      0002E5 45 0B            [12]  791 	orl	a,(_deltaT + 1)
      0002E7 70 03            [24]  792 	jnz	00146$
      0002E9 02 03 7D         [24]  793 	ljmp	00109$
      0002EC                        794 00146$:
                                    795 ;	main.c:132: if (state == UP) {
      0002EC 74 01            [12]  796 	mov	a,#0x01
      0002EE B5 0E 02         [24]  797 	cjne	a,_state,00147$
      0002F1 80 03            [24]  798 	sjmp	00148$
      0002F3                        799 00147$:
      0002F3 02 03 78         [24]  800 	ljmp	00107$
      0002F6                        801 00148$:
                                    802 ;	main.c:133: if (deltaT < minDahTimeMs) {
      0002F6 C3               [12]  803 	clr	c
      0002F7 E5 0A            [12]  804 	mov	a,_deltaT
      0002F9 95 08            [12]  805 	subb	a,_minDahTimeMs
      0002FB E5 0B            [12]  806 	mov	a,(_deltaT + 1)
      0002FD 95 09            [12]  807 	subb	a,(_minDahTimeMs + 1)
      0002FF 50 20            [24]  808 	jnc	00102$
                                    809 ;	main.c:134: dits.pattern = dits.pattern & (0xFF - (1 << (7 - index)));
      000301 AF 1B            [24]  810 	mov	r7,_index
      000303 74 07            [12]  811 	mov	a,#0x07
      000305 C3               [12]  812 	clr	c
      000306 9F               [12]  813 	subb	a,r7
      000307 F5 F0            [12]  814 	mov	b,a
      000309 05 F0            [12]  815 	inc	b
      00030B 74 01            [12]  816 	mov	a,#0x01
      00030D 80 02            [24]  817 	sjmp	00152$
      00030F                        818 00150$:
      00030F 25 E0            [12]  819 	add	a,acc
      000311                        820 00152$:
      000311 D5 F0 FB         [24]  821 	djnz	b,00150$
      000314 FF               [12]  822 	mov	r7,a
      000315 74 FF            [12]  823 	mov	a,#0xff
      000317 C3               [12]  824 	clr	c
      000318 9F               [12]  825 	subb	a,r7
      000319 FF               [12]  826 	mov	r7,a
      00031A AE 17            [24]  827 	mov	r6,_dits
      00031C 5E               [12]  828 	anl	a,r6
      00031D F5 17            [12]  829 	mov	_dits,a
      00031F 80 19            [24]  830 	sjmp	00103$
      000321                        831 00102$:
                                    832 ;	main.c:136: dits.pattern = dits.pattern | (1 << (7-index));
      000321 AF 1B            [24]  833 	mov	r7,_index
      000323 74 07            [12]  834 	mov	a,#0x07
      000325 C3               [12]  835 	clr	c
      000326 9F               [12]  836 	subb	a,r7
      000327 F5 F0            [12]  837 	mov	b,a
      000329 05 F0            [12]  838 	inc	b
      00032B 74 01            [12]  839 	mov	a,#0x01
      00032D 80 02            [24]  840 	sjmp	00155$
      00032F                        841 00153$:
      00032F 25 E0            [12]  842 	add	a,acc
      000331                        843 00155$:
      000331 D5 F0 FB         [24]  844 	djnz	b,00153$
      000334 FF               [12]  845 	mov	r7,a
      000335 AE 17            [24]  846 	mov	r6,_dits
      000337 4E               [12]  847 	orl	a,r6
      000338 F5 17            [12]  848 	mov	_dits,a
      00033A                        849 00103$:
                                    850 ;	main.c:139: dits.size++;
      00033A E5 18            [12]  851 	mov	a,(_dits + 0x0001)
      00033C FF               [12]  852 	mov	r7,a
      00033D 04               [12]  853 	inc	a
      00033E F5 18            [12]  854 	mov	(_dits + 0x0001),a
                                    855 ;	main.c:140: index++;
      000340 05 1B            [12]  856 	inc	_index
      000342 E4               [12]  857 	clr	a
      000343 B5 1B 02         [24]  858 	cjne	a,_index,00156$
      000346 05 1C            [12]  859 	inc	(_index + 1)
      000348                        860 00156$:
                                    861 ;	main.c:141: if (index == 5) {
      000348 74 05            [12]  862 	mov	a,#0x05
      00034A B5 1B 06         [24]  863 	cjne	a,_index,00157$
      00034D E4               [12]  864 	clr	a
      00034E B5 1C 02         [24]  865 	cjne	a,(_index + 1),00157$
      000351 80 02            [24]  866 	sjmp	00158$
      000353                        867 00157$:
      000353 80 23            [24]  868 	sjmp	00107$
      000355                        869 00158$:
                                    870 ;	main.c:142: lastChar = ditsToChar(&dits);
      000355 90 00 17         [24]  871 	mov	dptr,#_dits
      000358 75 F0 40         [24]  872 	mov	b,#0x40
      00035B 12 00 D4         [24]  873 	lcall	_ditsToChar
      00035E 85 82 1D         [24]  874 	mov	_lastChar,dpl
                                    875 ;	main.c:143: morse_cpy(&dits, &empty);
      000361 75 2A 19         [24]  876 	mov	_morse_cpy_PARM_2,#_empty
      000364 75 2B 00         [24]  877 	mov	(_morse_cpy_PARM_2 + 1),#0x00
      000367 75 2C 40         [24]  878 	mov	(_morse_cpy_PARM_2 + 2),#0x40
      00036A 90 00 17         [24]  879 	mov	dptr,#_dits
      00036D 75 F0 40         [24]  880 	mov	b,#0x40
      000370 12 00 9A         [24]  881 	lcall	_morse_cpy
                                    882 ;	main.c:144: index = 0;
      000373 E4               [12]  883 	clr	a
      000374 F5 1B            [12]  884 	mov	_index,a
      000376 F5 1C            [12]  885 	mov	(_index + 1),a
      000378                        886 00107$:
                                    887 ;	main.c:148: deltaT = 0;
      000378 E4               [12]  888 	clr	a
      000379 F5 0A            [12]  889 	mov	_deltaT,a
      00037B F5 0B            [12]  890 	mov	(_deltaT + 1),a
      00037D                        891 00109$:
                                    892 ;	main.c:151: if (state == UP) {
      00037D 74 01            [12]  893 	mov	a,#0x01
      00037F B5 0E 45         [24]  894 	cjne	a,_state,00115$
                                    895 ;	main.c:152: if (t >= minDahTimeMs) {
      000382 C3               [12]  896 	clr	c
      000383 E5 0C            [12]  897 	mov	a,_t
      000385 95 08            [12]  898 	subb	a,_minDahTimeMs
      000387 E5 0D            [12]  899 	mov	a,(_t + 1)
      000389 95 09            [12]  900 	subb	a,(_minDahTimeMs + 1)
                                    901 ;	main.c:154: if (index > 0) {
      00038B 40 3A            [24]  902 	jc	00115$
      00038D E4               [12]  903 	clr	a
      00038E 95 1B            [12]  904 	subb	a,_index
      000390 74 80            [12]  905 	mov	a,#(0x00 ^ 0x80)
      000392 85 1C F0         [24]  906 	mov	b,(_index + 1)
      000395 63 F0 80         [24]  907 	xrl	b,#0x80
      000398 95 F0            [12]  908 	subb	a,b
      00039A 50 0C            [24]  909 	jnc	00111$
                                    910 ;	main.c:155: lastChar = ditsToChar(&dits);
      00039C 90 00 17         [24]  911 	mov	dptr,#_dits
      00039F 75 F0 40         [24]  912 	mov	b,#0x40
      0003A2 12 00 D4         [24]  913 	lcall	_ditsToChar
      0003A5 85 82 1D         [24]  914 	mov	_lastChar,dpl
      0003A8                        915 00111$:
                                    916 ;	main.c:157: morse_cpy(&dits, &empty);
      0003A8 75 2A 19         [24]  917 	mov	_morse_cpy_PARM_2,#_empty
      0003AB 75 2B 00         [24]  918 	mov	(_morse_cpy_PARM_2 + 1),#0x00
      0003AE 75 2C 40         [24]  919 	mov	(_morse_cpy_PARM_2 + 2),#0x40
      0003B1 90 00 17         [24]  920 	mov	dptr,#_dits
      0003B4 75 F0 40         [24]  921 	mov	b,#0x40
      0003B7 12 00 9A         [24]  922 	lcall	_morse_cpy
                                    923 ;	main.c:159: index = 0;
      0003BA E4               [12]  924 	clr	a
      0003BB F5 1B            [12]  925 	mov	_index,a
      0003BD F5 1C            [12]  926 	mov	(_index + 1),a
                                    927 ;	main.c:161: deltaT = 0;
      0003BF F5 0A            [12]  928 	mov	_deltaT,a
      0003C1 F5 0B            [12]  929 	mov	(_deltaT + 1),a
                                    930 ;	main.c:162: t = 0;
      0003C3 F5 0C            [12]  931 	mov	_t,a
      0003C5 F5 0D            [12]  932 	mov	(_t + 1),a
      0003C7                        933 00115$:
                                    934 ;	main.c:166: matrix_draw(lastChar);
      0003C7 85 1D 82         [24]  935 	mov	dpl,_lastChar
                                    936 ;	main.c:167: }
      0003CA 02 07 FD         [24]  937 	ljmp	_matrix_draw
                                    938 ;------------------------------------------------------------
                                    939 ;Allocation info for local variables in function 'ISR_Timer0'
                                    940 ;------------------------------------------------------------
                                    941 ;	main.c:169: void ISR_Timer0(void) __interrupt 1 {
                                    942 ;	-----------------------------------------
                                    943 ;	 function ISR_Timer0
                                    944 ;	-----------------------------------------
      0003CD                        945 _ISR_Timer0:
      0003CD C0 E0            [24]  946 	push	acc
      0003CF C0 D0            [24]  947 	push	psw
                                    948 ;	main.c:170: TH0 = 0xFC;
      0003D1 75 8C FC         [24]  949 	mov	_TH0,#0xfc
                                    950 ;	main.c:171: TL0 = 0x18;
      0003D4 75 8A 18         [24]  951 	mov	_TL0,#0x18
                                    952 ;	main.c:173: t++;
      0003D7 74 01            [12]  953 	mov	a,#0x01
      0003D9 25 0C            [12]  954 	add	a,_t
      0003DB F5 0C            [12]  955 	mov	_t,a
      0003DD E4               [12]  956 	clr	a
      0003DE 35 0D            [12]  957 	addc	a,(_t + 1)
      0003E0 F5 0D            [12]  958 	mov	(_t + 1),a
                                    959 ;	main.c:175: if (state == UP) {
      0003E2 74 01            [12]  960 	mov	a,#0x01
      0003E4 B5 0E 13         [24]  961 	cjne	a,_state,00106$
                                    962 ;	main.c:176: if (P3_2 == 0) {
      0003E7 20 B2 21         [24]  963 	jb	_P3_2,00108$
                                    964 ;	main.c:177: state = DOWN;
      0003EA 75 0E 00         [24]  965 	mov	_state,#0x00
                                    966 ;	main.c:178: deltaT = t;
      0003ED 85 0C 0A         [24]  967 	mov	_deltaT,_t
      0003F0 85 0D 0B         [24]  968 	mov	(_deltaT + 1),(_t + 1)
                                    969 ;	main.c:179: t=0;
      0003F3 E4               [12]  970 	clr	a
      0003F4 F5 0C            [12]  971 	mov	_t,a
      0003F6 F5 0D            [12]  972 	mov	(_t + 1),a
      0003F8 80 11            [24]  973 	sjmp	00108$
      0003FA                        974 00106$:
                                    975 ;	main.c:183: if (P3_2 == 1) {
      0003FA 30 B2 0E         [24]  976 	jnb	_P3_2,00108$
                                    977 ;	main.c:184: state = UP;
      0003FD 75 0E 01         [24]  978 	mov	_state,#0x01
                                    979 ;	main.c:185: deltaT = t;
      000400 85 0C 0A         [24]  980 	mov	_deltaT,_t
      000403 85 0D 0B         [24]  981 	mov	(_deltaT + 1),(_t + 1)
                                    982 ;	main.c:186: t=0;
      000406 E4               [12]  983 	clr	a
      000407 F5 0C            [12]  984 	mov	_t,a
      000409 F5 0D            [12]  985 	mov	(_t + 1),a
      00040B                        986 00108$:
                                    987 ;	main.c:189: }
      00040B D0 D0            [24]  988 	pop	psw
      00040D D0 E0            [24]  989 	pop	acc
      00040F 32               [24]  990 	reti
                                    991 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    992 ;	eliminated unneeded push/pop dpl
                                    993 ;	eliminated unneeded push/pop dph
                                    994 ;	eliminated unneeded push/pop b
                                    995 	.area CSEG    (CODE)
                                    996 	.area CONST   (CODE)
                                    997 	.area XINIT   (CODE)
                                    998 	.area CABS    (ABS,CODE)
