 251aa30: a9b17bfd     	stp	x29, x30, [sp, #-0xf0]!
 251aa34: aa0303e6     	mov	x6, x3
 251aa38: 910003fd     	mov	x29, sp
 251aa3c: a90153f3     	stp	x19, x20, [sp, #0x10]
 251aa40: aa0103f4     	mov	x20, x1
 251aa44: 91002001     	add	x1, x0, #0x8
 251aa48: aa0003f3     	mov	x19, x0
 251aa4c: a9025bf5     	stp	x21, x22, [sp, #0x20]
 251aa50: 39408020     	ldrb	w0, [x1, #0x20]
 251aa54: 340009e0     	cbz	w0, 0x251ab90
 251aa58: 2d440663     	ldp	s3, s1, [x19, #0x20]
 251aa5c: 2d410047     	ldp	s7, s0, [x2, #0x8]
 251aa60: 5e21d863     	scvtf	s3, s3
 251aa64: 5e21d821     	scvtf	s1, s1
 251aa68: 2d421845     	ldp	s5, s6, [x2, #0x10]
 251aa6c: 2d401042     	ldp	s2, s4, [x2]
 251aa70: 1e272863     	fadd	s3, s3, s7
 251aa74: 1e262821     	fadd	s1, s1, s6
 251aa78: 2d1513e2     	stp	s2, s4, [sp, #0xa8]
 251aa7c: 2d1603e3     	stp	s3, s0, [sp, #0xb0]
 251aa80: 2d1707e5     	stp	s5, s1, [sp, #0xb8]
 251aa84: 1e20c083     	fabs	s3, s4
 251aa88: 52824de0     	mov	w0, #0x126f             // =4719
 251aa8c: 72a76060     	movk	w0, #0x3b03, lsl #16
 251aa90: 1e270001     	fmov	s1, w0
 251aa94: 3940ce75     	ldrb	w21, [x19, #0x33]
 251aa98: 1e212070     	fcmpe	s3, s1
 251aa9c: 54000545     	b.pl	0x251ab44
 251aaa0: 1e20c003     	fabs	s3, s0
 251aaa4: 1e212070     	fcmpe	s3, s1
 251aaa8: 540004e5     	b.pl	0x251ab44
 251aaac: 1e2e1003     	fmov	s3, #1.00000000
 251aab0: 7ea3d446     	fabd	s6, s2, s3
 251aab4: 1e2120d0     	fcmpe	s6, s1
 251aab8: 54000465     	b.pl	0x251ab44
 251aabc: 7ea3d4a3     	fabd	s3, s5, s3
 251aac0: 1e212070     	fcmpe	s3, s1
 251aac4: 54000405     	b.pl	0x251ab44
 251aac8: b9406261     	ldr	w1, [x19, #0x60]
 251aacc: bd40b3e1     	ldr	s1, [sp, #0xb0]
 251aad0: bd40bfe3     	ldr	s3, [sp, #0xbc]
 251aad4: 1e18e024     	fcvtzs	w4, s1, #0x8
 251aad8: 1e18e060     	fcvtzs	w0, s3, #0x8
 251aadc: 34000081     	cbz	w1, 0x251aaec
 251aae0: 2a000081     	orr	w1, w4, w0
 251aae4: 721b083f     	tst	w1, #0xe0
 251aae8: 540002e1     	b.ne	0x251ab44
 251aaec: 11020084     	add	w4, w4, #0x80
 251aaf0: 11020000     	add	w0, w0, #0x80
 251aaf4: 1e270080     	fmov	s0, w4
 251aaf8: fd0033e8     	str	d8, [sp, #0x60]
 251aafc: 13087c16     	asr	w22, w0, #8
 251ab00: 0f380408     	sshr	v8.2s, v0.2s, #0x8
 251ab04: b4000d46     	cbz	x6, 0x251acac
 251ab08: f94000c0     	ldr	x0, [x6]
 251ab0c: 1e260104     	fmov	w4, s8
 251ab10: 2a1603e5     	mov	w5, w22
 251ab14: 2a1503e3     	mov	w3, w21
 251ab18: aa1403e2     	mov	x2, x20
 251ab1c: aa1303e1     	mov	x1, x19
 251ab20: f9404807     	ldr	x7, [x0, #0x90]
 251ab24: aa0603e0     	mov	x0, x6
 251ab28: 52800026     	mov	w6, #0x1                // =1
 251ab2c: d63f00e0     	blr	x7
 251ab30: fd4033e8     	ldr	d8, [sp, #0x60]
 251ab34: a94153f3     	ldp	x19, x20, [sp, #0x10]
 251ab38: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 251ab3c: a8cf7bfd     	ldp	x29, x30, [sp], #0xf0
 251ab40: d65f03c0     	ret
 251ab44: 1e240800     	fmul	s0, s0, s4
 251ab48: 1f258040     	fnmsub	s0, s2, s5, s0
 251ab4c: 1e202008     	fcmp	s0, #0.0
 251ab50: 54ffff20     	b.eq	0x251ab34
