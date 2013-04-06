	org	00000H
;
L0000:
	lxi	sp,0BBFAH
	mvi	a,0FFH
L0005:
	sta	XBBFF
	mvi	a,04CH
	sta	XBBFE
	mvi	a,001H
	sta	XBBFB
	mvi	a,000H
	sta	XBBFC
	mvi	a,000H
	sta	XBBFD
	jmp	L03C5
;
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH
X0040:
	db	003H
X0041:
	db	002H, 004H, 004H, 001H
	db	001H, 004H, 004H, 001H
	db	001H, 002H, 002H, 001H
	db	001H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H
;
L0063:
	lda	X0041
	mov	c,a
	mvi	l,001H
L0069:
	lda	X0040
	mov	b,a
	mvi	h,001H
L006F:
	push	b
	push	h
	lxi	d,00062H
	in	011H
	call	L4000
	pop	h
	pop	b
	inr	h
	dcr	b
	jnz	L006F
	inr	l
	dcr	c
	jnz	L0069
	ret
;
L0086:
	lda	X0040
	mov	h,a
L008A:
	lda	X0041
	mov	l,a
L008E:
	push	h
	push	d
	in	011H
	call	L4000
	pop	d
	pop	h
	dcr	l
	jnz	L008E
	dcr	h
	jnz	L008A
	ret
;
L00A0:
	push	psw
L00A1:
	push	b
	mvi	b,011H
L00A4:
	dcr	b
	jnz	L00A4
	pop	b
	dcx	b
	in	011H
	mov	a,b
	ora	c
	jnz	L00A1
	pop	psw
	ret
;
L00B3:
	push	b
	lxi	b,003E8H
	call	L00A0
	pop	b
	in	011H
	dcr	b
	jnz	L00B3
	ret
;
	db	07FH, 07FH, 015H, 07FH
	db	07FH, 017H, 07FH, 07FH
	db	004H, 07FH, 07FH, 017H
	db	07FH, 07FH, 010H, 030H
	db	07FH, 07FH, 017H, 07FH
	db	07FH, 010H, 031H, 07FH
	db	07FH, 017H, 07FH, 07FH
	db	017H, 07FH, 07FH, 005H
	db	07FH, 07FH, 017H, 05AH
	db	03AH, 020H, 020H, 041H
	db	03AH, 020H, 020H, 048H
	db	009H, 053H, 04BH, 041H
	db	04EH, 044H, 049H, 02EH
	db	046H, 04EH, 054H, 020H
	db	000H, 043H, 068H, 065H
	db	063H, 06BH, 03AH, 020H
	db	049H, 06EH, 069H, 074H
	db	02EH, 020H, 04DH, 065H
	db	06DH, 06FH, 072H, 079H
	db	000H, 055H, 04CH, 041H
	db	04DH, 02DH, 048H, 030H
	db	047H, 009H, 056H, 03AH
	db	032H, 037H, 02EH, 031H
	db	030H, 02EH, 039H, 034H
	db	000H, 020H, 000H, 054H
	db	065H, 073H, 074H, 03AH
	db	009H, 053H, 050H, 041H
	db	020H, 020H, 020H, 000H
	db	003H, 057H, 044H, 02DH
	db	054H, 065H, 073H, 074H
	db	03AH, 020H, 020H, 000H
	db	017H, 000H, 001H, 017H
	db	020H, 020H, 020H, 020H
	db	020H, 020H, 000H, 017H
	db	0B5H, 0B6H, 0B7H, 0B8H
	db	0B7H, 0B8H, 000H, 017H
	db	0B7H, 0B8H, 0B5H, 0B6H
	db	0B7H, 0B8H, 000H, 017H
	db	0B7H, 0B8H, 0B7H, 0B8H
	db	0B5H, 0B6H, 000H, 017H
	db	0B5H, 0B6H, 0B5H, 0B6H
	db	0B7H, 0B8H, 000H, 017H
	db	0B7H, 0B8H, 0B5H, 0B6H
	db	0B5H, 0B6H, 000H, 017H
	db	0B5H, 0B6H, 0B5H, 0B6H
	db	0B5H, 0B6H, 000H, 017H
	db	04DH, 048H, 045H, 04CH
	db	053H, 017H, 040H, 049H
	db	02EH, 017H, 040H, 045H
	db	02BH, 02EH, 017H, 040H
	db	045H, 02DH, 02EH, 017H
	db	040H, 052H, 02EH, 017H
;
L0192:
	dcx	b
	in	011H
	xra	a
	cmp	b
	jnz	L0192
	cmp	c
	jnz	L0192
	ret
;
L019F:
	ldax	d
	mov	m,a
	inx	h
	inx	d
	dcr	c
	rz
	jmp	L019F
;
L01A8:
	ldax	d
	mov	m,a
	cpi	003H
	rz
	inx	h
	inx	d
	jmp	L01A8
;
L01B2:
	ldax	d
	mov	m,a
	inx	h
	inx	d
	cpi	017H
	rz
	jmp	L01B2
;
L01BC:
	mov	a,b
	ani	03FH
	mov	b,a
	mvi	a,040H
	ora	b
	mov	b,a
	mvi	a,00EH
	ori	040H
	out	040H
	mov	a,c
	out	044H
	mov	a,b
	out	045H
	mvi	a,00EH
	ori	0C0H
	out	040H
	in	040H
	ret
;
L01D9:
	xra	a
	out	011H
	out	011H
	out	011H
	out	011H
	mvi	a,040H
	out	011H
	mvi	a,07AH
	out	011H
	mvi	a,025H
	out	011H
	ret
;
L01EF:
	mvi	a,002H
	sta	XBECA
L01F4:
	mvi	a,037H
	out	011H
	xra	a
	sta	XBEB1
	in	011H
	mov	c,a
	ani	002H
	jz	L0250
	mov	a,c
	ani	038H
	jz	L0211
	sta	XBEB1
	mvi	a,037H
	out	011H
L0211:
	in	010H
	ani	07FH
	cpi	004H
	rz
	cmp	d
	jnz	L024B
L021C:
	cmp	e
	mov	m,a
	rz
	cpi	004H
	rz
	inx	h
	dcr	b
	rz
L0225:
	in	011H
	mov	c,a
	ani	002H
	jnz	L0237
	in	040H
	ani	040H
	jz	L0225
	jmp	L0253
;
L0237:
	mov	a,c
	ani	038H
	jz	L0244
	sta	XBEB1
	mvi	a,037H
	out	011H
L0244:
	in	010H
	ani	07FH
	jmp	L021C
;
L024B:
	dcr	b
	rz
	jmp	L01F4
;
L0250:
	nop
	stc
	ret
;
L0253:
	lda	XBEC9
	inr	a
	sta	XBEC9
	lda	XBECA
	dcr	a
	sta	XBECA
	jnz	L0225
	mvi	a,040H
	stc
	ret
;
L0268:
	lxi	b,02200H
	call	L0192
L026E:
	in	011H
	ani	004H
	jz	L026E
	mov	a,m
	cpi	017H
	rz
	out	010H
	inx	h
	jmp	L026E
;
L027F:
	in	011H
	in	021H
	ani	004H
	jz	L027F
	mov	a,m
	cpi	017H
	rz
	out	020H
	inx	h
	jmp	L027F
;
	db	01AH, 0E6H, 00FH, 077H
	db	023H, 013H, 00DH, 0C2H
	db	092H, 002H, 0C9H, 01AH
	db	0F6H, 030H, 077H, 023H
	db	013H, 00DH, 0C2H, 09DH
	db	002H, 0C9H
;
L02A8:
	push	b
	lxi	b,00002H
	xra	a
L02AD:
	ldax	d
	mov	b,a
	mov	a,m
	sbb	b
	jp	L02B7
	adi	00AH
	stc
L02B7:
	mov	m,a
	dcx	h
	dcx	d
	dcr	c
	jnz	L02AD
	pop	b
	ret
;
	db	01AH, 0FEH, 002H, 0C8H
	db	077H, 023H, 013H, 000H
	db	0C8H, 0C3H, 0C0H, 002H
;
L02CC:
	push	b
	lxi	b,005FFH
L02D0:
	dcx	b
	in	011H
	xra	a
	cmp	b
	jnz	L02D0
	cmp	c
	jnz	L02D0
	pop	b
	ret
;
L02DE:
	mvi	a,017H
	cmp	m
	jz	L02F4
	ldax	d
	cpi	003H
	rz
	mov	m,a
L02E9:
	cmp	m
	jnz	L02E9
	inx	h
	inx	d
	dcr	c
	rz
	jmp	L02DE
;
L02F4:
	mvi	a,080H
	ret
;
L02F7:
	lxi	d,01FFFH
	lxi	h,XC000
L02FD:
	mvi	a,065H
	cmp	m
	jz	L0308
	mov	m,a
L0304:
	cmp	m
	jnz	L0304
L0308:
	in	011H
	inx	h
	dcx	d
	mvi	a,000H
	cmp	d
	jnz	L02FD
	cmp	e
	jnz	L02FD
	ret
;
	db	021H, 00AH, 0BDH, 00EH
	db	040H, 036H, 040H, 023H
	db	00DH, 0C2H, 01CH, 003H
	db	0C9H
;
L0324:
	mvi	c,001H
L0326:
	ldax	d
	cpi	017H
	jz	L0331
	inx	d
	inr	c
	jmp	L0326
;
L0331:
	ldax	d
	mov	m,a
	call	L02CC
	dcx	h
	dcx	d
	dcr	c
	jnz	L0331
	ret
;
L033D:
	mov	a,m
	cpi	017H
	jz	L0348
	inx	h
	dcx	d
	jmp	L033D
;
L0348:
	lxi	h,0017AH
L034B:
	ldax	d
	cmp	m
	rnz
	cpi	017H
	rz
	inx	d
	inx	h
	jmp	L034B
;
L0356:
	cpi	030H
	jnz	L036E
	lda	XBEC3
	cpi	030H
	jnz	L036E
	lhld	XBEBD
	shld	XBEBF
	mvi	m,020H
	jmp	L03AE
;
L036E:
	lhld	XC004
L0371:
	lxi	d,XBEC1
	mvi	c,004H
L0376:
	dcx	h
	mov	a,m
	cpi	002H
	jz	L0385
	cpi	017H
	jz	L03B4
	jmp	L0376
;
L0385:
	push	h
	inx	h
L0387:
	ldax	d
	cmp	m
	jnz	L0395
	inx	h
	inx	d
	dcr	c
	jnz	L0387
	jmp	L0399
;
L0395:
	pop	h
	jmp	L0371
;
L0399:
	nop
	xchg
	pop	h
	lhld	XBEBD
	shld	XBEBF
L03A2:
	ldax	d
	cpi	002H
	jz	L03AE
	mov	m,a
	inx	h
	inx	d
	jmp	L03A2
;
L03AE:
	mvi	m,000H
	shld	XBEBD
	ret
;
L03B4:
	lhld	XBEBD
	shld	XBEBF
	lxi	d,XBEC3
	mvi	c,002H
	call	L019F
	jmp	L03AE
;
L03C5:
	nop
	xra	a
	out	011H
	out	011H
	out	011H
	out	011H
	mvi	a,040H
	out	011H
	mvi	a,07AH
	out	011H
	mvi	a,025H
	out	011H
	xra	a
	out	021H
	out	021H
	out	021H
	out	021H
	mvi	a,040H
	out	021H
	mvi	a,04EH
	out	021H
	mvi	a,025H
	out	021H
	mvi	a,00EH
	out	040H
	mvi	a,089H
	out	033H
	xra	a
	mvi	c,000H
	lxi	h,0FFFFH
L03FE:
	mov	m,a
	dcx	h
	dcr	c
	jnz	L03FE
	lxi	h,0BE2FH
	mvi	m,002H
	inx	h
	mvi	c,012H
L040C:
	mvi	m,030H
	inx	h
	dcr	c
	jnz	L040C
	mvi	m,003H
	mvi	a,04CH
	sta	XBE37
	mvi	a,030H
	sta	XBEB2
	sta	XBEB3
	sta	XBEC5
	sta	XBEB9
	sta	XBEC6
	sta	XBEC7
	sta	XBEC9
	mvi	a,031H
	sta	XBEB8
	call	L0063
	mvi	a,0FFH
	sta	XBBFF
	lxi	h,00101H
	lxi	d,0010FH
	in	011H
	call	L4000
	in	011H
	mvi	b,032H
	call	L00B3
	lxi	h,0C001H
	mvi	c,005H
	mov	a,m
L0456:
	inx	h
	xra	m
	dcr	c
	jnz	L0456
	lxi	h,XC000
	cmp	m
	jnz	L0471
	lxi	h,0017AH
	lxi	d,0C00FH
	call	L033D
	cpi	017H
	jz	L04DA
L0471:
	mvi	a,001H
	sta	XBBFB
	mvi	a,000H
	sta	XBBFC
	sta	XBBFD
	lxi	d,000FBH
	lxi	h,00101H
	in	011H
	call	L4000
	call	L02F7
	lxi	h,0C010H
	mov	a,l
	sta	XC004
	call	L02CC
	mov	a,h
	sta	XC005
	call	L02CC
	lxi	h,0C001H
	mvi	c,003H
L04A2:
	mvi	m,030H
	inx	h
	call	L02CC
	dcr	c
	jnz	L04A2
	lxi	d,0017AH
	lxi	h,0C00FH
	call	L0324
	call	L02CC
	lxi	h,0DFFEH
	mvi	m,017H
	call	L02CC
	inx	h
	mvi	m,017H
	call	L02CC
	lxi	h,0C001H
	mvi	c,005H
	mov	a,m
L04CC:
	inx	h
	xra	m
	dcr	c
	jnz	L04CC
	sta	XC000
	call	L02CC
	in	011H
L04DA:
	call	L0063
	lda	XBEC5
	cpi	043H
	jnz	L04ED
	mvi	a,000H
	sta	XBEC5
	jmp	L0579
;
L04ED:
	lxi	h,00180H
	call	L027F
	lxi	h,00189H
	call	L027F
	mvi	a,003H
	sta	XBEB3
L04FE:
	lxi	d,00125H
	lxi	h,0BD0AH
	call	L01A8
	lda	XBEB3
	dcr	a
	ori	030H
	sta	XBD14
	lxi	d,0BD0AH
	lxi	h,00101H
	in	011H
	call	L4000
	lxi	b,000CDH
	call	L01BC
	lxi	h,00184H
	call	L027F
	in	011H
L0529:
	in	021H
	ani	002H
	jz	L0539
	in	011H
	in	020H
	cpi	00DH
	jz	L0559
L0539:
	in	011H
	in	040H
	ani	040H
	jz	L0529
	lda	XBEB3
	dcr	a
	sta	XBEB3
	jnz	L04FE
	mvi	a,030H
	sta	XBEB3
	mvi	b,014H
	call	L00B3
	jmp	L0569
;
L0559:
	lxi	h,00189H
	call	L027F
	mvi	a,04FH
	sta	XBEB3
	mvi	b,014H
	call	L00B3
L0569:
	in	011H
	mvi	a,0FFH
	sta	XBBFF
	call	L0063
L0573:
	lxi	b,000CDH
	call	L01BC
L0579:
	in	041H
	ani	00EH
	ori	030H
	sta	XBEB0
	in	041H
	rar
	rar
	rar
	rar
	ani	007H
	ori	030H
	sta	XBEAF
	call	L01D9
	mvi	a,037H
	out	011H
	in	010H
	mvi	a,000H
	sta	XBEC6
	mvi	a,003H
	sta	XBEB5
L05A2:
	lda	XBEAF
	mov	d,a
	mvi	e,005H
	mvi	b,005H
	lxi	h,0BC00H
	call	L01EF
	jnc	L062C
	in	041H
	ani	080H
	jnz	L0E87
	in	040H
	ani	040H
	jz	L05A2
	lda	XBEC9
	inr	a
	sta	XBEC9
	lxi	b,000CDH
	call	L01BC
	lda	XBEC9
	cpi	016H
	cp	L07F8
	lda	XBE3A
	cpi	031H
	jnz	L05A2
	lda	XBEB9
	cpi	045H
	jz	L05EE
	cpi	05AH
	jz	L05EE
	jmp	L05A2
;
L05EE:
	lxi	d,0BE0AH
	lda	XBEC8
	cpi	000H
	jnz	L0621
	mvi	a,001H
	sta	XBEC8
L05FE:
	lda	XBE31
	sui	033H
	jp	L0616
	lxi	h,00301H
	in	011H
	call	L4000
	lda	XBE31
	cpi	031H
	jnz	L05A2
L0616:
	lxi	h,00302H
	in	011H
	call	L4000
	jmp	L05A2
;
L0621:
	lxi	d,0BE1AH
	mvi	a,000H
	sta	XBEC8
	jmp	L05FE
;
L062C:
	cpi	004H
	jz	L0579
	cpi	005H
	jnz	L0579
	dcx	h
	mov	a,m
	ani	07EH
	mov	c,a
	lda	XBEB0
	cmp	c
	jnz	L0579
	dcx	h
	lda	XBEAF
	cmp	m
	jnz	L0579
	inx	h
	mov	a,m
	ani	001H
	jnz	L0931
	lda	XBEB8
	cpi	031H
	jz	L070E
L0659:
	cpi	053H
	jz	L070E
	cpi	045H
	jz	L067A
	cpi	054H
	jz	L067A
	cpi	044H
	jz	L067A
	cpi	04EH
	jz	L06B7
	cpi	04CH
	jz	L06E5
	jmp	L070E
;
L067A:
	lxi	b,01180H
	call	L0192
	lxi	h,0BC0AH
	mvi	m,07FH
	inx	h
	mvi	m,07FH
	inx	h
	lxi	d,0BC8AH
	call	L01A8
	lxi	h,0BC14H
	mvi	m,04CH
	mvi	b,000H
	lxi	h,0BC0CH
L0699:
	inx	h
	mov	a,m
	xra	b
	mov	b,a
	mov	a,m
	cpi	003H
	jnz	L0699
	inx	h
	mov	m,b
	inx	h
	mvi	m,07FH
	inx	h
	mvi	m,07FH
	inx	h
	mvi	m,017H
	lxi	h,0BC0AH
	call	L026E
	jmp	L0777
;
L06B7:
	lxi	b,01180H
	call	L0192
	lxi	h,0BC0AH
	mvi	m,07FH
	inx	h
	mvi	m,07FH
	inx	h
	lxi	d,0BC8AH
	call	L01A8
	lxi	h,0BC14H
	mvi	m,04CH
	inx	h
	mvi	c,00CH
L06D4:
	mvi	m,030H
	inx	h
	dcr	c
	jnz	L06D4
	mvi	m,003H
	mvi	b,000H
	lxi	h,0BC0CH
	jmp	L0699
;
L06E5:
	lxi	b,01180H
	call	L0192
	lxi	h,0BC0AH
	mvi	m,07FH
	inx	h
	mvi	m,07FH
	inx	h
	lxi	d,0BC8AH
	call	L01A8
	lxi	h,0BC14H
	mvi	m,04CH
	inx	h
	lxi	d,0BE38H
	call	L01A8
	mvi	b,000H
	lxi	h,0BC0CH
	jmp	L0699
;
L070E:
	lxi	b,01180H
	call	L0192
	lxi	h,0BC0AH
	mvi	m,07FH
	inx	h
	mvi	m,07FH
	inx	h
	mvi	m,002H
	inx	h
	lxi	d,XBC8B
	mvi	c,007H
	call	L019F
	lxi	h,0BC0FH
	lxi	d,0C001H
	mvi	c,003H
	call	L019F
	mvi	c,00AH
	lda	XBEB2
	cpi	040H
	jp	L0740
	mvi	m,046H
	inx	h
L0740:
	mov	m,a
	inx	h
	lda	XBEB3
	cpi	040H
	jp	L074D
	mvi	m,046H
	inx	h
L074D:
	mov	m,a
	inx	h
	mvi	m,003H
	push	h
	mvi	b,000H
L0754:
	mov	a,m
	cpi	002H
	jz	L0760
	xra	b
	mov	b,a
	dcx	h
	jmp	L0754
;
L0760:
	pop	h
	inx	h
	mov	m,b
	inx	h
	mvi	m,07FH
	inx	h
	mvi	m,07FH
	inx	h
	mvi	m,017H
	mvi	a,053H
	sta	XBEB8
	lxi	h,0BC0AH
	call	L0268
L0777:
	nop
L0778:
	mvi	d,010H
	mvi	e,031H
	mvi	b,00AH
	lxi	h,0BC00H
	call	L01EF
	jnc	L07AD
	in	011H
	in	040H
	ani	040H
	jz	L0778
	lda	XBEC9
	inr	a
	sta	XBEC9
	lxi	b,000CDH
	call	L01BC
	lda	XBEC9
	cpi	016H
	cp	L07F8
	cpi	006H
	jz	L0579
	jmp	L0778
;
L07AD:
	cpi	004H
	jz	L0579
	lxi	h,0BC00H
	mvi	c,005H
L07B7:
	mvi	a,010H
	cmp	m
	jnz	L07CD
	mvi	a,015H
	cmp	m
	jz	L0659
	inx	h
	mvi	a,031H
	cmp	m
	jnz	L07E9
	jmp	L07D5
;
L07CD:
	inx	h
	dcr	c
	jnz	L07B7
	jmp	L07E9
;
L07D5:
	lxi	b,01180H
	call	L0192
	lxi	h,000C8H
	call	L0268
	mvi	a,04FH
	sta	XBEB2
	jmp	L0579
;
L07E9:
	lxi	h,01180H
	call	L0192
	lxi	h,000C2H
	call	L0268
	jmp	L0579
;
L07F8:
	nop
	in	030H
	lda	XBEC7
	inr	a
	sta	XBEC7
	mvi	a,000H
	sta	XBEC9
	lda	XBEC6
	inr	a
	sta	XBEC6
	cpi	006H
	cz	L08BB
	cpi	006H
	rz
	lda	XBC93
	cpi	030H
	jnz	L0826
	lda	XBC94
	cpi	030H
	jz	L082E
L0826:
	lda	XBEB9
	cpi	045H
	jnz	L08B7
L082E:
	in	030H
	lda	XBEB3
	cpi	030H
	jz	L084E
	lda	XBEB9
	cpi	000H
	jz	L08B7
	lda	XBE2A
	cpi	030H
	jz	L084E
	lxi	h,XBE2A
	call	L027F
L084E:
	lda	XBEC7
	ani	001H
	jnz	L08B7
	lxi	h,0BE0FH
	mov	a,m
	ani	00FH
	mov	m,a
	mov	b,a
	dcx	h
	mov	a,m
	ani	00FH
	mov	m,a
	ora	b
	jz	L08A1
	lxi	h,0BE0FH
	lxi	d,00140H
	call	L02A8
	lxi	h,0BE0FH
	mov	a,m
	mov	b,a
	ori	030H
	mov	m,a
	dcx	h
	mov	a,m
	mov	c,a
	ori	030H
	mov	m,a
	mov	a,b
	ora	c
	jz	L08A1
L0883:
	lxi	d,0BE0AH
	lxi	h,00301H
	in	011H
	call	L4000
	lxi	h,0BE1AH
	lxi	d,0BE0AH
	mvi	c,007H
	call	L019F
	mvi	m,009H
	inx	h
	mvi	m,000H
	jmp	L08B7
;
L08A1:
	lxi	h,0BE0CH
	mvi	m,020H
	inx	h
	mvi	m,020H
	inx	h
	mvi	m,020H
	inx	h
	mvi	m,020H
	mvi	a,05AH
	sta	XBEB9
	jmp	L0883
;
L08B7:
	lda	XBEC6
	ret
;
L08BB:
	mvi	a,001H
	sta	XBBFB
	mvi	a,000H
	sta	XBBFC
	mvi	a,000H
	sta	XBBFD
	mvi	a,06CH
	sta	XBBFE
	call	L0063
	lxi	h,0BD0AH
	shld	XBEBD
	lxi	h,XBEC1
	lxi	d,00929H
	mvi	c,004H
	call	L02DE
	call	L0356
	lhld	XBEBF
	xchg
	lxi	h,00101H
	mvi	a,0FFH
	sta	XBBFF
	in	011H
	call	L4000
	lxi	h,0BD0AH
	shld	XBEBD
	lxi	h,XBEC1
	lxi	d,0092DH
	mvi	c,004H
	call	L02DE
	call	L0356
	lhld	XBEBF
	xchg
	lxi	h,00201H
	mvi	a,0FFH
	sta	XBBFF
	in	011H
	call	L4000
	mvi	a,000H
	sta	XBEB9
	mvi	a,032H
	sta	XBEB2
	mvi	a,006H
	ret
;
	db	031H, 042H, 030H, 031H
	db	032H, 042H, 030H, 031H
;
L0931:
	lxi	b,01180H
	call	L0192
	lxi	h,000CEH
	call	L0268
	call	L01D9
L0940:
	mvi	d,002H
	mvi	e,003H
	mvi	b,080H
	lxi	h,0BC8AH
	call	L01EF
	jnc	L0984
	in	011H
	in	040H
	ani	040H
	jz	L0940
	lda	XBEC9
	inr	a
	sta	XBEC9
	lxi	b,000CDH
	call	L01BC
	lda	XBEC9
	cpi	016H
	jnz	L0940
	mvi	a,000H
	sta	XBEC9
	lda	XBEC6
	inr	a
	sta	XBEC6
	cpi	006H
	jnz	L0940
	call	L08BB
	jmp	L0573
;
L0984:
	cpi	004H
	jz	L0579
	cpi	003H
	jnz	L0A41
L098E:
	in	011H
	ani	002H
	jz	L098E
	in	010H
	sta	XBEB6
	lda	XBEB1
	ora	a
	nop
	nop
	nop
	mvi	b,000H
	inx	h
L09A4:
	dcx	h
	mov	a,m
	cpi	002H
	jz	L09B0
	xra	b
	mov	b,a
	jmp	L09A4
;
L09B0:
	in	041H
	ani	001H
	jz	L09BE
	lda	XBEB6
	cmp	b
	jnz	L0A41
L09BE:
	lda	XBC92
	sta	XBEB8
	cpi	054H
	jz	L0B1B
	cpi	045H
	jz	L0C75
	cpi	04EH
	jz	L0AA9
	cpi	044H
	jz	L0BE8
	cpi	053H
	jz	L09E7
	cpi	04CH
	jz	L09E7
	mvi	a,001H
	sta	XBEB2
L09E7:
	lxi	b,01180H
	call	L0192
	lxi	h,000D5H
	call	L0268
	lda	XBC92
	sta	XBEB8
	call	L01D9
L09FC:
	in	011H
	mvi	d,004H
	mvi	e,004H
	mvi	b,005H
	lxi	h,0BC00H
	call	L01EF
	jnc	L0A33
	in	011H
	in	040H
	ani	040H
	jz	L09FC
	lda	XBEC9
	inr	a
	sta	XBEC9
	lxi	b,000CDH
	call	L01BC
	lda	XBEC9
	cpi	016H
	cp	L07F8
	cpi	006H
	jz	L0579
	jmp	L09FC
;
L0A33:
	cpi	004H
	jnz	L07E9
	lxi	h,01180H
	call	L0192
	jmp	L0A7D
;
L0A41:
	lxi	h,01180H
	call	L0192
	lxi	h,000C2H
	call	L0268
	jmp	L0940
;
L0A50:
	mvi	a,031H
	sta	XBEB2
	jmp	L09E7
;
	db	03EH, 032H, 032H, 0B2H
	db	0BEH, 0C3H, 0E7H, 009H
;
L0A60:
	mvi	a,033H
	sta	XBEB2
	jmp	L09E7
;
L0A68:
	mvi	a,034H
	sta	XBEB2
	jmp	L09E7
;
	db	03AH, 0B5H, 0BEH, 03DH
	db	032H, 0B5H, 0BEH, 0C2H
	db	0F9H, 009H, 0C3H, 079H
	db	005H
;
L0A7D:
	lda	XBC92
	cpi	054H
	jz	L0B31
	cpi	045H
	jz	L0C8B
	cpi	04EH
	jz	L0ABF
	cpi	044H
	jz	L0A9E
	cpi	053H
	jz	L0579
	cpi	04CH
	jmp	L0579
;
L0A9E:
	lda	XBEC5
	cpi	043H
	jz	L0471
	jmp	L0579
;
L0AA9:
	lda	XBC8B
	mov	b,a
	lda	X0040
	ori	030H
	cmp	b
	jm	L0A50
	mov	a,b
	cpi	030H
	jm	L0A50
	jmp	L09E7
;
L0ABF:
	mvi	a,001H
	sta	XBBFB
	mvi	a,000H
	sta	XBBFC
	sta	XBBFD
	mvi	a,04EH
	sta	XBEB9
	lda	XBC8B
	cpi	030H
	jz	L0B10
	ani	00FH
	mov	h,a
	lda	XBC8C
	cpi	032H
	jnz	L0AE9
	mvi	l,001H
	jmp	L0AED
;
L0AE9:
	cpi	033H
	mvi	l,002H
L0AED:
	lxi	d,00123H
	in	011H
	call	L4000
	lda	XBC8C
	cpi	031H
	jnz	L0B13
	mvi	l,001H
	lda	XBC8B
	ani	00FH
	mov	h,a
	lxi	d,00123H
	in	011H
	call	L4000
	jmp	L0B13
;
L0B10:
	call	L0063
L0B13:
	mvi	a,04FH
	sta	XBEB2
	jmp	L0579
;
L0B1B:
	lda	XBC8B
	mov	b,a
	lda	X0040
	ori	030H
	cmp	b
	jm	L0A50
	mov	a,b
	cpi	031H
	jm	L0A50
	jmp	L09E7
;
L0B31:
	mvi	a,001H
	sta	XBBFB
	mvi	a,000H
	sta	XBBFD
	sta	XBBFC
	lda	XBEB9
	cpi	045H
	cz	L0063
	cpi	05AH
	cz	L0063
	lxi	h,XBC93
	lxi	d,0BD0AH
	lxi	b,0BD8AH
L0B54:
	mov	a,m
	cpi	003H
	jz	L0B64
	stax	d
	mvi	a,020H
	stax	b
	inx	h
	inx	d
	inx	b
	jmp	L0B54
;
L0B64:
	mvi	a,000H
	stax	d
	stax	b
	lda	XBC90
	mvi	b,0FCH
	cpi	073H
	jz	L0B82
	mvi	b,0F0H
	cpi	062H
	jz	L0B82
	mvi	b,0FAH
	cpi	06EH
	jz	L0B82
	mvi	b,0FFH
L0B82:
	mov	a,b
	sta	XBBFF
	lda	XBC91
	cpi	06CH
	jz	L0B9F
	cpi	072H
	jz	L0B9F
	cpi	06DH
	jz	L0B9F
	cpi	07AH
	jz	L0B9F
	mvi	a,06CH
L0B9F:
	sui	020H
	sta	XBBFE
	lda	XBC8B
	ani	00FH
	mov	h,a
	lda	XBC8C
	cpi	032H
	jnz	L0BB7
	mvi	l,001H
	jmp	L0BBB
;
L0BB7:
	cpi	033H
	mvi	l,002H
L0BBB:
	lxi	d,0BD0AH
	in	011H
	call	L4000
	lda	XBC8C
	cpi	031H
	jnz	L0BDB
	lda	XBC8B
	ani	00FH
	mov	h,a
	mvi	l,001H
	lxi	d,0BD0AH
	in	011H
	call	L4000
L0BDB:
	mvi	a,04FH
	sta	XBEB2
	mvi	a,054H
	sta	XBEB9
	jmp	L0579
;
L0BE8:
	lda	XBC8B
	cpi	030H
	jnz	L0C15
	lda	XBC8C
	cpi	030H
	jnz	L0C15
	lda	XBC90
	cpi	030H
	jnz	L0C15
	lda	XBC91
	cpi	030H
	jnz	L0C15
	mvi	a,043H
	sta	XBEC5
	mvi	a,04FH
	sta	XBEB2
	jmp	L09E7
;
L0C15:
	lhld	XC004
	lxi	d,0BC8AH
	mvi	c,003H
	call	L02DE
	cpi	080H
	jz	L0A68
	lxi	d,XBC90
	mvi	c,002H
	call	L02DE
	cpi	080H
	jz	L0A68
	inx	d
	mvi	c,000H
	call	L02DE
	cpi	080H
	jz	L0A68
	mvi	m,002H
	call	L02CC
	mov	a,l
	sta	XC004
	call	L02CC
	mov	a,h
	sta	XC005
	call	L02CC
	lxi	d,0BC8DH
	lxi	h,0C001H
	mvi	c,003H
	call	L02DE
	lxi	h,0C001H
	mvi	c,005H
	mov	a,m
L0C61:
	inx	h
	xra	m
	dcr	c
	jnz	L0C61
	sta	XC000
	call	L02CC
	mvi	a,04FH
	sta	XBEB2
	jmp	L09E7
;
L0C75:
	lxi	h,0BC8DH
	lxi	d,0C001H
	mvi	c,003H
L0C7D:
	ldax	d
	cmp	m
	jnz	L0A60
	inx	h
	inx	d
	dcr	c
	jnz	L0C7D
	jmp	L09E7
;
L0C8B:
	lxi	d,0BC8AH
	lxi	h,0BE2FH
	call	L01A8
	lxi	h,0BD0AH
	shld	XBEBD
	mvi	a,001H
	sta	XBBFB
	mvi	a,000H
	sta	XBBFC
	mvi	a,004H
	sta	XBBFD
	mvi	a,06CH
	sta	XBBFE
	mvi	a,031H
	sta	XBEC1
	mvi	a,042H
	sta	XBEC2
	lda	XBC97
	sta	XBEC3
	lda	XBC98
	sta	XBEC4
	call	L0356
	lhld	XBEBF
	xchg
	lxi	h,00101H
	mvi	a,0FFH
	sta	XBBFF
	in	011H
	call	L4000
	mvi	a,001H
	sta	XBBFB
	mvi	a,000H
	sta	XBBFC
	mvi	a,004H
	sta	XBBFD
	mvi	a,06CH
	sta	XBBFE
	mvi	a,032H
	sta	XBEC1
	mvi	a,042H
	sta	XBEC2
	lda	XBC99
	sta	XBEC3
	lda	XBC9A
	sta	XBEC4
	call	L0356
	lhld	XBEBF
	xchg
	lxi	h,00201H
	mvi	a,0FFH
	sta	XBBFF
	in	011H
	call	L4000
	mvi	a,001H
	sta	XBBFB
	mvi	a,000H
	sta	XBBFC
	mvi	a,002H
	sta	XBBFD
	mvi	a,06CH
	sta	XBBFE
	lxi	h,0BE0AH
	mvi	c,002H
L0D2F:
	mvi	m,020H
	inx	h
	dcr	c
	jnz	L0D2F
	lda	XBC93
	mov	b,a
	lda	XBC94
	ora	b
	ani	00FH
	jnz	L0D4F
	mvi	c,004H
L0D45:
	mvi	m,020H
	inx	h
	dcr	c
	jnz	L0D45
	jmp	L0D5F
;
L0D4F:
	mvi	m,030H
	inx	h
	mvi	m,03AH
	inx	h
	lda	XBC93
	mov	m,a
	inx	h
	lda	XBC94
	mov	m,a
	inx	h
L0D5F:
	mvi	m,009H
	inx	h
	push	h
	lxi	h,00142H
	lxi	d,00008H
	lda	XBC96
	cpi	030H
	jz	L0D77
	ani	00FH
	mov	c,a
	jmp	L0D7D
;
L0D77:
	lxi	d,00142H
	jmp	L0D83
;
L0D7D:
	dad	d
	dcr	c
	jnz	L0D7D
	xchg
L0D83:
	pop	h
	mvi	c,007H
	call	L019F
	lxi	h,0BE1AH
	lxi	d,0BE0AH
	mvi	c,007H
	call	L019F
	mvi	m,009H
	inx	h
	mvi	m,000H
	mvi	a,001H
	sta	XBEC8
	lda	XBC8C
	cpi	032H
	jnz	L0DAC
	lxi	h,00301H
	jmp	L0DAF
;
L0DAC:
	lxi	h,00302H
L0DAF:
	lxi	d,0BE0AH
	mvi	a,0FFH
	sta	XBBFF
	in	011H
	call	L4000
	lda	XBC8C
	cpi	031H
	jnz	L0DCF
	lxi	h,00301H
	lxi	d,0BE0AH
	in	011H
	call	L4000
L0DCF:
	mvi	a,04FH
	sta	XBEB2
	mvi	a,000H
	sta	XBEC7
	sta	XBEC9
	mvi	a,045H
	sta	XBEB9
	lda	XBEB3
	cpi	030H
	jz	L0573
	lda	XBC9B
	cpi	030H
	sta	XBE2A
	jz	L0573
	lxi	h,00184H
	call	L027F
	lxi	b,000CDH
	call	L01BC
L0E00:
	in	021H
	ani	002H
	jnz	L0E25
	in	011H
	in	040H
	ani	040H
	jz	L0E00
	mvi	a,036H
	sta	XBEB3
	mvi	a,020H
	out	043H
	mvi	b,001H
	call	L02CC
	mvi	a,000H
	out	043H
	jmp	L0573
;
L0E25:
	in	020H
	cpi	03AH
	jnz	L0E00
	lxi	h,XBE2A
	mvi	m,02EH
	inx	h
	lda	XBE40
	mov	m,a
	inx	h
	lda	XBE41
	mov	m,a
	inx	h
	mvi	m,02EH
	inx	h
	mvi	m,017H
	lxi	h,XBE2A
	call	L027F
	mvi	a,04FH
	sta	XBEB3
	jmp	L0573
;
L0E4F:
	lda	X0040
	mov	h,a
L0E53:
	lda	X0041
	mov	l,a
L0E57:
	mov	a,h
	adi	030H
	sta	XBD0C
	mov	a,l
	cpi	002H
	jz	L0E68
	mvi	a,056H
	jmp	L0E6A
;
L0E68:
	mvi	a,052H
L0E6A:
	sta	XBD0D
	push	h
	lxi	d,0BD0AH
	in	011H
	call	L4000
	pop	h
	dcr	l
	jnz	L0E57
	dcr	h
	jnz	L0E53
	ret
;
L0E80:
	cpi	03AH
	rc
	mvi	b,007H
	add	b
	ret
;
L0E87:
	in	041H
	ani	080H
	jz	L03C5
	lxi	h,0BD0AH
	lxi	d,000E5H
	call	L01B2
	mvi	a,000H
	mov	m,a
	lxi	h,0BD10H
	lda	XBEAF
	mov	m,a
	inx	h
	lda	XBEB0
	call	L0E80
	mov	m,a
	mvi	a,0FFH
	sta	XBBFF
	call	L0E4F
	mvi	b,064H
	call	L00B3
	lxi	h,0BD0AH
	mvi	b,063H
	mvi	a,07FH
L0EBD:
	mov	m,a
	inx	h
	dcr	b
	jnz	L0EBD
	mvi	a,000H
	mov	m,a
	mvi	a,040H
	sta	XBBFF
	in	011H
	lxi	d,0BD0AH
	call	L0086
	mvi	b,064H
	call	L00B3
	mvi	a,030H
	sta	XBECB
	lxi	h,0BD0AH
	lxi	d,00133H
	call	L01B2
	lda	XBECB
	sta	XBD12
	mvi	a,001H
	sta	XBBFB
	mvi	a,000H
	sta	XBBFC
	mvi	a,00BH
	sta	XBBFD
	mvi	a,04CH
	sta	XBBFE
	mvi	a,0FFH
	sta	XBBFF
	lxi	h,00101H
	lxi	d,0BD0AH
	call	L4000
	lda	XBECB
	inr	a
	sta	XBECB
	mvi	b,00AH
	call	L00B3
L0F1A:
	nop
	jmp	L0F1A
;
	db	0C3H, 0DDH, 00EH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH
;
L4000:
	jmp	L59A1
;
	db	000H, 006H, 00AH, 00EH
	db	004H, 002H, 004H, 005H
	db	006H, 00AH, 022H, 000H
	db	024H, 000H, 004H, 004H
	db	002H, 004H, 005H, 006H
	db	00AH, 018H, 004H, 015H
	db	003H, 009H, 006H, 003H
	db	004H, 005H, 006H, 00AH
	db	027H
X4024:
	db	000H, 068H
X4026:
	db	040H, 000H
X4028:
	db	0FEH, 0BBH
X402A:
	db	0FFH, 0BBH
X402C:
	db	0FBH, 0BBH
X402E:
	db	0FCH, 0BBH
X4030:
	db	0FDH, 0BBH
;
L4032:
	in	043H
	ori	001H
	out	043H
	nop
	in	011H
	nop
	in	043H
	ani	0FEH
	out	043H
	ret
;
L4043:
	in	043H
	ori	002H
	out	043H
	nop
	in	011H
	nop
	in	043H
	ani	0FDH
	out	043H
	ret
;
L4054:
	lxi	h,00002H
	dad	sp
	mov	c,m
	mvi	a,000H
	out	042H
	inr	c
	jmp	L4064
;
L4061:
	call	L4032
L4064:
	dcr	c
	jnz	L4061
	ret
;
L4069:
	lxi	h,00002H
	dad	sp
	mov	c,m
	mvi	a,000H
	out	042H
	inr	c
	jmp	L4079
;
L4076:
	call	L4043
L4079:
	dcr	c
	jnz	L4076
	ret
;
L407E:
	lxi	h,00002H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	mvi	c,008H
L4087:
	mov	a,e
	ani	001H
	out	042H
	mov	a,e
	rar
	mov	e,a
	call	L4032
	dcr	c
	jnz	L4087
	mvi	c,004H
L4098:
	mov	a,d
	ani	001H
	out	042H
	mov	a,d
	rar
	mov	d,a
	call	L4032
	dcr	c
	jnz	L4098
	ret
;
L40A8:
	lxi	h,00002H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	mvi	c,008H
L40B1:
	mov	a,e
	ani	001H
	out	042H
	mov	a,e
	rar
	mov	e,a
	call	L4043
	dcr	c
	jnz	L40B1
	mvi	c,003H
L40C2:
	mov	a,d
	ani	001H
	out	042H
	mov	a,d
	rar
	mov	d,a
	call	L4043
	dcr	c
	jnz	L40C2
	ret
;
L40D2:
	lxi	h,00002H
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	h
	inx	h
	mov	a,m
	ora	a
	jz	L40E2
	mvi	a,004H
L40E2:
	mov	b,a
	in	043H
	ani	0F3H
	ora	b
	out	043H
	mov	b,a
	lxi	h,04117H
	dad	d
	mov	a,e
	cpi	007H
	jz	L4105
	mov	a,m
	out	042H
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	mvi	a,000H
	out	042H
	ret
;
L4105:
	mov	a,m
	ora	b
	out	043H
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	mov	a,b
	ani	0F3H
	out	043H
	ret
;
	db	002H, 004H, 008H, 010H
	db	020H, 040H, 080H, 008H
	db	0C9H
;
L4120:
	lxi	h,00002H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	push	d
	inx	h
	mov	e,m
	inx	h
	mov	d,m
	push	d
	inx	h
	mov	e,m
	inx	h
	mov	d,m
	pop	b
	pop	h
L4133:
	mov	a,e
	mov	m,a
	inx	h
	dcx	b
	mov	a,b
	ora	c
	jnz	L4133
	ret
;
L413D:
	in	010H
	ret
;
L4140:
	lhld	X8D42
	lxi	d,L027F
	call	L5B82
	jz	L418C
	lhld	X8D42
	lxi	d,08000H
	dad	d
	xchg
	lxi	h,00002H
	dad	sp
	mov	l,m
	mvi	h,000H
	mov	a,l
	stax	d
	lhld	X8D42
	lxi	d,08280H
	dad	d
	xchg
	lxi	h,00004H
	dad	sp
	mov	l,m
	mvi	h,000H
	mov	a,l
	stax	d
	lhld	X8D42
	inx	h
	shld	X8D42
	lxi	h,00004H
	dad	sp
	mov	e,m
	mvi	d,000H
	lxi	h,00080H
	call	L5B20
	jz	L418C
	lhld	X8D3C
	inx	h
	shld	X8D3C
L418C:
	ret
;
L418D:
	push	b
	push	b
	lxi	h,L0000
	shld	X8D42
	lxi	h,L0000
	shld	X8D3C
	call	L413D
	lxi	d,L0000
	pop	b
	pop	psw
	push	d
	push	b
	jmp	L41AD
;
L41A8:
	pop	b
	pop	d
	inx	d
	push	d
	push	b
L41AD:
	lxi	h,0000CH
	dad	sp
	mov	a,m
	inx	h
	mov	h,m
	mov	l,a
	call	L5B81
	jz	L41CB
	lxi	d,000C0H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
	jmp	L41A8
;
L41CB:
	lhld	X402A
	mov	e,m
	mvi	d,000H
	lxi	h,00010H
	call	L5B20
	jz	L41FB
	lhld	X4028
	mov	e,m
	mvi	d,000H
	lxi	h,00052H
	call	L5B47
	jz	L41FB
	lhld	X4028
	mov	e,m
	mvi	d,000H
	lxi	h,0004DH
	call	L5B47
	jz	L41FB
	lxi	h,00001H
L41FB:
	jz	L4225
	lxi	d,00060H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
	lxi	d,00060H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
	lxi	d,00060H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
L4225:
	lxi	h,L0000
	mov	a,l
	sta	X8932
L422C:
	lxi	h,00006H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	ldax	d
	mvi	h,000H
	mov	l,a
	ora	h
	jz	L45E8
	call	L413D
	lxi	h,00006H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	ldax	d
	mvi	d,000H
	mov	e,a
	lxi	h,0002FH
	call	L5B36
	jz	L426A
	lxi	h,00006H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	inx	d
	ldax	d
	mvi	d,000H
	mov	e,a
	lxi	h,0002DH
	call	L5B36
	jz	L426A
	lxi	h,00001H
L426A:
	jz	L427D
	lxi	h,00006H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	inx	d
	inx	d
	lxi	h,00006H
	dad	sp
	mov	m,e
	inx	h
	mov	m,d
L427D:
	lhld	X4024
	xchg
	lxi	h,00006H
	dad	sp
	mov	a,m
	inx	h
	mov	h,m
	mov	l,a
	mov	l,m
	mvi	h,000H
	push	d
	lxi	d,00018H
	call	L5AC5
	pop	d
	dad	d
	shld	X8D40
	lda	X8932
	mvi	d,000H
	mov	e,a
	ora	d
	jz	L4310
	lhld	X8D40
	inx	h
	mov	e,m
	mvi	d,000H
	lxi	h,00007H
	call	L5B20
	mov	a,l
	sta	X8D3B
	lxi	h,00038H
	lda	X8932
	mvi	d,000H
	mov	e,a
	call	L5B20
	lxi	d,00003H
	call	L5AF7
	mov	a,l
	sta	X8932
	lhld	X8932
	mvi	h,000H
	lda	X8D3B
	mvi	d,000H
	mov	e,a
	call	L5B20
	jnz	L42EA
	lxi	d,00060H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
	jmp	L42F7
;
L42EA:
	lxi	d,000C0H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
L42F7:
	lxi	h,0000AH
	dad	sp
	mov	e,m
	mvi	d,000H
	mov	a,d
	ora	e
	jz	L4310
	lxi	d,000C0H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
L4310:
	call	L413D
	lhld	X8D40
	inx	h
	mov	e,m
	mvi	d,000H
	lxi	h,X0040
	call	L5B20
	jnz	L432D
	lxi	h,L0000
	mov	a,l
	sta	X8932
	jmp	L4338
;
L432D:
	lhld	X8D40
	inx	h
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8932
L4338:
	call	L413D
	lxi	h,00006H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	ldax	d
	mvi	d,000H
	mov	e,a
	lxi	h,00009H
	call	L5B36
	jz	L4370
	lhld	X4028
	mov	e,m
	mvi	d,000H
	lxi	h,00052H
	call	L5B36
	jz	L4370
	lhld	X402A
	mov	e,m
	mvi	d,000H
	lxi	h,00010H
	call	L5B20
	jz	L4370
	lxi	h,00001H
L4370:
	jz	L439A
	lxi	d,00060H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
	lxi	d,00060H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
	lxi	d,00060H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
L439A:
	call	L413D
	lhld	X8D40
	lxi	b,00004H
	dad	b
	shld	X852A
	lhld	X8D40
	lxi	b,0000EH
	dad	b
	shld	X8508
	lxi	h,L0000
	mov	a,l
	sta	X8523
	jmp	L43D5
;
L43BB:
	lhld	X8523
	mvi	h,000H
	inx	h
	mov	a,l
	sta	X8523
	lhld	X852A
	inx	h
	inx	h
	shld	X852A
	lhld	X8508
	inx	h
	inx	h
	shld	X8508
L43D5:
	lxi	h,L0005
	lda	X8523
	mvi	d,000H
	mov	e,a
	call	L5B52
	jz	L4531
	call	L413D
	lxi	h,00008H
	dad	sp
	mov	e,m
	mvi	d,000H
	mov	a,d
	ora	e
	jz	L4408
	lhld	X852A
	mov	e,m
	inx	h
	mov	d,m
	lxi	h,08000H
	call	L5B20
	xchg
	mov	a,d
	ora	e
	jz	L4408
	lxi	d,00001H
L4408:
	jnz	L4430
	lxi	h,00008H
	dad	sp
	mov	e,m
	mvi	d,000H
	call	L5BB5
	jz	L442D
	lhld	X852A
	mov	e,m
	inx	h
	mov	d,m
	lxi	h,02000H
	call	L5B20
	xchg
	mov	a,d
	ora	e
	jz	L442D
	lxi	d,00001H
L442D:
	jz	L4433
L4430:
	lxi	d,00001H
L4433:
	jz	L452E
	lhld	X852A
	mov	e,m
	inx	h
	mov	d,m
	lxi	h,00008H
	call	L5AF6
	lxi	d,000E0H
	call	L5B20
	mov	a,l
	sta	X850A
	lhld	X8523
	mvi	h,000H
	mov	a,l
	sta	X8D3A
	lxi	h,00008H
	dad	sp
	mov	e,m
	mvi	d,000H
	mov	a,d
	ora	e
	jz	L4476
	lxi	h,00020H
	lda	X850A
	mvi	d,000H
	mov	e,a
	call	L5B20
	xchg
	mov	a,d
	ora	e
	jz	L4476
	lxi	d,00001H
L4476:
	jnz	L449E
	lxi	h,00008H
	dad	sp
	mov	e,m
	mvi	d,000H
	call	L5BB5
	jz	L449B
	lxi	h,X0040
	lda	X850A
	mvi	d,000H
	mov	e,a
	call	L5B20
	xchg
	mov	a,d
	ora	e
	jz	L449B
	lxi	d,00001H
L449B:
	jz	L44A1
L449E:
	lxi	d,00001H
L44A1:
	jz	L44B4
	lxi	h,00080H
	lda	X8D3A
	mvi	d,000H
	mov	e,a
	call	L5B10
	mov	a,l
	sta	X8D3A
L44B4:
	lda	X850A
	mvi	d,000H
	mov	e,a
	sui	0A0H
	ora	d
	jnz	L44D0
	lxi	h,00008H
	lda	X8D3A
	mvi	d,000H
	mov	e,a
	call	L5B10
	mov	a,l
	sta	X8D3A
L44D0:
	lda	X850A
	mvi	d,000H
	mov	e,a
	sui	080H
	ora	d
	jnz	L44EC
	lxi	h,00010H
	lda	X8D3A
	mvi	d,000H
	mov	e,a
	call	L5B10
	mov	a,l
	sta	X8D3A
L44EC:
	lhld	X852A
	mov	e,m
	inx	h
	mov	d,m
	lxi	h,00FFFH
	call	L5B20
	xchg
	lhld	X8508
	mov	a,m
	inx	h
	mov	h,m
	mov	l,a
	call	L5B10
	jnz	L4516
	lxi	h,X0040
	lda	X8D3A
	mvi	d,000H
	mov	e,a
	call	L5B10
	mov	a,l
	sta	X8D3A
L4516:
	lda	X8D3A
	mvi	d,000H
	mov	e,a
	push	d
	lxi	h,00008H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	ldax	d
	mvi	h,000H
	mov	l,a
	push	h
	call	L4140
	pop	b
	pop	b
L452E:
	jmp	L43BB
;
L4531:
	call	L413D
	lxi	h,00006H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	ldax	d
	mvi	d,000H
	mov	e,a
	lxi	h,00009H
	call	L5B36
	jz	L4569
	lhld	X4028
	mov	e,m
	mvi	d,000H
	lxi	h,00052H
	call	L5B47
	jz	L4569
	lhld	X402A
	mov	e,m
	mvi	d,000H
	lxi	h,00010H
	call	L5B20
	jz	L4569
	lxi	h,00001H
L4569:
	jz	L4593
	lxi	d,00060H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
	lxi	d,00060H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
	lxi	d,00060H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
L4593:
	call	L413D
	lxi	h,00006H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	ldax	d
	mvi	d,000H
	mov	e,a
	lxi	h,00020H
	call	L5B36
	jz	L45BC
	lhld	X402A
	mov	e,m
	mvi	d,000H
	lxi	h,00020H
	call	L5B20
	jz	L45BC
	lxi	h,00001H
L45BC:
	jz	L45D9
	lxi	d,00058H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
	lxi	d,00058H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
L45D9:
	lxi	h,00006H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	dcx	h
	inx	d
	mov	m,e
	inx	h
	mov	m,d
	jmp	L422C
;
L45E8:
	lhld	X402A
	mov	e,m
	mvi	d,000H
	lxi	h,00010H
	call	L5B20
	jz	L4609
	lhld	X4028
	mov	e,m
	mvi	d,000H
	lxi	h,00052H
	call	L5B36
	jz	L4609
	lxi	h,00001H
L4609:
	jz	L4633
	lxi	d,00060H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
	lxi	d,00060H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
	lxi	d,00060H
	push	d
	lxi	d,L0000
	push	d
	call	L4140
	pop	b
	pop	b
L4633:
	lhld	X8D42
	shld	X892C
	lhld	X4028
	mov	e,m
	mvi	d,000H
	mov	a,e
	sui	052H
	ora	d
	jnz	L46DE
	lxi	d,L0000
	pop	psw
	push	d
	jmp	L4651
;
L464E:
	pop	d
	inx	d
	push	d
L4651:
	lhld	X892C
	lxi	d,00002H
	call	L5A78
	pop	d
	push	d
	call	L5B81
	jz	L46DE
	call	L413D
	pop	d
	push	d
	lxi	h,08000H
	dad	d
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8933
	lxi	h,08000H
	dad	d
	xchg
	lhld	X892C
	dcx	h
	push	d
	pop	b
	pop	d
	push	d
	push	b
	call	L5BC1
	lxi	d,08000H
	dad	d
	mov	e,m
	mvi	d,000H
	pop	h
	mov	m,e
	lhld	X892C
	dcx	h
	pop	d
	push	d
	call	L5BC1
	lxi	d,08000H
	dad	d
	lda	X8933
	mvi	d,000H
	mov	e,a
	mov	m,e
	pop	d
	push	d
	lxi	h,08280H
	dad	d
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8D6D
	lxi	h,08280H
	dad	d
	xchg
	lhld	X892C
	dcx	h
	push	d
	pop	b
	pop	d
	push	d
	push	b
	call	L5BC1
	lxi	d,08280H
	dad	d
	mov	e,m
	mvi	d,000H
	pop	h
	mov	m,e
	lhld	X892C
	dcx	h
	pop	d
	push	d
	call	L5BC1
	lxi	d,08280H
	dad	d
	lda	X8D6D
	mvi	d,000H
	mov	e,a
	mov	m,e
	jmp	L464E
;
L46DE:
	pop	b
	pop	b
	ret
;
L46E1:
	push	b
	push	b
	push	b
	lxi	d,L0000
	lxi	h,00003H
	dad	sp
	mov	m,e
	lxi	h,00008H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	lxi	h,08000H
	dad	d
	mov	e,m
	mvi	d,000H
	lxi	h,X0040
	call	L5B53
	jz	L4715
	lxi	h,L0000
	lda	X8D65
	mvi	d,000H
	mov	e,a
	call	L5B53
	jz	L4715
	lxi	h,00001H
L4715:
	jz	L478F
	lxi	h,00008H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	lxi	h,08000H
	dad	d
	mov	e,m
	mvi	d,000H
	lxi	h,L0000
	dad	sp
	mov	m,e
	lxi	d,08000H
	lxi	h,00001H
	dad	sp
	mov	m,e
	inx	h
	mov	m,d
	lxi	d,L0000
	lxi	h,00004H
	dad	sp
	mov	m,e
	inx	h
	mov	m,d
	jmp	L475C
;
L4742:
	lxi	h,00004H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	dcx	h
	inx	d
	mov	m,e
	inx	h
	mov	m,d
	dcx	d
	lxi	h,00001H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	dcx	h
	inx	d
	mov	m,e
	inx	h
	mov	m,d
	dcx	d
L475C:
	lxi	h,00004H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	lhld	X851D
	call	L5B81
	jz	L478F
	lxi	h,00001H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	ldax	d
	mvi	d,000H
	mov	e,a
	lxi	h,L0000
	dad	sp
	mov	l,m
	mvi	h,000H
	call	L5B36
	jz	L478C
	lxi	d,00001H
	lxi	h,00003H
	dad	sp
	mov	m,e
L478C:
	jmp	L4742
;
L478F:
	lxi	h,00003H
	dad	sp
	mov	l,m
	mvi	h,000H
	pop	b
	pop	b
	pop	b
	ret
;
L479A:
	pop	b
	pop	d
	push	d
	push	b
	lxi	h,08280H
	dad	d
	mov	e,m
	mvi	d,000H
	lxi	h,00080H
	call	L5B20
	jnz	L47BC
	pop	b
	pop	d
	push	d
	push	b
	push	d
	call	L46E1
	pop	b
	mov	a,h
	ora	l
	jz	L47BF
L47BC:
	lxi	h,00001H
L47BF:
	call	L5BA9
	ret
;
L47C3:
	pop	b
	pop	d
	push	d
	push	b
	lxi	h,08280H
	dad	d
	push	h
	mov	e,m
	mvi	d,000H
	lxi	h,00080H
	call	L5B10
	pop	d
	mov	a,l
	stax	d
	pop	b
	pop	d
	push	d
	push	b
	lhld	X851A
	call	L5B81
	jz	L4820
	lhld	X850F
	mvi	h,000H
	dcx	h
	mov	a,l
	sta	X850F
L47EF:
	call	L413D
	lhld	X851A
	dcx	h
	shld	X851A
	push	h
	call	L479A
	pop	b
	mov	a,h
	ora	l
	jz	L480D
	lhld	X850F
	mvi	h,000H
	dcx	h
	mov	a,l
	sta	X850F
L480D:
	lhld	X851A
	lxi	d,08280H
	dad	d
	mov	e,m
	mvi	d,000H
	lxi	h,00080H
	call	L5B20
	jz	L47EF
L4820:
	ret
;
L4821:
	push	b
	lhld	X851F
	lxi	d,08000H
	dad	d
	shld	X8514
	lhld	X851F
	lxi	d,08280H
	dad	d
	shld	X8516
	lhld	X8514
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8504
	lhld	X8516
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8505
	call	L413D
	lxi	h,X0040
	lda	X8505
	mvi	d,000H
	mov	e,a
	call	L5B20
	jz	L48C9
	lda	X8504
	mvi	d,000H
	mov	e,a
	ora	d
	jnz	L4871
	lhld	X851F
	push	h
	call	L47C3
	pop	b
	jmp	L48C6
;
L4871:
	lhld	X851F
	pop	psw
	push	h
L4876:
	lhld	X8514
	mov	e,m
	mvi	d,000H
	lhld	X8504
	mvi	h,000H
	call	L5B36
	jz	L48C6
	call	L413D
	lxi	h,00078H
	lda	X8505
	mvi	d,000H
	mov	e,a
	call	L5B20
	xchg
	lhld	X8516
	push	d
	mov	e,m
	mvi	d,000H
	lxi	h,000F8H
	call	L5B20
	pop	d
	call	L5B36
	jz	L48B2
	pop	d
	push	d
	push	d
	call	L47C3
	pop	b
L48B2:
	pop	d
	inx	d
	push	d
	lhld	X8514
	inx	h
	shld	X8514
	lhld	X8516
	inx	h
	shld	X8516
	jmp	L4876
L48C6:
	jmp	L4931
;
L48C9:
	lhld	X851F
	pop	psw
	push	h
	jmp	L48D4
;
L48D1:
	pop	d
	inx	d
	push	d
L48D4:
	pop	d
	push	d
	lhld	X892C
	call	L5B81
	jz	L4931
	call	L413D
	lhld	X8514
	mov	e,m
	mvi	d,000H
	lhld	X8504
	mvi	h,000H
	call	L5B36
	jz	L4916
	lhld	X8516
	mov	e,m
	mvi	d,000H
	lxi	h,000F8H
	call	L5B20
	push	h
	lxi	h,00078H
	lda	X8505
	mvi	d,000H
	mov	e,a
	call	L5B20
	pop	d
	call	L5B36
	jz	L4916
	lxi	h,00001H
L4916:
	jz	L4920
	pop	d
	push	d
	push	d
	call	L47C3
	pop	b
L4920:
	lhld	X8514
	inx	h
	shld	X8514
	lhld	X8516
	inx	h
	shld	X8516
	jmp	L48D1
;
L4931:
	pop	b
	ret
;
L4933:
	dcx	sp
	push	b
	lxi	d,00001H
	lxi	h,00002H
	dad	sp
	mov	m,e
	lxi	h,L0000
	mov	a,l
	sta	X851C
	mov	a,l
	sta	X8D64
	mov	a,l
	sta	X8D65
	shld	X8D44
	lhld	X892E
	mvi	h,000H
	lda	X8937
	mvi	d,000H
	mov	e,a
	call	L5AC5
	shld	X8D3C
L4960:
	lhld	X8937
	mvi	h,000H
	lda	X8D65
	mvi	d,000H
	mov	e,a
	call	L5B52
	jz	L4BFB
	call	L413D
	lda	X8D65
	mvi	d,000H
	mov	e,a
	xchg
	dad	h
	lxi	d,X8D44
	dad	d
	mov	a,m
	inx	h
	mov	h,m
	mov	l,a
	shld	X851D
	shld	X851A
	lxi	d,08280H
	dad	d
	mov	e,m
	mvi	d,000H
	lxi	h,00080H
	call	L5B20
	jz	L49A3
	lxi	h,00001H
	shld	X8524
	jmp	L49A9
;
L49A3:
	lxi	h,L0000
	shld	X8524
L49A9:
	lhld	X851A
	xchg
	lhld	X892C
	call	L5B81
	jz	L49DB
	lhld	X8524
	lda	X892E
	mvi	d,000H
	mov	e,a
	call	L5B82
	jz	L49DB
	lhld	X851A
	lxi	d,08000H
	dad	d
	mov	e,m
	mvi	d,000H
	lxi	h,00009H
	call	L5B47
	jz	L49DB
	lxi	h,00001H
L49DB:
	jz	L4A02
	call	L413D
	lhld	X851A
	inx	h
	shld	X851A
	lxi	d,08280H
	dad	d
	mov	e,m
	mvi	d,000H
	lxi	h,00080H
	call	L5B20
	jz	L49FF
	lhld	X8524
	inx	h
	shld	X8524
L49FF:
	jmp	L49A9
;
L4A02:
	lhld	X851A
	xchg
	lhld	X892C
	call	L5B36
	jz	L4A3A
	lhld	X8D65
	mvi	h,000H
	lda	X892E
	mvi	d,000H
	mov	e,a
	call	L5AC5
	xchg
	lhld	X8524
	dad	d
	dcx	h
	shld	X8D3C
	lhld	X8937
	mvi	h,000H
	mov	a,l
	sta	X8D65
	lxi	d,00001H
	lxi	h,00002H
	dad	sp
	mov	m,e
	jmp	L4BF8
;
L4A3A:
	lhld	X851A
	lxi	d,08000H
	dad	d
	mov	e,m
	mvi	d,000H
	mov	a,e
	sui	009H
	ora	d
	jnz	L4A79
	call	L413D
	lhld	X8D65
	mvi	h,000H
	inx	h
	mov	a,l
	sta	X8D65
	lda	X8D65
	mvi	d,000H
	mov	e,a
	xchg
	dad	h
	lxi	d,X8D44
	dad	d
	xchg
	lhld	X851A
	inx	h
	xchg
	mov	m,e
	inx	h
	mov	m,d
	lhld	X8D65
	mvi	h,000H
	mov	a,l
	sta	X8D64
	jmp	L4BF8
;
L4A79:
	call	L413D
	lxi	h,L0000
	mov	a,l
	sta	X850F
	lhld	X851D
	pop	psw
	push	h
	jmp	L4A8E
;
L4A8B:
	pop	d
	inx	d
	push	d
L4A8E:
	pop	d
	push	d
	lhld	X851A
	call	L5B8E
	jz	L4AB2
	pop	d
	push	d
	push	d
	call	L479A
	pop	b
	mov	a,h
	ora	l
	jz	L4AAF
	lhld	X850F
	mvi	h,000H
	inx	h
	mov	a,l
	sta	X850F
L4AAF:
	jmp	L4A8B
;
L4AB2:
	lxi	h,L0000
	lda	X850F
	mvi	d,000H
	mov	e,a
	call	L5B53
	jz	L4AED
	lhld	X851A
	lxi	d,08280H
	dad	d
	mov	e,m
	mvi	d,000H
	lxi	h,X0040
	call	L5B20
	lxi	d,L0000
	call	L5B36
	jnz	L4AE4
	lhld	X851C
	mvi	h,000H
	mov	a,h
	ora	l
	jz	L4AE7
L4AE4:
	lxi	h,00001H
L4AE7:
	jz	L4AED
	lxi	h,00001H
L4AED:
	jz	L4B75
	call	L413D
	lxi	h,000FFH
	shld	X8510
	lhld	X851D
	lxi	d,08280H
	dad	d
	shld	X8516
	lhld	X851D
	shld	X892F
	jmp	L4B1A
;
L4B0C:
	lhld	X892F
	inx	h
	shld	X892F
	lhld	X8516
	inx	h
	shld	X8516
L4B1A:
	lhld	X892F
	xchg
	lhld	X851A
	call	L5B8E
	jz	L4B68
	lhld	X892F
	push	h
	call	L479A
	pop	b
	mov	a,h
	ora	l
	jz	L4B4D
	lhld	X8516
	mov	e,m
	mvi	d,000H
	lxi	h,000F8H
	call	L5B20
	xchg
	lhld	X8510
	call	L5B81
	jz	L4B4D
	lxi	h,00001H
L4B4D:
	jz	L4B65
	lhld	X8516
	mov	e,m
	mvi	d,000H
	lxi	h,000F8H
	call	L5B20
	shld	X8510
	lhld	X892F
	shld	X851F
L4B65:
	jmp	L4B0C
;
L4B68:
	call	L4821
	lxi	h,L0000
	mov	a,l
	sta	X851C
	jmp	L4AB2
;
L4B75:
	call	L413D
	lhld	X851A
	lxi	d,08280H
	dad	d
	mov	e,m
	mvi	d,000H
	lxi	h,X0040
	call	L5B20
	jz	L4B9D
	lda	X851C
	mvi	d,000H
	mov	e,a
	call	L5BB5
	xchg
	mov	a,h
	ora	l
	jz	L4B9D
	lxi	h,00001H
L4B9D:
	jz	L4BC2
	lhld	X8D65
	mvi	h,000H
	inx	h
	mov	a,l
	sta	X8D65
	lda	X8D65
	mvi	d,000H
	mov	e,a
	xchg
	dad	h
	lxi	d,X8D44
	dad	d
	xchg
	lhld	X851A
	inx	h
	xchg
	mov	m,e
	inx	h
	mov	m,d
	jmp	L4BF8
;
L4BC2:
	lhld	X8D64
	mvi	h,000H
	lda	X8D65
	mvi	d,000H
	mov	e,a
	call	L5B53
	jz	L4BE7
	lhld	X8D65
	mvi	h,000H
	dcx	h
	mov	a,l
	sta	X8D65
	lxi	h,00001H
	mov	a,l
	sta	X851C
	jmp	L4BF8
;
L4BE7:
	lhld	X8937
	mvi	h,000H
	mov	a,l
	sta	X8D65
	lxi	d,L0000
	lxi	h,00002H
	dad	sp
	mov	m,e
L4BF8:
	jmp	L4960
;
L4BFB:
	lxi	h,00002H
	dad	sp
	mov	l,m
	mvi	h,000H
	inx	sp
	pop	b
	ret
;
L4C05:
	lhld	X4028
	mov	e,m
	mvi	d,000H
	mov	a,e
	sui	052H
	ora	d
	jnz	L4C4C
	lhld	X8D66
	lxi	d,L0000
	call	L5B6A
	jz	L4C42
	lhld	X8D66
	dad	h
	lxi	d,08939H
	dad	d
	pop	b
	pop	d
	push	d
	push	b
	mov	m,e
	inx	h
	mov	m,d
	lhld	X8D66
	dad	h
	lxi	d,0852CH
	dad	d
	xchg
	lxi	h,00004H
	dad	sp
	mov	a,m
	inx	h
	mov	h,m
	mov	l,a
	xchg
	mov	m,e
	inx	h
	mov	m,d
L4C42:
	lhld	X8D66
	dcx	h
	shld	X8D66
	jmp	L4C83
;
L4C4C:
	lhld	X8D66
	lxi	d,001FFH
	call	L5B69
	jz	L4C7C
	lhld	X8D66
	dad	h
	lxi	d,08939H
	dad	d
	pop	b
	pop	d
	push	d
	push	b
	mov	m,e
	inx	h
	mov	m,d
	lhld	X8D66
	dad	h
	lxi	d,0852CH
	dad	d
	xchg
	lxi	h,00004H
	dad	sp
	mov	a,m
	inx	h
	mov	h,m
	mov	l,a
	xchg
	mov	m,e
	inx	h
	mov	m,d
L4C7C:
	lhld	X8D66
	inx	h
	shld	X8D66
L4C83:
	ret
;
L4C84:
	xchg
	lxi	h,0FFF9H
	dad	sp
	sphl
	xchg
	lhld	X402C
	mov	e,m
	mvi	d,000H
	mov	a,d
	ora	e
	jz	L4CBA
	lxi	d,L0000
	push	d
	lxi	d,00400H
	push	d
	lxi	d,08939H
	push	d
	call	L4120
	pop	b
	pop	b
	pop	b
	lxi	d,L0000
	push	d
	lxi	d,00400H
	push	d
	lxi	d,0852CH
	push	d
	call	L4120
	pop	b
	pop	b
	pop	b
L4CBA:
	lhld	X4028
	mov	e,m
	mvi	d,000H
	mov	a,e
	sui	04DH
	ora	d
	jnz	L4CCA
	jmp	L4CD1
;
L4CCA:
	mov	a,e
	sui	04CH
	ora	d
	jnz	L4CDA
L4CD1:
	lxi	h,L0000
	shld	X8D66
	jmp	L4D7A
;
L4CDA:
	mov	a,e
	sui	052H
	ora	d
	jnz	L4CF7
	lhld	X8937
	mvi	h,000H
	lda	X892E
	mvi	d,000H
	mov	e,a
	call	L5AC5
	dcx	h
	dcx	h
	shld	X8D66
	jmp	L4D7A
;
L4CF7:
	mov	a,e
	sui	05AH
	ora	d
	jnz	L4D7A
	lhld	X8D3C
	lda	X892E
	mvi	d,000H
	mov	e,a
	call	L5A78
	xchg
	lxi	h,L0000
	dad	sp
	mov	m,e
	lhld	X8D3C
	lda	X892E
	mvi	d,000H
	mov	e,a
	call	L5A78
	xchg
	lxi	d,00002H
	call	L5AC5
	lda	X892E
	mvi	d,000H
	mov	e,a
	call	L5B81
	jz	L4D38
	lxi	h,L0000
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	d
	mov	m,e
L4D38:
	lxi	h,L0000
	dad	sp
	mov	e,m
	mvi	d,000H
	lhld	X8937
	mvi	h,000H
	call	L5B69
	jz	L4D53
	lxi	h,L0000
	shld	X8D66
	jmp	L4D77
;
L4D53:
	lxi	h,L0000
	dad	sp
	mov	e,m
	mvi	d,000H
	lhld	X8937
	mvi	h,000H
	call	L5BC1
	lxi	d,00002H
	call	L5A7E
	shld	X8D66
	lda	X892E
	mvi	d,000H
	mov	e,a
	call	L5AC5
	shld	X8D66
L4D77:
	jmp	L4D7A
;
L4D7A:
	lhld	X402E
	mov	e,m
	mvi	d,000H
	lhld	X892E
	mvi	h,000H
	call	L5AC5
	shld	X8D68
	lhld	X892E
	mvi	h,000H
	lda	X8937
	mvi	d,000H
	mov	e,a
	call	L5AC5
	xchg
	lhld	X8D68
	dad	d
	dcx	h
	dcx	h
	shld	X8D6A
	lhld	X8D66
	xchg
	lhld	X8D68
	dad	d
	shld	X8D66
	lxi	h,08000H
	shld	X8514
	lxi	h,08280H
	shld	X8516
	lxi	h,L0000
	shld	X8935
L4DC0:
	lhld	X8935
	xchg
	lhld	X892C
	call	L5B81
	jz	L4DEA
	lhld	X8D66
	xchg
	lhld	X8D68
	call	L5B69
	jz	L4DEA
	lhld	X8D66
	xchg
	lhld	X8D6A
	call	L5B6A
	jz	L4DEA
	lxi	h,00001H
L4DEA:
	jz	L4F07
	call	L413D
	lhld	X8514
	mov	e,m
	mvi	d,000H
	mov	a,e
	sui	009H
	ora	d
	jnz	L4E5F
	lhld	X4028
	mov	e,m
	mvi	d,000H
	mov	a,e
	sui	052H
	ora	d
	jnz	L4E2B
L4E0A:
	lxi	d,L0000
	push	d
	push	d
	call	L4C05
	pop	b
	pop	b
	lhld	X8D66
	inx	h
	inx	h
	lda	X892E
	mvi	d,000H
	mov	e,a
	call	L5A7E
	xchg
	mov	a,h
	ora	l
	jnz	L4E0A
	jmp	L4E47
;
L4E2B:
	lxi	d,L0000
	push	d
	push	d
	call	L4C05
	pop	b
	pop	b
	lhld	X8D66
	lda	X892E
	mvi	d,000H
	mov	e,a
	call	L5A7E
	xchg
	mov	a,h
	ora	l
	jnz	L4E2B
L4E47:
	lhld	X8935
	inx	h
	shld	X8935
	lhld	X8514
	inx	h
	shld	X8514
	lhld	X8516
	inx	h
	shld	X8516
	jmp	L4F04
;
L4E5F:
	lhld	X8516
	mov	e,m
	mvi	d,000H
	lxi	h,00080H
	call	L5B20
	jz	L4EEF
	lhld	X8516
	mov	e,m
	mvi	d,000H
	lxi	h,X0040
	call	L5B20
	jz	L4E8A
	lxi	d,L0000
	push	d
	push	d
	call	L4C05
	pop	b
	pop	b
	jmp	L4EEF
;
L4E8A:
	lhld	X4024
	xchg
	lhld	X8514
	mov	l,m
	mvi	h,000H
	push	d
	lxi	d,00018H
	call	L5AC5
	pop	d
	dad	d
	shld	X8D40
	lxi	b,00004H
	dad	b
	xchg
	lhld	X8516
	push	d
	mov	e,m
	mvi	d,000H
	lxi	h,00007H
	call	L5B20
	dad	h
	pop	d
	dad	d
	mov	e,m
	inx	h
	mov	d,m
	lxi	h,L0005
	dad	sp
	mov	m,e
	inx	h
	mov	m,d
	lhld	X8D40
	lxi	b,0000EH
	dad	b
	xchg
	lhld	X8516
	push	d
	mov	e,m
	mvi	d,000H
	lxi	h,00007H
	call	L5B20
	dad	h
	pop	d
	dad	d
	mov	e,m
	inx	h
	mov	d,m
	lxi	h,00003H
	dad	sp
	mov	m,e
	inx	h
	mov	m,d
	push	d
	lxi	h,00007H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	push	d
	call	L4C05
	pop	b
	pop	b
L4EEF:
	lhld	X8935
	inx	h
	shld	X8935
	lhld	X8514
	inx	h
	shld	X8514
	lhld	X8516
	inx	h
	shld	X8516
L4F04:
	jmp	L4DC0
;
L4F07:
	xchg
	lxi	h,00007H
	dad	sp
	sphl
	xchg
	ret
;
L4F0F:
	xchg
	lxi	h,0FFF7H
	dad	sp
	sphl
	xchg
	lhld	X402C
	mov	e,m
	mvi	d,000H
	mov	a,d
	ora	e
	jz	L4F45
	lxi	d,L0000
	push	d
	lxi	d,00400H
	push	d
	lxi	d,08939H
	push	d
	call	L4120
	pop	b
	pop	b
	pop	b
	lxi	d,L0000
	push	d
	lxi	d,00400H
	push	d
	lxi	d,0852CH
	push	d
	call	L4120
	pop	b
	pop	b
	pop	b
L4F45:
	lxi	d,L0000
	lxi	h,L0005
	dad	sp
	mov	m,e
	lxi	h,0000BH
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	lxi	h,00001H
	dad	sp
	mov	m,e
	inx	h
	mov	m,d
L4F5B:
	lxi	h,00001H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	dcx	h
	inx	d
	mov	m,e
	inx	h
	mov	m,d
	dcx	d
	ldax	d
	mvi	h,000H
	mov	l,a
	ora	h
	jz	L4F7C
	lxi	h,L0005
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	d
	mov	m,e
	jmp	L4F5B
;
L4F7C:
	lhld	X8937
	mvi	h,000H
	lda	X892E
	mvi	d,000H
	mov	e,a
	call	L5AC5
	lxi	d,L0005
	call	L5A7E
	xchg
	lxi	h,00003H
	dad	sp
	mov	m,e
	lxi	h,L0005
	dad	sp
	mov	e,m
	mvi	d,000H
	lxi	h,00003H
	dad	sp
	mov	l,m
	mvi	h,000H
	call	L5B53
	jz	L4FB6
	lxi	h,00003H
	dad	sp
	mov	e,m
	mvi	d,000H
	lxi	h,L0005
	dad	sp
	mov	m,e
L4FB6:
	lxi	h,00003H
	dad	sp
	mov	e,m
	mvi	d,000H
	lxi	h,L0005
	dad	sp
	mov	l,m
	mvi	h,000H
	call	L5BC2
	xchg
	lxi	h,00004H
	dad	sp
	mov	m,e
	lhld	X4028
	mov	e,m
	mvi	d,000H
	mov	a,e
	sui	04CH
	ora	d
	jnz	L4FE3
	lxi	h,L0000
	shld	X8D66
	jmp	L5027
;
L4FE3:
	mov	a,e
	sui	05AH
	ora	d
	jnz	L4FED
	jmp	L4FF4
;
L4FED:
	mov	a,e
	sui	04DH
	ora	d
	jnz	L500D
L4FF4:
	lxi	h,00004H
	dad	sp
	mov	e,m
	mvi	d,000H
	lxi	h,00002H
	call	L5A7D
	lxi	d,L0005
	call	L5AC5
	shld	X8D66
	jmp	L5027
;
L500D:
	mov	a,e
	sui	052H
	ora	d
	jnz	L5027
	lxi	h,00004H
	dad	sp
	mov	l,m
	mvi	h,000H
	lxi	d,L0005
	call	L5AC5
	shld	X8D66
	jmp	L5027
;
L5027:
	lhld	X402E
	mov	e,m
	mvi	d,000H
	lhld	X892E
	mvi	h,000H
	call	L5AC5
	xchg
	lhld	X8D66
	dad	d
	shld	X8D66
	lhld	X4028
	mov	e,m
	mvi	d,000H
	lxi	h,L0000
	dad	sp
	mov	m,e
	lhld	X4028
	lxi	d,0004CH
	mov	m,e
	lxi	d,L0000
	lxi	h,00006H
	dad	sp
	mov	m,e
L5057:
	lxi	h,0000BH
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	dcx	h
	inx	d
	mov	m,e
	inx	h
	mov	m,d
	dcx	d
	ldax	d
	mvi	h,000H
	mov	l,a
	push	h
	call	L5A3E
	pop	b
	xchg
	lxi	h,00008H
	dad	sp
	mov	m,e
	mov	a,d
	ora	e
	jz	L5095
	lxi	h,00006H
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	d
	mov	m,e
	dcx	d
	lxi	h,L0005
	dad	sp
	mov	l,m
	mvi	h,000H
	call	L5B52
	xchg
	mov	a,d
	ora	e
	jz	L5095
	lxi	d,00001H
L5095:
	jz	L51D1
	call	L413D
	lxi	h,00008H
	dad	sp
	mov	e,m
	mvi	d,000H
	mov	a,e
	sui	009H
	ora	d
	jnz	L50C5
	lhld	X8D66
	lda	X892E
	mvi	d,000H
	mov	e,a
	call	L5A7E
	inx	h
	lda	X892E
	mvi	d,000H
	mov	e,a
	call	L5AC5
	shld	X8D66
	jmp	L51CE
;
L50C5:
	lxi	h,00008H
	dad	sp
	mov	e,m
	mvi	d,000H
	lxi	h,0002FH
	call	L5B36
	jz	L50EC
	lxi	h,0000BH
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	ldax	d
	mvi	d,000H
	mov	e,a
	lxi	h,0002DH
	call	L5B36
	jz	L50EC
	lxi	h,00001H
L50EC:
	jz	L50FE
	lxi	h,0000BH
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	dcx	h
	inx	d
	mov	m,e
	inx	h
	mov	m,d
	jmp	L51CE
;
L50FE:
	lhld	X4024
	xchg
	lxi	h,00008H
	dad	sp
	mov	l,m
	mvi	h,000H
	push	d
	lxi	d,00018H
	call	L5AC5
	pop	d
	dad	d
	shld	X8D40
	lxi	b,00004H
	dad	b
	shld	X852A
	lhld	X8D40
	lxi	b,0000EH
	dad	b
	shld	X8508
	lxi	d,L0000
	lxi	h,00007H
	dad	sp
	mov	m,e
	jmp	L514A
;
L5131:
	lxi	h,00007H
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	d
	mov	m,e
	lhld	X852A
	inx	h
	inx	h
	shld	X852A
	lhld	X8508
	inx	h
	inx	h
	shld	X8508
L514A:
	lxi	h,00007H
	dad	sp
	mov	e,m
	mvi	d,000H
	lxi	h,L0005
	call	L5B52
	jz	L517F
	lhld	X852A
	mov	e,m
	inx	h
	mov	d,m
	lxi	h,01000H
	call	L5B20
	jz	L517C
	lhld	X8508
	mov	e,m
	inx	h
	mov	d,m
	push	d
	lhld	X852A
	mov	e,m
	inx	h
	mov	d,m
	push	d
	call	L4C05
	pop	b
	pop	b
L517C:
	jmp	L5131
;
L517F:
	lxi	d,L0000
	lxi	h,00007H
	dad	sp
	mov	m,e
	jmp	L5193
;
L518A:
	lxi	h,00007H
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	d
	mov	m,e
L5193:
	lhld	X8D40
	inx	h
	inx	h
	mov	e,m
	inx	h
	mov	d,m
	lxi	h,00008H
	call	L5AF6
	lxi	d,000F0H
	call	L5B20
	lxi	d,00004H
	call	L5AF7
	lxi	d,L0005
	call	L5BC2
	xchg
	lxi	h,00007H
	dad	sp
	mov	l,m
	mvi	h,000H
	call	L5B82
	jz	L51CE
	lxi	d,L0000
	push	d
	push	d
	call	L4C05
	pop	b
	pop	b
	jmp	L518A
L51CE:
	jmp	L5057
;
L51D1:
	lhld	X4028
	xchg
	lxi	h,L0000
	dad	sp
	mov	l,m
	mvi	h,000H
	mov	a,l
	stax	d
	xchg
	lxi	h,00009H
	dad	sp
	sphl
	xchg
	ret
;
L51E6:
	dcx	sp
	push	b
	lhld	X8521
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8931
	lhld	X8521
	inx	h
	inx	h
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8934
	lhld	X8521
	lxi	b,00004H
	dad	b
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8D6C
	lhld	X8521
	lxi	b,00006H
	dad	b
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8938
	lhld	X8521
	lxi	b,00008H
	dad	b
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8D39
	lhld	X892E
	mvi	h,000H
	lda	X8937
	mvi	d,000H
	mov	e,a
	call	L5AC5
	dcx	h
	dcx	h
	dad	h
	lxi	d,08939H
	dad	d
	shld	X8528
	lxi	d,L0000
	lxi	h,L0000
	dad	sp
	mov	m,e
	jmp	L5254
;
L524B:
	lxi	h,L0000
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	d
	mov	m,e
L5254:
	lxi	h,L0000
	dad	sp
	mov	e,m
	mvi	d,000H
	lhld	X8937
	mvi	h,000H
	call	L5B52
	jz	L5334
	call	L413D
	lda	X8931
	mvi	d,000H
	mov	e,a
	push	d
	call	L4054
	pop	b
	lxi	d,L0000
	lxi	h,00002H
	dad	sp
	mov	m,e
	jmp	L5288
;
L527F:
	lxi	h,00002H
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	d
	mov	m,e
L5288:
	lxi	h,00002H
	dad	sp
	mov	e,m
	mvi	d,000H
	lhld	X8934
	mvi	h,000H
	call	L5B52
	jz	L52AF
	lhld	X8528
	dcx	h
	dcx	h
	shld	X8528
	inx	h
	inx	h
	mov	e,m
	inx	h
	mov	d,m
	push	d
	call	L407E
	pop	b
	jmp	L527F
;
L52AF:
	lxi	d,L0000
	lxi	h,00002H
	dad	sp
	mov	m,e
	jmp	L52C3
;
L52BA:
	lxi	h,00002H
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	d
	mov	m,e
L52C3:
	lxi	h,00002H
	dad	sp
	mov	e,m
	mvi	d,000H
	lhld	X8D6C
	mvi	h,000H
	call	L5B52
	jz	L5329
	lda	X8938
	mvi	d,000H
	mov	e,a
	push	d
	call	L4054
	pop	b
	lxi	d,L0000
	lxi	h,00001H
	dad	sp
	mov	m,e
	jmp	L52F4
;
L52EB:
	lxi	h,00001H
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	d
	mov	m,e
L52F4:
	lxi	h,00001H
	dad	sp
	mov	e,m
	mvi	d,000H
	lhld	X8D39
	mvi	h,000H
	call	L5B52
	jz	L531B
	lhld	X8528
	dcx	h
	dcx	h
	shld	X8528
	inx	h
	inx	h
	mov	e,m
	inx	h
	mov	d,m
	push	d
	call	L407E
	pop	b
	jmp	L52EB
;
L531B:
	lda	X8938
	mvi	d,000H
	mov	e,a
	push	d
	call	L4054
	pop	b
	jmp	L52BA
;
L5329:
	lhld	X8528
	dcx	h
	dcx	h
	shld	X8528
	jmp	L524B
;
L5334:
	lhld	X8521
	inx	h
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8931
	lhld	X8521
	inx	h
	inx	h
	inx	h
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8934
	lhld	X8521
	lxi	b,00004H
	dad	b
	inx	h
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8D6C
	lhld	X8521
	lxi	b,00006H
	dad	b
	inx	h
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8938
	lhld	X8521
	lxi	b,00008H
	dad	b
	inx	h
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8D39
	lxi	h,0852CH
	shld	X850B
	lxi	d,L0000
	lxi	h,L0000
	dad	sp
	mov	m,e
	jmp	L5393
;
L538A:
	lxi	h,L0000
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	d
	mov	m,e
L5393:
	lxi	h,L0000
	dad	sp
	mov	e,m
	mvi	d,000H
	lhld	X8937
	mvi	h,000H
	call	L5B52
	jz	L5473
	call	L413D
	lda	X8931
	mvi	d,000H
	mov	e,a
	push	d
	call	L4069
	pop	b
	lxi	d,L0000
	lxi	h,00002H
	dad	sp
	mov	m,e
	jmp	L53C7
;
L53BE:
	lxi	h,00002H
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	d
	mov	m,e
L53C7:
	lxi	h,00002H
	dad	sp
	mov	e,m
	mvi	d,000H
	lhld	X8934
	mvi	h,000H
	call	L5B52
	jz	L53EE
	lhld	X850B
	inx	h
	inx	h
	shld	X850B
	dcx	h
	dcx	h
	mov	e,m
	inx	h
	mov	d,m
	push	d
	call	L40A8
	pop	b
	jmp	L53BE
;
L53EE:
	lxi	d,L0000
	lxi	h,00002H
	dad	sp
	mov	m,e
	jmp	L5402
;
L53F9:
	lxi	h,00002H
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	d
	mov	m,e
L5402:
	lxi	h,00002H
	dad	sp
	mov	e,m
	mvi	d,000H
	lhld	X8D6C
	mvi	h,000H
	call	L5B52
	jz	L5468
	lda	X8938
	mvi	d,000H
	mov	e,a
	push	d
	call	L4069
	pop	b
	lxi	d,L0000
	lxi	h,00001H
	dad	sp
	mov	m,e
	jmp	L5433
;
L542A:
	lxi	h,00001H
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	d
	mov	m,e
L5433:
	lxi	h,00001H
	dad	sp
	mov	e,m
	mvi	d,000H
	lhld	X8D39
	mvi	h,000H
	call	L5B52
	jz	L545A
	lhld	X850B
	inx	h
	inx	h
	shld	X850B
	dcx	h
	dcx	h
	mov	e,m
	inx	h
	mov	d,m
	push	d
	call	L40A8
	pop	b
	jmp	L542A
;
L545A:
	lda	X8938
	mvi	d,000H
	mov	e,a
	push	d
	call	L4069
	pop	b
	jmp	L53F9
;
L5468:
	lhld	X850B
	inx	h
	inx	h
	shld	X850B
	jmp	L538A
;
L5473:
	inx	sp
	pop	b
	ret
;
L5476:
	dcx	sp
	push	b
	call	L413D
	lxi	d,L0000
	push	d
	lxi	h,00009H
	dad	sp
	mov	e,m
	mvi	d,000H
	push	d
	lxi	h,00009H
	dad	sp
	mov	e,m
	mvi	d,000H
	push	d
	lhld	X8D3E
	push	h
	call	L418D
	xchg
	lxi	h,00008H
	dad	sp
	sphl
	lhld	X4028
	mov	e,m
	mvi	d,000H
	mov	a,e
	sui	04DH
	ora	d
	jz	L54B5
	call	L4933
	xchg
	lxi	h,00002H
	dad	sp
	mov	m,e
	jmp	L56DA
;
L54B5:
	lxi	d,L0000
	lxi	h,00002H
	dad	sp
	mov	m,e
	mov	a,e
	sta	X8D74
	lxi	d,00001H
	lxi	h,00001H
	dad	sp
	mov	m,e
	lhld	X892E
	mvi	h,000H
	lda	X8937
	mvi	d,000H
	mov	e,a
	call	L5AC5
	dcx	h
	shld	X8D6E
	lhld	X892C
	xchg
	lhld	X8D6E
	call	L5BC1
	lxi	d,00002H
	call	L5A7E
	shld	X8500
	lhld	X8D3C
	xchg
	lhld	X8D6E
	call	L5BC1
	lxi	d,00002H
	call	L5A7E
	shld	X8502
	lhld	X8500
	lxi	d,L0000
	call	L5B53
	jz	L5513
	lxi	h,L0000
	shld	X8500
L5513:
	lxi	h,0000AH
	lda	X892E
	mvi	d,000H
	mov	e,a
	call	L5A7D
	shld	X8D70
	lhld	X892C
	shld	X8518
	lxi	h,L0000
	shld	X8D72
	xchg
	lxi	h,L0000
	dad	sp
	mov	m,e
	lhld	X8502
	inx	h
	shld	X8512
L553B:
	lxi	h,00002H
	dad	sp
	mov	e,m
	mvi	d,000H
	call	L5BB5
	jz	L556E
	lhld	X8512
	xchg
	lhld	X8500
	call	L5B53
	xchg
	mov	a,d
	ora	e
	jz	L556E
	lxi	h,L0000
	dad	sp
	mov	e,m
	mvi	d,000H
	lxi	h,0000AH
	call	L5B52
	xchg
	mov	a,d
	ora	e
	jz	L556E
	lxi	d,00001H
L556E:
	jz	L567F
	call	L413D
	lhld	X8512
	dcx	h
	shld	X8512
	lxi	h,L0000
	dad	sp
	mov	e,m
	mvi	d,000H
	inx	d
	mov	m,e
	lhld	X8512
	push	h
	lxi	h,00009H
	dad	sp
	mov	e,m
	mvi	d,000H
	push	d
	lxi	h,00009H
	dad	sp
	mov	e,m
	mvi	d,000H
	push	d
	lhld	X8D3E
	push	h
	call	L418D
	xchg
	lxi	h,00008H
	dad	sp
	sphl
	call	L4933
	mov	a,h
	ora	l
	jz	L561B
	lhld	X8D3C
	xchg
	lhld	X8D6E
	call	L5BC1
	shld	X8526
	xchg
	lhld	X8512
	call	L5BC2
	shld	X850D
	lxi	d,L0000
	call	L5B53
	jz	L55D9
	lhld	X850D
	lxi	d,0FFFFH
	call	L5AC5
	shld	X850D
L55D9:
	lhld	X850D
	xchg
	lhld	X8518
	call	L5B52
	jz	L55F9
	lhld	X850D
	shld	X8518
	lhld	X8512
	shld	X8D72
	lxi	h,00001H
	mov	a,l
	sta	X8D74
L55F9:
	lhld	X8518
	xchg
	lhld	X8D70
	call	L5B6A
	jz	L5615
	lhld	X8526
	lxi	d,L0000
	call	L5B6A
	jz	L5615
	lxi	h,00001H
L5615:
	xchg
	lxi	h,00002H
	dad	sp
	mov	m,e
L561B:
	lhld	X8512
	xchg
	lhld	X8500
	call	L5B36
	jz	L565C
	lxi	h,00001H
	dad	sp
	mov	l,m
	mvi	h,000H
	mov	a,h
	ora	l
	jz	L565C
	lda	X8D74
	mvi	d,000H
	mov	e,a
	call	L5BB5
	jnz	L5650
	lhld	X8518
	xchg
	lhld	X8D70
	call	L5B53
	xchg
	mov	a,d
	ora	e
	jz	L5653
L5650:
	lxi	d,00001H
L5653:
	xchg
	mov	a,h
	ora	l
	jz	L565C
	lxi	h,00001H
L565C:
	jz	L567C
	lhld	X8502
	inx	h
	shld	X8500
	lhld	X8502
	lxi	b,L0005
	dad	b
	shld	X8502
	inx	h
	shld	X8512
	lxi	d,L0000
	lxi	h,00001H
	dad	sp
	mov	m,e
L567C:
	jmp	L553B
;
L567F:
	lda	X8D74
	mvi	d,000H
	mov	e,a
	ora	d
	jnz	L5694
	lxi	d,L0000
	lxi	h,00002H
	dad	sp
	mov	m,e
	jmp	L56DA
;
L5694:
	lhld	X8512
	xchg
	lhld	X8D72
	call	L5B36
	xchg
	lxi	h,00002H
	dad	sp
	mov	m,e
	lxi	h,00002H
	dad	sp
	mov	e,m
	mvi	d,000H
	mov	a,d
	ora	e
	jnz	L56DA
	lhld	X8D72
	push	h
	lxi	h,00009H
	dad	sp
	mov	e,m
	mvi	d,000H
	push	d
	lxi	h,00009H
	dad	sp
	mov	e,m
	mvi	d,000H
	push	d
	lhld	X8D3E
	push	h
	call	L418D
	xchg
	lxi	h,00008H
	dad	sp
	sphl
	call	L4933
	xchg
	lxi	h,00002H
	dad	sp
	mov	m,e
L56DA:
	lxi	h,00002H
	dad	sp
	mov	l,m
	mvi	h,000H
	inx	sp
	pop	b
	ret
;
L56E4:
	push	b
	push	b
	push	b
	lhld	X4026
	mov	e,m
	mvi	d,000H
	lxi	h,0000AH
	dad	sp
	mov	l,m
	mvi	h,000H
	call	L5B52
	jnz	L570E
	lhld	X4026
	inx	h
	mov	e,m
	mvi	d,000H
	lxi	h,0000CH
	dad	sp
	mov	l,m
	mvi	h,000H
	call	L5B52
	jz	L5711
L570E:
	lxi	h,00001H
L5711:
	jz	L571B
	lxi	h,L0000
	pop	b
	pop	b
	pop	b
	ret
;
L571B:
	call	L413D
	lxi	h,0000AH
	dad	sp
	mov	e,m
	mvi	d,000H
	dcx	d
	mov	m,e
	lxi	h,0000CH
	dad	sp
	mov	e,m
	mvi	d,000H
	dcx	d
	mov	m,e
	lhld	X4026
	inx	h
	inx	h
	xchg
	lxi	h,0000AH
	dad	sp
	mov	l,m
	mvi	h,000H
	dad	h
	dad	h
	dad	d
	xchg
	lxi	h,0000CH
	dad	sp
	mov	l,m
	mvi	h,000H
	dad	d
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8937
	lhld	X4026
	inx	h
	inx	h
	xchg
	lxi	h,0000AH
	dad	sp
	mov	l,m
	mvi	h,000H
	dad	h
	dad	h
	dad	d
	inx	h
	inx	h
	xchg
	lxi	h,0000CH
	dad	sp
	mov	l,m
	mvi	h,000H
	dad	d
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8507
	lda	X8507
	mvi	d,000H
	mov	e,a
	lxi	h,0000BH
	call	L5AC5
	lxi	d,04003H
	dad	d
	shld	X8521
	lxi	b,0000AH
	dad	b
	mov	e,m
	mvi	d,000H
	inx	d
	mov	a,e
	sta	X892E
	lda	X8937
	mvi	d,000H
	mov	e,a
	pop	psw
	push	d
	lhld	X402E
	mov	e,m
	mvi	d,000H
	lhld	X8937
	mvi	h,000H
	call	L5B69
	jz	L57B1
	lhld	X402E
	lxi	d,L0000
	mov	m,e
L57B1:
	lhld	X4030
	mov	e,m
	mvi	d,000H
	lxi	h,L0000
	call	L5B53
	jz	L57CA
	lhld	X4030
	mov	l,m
	mvi	h,000H
	mov	a,l
	sta	X8937
L57CA:
	lhld	X402E
	mov	e,m
	mvi	d,000H
	pop	h
	push	h
	call	L5BC1
	lda	X8937
	mvi	d,000H
	mov	e,a
	call	L5B82
	jz	L57F0
	lhld	X402E
	mov	e,m
	mvi	d,000H
	pop	h
	push	h
	call	L5BC1
	mov	a,l
	sta	X8937
L57F0:
	lxi	h,00008H
	dad	sp
	mov	a,m
	inx	h
	mov	h,m
	mov	l,a
	shld	X8D3E
	lhld	X4028
	push	h
	mov	e,m
	mvi	d,000H
	push	d
	call	L5A3E
	pop	b
	pop	d
	mov	a,l
	stax	d
	lhld	X402A
	mov	e,m
	mvi	d,000H
	lxi	h,00001H
	call	L5B20
	jz	L582B
	lxi	d,L0000
	push	d
	push	d
	call	L5476
	pop	b
	pop	b
	mov	a,h
	ora	l
	jz	L582B
	lxi	h,00001H
L582B:
	jnz	L58A0
	lhld	X402A
	mov	e,m
	mvi	d,000H
	lxi	h,00002H
	call	L5B20
	jz	L5852
	lxi	d,L0000
	push	d
	lxi	d,00001H
	push	d
	call	L5476
	pop	b
	pop	b
	mov	a,h
	ora	l
	jz	L5852
	lxi	h,00001H
L5852:
	jnz	L58A0
	lhld	X402A
	mov	e,m
	mvi	d,000H
	lxi	h,00004H
	call	L5B20
	jz	L5879
	lxi	d,00001H
	push	d
	lxi	d,L0000
	push	d
	call	L5476
	pop	b
	pop	b
	mov	a,h
	ora	l
	jz	L5879
	lxi	h,00001H
L5879:
	jnz	L58A0
	lhld	X402A
	mov	e,m
	mvi	d,000H
	lxi	h,00008H
	call	L5B20
	jz	L589D
	lxi	d,00001H
	push	d
	push	d
	call	L5476
	pop	b
	pop	b
	mov	a,h
	ora	l
	jz	L589D
	lxi	h,00001H
L589D:
	jz	L58A3
L58A0:
	lxi	h,00001H
L58A3:
	jz	L58AC
	call	L4C84
	jmp	L58B4
;
L58AC:
	lhld	X8D3E
	push	h
	call	L4F0F
	pop	b
L58B4:
	pop	h
	push	h
	mov	a,l
	sta	X8937
	lhld	X402A
	mov	e,m
	mvi	d,000H
	lxi	h,X0040
	call	L5B20
	jz	L58EA
	call	L51E6
	lxi	h,0000CH
	dad	sp
	mov	e,m
	mvi	d,000H
	push	d
	lxi	h,0000CH
	dad	sp
	mov	e,m
	mvi	d,000H
	push	d
	call	L40D2
	pop	b
	pop	b
	lhld	X8937
	mvi	h,000H
	pop	b
	pop	b
	pop	b
	ret
;
L58EA:
	lxi	d,00200H
	lxi	h,00004H
	dad	sp
	mov	m,e
	inx	h
	mov	m,d
	lxi	h,08D37H
	shld	X8528
	lxi	h,0892AH
	shld	X850B
L5900:
	lxi	h,00004H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	mov	a,d
	ora	e
	jz	L5939
	lhld	X8528
	dcx	h
	dcx	h
	shld	X8528
	inx	h
	inx	h
	mov	e,m
	inx	h
	mov	d,m
	lhld	X850B
	dcx	h
	dcx	h
	shld	X850B
	inx	h
	inx	h
	mov	a,m
	inx	h
	mov	h,m
	mov	l,a
	call	L5B10
	lxi	d,L0000
	call	L5B36
	xchg
	mov	a,d
	ora	e
	jz	L5939
	lxi	d,00001H
L5939:
	jz	L594B
	lxi	h,00004H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	dcx	h
	dcx	d
	mov	m,e
	inx	h
	mov	m,d
	jmp	L5900
;
L594B:
	lxi	h,00004H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	lhld	X892E
	mvi	h,000H
	call	L5A77
	pop	b
	pop	psw
	push	h
	push	b
	lxi	h,00004H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	lhld	X892E
	mvi	h,000H
	call	L5A77
	xchg
	lxi	d,L0000
	call	L5B81
	jz	L597C
	pop	b
	pop	d
	inx	d
	push	d
	push	b
L597C:
	lxi	h,00004H
	dad	sp
	mov	e,m
	inx	h
	mov	d,m
	lhld	X892E
	mvi	h,000H
	call	L5A77
	xchg
	lxi	d,00008H
	call	L5B07
	pop	b
	pop	d
	push	d
	push	b
	call	L5B10
	pop	b
	pop	b
	pop	b
	ret
;
	db	0C1H, 0C1H, 0C1H, 0C9H
;
L59A1:
	mov	c,l
	mvi	b,000H
	push	b
	mov	c,h
	push	b
	push	d
	call	L56E4
	pop	b
	pop	b
	pop	b
	ret
;
	db	021H, 002H, 000H, 039H
	db	05EH, 023H, 07EH, 021H
	db	000H, 000H, 0B7H, 0C0H
	db	07BH, 0FEH, 041H, 0D8H
	db	0FEH, 07BH, 0D0H, 06FH
	db	0FEH, 05BH, 0D8H, 0FEH
	db	061H, 0D0H, 02EH, 000H
	db	0C9H, 021H, 002H, 000H
	db	039H, 05EH, 023H, 07EH
	db	021H, 000H, 000H, 0B7H
	db	0C0H, 07BH, 0FEH, 041H
	db	0D8H, 0FEH, 05BH, 0D0H
	db	06FH, 0C9H, 021H, 002H
	db	000H, 039H, 05EH, 023H
	db	07EH, 021H, 000H, 000H
	db	0B7H, 0C0H, 07BH, 0FEH
	db	061H, 0D8H, 0FEH, 07BH
	db	0D0H, 06FH, 0C9H, 021H
	db	002H, 000H, 039H, 05EH
	db	023H, 07EH, 021H, 000H
	db	000H, 0B7H, 0C0H, 07BH
	db	0FEH, 030H, 0D8H, 0FEH
	db	03AH, 0D0H, 06FH, 0C9H
	db	021H, 002H, 000H, 039H
	db	05EH, 023H, 07EH, 021H
	db	000H, 000H, 0B7H, 0C0H
	db	07BH, 06FH, 0FEH, 009H
	db	0C8H, 0FEH, 00AH, 0C8H
	db	0FEH, 020H, 0C8H, 0FEH
	db	00DH, 0C8H, 02EH, 000H
	db	0C9H, 021H, 002H, 000H
	db	039H, 05EH, 023H, 07EH
	db	057H, 0EBH, 0B7H, 0C0H
	db	07DH, 0FEH, 041H, 0D8H
	db	0FEH, 05BH, 0D0H, 0C6H
	db	020H, 06FH, 0C9H
;
L5A3E:
	lxi	h,00002H
	dad	sp
	mov	e,m
	inx	h
	mov	a,m
	mov	d,a
	xchg
	ora	a
	rnz
	mov	a,l
	cpi	061H
	rc
	cpi	07BH
	rnc
	sui	020H
	mov	l,a
	ret
;
	db	021H, 002H, 000H, 039H
	db	05EH, 023H, 07EH, 021H
	db	000H, 000H, 0B7H, 0C0H
	db	07BH, 017H, 0D8H, 06BH
	db	0C9H, 021H, 002H, 000H
	db	039H, 05EH, 023H, 056H
	db	07AH, 0CDH, 0B6H, 059H
	db	07CH, 0B5H, 0C0H, 0C3H
	db	002H, 05AH, 0C9H
;
L5A77:
	xchg
L5A78:
	xra	a
	push	psw
	jmp	L5A8B
;
L5A7D:
	xchg
L5A7E:
	mov	a,d
	xra	h
	push	psw
	mov	a,d
	ora	a
	cm	L5BA1
	mov	a,h
	ora	a
	cm	L5B99
L5A8B:
	mov	b,d
	mov	c,e
	mov	a,b
	ora	c
	cz	L5BC9
	mvi	a,010H
	push	psw
	lxi	d,L0000
L5A98:
	dad	h
	mov	a,e
	ral
	mov	e,a
	mov	a,d
	ral
	mov	d,a
	ora	e
	jz	L5AB4
	mov	a,e
	sub	c
	mov	a,d
	sbb	b
	jm	L5AB4
	mov	a,l
	ori	001H
	mov	l,a
	mov	a,e
	sub	c
	mov	e,a
	mov	a,d
	sbb	b
	mov	d,a
L5AB4:
	pop	psw
	dcr	a
	jz	L5ABD
	push	psw
	jmp	L5A98
;
L5ABD:
	pop	psw
	rp
	call	L5BA1
	jmp	L5B99
;
L5AC5:
	mov	b,h
	mov	c,l
	lxi	h,L0000
L5ACA:
	mov	a,c
	rrc
	jnc	L5AD0
	dad	d
L5AD0:
	xra	a
	mov	a,b
	rar
	mov	b,a
	mov	a,c
	rar
	mov	c,a
	ora	b
	rz
	xra	a
	mov	a,e
	ral
	mov	e,a
	mov	a,d
	ral
	mov	d,a
	ora	e
	rz
	jmp	L5ACA
;
	db	0EBH, 07BH, 0A7H, 0C8H
	db	07CH, 017H, 07CH, 01FH
	db	067H, 07DH, 01FH, 06FH
	db	01DH, 0C2H, 0E9H, 05AH
	db	0C9H
;
L5AF6:
	xchg
L5AF7:
	mov	a,e
	ana	a
	rz
L5AFA:
	mov	a,h
	ana	a
	rar
	mov	h,a
	mov	a,l
	rar
	mov	l,a
	dcr	e
	jnz	L5AFA
	ret
;
	db	0EBH
;
L5B07:
	mov	a,e
	ana	a
	rz
L5B0A:
	dad	h
	dcr	e
	jnz	L5B0A
	ret
;
L5B10:
	mov	a,l
	ora	e
	mov	l,a
	mov	a,h
	ora	d
	mov	h,a
	ora	l
	ret
;
	db	07DH, 0ABH, 06FH, 07CH
	db	0AAH, 067H, 0B5H, 0C9H
;
L5B20:
	mov	a,l
	ana	e
	mov	l,a
	mov	a,h
	ana	d
	mov	h,a
	ora	l
	ret
;
	db	07CH, 02FH, 067H, 07DH
	db	02FH, 06FH, 0C9H, 07AH
	db	02FH, 057H, 07BH, 02FH
	db	05FH, 0C9H
;
L5B36:
	mov	a,l
	sub	e
	mov	a,h
	lxi	h,L0000
	jnz	L5B45
	sub	d
	jnz	L5B45
	inr	l
	ret
;
L5B45:
	xra	a
	ret
;
L5B47:
	mov	a,l
	sub	e
	mov	a,h
	lxi	h,00001H
	rnz
	sub	d
	rnz
	dcr	l
	ret
;
L5B52:
	xchg
L5B53:
	mov	a,d
	xra	h
	jm	L5B62
	mov	a,l
	sub	e
	mov	a,h
	sbb	d
	lxi	h,00001H
	rc
	dcr	l
	ret
;
L5B62:
	ana	h
	lxi	h,00001H
	rm
	dcr	l
	ret
;
L5B69:
	xchg
L5B6A:
	mov	a,d
	xra	h
	jm	L5B7A
	mov	a,l
	sub	e
	mov	a,h
	sbb	d
	lxi	h,L0000
	inr	l
	rnc
	dcr	l
	ret
;
L5B7A:
	lxi	h,00001H
	ana	d
	rm
	dcr	l
	ret
;
L5B81:
	xchg
L5B82:
	mov	a,l
	sub	e
	mov	a,h
	sbb	d
	lxi	h,L0000
	inr	l
	rc
	dcr	l
	ret
;
	db	0EBH
;
L5B8E:
	mov	a,l
	sub	e
	mov	a,h
	sbb	d
	lxi	h,L0000
	inr	l
	rnc
	dcr	l
	ret
;
L5B99:
	mov	a,h
	cma
	mov	h,a
	mov	a,l
	cma
	mov	l,a
	inx	h
	ret
;
L5BA1:
	mov	a,d
	cma
	mov	d,a
	mov	a,e
	cma
	mov	e,a
	inx	d
	ret
;
L5BA9:
	mov	a,h
	ora	l
	lxi	h,00001H
	jz	L5BB3
	dcr	l
	ret
;
L5BB3:
	ora	l
	ret
;
L5BB5:
	mov	a,d
	ora	e
	lxi	d,00001H
	jz	L5BBF
	dcr	e
	ret
;
L5BBF:
	ora	e
	ret
;
L5BC1:
	xchg
L5BC2:
	mov	a,e
	sub	l
	mov	l,a
	mov	a,d
	sbb	h
	mov	h,a
	ret
;
L5BC9:
	push	psw
	push	b
	push	d
	push	h
	lxi	d,05BDCH
	mvi	c,009H
	call	L0005
	pop	h
	pop	d
	pop	b
	pop	psw
	jmp	L0000
;
	db	00DH, 00AH, 030H, 020H
	db	02DH, 020H, 044H, 049H
	db	056H, 049H, 053H, 049H
	db	04FH, 04EH, 00DH, 00AH
	db	024H, 0C3H, 0C9H, 05BH
	db	0F5H, 0C5H, 0D5H, 0E5H
	db	011H, 001H, 05CH, 00EH
	db	009H, 0CDH, 005H, 000H
	db	0E1H, 0D1H, 0C1H, 0F1H
	db	0C9H, 00DH, 00AH, 055H
	db	04EH, 044H, 045H, 052H
	db	046H, 04CH, 04FH, 057H
	db	00DH, 00AH, 024H, 0F5H
	db	0C5H, 0D5H, 0E5H, 011H
	db	020H, 05CH, 00EH, 009H
	db	0CDH, 005H, 000H, 0E1H
	db	0D1H, 0C1H, 0F1H, 0C9H
	db	00DH, 00AH, 04FH, 056H
	db	045H, 052H, 046H, 04CH
	db	04FH, 057H, 00DH, 00AH
	db	024H, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	001H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	002H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	003H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	004H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	005H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	006H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	007H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	008H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	009H, 000H, 011H, 011H
	db	000H, 0F0H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	00AH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	00BH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	00CH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	00DH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	00EH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	00FH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	010H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	011H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	012H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	013H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	014H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	015H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	016H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	017H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	018H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	019H, 007H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	01AH, 040H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	01BH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	01CH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	01DH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	01EH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	01FH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	020H, 07FH, 023H, 042H
	db	000H, 0F0H, 000H, 0F0H
	db	000H, 090H, 000H, 010H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	021H, 07FH, 013H, 041H
	db	000H, 010H, 000H, 010H
	db	0FFH, 0FFH, 000H, 090H
	db	000H, 080H, 000H, 000H
	db	000H, 000H, 099H, 006H
	db	000H, 000H, 000H, 000H
	db	022H, 04BH, 044H, 044H
	db	03EH, 0F2H, 0E8H, 0F1H
	db	03EH, 0F2H, 0E8H, 0F1H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	023H, 07FH, 055H, 055H
	db	002H, 0F3H, 0FFH, 0FFH
	db	002H, 0F3H, 0FFH, 0FFH
	db	002H, 0F3H, 001H, 006H
	db	09FH, 007H, 001H, 006H
	db	09FH, 007H, 001H, 006H
	db	024H, 07FH, 055H, 054H
	db	007H, 0F0H, 082H, 0FFH
	db	002H, 0B3H, 007H, 0F7H
	db	080H, 0F9H, 080H, 005H
	db	01FH, 003H, 006H, 001H
	db	08EH, 007H, 013H, 000H
	db	025H, 06FH, 034H, 043H
	db	029H, 0F0H, 006H, 0FEH
	db	0B8H, 0F1H, 040H, 090H
	db	000H, 000H, 09CH, 007H
	db	003H, 000H, 00CH, 000H
	db	000H, 000H, 000H, 000H
	db	026H, 077H, 044H, 044H
	db	03FH, 0F0H, 0F7H, 0FFH
	db	0E9H, 0F9H, 000H, 0FCH
	db	000H, 000H, 08CH, 007H
	db	09BH, 005H, 09FH, 007H
	db	013H, 000H, 000H, 000H
	db	027H, 04BH, 023H, 042H
	db	000H, 090H, 03EH, 0F2H
	db	0E8H, 0F1H, 000H, 010H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	028H, 06FH, 035H, 042H
	db	000H, 090H, 0FFH, 0FFH
	db	070H, 0F0H, 070H, 0B0H
	db	070H, 080H, 000H, 000H
	db	0FFH, 007H, 060H, 000H
	db	060H, 000H, 060H, 000H
	db	029H, 07DH, 035H, 042H
	db	070H, 080H, 070H, 0B0H
	db	070H, 0F0H, 0FFH, 0FFH
	db	000H, 090H, 060H, 000H
	db	060H, 000H, 060H, 000H
	db	0FFH, 007H, 000H, 000H
	db	02AH, 07FH, 055H, 055H
	db	002H, 0F0H, 001H, 0F7H
	db	003H, 0FFH, 002H, 0FEH
	db	000H, 0F1H, 081H, 006H
	db	01DH, 007H, 09FH, 00FH
	db	08FH, 006H, 011H, 006H
	db	02BH, 052H, 033H, 043H
	db	000H, 010H, 001H, 0FCH
	db	003H, 0FFH, 001H, 0FCH
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 001H, 006H
	db	000H, 000H, 000H, 000H
	db	02CH, 064H, 023H, 042H
	db	000H, 010H, 000H, 0F0H
	db	000H, 0F0H, 000H, 090H
	db	000H, 000H, 000H, 000H
	db	040H, 000H, 0B8H, 000H
	db	000H, 000H, 000H, 000H
	db	02DH, 052H, 035H, 042H
	db	001H, 0FCH, 001H, 0FCH
	db	001H, 0BCH, 001H, 09CH
	db	000H, 080H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	02EH, 064H, 015H, 041H
	db	000H, 0F0H, 000H, 090H
	db	000H, 090H, 000H, 090H
	db	000H, 080H, 098H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	02FH, 04EH, 045H, 043H
	db	000H, 090H, 001H, 0F0H
	db	006H, 0FEH, 0B8H, 0F1H
	db	040H, 0A0H, 080H, 000H
	db	01CH, 007H, 003H, 000H
	db	000H, 000H, 000H, 000H
	db	030H, 07FH, 033H, 043H
	db	0BFH, 0FFH, 070H, 010H
	db	070H, 0F0H, 0EFH, 0FFH
	db	000H, 000H, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	01FH, 007H, 000H, 000H
	db	031H, 07FH, 033H, 043H
	db	004H, 0F0H, 0B8H, 0E0H
	db	0B8H, 010H, 0FFH, 0FFH
	db	000H, 010H, 000H, 000H
	db	000H, 000H, 098H, 000H
	db	09FH, 007H, 098H, 000H
	db	032H, 07FH, 033H, 043H
	db	0BDH, 0F0H, 071H, 0FCH
	db	071H, 01CH, 0EEH, 0FFH
	db	000H, 000H, 09CH, 007H
	db	09BH, 000H, 098H, 000H
	db	098H, 000H, 000H, 000H
	db	033H, 07FH, 033H, 043H
	db	030H, 0F0H, 071H, 014H
	db	071H, 0FCH, 0EEH, 0FFH
	db	000H, 000H, 088H, 000H
	db	098H, 000H, 098H, 000H
	db	01FH, 007H, 000H, 000H
	db	034H, 07FH, 033H, 043H
	db	007H, 0FEH, 0B8H, 0F1H
	db	0FFH, 0FFH, 000H, 010H
	db	000H, 000H, 001H, 006H
	db	001H, 006H, 09FH, 007H
	db	001H, 000H, 000H, 000H
	db	035H, 07FH, 033H, 043H
	db	0FFH, 0FFH, 071H, 0FCH
	db	071H, 01CH, 071H, 0FCH
	db	000H, 000H, 088H, 000H
	db	098H, 000H, 098H, 000H
	db	01FH, 007H, 000H, 000H
	db	036H, 07FH, 033H, 043H
	db	007H, 0FEH, 0B9H, 0FDH
	db	071H, 01CH, 041H, 0FCH
	db	000H, 000H, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	01FH, 007H, 000H, 000H
	db	037H, 07FH, 033H, 043H
	db	030H, 010H, 071H, 0F0H
	db	076H, 0FEH, 0F8H, 0F1H
	db	000H, 000H, 000H, 000H
	db	09CH, 007H, 003H, 000H
	db	000H, 000H, 000H, 000H
	db	038H, 07FH, 033H, 043H
	db	0BFH, 0F7H, 071H, 01CH
	db	071H, 0FCH, 0EEH, 0FFH
	db	000H, 000H, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	01FH, 007H, 000H, 000H
	db	039H, 07FH, 033H, 043H
	db	0BFH, 0F7H, 071H, 01CH
	db	071H, 0FCH, 0EEH, 0FFH
	db	000H, 000H, 080H, 000H
	db	098H, 000H, 01CH, 007H
	db	003H, 000H, 000H, 000H
	db	03AH, 07FH, 013H, 041H
	db	000H, 090H, 002H, 0F3H
	db	000H, 090H, 000H, 010H
	db	000H, 000H, 000H, 000H
	db	006H, 001H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	03BH, 07CH, 023H, 042H
	db	000H, 010H, 000H, 0F0H
	db	001H, 0FCH, 000H, 090H
	db	000H, 000H, 000H, 000H
	db	040H, 000H, 0B8H, 000H
	db	000H, 000H, 000H, 000H
	db	03CH, 06AH, 033H, 043H
	db	000H, 010H, 001H, 0F0H
	db	006H, 0FEH, 088H, 0F1H
	db	000H, 000H, 000H, 000H
	db	000H, 005H, 08FH, 002H
	db	010H, 000H, 000H, 000H
	db	03DH, 052H, 034H, 042H
	db	000H, 010H, 002H, 0F3H
	db	002H, 0F3H, 002H, 0B3H
	db	002H, 083H, 000H, 000H
	db	001H, 006H, 001H, 006H
	db	001H, 006H, 001H, 006H
	db	03EH, 055H, 033H, 043H
	db	000H, 010H, 00EH, 0F0H
	db	081H, 0F7H, 000H, 0F8H
	db	000H, 000H, 000H, 000H
	db	080H, 000H, 01CH, 007H
	db	003H, 000H, 000H, 000H
	db	03FH, 059H, 035H, 043H
	db	0BCH, 0F0H, 070H, 090H
	db	071H, 0F0H, 0EEH, 0FFH
	db	000H, 080H, 000H, 000H
	db	000H, 000H, 098H, 006H
	db	001H, 000H, 000H, 000H
	db	040H, 07FH, 045H, 043H
	db	08FH, 0FFH, 08CH, 080H
	db	0BCH, 0F0H, 0C8H, 0F0H
	db	000H, 0B0H, 09FH, 00FH
	db	099H, 006H, 099H, 006H
	db	099H, 000H, 010H, 000H
	db	041H, 076H, 045H, 044H
	db	007H, 0FEH, 0B8H, 0F1H
	db	070H, 080H, 06EH, 0F0H
	db	081H, 0FFH, 09FH, 007H
	db	001H, 006H, 001H, 006H
	db	001H, 006H, 09FH, 007H
	db	042H, 07FH, 045H, 043H
	db	0FFH, 0FFH, 071H, 0F4H
	db	071H, 08CH, 071H, 0BCH
	db	0EEH, 0FFH, 09FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	043H, 06FH, 045H, 043H
	db	0BFH, 0FFH, 070H, 0F0H
	db	070H, 0B0H, 070H, 080H
	db	060H, 0F0H, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 018H, 000H
	db	044H, 07FH, 045H, 043H
	db	0FFH, 0FFH, 070H, 0F0H
	db	070H, 0B0H, 070H, 080H
	db	0EFH, 0FFH, 09FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	045H, 07FH, 045H, 043H
	db	0FFH, 0FFH, 071H, 0FCH
	db	071H, 08CH, 070H, 0FCH
	db	060H, 0B0H, 09FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 018H, 000H
	db	046H, 05FH, 045H, 043H
	db	0FFH, 0FFH, 071H, 0BCH
	db	071H, 09CH, 070H, 0ECH
	db	060H, 0F0H, 09FH, 007H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	047H, 07FH, 045H, 043H
	db	0BFH, 0FFH, 070H, 080H
	db	071H, 0F0H, 071H, 0BCH
	db	061H, 0FCH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	048H, 07FH, 045H, 043H
	db	0FFH, 0FFH, 001H, 0FCH
	db	001H, 08CH, 001H, 0BCH
	db	0FFH, 0FFH, 09FH, 007H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 09FH, 007H
	db	049H, 07FH, 011H, 041H
	db	070H, 010H, 0FFH, 0FFH
	db	070H, 010H, 000H, 010H
	db	000H, 000H, 098H, 000H
	db	09FH, 007H, 098H, 000H
	db	000H, 000H, 000H, 000H
	db	04AH, 07CH, 045H, 043H
	db	000H, 0F0H, 000H, 080H
	db	000H, 0B0H, 000H, 0F0H
	db	0FFH, 0FFH, 088H, 000H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	04BH, 06FH, 045H, 043H
	db	0FFH, 0FFH, 001H, 08CH
	db	007H, 0FEH, 0B8H, 0F9H
	db	040H, 0B0H, 09FH, 007H
	db	000H, 000H, 000H, 005H
	db	08FH, 002H, 010H, 000H
	db	04CH, 067H, 045H, 043H
	db	0FFH, 0FFH, 000H, 0B0H
	db	000H, 0E0H, 000H, 090H
	db	000H, 0F0H, 09FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 018H, 000H
	db	04DH, 07FH, 055H, 044H
	db	0EFH, 0FFH, 081H, 0F7H
	db	001H, 0A8H, 006H, 0FEH
	db	0BFH, 0FFH, 09FH, 007H
	db	000H, 004H, 001H, 006H
	db	001H, 000H, 09FH, 007H
	db	04EH, 07FH, 045H, 043H
	db	0FFH, 0FFH, 06EH, 0B0H
	db	081H, 0F7H, 000H, 088H
	db	0FFH, 0FFH, 09FH, 007H
	db	000H, 000H, 000H, 005H
	db	08FH, 002H, 09FH, 007H
	db	04FH, 07FH, 045H, 043H
	db	0BFH, 0FFH, 070H, 0F0H
	db	070H, 080H, 070H, 0B0H
	db	0EFH, 0FFH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	050H, 05FH, 045H, 043H
	db	0FFH, 0FFH, 071H, 0F4H
	db	071H, 08CH, 071H, 0BCH
	db	0EEH, 0FFH, 09FH, 007H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	051H, 07FH, 045H, 043H
	db	0BFH, 0FFH, 070H, 0B0H
	db	070H, 080H, 070H, 0F0H
	db	0EFH, 0FFH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	0FCH, 001H, 01FH, 007H
	db	052H, 07FH, 045H, 043H
	db	0FFH, 0FFH, 071H, 0BCH
	db	071H, 0FCH, 0EEH, 0FFH
	db	000H, 080H, 09FH, 007H
	db	000H, 000H, 000H, 005H
	db	08FH, 002H, 010H, 000H
	db	053H, 07FH, 045H, 043H
	db	0BFH, 0F7H, 071H, 0FCH
	db	071H, 08CH, 071H, 0BCH
	db	061H, 0FCH, 088H, 000H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	054H, 049H, 055H, 053H
	db	010H, 0B0H, 070H, 0F0H
	db	0FFH, 0FFH, 070H, 0F0H
	db	040H, 0B0H, 000H, 000H
	db	000H, 000H, 09FH, 007H
	db	000H, 000H, 000H, 000H
	db	055H, 07FH, 045H, 043H
	db	0FFH, 0FFH, 000H, 0F0H
	db	000H, 080H, 000H, 0B0H
	db	0FFH, 0FFH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	056H, 05BH, 045H, 044H
	db	0FFH, 0F7H, 000H, 0F8H
	db	000H, 080H, 001H, 0F0H
	db	0FEH, 0FFH, 000H, 005H
	db	08FH, 002H, 098H, 000H
	db	01CH, 007H, 003H, 000H
	db	057H, 05BH, 055H, 044H
	db	0FFH, 0F7H, 001H, 0F8H
	db	001H, 0AEH, 001H, 0F8H
	db	0FEH, 0FFH, 000H, 005H
	db	00FH, 007H, 003H, 005H
	db	00FH, 007H, 003H, 000H
	db	058H, 06DH, 055H, 053H
	db	010H, 0B0H, 06FH, 0F0H
	db	087H, 0FFH, 0B8H, 0F9H
	db	040H, 0B0H, 080H, 000H
	db	01CH, 007H, 003H, 005H
	db	08FH, 002H, 010H, 000H
	db	059H, 04DH, 045H, 054H
	db	06EH, 0F0H, 081H, 0F7H
	db	006H, 0FEH, 0B8H, 0F1H
	db	040H, 090H, 080H, 000H
	db	01CH, 007H, 003H, 000H
	db	000H, 000H, 000H, 000H
	db	05AH, 06DH, 035H, 043H
	db	010H, 090H, 071H, 0F0H
	db	076H, 0FEH, 0F8H, 0F1H
	db	040H, 080H, 080H, 000H
	db	09CH, 007H, 09BH, 000H
	db	098H, 000H, 010H, 000H
	db	05BH, 07FH, 045H, 044H
	db	077H, 0FEH, 0B8H, 0F1H
	db	070H, 080H, 06EH, 0F0H
	db	0F1H, 0FFH, 09FH, 007H
	db	001H, 006H, 001H, 006H
	db	001H, 006H, 09FH, 007H
	db	05CH, 07FH, 045H, 044H
	db	077H, 0FEH, 08CH, 0F1H
	db	08CH, 080H, 08EH, 0F0H
	db	0F1H, 0FFH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	05DH, 07FH, 045H, 044H
	db	003H, 0FEH, 03EH, 0F3H
	db	0FEH, 083H, 0EAH, 0F3H
	db	001H, 0FFH, 09FH, 007H
	db	001H, 006H, 001H, 006H
	db	001H, 006H, 09FH, 007H
	db	05EH, 07FH, 045H, 043H
	db	073H, 0FFH, 000H, 0B0H
	db	000H, 0F0H, 000H, 080H
	db	073H, 0FFH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	05FH, 064H, 045H, 043H
	db	000H, 0F0H, 000H, 0F0H
	db	000H, 0F0H, 000H, 0B0H
	db	000H, 080H, 060H, 000H
	db	060H, 000H, 060H, 000H
	db	060H, 000H, 060H, 000H
	db	060H, 049H, 045H, 043H
	db	003H, 0FEH, 006H, 083H
	db	0BAH, 0F3H, 042H, 0B3H
	db	001H, 0FFH, 08FH, 007H
	db	099H, 006H, 099H, 006H
	db	099H, 006H, 019H, 006H
	db	061H, 076H, 045H, 043H
	db	002H, 0F2H, 002H, 083H
	db	002H, 0B3H, 002H, 0F3H
	db	001H, 0FFH, 08CH, 007H
	db	099H, 006H, 099H, 006H
	db	019H, 006H, 09FH, 007H
	db	062H, 077H, 045H, 043H
	db	0FFH, 0FFH, 002H, 0F2H
	db	002H, 0B3H, 002H, 083H
	db	001H, 0FFH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	063H, 076H, 045H, 043H
	db	003H, 0FEH, 002H, 0F3H
	db	002H, 0A3H, 002H, 093H
	db	000H, 0F3H, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 018H, 000H
	db	064H, 07EH, 045H, 043H
	db	003H, 0FEH, 002H, 093H
	db	002H, 0A3H, 000H, 0F3H
	db	0FFH, 0FFH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	065H, 076H, 045H, 043H
	db	003H, 0FEH, 002H, 0E3H
	db	002H, 0B3H, 002H, 093H
	db	001H, 0FFH, 08FH, 007H
	db	099H, 006H, 099H, 006H
	db	099H, 006H, 019H, 006H
	db	066H, 04BH, 044H, 043H
	db	002H, 0F2H, 0BFH, 0FFH
	db	072H, 0B3H, 060H, 0F1H
	db	000H, 000H, 000H, 000H
	db	09FH, 007H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	067H, 076H, 045H, 043H
	db	003H, 0FEH, 002H, 083H
	db	002H, 0B3H, 002H, 0F3H
	db	003H, 0FFH, 047H, 007H
	db	066H, 001H, 066H, 001H
	db	066H, 001H, 0BFH, 007H
	db	068H, 077H, 045H, 043H
	db	0FFH, 0FFH, 002H, 0F2H
	db	002H, 0B3H, 002H, 083H
	db	001H, 0FFH, 09FH, 007H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 09FH, 007H
	db	069H, 07FH, 011H, 041H
	db	002H, 013H, 073H, 0FFH
	db	000H, 010H, 000H, 010H
	db	000H, 000H, 098H, 000H
	db	09FH, 007H, 098H, 000H
	db	000H, 000H, 000H, 000H
	db	06AH, 07CH, 023H, 052H
	db	000H, 090H, 000H, 0F0H
	db	073H, 0FFH, 000H, 010H
	db	000H, 010H, 060H, 000H
	db	060H, 000H, 0BFH, 007H
	db	000H, 000H, 000H, 000H
	db	06BH, 047H, 045H, 043H
	db	0FFH, 0FFH, 000H, 080H
	db	001H, 0B0H, 002H, 0FEH
	db	000H, 0F1H, 09FH, 007H
	db	001H, 006H, 001H, 007H
	db	08FH, 002H, 010H, 000H
	db	06CH, 067H, 034H, 042H
	db	0FFH, 0FFH, 000H, 0B0H
	db	000H, 080H, 000H, 0F0H
	db	000H, 010H, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	018H, 000H, 000H, 000H
	db	06DH, 076H, 055H, 045H
	db	003H, 0FFH, 002H, 0E3H
	db	003H, 0FFH, 002H, 0F3H
	db	001H, 0FFH, 09FH, 007H
	db	000H, 000H, 09FH, 007H
	db	000H, 000H, 09FH, 007H
	db	06EH, 076H, 045H, 043H
	db	003H, 0FFH, 002H, 092H
	db	002H, 0F3H, 002H, 0A3H
	db	001H, 0FFH, 09FH, 007H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 09FH, 007H
	db	06FH, 076H, 045H, 043H
	db	003H, 0FEH, 002H, 0F3H
	db	002H, 0B3H, 002H, 083H
	db	001H, 0FFH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	070H, 056H, 045H, 043H
	db	003H, 0FFH, 002H, 0F2H
	db	002H, 0A3H, 002H, 093H
	db	001H, 0FFH, 0FFH, 007H
	db	006H, 001H, 006H, 001H
	db	006H, 001H, 007H, 007H
	db	071H, 072H, 045H, 043H
	db	003H, 0FEH, 002H, 0B3H
	db	002H, 093H, 000H, 0E3H
	db	003H, 0FFH, 007H, 007H
	db	006H, 001H, 006H, 001H
	db	006H, 001H, 0FFH, 007H
	db	072H, 046H, 034H, 043H
	db	003H, 0FFH, 002H, 0F2H
	db	002H, 093H, 000H, 0F1H
	db	000H, 000H, 09FH, 007H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	073H, 076H, 045H, 043H
	db	003H, 0FEH, 002H, 0F3H
	db	002H, 0B3H, 002H, 083H
	db	000H, 0F3H, 089H, 006H
	db	099H, 006H, 099H, 006H
	db	099H, 006H, 01FH, 007H
	db	074H, 072H, 034H, 053H
	db	002H, 0F2H, 0FFH, 0FFH
	db	002H, 093H, 002H, 0F3H
	db	000H, 010H, 000H, 000H
	db	08FH, 007H, 098H, 000H
	db	018H, 000H, 000H, 000H
	db	075H, 076H, 045H, 043H
	db	003H, 0FFH, 000H, 0F0H
	db	000H, 0A0H, 000H, 090H
	db	003H, 0FFH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	076H, 052H, 045H, 044H
	db	003H, 0F7H, 000H, 0F8H
	db	000H, 080H, 001H, 0F0H
	db	002H, 0FFH, 000H, 005H
	db	08FH, 002H, 098H, 000H
	db	01CH, 007H, 003H, 000H
	db	077H, 052H, 055H, 044H
	db	003H, 0F7H, 001H, 0F8H
	db	001H, 0AEH, 001H, 0F8H
	db	002H, 0FFH, 000H, 005H
	db	00FH, 007H, 003H, 005H
	db	00FH, 007H, 003H, 000H
	db	078H, 040H, 055H, 044H
	db	002H, 0F0H, 001H, 0F7H
	db	001H, 0A8H, 002H, 0FEH
	db	000H, 0F1H, 080H, 000H
	db	01CH, 007H, 003H, 005H
	db	08FH, 002H, 010H, 000H
	db	079H, 076H, 045H, 043H
	db	003H, 0FFH, 000H, 0F0H
	db	000H, 0B0H, 000H, 080H
	db	003H, 0FFH, 047H, 007H
	db	066H, 001H, 066H, 001H
	db	066H, 001H, 0BFH, 007H
	db	07AH, 076H, 035H, 043H
	db	002H, 0F3H, 002H, 093H
	db	002H, 0E3H, 003H, 093H
	db	002H, 0FFH, 09CH, 007H
	db	09BH, 006H, 099H, 006H
	db	099H, 006H, 099H, 000H
	db	07BH, 07FH, 045H, 043H
	db	072H, 0F2H, 002H, 093H
	db	002H, 0A3H, 002H, 0F3H
	db	071H, 0FFH, 08CH, 007H
	db	09BH, 006H, 099H, 006H
	db	019H, 006H, 09FH, 007H
	db	07CH, 07FH, 045H, 043H
	db	073H, 0FEH, 002H, 0F3H
	db	002H, 0A3H, 002H, 093H
	db	071H, 0FFH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	07DH, 07FH, 045H, 044H
	db	002H, 0F2H, 03EH, 0F3H
	db	0FEH, 083H, 0EAH, 0F3H
	db	001H, 0FFH, 08CH, 007H
	db	099H, 006H, 099H, 006H
	db	019H, 006H, 09FH, 007H
	db	07EH, 07FH, 045H, 043H
	db	08DH, 0FCH, 000H, 0B0H
	db	000H, 080H, 000H, 0F0H
	db	08DH, 0FCH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	018H, 000H, 09FH, 007H
	db	07FH, 07FH, 045H, 053H
	db	0FFH, 0FFH, 0FFH, 0FFH
	db	0FFH, 0FFH, 0FFH, 0BFH
	db	0FFH, 09FH, 0FFH, 007H
	db	0FFH, 007H, 0FFH, 007H
	db	0FFH, 007H, 0FFH, 007H
	db	080H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	081H, 07FH, 045H, 043H
	db	08DH, 0FCH, 000H, 0B0H
	db	000H, 080H, 000H, 0F0H
	db	08DH, 0FCH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	018H, 000H, 09FH, 007H
	db	082H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	083H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	084H, 07FH, 045H, 043H
	db	072H, 0F2H, 002H, 093H
	db	002H, 0A3H, 002H, 0F3H
	db	071H, 0FFH, 08CH, 007H
	db	099H, 006H, 099H, 006H
	db	019H, 006H, 09FH, 007H
	db	085H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	086H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	087H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	088H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	089H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	08AH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	08BH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	08CH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	08DH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	08EH, 07FH, 045H, 044H
	db	077H, 0FEH, 0B8H, 0F1H
	db	070H, 080H, 06EH, 0F0H
	db	0F1H, 0FFH, 09FH, 007H
	db	001H, 006H, 001H, 006H
	db	001H, 006H, 09FH, 007H
	db	08FH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	090H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	091H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	092H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	093H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	094H, 07FH, 045H, 043H
	db	073H, 0FEH, 002H, 0F3H
	db	002H, 0A3H, 002H, 093H
	db	071H, 0FFH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	095H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	096H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	097H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	098H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	099H, 07FH, 045H, 044H
	db	077H, 0FEH, 08CH, 0F1H
	db	08CH, 080H, 08EH, 0F0H
	db	0F1H, 0FFH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	09AH, 07FH, 045H, 043H
	db	073H, 0FFH, 000H, 0B0H
	db	000H, 080H, 000H, 0F0H
	db	073H, 0FFH, 08FH, 007H
	db	098H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	09BH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	09CH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	09DH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	09EH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	09FH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0A0H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0A1H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0A2H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0A3H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0A4H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0A5H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0A6H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0A7H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0A8H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0A9H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0AAH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0ABH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0ACH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0ADH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0AEH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0AFH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0B0H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0B1H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0B2H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0B3H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0B4H, 040H, 055H, 045H
	db	0BFH, 0F7H, 071H, 0FCH
	db	071H, 0ECH, 071H, 0FCH
	db	061H, 0FCH, 088H, 008H
	db	098H, 008H, 098H, 000H
	db	098H, 000H, 01FH, 00FH
	db	0B5H, 000H, 044H, 044H
	db	007H, 0FEH, 0B9H, 0FDH
	db	0FFH, 0FFH, 071H, 0FCH
	db	000H, 000H, 071H, 006H
	db	061H, 006H, 061H, 006H
	db	061H, 006H, 000H, 000H
	db	0B6H, 000H, 044H, 044H
	db	071H, 0FCH, 0FFH, 0FFH
	db	06FH, 0FCH, 081H, 0FFH
	db	000H, 000H, 061H, 00EH
	db	061H, 006H, 061H, 006H
	db	0E1H, 006H, 000H, 000H
	db	0B7H, 000H, 044H, 044H
	db	000H, 0F0H, 000H, 0F0H
	db	000H, 0F0H, 000H, 0F0H
	db	000H, 000H, 070H, 000H
	db	060H, 000H, 060H, 000H
	db	060H, 000H, 000H, 000H
	db	0B8H, 000H, 044H, 044H
	db	000H, 0F0H, 000H, 0F0H
	db	000H, 0F0H, 000H, 0F0H
	db	000H, 000H, 060H, 000H
	db	060H, 000H, 060H, 000H
	db	0E0H, 000H, 000H, 000H
	db	0B9H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0BAH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0BBH, 040H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0BCH, 040H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0BDH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0BEH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0BFH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0C0H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0C1H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0C2H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0C3H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0C4H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0C5H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0C6H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0C7H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0C8H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0C9H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0CAH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0CBH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0CCH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0CDH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0CEH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0CFH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0D0H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0D1H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0D2H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0D3H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0D4H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0D5H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0D6H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0D7H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0D8H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0D9H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0DAH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0DBH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0DCH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0DDH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0DEH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0DFH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0E0H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0E1H, 07FH, 045H, 043H
	db	0BFH, 0FFH, 072H, 0F2H
	db	072H, 0B3H, 072H, 083H
	db	0E9H, 0FFH, 0FFH, 007H
	db	088H, 000H, 098H, 000H
	db	098H, 000H, 01FH, 007H
	db	0E2H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0E3H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0E4H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0E5H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0E6H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0E7H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0E8H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0E9H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0EAH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0EBH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0ECH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0EDH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0EEH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0EFH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0F0H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0F1H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0F2H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0F3H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0F4H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0F5H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0F6H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0F7H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0F8H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0F9H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0FAH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0FBH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0FCH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0FDH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0FEH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	0FFH, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
	db	000H, 000H, 000H, 000H
