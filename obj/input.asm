;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW64)
;--------------------------------------------------------
	.module input
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _joypad
	.globl _pad_curr
	.globl _pad_prev
	.globl _InputJustPressed
	.globl _InputRead
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_pad_prev::
	.ds 1
_pad_curr::
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
;src/input.c:7: BOOLEAN InputJustPressed(uint8_t button){
;	---------------------------------
; Function InputJustPressed
; ---------------------------------
_InputJustPressed::
	ld	c, a
;src/input.c:8: return (pad_curr != (pad_prev && button));
	ld	a, (#_pad_prev)
	or	a, a
	jr	Z, 00103$
	ld	a, c
	or	a, a
	jr	NZ, 00104$
00103$:
	ld	b, #0x00
	jr	00105$
00104$:
	ld	b, #0x01
00105$:
	ld	a, (#_pad_curr)
	sub	a, b
	ld	a, #0x01
	jr	Z, 00114$
	xor	a, a
00114$:
	xor	a, #0x01
;src/input.c:9: }
	ret
;src/input.c:11: void InputRead(void){
;	---------------------------------
; Function InputRead
; ---------------------------------
_InputRead::
;src/input.c:12: pad_prev = pad_curr;
	ld	a, (#_pad_curr)
	ld	(#_pad_prev),a
;src/input.c:13: pad_curr = joypad();
	call	_joypad
	ld	(#_pad_curr),a
;src/input.c:14: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
