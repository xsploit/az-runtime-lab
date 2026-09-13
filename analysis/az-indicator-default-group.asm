
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000205a568 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85a6e0>:
 205a568:	a9b17bfd 	stp	x29, x30, [sp,#-240]!
 205a56c:	910003fd 	mov	x29, sp
 205a570:	a9025bf5 	stp	x21, x22, [sp,#32]
 205a574:	aa0003f5 	mov	x21, x0
 205a578:	910022b6 	add	x22, x21, #0x8
 205a57c:	a90153f3 	stp	x19, x20, [sp,#16]
 205a580:	aa1503f4 	mov	x20, x21
 205a584:	12800000 	mov	w0, #0xffffffff            	// #-1
 205a588:	a90363f7 	stp	x23, x24, [sp,#48]
 205a58c:	b0000018 	adrp	x24, 205b000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85b178>
 205a590:	52800017 	mov	w23, #0x0                   	// #0
 205a594:	a9046bf9 	stp	x25, x26, [sp,#64]
 205a598:	911c0318 	add	x24, x24, #0x700
 205a59c:	d0006d99 	adrp	x25, 2e0c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8491a8>
 205a5a0:	a90573fb 	stp	x27, x28, [sp,#80]
 205a5a4:	91398339 	add	x25, x25, #0xe60
 205a5a8:	aa0103fc 	mov	x28, x1
 205a5ac:	f90006bf 	str	xzr, [x21,#8]
 205a5b0:	a900fedf 	stp	xzr, xzr, [x22,#8]
 205a5b4:	390082a0 	strb	w0, [x21,#32]
 205a5b8:	d0006d80 	adrp	x0, 2e0c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8491a8>
 205a5bc:	a982fe9f 	stp	xzr, xzr, [x20,#40]!
 205a5c0:	9138c000 	add	x0, x0, #0xe30
 205a5c4:	f9000a9f 	str	xzr, [x20,#16]
 205a5c8:	f90002a0 	str	x0, [x21]
 205a5cc:	1400002b 	b	205a678 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85a7f0>
 205a5d0:	f9006fff 	str	xzr, [sp,#216]
 205a5d4:	f8008433 	str	x19, [x1],#8
 205a5d8:	f90006c1 	str	x1, [x22,#8]
 205a5dc:	f9406ff3 	ldr	x19, [sp,#216]
 205a5e0:	b4000473 	cbz	x19, 205a66c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85a7e4>
 205a5e4:	f9400260 	ldr	x0, [x19]
 205a5e8:	f9400401 	ldr	x1, [x0,#8]
 205a5ec:	eb18003f 	cmp	x1, x24
 205a5f0:	54000601 	b.ne	205a6b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85a828>
 205a5f4:	f940327a 	ldr	x26, [x19,#96]
 205a5f8:	b0006dc0 	adrp	x0, 2e13000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8501a8>
 205a5fc:	9138e000 	add	x0, x0, #0xe38
 205a600:	f9000260 	str	x0, [x19]
 205a604:	b400017a 	cbz	x26, 205a630 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85a7a8>
 205a608:	f0006d80 	adrp	x0, 2e0d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x84a1a8>
 205a60c:	f944fc1b 	ldr	x27, [x0,#2552]
 205a610:	b4005d3b 	cbz	x27, 205b1b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85b32c>
 205a614:	91002341 	add	x1, x26, #0x8
 205a618:	885ffc20 	ldaxr	w0, [x1]
 205a61c:	51000402 	sub	w2, w0, #0x1
 205a620:	8803fc22 	stlxr	w3, w2, [x1]
 205a624:	35ffffa3 	cbnz	w3, 205a618 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85a790>
 205a628:	7100041f 	cmp	w0, #0x1
 205a62c:	54005ce0 	b.eq	205b1c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85b340>
 205a630:	f940267a 	ldr	x26, [x19,#72]
 205a634:	b400017a 	cbz	x26, 205a660 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85a7d8>
 205a638:	f0006d80 	adrp	x0, 2e0d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x84a1a8>
 205a63c:	f944fc1b 	ldr	x27, [x0,#2552]
 205a640:	b40058fb 	cbz	x27, 205b15c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85b2d4>
 205a644:	91002341 	add	x1, x26, #0x8
 205a648:	885ffc20 	ldaxr	w0, [x1]
 205a64c:	51000402 	sub	w2, w0, #0x1
 205a650:	8803fc22 	stlxr	w3, w2, [x1]
 205a654:	35ffffa3 	cbnz	w3, 205a648 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85a7c0>
 205a658:	7100041f 	cmp	w0, #0x1
 205a65c:	540058a0 	b.eq	205b170 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85b2e8>
 205a660:	aa1303e0 	mov	x0, x19
 205a664:	d2800e01 	mov	x1, #0x70                  	// #112
 205a668:	978f2ffe 	bl	426660 <_ZdlPvm@plt>
 205a66c:	110006f7 	add	w23, w23, #0x1
 205a670:	71002eff 	cmp	w23, #0xb
 205a674:	540002a0 	b.eq	205a6c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85a840>
 205a678:	d2800e00 	mov	x0, #0x70                  	// #112
 205a67c:	978f29b1 	bl	424d40 <_Znwm@plt>
 205a680:	aa0003f3 	mov	x19, x0
 205a684:	94007e5f 	bl	207a000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87a178>
 205a688:	a94082c1 	ldp	x1, x0, [x22,#8]
 205a68c:	f9000279 	str	x25, [x19]
 205a690:	b9006a77 	str	w23, [x19,#104]
 205a694:	f9006ff3 	str	x19, [sp,#216]
 205a698:	eb00003f 	cmp	x1, x0
 205a69c:	54fff9a1 	b.ne	205a5d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85a748>
 205a6a0:	910363e2 	add	x2, sp, #0xd8
 205a6a4:	aa1603e0 	mov	x0, x22
 205a6a8:	94000b10 	bl	205d2e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85d460>
 205a6ac:	17ffffcc 	b	205a5dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85a754>
 205a6b0:	aa1303e0 	mov	x0, x19
 205a6b4:	110006f7 	add	w23, w23, #0x1
 205a6b8:	d63f0020 	blr	x1
 205a6bc:	71002eff 	cmp	w23, #0xb
 205a6c0:	54fffdc1 	b.ne	205a678 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85a7f0>
 205a6c4:	d503201f 	nop
 205a6c8:	f0006d80 	adrp	x0, 2e0d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x84a1a8>
 205a6cc:	91297c00 	add	x0, x0, #0xa5f
 205a6d0:	97fffa7a 	bl	20590b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x859230>
 205a6d4:	8b001003 	add	x3, x0, x0, lsl #4
 205a6d8:	d2801661 	mov	x1, #0xb3                  	// #179
 205a6dc:	d28d1442 	mov	x2, #0x68a2                	// #26786
 205a6e0:	8b030c03 	add	x3, x0, x3, lsl #3
 205a6e4:	f2f12001 	movk	x1, #0x8900, lsl #48
 205a6e8:	9101d064 	add	x4, x3, #0x74
 205a6ec:	f2a7f102 	movk	x2, #0x3f88, lsl #16
 205a6f0:	f2cbadc2 	movk	x2, #0x5d6e, lsl #32
 205a6f4:	9102a3f8 	add	x24, sp, #0xa8
 205a6f8:	f2e03bc2 	movk	x2, #0x1de, lsl #48
 205a6fc:	d2800900 	mov	x0, #0x48                  	// #72
 205a700:	9bc17c83 	umulh	x3, x4, x1
 205a704:	f94006a5 	ldr	x5, [x21,#8]
 205a708:	d378fc63 	lsr	x3, x3, #56
 205a70c:	f94000b7 	ldr	x23, [x5]
 205a710:	9b029063 	msub	x3, x3, x2, x4
 205a714:	8b031064 	add	x4, x3, x3, lsl #4
 205a718:	8b040c63 	add	x3, x3, x4, lsl #3
 205a71c:	91018464 	add	x4, x3, #0x61
 205a720:	9bc17c83 	umulh	x3, x4, x1
 205a724:	d378fc63 	lsr	x3, x3, #56
 205a728:	9b029063 	msub	x3, x3, x2, x4
 205a72c:	8b031064 	add	x4, x3, x3, lsl #4
 205a730:	8b040c63 	add	x3, x3, x4, lsl #3
 205a734:	91018c64 	add	x4, x3, #0x63
 205a738:	9bc17c83 	umulh	x3, x4, x1
 205a73c:	d378fc63 	lsr	x3, x3, #56
 205a740:	9b029063 	msub	x3, x3, x2, x4
 205a744:	8b031064 	add	x4, x3, x3, lsl #4
 205a748:	8b040c63 	add	x3, x3, x4, lsl #3
 205a74c:	9101a464 	add	x4, x3, #0x69
 205a750:	9bc17c83 	umulh	x3, x4, x1
 205a754:	d378fc63 	lsr	x3, x3, #56
 205a758:	9b029063 	msub	x3, x3, x2, x4
 205a75c:	8b031064 	add	x4, x3, x3, lsl #4
 205a760:	8b040c63 	add	x3, x3, x4, lsl #3
 205a764:	91019064 	add	x4, x3, #0x64
 205a768:	9bc17c83 	umulh	x3, x4, x1
 205a76c:	d378fc63 	lsr	x3, x3, #56
 205a770:	9b029063 	msub	x3, x3, x2, x4
 205a774:	8b031064 	add	x4, x3, x3, lsl #4
 205a778:	8b040c63 	add	x3, x3, x4, lsl #3
 205a77c:	9101b864 	add	x4, x3, #0x6e
 205a780:	9bc17c83 	umulh	x3, x4, x1
 205a784:	d378fc63 	lsr	x3, x3, #56
 205a788:	9b029063 	msub	x3, x3, x2, x4
 205a78c:	8b031064 	add	x4, x3, x3, lsl #4
 205a790:	8b040c63 	add	x3, x3, x4, lsl #3
 205a794:	91012463 	add	x3, x3, #0x49
 205a798:	9bc17c61 	umulh	x1, x3, x1
 205a79c:	d378fc21 	lsr	x1, x1, #56
 205a7a0:	9b028c21 	msub	x1, x1, x2, x3
 205a7a4:	a90a87ff 	stp	xzr, x1, [sp,#168]
 205a7a8:	978f2966 	bl	424d40 <_Znwm@plt>
 205a7ac:	aa0003f3 	mov	x19, x0
 205a7b0:	aa1703e1 	mov	x1, x23
 205a7b4:	97ffea59 	bl	2055118 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x855290>
 205a7b8:	a9408281 	ldp	x1, x0, [x20,#8]
 205a7bc:	f9006ff3 	str	x19, [sp,#216]
 205a7c0:	eb00003f 	cmp	x1, x0
 205a7c4:	54005460 	b.eq	205b250 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85b3c8>
 205a7c8:	f8008433 	str	x19, [x1],#8
 205a7cc:	910363f7 	add	x23, sp, #0xd8
 205a7d0:	f9000681 	str	x1, [x20,#8]
 205a7d4:	9102a3f8 	add	x24, sp, #0xa8
 205a7d8:	52800002 	mov	w2, #0x0                   	// #0
 205a7dc:	52800021 	mov	w1, #0x1                   	// #1
 205a7e0:	aa1703e0 	mov	x0, x23
 205a7e4:	a90df3f5 	stp	x21, x28, [sp,#216]
 205a7e8:	f90077f8 	str	x24, [sp,#232]
 205a7ec:	97fffa4d 	bl	2059120 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x859298>
 205a7f0:	52800022 	mov	w2, #0x1                   	// #1
 205a7f4:	52800041 	mov	w1, #0x2                   	// #2
 205a7f8:	aa1703e0 	mov	x0, x23
 205a7fc:	97fffa49 	bl	2059120 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x859298>
 205a800:	52800042 	mov	w2, #0x2                   	// #2
 205a804:	52800061 	mov	w1, #0x3                   	// #3
 205a808:	aa1703e0 	mov	x0, x23
 205a80c:	97fffa45 	bl	2059120 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x859298>
 205a810:	aa1703e0 	mov	x0, x23
 205a814:	52800062 	mov	w2, #0x3                   	// #3
 205a818:	52800081 	mov	w1, #0x4                   	// #4
 205a81c:	97fffa41 	bl	2059120 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x859298>
 205a820:	f94006a1 	ldr	x1, [x21,#8]
 205a824:	f0006d99 	adrp	x25, 2e0d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x84a1a8>
 205a828:	912a1f20 	add	x0, x25, #0xa87
 205a82c:	f940143b 	ldr	x27, [x1,#40]
 205a830:	97fffa22 	bl	20590b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x859230>
 205a834:	8b001003 	add	x3, x0, x0, lsl #4
 205a838:	d2801661 	mov	x1, #0xb3                  	// #179
 205a83c:	f2f12001 	movk	x1, #0x8900, lsl #48
 205a840:	d28d1442 	mov	x2, #0x68a2                	// #26786
 205a844:	8b030c03 	add	x3, x0, x3, lsl #3
 205a848:	f2a7f102 	movk	x2, #0x3f88, lsl #16
 205a84c:	9101a464 	add	x4, x3, #0x69
 205a850:	f2cbadc2 	movk	x2, #0x5d6e, lsl #32
 205a854:	f2e03bc2 	movk	x2, #0x1de, lsl #48
 205a858:	d2801000 	mov	x0, #0x80                  	// #128
 205a85c:	9bc17c83 	umulh	x3, x4, x1
 205a860:	d378fc63 	lsr	x3, x3, #56
 205a864:	9b029063 	msub	x3, x3, x2, x4
