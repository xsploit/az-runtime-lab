
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002375420 <_ZNSt8functionIFvvEEC2ERKS1_>:
 23fad60:      	stp	x29, x30, [sp, #-0xf0]!
 23fad64:      	mov	x6, x3
 23fad68:      	mov	x29, sp
 23fad6c:      	stp	x19, x20, [sp, #0x10]
 23fad70:      	mov	x20, x1
 23fad74:      	add	x1, x0, #0x8
 23fad78:      	mov	x19, x0
 23fad7c:      	stp	x21, x22, [sp, #0x20]
 23fad80:      	ldrb	w0, [x1, #0x20]
 23fad84:      	cbz	w0, 0x23faec0 <_ZNSt8functionIFvvEEC2ERKS1_+0x85aa0>
 23fad88:      	ldp	s3, s1, [x19, #0x20]
 23fad8c:      	ldp	s7, s0, [x2, #0x8]
 23fad90:      	scvtf	s3, s3
 23fad94:      	scvtf	s1, s1
 23fad98:      	ldp	s5, s6, [x2, #0x10]
 23fad9c:      	ldp	s2, s4, [x2]
 23fada0:      	fadd	s3, s3, s7
 23fada4:      	fadd	s1, s1, s6
 23fada8:      	stp	s2, s4, [sp, #0xa8]
 23fadac:      	stp	s3, s0, [sp, #0xb0]
 23fadb0:      	stp	s5, s1, [sp, #0xb8]
 23fadb4:      	fabs	s3, s4
 23fadb8:      	mov	w0, #0x126f             // =4719
 23fadbc:      	movk	w0, #0x3b03, lsl #16
 23fadc0:      	fmov	s1, w0
 23fadc4:      	ldrb	w21, [x19, #0x33]
 23fadc8:      	fcmpe	s3, s1
 23fadcc:      	b.pl	0x23fae74 <_ZNSt8functionIFvvEEC2ERKS1_+0x85a54>
 23fadd0:      	fabs	s3, s0
 23fadd4:      	fcmpe	s3, s1
 23fadd8:      	b.pl	0x23fae74 <_ZNSt8functionIFvvEEC2ERKS1_+0x85a54>
 23faddc:      	fmov	s3, #1.00000000
 23fade0:      	fabd	s6, s2, s3
 23fade4:      	fcmpe	s6, s1
 23fade8:      	b.pl	0x23fae74 <_ZNSt8functionIFvvEEC2ERKS1_+0x85a54>
 23fadec:      	fabd	s3, s5, s3
 23fadf0:      	fcmpe	s3, s1
 23fadf4:      	b.pl	0x23fae74 <_ZNSt8functionIFvvEEC2ERKS1_+0x85a54>
 23fadf8:      	ldr	w1, [x19, #0x60]
 23fadfc:      	ldr	s1, [sp, #0xb0]
 23fae00:      	ldr	s3, [sp, #0xbc]
 23fae04:      	fcvtzs	w4, s1, #0x8
 23fae08:      	fcvtzs	w0, s3, #0x8
 23fae0c:      	cbz	w1, 0x23fae1c <_ZNSt8functionIFvvEEC2ERKS1_+0x859fc>
 23fae10:      	orr	w1, w4, w0
 23fae14:      	tst	w1, #0xe0
 23fae18:      	b.ne	0x23fae74 <_ZNSt8functionIFvvEEC2ERKS1_+0x85a54>
 23fae1c:      	add	w4, w4, #0x80
 23fae20:      	add	w0, w0, #0x80
 23fae24:      	fmov	s0, w4
 23fae28:      	str	d8, [sp, #0x60]
 23fae2c:      	asr	w22, w0, #8
 23fae30:      	sshr	v8.2s, v0.2s, #0x8
 23fae34:      	cbz	x6, 0x23fafdc <_ZNSt8functionIFvvEEC2ERKS1_+0x85bbc>
 23fae38:      	ldr	x0, [x6]
 23fae3c:      	fmov	w4, s8
 23fae40:      	mov	w5, w22
 23fae44:      	mov	w3, w21
 23fae48:      	mov	x2, x20
 23fae4c:      	mov	x1, x19
 23fae50:      	ldr	x7, [x0, #0x90]
 23fae54:      	mov	x0, x6
 23fae58:      	mov	w6, #0x1                // =1
 23fae5c:      	blr	x7
 23fae60:      	ldr	d8, [sp, #0x60]
 23fae64:      	ldp	x19, x20, [sp, #0x10]
 23fae68:      	ldp	x21, x22, [sp, #0x20]
 23fae6c:      	ldp	x29, x30, [sp], #0xf0
 23fae70:      	ret
 23fae74:      	fmul	s0, s0, s4
 23fae78:      	fnmsub	s0, s2, s5, s0
 23fae7c:      	fcmp	s0, #0.0
 23fae80:      	b.eq	0x23fae64 <_ZNSt8functionIFvvEEC2ERKS1_+0x85a44>
 23fae84:      	cbz	x6, 0x23faed8 <_ZNSt8functionIFvvEEC2ERKS1_+0x85ab8>
 23fae88:      	ldr	x4, [x6]
 23fae8c:      	mov	w3, w21
 23fae90:      	ldr	w5, [x19, #0x60]
 23fae94:      	mov	x2, x20
 23fae98:      	mov	x0, x6
 23fae9c:      	mov	x1, x19
 23faea0:      	ldr	x7, [x4, #0x88]
 23faea4:      	mov	w6, #0x1                // =1
 23faea8:      	add	x4, sp, #0xa8
 23faeac:      	blr	x7
 23faeb0:      	ldp	x19, x20, [sp, #0x10]
 23faeb4:      	ldp	x21, x22, [sp, #0x20]
 23faeb8:      	ldp	x29, x30, [sp], #0xf0
 23faebc:      	ret
 23faec0:      	mov	x0, x2
 23faec4:      	add	x8, sp, #0xa8
 23faec8:      	bl	0x23a8b20 <_ZNSt8functionIFvvEEC2ERKS1_+0x33700>
 23faecc:      	ldp	s2, s4, [sp, #0xa8]
 23faed0:      	ldp	s0, s5, [sp, #0xb4]
 23faed4:      	b	0x23fadb4 <_ZNSt8functionIFvvEEC2ERKS1_+0x85994>
 23faed8:      	ldr	x0, [x20]
 23faedc:      	mov	w1, #0x1                // =1
 23faee0:      	str	xzr, [sp, #0xc0]
 23faee4:      	str	wzr, [sp, #0xc8]
 23faee8:      	str	wzr, [sp, #0xd0]
 23faeec:      	stp	xzr, xzr, [sp, #0xd8]
 23faef0:      	strb	w1, [sp, #0xe8]
 23faef4:      	cbz	x0, 0x23fb054 <_ZNSt8functionIFvvEEC2ERKS1_+0x85c34>
 23faef8:      	ldp	s2, s3, [x0, #0x10]
 23faefc:      	scvtf	s2, s2
 23faf00:      	scvtf	s3, s3
 23faf04:      	movi	v1.2s, #0x0
 23faf08:      	add	x0, sp, #0xc0
 23faf0c:      	fmov	s0, s1
 23faf10:      	bl	0x23ac800 <_ZNSt8functionIFvvEEC2ERKS1_+0x373e0>
 23faf14:      	ldr	x1, [x19]
 23faf18:      	add	x8, sp, #0x98
 23faf1c:      	mov	x0, x1
 23faf20:      	ldr	x1, [x1]
 23faf24:      	ldr	x1, [x1, #0x10]
 23faf28:      	blr	x1
 23faf2c:      	ldr	x3, [sp, #0x98]
 23faf30:      	add	x1, sp, #0xc0
 23faf34:      	add	x2, sp, #0xa8
 23faf38:      	add	x8, sp, #0x80
 23faf3c:      	mov	x0, x3
 23faf40:      	ldr	x3, [x3]
 23faf44:      	ldr	x3, [x3, #0x38]
 23faf48:      	blr	x3
 23faf4c:      	ldr	x0, [sp, #0x98]
 23faf50:      	cbz	x0, 0x23faf64 <_ZNSt8functionIFvvEEC2ERKS1_+0x85b44>
 23faf54:      	ldr	w1, [x0, #0x8]
 23faf58:      	sub	w1, w1, #0x1
 23faf5c:      	str	w1, [x0, #0x8]
 23faf60:      	cbz	w1, 0x23fafcc <_ZNSt8functionIFvvEEC2ERKS1_+0x85bac>
 23faf64:      	ldr	x0, [sp, #0x80]
 23faf68:      	cbz	x0, 0x23fafb4 <_ZNSt8functionIFvvEEC2ERKS1_+0x85b94>
 23faf6c:      	ldr	x1, [x0]
 23faf70:      	add	x4, sp, #0xa8
 23faf74:      	ldr	w5, [x19, #0x60]
 23faf78:      	mov	w3, w21
 23faf7c:      	mov	x2, x20
 23faf80:      	mov	w6, #0x0                // =0
 23faf84:      	ldr	x7, [x1, #0x88]
 23faf88:      	mov	x1, x19
 23faf8c:      	blr	x7
 23faf90:      	ldr	x0, [sp, #0x80]
 23faf94:      	cbz	x0, 0x23fafb4 <_ZNSt8functionIFvvEEC2ERKS1_+0x85b94>
 23faf98:      	ldr	w1, [x0, #0x8]
 23faf9c:      	sub	w1, w1, #0x1
 23fafa0:      	str	w1, [x0, #0x8]
 23fafa4:      	cbnz	w1, 0x23fafb4 <_ZNSt8functionIFvvEEC2ERKS1_+0x85b94>
 23fafa8:      	ldr	x1, [x0]
 23fafac:      	ldr	x1, [x1, #0x8]
 23fafb0:      	blr	x1
 23fafb4:      	ldr	x0, [sp, #0xc0]
 23fafb8:      	bl	0x424af0 <free@plt>
 23fafbc:      	ldp	x19, x20, [sp, #0x10]
 23fafc0:      	ldp	x21, x22, [sp, #0x20]
 23fafc4:      	ldp	x29, x30, [sp], #0xf0
 23fafc8:      	ret
 23fafcc:      	ldr	x1, [x0]
 23fafd0:      	ldr	x1, [x1, #0x8]
 23fafd4:      	blr	x1
 23fafd8:      	b	0x23faf64 <_ZNSt8functionIFvvEEC2ERKS1_+0x85b44>
 23fafdc:      	ldr	x0, [x20]
 23fafe0:      	stp	x23, x24, [sp, #0x30]
 23fafe4:      	stp	x25, x26, [sp, #0x40]
 23fafe8:      	cbz	x0, 0x23fb160 <_ZNSt8functionIFvvEEC2ERKS1_+0x85d40>
 23fafec:      	ldp	w2, w1, [x0, #0x10]
 23faff0:      	dup	v0.4s, v8.s[0]
 23faff4:      	ldr	x0, [x19, #0x68]
 23faff8:      	mov	v0.s[1], w22
 23faffc:      	mov	v0.s[2], w2
 23fb000:      	mov	v0.s[3], w1
 23fb004:      	str	q0, [sp, #0x80]
 23fb008:      	cbz	x0, 0x23fb158 <_ZNSt8functionIFvvEEC2ERKS1_+0x85d38>
 23fb00c:      	ldr	d0, [x0, #0x10]
 23fb010:      	str	xzr, [sp, #0x98]
 23fb014:      	str	d0, [sp, #0xa0]
 23fb018:      	add	x1, sp, #0x98
 23fb01c:      	add	x8, sp, #0xc0
 23fb020:      	add	x0, sp, #0x80
 23fb024:      	bl	0x23f6c40 <_ZNSt8functionIFvvEEC2ERKS1_+0x81820>
 23fb028:      	ldp	w25, w24, [sp, #0xc8]
 23fb02c:      	stp	w25, w24, [sp, #0x88]
