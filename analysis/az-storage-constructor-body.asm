
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021ba470 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x32358>:
 21ba470:	9100a279 	add	x25, x19, #0x28
 21ba474:	f9000e7f 	str	xzr, [x19,#24]
 21ba478:	aa1903e0 	mov	x0, x25
 21ba47c:	3900827f 	strb	wzr, [x19,#32]
 21ba480:	91016278 	add	x24, x19, #0x58
 21ba484:	9405c627 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 21ba488:	f0003e81 	adrp	x1, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 21ba48c:	910223e0 	add	x0, sp, #0x88
 21ba490:	913c0021 	add	x1, x1, #0xf00
 21ba494:	9405e613 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21ba498:	910243e4 	add	x4, sp, #0x90
 21ba49c:	52808003 	mov	w3, #0x400                 	// #1024
 21ba4a0:	52817702 	mov	w2, #0xbb8                 	// #3000
 21ba4a4:	910223e1 	add	x1, sp, #0x88
 21ba4a8:	aa1803e0 	mov	x0, x24
 21ba4ac:	a9097fff 	stp	xzr, xzr, [sp,#144]
 21ba4b0:	94014df4 	bl	220dc80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x85b68>
 21ba4b4:	f9404ff4 	ldr	x20, [sp,#152]
 21ba4b8:	b4000174 	cbz	x20, 21ba4e4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x323cc>
 21ba4bc:	d00064e0 	adrp	x0, 2e58000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8951a8>
 21ba4c0:	f9433c15 	ldr	x21, [x0,#1656]
 21ba4c4:	b4000b75 	cbz	x21, 21ba630 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x32518>
 21ba4c8:	91002281 	add	x1, x20, #0x8
 21ba4cc:	885ffc20 	ldaxr	w0, [x1]
 21ba4d0:	51000402 	sub	w2, w0, #0x1
 21ba4d4:	8803fc22 	stlxr	w3, w2, [x1]
 21ba4d8:	35ffffa3 	cbnz	w3, 21ba4cc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x323b4>
 21ba4dc:	7100041f 	cmp	w0, #0x1
 21ba4e0:	54000b20 	b.eq	21ba644 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3252c>
 21ba4e4:	910d6275 	add	x21, x19, #0x358
 21ba4e8:	910223e0 	add	x0, sp, #0x88
 21ba4ec:	94050845 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21ba4f0:	f901a27f 	str	xzr, [x19,#832]
 21ba4f4:	d00064e7 	adrp	x7, 2e58000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8951a8>
 21ba4f8:	911340e7 	add	x7, x7, #0x4d0
 21ba4fc:	d00064e6 	adrp	x6, 2e58000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8951a8>
 21ba500:	911460c6 	add	x6, x6, #0x518
 21ba504:	d00064e5 	adrp	x5, 2e58000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8951a8>
 21ba508:	911500a5 	add	x5, x5, #0x540
 21ba50c:	d00064e4 	adrp	x4, 2e58000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8951a8>
 21ba510:	91174084 	add	x4, x4, #0x5d0
 21ba514:	d00064e3 	adrp	x3, 2e58000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8951a8>
 21ba518:	9117e063 	add	x3, x3, #0x5f8
 21ba51c:	d00064e2 	adrp	x2, 2e58000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8951a8>
 21ba520:	91188042 	add	x2, x2, #0x620
 21ba524:	d00064e1 	adrp	x1, 2e58000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8951a8>
 21ba528:	91198021 	add	x1, x1, #0x660
 21ba52c:	a9001a67 	stp	x7, x6, [x19]
 21ba530:	f9002e65 	str	x5, [x19,#88]
 21ba534:	f9004264 	str	x4, [x19,#128]
 21ba538:	f9004a63 	str	x3, [x19,#144]
 21ba53c:	f9018a62 	str	x2, [x19,#784]
 21ba540:	f9019e61 	str	x1, [x19,#824]
 21ba544:	b9034a7f 	str	wzr, [x19,#840]
 21ba548:	b903527f 	str	wzr, [x19,#848]
 21ba54c:	f901ae7f 	str	xzr, [x19,#856]
 21ba550:	b90012bf 	str	wzr, [x21,#16]
 21ba554:	b9000abf 	str	wzr, [x21,#8]
 21ba558:	b94012f4 	ldr	w20, [x23,#16]
 21ba55c:	b90012b4 	str	w20, [x21,#16]
 21ba560:	7100029f 	cmp	w20, #0x0
 21ba564:	540002c0 	b.eq	21ba5bc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x324a4>
 21ba568:	54000bed 	b.le	21ba6e4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x325cc>
 21ba56c:	937c7e80 	sbfiz	x0, x20, #4, #32
 21ba570:	9789aa98 	bl	424fd0 <malloc@plt>
 21ba574:	f901ae60 	str	x0, [x19,#856]
 21ba578:	d280001b 	mov	x27, #0x0                   	// #0
 21ba57c:	b9000ab4 	str	w20, [x21,#8]
 21ba580:	14000002 	b	21ba588 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x32470>
 21ba584:	f941ae60 	ldr	x0, [x19,#856]
 21ba588:	d37cef61 	lsl	x1, x27, #4
 21ba58c:	f94002fa 	ldr	x26, [x23]
 21ba590:	8b010014 	add	x20, x0, x1
 21ba594:	aa1403e0 	mov	x0, x20
 21ba598:	9100077b 	add	x27, x27, #0x1
 21ba59c:	8b01035a 	add	x26, x26, x1
 21ba5a0:	aa1a03e1 	mov	x1, x26
 21ba5a4:	940553e3 	bl	230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187418>
 21ba5a8:	b94012a0 	ldr	w0, [x21,#16]
 21ba5ac:	b9400b41 	ldr	w1, [x26,#8]
 21ba5b0:	b9000a81 	str	w1, [x20,#8]
 21ba5b4:	6b1b001f 	cmp	w0, w27
 21ba5b8:	54fffe6c 	b.gt	21ba584 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3246c>
 21ba5bc:	aa1c03e1 	mov	x1, x28
 21ba5c0:	910dc277 	add	x23, x19, #0x370
 21ba5c4:	aa1703e0 	mov	x0, x23
 21ba5c8:	940553da 	bl	230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187418>
 21ba5cc:	9e660101 	fmov	x1, d8
 21ba5d0:	910de27a 	add	x26, x19, #0x378
 21ba5d4:	aa1a03e0 	mov	x0, x26
 21ba5d8:	910e027b 	add	x27, x19, #0x380
 21ba5dc:	910e4274 	add	x20, x19, #0x390
 21ba5e0:	910e227c 	add	x28, x19, #0x388
 21ba5e4:	940553d3 	bl	230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187418>
 21ba5e8:	9e660121 	fmov	x1, d9
 21ba5ec:	aa1b03e0 	mov	x0, x27
 21ba5f0:	940553d0 	bl	230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187418>
 21ba5f4:	9e660141 	fmov	x1, d10
 21ba5f8:	aa1c03e0 	mov	x0, x28
 21ba5fc:	940553cd 	bl	230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187418>
 21ba600:	f9000a9f 	str	xzr, [x20,#16]
 21ba604:	910ce260 	add	x0, x19, #0x338
 21ba608:	97ff4afe 	bl	218d200 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x50e8>
 21ba60c:	a94153f3 	ldp	x19, x20, [sp,#16]
 21ba610:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21ba614:	a94363f7 	ldp	x23, x24, [sp,#48]
 21ba618:	a9446bf9 	ldp	x25, x26, [sp,#64]
 21ba61c:	a94573fb 	ldp	x27, x28, [sp,#80]
 21ba620:	6d4627e8 	ldp	d8, d9, [sp,#96]
 21ba624:	fd403bea 	ldr	d10, [sp,#112]
 21ba628:	a8ca7bfd 	ldp	x29, x30, [sp],#160
 21ba62c:	d65f03c0 	ret
 21ba630:	b9400a80 	ldr	w0, [x20,#8]
 21ba634:	51000401 	sub	w1, w0, #0x1
 21ba638:	b9000a81 	str	w1, [x20,#8]
 21ba63c:	7100041f 	cmp	w0, #0x1
 21ba640:	54fff521 	b.ne	21ba4e4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x323cc>
 21ba644:	f9400281 	ldr	x1, [x20]
 21ba648:	aa1403e0 	mov	x0, x20
 21ba64c:	f9400821 	ldr	x1, [x1,#16]
 21ba650:	d63f0020 	blr	x1
 21ba654:	b4000415 	cbz	x21, 21ba6d4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x325bc>
 21ba658:	91003281 	add	x1, x20, #0xc
 21ba65c:	885ffc20 	ldaxr	w0, [x1]
 21ba660:	51000402 	sub	w2, w0, #0x1
 21ba664:	8803fc22 	stlxr	w3, w2, [x1]
 21ba668:	35ffffa3 	cbnz	w3, 21ba65c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x32544>
 21ba66c:	7100041f 	cmp	w0, #0x1
 21ba670:	54fff3a1 	b.ne	21ba4e4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x323cc>
 21ba674:	f9400281 	ldr	x1, [x20]
 21ba678:	aa1403e0 	mov	x0, x20
 21ba67c:	f9400c21 	ldr	x1, [x1,#24]
 21ba680:	d63f0020 	blr	x1
 21ba684:	17ffff98 	b	21ba4e4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x323cc>
