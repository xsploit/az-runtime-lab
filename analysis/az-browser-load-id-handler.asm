
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000019c21d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1c2348>:
 19c21d0:	d65f03c0 	ret
 19c21d4:	d2927060 	mov	x0, #0x9383                	// #37763
 19c21d8:	f2a18800 	movk	x0, #0xc40, lsl #16
 19c21dc:	f2c72860 	movk	x0, #0x3943, lsl #32
 19c21e0:	f2e005e0 	movk	x0, #0x2f, lsl #48
 19c21e4:	eb00003f 	cmp	x1, x0
 19c21e8:	54fffb80 	b.eq	19c2158 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1c22d0>
 19c21ec:	d2847aa0 	mov	x0, #0x23d5                	// #9173
 19c21f0:	f2a959c0 	movk	x0, #0x4ace, lsl #16
 19c21f4:	f2cbc060 	movk	x0, #0x5e03, lsl #32
 19c21f8:	f2e00b80 	movk	x0, #0x5c, lsl #48
 19c21fc:	eb00003f 	cmp	x1, x0
 19c2200:	54fffac0 	b.eq	19c2158 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1c22d0>
 19c2204:	d503201f 	nop
 19c2208:	d2916d20 	mov	x0, #0x8b69                	// #35689
 19c220c:	d28fb123 	mov	x3, #0x7d89                	// #32137
 19c2210:	f2b4ebe0 	movk	x0, #0xa75f, lsl #16
 19c2214:	f2a29783 	movk	x3, #0x14bc, lsl #16
 19c2218:	f2d51ca0 	movk	x0, #0xa8e5, lsl #32
 19c221c:	f2c83043 	movk	x3, #0x4182, lsl #32
 19c2220:	f2e03500 	movk	x0, #0x1a8, lsl #48
 19c2224:	eb00003f 	cmp	x1, x0
 19c2228:	d2871940 	mov	x0, #0x38ca                	// #14538
 19c222c:	f2e002a3 	movk	x3, #0x15, lsl #48
 19c2230:	f2bfba40 	movk	x0, #0xfdd2, lsl #16
 19c2234:	f2c47d40 	movk	x0, #0x23ea, lsl #32
 19c2238:	f2e039c0 	movk	x0, #0x1ce, lsl #48
 19c223c:	fa401024 	ccmp	x1, x0, #0x4, ne
 19c2240:	1a9f17e0 	cset	w0, eq
 19c2244:	eb03003f 	cmp	x1, x3
 19c2248:	d2855d43 	mov	x3, #0x2aea                	// #10986
 19c224c:	f2ad65e3 	movk	x3, #0x6b2f, lsl #16
 19c2250:	f2d790e3 	movk	x3, #0xbc87, lsl #32
 19c2254:	f2e00743 	movk	x3, #0x3a, lsl #48
 19c2258:	fa431024 	ccmp	x1, x3, #0x4, ne
 19c225c:	1a9f1400 	csinc	w0, w0, wzr, ne
 19c2260:	34fff7c0 	cbz	w0, 19c2158 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1c22d0>
 19c2264:	35fff7a2 	cbnz	w2, 19c2158 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1c22d0>
 19c2268:	2a1303e0 	mov	w0, w19
 19c226c:	f9400bf3 	ldr	x19, [sp,#16]
 19c2270:	a8c27bfd 	ldp	x29, x30, [sp],#32
 19c2274:	d65f03c0 	ret
 19c2278:	f940c000 	ldr	x0, [x0,#384]
 19c227c:	39430000 	ldrb	w0, [x0,#192]
 19c2280:	d3410400 	ubfx	x0, x0, #1, #1
 19c2284:	d65f03c0 	ret
 19c2288:	f940c000 	ldr	x0, [x0,#384]
 19c228c:	39430000 	ldrb	w0, [x0,#192]
 19c2290:	d3410400 	ubfx	x0, x0, #1, #1
 19c2294:	d65f03c0 	ret
 19c2298:	d101c3ff 	sub	sp, sp, #0x70
 19c229c:	a9027bfd 	stp	x29, x30, [sp,#32]
 19c22a0:	910083fd 	add	x29, sp, #0x20
 19c22a4:	a9045bf5 	stp	x21, x22, [sp,#64]
 19c22a8:	b00110b5 	adrp	x21, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 19c22ac:	912522b5 	add	x21, x21, #0x948
 19c22b0:	a90353f3 	stp	x19, x20, [sp,#48]
 19c22b4:	aa0103f3 	mov	x19, x1
 19c22b8:	aa0003f4 	mov	x20, x0
 19c22bc:	aa1503e1 	mov	x1, x21
 19c22c0:	9101a3e0 	add	x0, sp, #0x68
 19c22c4:	94278b53 	bl	23a5010 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2fbf0>
 19c22c8:	9101a3e1 	add	x1, sp, #0x68
 19c22cc:	aa1303e0 	mov	x0, x19
 19c22d0:	9427b540 	bl	23af7d0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x3a3b0>
 19c22d4:	9101a3e0 	add	x0, sp, #0x68
 19c22d8:	94277706 	bl	239fef0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2aad0>
 19c22dc:	aa1503e1 	mov	x1, x21
 19c22e0:	9101a3e0 	add	x0, sp, #0x68
 19c22e4:	94278b4b 	bl	23a5010 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2fbf0>
 19c22e8:	9101a3e1 	add	x1, sp, #0x68
 19c22ec:	aa1303e0 	mov	x0, x19
 19c22f0:	9427b394 	bl	23af140 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x39d20>
 19c22f4:	91076296 	add	x22, x20, #0x1d8
 19c22f8:	9101a3e0 	add	x0, sp, #0x68
 19c22fc:	f9002bf7 	str	x23, [sp,#80]
