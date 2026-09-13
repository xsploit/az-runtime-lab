
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002137390 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937508>:
 2137390:	39401280 	ldrb	w0, [x20,#4]
 2137394:	12000c00 	and	w0, w0, #0xf
 2137398:	b9008a60 	str	w0, [x19,#136]
 213739c:	39401280 	ldrb	w0, [x20,#4]
 21373a0:	d3441c00 	ubfx	x0, x0, #4, #4
 21373a4:	b9008e60 	str	w0, [x19,#140]
 21373a8:	a94153f3 	ldp	x19, x20, [sp,#16]
 21373ac:	a8c97bfd 	ldp	x29, x30, [sp],#144
 21373b0:	d65f03c0 	ret
 21373b4:	3941e260 	ldrb	w0, [x19,#120]
 21373b8:	35fff2a0 	cbnz	w0, 213720c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937384>
 21373bc:	a9025bf5 	stp	x21, x22, [sp,#32]
 21373c0:	f9403a75 	ldr	x21, [x19,#112]
 21373c4:	f94006a0 	ldr	x0, [x21,#8]
 21373c8:	b4000160 	cbz	x0, 21373f4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93756c>
 21373cc:	f9400003 	ldr	x3, [x0]
 21373d0:	52800002 	mov	w2, #0x0                   	// #0
 21373d4:	aa1503e1 	mov	x1, x21
 21373d8:	f9401463 	ldr	x3, [x3,#40]
 21373dc:	d63f0060 	blr	x3
 21373e0:	f90006bf 	str	xzr, [x21,#8]
 21373e4:	52800020 	mov	w0, #0x1                   	// #1
 21373e8:	3901e260 	strb	w0, [x19,#120]
 21373ec:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21373f0:	17ffff87 	b	213720c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937384>
 21373f4:	a90363f7 	stp	x23, x24, [sp,#48]
 21373f8:	9101c3f8 	add	x24, sp, #0x70
 21373fc:	aa1803e0 	mov	x0, x24
 2137400:	d0002441 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 2137404:	9136a021 	add	x1, x1, #0xda8
 2137408:	9407f236 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 213740c:	9101e3f6 	add	x22, sp, #0x78
 2137410:	f0006841 	adrp	x1, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2137414:	91214021 	add	x1, x1, #0x850
 2137418:	9132c021 	add	x1, x1, #0xcb0
 213741c:	aa1803e0 	mov	x0, x24
 2137420:	aa1603e8 	mov	x8, x22
 2137424:	940771f3 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2137428:	910203f7 	add	x23, sp, #0x80
 213742c:	900034a1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 2137430:	aa1703e8 	mov	x8, x23
 2137434:	91366021 	add	x1, x1, #0xd98
 2137438:	aa1603e0 	mov	x0, x22
 213743c:	940771ed 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2137440:	f90023f9 	str	x25, [sp,#64]
 2137444:	9101a3f9 	add	x25, sp, #0x68
 2137448:	f00025a1 	adrp	x1, 25ee000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2b1a8>
 213744c:	aa1903e0 	mov	x0, x25
 2137450:	91258021 	add	x1, x1, #0x960
 2137454:	9407f223 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2137458:	910223f5 	add	x21, sp, #0x88
 213745c:	aa1903e1 	mov	x1, x25
 2137460:	aa1503e8 	mov	x8, x21
 2137464:	aa1703e0 	mov	x0, x23
 2137468:	9407718a 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 213746c:	52800022 	mov	w2, #0x1                   	// #1
 2137470:	52800001 	mov	w1, #0x0                   	// #0
 2137474:	aa1503e0 	mov	x0, x21
 2137478:	940323da 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 213747c:	aa1503e0 	mov	x0, x21
 2137480:	94071460 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2137484:	aa1903e0 	mov	x0, x25
 2137488:	9407145e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 213748c:	aa1703e0 	mov	x0, x23
 2137490:	9407145c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2137494:	aa1603e0 	mov	x0, x22
 2137498:	9407145a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 213749c:	aa1803e0 	mov	x0, x24
 21374a0:	94071458 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21374a4:	a94363f7 	ldp	x23, x24, [sp,#48]
 21374a8:	f94023f9 	ldr	x25, [sp,#64]
 21374ac:	17ffffce 	b	21373e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93755c>
 21374b0:	aa0003f3 	mov	x19, x0
 21374b4:	aa1703e0 	mov	x0, x23
 21374b8:	94071452 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21374bc:	aa1603e0 	mov	x0, x22
 21374c0:	94071450 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21374c4:	f94023f9 	ldr	x25, [sp,#64]
 21374c8:	910183e0 	add	x0, sp, #0x60
 21374cc:	9407144d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21374d0:	a94363f7 	ldp	x23, x24, [sp,#48]
 21374d4:	910163e0 	add	x0, sp, #0x58
 21374d8:	9407144a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21374dc:	910143e0 	add	x0, sp, #0x50
 21374e0:	a90363f7 	stp	x23, x24, [sp,#48]
 21374e4:	f90023f9 	str	x25, [sp,#64]
 21374e8:	94071446 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21374ec:	aa1303e0 	mov	x0, x19
 21374f0:	978bb608 	bl	424d10 <_Unwind_Resume@plt>
 21374f4:	aa0003f3 	mov	x19, x0
 21374f8:	17fffff1 	b	21374bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937634>
 21374fc:	aa0003f3 	mov	x19, x0
 2137500:	aa1503e0 	mov	x0, x21
 2137504:	9407143f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2137508:	aa1903e0 	mov	x0, x25
 213750c:	9407143d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2137510:	aa1703e0 	mov	x0, x23
 2137514:	9407143b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2137518:	f94023f9 	ldr	x25, [sp,#64]
 213751c:	aa1603e0 	mov	x0, x22
 2137520:	94071438 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2137524:	aa1803e0 	mov	x0, x24
 2137528:	f90023f9 	str	x25, [sp,#64]
 213752c:	94071435 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2137530:	aa1303e0 	mov	x0, x19
 2137534:	978bb5f7 	bl	424d10 <_Unwind_Resume@plt>
 2137538:	aa0003f3 	mov	x19, x0
 213753c:	17fffff3 	b	2137508 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937680>
 2137540:	aa0003f3 	mov	x19, x0
 2137544:	17fffff3 	b	2137510 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937688>
 2137548:	aa0003f3 	mov	x19, x0
 213754c:	17fffff4 	b	213751c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937694>
 2137550:	aa0003f3 	mov	x19, x0
 2137554:	17fffff4 	b	2137524 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93769c>
 2137558:	aa0003f3 	mov	x19, x0
 213755c:	aa1503e0 	mov	x0, x21
 2137560:	94071428 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2137564:	aa1903e0 	mov	x0, x25
 2137568:	94071426 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 213756c:	f94023f9 	ldr	x25, [sp,#64]
 2137570:	aa1803e0 	mov	x0, x24
 2137574:	94071423 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2137578:	17ffffd4 	b	21374c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937640>
 213757c:	aa0003f3 	mov	x19, x0
 2137580:	17fffff9 	b	2137564 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9376dc>
 2137584:	aa0003f3 	mov	x19, x0
 2137588:	aa1603e0 	mov	x0, x22
 213758c:	9407141d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2137590:	aa1503e0 	mov	x0, x21
 2137594:	9407141b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2137598:	f94023f9 	ldr	x25, [sp,#64]
 213759c:	aa1703e0 	mov	x0, x23
 21375a0:	94071418 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21375a4:	17fffff3 	b	2137570 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9376e8>
 21375a8:	aa0003f3 	mov	x19, x0
 21375ac:	17fffffc 	b	213759c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937714>
 21375b0:	aa0003f3 	mov	x19, x0
 21375b4:	17ffffef 	b	2137570 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9376e8>
 21375b8:	aa0003f3 	mov	x19, x0
 21375bc:	17ffffc3 	b	21374c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937640>
 21375c0:	aa0003f3 	mov	x19, x0
 21375c4:	17ffffc4 	b	21374d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93764c>
 21375c8:	aa0003f3 	mov	x19, x0
 21375cc:	17ffffc4 	b	21374dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937654>
