
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002154730 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9548a8>:
 2154730:	a9b67bfd 	stp	x29, x30, [sp,#-160]!
 2154734:	910003fd 	mov	x29, sp
 2154738:	a90153f3 	stp	x19, x20, [sp,#16]
 215473c:	aa0103f4 	mov	x20, x1
 2154740:	91001821 	add	x1, x1, #0x6
 2154744:	a9025bf5 	stp	x21, x22, [sp,#32]
 2154748:	79400284 	ldrh	w4, [x20]
 215474c:	79400683 	ldrh	w3, [x20,#2]
 2154750:	79400a82 	ldrh	w2, [x20,#4]
 2154754:	a90363f7 	stp	x23, x24, [sp,#48]
 2154758:	a9046bf9 	stp	x25, x26, [sp,#64]
 215475c:	aa0003f9 	mov	x25, x0
 2154760:	a90573fb 	stp	x27, x28, [sp,#80]
 2154764:	7906d804 	strh	w4, [x0,#876]
 2154768:	7906dc03 	strh	w3, [x0,#878]
 215476c:	7906e002 	strh	w2, [x0,#880]
 2154770:	97fffb42 	bl	2153478 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9535f0>
 2154774:	91005281 	add	x1, x20, #0x14
 2154778:	aa1903e0 	mov	x0, x25
 215477c:	97fffe59 	bl	21540e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954258>
 2154780:	79c03693 	ldrsh	w19, [x20,#26]
 2154784:	f9409f3c 	ldr	x28, [x25,#312]
 2154788:	b0000000 	adrp	x0, 2155000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x955178>
 215478c:	91026000 	add	x0, x0, #0x98
 2154790:	f9400381 	ldr	x1, [x28]
 2154794:	f9401821 	ldr	x1, [x1,#48]
 2154798:	eb00003f 	cmp	x1, x0
 215479c:	54002901 	b.ne	2154cbc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954e34>
 21547a0:	b940db80 	ldr	w0, [x28,#216]
 21547a4:	f9405f81 	ldr	x1, [x28,#184]
 21547a8:	4b20a273 	sub	w19, w19, w0, sxth
 21547ac:	b9008bf3 	str	w19, [sp,#136]
 21547b0:	390233ff 	strb	wzr, [sp,#140]
 21547b4:	b40028c1 	cbz	x1, 2154ccc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954e44>
 21547b8:	f9400383 	ldr	x3, [x28]
 21547bc:	aa1c03e0 	mov	x0, x28
 21547c0:	910223e2 	add	x2, sp, #0x88
 21547c4:	910243f7 	add	x23, sp, #0x90
 21547c8:	f9401063 	ldr	x3, [x3,#32]
 21547cc:	d63f0060 	blr	x3
 21547d0:	b940b380 	ldr	w0, [x28,#176]
 21547d4:	7100001f 	cmp	w0, #0x0
 21547d8:	54000e4c 	b.gt	21549a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954b18>
 21547dc:	f941a73a 	ldr	x26, [x25,#840]
 21547e0:	39407280 	ldrb	w0, [x20,#28]
 21547e4:	39407682 	ldrb	w2, [x20,#29]
 21547e8:	f9405f41 	ldr	x1, [x26,#184]
 21547ec:	12000000 	and	w0, w0, #0x1
 21547f0:	b9008be2 	str	w2, [sp,#136]
 21547f4:	390233e0 	strb	w0, [sp,#140]
 21547f8:	b4002741 	cbz	x1, 2154ce0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954e58>
 21547fc:	f9400344 	ldr	x4, [x26]
 2154800:	aa1a03e0 	mov	x0, x26
 2154804:	910223e2 	add	x2, sp, #0x88
 2154808:	f9401084 	ldr	x4, [x4,#32]
 215480c:	d63f0080 	blr	x4
 2154810:	b940b340 	ldr	w0, [x26,#176]
 2154814:	7100001f 	cmp	w0, #0x0
 2154818:	5400192c 	b.gt	2154b3c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954cb4>
 215481c:	91007e81 	add	x1, x20, #0x1f
 2154820:	aa1903e0 	mov	x0, x25
 2154824:	97fffefd 	bl	2154418 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954590>
 2154828:	9109a336 	add	x22, x25, #0x268
 215482c:	91010a81 	add	x1, x20, #0x42
 2154830:	aa1903e0 	mov	x0, x25
 2154834:	97fffdbf 	bl	2153f30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9540a8>
 2154838:	91009295 	add	x21, x20, #0x24
 215483c:	f941ab20 	ldr	x0, [x25,#848]
 2154840:	52800018 	mov	w24, #0x0                   	// #0
 2154844:	39414681 	ldrb	w1, [x20,#81]
 2154848:	12000021 	and	w1, w1, #0x1
 215484c:	97ff778b 	bl	2132678 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9327f0>
 2154850:	91015281 	add	x1, x20, #0x54
 2154854:	aa1903e0 	mov	x0, x25
 2154858:	97ffff64 	bl	21545e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954760>
 215485c:	39417a82 	ldrb	w2, [x20,#94]
 2154860:	52800001 	mov	w1, #0x0                   	// #0
 2154864:	f941ab33 	ldr	x19, [x25,#848]
 2154868:	d3473842 	ubfx	x2, x2, #7, #8
 215486c:	910a0260 	add	x0, x19, #0x280
 2154870:	97ff767e 	bl	2132268 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9323e0>
 2154874:	39417a82 	ldrb	w2, [x20,#94]
 2154878:	910b8260 	add	x0, x19, #0x2e0
 215487c:	52800021 	mov	w1, #0x1                   	// #1
 2154880:	d3461842 	ubfx	x2, x2, #6, #1
 2154884:	97ff7679 	bl	2132268 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9323e0>
 2154888:	39417a82 	ldrb	w2, [x20,#94]
 215488c:	910d0260 	add	x0, x19, #0x340
 2154890:	52800041 	mov	w1, #0x2                   	// #2
 2154894:	d3451442 	ubfx	x2, x2, #5, #1
 2154898:	97ff7674 	bl	2132268 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9323e0>
 215489c:	39417a82 	ldrb	w2, [x20,#94]
 21548a0:	910e8260 	add	x0, x19, #0x3a0
 21548a4:	52800061 	mov	w1, #0x3                   	// #3
 21548a8:	d3441042 	ubfx	x2, x2, #4, #1
 21548ac:	97ff766f 	bl	2132268 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9323e0>
 21548b0:	9100e281 	add	x1, x20, #0x38
 21548b4:	aa1903e0 	mov	x0, x25
 21548b8:	97fffd46 	bl	2153dd0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953f48>
 21548bc:	91002a81 	add	x1, x20, #0xa
 21548c0:	aa1903e0 	mov	x0, x25
 21548c4:	97fffce1 	bl	2153c48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953dc0>
 21548c8:	9100f681 	add	x1, x20, #0x3d
 21548cc:	aa1903e0 	mov	x0, x25
 21548d0:	97fffd6c 	bl	2153e80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953ff8>
 21548d4:	93407f13 	sxtw	x19, w24
 21548d8:	394002a2 	ldrb	w2, [x21]
 21548dc:	f94002c0 	ldr	x0, [x22]
 21548e0:	8b130a73 	add	x19, x19, x19, lsl #2
 21548e4:	8b130293 	add	x19, x20, x19
 21548e8:	aa1703e1 	mov	x1, x23
 21548ec:	11000718 	add	w24, w24, #0x1
 21548f0:	910016b5 	add	x21, x21, #0x5
 21548f4:	9100e2d6 	add	x22, x22, #0x38
 21548f8:	3940a263 	ldrb	w3, [x19,#40]
 21548fc:	390243ff 	strb	wzr, [sp,#144]
 2154900:	d3461c63 	ubfx	x3, x3, #6, #2
 2154904:	2a020862 	orr	w2, w3, w2, lsl #2
 2154908:	b9009be2 	str	w2, [sp,#152]
 215490c:	94001315 	bl	2159560 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9596d8>
 2154910:	3940a263 	ldrb	w3, [x19,#40]
 2154914:	aa1703e1 	mov	x1, x23
 2154918:	385fc2a2 	ldurb	w2, [x21,#-4]
 215491c:	f85d02c0 	ldur	x0, [x22,#-48]
 2154920:	d3441463 	ubfx	x3, x3, #4, #2
 2154924:	2a020862 	orr	w2, w3, w2, lsl #2
 2154928:	390243ff 	strb	wzr, [sp,#144]
 215492c:	b9009be2 	str	w2, [sp,#152]
 2154930:	9400130c 	bl	2159560 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9596d8>
 2154934:	3940a263 	ldrb	w3, [x19,#40]
 2154938:	aa1703e1 	mov	x1, x23
 215493c:	385fd2a2 	ldurb	w2, [x21,#-3]
 2154940:	f85d82c0 	ldur	x0, [x22,#-40]
 2154944:	d3420c63 	ubfx	x3, x3, #2, #2
 2154948:	2a020862 	orr	w2, w3, w2, lsl #2
 215494c:	390243ff 	strb	wzr, [sp,#144]
 2154950:	b9009be2 	str	w2, [sp,#152]
 2154954:	94001303 	bl	2159560 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9596d8>
 2154958:	3940a263 	ldrb	w3, [x19,#40]
 215495c:	aa1703e1 	mov	x1, x23
 2154960:	385fe2a2 	ldurb	w2, [x21,#-2]
 2154964:	12000463 	and	w3, w3, #0x3
 2154968:	390243ff 	strb	wzr, [sp,#144]
 215496c:	f85e02c0 	ldur	x0, [x22,#-32]
 2154970:	2a020862 	orr	w2, w3, w2, lsl #2
 2154974:	b9009be2 	str	w2, [sp,#152]
 2154978:	940012fa 	bl	2159560 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9596d8>
 215497c:	7100131f 	cmp	w24, #0x4
 2154980:	54fffaa1 	b.ne	21548d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954a4c>
 2154984:	a94153f3 	ldp	x19, x20, [sp,#16]
 2154988:	a9425bf5 	ldp	x21, x22, [sp,#32]
 215498c:	a94363f7 	ldp	x23, x24, [sp,#48]
 2154990:	a9446bf9 	ldp	x25, x26, [sp,#64]
 2154994:	a94573fb 	ldp	x27, x28, [sp,#80]
 2154998:	a8ca7bfd 	ldp	x29, x30, [sp],#160
 215499c:	d65f03c0 	ret
 21549a0:	91010393 	add	x19, x28, #0x40
 21549a4:	910243f7 	add	x23, sp, #0x90
 21549a8:	aa1303e0 	mov	x0, x19
 21549ac:	94075dd1 	bl	232c0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fd8>
 21549b0:	72001c1f 	tst	w0, #0xff
 21549b4:	54fff140 	b.eq	21547dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954954>
 21549b8:	b9408395 	ldr	w21, [x28,#128]
 21549bc:	b9009b9f 	str	wzr, [x28,#152]
 21549c0:	710002bf 	cmp	w21, #0x0
 21549c4:	54001d80 	b.eq	2154d74 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954eec>
 21549c8:	540019ad 	b.le	2154cfc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954e74>
 21549cc:	937d7ea0 	sbfiz	x0, x21, #3, #32
 21549d0:	978b4180 	bl	424fd0 <malloc@plt>
 21549d4:	91004003 	add	x3, x0, #0x10
 21549d8:	aa0003e2 	mov	x2, x0
 21549dc:	f9403b80 	ldr	x0, [x28,#112]
 21549e0:	510006a1 	sub	w1, w21, #0x1
 21549e4:	eb03001f 	cmp	x0, x3
 21549e8:	91004003 	add	x3, x0, #0x10
 21549ec:	fa433042 	ccmp	x2, x3, #0x2, cc
 21549f0:	7a442820 	ccmp	w1, #0x4, #0x0, cs
 21549f4:	54001da9 	b.ls	2154da8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954f20>
 21549f8:	53017ea3 	lsr	w3, w21, #1
 21549fc:	d2800001 	mov	x1, #0x0                   	// #0
 2154a00:	d37cec63 	lsl	x3, x3, #4
 2154a04:	d503201f 	nop
 2154a08:	3ce16800 	ldr	q0, [x0,x1]
 2154a0c:	3ca16840 	str	q0, [x2,x1]
 2154a10:	91004021 	add	x1, x1, #0x10
 2154a14:	eb01007f 	cmp	x3, x1
 2154a18:	54ffff81 	b.ne	2154a08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954b80>
 2154a1c:	121f7aa1 	and	w1, w21, #0xfffffffe
 2154a20:	36000075 	tbz	w21, #0, 2154a2c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954ba4>
 2154a24:	f8617800 	ldr	x0, [x0,x1,lsl #3]
 2154a28:	f8217840 	str	x0, [x2,x1,lsl #3]
 2154a2c:	2a1503e1 	mov	w1, w21
 2154a30:	f9404780 	ldr	x0, [x28,#136]
 2154a34:	f9004782 	str	x2, [x28,#136]
 2154a38:	b9009381 	str	w1, [x28,#144]
 2154a3c:	b9009b95 	str	w21, [x28,#152]
 2154a40:	978b402c 	bl	424af0 <free@plt>
 2154a44:	aa1303e0 	mov	x0, x19
 2154a48:	94075db2 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 2154a4c:	aa1c03e0 	mov	x0, x28
 2154a50:	52800181 	mov	w1, #0xc                   	// #12
 2154a54:	f84a0c04 	ldr	x4, [x0,#160]!
 2154a58:	b9401018 	ldr	w24, [x0,#16]
 2154a5c:	9b211300 	smaddl	x0, w24, w1, x4
 2154a60:	f9003be0 	str	x0, [sp,#112]
 2154a64:	eb00009f 	cmp	x4, x0
 2154a68:	540018c0 	b.eq	2154d80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954ef8>
 2154a6c:	90002365 	adrp	x5, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 2154a70:	b000cf96 	adrp	x22, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 2154a74:	aa0403fb 	mov	x27, x4
 2154a78:	9118a2c0 	add	x0, x22, #0x628
 2154a7c:	912a70ba 	add	x26, x5, #0xa9c
 2154a80:	910243f7 	add	x23, sp, #0x90
 2154a84:	f90033e0 	str	x0, [sp,#96]
 2154a88:	91022380 	add	x0, x28, #0x88
 2154a8c:	f9003fe0 	str	x0, [sp,#120]
 2154a90:	b000cf81 	adrp	x1, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 2154a94:	9118c036 	add	x22, x1, #0x630
 2154a98:	f9403fe1 	ldr	x1, [sp,#120]
 2154a9c:	f9400360 	ldr	x0, [x27]
 2154aa0:	b9801023 	ldrsw	x3, [x1,#16]
 2154aa4:	f90002e0 	str	x0, [x23]
 2154aa8:	f9404780 	ldr	x0, [x28,#136]
 2154aac:	b9400b61 	ldr	w1, [x27,#8]
 2154ab0:	b9000ae1 	str	w1, [x23,#8]
 2154ab4:	aa0003f3 	mov	x19, x0
 2154ab8:	8b030c18 	add	x24, x0, x3, lsl #3
 2154abc:	eb18001f 	cmp	x0, x24
 2154ac0:	54000320 	b.eq	2154b24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954c9c>
 2154ac4:	d503201f 	nop
 2154ac8:	f9400275 	ldr	x21, [x19]
 2154acc:	910022a0 	add	x0, x21, #0x8
 2154ad0:	eb1a001f 	cmp	x0, x26
 2154ad4:	54000223 	b.cc	2154b18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954c90>
 2154ad8:	f240041f 	tst	x0, #0x3
 2154adc:	540001e1 	b.ne	2154b18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954c90>
 2154ae0:	b9400aa1 	ldr	w1, [x21,#8]
 2154ae4:	f94033e0 	ldr	x0, [sp,#96]
 2154ae8:	08dffc00 	ldarb	w0, [x0]
 2154aec:	360010e0 	tbz	w0, #0, 2154d08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954e80>
 2154af0:	b94002c0 	ldr	w0, [x22]
 2154af4:	6b00003f 	cmp	w1, w0
 2154af8:	54000101 	b.ne	2154b18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954c90>
 2154afc:	f9400387 	ldr	x7, [x28]
 2154b00:	aa1503e1 	mov	x1, x21
 2154b04:	aa1703e2 	mov	x2, x23
 2154b08:	aa1c03e0 	mov	x0, x28
 2154b0c:	f94008e7 	ldr	x7, [x7,#16]
 2154b10:	d63f00e0 	blr	x7
 2154b14:	d503201f 	nop
 2154b18:	91002273 	add	x19, x19, #0x8
 2154b1c:	eb13031f 	cmp	x24, x19
 2154b20:	54fffd41 	b.ne	2154ac8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954c40>
 2154b24:	f9403be0 	ldr	x0, [sp,#112]
 2154b28:	9100337b 	add	x27, x27, #0xc
 2154b2c:	eb1b001f 	cmp	x0, x27
 2154b30:	54fffb01 	b.ne	2154a90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954c08>
 2154b34:	b900b39f 	str	wzr, [x28,#176]
 2154b38:	17ffff29 	b	21547dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954954>
 2154b3c:	91010353 	add	x19, x26, #0x40
 2154b40:	aa1303e0 	mov	x0, x19
 2154b44:	94075d6b 	bl	232c0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fd8>
 2154b48:	72001c1f 	tst	w0, #0xff
 2154b4c:	54ffe680 	b.eq	215481c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954994>
 2154b50:	b9408355 	ldr	w21, [x26,#128]
 2154b54:	b9009b5f 	str	wzr, [x26,#152]
 2154b58:	710002bf 	cmp	w21, #0x0
 2154b5c:	54001060 	b.eq	2154d68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954ee0>
 2154b60:	54000c8d 	b.le	2154cf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954e68>
 2154b64:	937d7ea0 	sbfiz	x0, x21, #3, #32
 2154b68:	978b411a 	bl	424fd0 <malloc@plt>
 2154b6c:	91004004 	add	x4, x0, #0x10
 2154b70:	aa0003e2 	mov	x2, x0
 2154b74:	f9403b40 	ldr	x0, [x26,#112]
 2154b78:	510006a1 	sub	w1, w21, #0x1
 2154b7c:	eb04001f 	cmp	x0, x4
 2154b80:	91004004 	add	x4, x0, #0x10
 2154b84:	fa443042 	ccmp	x2, x4, #0x2, cc
 2154b88:	7a442820 	ccmp	w1, #0x4, #0x0, cs
 2154b8c:	54001009 	b.ls	2154d8c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954f04>
 2154b90:	53017ea4 	lsr	w4, w21, #1
 2154b94:	d2800001 	mov	x1, #0x0                   	// #0
 2154b98:	d37cec84 	lsl	x4, x4, #4
 2154b9c:	d503201f 	nop
 2154ba0:	3ce16800 	ldr	q0, [x0,x1]
 2154ba4:	3ca16840 	str	q0, [x2,x1]
 2154ba8:	91004021 	add	x1, x1, #0x10
 2154bac:	eb01009f 	cmp	x4, x1
 2154bb0:	54ffff81 	b.ne	2154ba0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954d18>
 2154bb4:	121f7aa1 	and	w1, w21, #0xfffffffe
 2154bb8:	36000075 	tbz	w21, #0, 2154bc4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954d3c>
 2154bbc:	f8617800 	ldr	x0, [x0,x1,lsl #3]
 2154bc0:	f8217840 	str	x0, [x2,x1,lsl #3]
 2154bc4:	2a1503e1 	mov	w1, w21
 2154bc8:	f9404740 	ldr	x0, [x26,#136]
 2154bcc:	b9009341 	str	w1, [x26,#144]
 2154bd0:	91022341 	add	x1, x26, #0x88
 2154bd4:	f9004742 	str	x2, [x26,#136]
 2154bd8:	b9009b55 	str	w21, [x26,#152]
 2154bdc:	f9003fe1 	str	x1, [sp,#120]
 2154be0:	978b3fc4 	bl	424af0 <free@plt>
 2154be4:	aa1303e0 	mov	x0, x19
 2154be8:	94075d4a 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 2154bec:	aa1a03e0 	mov	x0, x26
 2154bf0:	f84a0c01 	ldr	x1, [x0,#160]!
 2154bf4:	aa0103f6 	mov	x22, x1
 2154bf8:	b9801000 	ldrsw	x0, [x0,#16]
 2154bfc:	8b001020 	add	x0, x1, x0, lsl #4
 2154c00:	f9003be0 	str	x0, [sp,#112]
 2154c04:	eb00003f 	cmp	x1, x0
 2154c08:	54000560 	b.eq	2154cb4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954e2c>
 2154c0c:	90002367 	adrp	x7, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 2154c10:	912a70f8 	add	x24, x7, #0xa9c
 2154c14:	b000cf95 	adrp	x21, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 2154c18:	911922a0 	add	x0, x21, #0x648
 2154c1c:	f90033e0 	str	x0, [sp,#96]
 2154c20:	b000cf80 	adrp	x0, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 2154c24:	91194015 	add	x21, x0, #0x650
 2154c28:	f9403fe0 	ldr	x0, [sp,#120]
 2154c2c:	f9404753 	ldr	x19, [x26,#136]
 2154c30:	b980101c 	ldrsw	x28, [x0,#16]
 2154c34:	a94006c0 	ldp	x0, x1, [x22]
 2154c38:	a90907e0 	stp	x0, x1, [sp,#144]
 2154c3c:	8b1c0e7c 	add	x28, x19, x28, lsl #3
 2154c40:	eb1c027f 	cmp	x19, x28
 2154c44:	54000300 	b.eq	2154ca4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954e1c>
 2154c48:	f940027b 	ldr	x27, [x19]
 2154c4c:	91002360 	add	x0, x27, #0x8
 2154c50:	eb18001f 	cmp	x0, x24
 2154c54:	54000223 	b.cc	2154c98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954e10>
 2154c58:	f240041f 	tst	x0, #0x3
 2154c5c:	540001e1 	b.ne	2154c98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954e10>
 2154c60:	b9400b61 	ldr	w1, [x27,#8]
 2154c64:	f94033e0 	ldr	x0, [sp,#96]
 2154c68:	08dffc00 	ldarb	w0, [x0]
 2154c6c:	36000660 	tbz	w0, #0, 2154d38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954eb0>
 2154c70:	b94002a0 	ldr	w0, [x21]
 2154c74:	6b00003f 	cmp	w1, w0
 2154c78:	54000101 	b.ne	2154c98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954e10>
 2154c7c:	f9400345 	ldr	x5, [x26]
 2154c80:	aa1b03e1 	mov	x1, x27
 2154c84:	aa1703e2 	mov	x2, x23
 2154c88:	aa1a03e0 	mov	x0, x26
 2154c8c:	f94008a5 	ldr	x5, [x5,#16]
 2154c90:	d63f00a0 	blr	x5
 2154c94:	d503201f 	nop
 2154c98:	91002273 	add	x19, x19, #0x8
 2154c9c:	eb13039f 	cmp	x28, x19
 2154ca0:	54fffd41 	b.ne	2154c48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954dc0>
 2154ca4:	f9403be0 	ldr	x0, [sp,#112]
 2154ca8:	910042d6 	add	x22, x22, #0x10
 2154cac:	eb16001f 	cmp	x0, x22
 2154cb0:	54fffb81 	b.ne	2154c20 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954d98>
 2154cb4:	b900b35f 	str	wzr, [x26,#176]
 2154cb8:	17fffed9 	b	215481c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954994>
 2154cbc:	aa1c03e0 	mov	x0, x28
 2154cc0:	d63f0020 	blr	x1
 2154cc4:	f9409f3c 	ldr	x28, [x25,#312]
 2154cc8:	17fffeb7 	b	21547a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95491c>
 2154ccc:	910243f7 	add	x23, sp, #0x90
 2154cd0:	d2800001 	mov	x1, #0x0                   	// #0
 2154cd4:	52800000 	mov	w0, #0x0                   	// #0
 2154cd8:	9402ae7a 	bl	22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x785a8>
 2154cdc:	17fffec0 	b	21547dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954954>
 2154ce0:	d2800001 	mov	x1, #0x0                   	// #0
 2154ce4:	52800000 	mov	w0, #0x0                   	// #0
 2154ce8:	9402ae76 	bl	22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x785a8>
 2154cec:	17fffecc 	b	215481c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954994>
 2154cf0:	2a1503e1 	mov	w1, w21
 2154cf4:	d2800002 	mov	x2, #0x0                   	// #0
 2154cf8:	17ffffb4 	b	2154bc8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954d40>
 2154cfc:	2a1503e1 	mov	w1, w21
 2154d00:	d2800002 	mov	x2, #0x0                   	// #0
 2154d04:	17ffff4b 	b	2154a30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954ba8>
 2154d08:	f94033e0 	ldr	x0, [sp,#96]
 2154d0c:	b9006fe1 	str	w1, [sp,#108]
 2154d10:	978b4554 	bl	426260 <__cxa_guard_acquire@plt>
 2154d14:	b9406fe1 	ldr	w1, [sp,#108]
 2154d18:	34ffeec0 	cbz	w0, 2154af0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954c68>
 2154d1c:	b9006fe1 	str	w1, [sp,#108]
 2154d20:	97956efa 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 2154d24:	b90002c0 	str	w0, [x22]
 2154d28:	f94033e0 	ldr	x0, [sp,#96]
 2154d2c:	978b46c5 	bl	426840 <__cxa_guard_release@plt>
 2154d30:	b9406fe1 	ldr	w1, [sp,#108]
 2154d34:	17ffff6f 	b	2154af0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954c68>
 2154d38:	f94033e0 	ldr	x0, [sp,#96]
 2154d3c:	b9006fe1 	str	w1, [sp,#108]
 2154d40:	978b4548 	bl	426260 <__cxa_guard_acquire@plt>
 2154d44:	b9406fe1 	ldr	w1, [sp,#108]
 2154d48:	34fff940 	cbz	w0, 2154c70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954de8>
 2154d4c:	b9006fe1 	str	w1, [sp,#108]
 2154d50:	97956eee 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 2154d54:	b90002a0 	str	w0, [x21]
 2154d58:	f94033e0 	ldr	x0, [sp,#96]
 2154d5c:	978b46b9 	bl	426840 <__cxa_guard_release@plt>
 2154d60:	b9406fe1 	ldr	w1, [sp,#108]
 2154d64:	17ffffc3 	b	2154c70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954de8>
 2154d68:	52800001 	mov	w1, #0x0                   	// #0
 2154d6c:	d2800002 	mov	x2, #0x0                   	// #0
 2154d70:	17ffff96 	b	2154bc8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954d40>
 2154d74:	52800001 	mov	w1, #0x0                   	// #0
 2154d78:	d2800002 	mov	x2, #0x0                   	// #0
 2154d7c:	17ffff2d 	b	2154a30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954ba8>
 2154d80:	910243f7 	add	x23, sp, #0x90
 2154d84:	b900b39f 	str	wzr, [x28,#176]
 2154d88:	17fffe95 	b	21547dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954954>
 2154d8c:	d2800001 	mov	x1, #0x0                   	// #0
 2154d90:	f8617804 	ldr	x4, [x0,x1,lsl #3]
 2154d94:	f8217844 	str	x4, [x2,x1,lsl #3]
 2154d98:	91000421 	add	x1, x1, #0x1
 2154d9c:	6b0102bf 	cmp	w21, w1
 2154da0:	54ffff8c 	b.gt	2154d90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954f08>
 2154da4:	17ffff88 	b	2154bc4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954d3c>
 2154da8:	d2800001 	mov	x1, #0x0                   	// #0
 2154dac:	d503201f 	nop
 2154db0:	f8617803 	ldr	x3, [x0,x1,lsl #3]
 2154db4:	f8217843 	str	x3, [x2,x1,lsl #3]
 2154db8:	91000421 	add	x1, x1, #0x1
 2154dbc:	6b0102bf 	cmp	w21, w1
 2154dc0:	54ffff8c 	b.gt	2154db0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954f28>
 2154dc4:	17ffff1a 	b	2154a2c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954ba4>
 2154dc8:	b4000041 	cbz	x1, 2154dd0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954f48>
 2154dcc:	17fffe59 	b	2154730 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9548a8>
 2154dd0:	d65f03c0 	ret
 2154dd4:	d503201f 	nop
 2154dd8:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
 2154ddc:	910003fd 	mov	x29, sp
 2154de0:	a90153f3 	stp	x19, x20, [sp,#16]
 2154de4:	b000d2f3 	adrp	x19, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 2154de8:	912ac273 	add	x19, x19, #0xab0
 2154dec:	f90013f5 	str	x21, [sp,#32]
 2154df0:	aa0003f5 	mov	x21, x0
 2154df4:	08dffe60 	ldarb	w0, [x19]
 2154df8:	36000340 	tbz	w0, #0, 2154e60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954fd8>
 2154dfc:	f9400660 	ldr	x0, [x19,#8]
 2154e00:	b4000420 	cbz	x0, 2154e84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954ffc>
 2154e04:	910a6000 	add	x0, x0, #0x298
 2154e08:	9100e3e8 	add	x8, sp, #0x38
 2154e0c:	94000f49 	bl	2158b30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x958ca8>
 2154e10:	b9804bf4 	ldrsw	x20, [sp,#72]
 2154e14:	f9401fe0 	ldr	x0, [sp,#56]
 2154e18:	8b140c14 	add	x20, x0, x20, lsl #3
 2154e1c:	eb00029f 	cmp	x20, x0
 2154e20:	54000140 	b.eq	2154e48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954fc0>
 2154e24:	aa0003f3 	mov	x19, x0
 2154e28:	f9400261 	ldr	x1, [x19]
 2154e2c:	b4000061 	cbz	x1, 2154e38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954fb0>
 2154e30:	aa1503e0 	mov	x0, x21
 2154e34:	97fffe3f 	bl	2154730 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9548a8>
 2154e38:	91002273 	add	x19, x19, #0x8
 2154e3c:	eb13029f 	cmp	x20, x19
 2154e40:	54ffff41 	b.ne	2154e28 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954fa0>
 2154e44:	f9401fe0 	ldr	x0, [sp,#56]
 2154e48:	978b3f2a 	bl	424af0 <free@plt>
 2154e4c:	52800020 	mov	w0, #0x1                   	// #1
 2154e50:	a94153f3 	ldp	x19, x20, [sp,#16]
 2154e54:	f94013f5 	ldr	x21, [sp,#32]
 2154e58:	a8c57bfd 	ldp	x29, x30, [sp],#80
 2154e5c:	d65f03c0 	ret
 2154e60:	aa1303e0 	mov	x0, x19
 2154e64:	978b44ff 	bl	426260 <__cxa_guard_acquire@plt>
 2154e68:	34fffca0 	cbz	w0, 2154dfc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954f74>
 2154e6c:	97dcc03d 	bl	1884f60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x850d8>
 2154e70:	f9000660 	str	x0, [x19,#8]
 2154e74:	aa1303e0 	mov	x0, x19
 2154e78:	978b4672 	bl	426840 <__cxa_guard_release@plt>
 2154e7c:	f9400660 	ldr	x0, [x19,#8]
 2154e80:	b5fffc20 	cbnz	x0, 2154e04 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x954f7c>
 2154e84:	52800000 	mov	w0, #0x0                   	// #0
 2154e88:	a94153f3 	ldp	x19, x20, [sp,#16]
 2154e8c:	f94013f5 	ldr	x21, [sp,#32]
 2154e90:	a8c57bfd 	ldp	x29, x30, [sp],#80
 2154e94:	d65f03c0 	ret
 2154e98:	aa0003f4 	mov	x20, x0
 2154e9c:	aa1303e0 	mov	x0, x19
 2154ea0:	978b3e34 	bl	424770 <__cxa_guard_abort@plt>
 2154ea4:	aa1403e0 	mov	x0, x20
 2154ea8:	978b3f9a 	bl	424d10 <_Unwind_Resume@plt>
 2154eac:	aa0003f3 	mov	x19, x0
 2154eb0:	f9401fe0 	ldr	x0, [sp,#56]
 2154eb4:	978b3f0f 	bl	424af0 <free@plt>
 2154eb8:	aa1303e0 	mov	x0, x19
 2154ebc:	978b3f95 	bl	424d10 <_Unwind_Resume@plt>
