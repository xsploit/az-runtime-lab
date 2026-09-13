 212f300: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 212f304: 910003fd     	mov	x29, sp
 212f308: a90153f3     	stp	x19, x20, [sp, #0x10]
 212f30c: aa0003f3     	mov	x19, x0
 212f310: 91016014     	add	x20, x0, #0x58
 212f314: aa1403e0     	mov	x0, x20
 212f318: 97ffff9e     	bl	0x212f190
 212f31c: 6d469664     	ldp	d4, d5, [x19, #0x68]
 212f320: fd404261     	ldr	d1, [x19, #0x80]
 212f324: fd402e60     	ldr	d0, [x19, #0x58]
 212f328: 1e6438a3     	fsub	d3, d5, d4
 212f32c: 1e643821     	fsub	d1, d1, d4
 212f330: 1e601862     	fdiv	d2, d3, d0
 212f334: 1e601821     	fdiv	d1, d1, d0
 212f338: 1e700041     	fcvtms	w1, d2
 212f33c: 1e700020     	fcvtms	w0, d1
 212f340: 4b000020     	sub	w0, w1, w0
 212f344: 7100041f     	cmp	w0, #0x1
 212f348: 5400036c     	b.gt	0x212f3b4
 212f34c: 1e780041     	fcvtzs	w1, d2
 212f350: d2e79602     	mov	x2, #0x3cb0000000000000 // =4372995238176751616
 212f354: 9e670046     	fmov	d6, x2
 212f358: 52800022     	mov	w2, #0x1                // =1
 212f35c: 4b000040     	sub	w0, w2, w0
 212f360: 1e620021     	scvtf	d1, w1
 212f364: 1e600821     	fmul	d1, d1, d0
 212f368: 1e613862     	fsub	d2, d3, d1
 212f36c: 1e602048     	fcmp	d2, #0.0
 212f370: 1e614043     	fneg	d3, d2
 212f374: 1e62bc62     	fcsel	d2, d3, d2, lt
 212f378: 1e662050     	fcmpe	d2, d6
 212f37c: 54000185     	b.pl	0x212f3ac
 212f380: 1e612881     	fadd	d1, d4, d1
 212f384: 1e620002     	scvtf	d2, w0
 212f388: 1e6c1003     	fmov	d3, #0.50000000
 212f38c: a94153f3     	ldp	x19, x20, [sp, #0x10]
 212f390: 1e653821     	fsub	d1, d1, d5
 212f394: 1f420400     	fmadd	d0, d0, d2, d1
 212f398: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 212f39c: 1e632800     	fadd	d0, d0, d3
 212f3a0: 1e780000     	fcvtzs	w0, d0
 212f3a4: 11000400     	add	w0, w0, #0x1
 212f3a8: d65f03c0     	ret
 212f3ac: 1e602821     	fadd	d1, d1, d0
 212f3b0: 17fffff4     	b	0x212f380
 212f3b4: 52800000     	mov	w0, #0x0                // =0
 212f3b8: a94153f3     	ldp	x19, x20, [sp, #0x10]
 212f3bc: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 212f3c0: d65f03c0     	ret
 212f3c4: d503201f     	nop
 212f3c8: d100a000     	sub	x0, x0, #0x28
 212f3cc: 17ffffcd     	b	0x212f300
