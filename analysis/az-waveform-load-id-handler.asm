
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000019d8e90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d9008>:
 19d8e90:	f9421c01 	ldr	x1, [x0,#1080]
 19d8e94:	a9025bf5 	stp	x21, x22, [sp,#32]
 19d8e98:	aa0003f5 	mov	x21, x0
 19d8e9c:	2a0203f6 	mov	w22, w2
 19d8ea0:	39430020 	ldrb	w0, [x1,#192]
 19d8ea4:	370800a0 	tbnz	w0, #1, 19d8eb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d9030>
 19d8ea8:	f941eaa0 	ldr	x0, [x21,#976]
 19d8eac:	39430014 	ldrb	w20, [x0,#192]
 19d8eb0:	d3410694 	ubfx	x20, x20, #1, #1
 19d8eb4:	35000754 	cbnz	w20, 19d8f9c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d9114>
 19d8eb8:	d2958aa0 	mov	x0, #0xac55                	// #44117
 19d8ebc:	f2aa4120 	movk	x0, #0x5209, lsl #16
 19d8ec0:	f2d83ea0 	movk	x0, #0xc1f5, lsl #32
 19d8ec4:	f2e013e0 	movk	x0, #0x9f, lsl #48
 19d8ec8:	eb00027f 	cmp	x19, x0
 19d8ecc:	54000aa0 	b.eq	19d9020 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d9198>
 19d8ed0:	d2927060 	mov	x0, #0x9383                	// #37763
 19d8ed4:	f2a18800 	movk	x0, #0xc40, lsl #16
 19d8ed8:	f2c72860 	movk	x0, #0x3943, lsl #32
 19d8edc:	f2e005e0 	movk	x0, #0x2f, lsl #48
 19d8ee0:	eb00027f 	cmp	x19, x0
 19d8ee4:	54000880 	b.eq	19d8ff4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d916c>
 19d8ee8:	d2855d40 	mov	x0, #0x2aea                	// #10986
 19d8eec:	f2ad65e0 	movk	x0, #0x6b2f, lsl #16
 19d8ef0:	f2d790e0 	movk	x0, #0xbc87, lsl #32
 19d8ef4:	f2e00740 	movk	x0, #0x3a, lsl #48
 19d8ef8:	eb00027f 	cmp	x19, x0
 19d8efc:	54001000 	b.eq	19d90fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d9274>
 19d8f00:	d28fb120 	mov	x0, #0x7d89                	// #32137
 19d8f04:	f2a29780 	movk	x0, #0x14bc, lsl #16
 19d8f08:	f2c83040 	movk	x0, #0x4182, lsl #32
 19d8f0c:	f2e002a0 	movk	x0, #0x15, lsl #48
 19d8f10:	eb00027f 	cmp	x19, x0
 19d8f14:	54001000 	b.eq	19d9114 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d928c>
 19d8f18:	d2871940 	mov	x0, #0x38ca                	// #14538
 19d8f1c:	f2bfba40 	movk	x0, #0xfdd2, lsl #16
 19d8f20:	f2c47d40 	movk	x0, #0x23ea, lsl #32
 19d8f24:	f2e039c0 	movk	x0, #0x1ce, lsl #48
 19d8f28:	eb00027f 	cmp	x19, x0
 19d8f2c:	54001000 	b.eq	19d912c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d92a4>
 19d8f30:	d2916d20 	mov	x0, #0x8b69                	// #35689
 19d8f34:	f2b4ebe0 	movk	x0, #0xa75f, lsl #16
 19d8f38:	f2d51ca0 	movk	x0, #0xa8e5, lsl #32
 19d8f3c:	f2e03500 	movk	x0, #0x1a8, lsl #48
 19d8f40:	eb00027f 	cmp	x19, x0
 19d8f44:	54001000 	b.eq	19d9144 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d92bc>
 19d8f48:	d2847aa0 	mov	x0, #0x23d5                	// #9173
 19d8f4c:	f2a959c0 	movk	x0, #0x4ace, lsl #16
 19d8f50:	f2cbc060 	movk	x0, #0x5e03, lsl #32
 19d8f54:	f2e00b80 	movk	x0, #0x5c, lsl #48
 19d8f58:	eb00027f 	cmp	x19, x0
 19d8f5c:	7a410ac0 	ccmp	w22, #0x1, #0x0, eq
 19d8f60:	54000fe0 	b.eq	19d915c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d92d4>
 19d8f64:	d503201f 	nop
 19d8f68:	f9413ea0 	ldr	x0, [x21,#632]
 19d8f6c:	d0000041 	adrp	x1, 19e2000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1e2178>
 19d8f70:	91354021 	add	x1, x1, #0xd50
 19d8f74:	52800014 	mov	w20, #0x0                   	// #0
 19d8f78:	f9400002 	ldr	x2, [x0]
 19d8f7c:	f9400843 	ldr	x3, [x2,#16]
 19d8f80:	eb01007f 	cmp	x3, x1
 19d8f84:	54000b01 	b.ne	19d90e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d925c>
 19d8f88:	2a1403e0 	mov	w0, w20
 19d8f8c:	a94153f3 	ldp	x19, x20, [sp,#16]
 19d8f90:	a9425bf5 	ldp	x21, x22, [sp,#32]
 19d8f94:	a8c37bfd 	ldp	x29, x30, [sp],#48
 19d8f98:	d65f03c0 	ret
 19d8f9c:	d2958aa2 	mov	x2, #0xac55                	// #44117
 19d8fa0:	d2860f23 	mov	x3, #0x3079                	// #12409
 19d8fa4:	f2aa4122 	movk	x2, #0x5209, lsl #16
 19d8fa8:	f2aa72a3 	movk	x3, #0x5395, lsl #16
 19d8fac:	f2d83ea2 	movk	x2, #0xc1f5, lsl #32
 19d8fb0:	f2d83ea3 	movk	x3, #0xc1f5, lsl #32
 19d8fb4:	f2e013e2 	movk	x2, #0x9f, lsl #48
 19d8fb8:	eb02027f 	cmp	x19, x2
 19d8fbc:	f2e013e3 	movk	x3, #0x9f, lsl #48
 19d8fc0:	fa431264 	ccmp	x19, x3, #0x4, ne
 19d8fc4:	54000401 	b.ne	19d9044 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d91bc>
 19d8fc8:	71000adf 	cmp	w22, #0x2
 19d8fcc:	540000a0 	b.eq	19d8fe0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d9158>
 19d8fd0:	eb02027f 	cmp	x19, x2
 19d8fd4:	54000ce1 	b.ne	19d9170 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d92e8>
 19d8fd8:	710006df 	cmp	w22, #0x1
 19d8fdc:	54fff6e1 	b.ne	19d8eb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d9030>
 19d8fe0:	f9400002 	ldr	x2, [x0]
 19d8fe4:	52800001 	mov	w1, #0x0                   	// #0
 19d8fe8:	f9403042 	ldr	x2, [x2,#96]
 19d8fec:	d63f0040 	blr	x2
 19d8ff0:	17ffffe6 	b	19d8f88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d9100>
 19d8ff4:	35fffbb6 	cbnz	w22, 19d8f68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d90e0>
 19d8ff8:	39430020 	ldrb	w0, [x1,#192]
 19d8ffc:	360ffb60 	tbz	w0, #1, 19d8f68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d90e0>
 19d9000:	f94172a0 	ldr	x0, [x21,#736]
 19d9004:	940ddcf3 	bl	1d503d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x550548>
 19d9008:	2a0003e1 	mov	w1, w0
 19d900c:	71000c1f 	cmp	w0, #0x3
 19d9010:	54fffac8 	b.hi	19d8f68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d90e0>
 19d9014:	f94206a0 	ldr	x0, [x21,#1032]
 19d9018:	940f43ec 	bl	1da9fc8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5aa140>
 19d901c:	17ffffd3 	b	19d8f68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d90e0>
 19d9020:	510006c0 	sub	w0, w22, #0x1
 19d9024:	7100041f 	cmp	w0, #0x1
 19d9028:	54fffa08 	b.hi	19d8f68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d90e0>
 19d902c:	39430034 	ldrb	w20, [x1,#192]
 19d9030:	d3410694 	ubfx	x20, x20, #1, #1
 19d9034:	34fff9b4 	cbz	w20, 19d8f68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d90e0>
 19d9038:	f94172a0 	ldr	x0, [x21,#736]
 19d903c:	940dddab 	bl	1d506e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x550860>
 19d9040:	17ffffd2 	b	19d8f88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d9100>
 19d9044:	d2927060 	mov	x0, #0x9383                	// #37763
 19d9048:	f2a18800 	movk	x0, #0xc40, lsl #16
 19d904c:	f2c72860 	movk	x0, #0x3943, lsl #32
 19d9050:	f2e005e0 	movk	x0, #0x2f, lsl #48
 19d9054:	eb00027f 	cmp	x19, x0
 19d9058:	540000e0 	b.eq	19d9074 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d91ec>
 19d905c:	d2847aa0 	mov	x0, #0x23d5                	// #9173
 19d9060:	f2a959c0 	movk	x0, #0x4ace, lsl #16
 19d9064:	f2cbc060 	movk	x0, #0x5e03, lsl #32
 19d9068:	f2e00b80 	movk	x0, #0x5c, lsl #48
 19d906c:	eb00027f 	cmp	x19, x0
 19d9070:	54000081 	b.ne	19d9080 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d91f8>
 19d9074:	71000adf 	cmp	w22, #0x2
 19d9078:	54fff880 	b.eq	19d8f88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d9100>
 19d907c:	17ffff8f 	b	19d8eb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d9030>
 19d9080:	d2871940 	mov	x0, #0x38ca                	// #14538
 19d9084:	d28fb122 	mov	x2, #0x7d89                	// #32137
 19d9088:	f2bfba40 	movk	x0, #0xfdd2, lsl #16
 19d908c:	f2a29782 	movk	x2, #0x14bc, lsl #16
 19d9090:	f2c47d40 	movk	x0, #0x23ea, lsl #32
 19d9094:	f2c83042 	movk	x2, #0x4182, lsl #32
 19d9098:	f2e039c0 	movk	x0, #0x1ce, lsl #48
 19d909c:	eb00027f 	cmp	x19, x0
 19d90a0:	d2916d20 	mov	x0, #0x8b69                	// #35689
 19d90a4:	f2e002a2 	movk	x2, #0x15, lsl #48
 19d90a8:	f2b4ebe0 	movk	x0, #0xa75f, lsl #16
 19d90ac:	f2d51ca0 	movk	x0, #0xa8e5, lsl #32
 19d90b0:	f2e03500 	movk	x0, #0x1a8, lsl #48
 19d90b4:	fa401264 	ccmp	x19, x0, #0x4, ne
 19d90b8:	1a9f17e0 	cset	w0, eq
 19d90bc:	eb02027f 	cmp	x19, x2
 19d90c0:	d2855d42 	mov	x2, #0x2aea                	// #10986
 19d90c4:	f2ad65e2 	movk	x2, #0x6b2f, lsl #16
 19d90c8:	f2d790e2 	movk	x2, #0xbc87, lsl #32
 19d90cc:	f2e00742 	movk	x2, #0x3a, lsl #48
 19d90d0:	fa421264 	ccmp	x19, x2, #0x4, ne
 19d90d4:	1a9f1400 	csinc	w0, w0, wzr, ne
 19d90d8:	34ffef00 	cbz	w0, 19d8eb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d9030>
 19d90dc:	34fff576 	cbz	w22, 19d8f88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d9100>
 19d90e0:	17ffff76 	b	19d8eb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d9030>
 19d90e4:	2a1603e2 	mov	w2, w22
 19d90e8:	aa1303e1 	mov	x1, x19
 19d90ec:	a94153f3 	ldp	x19, x20, [sp,#16]
 19d90f0:	a9425bf5 	ldp	x21, x22, [sp,#32]
 19d90f4:	a8c37bfd 	ldp	x29, x30, [sp],#48
 19d90f8:	d61f0060 	br	x3
 19d90fc:	710006df 	cmp	w22, #0x1
