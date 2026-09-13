
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000a6d308 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1626f0>:
  a6d308:	a9a97bfd 	stp	x29, x30, [sp,#-368]!
  a6d30c:	910003fd 	mov	x29, sp
  a6d310:	a90153f3 	stp	x19, x20, [sp,#16]
  a6d314:	aa0403f3 	mov	x19, x4
  a6d318:	b201f3e4 	mov	x4, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
  a6d31c:	a90573fb 	stp	x27, x28, [sp,#80]
  a6d320:	2a0103fc 	mov	w28, w1
  a6d324:	f2955564 	movk	x4, #0xaaab
  a6d328:	a9402468 	ldp	x8, x9, [x3]
  a6d32c:	a9025bf5 	stp	x21, x22, [sp,#32]
  a6d330:	aa0003f6 	mov	x22, x0
  a6d334:	a9408663 	ldp	x3, x1, [x19,#8]
  a6d338:	b9007fe2 	str	w2, [sp,#124]
  a6d33c:	79400262 	ldrh	w2, [x19]
  a6d340:	aa0503f4 	mov	x20, x5
  a6d344:	b90073e2 	str	w2, [sp,#112]
  a6d348:	a90363f7 	stp	x23, x24, [sp,#48]
  a6d34c:	aa0603f7 	mov	x23, x6
  a6d350:	cb030020 	sub	x0, x1, x3
  a6d354:	a91327e8 	stp	x8, x9, [sp,#304]
  a6d358:	9342fc02 	asr	x2, x0, #2
  a6d35c:	fd0033e8 	str	d8, [sp,#96]
  a6d360:	9b047c42 	mul	x2, x2, x4
  a6d364:	b40029c2 	cbz	x2, a6d89c <_ZSt20__throw_bad_weak_ptrv@@Base+0x162c84>
  a6d368:	a9046bf9 	stp	x25, x26, [sp,#64]
  a6d36c:	b200f3e1 	mov	x1, #0x5555555555555555    	// #6148914691236517205
  a6d370:	f2e2aaa1 	movk	x1, #0x1555, lsl #48
  a6d374:	eb01005f 	cmp	x2, x1
  a6d378:	54004c88 	b.hi	a6dd08 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1630f0>
  a6d37c:	97e6de71 	bl	424d40 <_Znwm@plt>
  a6d380:	aa0003f5 	mov	x21, x0
  a6d384:	a9408663 	ldp	x3, x1, [x19,#8]
  a6d388:	eb03003f 	cmp	x1, x3
  a6d38c:	54002900 	b.eq	a6d8ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x162c94>
  a6d390:	aa0303e0 	mov	x0, x3
  a6d394:	aa1503e2 	mov	x2, x21
  a6d398:	f9400004 	ldr	x4, [x0]
  a6d39c:	f9000044 	str	x4, [x2]
  a6d3a0:	91003000 	add	x0, x0, #0xc
  a6d3a4:	91003042 	add	x2, x2, #0xc
  a6d3a8:	b85fc004 	ldur	w4, [x0,#-4]
  a6d3ac:	eb00003f 	cmp	x1, x0
  a6d3b0:	b81fc044 	stur	w4, [x2,#-4]
  a6d3b4:	54ffff21 	b.ne	a6d398 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162780>
  a6d3b8:	d1003033 	sub	x19, x1, #0xc
  a6d3bc:	d2955561 	mov	x1, #0xaaab                	// #43691
  a6d3c0:	cb030273 	sub	x19, x19, x3
  a6d3c4:	f2b55541 	movk	x1, #0xaaaa, lsl #16
  a6d3c8:	f2d55541 	movk	x1, #0xaaaa, lsl #32
  a6d3cc:	d342fe73 	lsr	x19, x19, #2
  a6d3d0:	f2e55541 	movk	x1, #0x2aaa, lsl #48
  a6d3d4:	9b017e73 	mul	x19, x19, x1
  a6d3d8:	9240f673 	and	x19, x19, #0x3fffffffffffffff
  a6d3dc:	91000673 	add	x19, x19, #0x1
  a6d3e0:	8b130673 	add	x19, x19, x19, lsl #1
  a6d3e4:	8b130ab3 	add	x19, x21, x19, lsl #2
  a6d3e8:	394002e1 	ldrb	w1, [x23]
  a6d3ec:	b90087e1 	str	w1, [sp,#132]
  a6d3f0:	b9400281 	ldr	w1, [x20]
  a6d3f4:	f94002c0 	ldr	x0, [x22]
  a6d3f8:	b90083e1 	str	w1, [sp,#128]
  a6d3fc:	f940181a 	ldr	x26, [x0,#48]
  a6d400:	945ecf48 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
  a6d404:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
  a6d408:	d000db21 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  a6d40c:	9118e021 	add	x1, x1, #0x638
  a6d410:	f9007be1 	str	x1, [sp,#240]
  a6d414:	fd007fe0 	str	d0, [sp,#248]
  a6d418:	72001c1f 	tst	w0, #0xff
  a6d41c:	2f00e400 	movi	d0, #0x0
  a6d420:	54000fa1 	b.ne	a6d614 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1629fc>
  a6d424:	f94006c3 	ldr	x3, [x22,#8]
  a6d428:	f9008fff 	str	xzr, [sp,#280]
  a6d42c:	d2800102 	mov	x2, #0x8                   	// #8
  a6d430:	d2800d01 	mov	x1, #0x68                  	// #104
  a6d434:	aa0303e0 	mov	x0, x3
  a6d438:	fd0083e0 	str	d0, [sp,#256]
  a6d43c:	f9400063 	ldr	x3, [x3]
  a6d440:	f9400863 	ldr	x3, [x3,#16]
  a6d444:	d63f0060 	blr	x3
  a6d448:	aa0003f4 	mov	x20, x0
  a6d44c:	b4003440 	cbz	x0, a6dad4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162ebc>
  a6d450:	910082c0 	add	x0, x22, #0x20
  a6d454:	c85ffc03 	ldaxr	x3, [x0]
  a6d458:	91000463 	add	x3, x3, #0x1
  a6d45c:	c801fc03 	stlxr	w1, x3, [x0]
  a6d460:	35ffffa1 	cbnz	w1, a6d454 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16283c>
  a6d464:	900186d7 	adrp	x23, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
  a6d468:	911302f7 	add	x23, x23, #0x4c0
  a6d46c:	08dffee0 	ldarb	w0, [x23]
  a6d470:	900186d9 	adrp	x25, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
  a6d474:	36001ca0 	tbz	w0, #0, a6d808 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162bf0>
  a6d478:	cb150278 	sub	x24, x19, x21
  a6d47c:	aa1403f7 	mov	x23, x20
  a6d480:	f000e2e1 	adrp	x1, 26cc000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1091a8>
  a6d484:	b944cb22 	ldr	w2, [x25,#1224]
  a6d488:	9111c03b 	add	x27, x1, #0x470
  a6d48c:	9342ff00 	asr	x0, x24, #2
  a6d490:	b201f3e1 	mov	x1, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
  a6d494:	b9000a82 	str	w2, [x20,#8]
  a6d498:	f2955561 	movk	x1, #0xaaab
  a6d49c:	910ce362 	add	x2, x27, #0x338
  a6d4a0:	f9000a83 	str	x3, [x20,#16]
  a6d4a4:	91010299 	add	x25, x20, #0x40
  a6d4a8:	f80186e2 	str	x2, [x23],#24
  a6d4ac:	9b017c00 	mul	x0, x0, x1
  a6d4b0:	a9530fe2 	ldp	x2, x3, [sp,#304]
  a6d4b4:	f9000e96 	str	x22, [x20,#24]
  a6d4b8:	b9407fe1 	ldr	w1, [sp,#124]
  a6d4bc:	9e6703e8 	fmov	d8, xzr
  a6d4c0:	a9020e82 	stp	x2, x3, [x20,#32]
  a6d4c4:	290306fc 	stp	w28, w1, [x23,#24]
  a6d4c8:	7940e3e1 	ldrh	w1, [sp,#112]
  a6d4cc:	79007281 	strh	w1, [x20,#56]
  a6d4d0:	f900229f 	str	xzr, [x20,#64]
  a6d4d4:	a900ff3f 	stp	xzr, xzr, [x25,#8]
  a6d4d8:	b4000100 	cbz	x0, a6d4f8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1628e0>
  a6d4dc:	b200f3e1 	mov	x1, #0x5555555555555555    	// #6148914691236517205
  a6d4e0:	f2e2aaa1 	movk	x1, #0x1555, lsl #48
  a6d4e4:	eb01001f 	cmp	x0, x1
  a6d4e8:	54004128 	b.hi	a6dd0c <_ZSt20__throw_bad_weak_ptrv@@Base+0x1630f4>
  a6d4ec:	aa1803e0 	mov	x0, x24
  a6d4f0:	97e6de14 	bl	424d40 <_Znwm@plt>
  a6d4f4:	9e670008 	fmov	d8, x0
  a6d4f8:	9e670300 	fmov	d0, x24
  a6d4fc:	eb1302bf 	cmp	x21, x19
  a6d500:	4e080501 	dup	v1.2d, v8.d[0]
  a6d504:	5ee08500 	add	d0, d8, d0
  a6d508:	3d801281 	str	q1, [x20,#64]
  a6d50c:	fd000b20 	str	d0, [x25,#16]
  a6d510:	54000240 	b.eq	a6d558 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162940>
  a6d514:	cb150262 	sub	x2, x19, x21
  a6d518:	d2955573 	mov	x19, #0xaaab                	// #43691
  a6d51c:	d1003042 	sub	x2, x2, #0xc
  a6d520:	f2b55553 	movk	x19, #0xaaaa, lsl #16
  a6d524:	f2d55553 	movk	x19, #0xaaaa, lsl #32
  a6d528:	9e660100 	fmov	x0, d8
  a6d52c:	d342fc42 	lsr	x2, x2, #2
  a6d530:	f2e55553 	movk	x19, #0x2aaa, lsl #48
  a6d534:	aa1503e1 	mov	x1, x21
  a6d538:	9b137c42 	mul	x2, x2, x19
  a6d53c:	9240f442 	and	x2, x2, #0x3fffffffffffffff
  a6d540:	91000442 	add	x2, x2, #0x1
  a6d544:	8b020442 	add	x2, x2, x2, lsl #1
  a6d548:	d37ef442 	lsl	x2, x2, #2
  a6d54c:	9e670040 	fmov	d0, x2
  a6d550:	5ee08508 	add	d8, d8, d0
  a6d554:	97e6dd0b 	bl	424980 <memcpy@plt>
  a6d558:	b94083e0 	ldr	w0, [sp,#128]
  a6d55c:	b0018753 	adrp	x19, 3b56000 <stdout@@GLIBC_2.17+0x14f40>
  a6d560:	fd000728 	str	d8, [x25,#8]
  a6d564:	9100e273 	add	x19, x19, #0x38
  a6d568:	b90042e0 	str	w0, [x23,#64]
  a6d56c:	91008278 	add	x24, x19, #0x20
  a6d570:	394213e0 	ldrb	w0, [sp,#132]
  a6d574:	390112e0 	strb	w0, [x23,#68]
  a6d578:	08dfff00 	ldarb	w0, [x24]
  a6d57c:	36001740 	tbz	w0, #0, a6d864 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162c4c>
  a6d580:	9100a273 	add	x19, x19, #0x28
  a6d584:	885ffe60 	ldaxr	w0, [x19]
  a6d588:	11000400 	add	w0, w0, #0x1
  a6d58c:	8801fe60 	stlxr	w1, w0, [x19]
  a6d590:	35ffffa1 	cbnz	w1, a6d584 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16296c>
  a6d594:	fd4083e0 	ldr	d0, [sp,#256]
  a6d598:	1e602008 	fcmp	d0, #0.0
  a6d59c:	540010e1 	b.ne	a6d7b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162ba0>
  a6d5a0:	f9408fe3 	ldr	x3, [sp,#280]
  a6d5a4:	b40000a3 	cbz	x3, a6d5b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1629a0>
  a6d5a8:	910423e1 	add	x1, sp, #0x108
  a6d5ac:	52800062 	mov	w2, #0x3                   	// #3
  a6d5b0:	aa0103e0 	mov	x0, x1
  a6d5b4:	d63f0060 	blr	x3
  a6d5b8:	d0ffe100 	adrp	x0, 68f000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x1ad28>
  a6d5bc:	91368000 	add	x0, x0, #0xda0
  a6d5c0:	eb00035f 	cmp	x26, x0
  a6d5c4:	54000ba1 	b.ne	a6d738 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162b20>
  a6d5c8:	f94016c0 	ldr	x0, [x22,#40]
  a6d5cc:	b4002320 	cbz	x0, a6da30 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162e18>
  a6d5d0:	f9400002 	ldr	x2, [x0]
  a6d5d4:	aa1403e1 	mov	x1, x20
  a6d5d8:	f9401842 	ldr	x2, [x2,#48]
  a6d5dc:	d63f0040 	blr	x2
  a6d5e0:	aa0003f3 	mov	x19, x0
  a6d5e4:	b5000220 	cbnz	x0, a6d628 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162a10>
  a6d5e8:	b4000075 	cbz	x21, a6d5f4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1629dc>
  a6d5ec:	aa1503e0 	mov	x0, x21
  a6d5f0:	97e6de18 	bl	424e50 <_ZdlPv@plt>
  a6d5f4:	a94153f3 	ldp	x19, x20, [sp,#16]
  a6d5f8:	a9425bf5 	ldp	x21, x22, [sp,#32]
  a6d5fc:	a94363f7 	ldp	x23, x24, [sp,#48]
  a6d600:	a9446bf9 	ldp	x25, x26, [sp,#64]
  a6d604:	a94573fb 	ldp	x27, x28, [sp,#80]
  a6d608:	fd4033e8 	ldr	d8, [sp,#96]
  a6d60c:	a8d77bfd 	ldp	x29, x30, [sp],#368
  a6d610:	d65f03c0 	ret
  a6d614:	d0018b40 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
  a6d618:	394de000 	ldrb	w0, [x0,#888]
  a6d61c:	35fff040 	cbnz	w0, a6d424 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16280c>
  a6d620:	94630434 	bl	232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a65d8>
  a6d624:	17ffff80 	b	a6d424 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16280c>
  a6d628:	b940c2c2 	ldr	w2, [x22,#192]
  a6d62c:	910312c0 	add	x0, x22, #0xc4
  a6d630:	885ffc01 	ldaxr	w1, [x0]
  a6d634:	11000421 	add	w1, w1, #0x1
  a6d638:	8803fc01 	stlxr	w3, w1, [x0]
  a6d63c:	35ffffa3 	cbnz	w3, a6d630 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162a18>
  a6d640:	6b01005f 	cmp	w2, w1
  a6d644:	9102e2c4 	add	x4, x22, #0xb8
  a6d648:	5400168d 	b.le	a6d918 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162d00>
  a6d64c:	c8dffc80 	ldar	x0, [x4]
  a6d650:	f9005be0 	str	x0, [sp,#176]
  a6d654:	f9405be0 	ldr	x0, [sp,#176]
  a6d658:	f240bc1f 	tst	x0, #0xffffffffffff
  a6d65c:	540034e0 	b.eq	a6dcf8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1630e0>
  a6d660:	f9405be0 	ldr	x0, [sp,#176]
  a6d664:	f9405be2 	ldr	x2, [sp,#176]
  a6d668:	9240bc00 	and	x0, x0, #0xffffffffffff
  a6d66c:	f9400001 	ldr	x1, [x0]
  a6d670:	f9405be0 	ldr	x0, [sp,#176]
  a6d674:	9240bc21 	and	x1, x1, #0xffffffffffff
  a6d678:	d370fc00 	lsr	x0, x0, #48
  a6d67c:	11000400 	add	w0, w0, #0x1
  a6d680:	b3503c01 	bfi	x1, x0, #48, #16
  a6d684:	c85ffc80 	ldaxr	x0, [x4]
  a6d688:	eb02001f 	cmp	x0, x2
  a6d68c:	54000061 	b.ne	a6d698 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162a80>
  a6d690:	c803fc81 	stlxr	w3, x1, [x4]
  a6d694:	7100007f 	cmp	w3, #0x0
  a6d698:	54fffdc1 	b.ne	a6d650 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162a38>
  a6d69c:	f9405be0 	ldr	x0, [sp,#176]
  a6d6a0:	9240bc00 	and	x0, x0, #0xffffffffffff
  a6d6a4:	b4000520 	cbz	x0, a6d748 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162b30>
  a6d6a8:	f9000413 	str	x19, [x0,#8]
  a6d6ac:	f9400001 	ldr	x1, [x0]
  a6d6b0:	d370fc21 	lsr	x1, x1, #48
  a6d6b4:	d2800002 	mov	x2, #0x0                   	// #0
  a6d6b8:	11000421 	add	w1, w1, #0x1
  a6d6bc:	b3503c22 	bfi	x2, x1, #48, #16
  a6d6c0:	c89ffc02 	stlr	x2, [x0]
  a6d6c4:	9101e2c3 	add	x3, x22, #0x78
  a6d6c8:	9103c3f4 	add	x20, sp, #0xf0
  a6d6cc:	c8dffc61 	ldar	x1, [x3]
  a6d6d0:	f9005fe1 	str	x1, [sp,#184]
  a6d6d4:	f9405fe1 	ldr	x1, [sp,#184]
  a6d6d8:	9240bc21 	and	x1, x1, #0xffffffffffff
  a6d6dc:	c8dffc22 	ldar	x2, [x1]
  a6d6e0:	f9007be2 	str	x2, [sp,#240]
  a6d6e4:	f9407be2 	ldr	x2, [sp,#240]
  a6d6e8:	9240bc42 	and	x2, x2, #0xffffffffffff
  a6d6ec:	c8dffc64 	ldar	x4, [x3]
  a6d6f0:	f9405fe5 	ldr	x5, [sp,#184]
  a6d6f4:	eb0400bf 	cmp	x5, x4
  a6d6f8:	54fffea1 	b.ne	a6d6cc <_ZSt20__throw_bad_weak_ptrv@@Base+0x162ab4>
  a6d6fc:	b5002702 	cbnz	x2, a6dbdc <_ZSt20__throw_bad_weak_ptrv@@Base+0x162fc4>
  a6d700:	f9407be2 	ldr	x2, [sp,#240]
  a6d704:	aa0003e4 	mov	x4, x0
  a6d708:	f9400285 	ldr	x5, [x20]
  a6d70c:	d370fc42 	lsr	x2, x2, #48
  a6d710:	11000442 	add	w2, w2, #0x1
  a6d714:	b3503c44 	bfi	x4, x2, #48, #16
  a6d718:	c85ffc22 	ldaxr	x2, [x1]
  a6d71c:	eb05005f 	cmp	x2, x5
  a6d720:	54000061 	b.ne	a6d72c <_ZSt20__throw_bad_weak_ptrv@@Base+0x162b14>
  a6d724:	c806fc24 	stlxr	w6, x4, [x1]
  a6d728:	710000df 	cmp	w6, #0x0
  a6d72c:	54001680 	b.eq	a6d9fc <_ZSt20__throw_bad_weak_ptrv@@Base+0x162de4>
  a6d730:	f9000282 	str	x2, [x20]
  a6d734:	17ffffe6 	b	a6d6cc <_ZSt20__throw_bad_weak_ptrv@@Base+0x162ab4>
  a6d738:	aa1403e1 	mov	x1, x20
  a6d73c:	aa1603e0 	mov	x0, x22
  a6d740:	d63f0340 	blr	x26
  a6d744:	b4fff520 	cbz	x0, a6d5e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1629d0>
  a6d748:	f9400ec0 	ldr	x0, [x22,#24]
  a6d74c:	b4fff4e0 	cbz	x0, a6d5e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1629d0>
  a6d750:	945ece74 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
  a6d754:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
  a6d758:	d000db21 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  a6d75c:	91196021 	add	x1, x1, #0x658
  a6d760:	f9005fe1 	str	x1, [sp,#184]
  a6d764:	fd0063e0 	str	d0, [sp,#192]
  a6d768:	72001c1f 	tst	w0, #0xff
  a6d76c:	2f00e400 	movi	d0, #0x0
  a6d770:	54000a21 	b.ne	a6d8b4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162c9c>
  a6d774:	f9400ec1 	ldr	x1, [x22,#24]
  a6d778:	f90073ff 	str	xzr, [sp,#224]
  a6d77c:	fd0067e0 	str	d0, [sp,#200]
  a6d780:	aa0103e0 	mov	x0, x1
  a6d784:	f9400021 	ldr	x1, [x1]
  a6d788:	f9400821 	ldr	x1, [x1,#16]
  a6d78c:	d63f0020 	blr	x1
  a6d790:	fd4067e0 	ldr	d0, [sp,#200]
  a6d794:	1e602008 	fcmp	d0, #0.0
  a6d798:	54000981 	b.ne	a6d8c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162cb0>
  a6d79c:	f94073e3 	ldr	x3, [sp,#224]
  a6d7a0:	b4fff243 	cbz	x3, a6d5e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1629d0>
  a6d7a4:	910343e1 	add	x1, sp, #0xd0
  a6d7a8:	52800062 	mov	w2, #0x3                   	// #3
  a6d7ac:	aa0103e0 	mov	x0, x1
  a6d7b0:	d63f0060 	blr	x3
  a6d7b4:	17ffff8d 	b	a6d5e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1629d0>
  a6d7b8:	946303ce 	bl	232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a65d8>
  a6d7bc:	6d4fa3e1 	ldp	d1, d8, [sp,#248]
  a6d7c0:	1e683808 	fsub	d8, d0, d8
  a6d7c4:	1e612110 	fcmpe	d8, d1
  a6d7c8:	54ffeecd 	b.le	a6d5a0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162988>
  a6d7cc:	f9407bf3 	ldr	x19, [sp,#240]
  a6d7d0:	b4001d73 	cbz	x19, a6db7c <_ZSt20__throw_bad_weak_ptrv@@Base+0x162f64>
  a6d7d4:	9102e3e8 	add	x8, sp, #0xb8
  a6d7d8:	945ec406 	bl	221e7f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x966d8>
  a6d7dc:	9102e3e0 	add	x0, sp, #0xb8
  a6d7e0:	9462b0f8 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
  a6d7e4:	1e604100 	fmov	d0, d8
  a6d7e8:	aa0003e2 	mov	x2, x0
  a6d7ec:	aa1303e1 	mov	x1, x19
  a6d7f0:	d000db20 	adrp	x0, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  a6d7f4:	91186000 	add	x0, x0, #0x618
  a6d7f8:	945e4b76 	bl	22005d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x784b8>
  a6d7fc:	9102e3e0 	add	x0, sp, #0xb8
  a6d800:	94623b80 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6d804:	17ffff67 	b	a6d5a0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162988>
  a6d808:	aa1703e0 	mov	x0, x23
  a6d80c:	f90047e3 	str	x3, [sp,#136]
  a6d810:	97e6e294 	bl	426260 <__cxa_guard_acquire@plt>
  a6d814:	900186d9 	adrp	x25, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
  a6d818:	f94047e3 	ldr	x3, [sp,#136]
  a6d81c:	34ffe2e0 	cbz	w0, a6d478 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162860>
  a6d820:	900186b9 	adrp	x25, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  a6d824:	9124e339 	add	x25, x25, #0x938
  a6d828:	08dfff20 	ldarb	w0, [x25]
  a6d82c:	36002120 	tbz	w0, #0, a6dc50 <_ZSt20__throw_bad_weak_ptrv@@Base+0x163038>
  a6d830:	900186b8 	adrp	x24, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  a6d834:	91250318 	add	x24, x24, #0x940
  a6d838:	f90047e3 	str	x3, [sp,#136]
  a6d83c:	885fff01 	ldaxr	w1, [x24]
  a6d840:	11000421 	add	w1, w1, #0x1
  a6d844:	8800ff01 	stlxr	w0, w1, [x24]
  a6d848:	35ffffa0 	cbnz	w0, a6d83c <_ZSt20__throw_bad_weak_ptrv@@Base+0x162c24>
  a6d84c:	900186d9 	adrp	x25, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
  a6d850:	aa1703e0 	mov	x0, x23
  a6d854:	b904cb21 	str	w1, [x25,#1224]
  a6d858:	97e6e3fa 	bl	426840 <__cxa_guard_release@plt>
  a6d85c:	f94047e3 	ldr	x3, [sp,#136]
  a6d860:	17ffff06 	b	a6d478 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162860>
  a6d864:	aa1803e0 	mov	x0, x24
  a6d868:	97e6e27e 	bl	426260 <__cxa_guard_acquire@plt>
  a6d86c:	34ffe8a0 	cbz	w0, a6d580 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162968>
  a6d870:	b9002a7f 	str	wzr, [x19,#40]
  a6d874:	aa1803e0 	mov	x0, x24
  a6d878:	9100a277 	add	x23, x19, #0x28
  a6d87c:	97e6e3f1 	bl	426840 <__cxa_guard_release@plt>
  a6d880:	aa1703e1 	mov	x1, x23
  a6d884:	b00185c2 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  a6d888:	d0ffffe0 	adrp	x0, a6b000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1603e8>
  a6d88c:	9135a042 	add	x2, x2, #0xd68
  a6d890:	91238000 	add	x0, x0, #0x8e0
  a6d894:	97e6e587 	bl	426eb0 <__cxa_atexit@plt>
  a6d898:	17ffff3a 	b	a6d580 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162968>
  a6d89c:	a9046bf9 	stp	x25, x26, [sp,#64]
  a6d8a0:	d2800015 	mov	x21, #0x0                   	// #0
  a6d8a4:	eb03003f 	cmp	x1, x3
  a6d8a8:	54ffd741 	b.ne	a6d390 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162778>
  a6d8ac:	aa1503f3 	mov	x19, x21
  a6d8b0:	17fffece 	b	a6d3e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1627d0>
  a6d8b4:	d0018b40 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
  a6d8b8:	394de000 	ldrb	w0, [x0,#888]
  a6d8bc:	35fff5c0 	cbnz	w0, a6d774 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162b5c>
  a6d8c0:	9463038c 	bl	232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a65d8>
  a6d8c4:	17ffffac 	b	a6d774 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162b5c>
  a6d8c8:	9463038a 	bl	232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a65d8>
  a6d8cc:	6d4c23e1 	ldp	d1, d8, [sp,#192]
  a6d8d0:	1e683808 	fsub	d8, d0, d8
  a6d8d4:	1e612110 	fcmpe	d8, d1
  a6d8d8:	54fff62d 	b.le	a6d79c <_ZSt20__throw_bad_weak_ptrv@@Base+0x162b84>
  a6d8dc:	f9405ff3 	ldr	x19, [sp,#184]
  a6d8e0:	b4001dd3 	cbz	x19, a6dc98 <_ZSt20__throw_bad_weak_ptrv@@Base+0x163080>
  a6d8e4:	9103c3e8 	add	x8, sp, #0xf0
  a6d8e8:	945ec3c2 	bl	221e7f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x966d8>
  a6d8ec:	9103c3e0 	add	x0, sp, #0xf0
  a6d8f0:	9462b0b4 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
  a6d8f4:	1e604100 	fmov	d0, d8
  a6d8f8:	aa0003e2 	mov	x2, x0
  a6d8fc:	aa1303e1 	mov	x1, x19
  a6d900:	d000db20 	adrp	x0, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  a6d904:	91186000 	add	x0, x0, #0x618
  a6d908:	945e4b32 	bl	22005d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x784b8>
  a6d90c:	9103c3e0 	add	x0, sp, #0xf0
  a6d910:	94623b3c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6d914:	17ffffa2 	b	a6d79c <_ZSt20__throw_bad_weak_ptrv@@Base+0x162b84>
  a6d918:	9100e2c3 	add	x3, x22, #0x38
  a6d91c:	9101e2c5 	add	x5, x22, #0x78
  a6d920:	c8dffc60 	ldar	x0, [x3]
  a6d924:	f9005be0 	str	x0, [sp,#176]
  a6d928:	f9405be0 	ldr	x0, [sp,#176]
  a6d92c:	c8dffca1 	ldar	x1, [x5]
  a6d930:	9240bc00 	and	x0, x0, #0xffffffffffff
  a6d934:	f9005fe1 	str	x1, [sp,#184]
  a6d938:	c8dffc00 	ldar	x0, [x0]
  a6d93c:	9240bc00 	and	x0, x0, #0xffffffffffff
  a6d940:	c8dffc61 	ldar	x1, [x3]
  a6d944:	f9405be2 	ldr	x2, [sp,#176]
  a6d948:	eb01005f 	cmp	x2, x1
  a6d94c:	54fffea1 	b.ne	a6d920 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162d08>
  a6d950:	f9405be2 	ldr	x2, [sp,#176]
  a6d954:	f9405fe1 	ldr	x1, [sp,#184]
  a6d958:	9240bc42 	and	x2, x2, #0xffffffffffff
  a6d95c:	9240bc21 	and	x1, x1, #0xffffffffffff
  a6d960:	eb01005f 	cmp	x2, x1
  a6d964:	54001560 	b.eq	a6dc10 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162ff8>
  a6d968:	b4fffdc0 	cbz	x0, a6d920 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162d08>
  a6d96c:	f9405be1 	ldr	x1, [sp,#176]
  a6d970:	f9405be2 	ldr	x2, [sp,#176]
  a6d974:	d370fc21 	lsr	x1, x1, #48
  a6d978:	11000421 	add	w1, w1, #0x1
  a6d97c:	b3503c20 	bfi	x0, x1, #48, #16
  a6d980:	c85ffc61 	ldaxr	x1, [x3]
  a6d984:	eb02003f 	cmp	x1, x2
  a6d988:	54000061 	b.ne	a6d994 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162d7c>
  a6d98c:	c806fc60 	stlxr	w6, x0, [x3]
  a6d990:	710000df 	cmp	w6, #0x0
  a6d994:	540015a1 	b.ne	a6dc48 <_ZSt20__throw_bad_weak_ptrv@@Base+0x163030>
  a6d998:	f9405be1 	ldr	x1, [sp,#176]
  a6d99c:	9240bc21 	and	x1, x1, #0xffffffffffff
  a6d9a0:	c8dffc80 	ldar	x0, [x4]
  a6d9a4:	9103c3f4 	add	x20, sp, #0xf0
  a6d9a8:	f9007be0 	str	x0, [sp,#240]
  a6d9ac:	f9407be3 	ldr	x3, [sp,#240]
  a6d9b0:	aa0103e2 	mov	x2, x1
  a6d9b4:	f9407be0 	ldr	x0, [sp,#240]
  a6d9b8:	d370fc63 	lsr	x3, x3, #48
  a6d9bc:	9240bc00 	and	x0, x0, #0xffffffffffff
  a6d9c0:	b3503c62 	bfi	x2, x3, #48, #16
  a6d9c4:	9240bc45 	and	x5, x2, #0xffffffffffff
  a6d9c8:	f94000a3 	ldr	x3, [x5]
  a6d9cc:	d370fc63 	lsr	x3, x3, #48
  a6d9d0:	b3503c60 	bfi	x0, x3, #48, #16
  a6d9d4:	f90000a0 	str	x0, [x5]
  a6d9d8:	f9400280 	ldr	x0, [x20]
  a6d9dc:	c85ffc83 	ldaxr	x3, [x4]
  a6d9e0:	eb00007f 	cmp	x3, x0
  a6d9e4:	54000061 	b.ne	a6d9f0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162dd8>
  a6d9e8:	c805fc82 	stlxr	w5, x2, [x4]
  a6d9ec:	710000bf 	cmp	w5, #0x0
  a6d9f0:	54ffe2e0 	b.eq	a6d64c <_ZSt20__throw_bad_weak_ptrv@@Base+0x162a34>
  a6d9f4:	f9000283 	str	x3, [x20]
  a6d9f8:	17ffffed 	b	a6d9ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x162d94>
  a6d9fc:	f9405fe1 	ldr	x1, [sp,#184]
  a6da00:	f9405fe2 	ldr	x2, [sp,#184]
  a6da04:	d370fc21 	lsr	x1, x1, #48
  a6da08:	11000421 	add	w1, w1, #0x1
  a6da0c:	b3503c20 	bfi	x0, x1, #48, #16
  a6da10:	c85ffc61 	ldaxr	x1, [x3]
  a6da14:	eb02003f 	cmp	x1, x2
  a6da18:	54000061 	b.ne	a6da24 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162e0c>
  a6da1c:	c804fc60 	stlxr	w4, x0, [x3]
  a6da20:	35ffff84 	cbnz	w4, a6da10 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162df8>
  a6da24:	54ffe920 	b.eq	a6d748 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162b30>
  a6da28:	f9005fe1 	str	x1, [sp,#184]
  a6da2c:	17ffff47 	b	a6d748 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162b30>
  a6da30:	9102a3f3 	add	x19, sp, #0xa8
  a6da34:	9000daa1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a6da38:	aa1303e0 	mov	x0, x19
  a6da3c:	9136a021 	add	x1, x1, #0xda8
  a6da40:	946318a8 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a6da44:	9102e3f7 	add	x23, sp, #0xb8
  a6da48:	910fc361 	add	x1, x27, #0x3f0
  a6da4c:	aa1703e8 	mov	x8, x23
  a6da50:	aa1303e0 	mov	x0, x19
  a6da54:	94629867 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a6da58:	9102c3f9 	add	x25, sp, #0xb0
  a6da5c:	d000eae1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a6da60:	aa1903e8 	mov	x8, x25
  a6da64:	91366021 	add	x1, x1, #0xd98
  a6da68:	aa1703e0 	mov	x0, x23
  a6da6c:	94629861 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a6da70:	9103c3f4 	add	x20, sp, #0xf0
  a6da74:	d000dac1 	adrp	x1, 25c7000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x41a8>
  a6da78:	aa1403e0 	mov	x0, x20
  a6da7c:	912de021 	add	x1, x1, #0xb78
  a6da80:	94631898 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a6da84:	910283f8 	add	x24, sp, #0xa0
  a6da88:	aa1403e1 	mov	x1, x20
  a6da8c:	aa1803e8 	mov	x8, x24
  a6da90:	aa1903e0 	mov	x0, x25
  a6da94:	946297ff 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a6da98:	52800022 	mov	w2, #0x1                   	// #1
  a6da9c:	52800001 	mov	w1, #0x0                   	// #0
  a6daa0:	aa1803e0 	mov	x0, x24
  a6daa4:	945e4a4f 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a6daa8:	aa1803e0 	mov	x0, x24
  a6daac:	94623ad5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dab0:	aa1403e0 	mov	x0, x20
  a6dab4:	94623ad3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dab8:	aa1903e0 	mov	x0, x25
  a6dabc:	94623ad1 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dac0:	aa1703e0 	mov	x0, x23
  a6dac4:	94623acf 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dac8:	aa1303e0 	mov	x0, x19
  a6dacc:	94623acd 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dad0:	17fffec6 	b	a6d5e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1629d0>
  a6dad4:	910283f8 	add	x24, sp, #0xa0
  a6dad8:	9000daa1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a6dadc:	aa1803e0 	mov	x0, x24
  a6dae0:	9136a021 	add	x1, x1, #0xda8
  a6dae4:	9463187f 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a6dae8:	f000e2e1 	adrp	x1, 26cc000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1091a8>
  a6daec:	9102a3f3 	add	x19, sp, #0xa8
  a6daf0:	9111c03b 	add	x27, x1, #0x470
  a6daf4:	aa1303e8 	mov	x8, x19
  a6daf8:	911b8361 	add	x1, x27, #0x6e0
  a6dafc:	aa1803e0 	mov	x0, x24
  a6db00:	9462983c 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a6db04:	9102c3f9 	add	x25, sp, #0xb0
  a6db08:	d000eae1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a6db0c:	aa1903e8 	mov	x8, x25
  a6db10:	91366021 	add	x1, x1, #0xd98
  a6db14:	aa1303e0 	mov	x0, x19
  a6db18:	94629836 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a6db1c:	f000dd01 	adrp	x1, 2610000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x4d1a8>
  a6db20:	910263e0 	add	x0, sp, #0x98
  a6db24:	9108a021 	add	x1, x1, #0x228
  a6db28:	9463186e 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a6db2c:	9102e3f7 	add	x23, sp, #0xb8
  a6db30:	910263e1 	add	x1, sp, #0x98
  a6db34:	aa1703e8 	mov	x8, x23
  a6db38:	aa1903e0 	mov	x0, x25
  a6db3c:	946297d5 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a6db40:	52800022 	mov	w2, #0x1                   	// #1
  a6db44:	52800001 	mov	w1, #0x0                   	// #0
  a6db48:	aa1703e0 	mov	x0, x23
  a6db4c:	945e4a25 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a6db50:	aa1703e0 	mov	x0, x23
  a6db54:	94623aab 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6db58:	910263e0 	add	x0, sp, #0x98
  a6db5c:	94623aa9 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6db60:	aa1903e0 	mov	x0, x25
  a6db64:	94623aa7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6db68:	aa1303e0 	mov	x0, x19
  a6db6c:	94623aa5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6db70:	aa1803e0 	mov	x0, x24
  a6db74:	94623aa3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6db78:	17fffe87 	b	a6d594 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16297c>
  a6db7c:	f9408fe0 	ldr	x0, [sp,#280]
  a6db80:	b4000c80 	cbz	x0, a6dd10 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1630f8>
  a6db84:	f94093e1 	ldr	x1, [sp,#288]
  a6db88:	9102c3e8 	add	x8, sp, #0xb0
  a6db8c:	910423e0 	add	x0, sp, #0x108
  a6db90:	d63f0020 	blr	x1
  a6db94:	9102c3e0 	add	x0, sp, #0xb0
  a6db98:	9462b00a 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
  a6db9c:	9102e3e8 	add	x8, sp, #0xb8
  a6dba0:	f9003be0 	str	x0, [sp,#112]
  a6dba4:	945ec313 	bl	221e7f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x966d8>
  a6dba8:	9102e3e0 	add	x0, sp, #0xb8
  a6dbac:	9462b005 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
  a6dbb0:	1e604100 	fmov	d0, d8
  a6dbb4:	f9403be1 	ldr	x1, [sp,#112]
  a6dbb8:	aa0003e2 	mov	x2, x0
  a6dbbc:	d000db20 	adrp	x0, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  a6dbc0:	91186000 	add	x0, x0, #0x618
  a6dbc4:	945e4a83 	bl	22005d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x784b8>
  a6dbc8:	9102e3e0 	add	x0, sp, #0xb8
  a6dbcc:	94623a8d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dbd0:	9102c3e0 	add	x0, sp, #0xb0
  a6dbd4:	94623a8b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dbd8:	17fffe72 	b	a6d5a0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162988>
  a6dbdc:	f9405fe1 	ldr	x1, [sp,#184]
  a6dbe0:	f9405fe4 	ldr	x4, [sp,#184]
  a6dbe4:	d370fc21 	lsr	x1, x1, #48
  a6dbe8:	11000421 	add	w1, w1, #0x1
  a6dbec:	b3503c22 	bfi	x2, x1, #48, #16
  a6dbf0:	c85ffc61 	ldaxr	x1, [x3]
  a6dbf4:	eb04003f 	cmp	x1, x4
  a6dbf8:	54000061 	b.ne	a6dc04 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162fec>
  a6dbfc:	c805fc62 	stlxr	w5, x2, [x3]
  a6dc00:	35ffff85 	cbnz	w5, a6dbf0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162fd8>
  a6dc04:	54ffd640 	b.eq	a6d6cc <_ZSt20__throw_bad_weak_ptrv@@Base+0x162ab4>
  a6dc08:	f9005fe1 	str	x1, [sp,#184]
  a6dc0c:	17fffeb0 	b	a6d6cc <_ZSt20__throw_bad_weak_ptrv@@Base+0x162ab4>
  a6dc10:	b4ffd1e0 	cbz	x0, a6d64c <_ZSt20__throw_bad_weak_ptrv@@Base+0x162a34>
  a6dc14:	f9405fe1 	ldr	x1, [sp,#184]
  a6dc18:	f9405fe2 	ldr	x2, [sp,#184]
  a6dc1c:	d370fc21 	lsr	x1, x1, #48
  a6dc20:	11000421 	add	w1, w1, #0x1
  a6dc24:	b3503c20 	bfi	x0, x1, #48, #16
  a6dc28:	c85ffca1 	ldaxr	x1, [x5]
  a6dc2c:	eb02003f 	cmp	x1, x2
  a6dc30:	54000061 	b.ne	a6dc3c <_ZSt20__throw_bad_weak_ptrv@@Base+0x163024>
  a6dc34:	c806fca0 	stlxr	w6, x0, [x5]
  a6dc38:	35ffff86 	cbnz	w6, a6dc28 <_ZSt20__throw_bad_weak_ptrv@@Base+0x163010>
  a6dc3c:	54ffe720 	b.eq	a6d920 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162d08>
  a6dc40:	f9005fe1 	str	x1, [sp,#184]
  a6dc44:	17ffff37 	b	a6d920 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162d08>
  a6dc48:	f9005be1 	str	x1, [sp,#176]
  a6dc4c:	17ffff35 	b	a6d920 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162d08>
  a6dc50:	aa1903e0 	mov	x0, x25
  a6dc54:	f90047e3 	str	x3, [sp,#136]
  a6dc58:	97e6e182 	bl	426260 <__cxa_guard_acquire@plt>
  a6dc5c:	900186a1 	adrp	x1, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  a6dc60:	91250038 	add	x24, x1, #0x940
  a6dc64:	f94047e3 	ldr	x3, [sp,#136]
  a6dc68:	34ffde80 	cbz	w0, a6d838 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162c20>
  a6dc6c:	b909403f 	str	wzr, [x1,#2368]
  a6dc70:	aa1903e0 	mov	x0, x25
  a6dc74:	97e6e2f3 	bl	426840 <__cxa_guard_release@plt>
  a6dc78:	b00185c2 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  a6dc7c:	d0ffe060 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  a6dc80:	9135a042 	add	x2, x2, #0xd68
  a6dc84:	9107a000 	add	x0, x0, #0x1e8
  a6dc88:	aa1803e1 	mov	x1, x24
  a6dc8c:	97e6e489 	bl	426eb0 <__cxa_atexit@plt>
  a6dc90:	f94047e3 	ldr	x3, [sp,#136]
  a6dc94:	17fffee9 	b	a6d838 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162c20>
  a6dc98:	f94073e0 	ldr	x0, [sp,#224]
  a6dc9c:	b40003c0 	cbz	x0, a6dd14 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1630fc>
  a6dca0:	f94077e1 	ldr	x1, [sp,#232]
  a6dca4:	9102c3e8 	add	x8, sp, #0xb0
  a6dca8:	910343e0 	add	x0, sp, #0xd0
  a6dcac:	d63f0020 	blr	x1
  a6dcb0:	9102c3e0 	add	x0, sp, #0xb0
  a6dcb4:	9462afc3 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
  a6dcb8:	9103c3e8 	add	x8, sp, #0xf0
  a6dcbc:	f9003be0 	str	x0, [sp,#112]
  a6dcc0:	945ec2cc 	bl	221e7f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x966d8>
  a6dcc4:	9103c3e0 	add	x0, sp, #0xf0
  a6dcc8:	9462afbe 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
  a6dccc:	1e604100 	fmov	d0, d8
  a6dcd0:	f9403be1 	ldr	x1, [sp,#112]
  a6dcd4:	aa0003e2 	mov	x2, x0
  a6dcd8:	d000db20 	adrp	x0, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  a6dcdc:	91186000 	add	x0, x0, #0x618
  a6dce0:	945e4a3c 	bl	22005d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x784b8>
  a6dce4:	9103c3e0 	add	x0, sp, #0xf0
  a6dce8:	94623a46 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dcec:	9102c3e0 	add	x0, sp, #0xb0
  a6dcf0:	94623a44 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dcf4:	17fffeaa 	b	a6d79c <_ZSt20__throw_bad_weak_ptrv@@Base+0x162b84>
  a6dcf8:	d2800800 	mov	x0, #0x40                  	// #64
  a6dcfc:	97e6dc11 	bl	424d40 <_Znwm@plt>
  a6dd00:	b5ffcd40 	cbnz	x0, a6d6a8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162a90>
  a6dd04:	17fffe91 	b	a6d748 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162b30>
  a6dd08:	97e6e03e 	bl	425e00 <_ZSt17__throw_bad_allocv@plt>
  a6dd0c:	97e6e03d 	bl	425e00 <_ZSt17__throw_bad_allocv@plt>
  a6dd10:	97e6def8 	bl	4258f0 <_ZSt25__throw_bad_function_callv@plt>
  a6dd14:	97e6def7 	bl	4258f0 <_ZSt25__throw_bad_function_callv@plt>
  a6dd18:	aa0003f4 	mov	x20, x0
  a6dd1c:	aa1703e0 	mov	x0, x23
  a6dd20:	94623a38 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dd24:	aa1303e0 	mov	x0, x19
  a6dd28:	aa1403f3 	mov	x19, x20
  a6dd2c:	94623a35 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dd30:	b4000075 	cbz	x21, a6dd3c <_ZSt20__throw_bad_weak_ptrv@@Base+0x163124>
  a6dd34:	aa1503e0 	mov	x0, x21
  a6dd38:	97e6dc46 	bl	424e50 <_ZdlPv@plt>
  a6dd3c:	aa1303e0 	mov	x0, x19
  a6dd40:	97e6dbf4 	bl	424d10 <_Unwind_Resume@plt>
  a6dd44:	aa0003f4 	mov	x20, x0
  a6dd48:	17fffff7 	b	a6dd24 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16310c>
  a6dd4c:	aa0003f3 	mov	x19, x0
  a6dd50:	aa1803e0 	mov	x0, x24
  a6dd54:	94623a2b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dd58:	9103c3e0 	add	x0, sp, #0xf0
  a6dd5c:	97f15407 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
  a6dd60:	b5fffeb5 	cbnz	x21, a6dd34 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16311c>
  a6dd64:	17fffff6 	b	a6dd3c <_ZSt20__throw_bad_weak_ptrv@@Base+0x163124>
  a6dd68:	aa0003f6 	mov	x22, x0
  a6dd6c:	14000004 	b	a6dd7c <_ZSt20__throw_bad_weak_ptrv@@Base+0x163164>
  a6dd70:	aa0003f6 	mov	x22, x0
  a6dd74:	aa1803e0 	mov	x0, x24
  a6dd78:	94623a22 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dd7c:	aa1403e0 	mov	x0, x20
  a6dd80:	aa1603f4 	mov	x20, x22
  a6dd84:	94623a1f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dd88:	aa1903e0 	mov	x0, x25
  a6dd8c:	94623a1d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dd90:	17ffffe3 	b	a6dd1c <_ZSt20__throw_bad_weak_ptrv@@Base+0x163104>
  a6dd94:	aa0003f4 	mov	x20, x0
  a6dd98:	17fffffc 	b	a6dd88 <_ZSt20__throw_bad_weak_ptrv@@Base+0x163170>
  a6dd9c:	aa0003f3 	mov	x19, x0
  a6dda0:	17ffffee 	b	a6dd58 <_ZSt20__throw_bad_weak_ptrv@@Base+0x163140>
  a6dda4:	aa0003f3 	mov	x19, x0
  a6dda8:	b9000a9f 	str	wzr, [x20,#8]
  a6ddac:	17ffffeb 	b	a6dd58 <_ZSt20__throw_bad_weak_ptrv@@Base+0x163140>
  a6ddb0:	aa0003f3 	mov	x19, x0
  a6ddb4:	b5fffc15 	cbnz	x21, a6dd34 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16311c>
  a6ddb8:	17ffffe1 	b	a6dd3c <_ZSt20__throw_bad_weak_ptrv@@Base+0x163124>
  a6ddbc:	aa0003f3 	mov	x19, x0
  a6ddc0:	9102e3e0 	add	x0, sp, #0xb8
  a6ddc4:	97f153ed 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
  a6ddc8:	b5fffb75 	cbnz	x21, a6dd34 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16311c>
  a6ddcc:	17ffffdc 	b	a6dd3c <_ZSt20__throw_bad_weak_ptrv@@Base+0x163124>
  a6ddd0:	aa0003f4 	mov	x20, x0
  a6ddd4:	aa1703e0 	mov	x0, x23
  a6ddd8:	94623a0a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dddc:	910263e0 	add	x0, sp, #0x98
  a6dde0:	94623a08 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6dde4:	aa1903e0 	mov	x0, x25
  a6dde8:	94623a06 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6ddec:	aa1303e0 	mov	x0, x19
  a6ddf0:	aa1403f3 	mov	x19, x20
  a6ddf4:	94623a03 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6ddf8:	17ffffd6 	b	a6dd50 <_ZSt20__throw_bad_weak_ptrv@@Base+0x163138>
  a6ddfc:	aa0003f4 	mov	x20, x0
  a6de00:	17fffff7 	b	a6dddc <_ZSt20__throw_bad_weak_ptrv@@Base+0x1631c4>
  a6de04:	aa0003f4 	mov	x20, x0
  a6de08:	17fffff7 	b	a6dde4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1631cc>
  a6de0c:	aa0003f4 	mov	x20, x0
  a6de10:	17fffff7 	b	a6ddec <_ZSt20__throw_bad_weak_ptrv@@Base+0x1631d4>
  a6de14:	d503201f 	nop
