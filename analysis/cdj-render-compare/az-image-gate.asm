 23fad60: a9b17bfd     	stp	x29, x30, [sp, #-0xf0]!
 23fad64: aa0303e6     	mov	x6, x3
 23fad68: 910003fd     	mov	x29, sp
 23fad6c: a90153f3     	stp	x19, x20, [sp, #0x10]
 23fad70: aa0103f4     	mov	x20, x1
 23fad74: 91002001     	add	x1, x0, #0x8
 23fad78: aa0003f3     	mov	x19, x0
 23fad7c: a9025bf5     	stp	x21, x22, [sp, #0x20]
 23fad80: 39408020     	ldrb	w0, [x1, #0x20]
 23fad84: 340009e0     	cbz	w0, 0x23faec0
 23fad88: 2d440663     	ldp	s3, s1, [x19, #0x20]
 23fad8c: 2d410047     	ldp	s7, s0, [x2, #0x8]
 23fad90: 5e21d863     	scvtf	s3, s3
 23fad94: 5e21d821     	scvtf	s1, s1
 23fad98: 2d421845     	ldp	s5, s6, [x2, #0x10]
 23fad9c: 2d401042     	ldp	s2, s4, [x2]
 23fada0: 1e272863     	fadd	s3, s3, s7
 23fada4: 1e262821     	fadd	s1, s1, s6
 23fada8: 2d1513e2     	stp	s2, s4, [sp, #0xa8]
 23fadac: 2d1603e3     	stp	s3, s0, [sp, #0xb0]
 23fadb0: 2d1707e5     	stp	s5, s1, [sp, #0xb8]
 23fadb4: 1e20c083     	fabs	s3, s4
 23fadb8: 52824de0     	mov	w0, #0x126f             // =4719
 23fadbc: 72a76060     	movk	w0, #0x3b03, lsl #16
 23fadc0: 1e270001     	fmov	s1, w0
 23fadc4: 3940ce75     	ldrb	w21, [x19, #0x33]
 23fadc8: 1e212070     	fcmpe	s3, s1
 23fadcc: 54000545     	b.pl	0x23fae74
 23fadd0: 1e20c003     	fabs	s3, s0
 23fadd4: 1e212070     	fcmpe	s3, s1
 23fadd8: 540004e5     	b.pl	0x23fae74
 23faddc: 1e2e1003     	fmov	s3, #1.00000000
 23fade0: 7ea3d446     	fabd	s6, s2, s3
 23fade4: 1e2120d0     	fcmpe	s6, s1
 23fade8: 54000465     	b.pl	0x23fae74
 23fadec: 7ea3d4a3     	fabd	s3, s5, s3
 23fadf0: 1e212070     	fcmpe	s3, s1
 23fadf4: 54000405     	b.pl	0x23fae74
 23fadf8: b9406261     	ldr	w1, [x19, #0x60]
 23fadfc: bd40b3e1     	ldr	s1, [sp, #0xb0]
 23fae00: bd40bfe3     	ldr	s3, [sp, #0xbc]
 23fae04: 1e18e024     	fcvtzs	w4, s1, #0x8
 23fae08: 1e18e060     	fcvtzs	w0, s3, #0x8
 23fae0c: 34000081     	cbz	w1, 0x23fae1c
 23fae10: 2a000081     	orr	w1, w4, w0
 23fae14: 721b083f     	tst	w1, #0xe0
 23fae18: 540002e1     	b.ne	0x23fae74
 23fae1c: 11020084     	add	w4, w4, #0x80
 23fae20: 11020000     	add	w0, w0, #0x80
 23fae24: 1e270080     	fmov	s0, w4
 23fae28: fd0033e8     	str	d8, [sp, #0x60]
 23fae2c: 13087c16     	asr	w22, w0, #8
 23fae30: 0f380408     	sshr	v8.2s, v0.2s, #0x8
 23fae34: b4000d46     	cbz	x6, 0x23fafdc
 23fae38: f94000c0     	ldr	x0, [x6]
 23fae3c: 1e260104     	fmov	w4, s8
 23fae40: 2a1603e5     	mov	w5, w22
 23fae44: 2a1503e3     	mov	w3, w21
 23fae48: aa1403e2     	mov	x2, x20
 23fae4c: aa1303e1     	mov	x1, x19
 23fae50: f9404807     	ldr	x7, [x0, #0x90]
 23fae54: aa0603e0     	mov	x0, x6
 23fae58: 52800026     	mov	w6, #0x1                // =1
 23fae5c: d63f00e0     	blr	x7
 23fae60: fd4033e8     	ldr	d8, [sp, #0x60]
 23fae64: a94153f3     	ldp	x19, x20, [sp, #0x10]
 23fae68: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 23fae6c: a8cf7bfd     	ldp	x29, x30, [sp], #0xf0
 23fae70: d65f03c0     	ret
 23fae74: 1e240800     	fmul	s0, s0, s4
 23fae78: 1f258040     	fnmsub	s0, s2, s5, s0
 23fae7c: 1e202008     	fcmp	s0, #0.0
