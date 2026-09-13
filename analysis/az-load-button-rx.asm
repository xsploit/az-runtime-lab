
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002153478 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9535f0>:
 2153478:	a9ba7bfd 	stp	x29, x30, [sp,#-96]!
 215347c:	910003fd 	mov	x29, sp
 2153480:	a90153f3 	stp	x19, x20, [sp,#16]
 2153484:	aa0103f4 	mov	x20, x1
 2153488:	39400021 	ldrb	w1, [x1]
 215348c:	aa0003f3 	mov	x19, x0
 2153490:	37380201 	tbnz	w1, #7, 21534d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953648>
 2153494:	f941aa60 	ldr	x0, [x19,#848]
 2153498:	d27d0021 	eor	x1, x1, #0x8
 215349c:	d3430c21 	ubfx	x1, x1, #3, #1
 21534a0:	97ff7bd4 	bl	21323f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932568>
 21534a4:	39400680 	ldrb	w0, [x20,#1]
 21534a8:	39400281 	ldrb	w1, [x20]
 21534ac:	53077c02 	lsr	w2, w0, #7
 21534b0:	12000021 	and	w1, w1, #0x1
 21534b4:	d3461800 	ubfx	x0, x0, #6, #1
 21534b8:	390da662 	strb	w2, [x19,#873]
 21534bc:	390daa60 	strb	w0, [x19,#874]
 21534c0:	390dae61 	strb	w1, [x19,#875]
 21534c4:	a94153f3 	ldp	x19, x20, [sp,#16]
 21534c8:	a8c67bfd 	ldp	x29, x30, [sp],#96
 21534cc:	d65f03c0 	ret
 21534d0:	394da000 	ldrb	w0, [x0,#872]
 21534d4:	35fffe00 	cbnz	w0, 2153494 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95360c>
 21534d8:	f90013f5 	str	x21, [sp,#32]
 21534dc:	f941b275 	ldr	x21, [x19,#864]
 21534e0:	f94006a0 	ldr	x0, [x21,#8]
 21534e4:	b4000180 	cbz	x0, 2153514 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95368c>
 21534e8:	f9400003 	ldr	x3, [x0]
 21534ec:	52800002 	mov	w2, #0x0                   	// #0
 21534f0:	aa1503e1 	mov	x1, x21
 21534f4:	f9401463 	ldr	x3, [x3,#40]
 21534f8:	d63f0060 	blr	x3
 21534fc:	f90006bf 	str	xzr, [x21,#8]
 2153500:	52800020 	mov	w0, #0x1                   	// #1
 2153504:	39400281 	ldrb	w1, [x20]
 2153508:	390da260 	strb	w0, [x19,#872]
 215350c:	f94013f5 	ldr	x21, [sp,#32]
 2153510:	17ffffe1 	b	2153494 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95360c>
 2153514:	910103e0 	add	x0, sp, #0x40
 2153518:	d0002361 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 215351c:	9136a021 	add	x1, x1, #0xda8
 2153520:	940781f0 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2153524:	b00067a1 	adrp	x1, 2e48000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8851a8>
 2153528:	910f8021 	add	x1, x1, #0x3e0
 215352c:	9132a021 	add	x1, x1, #0xca8
 2153530:	910103e0 	add	x0, sp, #0x40
 2153534:	910123e8 	add	x8, sp, #0x48
 2153538:	940701ae 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 215353c:	900033c1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 2153540:	910143e8 	add	x8, sp, #0x50
 2153544:	91366021 	add	x1, x1, #0xd98
 2153548:	910123e0 	add	x0, sp, #0x48
 215354c:	940701a9 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2153550:	f00024c1 	adrp	x1, 25ee000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2b1a8>
 2153554:	9100e3e0 	add	x0, sp, #0x38
 2153558:	91258021 	add	x1, x1, #0x960
 215355c:	940781e1 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2153560:	9100e3e1 	add	x1, sp, #0x38
 2153564:	910163e8 	add	x8, sp, #0x58
 2153568:	910143e0 	add	x0, sp, #0x50
 215356c:	94070149 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 2153570:	52800022 	mov	w2, #0x1                   	// #1
 2153574:	52800001 	mov	w1, #0x0                   	// #0
 2153578:	910163e0 	add	x0, sp, #0x58
 215357c:	9402b399 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 2153580:	910163e0 	add	x0, sp, #0x58
 2153584:	9406a41f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2153588:	9100e3e0 	add	x0, sp, #0x38
 215358c:	9406a41d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2153590:	910143e0 	add	x0, sp, #0x50
 2153594:	9406a41b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2153598:	910123e0 	add	x0, sp, #0x48
 215359c:	9406a419 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21535a0:	910103e0 	add	x0, sp, #0x40
 21535a4:	9406a417 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21535a8:	17ffffd6 	b	2153500 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953678>
 21535ac:	aa0003f3 	mov	x19, x0
 21535b0:	1400000a 	b	21535d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953750>
 21535b4:	aa0003f3 	mov	x19, x0
 21535b8:	910163e0 	add	x0, sp, #0x58
 21535bc:	9406a411 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21535c0:	9100e3e0 	add	x0, sp, #0x38
 21535c4:	9406a40f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21535c8:	910143e0 	add	x0, sp, #0x50
 21535cc:	9406a40d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21535d0:	910123e0 	add	x0, sp, #0x48
 21535d4:	9406a40b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21535d8:	910103e0 	add	x0, sp, #0x40
 21535dc:	9406a409 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21535e0:	aa1303e0 	mov	x0, x19
 21535e4:	978b45cb 	bl	424d10 <_Unwind_Resume@plt>
 21535e8:	aa0003f3 	mov	x19, x0
 21535ec:	17fffff7 	b	21535c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953740>
 21535f0:	aa0003f3 	mov	x19, x0
 21535f4:	17fffff3 	b	21535c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953738>
 21535f8:	aa0003f3 	mov	x19, x0
 21535fc:	17fffff5 	b	21535d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953748>
 2153600:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
 2153604:	910003fd 	mov	x29, sp
 2153608:	a9025bf5 	stp	x21, x22, [sp,#32]
 215360c:	aa0003f5 	mov	x21, x0
 2153610:	d0000000 	adrp	x0, 2155000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x955178>
 2153614:	a90153f3 	stp	x19, x20, [sp,#16]
 2153618:	91026000 	add	x0, x0, #0x98
 215361c:	f9409eb3 	ldr	x19, [x21,#312]
 2153620:	79c03434 	ldrsh	w20, [x1,#26]
 2153624:	f9400261 	ldr	x1, [x19]
 2153628:	f9401821 	ldr	x1, [x1,#48]
 215362c:	eb00003f 	cmp	x1, x0
 2153630:	54000f41 	b.ne	2153818 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953990>
 2153634:	b940da60 	ldr	w0, [x19,#216]
 2153638:	f9405e61 	ldr	x1, [x19,#184]
 215363c:	4b20a294 	sub	w20, w20, w0, sxth
 2153640:	b9007bf4 	str	w20, [sp,#120]
 2153644:	3901f3ff 	strb	wzr, [sp,#124]
 2153648:	b4000f01 	cbz	x1, 2153828 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9539a0>
 215364c:	f9400263 	ldr	x3, [x19]
 2153650:	aa1303e0 	mov	x0, x19
 2153654:	9101e3e2 	add	x2, sp, #0x78
 2153658:	f9401063 	ldr	x3, [x3,#32]
 215365c:	d63f0060 	blr	x3
 2153660:	b940b260 	ldr	w0, [x19,#176]
 2153664:	7100001f 	cmp	w0, #0x0
 2153668:	540000ac 	b.gt	215367c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9537f4>
 215366c:	a94153f3 	ldp	x19, x20, [sp,#16]
 2153670:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2153674:	a8c97bfd 	ldp	x29, x30, [sp],#144
 2153678:	d65f03c0 	ret
 215367c:	91010275 	add	x21, x19, #0x40
 2153680:	aa1503e0 	mov	x0, x21
 2153684:	9407629b 	bl	232c0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fd8>
 2153688:	72001c1f 	tst	w0, #0xff
 215368c:	54ffff00 	b.eq	215366c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9537e4>
 2153690:	a9046bf9 	stp	x25, x26, [sp,#64]
 2153694:	b9408274 	ldr	w20, [x19,#128]
 2153698:	b9009a7f 	str	wzr, [x19,#152]
 215369c:	7100029f 	cmp	w20, #0x0
 21536a0:	54000e20 	b.eq	2153864 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9539dc>
 21536a4:	54000cad 	b.le	2153838 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9539b0>
 21536a8:	937d7e80 	sbfiz	x0, x20, #3, #32
 21536ac:	978b4649 	bl	424fd0 <malloc@plt>
 21536b0:	91004003 	add	x3, x0, #0x10
 21536b4:	aa0003e2 	mov	x2, x0
 21536b8:	f9403a60 	ldr	x0, [x19,#112]
 21536bc:	51000681 	sub	w1, w20, #0x1
 21536c0:	eb03001f 	cmp	x0, x3
 21536c4:	91004003 	add	x3, x0, #0x10
 21536c8:	fa433042 	ccmp	x2, x3, #0x2, cc
 21536cc:	7a442820 	ccmp	w1, #0x4, #0x0, cs
 21536d0:	54000d09 	b.ls	2153870 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9539e8>
 21536d4:	53017e83 	lsr	w3, w20, #1
 21536d8:	d2800001 	mov	x1, #0x0                   	// #0
 21536dc:	d37cec63 	lsl	x3, x3, #4
 21536e0:	3ce16800 	ldr	q0, [x0,x1]
 21536e4:	3ca16840 	str	q0, [x2,x1]
 21536e8:	91004021 	add	x1, x1, #0x10
 21536ec:	eb03003f 	cmp	x1, x3
 21536f0:	54ffff81 	b.ne	21536e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953858>
 21536f4:	121f7a81 	and	w1, w20, #0xfffffffe
 21536f8:	36000074 	tbz	w20, #0, 2153704 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95387c>
 21536fc:	f8617800 	ldr	x0, [x0,x1,lsl #3]
 2153700:	f8217840 	str	x0, [x2,x1,lsl #3]
 2153704:	2a1403e1 	mov	w1, w20
 2153708:	f9404660 	ldr	x0, [x19,#136]
 215370c:	f9004662 	str	x2, [x19,#136]
 2153710:	b9009261 	str	w1, [x19,#144]
 2153714:	b9009a74 	str	w20, [x19,#152]
 2153718:	978b44f6 	bl	424af0 <free@plt>
 215371c:	aa1503e0 	mov	x0, x21
 2153720:	9407627c 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 2153724:	aa1303e0 	mov	x0, x19
 2153728:	52800181 	mov	w1, #0xc                   	// #12
 215372c:	f84a0c15 	ldr	x21, [x0,#160]!
 2153730:	b9401019 	ldr	w25, [x0,#16]
 2153734:	9b215739 	smaddl	x25, w25, w1, x21
 2153738:	eb1902bf 	cmp	x21, x25
 215373c:	54000620 	b.eq	2153800 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953978>
 2153740:	b000237a 	adrp	x26, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 2153744:	912a735a 	add	x26, x26, #0xa9c
 2153748:	a90363f7 	stp	x23, x24, [sp,#48]
 215374c:	d000cf98 	adrp	x24, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 2153750:	9118a318 	add	x24, x24, #0x628
 2153754:	91022260 	add	x0, x19, #0x88
 2153758:	f90037e0 	str	x0, [sp,#104]
 215375c:	d503201f 	nop
 2153760:	d000cf81 	adrp	x1, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 2153764:	9118c037 	add	x23, x1, #0x630
 2153768:	f94037e1 	ldr	x1, [sp,#104]
 215376c:	f94002a0 	ldr	x0, [x21]
 2153770:	f90043e0 	str	x0, [sp,#128]
 2153774:	f9404660 	ldr	x0, [x19,#136]
 2153778:	b9801036 	ldrsw	x22, [x1,#16]
 215377c:	b9400aa1 	ldr	w1, [x21,#8]
 2153780:	aa0003f4 	mov	x20, x0
 2153784:	b9008be1 	str	w1, [sp,#136]
 2153788:	8b160c16 	add	x22, x0, x22, lsl #3
 215378c:	eb16001f 	cmp	x0, x22
 2153790:	54000300 	b.eq	21537f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953968>
 2153794:	a90573fb 	stp	x27, x28, [sp,#80]
 2153798:	f940029b 	ldr	x27, [x20]
 215379c:	91002360 	add	x0, x27, #0x8
