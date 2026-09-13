
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1e00c70:      	stp	x29, x30, [sp, #-0x60]!
 1e00c74:      	mov	x29, sp
 1e00c78:      	str	d8, [sp, #0x48]
 1e00c7c:      	fmov	s8, s0
 1e00c80:      	stp	x19, x20, [sp, #0x10]
 1e00c84:      	mov	x19, x3
 1e00c88:      	mov	w20, w2
 1e00c8c:      	stp	x21, x22, [sp, #0x20]
 1e00c90:      	mov	x21, x0
 1e00c94:      	add	x0, sp, #0x58
 1e00c98:      	stp	x23, x24, [sp, #0x30]
 1e00c9c:      	mov	x23, x1
 1e00ca0:      	bl	0x23a5000 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbe0>
 1e00ca4:      	ldr	w0, [x19]
 1e00ca8:      	cmp	w0, #0x1
 1e00cac:      	b.eq	0x1e00dc0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600f38>
 1e00cb0:      	cmp	w0, #0x2
 1e00cb4:      	b.ne	0x1e00cc4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600e3c>
 1e00cb8:      	add	x1, x21, #0x4
 1e00cbc:      	add	x0, sp, #0x58
 1e00cc0:      	bl	0x23a5020 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc00>
 1e00cc4:      	ldr	x1, [x19, #0x38]
 1e00cc8:      	mov	w2, #0x999a             // =39322
 1e00ccc:      	ldr	x0, [x19, #0x60]
 1e00cd0:      	scvtf	s2, x1
 1e00cd4:      	movk	w2, #0x3e19, lsl #16
 1e00cd8:      	fmov	s3, w2
 1e00cdc:      	scvtf	s1, x0
 1e00ce0:      	ldp	x19, x0, [x23]
 1e00ce4:      	fmul	s2, s2, s3
 1e00ce8:      	fmul	s1, s1, s3
 1e00cec:      	fmul	s2, s2, s8
 1e00cf0:      	cmp	x19, x0
 1e00cf4:      	fmul	s1, s1, s8
 1e00cf8:      	fcvtzs	w22, s2
 1e00cfc:      	fcvtzs	w21, s1
 1e00d00:      	b.eq	0x1e00d84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600efc>
 1e00d04:      	adrp	x24, 0x3ba1000 <stdout+0x5ff40>
 1e00d08:      	add	x24, x24, #0xe90
 1e00d0c:      	str	x25, [sp, #0x40]
 1e00d10:      	adrp	x25, 0x3ba1000 <stdout+0x5ff40>
 1e00d14:      	add	x25, x25, #0xe98
 1e00d18:      	b	0x1e00d50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600ec8>
 1e00d1c:      	ldrb	w0, [sp, #0x58]
 1e00d20:      	add	x19, x19, #0x4
 1e00d24:      	sturb	w0, [x19, #-0x4]
 1e00d28:      	add	w20, w20, #0x1
 1e00d2c:      	ldrb	w0, [sp, #0x59]
 1e00d30:      	sturb	w0, [x19, #-0x3]
 1e00d34:      	ldrb	w0, [sp, #0x5a]
 1e00d38:      	sturb	w0, [x19, #-0x2]
 1e00d3c:      	ldrb	w0, [sp, #0x5b]
 1e00d40:      	sturb	w0, [x19, #-0x1]
 1e00d44:      	ldr	x0, [x23, #0x8]
 1e00d48:      	cmp	x0, x19
 1e00d4c:      	b.eq	0x1e00d80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600ef8>
 1e00d50:      	cmp	w22, w20
 1e00d54:      	ccmp	w21, w20, #0x1, le
 1e00d58:      	b.ge	0x1e00d1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600e94>
 1e00d5c:      	ldarb	w0, [x24]
 1e00d60:      	tbz	w0, #0x0, 0x1e00da4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600f1c>
 1e00d64:      	ldr	w0, [x25]
 1e00d68:      	add	x19, x19, #0x4
 1e00d6c:      	stur	w0, [x19, #-0x4]
 1e00d70:      	add	w20, w20, #0x1
 1e00d74:      	ldr	x0, [x23, #0x8]
 1e00d78:      	cmp	x0, x19
 1e00d7c:      	b.ne	0x1e00d50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600ec8>
 1e00d80:      	ldr	x25, [sp, #0x40]
 1e00d84:      	add	x0, sp, #0x58
 1e00d88:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e00d8c:      	ldp	x19, x20, [sp, #0x10]
 1e00d90:      	ldp	x21, x22, [sp, #0x20]
 1e00d94:      	ldp	x23, x24, [sp, #0x30]
 1e00d98:      	ldr	d8, [sp, #0x48]
 1e00d9c:      	ldp	x29, x30, [sp], #0x60
 1e00da0:      	ret
 1e00da4:      	mov	x0, x24
 1e00da8:      	bl	0x426260 <__cxa_guard_acquire@plt>
 1e00dac:      	cbz	w0, 0x1e00d64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600edc>
 1e00db0:      	mov	x0, x24
 1e00db4:      	str	wzr, [x25]
 1e00db8:      	bl	0x426840 <__cxa_guard_release@plt>
 1e00dbc:      	b	0x1e00d64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600edc>
 1e00dc0:      	mov	x1, x21
 1e00dc4:      	add	x0, sp, #0x58
 1e00dc8:      	bl	0x23a5020 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc00>
 1e00dcc:      	b	0x1e00cc4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600e3c>
 1e00dd0:      	stp	x29, x30, [sp, #-0x160]!
 1e00dd4:      	mov	x0, x3
 1e00dd8:      	mov	x29, sp
 1e00ddc:      	stp	x21, x22, [sp, #0x20]
 1e00de0:      	mov	x21, x2
 1e00de4:      	mov	x22, x3
 1e00de8:      	str	x1, [sp, #0xd0]
 1e00dec:      	ldr	w1, [x4, #0x8]
 1e00df0:      	ldr	x2, [x3]
 1e00df4:      	stp	x19, x20, [sp, #0x10]
 1e00df8:      	ldrb	w3, [sp, #0x160]
 1e00dfc:      	add	w1, w1, w1, lsr #31
 1e00e00:      	str	w3, [sp, #0xe8]
 1e00e04:      	ldrb	w3, [sp, #0x168]
 1e00e08:      	mov	x20, x4
 1e00e0c:      	ldr	x2, [x2, #0x18]
 1e00e10:      	asr	w1, w1, #1
 1e00e14:      	stp	x23, x24, [sp, #0x30]
 1e00e18:      	mov	x23, x5
 1e00e1c:      	ldr	w19, [x4, #0x4]
 1e00e20:      	stp	x25, x26, [sp, #0x40]
 1e00e24:      	stp	x27, x28, [sp, #0x50]
 1e00e28:      	str	w1, [sp, #0x90]
 1e00e2c:      	str	w6, [sp, #0x9c]
 1e00e30:      	str	w3, [sp, #0xec]
 1e00e34:      	str	x7, [sp, #0xf8]
 1e00e38:      	stp	d8, d9, [sp, #0x60]
 1e00e3c:      	stp	d10, d11, [sp, #0x70]
 1e00e40:      	blr	x2
 1e00e44:      	mov	x1, #0xc00000000000     // =211106232532992
 1e00e48:      	ldr	x3, [x23]
 1e00e4c:      	movk	x1, #0x4062, lsl #48
 1e00e50:      	ldr	s11, [x20, #0xc]
 1e00e54:      	fmov	d2, x1
 1e00e58:      	adrp	x1, 0x260f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4c1a8>
 1e00e5c:      	scvtf	d0, x3
 1e00e60:      	fcvt	d11, s11
 1e00e64:      	ldr	d3, [x1, #0xbd8]
 1e00e68:      	mov	x1, #0x400000000000     // =70368744177664
 1e00e6c:      	fmul	d0, d0, d2
 1e00e70:      	movk	x1, #0x408f, lsl #48
 1e00e74:      	fmov	d1, x1
 1e00e78:      	fcmpe	d11, d3
 1e00e7c:      	fdiv	d0, d0, d1
 1e00e80:      	b.le	0x1e01884 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6019fc>
 1e00e84:      	fmul	d0, d11, d0
 1e00e88:      	fmov	d10, #1.00000000
 1e00e8c:      	fdiv	d10, d10, d11
 1e00e90:      	fcvtzs	w1, d0
 1e00e94:      	tbnz	x3, #0x3f, 0x1e0189c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601a14>
 1e00e98:      	scvtf	d8, w1
 1e00e9c:      	adrp	x1, 0x27a0000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x1dd1a8>
 1e00ea0:      	ldr	d1, [x1, #0x278]
 1e00ea4:      	fsub	d0, d0, d8
 1e00ea8:      	fcmpe	d0, d1
 1e00eac:      	str	d0, [sp, #0x130]
 1e00eb0:      	b.pl	0x1e018e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601a60>
 1e00eb4:      	fdiv	d8, d8, d11
 1e00eb8:      	mov	x1, #0x8000             // =32768
 1e00ebc:      	ldr	x21, [x21]
 1e00ec0:      	add	x2, sp, #0x138
 1e00ec4:      	str	x2, [sp, #0xa8]
 1e00ec8:      	add	x2, sp, #0x130
 1e00ecc:      	str	x2, [sp, #0x88]
 1e00ed0:      	str	x1, [sp, #0x138]
 1e00ed4:      	scvtf	d9, w19
 1e00ed8:      	sub	w20, w0, #0x1
 1e00edc:      	ldr	x2, [x22]
 1e00ee0:      	str	w20, [sp, #0x94]
 1e00ee4:      	mov	w1, #-0x80000000        // =-2147483648
 1e00ee8:      	mov	x0, x22
 1e00eec:      	fdiv	d9, d9, d11
 1e00ef0:      	ldr	x2, [x2, #0x28]
 1e00ef4:      	fsub	d9, d8, d9
 1e00ef8:      	blr	x2
 1e00efc:      	cmp	w0, #0x1
 1e00f00:      	fcvtzs	w24, d9
 1e00f04:      	b.le	0x1e01b60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601cd8>
 1e00f08:      	ldr	x3, [x22]
 1e00f0c:      	add	x8, sp, #0x100
 1e00f10:      	mov	w2, #0x2                // =2
 1e00f14:      	mov	w1, w24
 1e00f18:      	mov	x0, x22
 1e00f1c:      	ldr	x3, [x3, #0x30]
 1e00f20:      	blr	x3
 1e00f24:      	ldrb	w23, [sp, #0x100]
 1e00f28:      	ldp	w25, w4, [sp, #0x90]
 1e00f2c:      	add	x8, sp, #0x108
 1e00f30:      	ldr	x3, [x22]
 1e00f34:      	mov	w2, #0x1                // =1
 1e00f38:      	mul	w23, w23, w25
 1e00f3c:      	ldrb	w27, [sp, #0x103]
 1e00f40:      	ldrb	w28, [sp, #0x102]
 1e00f44:      	mov	w1, w24
 1e00f48:      	ldrb	w19, [sp, #0x101]
 1e00f4c:      	mov	x0, x22
 1e00f50:      	strb	w19, [sp, #0x140]
 1e00f54:      	sdiv	w23, w23, w4
 1e00f58:      	strb	w28, [sp, #0x141]
 1e00f5c:      	strb	w27, [sp, #0x142]
 1e00f60:      	and	w23, w23, #0xff
 1e00f64:      	strb	w23, [sp, #0x143]
 1e00f68:      	ldr	x3, [x3, #0x30]
 1e00f6c:      	blr	x3
 1e00f70:      	ldrb	w2, [sp, #0x108]
 1e00f74:      	add	x20, sp, #0x109
 1e00f78:      	mov	x1, x20
 1e00f7c:      	add	x0, sp, #0x101
 1e00f80:      	strb	w2, [sp, #0x100]
 1e00f84:      	bl	0x23a5020 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc00>
 1e00f88:      	mov	x0, x20
 1e00f8c:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e00f90:      	ldrb	w20, [sp, #0x100]
 1e00f94:      	mov	w1, w24
 1e00f98:      	ldr	w4, [sp, #0x94]
 1e00f9c:      	add	x8, sp, #0x110
 1e00fa0:      	ldr	x3, [x22]
 1e00fa4:      	str	w25, [sp, #0x90]
 1e00fa8:      	mul	w20, w20, w25
 1e00fac:      	ldrb	w24, [sp, #0x103]
 1e00fb0:      	ldrb	w26, [sp, #0x101]
 1e00fb4:      	mov	w2, #0x0                // =0
 1e00fb8:      	ldrb	w25, [sp, #0x102]
 1e00fbc:      	mov	x0, x22
 1e00fc0:      	strb	w26, [sp, #0x144]
 1e00fc4:      	sdiv	w20, w20, w4
 1e00fc8:      	strb	w25, [sp, #0x145]
 1e00fcc:      	strb	w24, [sp, #0x146]
 1e00fd0:      	and	w20, w20, #0xff
 1e00fd4:      	strb	w20, [sp, #0x147]
 1e00fd8:      	ldr	x3, [x3, #0x30]
 1e00fdc:      	blr	x3
 1e00fe0:      	ldrb	w3, [sp, #0x110]
 1e00fe4:      	add	x2, sp, #0x111
 1e00fe8:      	mov	x1, x2
 1e00fec:      	add	x0, sp, #0x101
 1e00ff0:      	str	x2, [sp, #0x80]
 1e00ff4:      	strb	w3, [sp, #0x100]
 1e00ff8:      	bl	0x23a5020 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc00>
 1e00ffc:      	ldr	x2, [sp, #0x80]
 1e01000:      	mov	x0, x2
 1e01004:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e01008:      	ldp	w0, w4, [sp, #0x90]
 1e0100c:      	ldrb	w1, [sp, #0x100]
 1e01010:      	ldrb	w6, [sp, #0x103]
 1e01014:      	ldrb	w7, [sp, #0x102]
 1e01018:      	ldrb	w8, [sp, #0x101]
 1e0101c:      	mul	w1, w1, w0
 1e01020:      	strb	w8, [sp, #0x148]
 1e01024:      	strb	w7, [sp, #0x149]
 1e01028:      	strb	w6, [sp, #0x14a]
 1e0102c:      	sdiv	w1, w1, w4
 1e01030:      	ands	w1, w1, #0xff
 1e01034:      	b.eq	0x1e02190 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602308>
 1e01038:      	strb	w1, [sp, #0x14b]
 1e0103c:      	mov	x2, x21
 1e01040:      	ldr	w5, [sp, #0x9c]
 1e01044:      	ldrb	w3, [x21, #0x2]
 1e01048:      	fadd	d9, d9, d10
 1e0104c:      	ldrb	w4, [x21, #0x1]
 1e01050:      	cmp	w5, #0x1
 1e01054:      	ldrb	w0, [sp, #0x90]
 1e01058:      	ldrb	w5, [x2], #0x4
 1e0105c:      	str	x2, [sp, #0x80]
 1e01060:      	str	w0, [sp, #0xc0]
 1e01064:      	strb	w5, [sp, #0x14c]
 1e01068:      	strb	w4, [sp, #0x14d]
 1e0106c:      	strb	w3, [sp, #0x14e]
 1e01070:      	strb	w0, [sp, #0x14f]
 1e01074:      	b.le	0x1e02a68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602be0>
 1e01078:      	add	x0, sp, #0x121
 1e0107c:      	str	x0, [sp, #0xb0]
 1e01080:      	add	x0, sp, #0x129
 1e01084:      	str	x0, [sp, #0xb8]
 1e01088:      	ldr	x0, [sp, #0xd0]
 1e0108c:      	add	x21, sp, #0x140
 1e01090:      	add	x23, x0, #0x1c
 1e01094:      	mov	w0, #0x1                // =1
 1e01098:      	str	w0, [sp, #0x98]
 1e0109c:      	nop
 1e010a0:      	ldr	x1, [x22]
 1e010a4:      	fcvtzs	w20, d9
 1e010a8:      	add	x8, sp, #0x118
 1e010ac:      	mov	w2, #0x2                // =2
 1e010b0:      	mov	x0, x22
 1e010b4:      	ldr	x3, [x1, #0x30]
 1e010b8:      	mov	w1, w20
 1e010bc:      	blr	x3
 1e010c0:      	ldrb	w2, [sp, #0x118]
 1e010c4:      	add	x19, sp, #0x119
 1e010c8:      	mov	x1, x19
 1e010cc:      	add	x0, sp, #0x101
 1e010d0:      	strb	w2, [sp, #0x100]
 1e010d4:      	bl	0x23a5020 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc00>
 1e010d8:      	mov	x0, x19
 1e010dc:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e010e0:      	ldp	w24, w25, [sp, #0x90]
 1e010e4:      	add	x1, sp, #0x200
 1e010e8:      	ldrb	w19, [sp, #0x100]
 1e010ec:      	add	x8, sp, #0x120
 1e010f0:      	ldr	x3, [x22]
 1e010f4:      	mov	w2, #0x1                // =1
 1e010f8:      	ldrb	w0, [sp, #0x103]
 1e010fc:      	mul	w19, w19, w24
 1e01100:      	ldurh	w1, [x1, #-0xff]
 1e01104:      	strh	w1, [sp, #0x150]
 1e01108:      	mov	w1, w20
 1e0110c:      	strb	w0, [sp, #0x152]
 1e01110:      	mov	x0, x22
 1e01114:      	sdiv	w19, w19, w25
 1e01118:      	and	w19, w19, #0xff
 1e0111c:      	strb	w19, [sp, #0x153]
 1e01120:      	ldr	x3, [x3, #0x30]
 1e01124:      	blr	x3
 1e01128:      	ldr	x26, [sp, #0xb0]
 1e0112c:      	add	x0, sp, #0x101
 1e01130:      	ldrb	w2, [sp, #0x120]
 1e01134:      	mov	x1, x26
 1e01138:      	strb	w2, [sp, #0x100]
 1e0113c:      	bl	0x23a5020 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc00>
 1e01140:      	mov	x0, x26
 1e01144:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e01148:      	ldrb	w3, [sp, #0x100]
 1e0114c:      	add	x2, sp, #0x200
 1e01150:      	ldr	x4, [x22]
 1e01154:      	mov	w1, w20
 1e01158:      	ldrb	w0, [sp, #0x103]
 1e0115c:      	add	x8, sp, #0x128
 1e01160:      	mul	w3, w3, w24
 1e01164:      	ldurh	w2, [x2, #-0xff]
 1e01168:      	strh	w2, [sp, #0x154]
 1e0116c:      	strb	w0, [sp, #0x156]
 1e01170:      	mov	w2, #0x0                // =0
 1e01174:      	mov	x0, x22
 1e01178:      	sdiv	w3, w3, w25
 1e0117c:      	strb	w3, [sp, #0x157]
