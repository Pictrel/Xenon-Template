.segment "CODE"

.include "xenon_def.s"

main:
	jsr copy_tileset
	
@loop:
	jmp @loop


copy_tileset:
	store16 tileset_bin,  z_src
	store16 VRAM_TILESET, z_dest
	lda #$04
	jsr $F800
	rts

.include "graphics.s"

.include "ram.s"

.BSS

