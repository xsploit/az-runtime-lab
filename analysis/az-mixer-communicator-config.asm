
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002102370 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9024e8>:
 2102370:	aa0003f3 	mov	x19, x0
 2102374:	9400d303 	bl	2136f80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9370f8>
 2102378:	f9405a80 	ldr	x0, [x20,#176]
 210237c:	f9005a93 	str	x19, [x20,#176]
 2102380:	b40000a0 	cbz	x0, 2102394 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x90250c>
 2102384:	f9400001 	ldr	x1, [x0]
 2102388:	f9400421 	ldr	x1, [x1,#8]
 210238c:	d63f0020 	blr	x1
 2102390:	f9405a93 	ldr	x19, [x20,#176]
 2102394:	aa1303e1 	mov	x1, x19
 2102398:	a94153f3 	ldp	x19, x20, [sp,#16]
 210239c:	90006980 	adrp	x0, 2e32000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x86f1a8>
 21023a0:	a8c27bfd 	ldp	x29, x30, [sp],#32
 21023a4:	9131c000 	add	x0, x0, #0xc70
 21023a8:	9136a000 	add	x0, x0, #0xda8
 21023ac:	140017a3 	b	2108238 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9083b0>
 21023b0:	d2800501 	mov	x1, #0x28                  	// #40
 21023b4:	aa0003f4 	mov	x20, x0
 21023b8:	aa1303e0 	mov	x0, x19
 21023bc:	978c90a9 	bl	426660 <_ZdlPvm@plt>
 21023c0:	aa1403e0 	mov	x0, x20
 21023c4:	978c8a53 	bl	424d10 <_Unwind_Resume@plt>
 21023c8:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
 21023cc:	910003fd 	mov	x29, sp
 21023d0:	a90153f3 	stp	x19, x20, [sp,#16]
 21023d4:	a9025bf5 	stp	x21, x22, [sp,#32]
 21023d8:	aa0003f5 	mov	x21, x0
 21023dc:	aa0303f6 	mov	x22, x3
 21023e0:	9101e3e0 	add	x0, sp, #0x78
 21023e4:	a90363f7 	stp	x23, x24, [sp,#48]
 21023e8:	aa0203f8 	mov	x24, x2
 21023ec:	12001c97 	and	w23, w4, #0xff
 21023f0:	f90023f9 	str	x25, [sp,#64]
 21023f4:	aa0103f9 	mov	x25, x1
 21023f8:	94083446 	bl	230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1873f8>
 21023fc:	b0006981 	adrp	x1, 2e33000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8701a8>
 2102400:	910183e0 	add	x0, sp, #0x60
 2102404:	912d4021 	add	x1, x1, #0xb50
 2102408:	9408c636 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 210240c:	910183e1 	add	x1, sp, #0x60
 2102410:	9101e3e0 	add	x0, sp, #0x78
 2102414:	9408369f 	bl	230fe90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187d78>
 2102418:	910183e0 	add	x0, sp, #0x60
 210241c:	9407e879 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2102420:	f90037ff 	str	xzr, [sp,#104]
 2102424:	d0002700 	adrp	x0, 25e4000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x211a8>
 2102428:	52801001 	mov	w1, #0x80                  	// #128
 210242c:	b9008be1 	str	w1, [sp,#136]
 2102430:	fd473400 	ldr	d0, [x0,#3688]
 2102434:	d280c400 	mov	x0, #0x620                 	// #1568
 2102438:	fd0043e0 	str	d0, [sp,#128]
 210243c:	978c8a41 	bl	424d40 <_Znwm@plt>
 2102440:	0f000420 	movi	v0.2s, #0x1
 2102444:	aa0003f4 	mov	x20, x0
 2102448:	aa0003f3 	mov	x19, x0
 210244c:	90006980 	adrp	x0, 2e32000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x86f1a8>
 2102450:	91312000 	add	x0, x0, #0xc48
 2102454:	fd000680 	str	d0, [x20,#8]
 2102458:	f8010660 	str	x0, [x19],#16
 210245c:	aa1303e0 	mov	x0, x19
 2102460:	9400b9d6 	bl	2130bb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930d30>
 2102464:	90006980 	adrp	x0, 2e32000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x86f1a8>
 2102468:	9131c000 	add	x0, x0, #0xc70
 210246c:	aa1303e1 	mov	x1, x19
 2102470:	9136c000 	add	x0, x0, #0xdb0
 2102474:	a906d3f3 	stp	x19, x20, [sp,#104]
 2102478:	94000ef0 	bl	2106038 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9061b0>
 210247c:	d2801500 	mov	x0, #0xa8                  	// #168
 2102480:	978c8a30 	bl	424d40 <_Znwm@plt>
 2102484:	aa0003f3 	mov	x19, x0
 2102488:	2a1703e2 	mov	w2, w23
 210248c:	9101a3e1 	add	x1, sp, #0x68
 2102490:	94016792 	bl	215c2d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c450>
 2102494:	91024274 	add	x20, x19, #0x90
 2102498:	d2806f00 	mov	x0, #0x378                 	// #888
 210249c:	978c8a29 	bl	424d40 <_Znwm@plt>
