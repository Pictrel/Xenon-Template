NO_PALETTES = 1 ; must be < 64 (for this function)

copy_palette:
	ldx #0

@loop:
	lda @palette, x
	sta VRAM_PAL, x
	inx
	txa
	cmp #(NO_PALETTES * 4)
	bcs @loop

	rts

@palette:
	.byte $21, $22, $03, $F4
