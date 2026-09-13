
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000204b438 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84b5b0>:
 204b438:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 204b43c:	910003fd 	mov	x29, sp
 204b440:	f9000bf3 	str	x19, [sp,#16]
 204b444:	aa0003f3 	mov	x19, x0
 204b448:	978f6df6 	bl	426c20 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
 204b44c:	d2869b62 	mov	x2, #0x34db                	// #13531
 204b450:	f9401a61 	ldr	x1, [x19,#48]
 204b454:	f2baf6c2 	movk	x2, #0xd7b6, lsl #16
 204b458:	f2dbd042 	movk	x2, #0xde82, lsl #32
 204b45c:	cb010000 	sub	x0, x0, x1
 204b460:	f2e86362 	movk	x2, #0x431b, lsl #48
 204b464:	f9400263 	ldr	x3, [x19]
 204b468:	9b427c02 	smulh	x2, x0, x2
 204b46c:	8b43fc64 	add	x4, x3, x3, lsr #63
 204b470:	9352fc42 	asr	x2, x2, #18
 204b474:	cb80fc40 	sub	x0, x2, x0, asr #63
 204b478:	9ac30c01 	sdiv	x1, x0, x3
 204b47c:	9b038020 	msub	x0, x1, x3, x0
 204b480:	eb84041f 	cmp	x0, x4, asr #1
 204b484:	540000cc 	b.gt	204b49c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84b614>
 204b488:	f9401260 	ldr	x0, [x19,#32]
 204b48c:	f9400bf3 	ldr	x19, [sp,#16]
 204b490:	b9400000 	ldr	w0, [x0]
 204b494:	a8c27bfd 	ldp	x29, x30, [sp],#32
 204b498:	d65f03c0 	ret
 204b49c:	f9401660 	ldr	x0, [x19,#40]
 204b4a0:	f9400bf3 	ldr	x19, [sp,#16]
 204b4a4:	b9400000 	ldr	w0, [x0]
 204b4a8:	a8c27bfd 	ldp	x29, x30, [sp],#32
 204b4ac:	d65f03c0 	ret
 204b4b0:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 204b4b4:	910003fd 	mov	x29, sp
 204b4b8:	f9000bf3 	str	x19, [sp,#16]
 204b4bc:	aa0003f3 	mov	x19, x0
 204b4c0:	978f6dd8 	bl	426c20 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
 204b4c4:	d2869b62 	mov	x2, #0x34db                	// #13531
 204b4c8:	f9401a61 	ldr	x1, [x19,#48]
 204b4cc:	f2baf6c2 	movk	x2, #0xd7b6, lsl #16
 204b4d0:	f2dbd042 	movk	x2, #0xde82, lsl #32
 204b4d4:	cb010000 	sub	x0, x0, x1
 204b4d8:	f2e86362 	movk	x2, #0x431b, lsl #48
 204b4dc:	f9400263 	ldr	x3, [x19]
 204b4e0:	9b427c02 	smulh	x2, x0, x2
 204b4e4:	8b43fc64 	add	x4, x3, x3, lsr #63
 204b4e8:	9352fc42 	asr	x2, x2, #18
 204b4ec:	cb80fc40 	sub	x0, x2, x0, asr #63
 204b4f0:	9ac30c01 	sdiv	x1, x0, x3
 204b4f4:	9b038020 	msub	x0, x1, x3, x0
 204b4f8:	eb84041f 	cmp	x0, x4, asr #1
 204b4fc:	5400012c 	b.gt	204b520 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84b698>
 204b500:	f9401260 	ldr	x0, [x19,#32]
 204b504:	b9401661 	ldr	w1, [x19,#20]
 204b508:	f9400bf3 	ldr	x19, [sp,#16]
 204b50c:	b9400000 	ldr	w0, [x0]
 204b510:	a8c27bfd 	ldp	x29, x30, [sp],#32
 204b514:	6b00003f 	cmp	w1, w0
 204b518:	1a9f17e0 	cset	w0, eq
 204b51c:	d65f03c0 	ret
 204b520:	f9401660 	ldr	x0, [x19,#40]
 204b524:	b9401661 	ldr	w1, [x19,#20]
 204b528:	f9400bf3 	ldr	x19, [sp,#16]
 204b52c:	b9400000 	ldr	w0, [x0]
 204b530:	a8c27bfd 	ldp	x29, x30, [sp],#32
 204b534:	6b00003f 	cmp	w1, w0
 204b538:	1a9f17e0 	cset	w0, eq
 204b53c:	d65f03c0 	ret
 204b540:	b9400021 	ldr	w1, [x1]
 204b544:	b9001401 	str	w1, [x0,#20]
 204b548:	d65f03c0 	ret
 204b54c:	d503201f 	nop
