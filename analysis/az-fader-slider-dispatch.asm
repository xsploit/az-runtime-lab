
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002159560 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9596d8>:
 2159560:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
 2159564:	910003fd 	mov	x29, sp
 2159568:	f9405c03 	ldr	x3, [x0,#184]
 215956c:	b4000ea3 	cbz	x3, 2159740 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9598b8>
 2159570:	a90153f3 	stp	x19, x20, [sp,#16]
 2159574:	aa0103e2 	mov	x2, x1
 2159578:	aa0303e1 	mov	x1, x3
 215957c:	f9400004 	ldr	x4, [x0]
 2159580:	aa0003f4 	mov	x20, x0
 2159584:	f9401083 	ldr	x3, [x4,#32]
 2159588:	d63f0060 	blr	x3
 215958c:	b940b280 	ldr	w0, [x20,#176]
 2159590:	7100001f 	cmp	w0, #0x0
 2159594:	5400008c 	b.gt	21595a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95971c>
 2159598:	a94153f3 	ldp	x19, x20, [sp,#16]
 215959c:	a8c87bfd 	ldp	x29, x30, [sp],#128
 21595a0:	d65f03c0 	ret
 21595a4:	91010293 	add	x19, x20, #0x40
 21595a8:	aa1303e0 	mov	x0, x19
 21595ac:	94074ad1 	bl	232c0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fd8>
 21595b0:	72001c1f 	tst	w0, #0xff
 21595b4:	54ffff20 	b.eq	2159598 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959710>
 21595b8:	a9025bf5 	stp	x21, x22, [sp,#32]
 21595bc:	b9408295 	ldr	w21, [x20,#128]
 21595c0:	a9046bf9 	stp	x25, x26, [sp,#64]
 21595c4:	710002bf 	cmp	w21, #0x0
 21595c8:	b9009a9f 	str	wzr, [x20,#152]
 21595cc:	54000d80 	b.eq	215977c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9598f4>
 21595d0:	54000c0d 	b.le	2159750 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9598c8>
 21595d4:	937d7ea0 	sbfiz	x0, x21, #3, #32
 21595d8:	978b2e7e 	bl	424fd0 <malloc@plt>
 21595dc:	91004003 	add	x3, x0, #0x10
 21595e0:	aa0003e2 	mov	x2, x0
 21595e4:	f9403a80 	ldr	x0, [x20,#112]
 21595e8:	510006a1 	sub	w1, w21, #0x1
 21595ec:	eb03001f 	cmp	x0, x3
 21595f0:	91004003 	add	x3, x0, #0x10
 21595f4:	fa433042 	ccmp	x2, x3, #0x2, cc
 21595f8:	7a442820 	ccmp	w1, #0x4, #0x0, cs
 21595fc:	54000c69 	b.ls	2159788 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959900>
 2159600:	53017ea3 	lsr	w3, w21, #1
 2159604:	d2800001 	mov	x1, #0x0                   	// #0
 2159608:	d37cec63 	lsl	x3, x3, #4
 215960c:	d503201f 	nop
 2159610:	3ce16800 	ldr	q0, [x0,x1]
 2159614:	3ca16840 	str	q0, [x2,x1]
 2159618:	91004021 	add	x1, x1, #0x10
 215961c:	eb03003f 	cmp	x1, x3
 2159620:	54ffff81 	b.ne	2159610 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959788>
 2159624:	121f7aa1 	and	w1, w21, #0xfffffffe
 2159628:	36000075 	tbz	w21, #0, 2159634 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9597ac>
 215962c:	f8617800 	ldr	x0, [x0,x1,lsl #3]
 2159630:	f8217840 	str	x0, [x2,x1,lsl #3]
 2159634:	2a1503e1 	mov	w1, w21
 2159638:	f9404680 	ldr	x0, [x20,#136]
 215963c:	b9009281 	str	w1, [x20,#144]
 2159640:	91022281 	add	x1, x20, #0x88
 2159644:	f9004682 	str	x2, [x20,#136]
 2159648:	b9009a95 	str	w21, [x20,#152]
 215964c:	f90037e1 	str	x1, [sp,#104]
 2159650:	978b2d28 	bl	424af0 <free@plt>
 2159654:	aa1303e0 	mov	x0, x19
 2159658:	94074aae 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 215965c:	aa1403e0 	mov	x0, x20
 2159660:	f84a0c01 	ldr	x1, [x0,#160]!
 2159664:	aa0103f6 	mov	x22, x1
 2159668:	b980101a 	ldrsw	x26, [x0,#16]
 215966c:	8b1a0c3a 	add	x26, x1, x26, lsl #3
 2159670:	eb1a003f 	cmp	x1, x26
 2159674:	540005a0 	b.eq	2159728 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9598a0>
 2159678:	9000cf79 	adrp	x25, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 215967c:	91196339 	add	x25, x25, #0x658
 2159680:	a90363f7 	stp	x23, x24, [sp,#48]
 2159684:	d503201f 	nop
 2159688:	f0002338 	adrp	x24, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 215968c:	f94037e0 	ldr	x0, [sp,#104]
 2159690:	9000cf77 	adrp	x23, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 2159694:	f9404693 	ldr	x19, [x20,#136]
 2159698:	912a7318 	add	x24, x24, #0xa9c
 215969c:	b9801015 	ldrsw	x21, [x0,#16]
 21596a0:	911982f7 	add	x23, x23, #0x660
 21596a4:	f94002c0 	ldr	x0, [x22]
 21596a8:	f9003fe0 	str	x0, [sp,#120]
 21596ac:	8b150e75 	add	x21, x19, x21, lsl #3
 21596b0:	eb15027f 	cmp	x19, x21
 21596b4:	54000320 	b.eq	2159718 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959890>
 21596b8:	a90573fb 	stp	x27, x28, [sp,#80]
 21596bc:	d503201f 	nop
 21596c0:	f940027c 	ldr	x28, [x19]
 21596c4:	91002380 	add	x0, x28, #0x8
 21596c8:	eb18001f 	cmp	x0, x24
 21596cc:	540001e3 	b.cc	2159708 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959880>
 21596d0:	f240041f 	tst	x0, #0x3
 21596d4:	540001a1 	b.ne	2159708 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959880>
 21596d8:	b9400b9b 	ldr	w27, [x28,#8]
 21596dc:	08dfff20 	ldarb	w0, [x25]
