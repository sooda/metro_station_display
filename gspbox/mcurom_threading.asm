	org	$F000
;
LF000:
	jmp	LF03F
LF003:
	jmp	LF045
LF006:
	jmp	LF06C
LF009:
	jmp	LF06F
LF00C:
	jmp	LF095
LF00F:
	jmp	LF0A2
LF012:
	jmp	LF0C0
LF015:
	jmp	LF0B7
LF018:
	jmp	LFB71
LF01B:
	jmp	LF072
LF01E:
	jmp	LF073
LF021:
	jmp	LF0AF
LF024:
	jmp	LF0B3
LF027:
	jmp	LF090
LF02A:
	jmp	LF08C
LF02D:
	jmp	LF088
LF030:
	jmp	LF084
LF033:
	jmp	LF080
LF036:
	jmp	LF07C
LF039:
	jmp	LF078
LF03C:
	jmp	LF074
;
LF03F:
	ldx	#$F872
	stx	X0093
	rts
;
LF045:
	ldaa	X0015
	anda	#$02
	bne	LF05E
	ldx	#$F873
	stx	X0093
	jsr	LFCDF
	ldaa	#$3A
	jsr	LF873
	ldx	#$F80D
	stx	X0093
	rts
;
LF05E:
	ldx	#$F86A
	stx	X0093
	jsr	LFCDF
	ldaa	#$3A
	jsr	LF873
	rts
LF06C:
	jmp	LF100
;
LF06F:
	oim	#$80X0060
LF072:
	rts
LF073:
	rts
;
LF074:
	ldaa	#$00
	bra	LF092
;
LF078:
	ldaa	#$08
	bra	LF092
;
LF07C:
	ldaa	#$10
	bra	LF092
;
LF080:
	ldaa	#$18
	bra	LF092
;
LF084:
	ldaa	#$20
	bra	LF092
;
LF088:
	ldaa	#$28
	bra	LF092
;
LF08C:
	ldaa	#$30
	bra	LF092
;
LF090:
	ldaa	#$38
LF092:
	staa	X0062
	rts
;
LF095:
	ldaa	X0062
	anda	#$38
	cmpa	#$38
	beq	LF0A1
	adda	#$08
	bra	LF092
LF0A1:
	rts
;
LF0A2:
	ldaa	X0062
	anda	#$38
	cmpa	#$00
	beq	LF0AE
	suba	#$08
	bra	LF092
LF0AE:
	rts
;
LF0AF:
	oim	#$01X006A
	rts
;
LF0B3:
	aim	#$FEX006A
	rts
;
LF0B7:
	oim	#$02X006A
	oim	#$04X006A
	jmp	LFB71
;
LF0C0:
	ldaa	X00B6
	cmpa	#$00
	beq	LF0CB
	staa	X00B1
	jmp	LF890
LF0CB:
	rts
;
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
;
LF100:
	sei
	clr	X0014
	ldaa	#$C1
	staa	X0014
	lds	#$005D
	ldx	#$00FF
LF10E:
	clr	$00,x
	dex
	cpx	#$0040
	bne	LF10E
	ldaa	#$FF
	staa	X0016
	clr	X0017
	oim	#$40X0017
	ldaa	X0017
	oraa	#$38
	staa	X0017
	ldaa	#$FF
	staa	X0001
	aim	#$FEX0003
	clr	X000F
	oim	#$20X0003
	aim	#$FDX0003
	ldaa	X0100
	ldaa	#$00
	staa	XC000
	ldaa	X0100
	ldaa	#$0F
	staa	X005F
	ldaa	#$2C
	staa	X0010
	ldaa	#$1A
	staa	X0011
	ldaa	X0015
	anda	#$02
	bne	LF162
	ldx	#$F786
	stx	X0091
	ldx	#$F872
	stx	X0093
	oim	#$80X0003
	bra	LF16F
;
LF162:
	ldx	#$F825
	stx	X0091
	ldx	#$F872
	stx	X0093
	oim	#$80X0003
LF16F:
	clr	X0090
	clr	X0095
	ldaa	#$00
	staa	X0008
	clr	X000F
	ldaa	#$D5
	staa	X00B1
	ldaa	X0011
	ldaa	X0012
	ldaa	X0008
	ldd	X000D
	ldx	#$0030
	ldd	$07,x
	bne	LF195
	oim	#$08X006A
	ldd	#$8000
LF195:
	std	X00B8
	ldaa	X0015
	anda	#$E0
	rora
	rora
	rora
	rora
	rora
	cmpa	#$00
	bne	LF1A7
	jmp	LF1DB
;
LF1A7:
	cmpa	#$01
	beq	LF1CC
	cmpa	#$02
	beq	LF1CF
	cmpa	#$03
	beq	LF1D2
	cmpa	#$04
	beq	LF1D5
	cmpa	#$05
	beq	LF1D8
	cmpa	#$06
	bne	LF1C2
	jmp	LF2B8
;
LF1C2:
	ldaa	$06,x
	ldx	#$DAC0
	stx	X00BC
	jmp	LF2BF
LF1CC:
	jmp	LF28B
LF1CF:
	jmp	LF294
LF1D2:
	jmp	LF29D
LF1D5:
	jmp	LF2A6
LF1D8:
	jmp	LF2AF
;
LF1DB:
	ldaa	#$00
	staa	X0011
	aim	#$FDX000F
	cli
	clr	X00C0
	pshx
	jsr	LFA4B
	jsr	LFA4B
	jsr	LFA4B
	pulx
	ldab	#$09
	abx
	ldd	$00,x
	std	X00BE
LF1F8:
	ldaa	#$D7
	staa	X00B1
	ldaa	X0015
	anda	#$02
	bne	LF237
LF202:
	aim	#$DFX0003
	ldab	XB000
	cmpb	#$FF
	beq	LF202
	jsr	LFA4B
	jsr	LFA4B
	ldab	XB000
	cmpb	#$FF
	beq	LF202
	comb
	oim	#$20X0003
	jsr	LF267
	ldx	#$0030
	ldx	$0D,x
	cpx	X00D5
	ble	LF250
	jsr	LFA4B
	jsr	LFA4B
	jsr	LF89B
	jsr	LFA4B
	bra	LF202
;
LF237:
	ldx	X00BE
	stx	X00D5
	ldd	X00BE
	addd	#$0004
	std	X00BE
	jsr	LF89B
	ldx	X00BE
	ldd	$00,x
	subd	#$FFFF
	beq	LF250
	bra	LF1F8
;
LF250:
	ldx	#$0030
	ldaa	X0015
	anda	#$E0
	clc
	rora
	rora
	rora
	rora
	rora
	cmpa	#$00
	bne	LF264
	jmp	LF1DB
LF264:
	jmp	LF100
;
LF267:
	tba
	suba	#$01
	ldx	X00BE
LF26C:
	nop
	ldab	$00,x
	cmpb	#$FF
	beq	LF285
	andb	#$07
	bne	LF27C
	clc
	suba	#$01
	bcs	LF282
LF27C:
	inx
	inx
	inx
	inx
	bra	LF26C
;
LF282:
	stx	X00D5
	rts
;
LF285:
	ldx	#$7FFF
	stx	X00D5
	rts
;
LF28B:
	ldaa	$00,x
	ldx	#$03E8
	stx	X00BC
	bra	LF2BF
;
LF294:
	ldaa	$01,x
	ldx	#$07D0
	stx	X00BC
	bra	LF2BF
;
LF29D:
	ldaa	$02,x
	ldx	#$0DAC
	stx	X00BC
	bra	LF2BF
;
LF2A6:
	ldaa	$03,x
	ldx	#$1B58
	stx	X00BC
	bra	LF2BF
;
LF2AF:
	ldaa	$04,x
	ldx	#$36B0
	stx	X00BC
	bra	LF2BF
;
LF2B8:
	ldaa	$05,x
	ldx	#$6D60
	stx	X00BC
LF2BF:
	staa	X001C
	ldaa	#$14
	staa	X001B
	cli
	aim	#$7FX0003
	ldx	X0091
	cpx	#$F786
	bne	LF2D5
	ldaa	#$11
	jsr	LF873
LF2D5:
	ldab	X0095
	ldaa	X0090
	cba
	bne	LF2DF
	bsr	LF2EF
	slp
LF2DF:
	jsr	LF2FF
	bra	LF2D5
;
LF2E4:
	tim	#$80X0096
	bne	LF2EA
	rts
;
LF2EA:
	tim	#$01X00B7
	bne	LF2FE
LF2EF:
	aim	#$7FX0003
	ldx	X0091
	cpx	#$F786
	bne	LF2FE
	ldaa	#$11
	jsr	LF873
LF2FE:
	rts
;
LF2FF:
	tim	#$20X0096
	beq	LF30D
	ldaa	#$D5
	staa	X00B1
	clr	X0096
	bra	LF30D
;
LF30D:
	ldaa	X0095
	ldab	X0090
	cba
	beq	LF2EF
LF314:
	tst	X0095
	beq	LF31E
	jsr	LF396
	bra	LF2FF
;
LF31E:
	tst	X0090
	beq	LF2EF
	ldx	#$0070
	ldaa	$00,x
	cmpa	#$40
	bne	LF331
	oim	#$01X0096
	bra	LF334
;
LF331:
	aim	#$FEX0096
LF334:
	tim	#$02X0096
	beq	LF33F
	ldx	X0097
	cmpa	$00,x
	beq	LF38F
LF33F:
	ldx	#$0100
LF342:
	cmpa	$00,x
	beq	LF38B
	ldab	$00,x
	cmpb	#$FF
	bne	LF386
	cmpa	#$0D
	beq	LF358
	cmpa	#$0A
	beq	LF358
	cmpa	#$20
	bne	LF35D
LF358:
	jsr	LF6DC
	bra	LF30D
;
LF35D:
	cmpa	#$2E
	beq	LF377
	cmpa	#$2C
	beq	LF377
	cmpa	#$3F
	beq	LF377
	cmpa	#$21
	beq	LF377
	cmpa	#$3A
	beq	LF377
	cmpa	#$3B
	beq	LF377
	bra	LF383
;
LF377:
	jsr	LF731
	tim	#$04X0096
	beq	LF382
	jmp	LF890
LF382:
	rts
LF383:
	jmp	LF731
;
LF386:
	inx
	inx
	inx
	bra	LF342
;
LF38B:
	ldx	$01,x
	stx	X0097
LF38F:
	inc	X0095
	jmp	LF314
LF395:
	rts
;
LF396:
	ldaa	X0095
	ldab	X0090
	cba
	beq	LF395
	ldx	#$0070
	ldab	X0095
	abx
	ldaa	$00,x
	ldx	X0097
	ldab	X0095
	abx
	ldab	$00,x
	cba
	bne	LF3B3
	inc	X0095
	rts
LF3B3:
	jmp	LF69E
;
LF3B6:
	cmpa	#$2E
	beq	LF3D2
	cmpa	#$2C
	beq	LF3D2
	cmpa	#$3F
	beq	LF3D2
	cmpa	#$21
	beq	LF3D2
	cmpa	#$3A
	beq	LF3D2
	cmpa	#$3B
	beq	LF3D2
	jsr	LF412
	rts
;
LF3D2:
	jsr	LF731
	tim	#$04X0096
	beq	LF382
LF3DA:
	jmp	LF87B
;
LF3DD:
	cmpb	#$04
	bne	LF3B6
	cmpa	#$0A
	beq	LF45B
	cmpa	#$0D
	beq	LF45B
	cmpa	#$20
	beq	LF45B
	cmpa	X0060
	beq	LF45B
	cmpa	#$2E
	beq	LF3DA
	cmpa	#$2C
	beq	LF3DA
	cmpa	#$21
	beq	LF3DA
	cmpa	#$3F
	beq	LF3DA
	cmpa	#$3B
	beq	LF3DA
	cmpa	#$3A
	beq	LF3DA
	bra	LF412
;
	db	$DE, $A0, $DF, $97
	db	$7F, $00, $96
;
LF412:
	aim	#$FEX0096
	clr	X0095
	ldx	X0097
LF41A:
	inx
	ldd	$00,x
	subd	#$FFFF
	beq	LF424
	bra	LF41A
;
LF424:
	ldd	$01,x
	subd	#$FFFF
	beq	LF41A
	inx
	inx
	ldaa	$00,x
	cmpa	#$04
	beq	LF41A
	stx	X0097
	tst	X0090
	bne	LF43D
	jmp	LF2EF
;
LF43D:
	ldx	#$0070
	ldaa	$00,x
	cmpa	#$40
	bne	LF44B
	oim	#$01X0096
	bra	LF44E
;
LF44B:
	aim	#$FEX0096
LF44E:
	ldx	X0097
	cmpa	$00,x
	beq	LF457
	jmp	LF731
;
LF457:
	inc	X0095
	rts
;
LF45B:
	aim	#$F7X0096
	aim	#$EFX0096
	tst	X009D
	beq	LF49A
	inc	X009D
	jsr	LF562
	ldx	X009E
	stx	X00AF
	cpx	X00A6
	beq	LF485
	ldd	$02,x
	std	X00A4
	ldx	X00A6
	ldd	$02,x
	subd	X00A4
	beq	LF483
LF480:
	jmp	LF594
;
LF483:
	stx	X009E
LF485:
	jsr	LF584
	tim	#$80X0096
	beq	LF492
	tim	#$08X0096
	beq	LF480
LF492:
	tim	#$08X0096
	beq	LF4CB
	jmp	LF524
;
LF49A:
	inc	X009D
	ldx	X0097
	stx	X00A0
	jsr	LF562
LF4A4:
	ldx	X009E
	stx	X00AD
	ldab	X009D
	cmpb	#$01
	bne	LF4B6
	jsr	LF573
	tim	#$10X0096
	bne	LF4E9
LF4B6:
	jsr	LF584
	tim	#$80X0096
	beq	LF4C3
	tim	#$08X0096
	beq	LF4E9
LF4C3:
	tim	#$08X0096
	beq	LF4CB
	jmp	LF524
;
LF4CB:
	ldx	X009E
	ldx	$04,x
	xgdx
	tsta
	bmi	LF4E3
	ldx	X009E
	ldx	$04,x
	stx	X00A6
	ldx	X009E
	ldx	$00,x
	stx	X00A2
	jsr	LF6DC
	rts
;
LF4E3:
	clr	X009D
	jmp	LF6DC
;
LF4E9:
	ldx	X009E
	ldx	$02,x
	stx	X00A4
	ldx	X009E
	clr	X009D
LF4F4:
	inx
	ldd	$00,x
	subd	#$FFFF
	beq	LF4FE
	bra	LF4F4
;
LF4FE:
	ldd	$01,x
	subd	#$FFFF
	beq	LF4F4
	inx
	inx
	ldaa	$00,x
	cmpa	#$04
	beq	LF510
LF50D:
	jmp	LF731
;
LF510:
	inx
	pshx
	ldx	$02,x
	cpx	X00A4
	bne	LF521
	pulx
	stx	X009E
	inc	X009D
	jmp	LF4A4
;
LF521:
	pulx
	bra	LF50D
;
LF524:
	bsr	LF52D
	clr	X009D
	jsr	LF6DC
	rts
;
LF52D:
	ldx	X009E
	ldd	$04,x
	anda	#$7F
	psha
	pshb
	ldab	X00B1
	cmpb	#$FD
	bge	LF556
	ldx	#$0000
	abx
	pulb
	pula
	std	$00,x
	ldab	X00B1
	subb	#$D5
	lsrb
	ldx	#$00C0
	abx
	ldab	X0062
	stab	$00,x
	inc	X00B1
	inc	X00B1
LF556:
	rts
;
LF557:
	ldab	$00,x
	cmpb	#$04
	beq	LF560
	inx
	bra	LF557
;
LF560:
	inx
	rts
;
LF562:
	jsr	LF557
	stx	X009E
	ldab	X009D
	cmpb	#$01
	beq	LF56E
	rts
;
LF56E:
	ldd	$00,x
	std	X00A2
	rts
;
LF573:
	ldx	X009E
	ldx	$06,x
	cpx	#$0000
	bne	LF580
	aim	#$EFX0096
	rts
;
LF580:
	oim	#$10X0096
	rts
;
LF584:
	ldx	X009E
	ldx	$04,x
	xgdx
	tsta
	bmi	LF590
	aim	#$F7X0096
	rts
;
LF590:
	oim	#$08X0096
	rts
;
LF594:
	sts	X00B4
	clr	X00AA
	clr	X00AB
	ldx	X00AF
	ldd	$02,x
	psha
	pshb
	inc	X00AA
	ldx	X00A6
LF5A7:
	ldx	$06,x
	ldd	$02,x
	psha
	pshb
	inc	X00AA
	cpx	X00AD
	bne	LF5A7
	stx	X00A8
LF5B6:
	inx
	ldd	$00,x
	subd	#$FFFF
	beq	LF5C0
	bra	LF5B6
;
LF5C0:
	ldd	$01,x
	subd	#$FFFF
	beq	LF5B6
	inx
	inx
	ldaa	$00,x
	cmpa	#$04
	beq	LF5D7
	lds	X00B4
	clr	X009D
	jmp	LF731
;
LF5D7:
	inx
LF5D8:
	ldd	$02,x
	std	X00A4
	pulb
	pula
	subd	X00A4
	beq	LF5E5
	jmp	LF634
;
LF5E5:
	inc	X00AB
	stx	X009E
	ldaa	X00AB
	cmpa	#$01
	bne	LF600
	aim	#$EFX0096
	jsr	LF573
	tim	#$10X0096
	beq	LF600
	lds	X00B4
	jmp	LF731
;
LF600:
	aim	#$F7X0096
	jsr	LF584
	tim	#$08X0096
	beq	LF60E
	jmp	LF663
;
LF60E:
	ldab	X00AB
	cmpb	#$01
	bne	LF618
	ldx	X009E
	stx	X00AD
LF618:
	ldx	X009E
	ldx	$04,x
	ldaa	X00AA
	cmpa	X00AB
	bne	LF5D8
	tim	#$80X0096
	bne	LF631
	ldx	X009E
	ldx	$04,x
	stx	X00A6
	jsr	LF6DC
	rts
LF631:
	jmp	LF594
;
LF634:
	addd	X00A4
	psha
	pshb
	ldaa	#$01
	cmpa	X00AB
	bne	LF64C
	ldx	X009E
	stx	X00AD
	ldd	$02,x
	psha
	pshb
	clr	X00AB
	jmp	LF5B6
;
LF64C:
	dec	X00AB
	ldx	X009E
	ldd	$02,x
LF653:
	ldx	$06,x
	psha
	pshb
	ldd	$02,x
	dec	X00AB
	bne	LF653
	psha
	pshb
	jmp	LF5B6
;
LF663:
	jsr	LF52D
	ldaa	X00AA
	ldab	X00AB
	sba
	cmpa	#$01
	beq	LF676
	cmpa	#$00
	beq	LF682
	jmp	LF689
;
LF676:
	pulb
	pula
	clr	X0095
	clr	X009D
	aim	#$FDX0096
	rts
;
LF682:
	ldx	X009E
	stx	X00A8
	jmp	LF4CB
;
LF689:
	ldx	X00A8
LF68B:
	ldx	$04,x
	dec	X00AA
	decb
	bne	LF68B
	stx	X00A8
	clr	X00AB
	jmp	LF5B6
LF69B:
	jmp	LF3DD
;
LF69E:
	tim	#$01X0096
	beq	LF69B
	cmpb	#$04
	bne	LF69B
	oim	#$80X0096
	aim	#$FEX00B7
	psha
	ldx	X0097
	jsr	LF557
	ldx	$00,x
	stx	X0099
	aim	#$FEX0096
	jsr	$00,x		;INFO: index jump
	pula
	tim	#$80X0060
	beq	LF6CE
	cmpa	#$2E
	beq	LF6CA
	staa	X0060
	bra	LF6CE
;
LF6CA:
	ldaa	#$20
	staa	X0060
LF6CE:
	jsr	LF6DC
	aim	#$7FX0096
	rts
;
LF6D5:
	clr	X0095
	clr	X0090
	rts
;
LF6DC:
	ldaa	X0090
	ldab	X0095
	cba
	blt	LF6D5
	ldab	X0095
	ldx	#$0070
	abx
	ldaa	$00,x
	cmpa	#$0D
	beq	LF700
	cmpa	#$0A
	beq	LF700
	cmpa	#$20
	beq	LF700
	cmpa	#$2E
	beq	LF700
	inc	X0095
	bra	LF6DC
;
LF700:
	clr	X009C
	inc	X0095
	ldab	X0095
	stab	X009B
LF70A:
	ldab	X0095
	ldaa	X0090
	cba
	ble	LF729
	ldx	#$0070
	abx
	ldaa	$00,x
	clr	$00,x
	psha
	xgdx
	subb	X009B
	xgdx
	pula
	staa	$00,x
	inc	X009C
	inc	X0095
	bra	LF70A
;
LF729:
	ldaa	X009C
	staa	X0090
	clr	X0095
	rts
;
LF731:
	oim	#$04X0096
LF734:
	ldaa	X0090
	ldab	X0095
	cba
	ble	LF777
	ldab	X0095
	ldx	#$0070
	abx
	ldaa	$00,x
	cmpa	#$0D
	beq	LF772
	cmpa	#$0A
	beq	LF772
	cmpa	#$20
	beq	LF772
	cmpa	#$2E
	beq	LF76C
	cmpa	#$2C
	beq	LF76C
	cmpa	#$21
	beq	LF76C
	cmpa	#$3F
	beq	LF76C
	cmpa	#$3B
	beq	LF76C
	cmpa	#$3A
	beq	LF76C
	inc	X0095
	bra	LF734
;
LF76C:
	jsr	LF890
	aim	#$FBX0096
LF772:
	jsr	LF700
	bra	LF780
;
LF777:
	clr	X0095
	clr	X0090
	clr	X009D
LF780:
	rts
;
LF781:
	ldx	X0091
	jmp	$00,x		;INFO: index jump
;
	db	$3B, $96, $11, $D6
	db	$12, $48, $48, $25
	db	$F7, $96, $12, $81
	db	$13, $27, $F1, $81
	db	$11, $27, $ED, $86
	db	$13, $7B, $80, $11
	db	$26, $E6, $7B, $20
	db	$11, $27, $F6, $97
	db	$13, $7F, $00, $61
	db	$96, $11, $96, $12
	db	$CE, $00, $70, $D6
	db	$90, $3A, $A7, $00
	db	$5C, $D7, $90, $CE
	db	$00, $8B, $D6, $61
	db	$3A, $A7, $00, $7C
	db	$00, $61, $81, $0D
	db	$27, $2C, $81, $0A
	db	$27, $28, $81, $20
	db	$27, $24, $81, $2E
	db	$27, $20, $86, $1A
	db	$91, $90, $2F, $1D
	db	$DE, $BC, $7B, $80
	db	$11, $26, $C9, $09
	db	$26, $F8, $DE, $93
	db	$AD, $00, $7B, $01
	db	$B7, $27, $01, $3B
	db	$86, $11, $BD, $F8
	db	$73, $3B, $72, $01
	db	$B7, $86, $13, $BD
	db	$F8, $73, $DE, $BC
	db	$7B, $80, $11, $26
	db	$A7, $09, $8C, $00
	db	$00, $26, $F5, $DE
	db	$93, $AD, $00, $3B
	db	$7A, $00, $61, $5F
	db	$CE, $00, $8B, $3A
	db	$A6, $00, $BD, $F8
	db	$73, $BD, $FA, $4B
	db	$D1, $61, $27, $03
	db	$5C, $20, $ED, $39
	db	$72, $80, $03, $96
	db	$11, $D6, $12, $48
	db	$48, $25, $36, $96
	db	$12, $0E, $4D, $2B
	db	$29, $DE, $93, $AD
	db	$00, $81, $13, $27
	db	$21, $CE, $00, $70
	db	$D6, $90, $3A, $A7
	db	$00, $5C, $D7, $90
	db	$81, $2E, $27, $16
	db	$81, $20, $27, $12
	db	$81, $0A, $27, $0E
	db	$81, $0D, $27, $0A
	db	$86, $1A, $91, $90
	db	$2F, $07, $71, $7F
	db	$03, $3B, $72, $01
	db	$B7, $72, $80, $03
	db	$3B, $7B, $10, $15
	db	$26, $FB, $BD, $F8
	db	$73, $39
;
LF873:
	tim	#$20X0011
	beq	LF873
	staa	X0013
LF87A:
	rts
;
LF87B:
	oim	#$80X0096
	aim	#$EFX0011
	jsr	LF45B
	ldd	X00D5
	std	X00FE
	tim	#$80X0096
	beq	LF87A
	aim	#$7FX0096
LF890:
	aim	#$EFX0011
	aim	#$BFX005E
	tim	#$04X0096
	bne	LF919
LF89B:
	ldaa	X0008
	ldd	X000D
	ldab	#$D5
	cmpb	X00B1
	bge	LF8E0
	oim	#$02X0003
	tim	#$40X005E
	bne	LF8B5
	ldx	#$0000
	abx
	ldx	$00,x
	stx	X00FE
LF8B5:
	ldx	#$0000
	abx
	incb
	incb
	pshb
	pshx
	subb	#$D5
	lsrb
	subb	#$01
	addb	#$C0
	ldx	#$0000
	abx
	ldaa	$00,x
	staa	X0062
	pulx
	ldaa	X0008
	ldd	X000D
	jsr	LFA7F
	aim	#$BFX0017
	ldx	#$F8DA
	jmp	$00,x		;INFO: index jump
;
LF8DC:
	ldx	X00BA
	jmp	$00,x		;INFO: index jump
;
LF8E0:
	oim	#$20X0096
	aim	#$FDX0003
	clr	X009D
	ldaa	X0017
	oraa	#$38
	staa	X0017
	aim	#$7FX0017
	ldaa	X0100
	clra
	staa	XC000
	ldaa	X00B1
	staa	X00B6
	aim	#$FEX00B7
	tim	#$04X006A
	bne	LF909
	oim	#$10X0011
	rts
;
LF909:
	aim	#$7FX0003
	ldx	X0091
	cpx	#$F786
	bne	LF918
	ldaa	#$11
	jsr	LF873
LF918:
	rts
;
LF919:
	aim	#$7FX0096
	tim	#$01X006A
	bne	LF924
	jmp	LF8E0
;
LF924:
	ldaa	#$D7
	staa	X00B1
	ldx	#$0030
	ldx	$0B,x
	beq	LF8E0
	stx	X00D5
	clr	X00C0
	jmp	LF89B
;
	db	$DE, $B2, $72, $40
	db	$17, $A6, $00, $A6
	db	$00, $A6, $00, $B7
	db	$A0, $00, $08, $9C
	db	$B8, $27, $36, $DF
	db	$B2, $3B, $27, $13
	db	$7C, $00, $63, $86
	db	$AA, $B7, $A0, $00
	db	$3B, $DE, $B2, $D6
	db	$63, $C1, $32, $2F
	db	$ED, $20, $0D, $7C
	db	$00, $63, $C6, $C7
	db	$D4, $17, $DA, $62
	db	$C4, $BF, $D7, $17
	db	$E6, $00, $F7, $A0
	db	$00, $C1, $55, $27
	db	$72, $08, $9C, $B8
	db	$27, $03, $DF, $B2
	db	$3B, $CC, $01, $00
	db	$DD, $B2, $7B, $08
	db	$6A, $26, $13, $7C
	db	$00, $17, $3B, $7C
	db	$00, $5F, $72, $01
	db	$03, $96, $5F, $F6
	db	$01, $00, $B7, $C0
	db	$00, $3B, $7B, $80
	db	$17, $27, $0F, $71
	db	$7F, $17, $96, $17
	db	$84, $07, $81, $07
	db	$27, $E1, $7C, $00
	db	$17, $3B, $72, $80
	db	$17, $3B, $27, $13
	db	$7C, $00, $63, $86
	db	$FF, $B7, $A0, $00
	db	$3B, $DE, $B2, $D6
	db	$63, $C1, $32, $2F
	db	$ED, $20, $0D, $7C
	db	$00, $63, $C6, $C7
	db	$D4, $17, $DA, $62
	db	$C4, $BF, $D7, $17
	db	$E6, $00, $E6, $00
	db	$F7, $A0, $00, $C1
	db	$FE, $27, $08, $08
	db	$9C, $B8, $27, $23
	db	$DF, $B2, $3B
;
LF9EA:
	oim	#$40X0017
	aim	#$7FX0017
	ldaa	#$00
	ldab	X0100
	staa	XC000
	aim	#$FEX0003
	ldaa	X0008
	ldd	X000D
	ldd	#$FA52
	tsx
	std	$03,x
	ldaa	#$40
	staa	X0017
	rti
;
	db	$CC, $01, $00, $DD
	db	$B2, $7B, $08, $6A
	db	$26, $89, $7C, $00
	db	$17, $3B, $27, $13
	db	$7C, $00, $63, $86
	db	$BA, $B7, $A0, $00
	db	$3B, $DE, $B2, $D6
	db	$63, $C1, $32, $2F
	db	$ED, $20, $0D, $7C
	db	$00, $63, $C6, $C7
	db	$D4, $17, $DA, $62
	db	$C4, $BF, $D7, $17
	db	$E6, $00, $F7, $A0
	db	$00, $C1, $AA, $27
	db	$A7, $08, $9C, $B8
	db	$27, $C2, $DF, $B2
	db	$3B
;
LFA4B:
	ldx	#$6000
LFA4E:
	dex
	bne	LFA4E
	rts
;
	db	$33, $7B, $40, $5E
	db	$27, $16, $5A, $5A
	db	$37, $CE, $00, $00
	db	$3A, $3C, $EE, $00
	db	$08, $08, $08, $08
	db	$18, $38, $ED, $00
	db	$33, $7E, $F8, $A1
	db	$5A, $5A, $CE, $00
	db	$00, $3A, $37, $DC
	db	$FE, $ED, $00, $33
	db	$5C, $5C, $7E, $F8
	db	$A1
;
LFA7F:
	aim	#$BFX005E
	ldaa	#$0F
	staa	X005F
	ldx	$00,x
	ldaa	$00,x
	anda	#$07
	staa	X8000
	ldaa	$04,x
	cmpa	#$FF
	beq	LFA9E
	anda	#$07
	cmpa	#$07
	bne	LFA9E
	oim	#$40X005E
LFA9E:
	ldaa	$00,x
	anda	#$38
	ldab	X0017
	andb	#$C7
	aba
	oraa	X0062
	staa	X0062
	staa	X0017
	tim	#$40,$00,x
	bne	LFAB9
	tim	#$80,$00,x
	beq	LFAC0
	bra	LFACB
;
LFAB9:
	tim	#$80,$00,x
	beq	LFAD9
	bra	LFAD2
;
LFAC0:
	ldd	#$F937
	std	X00BA
	ldaa	#$10
	staa	X0008
	bra	LFAEC
;
LFACB:
	ldd	#$F9C0
	std	X00BA
	bra	LFADE
;
LFAD2:
	ldd	#$FA23
	std	X00BA
	bra	LFADE
;
LFAD9:
	ldd	#$F958
	std	X00BA
LFADE:
	oim	#$02X0003
	clr	X0063
	ldaa	#$38
	staa	X0017
	ldaa	#$00
	staa	X0008
LFAEC:
	inx
	ldaa	X0017
	anda	#$F8
	ldab	$00,x
	andb	#$F0
	bne	LFB0B
	oraa	$00,x
	psha
	inx
	ldd	$00,x
	subd	#$8000
	bmi	LFB34
	xgdx
	pula
	staa	X0017
	oim	#$80X0017
	bra	LFB39
;
LFB0B:
	ldab	$00,x
	stab	X005F
	staa	X0017
	inx
	ldd	$00,x
	subd	#$8000
	bmi	LFB1F
	xgdx
	oim	#$80X0017
	bra	LFB21
;
LFB1F:
	ldx	$00,x
LFB21:
	ldaa	X0017
	adda	#$07
	staa	X0017
	ldab	X005F
	ldaa	X0100
	stab	XC000
	oim	#$01X0003
	bra	LFB39
;
LFB34:
	pula
	ldx	$00,x
	staa	X0017
LFB39:
	stx	X00B2
	rts
;
LFB3C:
	jsr	LFD16
	oim	#$02X006A
	oim	#$04X006A
	bra	LFBA0
;
LFB47:
	jsr	LFD16
	aim	#$FDX006A
	bra	LFBA0
;
LFB4F:
	ldaa	#$0D
	jsr	LFD16
	ldaa	#$20
	jsr	LFD16
	ldaa	#$0D
	jsr	LFD16
	ldaa	#$3A
	jsr	LFD16
	aim	#$FDX006A
	aim	#$FBX006A
	pulx
	stx	X0093
	pulx
	stx	X0091
	cli
	rts
;
LFB71:
	sei
	aim	#$FBX0096
	clr	X00C0
	jsr	LF2E4
	ldx	X0091
	pshx
	ldaa	X0015
	anda	#$02
	bne	LFB98
	ldx	#$FD26
	stx	X0091
	ldx	X0093
	pshx
	cpx	#$F872
	beq	LFBA0
	ldx	#$F873
	stx	X0093
	bra	LFBA0
;
LFB98:
	ldx	#$FD1D
	stx	X0091
	ldx	X0093
	pshx
LFBA0:
	sei
	clr	X00D7
	clr	X00D8
LFBA7:
	oim	#$04X006A
	ldaa	#$0D
	jsr	LFD16
	ldaa	#$0A
	jsr	LFD16
	ldx	#$FF00
	jsr	LFCCF
	ldaa	#$3E
	jsr	LFD16
	ldaa	X0011
	ldaa	X0012
LFBC3:
	slp
	tim	#$80X0011
	beq	LFBC3
	ldaa	X0011
	ldaa	X0012
	cmpa	#$2F
	bne	LFBD9
	inc	X00D8
	jsr	LFD16
	bra	LFBA7
;
LFBD9:
	cmpa	#$2B
	bne	LFBE0
	jmp	LFB3C
;
LFBE0:
	cmpa	#$2D
	bne	LFBE7
	jmp	LFB47
;
LFBE7:
	cmpa	#$1B
	bne	LFBEE
	jmp	LFB4F
;
LFBEE:
	cmpa	#$21
	blt	LFBA0
	cli
	staa	X006D
	ldaa	X006D
	ldx	#$0100
LFBFA:
	ldab	$00,x
	cmpb	#$04
	beq	LFBA0
	cmpb	#$40
	beq	LFC0A
	ldaa	X006D
	cmpa	$00,x
	ble	LFC0F
LFC0A:
	inx
	inx
	inx
	bra	LFBFA
;
LFC0F:
	stab	X006D
	ldx	$01,x
LFC13:
	stx	X0068
	stx	X006E
LFC17:
	jsr	LF557
	ldd	$02,x
	ldd	$06,x
	beq	LFC35
	ldab	#$0A
	abx
LFC23:
	ldab	$00,x
	cmpb	#$04
	beq	LFC17
	cmpb	#$00
	bne	LFC30
	jmp	LFBA0
;
LFC30:
	stx	X006E
	jmp	LFC13
;
LFC35:
	stx	X0064
LFC37:
	pshx
	ldx	X006E
	jsr	LFCCF
	pulx
	ldd	$04,x
	tsta
	bmi	LFC90
	tst	X00D8
	beq	LFC53
	ldaa	X00D7
	cmpa	#$3C
	bgt	LFC53
	jsr	LFC83
	bra	LFC56
;
LFC53:
	jsr	LFCEA
LFC56:
	ldd	$04,x
	ldx	$04,x
	std	X0066
LFC5C:
	dex
	ldaa	$00,x
	cmpa	#$04
	bne	LFC5C
	dex
	dex
	ldd	$00,x
	subd	#$FFFF
	beq	LFC5C
LFC6C:
	dex
	ldd	$00,x
	subd	#$FFFF
	bne	LFC6C
	ldaa	$02,x
	cmpa	#$04
	beq	LFC5C
	inx
	inx
	stx	X006E
	ldx	X0066
	jmp	LFC37
;
LFC83:
	sei
	inc	X00D7
	pshx
	ldaa	#$20
	jsr	LFD16
	pulx
	cli
	rts
;
LFC90:
	jsr	LFD10
	pshx
	ldx	X00BC
LFC96:
	dex
	bne	LFC96
	pulx
	tim	#$02X006A
	beq	LFCB0
	stx	X009E
	ldaa	#$D5
	staa	X00B1
	jsr	LF52D
	cli
	jsr	LF890
	sei
	oim	#$10X0011
LFCB0:
	jsr	LFCEA
	ldab	X0012
	cmpb	#$1B
	beq	LFCCC
	ldx	X0064
LFCBB:
	inx
	ldd	$00,x
	subd	#$FFFF
	bne	LFCBB
	inx
	inx
	ldd	X0068
	std	X006E
	jmp	LFC23
LFCCC:
	jmp	LFB4F
;
LFCCF:
	ldaa	$00,x
	cmpa	#$04
	beq	LFCDE
	jsr	LFD16
	inx
	inc	X00D7
	bra	LFCCF
LFCDE:
	rts
;
LFCDF:
	ldaa	#$0D
	jsr	LFD16
	ldaa	#$0A
	jsr	LFD16
	rts
;
LFCEA:
	sei
	clr	X00D7
	pshx
	jsr	LFCDF
	pshx
	cli
	jsr	LFA4B
	jsr	LFA4B
	pulx
	pulx
	rts
;
	db	$3C, $BD, $FA, $4B
	db	$38, $7B, $80, $11
	db	$27, $FB, $D6, $11
	db	$D6, $12, $C1, $20
	db	$26, $F3, $3B
;
LFD10:
	ldaa	#$2E
	jsr	LFD16
	rts
;
LFD16:
	pshx
	ldx	X0093
	jsr	$00,x		;INFO: index jump
	pulx
	rts
;
	db	$D6, $11, $D6, $12
	db	$C1, $20, $27, $D8
	db	$3B, $D6, $11, $D6
	db	$12, $C1, $20, $27
	db	$CF, $C1, $13, $27
	db	$01, $3B, $7B, $80
	db	$11, $27, $FB, $20
	db	$EC, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $47
	db	$53, $50, $2D, $41
	db	$53, $38, $35, $20
	db	$56, $32, $2E, $31
	db	$34, $0A, $0D, $04
	db	$4B, $2E, $4E, $55
	db	$4C, $49, $53, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF, $FF, $FF, $FF
	db	$FF
vectable:
	dw	LFFFF
	dw	LFFFF
	dw	LF100
	dw	LF781
	dw	LF100
	dw	LF100
	dw	LF9EA
	dw	LF8DC
	dw	LF100
	dw	LF100
	dw	LF100
