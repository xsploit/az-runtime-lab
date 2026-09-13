
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021545e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954760>:
 21545e8:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 21545ec:	910003fd 	mov	x29, sp
 21545f0:	a90153f3 	stp	x19, x20, [sp,#16]
 21545f4:	aa0103f3 	mov	x19, x1
 21545f8:	b0000001 	adrp	x1, 2155000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x955178>
 21545fc:	91026021 	add	x1, x1, #0x98
 2154600:	39400674 	ldrb	w20, [x19,#1]
 2154604:	f90013f5 	str	x21, [sp,#32]
 2154608:	aa0003f5 	mov	x21, x0
 215460c:	f9409800 	ldr	x0, [x0,#304]
 2154610:	d3441e94 	ubfx	x20, x20, #4, #4
 2154614:	f9400002 	ldr	x2, [x0]
 2154618:	f9401842 	ldr	x2, [x2,#48]
 215461c:	eb01005f 	cmp	x2, x1
 2154620:	540007e1 	b.ne	215471c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954894>
 2154624:	b940d801 	ldr	w1, [x0,#216]
 2154628:	4b21a294 	sub	w20, w20, w1, sxth
 215462c:	9100e3e1 	add	x1, sp, #0x38
 2154630:	b9003bf4 	str	w20, [sp,#56]
 2154634:	3900f3ff 	strb	wzr, [sp,#60]
 2154638:	9400145c 	bl	21597a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959920>
 215463c:	f941aab4 	ldr	x20, [x21,#848]
 2154640:	39400261 	ldrb	w1, [x19]
 2154644:	9114c294 	add	x20, x20, #0x530
 2154648:	aa1403e0 	mov	x0, x20
 215464c:	92400421 	and	x1, x1, #0x3
 2154650:	97ff73d4 	bl	21315a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931718>
 2154654:	79400a63 	ldrh	w3, [x19,#4]
 2154658:	aa1403e0 	mov	x0, x20
 215465c:	39400262 	ldrb	w2, [x19]
 2154660:	9100e3e1 	add	x1, sp, #0x38
 2154664:	b9003be3 	str	w3, [sp,#56]
 2154668:	d3461842 	ubfx	x2, x2, #6, #1
 215466c:	97ff741d 	bl	21316e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931858>
 2154670:	39400262 	ldrb	w2, [x19]
 2154674:	9100dfe6 	add	x6, sp, #0x37
 2154678:	39400668 	ldrb	w8, [x19,#1]
 215467c:	91002265 	add	x5, x19, #0x8
 2154680:	39402667 	ldrb	w7, [x19,#9]
 2154684:	721e045f 	tst	w2, #0xc
 2154688:	79400e69 	ldrh	w9, [x19,#6]
 215468c:	1a9f07ea 	cset	w10, ne
 2154690:	d3441d08 	ubfx	x8, x8, #4, #4
 2154694:	9100dbe4 	add	x4, sp, #0x36
 2154698:	d3441ce7 	ubfx	x7, x7, #4, #4
 215469c:	9100d7e3 	add	x3, sp, #0x35
 21546a0:	91000a62 	add	x2, x19, #0x2
 21546a4:	9100e3e1 	add	x1, sp, #0x38
 21546a8:	aa1403e0 	mov	x0, x20
 21546ac:	3900d7ea 	strb	w10, [sp,#53]
 21546b0:	3900dbe8 	strb	w8, [sp,#54]
 21546b4:	3900dfe7 	strb	w7, [sp,#55]
 21546b8:	790073e9 	strh	w9, [sp,#56]
 21546bc:	97ff7463 	bl	2131848 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9319c0>
 21546c0:	39400261 	ldrb	w1, [x19]
 21546c4:	aa1403e0 	mov	x0, x20
 21546c8:	d3441421 	ubfx	x1, x1, #4, #2
 21546cc:	97ff7503 	bl	2131ad8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931c50>
 21546d0:	39400261 	ldrb	w1, [x19]
 21546d4:	aa1403e0 	mov	x0, x20
 21546d8:	d3473821 	ubfx	x1, x1, #7, #8
 21546dc:	97ff74af 	bl	2131998 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931b10>
 21546e0:	39400e61 	ldrb	w1, [x19,#3]
 21546e4:	aa1403e0 	mov	x0, x20
 21546e8:	97ff7556 	bl	2131c40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931db8>
 21546ec:	39400661 	ldrb	w1, [x19,#1]
 21546f0:	aa1403e0 	mov	x0, x20
 21546f4:	92400c21 	and	x1, x1, #0xf
 21546f8:	97ff75ac 	bl	2131da8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931f20>
 21546fc:	39402661 	ldrb	w1, [x19,#9]
 2154700:	aa1403e0 	mov	x0, x20
 2154704:	92400c21 	and	x1, x1, #0xf
 2154708:	97ff7602 	bl	2131f10 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932088>
 215470c:	a94153f3 	ldp	x19, x20, [sp,#16]
 2154710:	f94013f5 	ldr	x21, [sp,#32]
 2154714:	a8c47bfd 	ldp	x29, x30, [sp],#64
 2154718:	d65f03c0 	ret
 215471c:	d63f0040 	blr	x2
 2154720:	2a0003e1 	mov	w1, w0
 2154724:	f9409aa0 	ldr	x0, [x21,#304]
 2154728:	17ffffc0 	b	2154628 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9547a0>
 215472c:	d503201f 	nop
