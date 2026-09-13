
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002212460 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a348>:
 2212460:	d10083ff 	sub	sp, sp, #0x20
 2212464:	91010005 	add	x5, x0, #0x40
 2212468:	c8dffc02 	ldar	x2, [x0]
 221246c:	f90007e2 	str	x2, [sp,#8]
 2212470:	f94007e2 	ldr	x2, [sp,#8]
 2212474:	c8dffca3 	ldar	x3, [x5]
 2212478:	9240bc42 	and	x2, x2, #0xffffffffffff
 221247c:	f9000be3 	str	x3, [sp,#16]
 2212480:	c8dffc42 	ldar	x2, [x2]
 2212484:	9240bc42 	and	x2, x2, #0xffffffffffff
 2212488:	c8dffc03 	ldar	x3, [x0]
 221248c:	f94007e4 	ldr	x4, [sp,#8]
 2212490:	eb03009f 	cmp	x4, x3
 2212494:	54fffea1 	b.ne	2212468 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a350>
 2212498:	f94007e3 	ldr	x3, [sp,#8]
 221249c:	f9400be4 	ldr	x4, [sp,#16]
 22124a0:	9240bc63 	and	x3, x3, #0xffffffffffff
 22124a4:	9240bc84 	and	x4, x4, #0xffffffffffff
 22124a8:	eb03009f 	cmp	x4, x3
 22124ac:	54000560 	b.eq	2212558 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a440>
 22124b0:	aa0203e4 	mov	x4, x2
 22124b4:	b4fffda2 	cbz	x2, 2212468 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a350>
 22124b8:	f94007e3 	ldr	x3, [sp,#8]
 22124bc:	f9400442 	ldr	x2, [x2,#8]
 22124c0:	f9000022 	str	x2, [x1]
 22124c4:	d370fc62 	lsr	x2, x3, #48
 22124c8:	11000442 	add	w2, w2, #0x1
 22124cc:	f94007e3 	ldr	x3, [sp,#8]
 22124d0:	b3503c44 	bfi	x4, x2, #48, #16
 22124d4:	c85ffc02 	ldaxr	x2, [x0]
 22124d8:	eb03005f 	cmp	x2, x3
 22124dc:	54000061 	b.ne	22124e8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a3d0>
 22124e0:	c806fc04 	stlxr	w6, x4, [x0]
 22124e4:	710000df 	cmp	w6, #0x0
 22124e8:	540005a1 	b.ne	221259c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a484>
 22124ec:	f94007e4 	ldr	x4, [sp,#8]
 22124f0:	91020001 	add	x1, x0, #0x80
 22124f4:	9240bc84 	and	x4, x4, #0xffffffffffff
 22124f8:	c8dffc20 	ldar	x0, [x1]
 22124fc:	f9000fe0 	str	x0, [sp,#24]
 2212500:	f9400fe3 	ldr	x3, [sp,#24]
 2212504:	aa0403e2 	mov	x2, x4
 2212508:	f9400fe0 	ldr	x0, [sp,#24]
 221250c:	d370fc63 	lsr	x3, x3, #48
 2212510:	9240bc00 	and	x0, x0, #0xffffffffffff
 2212514:	b3503c62 	bfi	x2, x3, #48, #16
 2212518:	9240bc45 	and	x5, x2, #0xffffffffffff
 221251c:	f94000a3 	ldr	x3, [x5]
 2212520:	d370fc63 	lsr	x3, x3, #48
 2212524:	b3503c60 	bfi	x0, x3, #48, #16
 2212528:	f90000a0 	str	x0, [x5]
 221252c:	f9400fe0 	ldr	x0, [sp,#24]
 2212530:	c85ffc23 	ldaxr	x3, [x1]
 2212534:	eb00007f 	cmp	x3, x0
 2212538:	54000061 	b.ne	2212544 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a42c>
 221253c:	c805fc22 	stlxr	w5, x2, [x1]
 2212540:	710000bf 	cmp	w5, #0x0
 2212544:	1a9f17e0 	cset	w0, eq
 2212548:	34000260 	cbz	w0, 2212594 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a47c>
 221254c:	34fffda0 	cbz	w0, 2212500 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a3e8>
 2212550:	910083ff 	add	sp, sp, #0x20
 2212554:	d65f03c0 	ret
 2212558:	aa0203e3 	mov	x3, x2
 221255c:	b4000242 	cbz	x2, 22125a4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a48c>
 2212560:	f9400be2 	ldr	x2, [sp,#16]
 2212564:	f9400be4 	ldr	x4, [sp,#16]
 2212568:	d370fc42 	lsr	x2, x2, #48
 221256c:	11000442 	add	w2, w2, #0x1
 2212570:	b3503c43 	bfi	x3, x2, #48, #16
 2212574:	c85ffca2 	ldaxr	x2, [x5]
 2212578:	eb04005f 	cmp	x2, x4
 221257c:	54000061 	b.ne	2212588 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a470>
 2212580:	c806fca3 	stlxr	w6, x3, [x5]
 2212584:	35ffff86 	cbnz	w6, 2212574 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a45c>
 2212588:	54fff700 	b.eq	2212468 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a350>
 221258c:	f9000be2 	str	x2, [sp,#16]
 2212590:	17ffffb6 	b	2212468 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a350>
 2212594:	f9000fe3 	str	x3, [sp,#24]
 2212598:	17ffffed 	b	221254c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a434>
 221259c:	f90007e2 	str	x2, [sp,#8]
 22125a0:	17ffffb2 	b	2212468 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a350>
 22125a4:	52800000 	mov	w0, #0x0                   	// #0
 22125a8:	17ffffea 	b	2212550 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a438>
 22125ac:	00000000 	.inst	0x00000000 ; undefined
 22125b0:	a9b97bfd 	stp	x29, x30, [sp,#-112]!
 22125b4:	910003fd 	mov	x29, sp
 22125b8:	a90153f3 	stp	x19, x20, [sp,#16]
 22125bc:	aa0003f3 	mov	x19, x0
 22125c0:	a9046bf9 	stp	x25, x26, [sp,#64]
 22125c4:	91006019 	add	x25, x0, #0x18
 22125c8:	12001c3a 	and	w26, w1, #0xff
 22125cc:	940618cd 	bl	2398900 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x234e0>
 22125d0:	aa1903e0 	mov	x0, x25
 22125d4:	94060bcb 	bl	2395500 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x200e0>
 22125d8:	b00062a1 	adrp	x1, 2e67000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a41a8>
 22125dc:	912ec021 	add	x1, x1, #0xbb0
 22125e0:	a9025bf5 	stp	x21, x22, [sp,#32]
 22125e4:	b00062a0 	adrp	x0, 2e67000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a41a8>
 22125e8:	912f6000 	add	x0, x0, #0xbd8
 22125ec:	f9000261 	str	x1, [x19]
 22125f0:	91008275 	add	x21, x19, #0x20
 22125f4:	f9000e60 	str	x0, [x19,#24]
 22125f8:	d2800400 	mov	x0, #0x20                  	// #32
 22125fc:	f90033ff 	str	xzr, [sp,#96]
 2212600:	978849d0 	bl	424d40 <_Znwm@plt>
 2212604:	aa0003f4 	mov	x20, x0
 2212608:	b0001da0 	adrp	x0, 25c7000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x41a8>
 221260c:	911c6000 	add	x0, x0, #0x718
 2212610:	a90363f7 	stp	x23, x24, [sp,#48]
 2212614:	91004297 	add	x23, x20, #0x10
 2212618:	b20003e1 	mov	x1, #0x100000001           	// #4294967297
 221261c:	a9000680 	stp	x0, x1, [x20]
 2212620:	9000c996 	adrp	x22, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 2212624:	913862d6 	add	x22, x22, #0xe18
 2212628:	f9000a9f 	str	xzr, [x20,#16]
 221262c:	f9002bfb 	str	x27, [sp,#80]
 2212630:	b9000aff 	str	wzr, [x23,#8]
 2212634:	08dffec0 	ldarb	w0, [x22]
 2212638:	9000c998 	adrp	x24, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 221263c:	36000e80 	tbz	w0, #0, 221280c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a6f4>
 2212640:	f00062a1 	adrp	x1, 2e69000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a61a8>
 2212644:	b94e2302 	ldr	w2, [x24,#3616]
 2212648:	b00062a0 	adrp	x0, 2e67000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a41a8>
 221264c:	91292000 	add	x0, x0, #0xa48
 2212650:	f9455421 	ldr	x1, [x1,#2728]
 2212654:	b0001db6 	adrp	x22, 25c7000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x41a8>
 2212658:	910ca2d6 	add	x22, x22, #0x328
 221265c:	f9000a80 	str	x0, [x20,#16]
 2212660:	b9001a82 	str	w2, [x20,#24]
 2212664:	a9025e76 	stp	x22, x23, [x19,#32]
 2212668:	f9001a74 	str	x20, [x19,#48]
 221266c:	b4000e21 	cbz	x1, 2212830 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a718>
 2212670:	91002280 	add	x0, x20, #0x8
 2212674:	885ffc01 	ldaxr	w1, [x0]
 2212678:	11000421 	add	w1, w1, #0x1
 221267c:	8802fc01 	stlxr	w2, w1, [x0]
 2212680:	35ffffa2 	cbnz	w2, 2212674 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a55c>
 2212684:	f9000ebf 	str	xzr, [x21,#24]
 2212688:	b00062a0 	adrp	x0, 2e67000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a41a8>
 221268c:	912b2000 	add	x0, x0, #0xac8
