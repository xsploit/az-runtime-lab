
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002220840 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98728>:
 2220840:	b0000000 	adrp	x0, 2221000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98ee8>
 2220844:	911e0000 	add	x0, x0, #0x780
 2220848:	9135a042 	add	x2, x2, #0xd68
 222084c:	97881999 	bl	426eb0 <__cxa_atexit@plt>
 2220850:	a94363f7 	ldp	x23, x24, [sp,#48]
 2220854:	17ffff5a 	b	22205bc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x984a4>
 2220858:	9404ce72 	bl	2354220 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc108>
 222085c:	2a0003e4 	mov	w4, w0
 2220860:	7100001f 	cmp	w0, #0x0
 2220864:	54001f6d 	b.le	2220c50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98b38>
 2220868:	51000400 	sub	w0, w0, #0x1
 222086c:	bd401270 	ldr	s16, [x19,#16]
 2220870:	7100501f 	cmp	w0, #0x14
 2220874:	54001f29 	b.ls	2220c58 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98b40>
 2220878:	90003222 	adrp	x2, 2864000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a11a8>
 222087c:	4e040c92 	dup	v18.4s, w4
 2220880:	4e040606 	dup	v6.4s, v16.s[0]
 2220884:	53027c80 	lsr	w0, w4, #2
 2220888:	4f000404 	movi	v4.4s, #0x0
 222088c:	52800001 	mov	w1, #0x0                   	// #0
 2220890:	3dc1a042 	ldr	q2, [x2,#1664]
 2220894:	4f000491 	movi	v17.4s, #0x4
 2220898:	4f000425 	movi	v5.4s, #0x1
 222089c:	d503201f 	nop
 22208a0:	4f215440 	shl	v0.4s, v2.4s, #1
 22208a4:	11000421 	add	w1, w1, #0x1
 22208a8:	4ea244a7 	sshl	v7.4s, v5.4s, v2.4s
 22208ac:	6b01001f 	cmp	w0, w1
 22208b0:	4eb18442 	add	v2.4s, v2.4s, v17.4s
 22208b4:	6eb28400 	sub	v0.4s, v0.4s, v18.4s
 22208b8:	6e205801 	mvn	v1.16b, v0.16b
 22208bc:	4ea58400 	add	v0.4s, v0.4s, v5.4s
 22208c0:	6ea0b821 	neg	v1.4s, v1.4s
 22208c4:	4ea044c3 	sshl	v3.4s, v6.4s, v0.4s
 22208c8:	4ea0a800 	cmlt	v0.4s, v0.4s, #0
 22208cc:	6ea144c1 	ushl	v1.4s, v6.4s, v1.4s
 22208d0:	6e631c20 	bsl	v0.16b, v1.16b, v3.16b
 22208d4:	4e271c00 	and	v0.16b, v0.16b, v7.16b
 22208d8:	4ea01c84 	orr	v4.16b, v4.16b, v0.16b
 22208dc:	54fffe21 	b.ne	22208a0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98788>
 22208e0:	4f000400 	movi	v0.4s, #0x0
 22208e4:	121e7482 	and	w2, w4, #0xfffffffc
 22208e8:	6b04005f 	cmp	w2, w4
 22208ec:	6e004081 	ext	v1.16b, v4.16b, v0.16b, #8
 22208f0:	4ea41c24 	orr	v4.16b, v1.16b, v4.16b
 22208f4:	6e002080 	ext	v0.16b, v4.16b, v0.16b, #4
 22208f8:	4ea41c00 	orr	v0.16b, v0.16b, v4.16b
 22208fc:	0e043c00 	mov	w0, v0.s[0]
 2220900:	54ffebe0 	b.eq	222067c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98564>
 2220904:	531f7841 	lsl	w1, w2, #1
 2220908:	52800026 	mov	w6, #0x1                   	// #1
 222090c:	4b040021 	sub	w1, w1, w4
 2220910:	0b060021 	add	w1, w1, w6
 2220914:	37f80161 	tbnz	w1, #31, 2220940 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98828>
 2220918:	1e260203 	fmov	w3, s16
 222091c:	1ac220c5 	lsl	w5, w6, w2
 2220920:	11000442 	add	w2, w2, #0x1
 2220924:	6b02009f 	cmp	w4, w2
 2220928:	1ac12063 	lsl	w3, w3, w1
 222092c:	0a050063 	and	w3, w3, w5
 2220930:	11000821 	add	w1, w1, #0x2
 2220934:	2a030000 	orr	w0, w0, w3
 2220938:	54ffea2d 	b.le	222067c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98564>
 222093c:	36fffee1 	tbz	w1, #31, 2220918 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98800>
