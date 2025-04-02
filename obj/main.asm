;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _InputRead
	.globl _set_bkg_data
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
;src/main.c:11: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:14: set_bkg_data(0, test_tile_count, test_tiles);
	ld	de, #_test_tiles
	push	de
	ld	hl, #0x2600
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:16: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/main.c:17: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:20: while(1) {
00102$:
;src/main.c:25: vsync(); // Done processing, yield CPU and wait for start of next frame
	call	_vsync
;src/main.c:27: InputRead();
	call	_InputRead
;src/main.c:28: framecount = framecount + 1;
	ld	hl, #_framecount
	inc	(hl)
	ld	a, (hl)
;src/main.c:32: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
