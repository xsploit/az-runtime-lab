
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000a372e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c6d0>:
  a372e8:	39401820 	ldrb	w0, [x1,#6]
  a372ec:	34fff9e0 	cbz	w0, a37228 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c610>
  a372f0:	b9400820 	ldr	w0, [x1,#8]
  a372f4:	34fff9a0 	cbz	w0, a37228 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c610>
  a372f8:	39400044 	ldrb	w4, [x2]
  a372fc:	9103a3f4 	add	x20, sp, #0xe8
  a37300:	f8404043 	ldur	x3, [x2,#4]
  a37304:	91004041 	add	x1, x2, #0x10
  a37308:	91004280 	add	x0, x20, #0x10
  a3730c:	3903a3e4 	strb	w4, [sp,#232]
  a37310:	f80ec3e3 	stur	x3, [sp,#236]
  a37314:	97ffbfc1 	bl	a27218 <_ZSt20__throw_bad_weak_ptrv@@Base+0x11c600>
  a37318:	f90187f7 	str	x23, [sp,#776]
  a3731c:	a9401664 	ldp	x4, x5, [x19]
  a37320:	911003e3 	add	x3, sp, #0x400
  a37324:	79402262 	ldrh	w2, [x19,#16]
  a37328:	91090280 	add	x0, x20, #0x240
  a3732c:	91006261 	add	x1, x19, #0x18
  a37330:	a9311464 	stp	x4, x5, [x3,#-240]
  a37334:	790643e2 	strh	w2, [sp,#800]
  a37338:	94002a68 	bl	a41cd8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1370c0>
  a3733c:	f94002e1 	ldr	x1, [x23]
  a37340:	aa1703e0 	mov	x0, x23
  a37344:	f9401e62 	ldr	x2, [x19,#56]
  a37348:	f901a7e2 	str	x2, [sp,#840]
  a3734c:	b9403262 	ldr	w2, [x19,#48]
  a37350:	f9401421 	ldr	x1, [x1,#40]
  a37354:	b90343e2 	str	w2, [sp,#832]
  a37358:	3940d262 	ldrb	w2, [x19,#52]
  a3735c:	390d13e2 	strb	w2, [sp,#836]
  a37360:	d63f0020 	blr	x1
  a37364:	72001c1f 	tst	w0, #0xff
  a37368:	54000d00 	b.eq	a37508 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c8f0>
  a3736c:	f94002e0 	ldr	x0, [x23]
  a37370:	f9401819 	ldr	x25, [x0,#48]
  a37374:	945fa76b 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
  a37378:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
  a3737c:	9000dce1 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  a37380:	9118e021 	add	x1, x1, #0x638
  a37384:	f9005be1 	str	x1, [sp,#176]
  a37388:	fd005fe0 	str	d0, [sp,#184]
  a3738c:	72001c1f 	tst	w0, #0xff
  a37390:	2f00e400 	movi	d0, #0x0
  a37394:	54000080 	b.eq	a373a4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c78c>
  a37398:	90018d00 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
  a3739c:	394de000 	ldrb	w0, [x0,#888]
  a373a0:	34000d80 	cbz	w0, a37550 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c938>
  a373a4:	f94006e3 	ldr	x3, [x23,#8]
  a373a8:	f9006fff 	str	xzr, [sp,#216]
  a373ac:	d2800102 	mov	x2, #0x8                   	// #8
  a373b0:	d2805101 	mov	x1, #0x288                 	// #648
  a373b4:	aa0303e0 	mov	x0, x3
  a373b8:	fd0063e0 	str	d0, [sp,#192]
  a373bc:	f9400063 	ldr	x3, [x3]
  a373c0:	f9400863 	ldr	x3, [x3,#16]
  a373c4:	d63f0060 	blr	x3
  a373c8:	aa0003f8 	mov	x24, x0
  a373cc:	b4000e20 	cbz	x0, a37590 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c978>
  a373d0:	910082e0 	add	x0, x23, #0x20
  a373d4:	c85ffc15 	ldaxr	x21, [x0]
  a373d8:	910006b5 	add	x21, x21, #0x1
  a373dc:	c801fc15 	stlxr	w1, x21, [x0]
  a373e0:	35ffffa1 	cbnz	w1, a373d4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c7bc>
  a373e4:	aa1803f3 	mov	x19, x24
  a373e8:	97f2de26 	bl	6eec80 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x5e0f0>
  a373ec:	b000e421 	adrp	x1, 26bc000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xf91a8>
  a373f0:	91230021 	add	x1, x1, #0x8c0
  a373f4:	b9000b00 	str	w0, [x24,#8]
  a373f8:	9106e021 	add	x1, x1, #0x1b8
  a373fc:	f9000b15 	str	x21, [x24,#16]
  a37400:	9100a316 	add	x22, x24, #0x28
  a37404:	f8018661 	str	x1, [x19],#24
  a37408:	aa1603e0 	mov	x0, x22
  a3740c:	91004281 	add	x1, x20, #0x10
  a37410:	3943a3e2 	ldrb	w2, [sp,#232]
  a37414:	39006302 	strb	w2, [x24,#24]
  a37418:	f84ec3e2 	ldur	x2, [sp,#236]
  a3741c:	f8004262 	stur	x2, [x19,#4]
  a37420:	97ffbf7e 	bl	a27218 <_ZSt20__throw_bad_weak_ptrv@@Base+0x11c600>
  a37424:	911003e2 	add	x2, sp, #0x400
  a37428:	91090315 	add	x21, x24, #0x240
  a3742c:	f94187e0 	ldr	x0, [sp,#776]
  a37430:	f9011260 	str	x0, [x19,#544]
  a37434:	91090281 	add	x1, x20, #0x240
  a37438:	91096300 	add	x0, x24, #0x258
  a3743c:	a9710c42 	ldp	x2, x3, [x2,#-240]
  a37440:	a9000ea2 	stp	x2, x3, [x21]
  a37444:	794643e2 	ldrh	w2, [sp,#800]
  a37448:	7904a302 	strh	w2, [x24,#592]
  a3744c:	94002a23 	bl	a41cd8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1370c0>
  a37450:	394d13e0 	ldrb	w0, [sp,#836]
  a37454:	b00188f3 	adrp	x19, 3b54000 <stdout@@GLIBC_2.17+0x12f40>
  a37458:	b94343e1 	ldr	w1, [sp,#832]
  a3745c:	91282273 	add	x19, x19, #0xa08
  a37460:	b90032a1 	str	w1, [x21,#48]
  a37464:	91050276 	add	x22, x19, #0x140
  a37468:	3900d2a0 	strb	w0, [x21,#52]
  a3746c:	f941a7e0 	ldr	x0, [sp,#840]
  a37470:	f9013f00 	str	x0, [x24,#632]
  a37474:	08dffec0 	ldarb	w0, [x22]
  a37478:	36000700 	tbz	w0, #0, a37558 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c940>
  a3747c:	91052273 	add	x19, x19, #0x148
  a37480:	885ffe60 	ldaxr	w0, [x19]
  a37484:	11000400 	add	w0, w0, #0x1
  a37488:	8801fe60 	stlxr	w1, w0, [x19]
  a3748c:	35ffffa1 	cbnz	w1, a37480 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c868>
  a37490:	9102c3e0 	add	x0, sp, #0xb0
  a37494:	97f22e39 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
  a37498:	aa1803e1 	mov	x1, x24
  a3749c:	aa1703e0 	mov	x0, x23
  a374a0:	d63f0320 	blr	x25
  a374a4:	b4000360 	cbz	x0, a37510 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c8f8>
  a374a8:	f9400ee0 	ldr	x0, [x23,#24]
  a374ac:	b4000320 	cbz	x0, a37510 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c8f8>
  a374b0:	945fa71c 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
  a374b4:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
  a374b8:	9000dce1 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  a374bc:	91196021 	add	x1, x1, #0x658
  a374c0:	f9003fe1 	str	x1, [sp,#120]
  a374c4:	fd0043e0 	str	d0, [sp,#128]
  a374c8:	72001c1f 	tst	w0, #0xff
  a374cc:	2f00e400 	movi	d0, #0x0
  a374d0:	54000080 	b.eq	a374e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c8c8>
  a374d4:	90018d00 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
  a374d8:	394de000 	ldrb	w0, [x0,#888]
  a374dc:	34000ac0 	cbz	w0, a37634 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12ca1c>
  a374e0:	f9400ee1 	ldr	x1, [x23,#24]
  a374e4:	f90053ff 	str	xzr, [sp,#160]
  a374e8:	fd0047e0 	str	d0, [sp,#136]
  a374ec:	aa0103e0 	mov	x0, x1
  a374f0:	f9400021 	ldr	x1, [x1]
  a374f4:	f9400821 	ldr	x1, [x1,#16]
  a374f8:	d63f0020 	blr	x1
  a374fc:	9101e3e0 	add	x0, sp, #0x78
  a37500:	97f22e1e 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
  a37504:	14000003 	b	a37510 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c8f8>
  a37508:	aa1403e0 	mov	x0, x20
  a3750c:	97ffe8e5 	bl	a318a0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126c88>
  a37510:	f94197e0 	ldr	x0, [sp,#808]
  a37514:	f9419be1 	ldr	x1, [sp,#816]
  a37518:	eb01001f 	cmp	x0, x1
  a3751c:	54000040 	b.eq	a37524 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c90c>
  a37520:	f9019be0 	str	x0, [sp,#816]
  a37524:	b4000040 	cbz	x0, a3752c <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c914>
  a37528:	97e7b64a 	bl	424e50 <_ZdlPv@plt>
  a3752c:	91004280 	add	x0, x20, #0x10
  a37530:	97ff4522 	bl	a089b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0xfdda0>
  a37534:	a9407bfd 	ldp	x29, x30, [sp]
  a37538:	a94153f3 	ldp	x19, x20, [sp,#16]
  a3753c:	a9425bf5 	ldp	x21, x22, [sp,#32]
  a37540:	a94363f7 	ldp	x23, x24, [sp,#48]
  a37544:	f94023f9 	ldr	x25, [sp,#64]
  a37548:	910d43ff 	add	sp, sp, #0x350
  a3754c:	d65f03c0 	ret
  a37550:	9463dc68 	bl	232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a65d8>
  a37554:	17ffff94 	b	a373a4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c78c>
  a37558:	aa1603e0 	mov	x0, x22
  a3755c:	97e7bb41 	bl	426260 <__cxa_guard_acquire@plt>
  a37560:	34fff8e0 	cbz	w0, a3747c <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c864>
  a37564:	b9014a7f 	str	wzr, [x19,#328]
  a37568:	aa1603e0 	mov	x0, x22
  a3756c:	91052275 	add	x21, x19, #0x148
  a37570:	97e7bcb4 	bl	426840 <__cxa_guard_release@plt>
  a37574:	aa1503e1 	mov	x1, x21
  a37578:	f0018762 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  a3757c:	f0ffff80 	adrp	x0, a2a000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x11f3e8>
  a37580:	9135a042 	add	x2, x2, #0xd68
  a37584:	910a6000 	add	x0, x0, #0x298
  a37588:	97e7be4a 	bl	426eb0 <__cxa_atexit@plt>
  a3758c:	17ffffbc 	b	a3747c <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c864>
  a37590:	d000dc41 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a37594:	910183e0 	add	x0, sp, #0x60
  a37598:	9136a021 	add	x1, x1, #0xda8
  a3759c:	9463f1d1 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a375a0:	b000e421 	adrp	x1, 26bc000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xf91a8>
  a375a4:	9101a3f5 	add	x21, sp, #0x68
  a375a8:	91230021 	add	x1, x1, #0x8c0
  a375ac:	aa1503e8 	mov	x8, x21
  a375b0:	91248021 	add	x1, x1, #0x920
  a375b4:	910183e0 	add	x0, sp, #0x60
  a375b8:	9463718e 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a375bc:	9101c3f3 	add	x19, sp, #0x70
  a375c0:	9000eca1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a375c4:	aa1303e8 	mov	x8, x19
  a375c8:	91366021 	add	x1, x1, #0xd98
  a375cc:	aa1503e0 	mov	x0, x21
  a375d0:	94637188 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a375d4:	b000dec1 	adrp	x1, 2610000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x4d1a8>
  a375d8:	910163e0 	add	x0, sp, #0x58
  a375dc:	9108a021 	add	x1, x1, #0x228
  a375e0:	9463f1c0 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a375e4:	9101e3f6 	add	x22, sp, #0x78
  a375e8:	910163e1 	add	x1, sp, #0x58
  a375ec:	aa1603e8 	mov	x8, x22
  a375f0:	aa1303e0 	mov	x0, x19
  a375f4:	94637127 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a375f8:	52800022 	mov	w2, #0x1                   	// #1
  a375fc:	52800001 	mov	w1, #0x0                   	// #0
