
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002147408 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947580>:
 2147408:	d109c3ff 	sub	sp, sp, #0x270
 214740c:	a9007bfd 	stp	x29, x30, [sp]
 2147410:	910003fd 	mov	x29, sp
 2147414:	b9400802 	ldr	w2, [x0,#8]
 2147418:	a90153f3 	stp	x19, x20, [sp,#16]
 214741c:	7102005f 	cmp	w2, #0x80
 2147420:	540007c0 	b.eq	2147518 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947690>
 2147424:	9000cf80 	adrp	x0, 3b37000 <_ZTISt11range_error@@GLIBCXX_3.4+0x12440>
 2147428:	d2800013 	mov	x19, #0x0                   	// #0
 214742c:	39784c01 	ldrb	w1, [x0,#3603]
 2147430:	350000c1 	cbnz	w1, 2147448 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9475c0>
 2147434:	aa1303e0 	mov	x0, x19
 2147438:	a9407bfd 	ldp	x29, x30, [sp]
 214743c:	a94153f3 	ldp	x19, x20, [sp,#16]
 2147440:	9109c3ff 	add	sp, sp, #0x270
 2147444:	d65f03c0 	ret
 2147448:	a9025bf5 	stp	x21, x22, [sp,#32]
 214744c:	910143f5 	add	x21, sp, #0x50
 2147450:	d00023c1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 2147454:	39384c1f 	strb	wzr, [x0,#3603]
 2147458:	9136a021 	add	x1, x1, #0xda8
 214745c:	aa1503e0 	mov	x0, x21
 2147460:	9407b220 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2147464:	910163f6 	add	x22, sp, #0x58
 2147468:	f00067e1 	adrp	x1, 2e46000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8831a8>
 214746c:	9121c021 	add	x1, x1, #0x870
 2147470:	aa1503e0 	mov	x0, x21
 2147474:	9100a021 	add	x1, x1, #0x28
 2147478:	aa1603e8 	mov	x8, x22
 214747c:	940731dd 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2147480:	a90363f7 	stp	x23, x24, [sp,#48]
 2147484:	910183f7 	add	x23, sp, #0x60
 2147488:	90003421 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 214748c:	aa1703e8 	mov	x8, x23
 2147490:	91366021 	add	x1, x1, #0xd98
 2147494:	aa1603e0 	mov	x0, x22
 2147498:	940731d6 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 214749c:	9101a3f8 	add	x24, sp, #0x68
 21474a0:	b00067e1 	adrp	x1, 2e44000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8811a8>
 21474a4:	aa1803e0 	mov	x0, x24
 21474a8:	9119c021 	add	x1, x1, #0x670
 21474ac:	9407b20d 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21474b0:	9101c3f4 	add	x20, sp, #0x70
 21474b4:	aa1803e1 	mov	x1, x24
 21474b8:	aa1403e8 	mov	x8, x20
 21474bc:	aa1703e0 	mov	x0, x23
 21474c0:	94073174 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 21474c4:	52800022 	mov	w2, #0x1                   	// #1
 21474c8:	52800001 	mov	w1, #0x0                   	// #0
 21474cc:	aa1403e0 	mov	x0, x20
 21474d0:	9402e3c4 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 21474d4:	aa1403e0 	mov	x0, x20
 21474d8:	9406d44a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21474dc:	aa1803e0 	mov	x0, x24
 21474e0:	9406d448 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21474e4:	aa1703e0 	mov	x0, x23
 21474e8:	9406d446 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21474ec:	aa1603e0 	mov	x0, x22
 21474f0:	9406d444 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21474f4:	aa1503e0 	mov	x0, x21
 21474f8:	9406d442 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21474fc:	aa1303e0 	mov	x0, x19
 2147500:	a9407bfd 	ldp	x29, x30, [sp]
 2147504:	a94153f3 	ldp	x19, x20, [sp,#16]
 2147508:	a9425bf5 	ldp	x21, x22, [sp,#32]
 214750c:	a94363f7 	ldp	x23, x24, [sp,#48]
