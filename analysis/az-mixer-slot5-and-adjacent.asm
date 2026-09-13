
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021b4620 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c508>:
 21b4620:	d65f03c0 	ret
	...
 21b4630:	39418003 	ldrb	w3, [x0,#96]
 21b4634:	35000043 	cbnz	w3, 21b463c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c524>
 21b4638:	d65f03c0 	ret
 21b463c:	aa0203e1 	mov	x1, x2
 21b4640:	9106c000 	add	x0, x0, #0x1b0
 21b4644:	17ff88d7 	b	21969a0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xe888>
 21b4648:	d503201f 	nop
 21b464c:	d503201f 	nop
 21b4650:	39416003 	ldrb	w3, [x0,#88]
 21b4654:	35000043 	cbnz	w3, 21b465c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c544>
 21b4658:	d65f03c0 	ret
 21b465c:	aa0203e1 	mov	x1, x2
 21b4660:	9106a000 	add	x0, x0, #0x1a8
 21b4664:	17ff88cf 	b	21969a0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xe888>
	...
 21b4670:	a9a67bfd 	stp	x29, x30, [sp,#-416]!
 21b4674:	910003fd 	mov	x29, sp
 21b4678:	a90153f3 	stp	x19, x20, [sp,#16]
 21b467c:	a9025bf5 	stp	x21, x22, [sp,#32]
 21b4680:	aa0003f6 	mov	x22, x0
 21b4684:	aa0303f5 	mov	x21, x3
 21b4688:	a90363f7 	stp	x23, x24, [sp,#48]
 21b468c:	2a0403f8 	mov	w24, w4
 21b4690:	2a0503f7 	mov	w23, w5
 21b4694:	a9046bf9 	stp	x25, x26, [sp,#64]
 21b4698:	aa0103f9 	mov	x25, x1
 21b469c:	2a0203fa 	mov	w26, w2
 21b46a0:	a90573fb 	stp	x27, x28, [sp,#80]
 21b46a4:	39418000 	ldrb	w0, [x0,#96]
 21b46a8:	35001280 	cbnz	w0, 21b48f8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c7e0>
 21b46ac:	6b18035f 	cmp	w26, w24
 21b46b0:	5400136c 	b.gt	21b491c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c804>
 21b46b4:	7100035f 	cmp	w26, #0x0
 21b46b8:	f94036d3 	ldr	x19, [x22,#104]
 21b46bc:	5400206d 	b.le	21b4ac8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c9b0>
 21b46c0:	5100075b 	sub	w27, w26, #0x1
 21b46c4:	d2800014 	mov	x20, #0x0                   	// #0
 21b46c8:	9100077b 	add	x27, x27, #0x1
 21b46cc:	d37df37b 	lsl	x27, x27, #3
 21b46d0:	14000002 	b	21b46d8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c5c0>
 21b46d4:	f94036d3 	ldr	x19, [x22,#104]
 21b46d8:	2a1703e2 	mov	w2, w23
 21b46dc:	f8746aa0 	ldr	x0, [x21,x20]
 21b46e0:	f8346a60 	str	x0, [x19,x20]
 21b46e4:	f8746b21 	ldr	x1, [x25,x20]
 21b46e8:	91002294 	add	x20, x20, #0x8
 21b46ec:	9401f955 	bl	2232c40 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xaab28>
 21b46f0:	eb14037f 	cmp	x27, x20
 21b46f4:	54ffff01 	b.ne	21b46d4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c5bc>
 21b46f8:	6b18035f 	cmp	w26, w24
 21b46fc:	f94036d3 	ldr	x19, [x22,#104]
 21b4700:	54002080 	b.eq	21b4b10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c9f8>
 21b4704:	2a1a03fb 	mov	w27, w26
 21b4708:	52800020 	mov	w0, #0x1                   	// #1
 21b470c:	93407f59 	sxtw	x25, w26
 21b4710:	937d7f7c 	sbfiz	x28, x27, #3, #32
 21b4714:	4b1a001a 	sub	w26, w0, w26
 21b4718:	f8797aa0 	ldr	x0, [x21,x25,lsl #3]
 21b471c:	f83c6a60 	str	x0, [x19,x28]
 21b4720:	0b190374 	add	w20, w27, w25
 21b4724:	2a1703e1 	mov	w1, w23
 21b4728:	91000739 	add	x25, x25, #0x1
 21b472c:	9100239c 	add	x28, x28, #0x8
 21b4730:	9401f8e4 	bl	2232ac0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xaa9a8>
 21b4734:	0b140354 	add	w20, w26, w20
 21b4738:	6b19031f 	cmp	w24, w25
 21b473c:	f94036d3 	ldr	x19, [x22,#104]
 21b4740:	54fffecc 	b.gt	21b4718 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c600>
 21b4744:	290f5ff4 	stp	w20, w23, [sp,#120]
 21b4748:	71007e9f 	cmp	w20, #0x1f
 21b474c:	f90043ff 	str	xzr, [sp,#128]
 21b4750:	f9004bff 	str	xzr, [sp,#144]
 21b4754:	390663ff 	strb	wzr, [sp,#408]
 21b4758:	54000a4c 	b.gt	21b48a0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c788>
 21b475c:	910263e0 	add	x0, sp, #0x98
 21b4760:	f90047e0 	str	x0, [sp,#136]
 21b4764:	7100029f 	cmp	w20, #0x0
 21b4768:	8b34cc03 	add	x3, x0, w20, sxtw #3
 21b476c:	540002cd 	b.le	21b47c4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c6ac>
 21b4770:	91004002 	add	x2, x0, #0x10
 21b4774:	91004261 	add	x1, x19, #0x10
 21b4778:	eb13005f 	cmp	x2, x19
 21b477c:	fa418002 	ccmp	x0, x1, #0x2, hi
 21b4780:	7a422a84 	ccmp	w20, #0x2, #0x4, cs
 21b4784:	54000acd 	b.le	21b48dc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c7c4>
 21b4788:	7100029f 	cmp	w20, #0x0
 21b478c:	d2800001 	mov	x1, #0x0                   	// #0
 21b4790:	1a9fc694 	csinc	w20, w20, wzr, gt
 21b4794:	53017e82 	lsr	w2, w20, #1
 21b4798:	d37cec42 	lsl	x2, x2, #4
 21b479c:	d503201f 	nop
 21b47a0:	3ce16a60 	ldr	q0, [x19,x1]
 21b47a4:	3ca16800 	str	q0, [x0,x1]
 21b47a8:	91004021 	add	x1, x1, #0x10
 21b47ac:	eb02003f 	cmp	x1, x2
 21b47b0:	54ffff81 	b.ne	21b47a0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c688>
 21b47b4:	121f7a81 	and	w1, w20, #0xfffffffe
 21b47b8:	36000074 	tbz	w20, #0, 21b47c4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c6ac>
 21b47bc:	f8617a62 	ldr	x2, [x19,x1,lsl #3]
 21b47c0:	f8217802 	str	x2, [x0,x1,lsl #3]
 21b47c4:	f900007f 	str	xzr, [x3]
 21b47c8:	910062d4 	add	x20, x22, #0x18
 21b47cc:	aa1403e0 	mov	x0, x20
 21b47d0:	390663ff 	strb	wzr, [sp,#408]
 21b47d4:	9405de43 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 21b47d8:	f9400ac0 	ldr	x0, [x22,#16]
 21b47dc:	b4000360 	cbz	x0, 21b4848 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c730>
 21b47e0:	91014013 	add	x19, x0, #0x50
 21b47e4:	aa1303e0 	mov	x0, x19
 21b47e8:	9405de3e 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 21b47ec:	f9400ac0 	ldr	x0, [x22,#16]
 21b47f0:	39412001 	ldrb	w1, [x0,#72]
 21b47f4:	35000261 	cbnz	w1, 21b4840 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c728>
 21b47f8:	f9400003 	ldr	x3, [x0]
 21b47fc:	910662c2 	add	x2, x22, #0x198
 21b4800:	9101e3e1 	add	x1, sp, #0x78
 21b4804:	f9401c63 	ldr	x3, [x3,#56]
 21b4808:	d63f0060 	blr	x3
 21b480c:	aa1303e0 	mov	x0, x19
 21b4810:	9405de40 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21b4814:	aa1403e0 	mov	x0, x20
 21b4818:	9405de3e 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21b481c:	f9404be0 	ldr	x0, [sp,#144]
 21b4820:	9789c0b4 	bl	424af0 <free@plt>
 21b4824:	a94153f3 	ldp	x19, x20, [sp,#16]
 21b4828:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21b482c:	a94363f7 	ldp	x23, x24, [sp,#48]
 21b4830:	a9446bf9 	ldp	x25, x26, [sp,#64]
 21b4834:	a94573fb 	ldp	x27, x28, [sp,#80]
 21b4838:	a8da7bfd 	ldp	x29, x30, [sp],#416
 21b483c:	d65f03c0 	ret
 21b4840:	aa1303e0 	mov	x0, x19
 21b4844:	9405de33 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21b4848:	aa1403e0 	mov	x0, x20
 21b484c:	9405de31 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21b4850:	7100031f 	cmp	w24, #0x0
 21b4854:	5400014d 	b.le	21b487c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c764>
 21b4858:	51000718 	sub	w24, w24, #0x1
 21b485c:	910022a0 	add	x0, x21, #0x8
 21b4860:	8b384c18 	add	x24, x0, w24, uxtw #3
 21b4864:	d503201f 	nop
 21b4868:	f84086a0 	ldr	x0, [x21],#8
 21b486c:	2a1703e1 	mov	w1, w23
 21b4870:	9401f894 	bl	2232ac0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xaa9a8>
 21b4874:	eb1802bf 	cmp	x21, x24
 21b4878:	54ffff81 	b.ne	21b4868 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2c750>
 21b487c:	f9404be0 	ldr	x0, [sp,#144]
 21b4880:	9789c09c 	bl	424af0 <free@plt>
 21b4884:	a94153f3 	ldp	x19, x20, [sp,#16]
 21b4888:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21b488c:	a94363f7 	ldp	x23, x24, [sp,#48]
 21b4890:	a9446bf9 	ldp	x25, x26, [sp,#64]
 21b4894:	a94573fb 	ldp	x27, x28, [sp,#80]
 21b4898:	a8da7bfd 	ldp	x29, x30, [sp],#416
 21b489c:	d65f03c0 	ret
