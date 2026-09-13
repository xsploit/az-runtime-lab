
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
 23fb030:      	ldp	w23, w26, [sp, #0xc0]
 23fb034:      	stp	w23, w26, [sp, #0x80]
 23fb038:      	cmp	w25, #0x0
 23fb03c:      	ccmp	w24, #0x0, #0x4, gt
 23fb040:      	b.gt	0x23fb060 <_ZNSt8functionIFvvEEC2ERKS1_+0x85c40>
 23fb044:      	ldp	x23, x24, [sp, #0x30]
 23fb048:      	ldp	x25, x26, [sp, #0x40]
 23fb04c:      	ldr	d8, [sp, #0x60]
 23fb050:      	b	0x23fae64 <_ZNSt8functionIFvvEEC2ERKS1_+0x85a44>
 23fb054:      	movi	v3.2s, #0x0
 23fb058:      	fmov	s2, s3
 23fb05c:      	b	0x23faf04 <_ZNSt8functionIFvvEEC2ERKS1_+0x85ae4>
 23fb060:      	stp	x27, x28, [sp, #0x50]
 23fb064:      	mov	x0, #0x38               // =56
 23fb068:      	ldr	x28, [x19]
 23fb06c:      	ldr	x1, [x28]
 23fb070:      	ldr	x3, [x1, #0x18]
 23fb074:      	str	x3, [sp, #0x78]
 23fb078:      	bl	0x424d40 <_Znwm@plt>
 23fb07c:      	str	wzr, [x0, #0x8]
 23fb080:      	dup	v0.4s, w23
 23fb084:      	adrp	x2, 0x3142000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xb7f1a8>
 23fb088:      	add	x2, x2, #0x800
 23fb08c:      	mov	x27, x0
 23fb090:      	str	x2, [x0], #0x10
 23fb094:      	add	x1, sp, #0xc0
 23fb098:      	mov	v0.s[1], w26
 23fb09c:      	mov	v0.s[2], w25
 23fb0a0:      	mov	v0.s[3], w24
 23fb0a4:      	str	q0, [sp, #0xc0]
 23fb0a8:      	bl	0x23a9450 <_ZNSt8functionIFvvEEC2ERKS1_+0x34030>
 23fb0ac:      	ldr	w1, [x27, #0x8]
 23fb0b0:      	ldr	x3, [sp, #0x78]
 23fb0b4:      	add	w1, w1, #0x1
 23fb0b8:      	str	w1, [x27, #0x8]
 23fb0bc:      	mov	x0, x28
 23fb0c0:      	str	x27, [sp, #0xc0]
 23fb0c4:      	add	x8, sp, #0x98
 23fb0c8:      	add	x1, sp, #0xc0
 23fb0cc:      	blr	x3
 23fb0d0:      	ldr	x0, [sp, #0xc0]
 23fb0d4:      	cbz	x0, 0x23fb0f4 <_ZNSt8functionIFvvEEC2ERKS1_+0x85cd4>
 23fb0d8:      	ldr	w1, [x0, #0x8]
 23fb0dc:      	sub	w1, w1, #0x1
 23fb0e0:      	str	w1, [x0, #0x8]
 23fb0e4:      	cbnz	w1, 0x23fb0f4 <_ZNSt8functionIFvvEEC2ERKS1_+0x85cd4>
 23fb0e8:      	ldr	x1, [x0]
 23fb0ec:      	ldr	x1, [x1, #0x8]
 23fb0f0:      	blr	x1
 23fb0f4:      	ldr	x0, [sp, #0x98]
 23fb0f8:      	cbz	x0, 0x23fb16c <_ZNSt8functionIFvvEEC2ERKS1_+0x85d4c>
 23fb0fc:      	ldr	x6, [x0]
 23fb100:      	fmov	w4, s8
 23fb104:      	mov	w5, w22
 23fb108:      	mov	w3, w21
 23fb10c:      	mov	x2, x20
 23fb110:      	mov	x1, x19
 23fb114:      	ldr	x7, [x6, #0x90]
 23fb118:      	mov	w6, #0x0                // =0
 23fb11c:      	blr	x7
 23fb120:      	ldr	x0, [sp, #0x98]
 23fb124:      	cbz	x0, 0x23fb16c <_ZNSt8functionIFvvEEC2ERKS1_+0x85d4c>
 23fb128:      	ldr	w1, [x0, #0x8]
 23fb12c:      	sub	w1, w1, #0x1
 23fb130:      	str	w1, [x0, #0x8]
 23fb134:      	cbnz	w1, 0x23fb16c <_ZNSt8functionIFvvEEC2ERKS1_+0x85d4c>
 23fb138:      	ldr	x1, [x0]
 23fb13c:      	ldr	x1, [x1, #0x8]
 23fb140:      	blr	x1
 23fb144:      	ldp	x23, x24, [sp, #0x30]
 23fb148:      	ldp	x25, x26, [sp, #0x40]
 23fb14c:      	ldp	x27, x28, [sp, #0x50]
 23fb150:      	ldr	d8, [sp, #0x60]
 23fb154:      	b	0x23fae64 <_ZNSt8functionIFvvEEC2ERKS1_+0x85a44>
 23fb158:      	stp	xzr, xzr, [sp, #0x98]
 23fb15c:      	b	0x23fb018 <_ZNSt8functionIFvvEEC2ERKS1_+0x85bf8>
 23fb160:      	mov	w2, #0x0                // =0
 23fb164:      	mov	w1, #0x0                // =0
 23fb168:      	b	0x23faff0 <_ZNSt8functionIFvvEEC2ERKS1_+0x85bd0>
 23fb16c:      	ldp	x23, x24, [sp, #0x30]
 23fb170:      	ldp	x25, x26, [sp, #0x40]
 23fb174:      	ldp	x27, x28, [sp, #0x50]
 23fb178:      	ldr	d8, [sp, #0x60]
 23fb17c:      	b	0x23fae64 <_ZNSt8functionIFvvEEC2ERKS1_+0x85a44>
 23fb180:      	ldr	x1, [sp, #0x98]
 23fb184:      	mov	x19, x0
 23fb188:      	cbz	x1, 0x23fb1ac <_ZNSt8functionIFvvEEC2ERKS1_+0x85d8c>
 23fb18c:      	ldr	w0, [x1, #0x8]
 23fb190:      	sub	w0, w0, #0x1
 23fb194:      	str	w0, [x1, #0x8]
 23fb198:      	cbnz	w0, 0x23fb1ac <_ZNSt8functionIFvvEEC2ERKS1_+0x85d8c>
 23fb19c:      	ldr	x2, [x1]
 23fb1a0:      	mov	x0, x1
 23fb1a4:      	ldr	x1, [x2, #0x8]
 23fb1a8:      	blr	x1
 23fb1ac:      	mov	x0, x19
 23fb1b0:      	bl	0x424d10 <_Unwind_Resume@plt>
 23fb1b4:      	ldr	x1, [sp, #0xc0]
 23fb1b8:      	mov	x19, x0
 23fb1bc:      	cbnz	x1, 0x23fb18c <_ZNSt8functionIFvvEEC2ERKS1_+0x85d6c>
 23fb1c0:      	b	0x23fb1ac <_ZNSt8functionIFvvEEC2ERKS1_+0x85d8c>
 23fb1c4:      	ldr	x1, [sp, #0x80]
 23fb1c8:      	mov	x19, x0
 23fb1cc:      	cbz	x1, 0x23fb1f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x85dd0>
 23fb1d0:      	ldr	w0, [x1, #0x8]
 23fb1d4:      	sub	w0, w0, #0x1
 23fb1d8:      	str	w0, [x1, #0x8]
 23fb1dc:      	cbnz	w0, 0x23fb1f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x85dd0>
 23fb1e0:      	ldr	x2, [x1]
 23fb1e4:      	mov	x0, x1
 23fb1e8:      	ldr	x1, [x2, #0x8]
 23fb1ec:      	blr	x1
 23fb1f0:      	ldr	x0, [sp, #0xc0]
 23fb1f4:      	stp	x23, x24, [sp, #0x30]
 23fb1f8:      	stp	x25, x26, [sp, #0x40]
 23fb1fc:      	stp	x27, x28, [sp, #0x50]
 23fb200:      	str	d8, [sp, #0x60]
 23fb204:      	bl	0x424af0 <free@plt>
 23fb208:      	b	0x23fb1ac <_ZNSt8functionIFvvEEC2ERKS1_+0x85d8c>
 23fb20c:      	ldr	x1, [sp, #0x98]
 23fb210:      	mov	x19, x0
 23fb214:      	cbnz	x1, 0x23fb1d0 <_ZNSt8functionIFvvEEC2ERKS1_+0x85db0>
 23fb218:      	b	0x23fb1f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x85dd0>
 23fb21c:      	mov	x19, x0
 23fb220:      	b	0x23fb1f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x85dd0>
		...
 23fb230:      	stp	x29, x30, [sp, #-0xa0]!
 23fb234:      	mov	x29, sp
 23fb238:      	add	x8, sp, #0x70
 23fb23c:      	stp	x19, x20, [sp, #0x10]
 23fb240:      	and	w19, w2, #0xff
 23fb244:      	mov	x20, x0
 23fb248:      	ldr	x2, [x0]
 23fb24c:      	stp	x21, x22, [sp, #0x20]
