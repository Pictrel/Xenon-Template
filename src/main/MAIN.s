.zeropage

z_wreg1: .res 2
z_wreg2: .res 2
z_wreg3: .res 2
z_wreg4: .res 2

.code

.org $8000
.include "xenon_def.s"

main:
	lda #'a'
	sta IO_CON
	lda #'l'
	sta IO_CON
	lda #'i'
	sta IO_CON
	lda #'v'
	sta IO_CON
	lda #'e'
	sta IO_CON

	store16 VRAM_START, z_wreg1
	store16 $2000, z_wreg2
	ldx #0
	jsr memset

	; copy the palette
	jsr copy_palette

halt:
	jmp halt

.include "palette.s"

.include "memory_funcs.s"

msg: .byte "Hello, World!", 10, 0

.include "graphics.s"

.BSS

