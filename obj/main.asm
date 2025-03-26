;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _InputRead
	.globl _InputJustPressed
	.globl _vsync
	.globl _framecount
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_framecount::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:9: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:12: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/main.c:13: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:16: while(1) {
00104$:
;src/main.c:19: if (InputJustPressed(J_RIGHT)) {scroll_bkg(1, 0);}
	ld	a, #0x01
	call	_InputJustPressed
	or	a, a
	jr	Z, 00102$
;c:\gbdk\include\gb\gb.h:1391: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	inc	a
	ldh	(_SCX_REG + 0), a
;src/main.c:19: if (InputJustPressed(J_RIGHT)) {scroll_bkg(1, 0);}
00102$:
;src/main.c:21: InputRead();
	call	_InputRead
;src/main.c:23: vsync(); // Done processing, yield CPU and wait for start of next frame
	call	_vsync
;src/main.c:24: framecount = framecount + 1;
	ld	hl, #_framecount
	inc	(hl)
	ld	a, (hl)
;src/main.c:27: }
	jr	00104$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
