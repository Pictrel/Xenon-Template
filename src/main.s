.segment "CODE"

.include "xenon_def.s"

main:
	; print a message to the console
	ldx #$00

@loop:
	lda msg, x
	sta IO_CON

@halt:
	jmp @halt

msg: .byte "Hello, World!\0"

.include "graphics.s"

.include "ram.s"

.BSS

