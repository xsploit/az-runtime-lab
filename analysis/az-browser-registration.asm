
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002158318 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x958490>:
 2158318:	a9b57bfd 	stp	x29, x30, [sp,#-176]!
 215831c:	910003fd 	mov	x29, sp
 2158320:	a90153f3 	stp	x19, x20, [sp,#16]
 2158324:	f000cf73 	adrp	x19, 3b47000 <stdout@@GLIBC_2.17+0x5f40>
 2158328:	9101e273 	add	x19, x19, #0x78
 215832c:	a9025bf5 	stp	x21, x22, [sp,#32]
 2158330:	a90363f7 	stp	x23, x24, [sp,#48]
 2158334:	a9046bf9 	stp	x25, x26, [sp,#64]
 2158338:	aa0003f9 	mov	x25, x0
 215833c:	a90573fb 	stp	x27, x28, [sp,#80]
 2158340:	aa0103fb 	mov	x27, x1
 2158344:	08dffe60 	ldarb	w0, [x19]
 2158348:	36000ec0 	tbz	w0, #0, 2158520 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x958698>
 215834c:	f000cf75 	adrp	x21, 3b47000 <stdout@@GLIBC_2.17+0x5f40>
 2158350:	910202b5 	add	x21, x21, #0x80
 2158354:	f000cf77 	adrp	x23, 3b47000 <stdout@@GLIBC_2.17+0x5f40>
 2158358:	9102a2f4 	add	x20, x23, #0xa8
 215835c:	12800016 	mov	w22, #0xffffffff            	// #-1
 2158360:	885ffe80 	ldaxr	w0, [x20]
 2158364:	35000060 	cbnz	w0, 2158370 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9584e8>
 2158368:	8801fe96 	stlxr	w1, w22, [x20]
 215836c:	35ffffa1 	cbnz	w1, 2158360 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9584d8>
 2158370:	7100001f 	cmp	w0, #0x0
 2158374:	540023c1 	b.ne	21587ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x958964>
 2158378:	52800038 	mov	w24, #0x1                   	// #1
 215837c:	08dffe60 	ldarb	w0, [x19]
 2158380:	36001040 	tbz	w0, #0, 2158588 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x958700>
 2158384:	b9801aa0 	ldrsw	x0, [x21,#24]
 2158388:	f9400322 	ldr	x2, [x25]
 215838c:	f94006a1 	ldr	x1, [x21,#8]
 2158390:	9ac00856 	udiv	x22, x2, x0
 2158394:	9b008ad6 	msub	x22, x22, x0, x2
 2158398:	93407eda 	sxtw	x26, w22
 215839c:	f87a7833 	ldr	x19, [x1,x26,lsl #3]
 21583a0:	b4000253 	cbz	x19, 21583e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x958560>
 21583a4:	f9400260 	ldr	x0, [x19]
 21583a8:	eb00005f 	cmp	x2, x0
 21583ac:	540005a0 	b.eq	2158460 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9585d8>
 21583b0:	aa1303e0 	mov	x0, x19
 21583b4:	14000004 	b	21583c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95853c>
 21583b8:	f9400001 	ldr	x1, [x0]
 21583bc:	eb01005f 	cmp	x2, x1
 21583c0:	54000500 	b.eq	2158460 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9585d8>
 21583c4:	f9400800 	ldr	x0, [x0,#16]
 21583c8:	b5ffff80 	cbnz	x0, 21583b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x958530>
 21583cc:	aa1303e0 	mov	x0, x19
 21583d0:	14000004 	b	21583e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x958558>
 21583d4:	f9400001 	ldr	x1, [x0]
 21583d8:	eb01005f 	cmp	x2, x1
 21583dc:	54001060 	b.eq	21585e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x958760>
 21583e0:	f9400800 	ldr	x0, [x0,#16]
 21583e4:	b5ffff80 	cbnz	x0, 21583d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95854c>
 21583e8:	d2800300 	mov	x0, #0x18                  	// #24
 21583ec:	978b3255 	bl	424d40 <_Znwm@plt>
 21583f0:	aa0003f4 	mov	x20, x0
 21583f4:	b9401aa4 	ldr	w4, [x21,#24]
 21583f8:	f9400320 	ldr	x0, [x25]
 21583fc:	6b16009f 	cmp	w4, w22
 2158400:	a9007e80 	stp	x0, xzr, [x20]
 2158404:	f9000a93 	str	x19, [x20,#16]
 2158408:	54000f69 	b.ls	21585f4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95876c>
 215840c:	f94006a0 	ldr	x0, [x21,#8]
 2158410:	f83a7814 	str	x20, [x0,x26,lsl #3]
 2158414:	531f7896 	lsl	w22, w4, #1
 2158418:	b94022a0 	ldr	w0, [x21,#32]
 215841c:	0b0402c1 	add	w1, w22, w4
 2158420:	11000400 	add	w0, w0, #0x1
 2158424:	b90022a0 	str	w0, [x21,#32]
 2158428:	0b417c22 	add	w2, w1, w1, lsr #31
 215842c:	6b82041f 	cmp	w0, w2, asr #1
 2158430:	5400114c 	b.gt	2158658 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9587d0>
 2158434:	91002280 	add	x0, x20, #0x8
 2158438:	f900001b 	str	x27, [x0]
 215843c:	350005f8 	cbnz	w24, 21584f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x958670>
 2158440:	aa1b03e0 	mov	x0, x27
 2158444:	a94153f3 	ldp	x19, x20, [sp,#16]
 2158448:	a9425bf5 	ldp	x21, x22, [sp,#32]
 215844c:	a94363f7 	ldp	x23, x24, [sp,#48]
 2158450:	a9446bf9 	ldp	x25, x26, [sp,#64]
 2158454:	a94573fb 	ldp	x27, x28, [sp,#80]
 2158458:	a8cb7bfd 	ldp	x29, x30, [sp],#176
 215845c:	d65f03c0 	ret
 2158460:	b0002341 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 2158464:	910223e0 	add	x0, sp, #0x88
 2158468:	9136a021 	add	x1, x1, #0xda8
 215846c:	94076e1d 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2158470:	b0006781 	adrp	x1, 2e49000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8861a8>
 2158474:	91138021 	add	x1, x1, #0x4e0
 2158478:	910243e8 	add	x8, sp, #0x90
 215847c:	9100a021 	add	x1, x1, #0x28
 2158480:	910223e0 	add	x0, sp, #0x88
 2158484:	9406eddb 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2158488:	f0003381 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 215848c:	910263e8 	add	x8, sp, #0x98
 2158490:	91366021 	add	x1, x1, #0xd98
 2158494:	910243e0 	add	x0, sp, #0x90
 2158498:	9406edd6 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 215849c:	b0002341 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 21584a0:	910283e0 	add	x0, sp, #0xa0
 21584a4:	91364021 	add	x1, x1, #0xd90
 21584a8:	94076e0e 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21584ac:	910283e1 	add	x1, sp, #0xa0
 21584b0:	9102a3e8 	add	x8, sp, #0xa8
 21584b4:	910263e0 	add	x0, sp, #0x98
 21584b8:	9406ed76 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 21584bc:	52800022 	mov	w2, #0x1                   	// #1
 21584c0:	52800001 	mov	w1, #0x0                   	// #0
 21584c4:	9102a3e0 	add	x0, sp, #0xa8
 21584c8:	94029fc6 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 21584cc:	9102a3e0 	add	x0, sp, #0xa8
 21584d0:	9406904c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21584d4:	910283e0 	add	x0, sp, #0xa0
 21584d8:	9406904a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21584dc:	910263e0 	add	x0, sp, #0x98
 21584e0:	94069048 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21584e4:	910243e0 	add	x0, sp, #0x90
 21584e8:	94069046 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21584ec:	910223e0 	add	x0, sp, #0x88
 21584f0:	94069044 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21584f4:	34fffa78 	cbz	w24, 2158440 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9585b8>
 21584f8:	9102a2e0 	add	x0, x23, #0xa8
 21584fc:	97945fe3 	bl	670488 <sqlite3_key@plt+0x248c18>
 2158500:	aa1b03e0 	mov	x0, x27
 2158504:	a94153f3 	ldp	x19, x20, [sp,#16]
 2158508:	a9425bf5 	ldp	x21, x22, [sp,#32]
 215850c:	a94363f7 	ldp	x23, x24, [sp,#48]
 2158510:	a9446bf9 	ldp	x25, x26, [sp,#64]
 2158514:	a94573fb 	ldp	x27, x28, [sp,#80]
