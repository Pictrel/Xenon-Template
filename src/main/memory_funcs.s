
; z_wreg1 = dest
; z_wreg2 = src
; z_wreg3 = count
memcpy:
	ldy #0
@loop:
	lda (z_wreg2), y
	sta (z_wreg1), y
	iny
	bnz @dont_increment_page

	; go to next page for src and dest
	inc z_wreg2 + 1
	inc z_wreg1 + 1

@dont_increment_page:

	; next, decrement count
	dec z_wreg3
	ldx z_wreg3
	inx
	bnz @dont_decrement_count_page

	dec z_wreg3 + 1
	ldx z_wreg3 + 1
	inx
	beq @end

@dont_decrement_count_page:
	jmp @loop

@end:
	rts

; z_wreg1 = dest
; z_wreg2 = count
; x = content
memset:
	ldy #0

@loop:
	; if count == 0 then goto end
	lda z_wreg2
	ora z_wreg2 + 1
	beq @end

	txa
	sta (z_wreg1), y
	iny
	bne @dont_increment_page

	inc z_wreg1 + 1

@dont_increment_page:
	dec z_wreg2
	lda z_wreg2
	cmp #$ff
	bne @dont_decrement_count_page

	dec z_wreg2 + 1

@dont_decrement_count_page:
	jmp @loop

@end:
	rts
