
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021435c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x943738>:
 21435c0:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
 21435c4:	aa0103e2 	mov	x2, x1
 21435c8:	52800021 	mov	w1, #0x1                   	// #1
 21435cc:	910003fd 	mov	x29, sp
 21435d0:	a90153f3 	stp	x19, x20, [sp,#16]
 21435d4:	aa0003f4 	mov	x20, x0
 21435d8:	aa0203e0 	mov	x0, x2
 21435dc:	94000f8b 	bl	2147408 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947580>
 21435e0:	b4000f60 	cbz	x0, 21437cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x943944>
 21435e4:	a9025bf5 	stp	x21, x22, [sp,#32]
 21435e8:	aa0003f3 	mov	x19, x0
 21435ec:	79400000 	ldrh	w0, [x0]
 21435f0:	34000720 	cbz	w0, 21436d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x94384c>
 21435f4:	d000d375 	adrp	x21, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 21435f8:	912802b5 	add	x21, x21, #0xa00
 21435fc:	7905e280 	strh	w0, [x20,#752]
 2143600:	08dffea0 	ldarb	w0, [x21]
 2143604:	36000ce0 	tbz	w0, #0, 21437a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x943918>
 2143608:	f94006b6 	ldr	x22, [x21,#8]
 214360c:	9101e3f5 	add	x21, sp, #0x78
 2143610:	b40002f6 	cbz	x22, 214366c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9437e4>
 2143614:	b9400ec0 	ldr	w0, [x22,#12]
 2143618:	7100041f 	cmp	w0, #0x1
 214361c:	54000e00 	b.eq	21437dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x943954>
 2143620:	a90363f7 	stp	x23, x24, [sp,#48]
 2143624:	9100a2d8 	add	x24, x22, #0x28
 2143628:	f9400b00 	ldr	x0, [x24,#16]
 214362c:	b9400400 	ldr	w0, [x0,#4]
 2143630:	7100081f 	cmp	w0, #0x2
 2143634:	54000c61 	b.ne	21437c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x943938>
 2143638:	f94016c3 	ldr	x3, [x22,#40]
 214363c:	aa1303e1 	mov	x1, x19
 2143640:	f9401f02 	ldr	x2, [x24,#56]
 2143644:	aa1803e0 	mov	x0, x24
 2143648:	f9401c63 	ldr	x3, [x3,#56]
 214364c:	9101e3f5 	add	x21, sp, #0x78
 2143650:	d63f0060 	blr	x3
 2143654:	f9401f00 	ldr	x0, [x24,#56]
 2143658:	d2801002 	mov	x2, #0x80                  	// #128
 214365c:	aa1303e1 	mov	x1, x19
 2143660:	978b88bc 	bl	425950 <memcmp@plt>
 2143664:	35000c40 	cbnz	w0, 21437ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x943964>
 2143668:	a94363f7 	ldp	x23, x24, [sp,#48]
 214366c:	91002261 	add	x1, x19, #0x8
 2143670:	9100c280 	add	x0, x20, #0x30
 2143674:	97fffecf 	bl	21431b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x943328>
 2143678:	91004261 	add	x1, x19, #0x10
 214367c:	91064280 	add	x0, x20, #0x190
 2143680:	97fffecc 	bl	21431b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x943328>
 2143684:	91006261 	add	x1, x19, #0x18
 2143688:	aa1403e0 	mov	x0, x20
 214368c:	97fffca5 	bl	2142920 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x942a98>
 2143690:	39402a62 	ldrb	w2, [x19,#10]
 2143694:	aa1503e1 	mov	x1, x21
 2143698:	f9405a80 	ldr	x0, [x20,#176]
 214369c:	d3400042 	ubfx	x2, x2, #0, #1
 21436a0:	3901e3e2 	strb	w2, [sp,#120]
 21436a4:	94001153 	bl	2147bf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947d68>
 21436a8:	39402a62 	ldrb	w2, [x19,#10]
 21436ac:	aa1503e1 	mov	x1, x21
 21436b0:	f9410a80 	ldr	x0, [x20,#528]
 21436b4:	d3400042 	ubfx	x2, x2, #0, #1
 21436b8:	3901e3e2 	strb	w2, [sp,#120]
 21436bc:	9400114d 	bl	2147bf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947d68>
 21436c0:	52800020 	mov	w0, #0x1                   	// #1
 21436c4:	a94153f3 	ldp	x19, x20, [sp,#16]
 21436c8:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21436cc:	a8c87bfd 	ldp	x29, x30, [sp],#128
 21436d0:	d65f03c0 	ret
 21436d4:	910163f6 	add	x22, sp, #0x58
 21436d8:	d00023e1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 21436dc:	aa1603e0 	mov	x0, x22
 21436e0:	9136a021 	add	x1, x1, #0xda8
 21436e4:	a90363f7 	stp	x23, x24, [sp,#48]
 21436e8:	9407c17e 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21436ec:	910183f8 	add	x24, sp, #0x60
 21436f0:	f0006801 	adrp	x1, 2e46000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8831a8>
 21436f4:	9121c021 	add	x1, x1, #0x870
 21436f8:	910d2021 	add	x1, x1, #0x348
 21436fc:	aa1603e0 	mov	x0, x22
 2143700:	aa1803e8 	mov	x8, x24
 2143704:	9407413b 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2143708:	f90023f9 	str	x25, [sp,#64]
 214370c:	9101a3f9 	add	x25, sp, #0x68
 2143710:	90003441 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 2143714:	aa1803e0 	mov	x0, x24
 2143718:	91366021 	add	x1, x1, #0xd98
 214371c:	aa1903e8 	mov	x8, x25
 2143720:	94074134 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2143724:	9101c3f7 	add	x23, sp, #0x70
 2143728:	b0006801 	adrp	x1, 2e44000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8811a8>
 214372c:	aa1703e0 	mov	x0, x23
 2143730:	911ac021 	add	x1, x1, #0x6b0
 2143734:	9407c16b 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2143738:	9101e3f5 	add	x21, sp, #0x78
 214373c:	aa1703e1 	mov	x1, x23
 2143740:	aa1503e8 	mov	x8, x21
 2143744:	aa1903e0 	mov	x0, x25
 2143748:	940740d2 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 214374c:	52800022 	mov	w2, #0x1                   	// #1
 2143750:	52800001 	mov	w1, #0x0                   	// #0
 2143754:	aa1503e0 	mov	x0, x21
 2143758:	9402f322 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 214375c:	aa1503e0 	mov	x0, x21
 2143760:	9406e3a8 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2143764:	aa1703e0 	mov	x0, x23
 2143768:	9406e3a6 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 214376c:	aa1903e0 	mov	x0, x25
 2143770:	9406e3a4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2143774:	aa1803e0 	mov	x0, x24
 2143778:	9406e3a2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 214377c:	aa1603e0 	mov	x0, x22
 2143780:	9406e3a0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2143784:	52800000 	mov	w0, #0x0                   	// #0
 2143788:	a94153f3 	ldp	x19, x20, [sp,#16]
 214378c:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2143790:	a94363f7 	ldp	x23, x24, [sp,#48]
 2143794:	f94023f9 	ldr	x25, [sp,#64]
 2143798:	a8c87bfd 	ldp	x29, x30, [sp],#128
 214379c:	d65f03c0 	ret
 21437a0:	aa1503e0 	mov	x0, x21
 21437a4:	978b8aaf 	bl	426260 <__cxa_guard_acquire@plt>
 21437a8:	34fff300 	cbz	w0, 2143608 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x943780>
 21437ac:	97dd05ed 	bl	1884f60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x850d8>
 21437b0:	f90006a0 	str	x0, [x21,#8]
 21437b4:	aa1503e0 	mov	x0, x21
 21437b8:	978b8c22 	bl	426840 <__cxa_guard_release@plt>
 21437bc:	17ffff93 	b	2143608 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x943780>
 21437c0:	9101e3f5 	add	x21, sp, #0x78
 21437c4:	a94363f7 	ldp	x23, x24, [sp,#48]
 21437c8:	17ffffa9 	b	214366c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9437e4>
 21437cc:	52800000 	mov	w0, #0x0                   	// #0
 21437d0:	a94153f3 	ldp	x19, x20, [sp,#16]
 21437d4:	a8c87bfd 	ldp	x29, x30, [sp],#128
 21437d8:	d65f03c0 	ret
 21437dc:	a94153f3 	ldp	x19, x20, [sp,#16]
 21437e0:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21437e4:	a8c87bfd 	ldp	x29, x30, [sp],#128
 21437e8:	d65f03c0 	ret
 21437ec:	9407abc1 	bl	232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a65d8>
 21437f0:	9101c3f7 	add	x23, sp, #0x70
 21437f4:	aa1503e0 	mov	x0, x21
 21437f8:	94076a92 	bl	231e240 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x196128>
 21437fc:	910122c1 	add	x1, x22, #0x48
