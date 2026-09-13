
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
