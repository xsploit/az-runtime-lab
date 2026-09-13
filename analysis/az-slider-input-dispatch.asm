
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 2159560: a9b87bfd     	stp	x29, x30, [sp, #-0x80]!
 2159564: 910003fd     	mov	x29, sp
 2159568: f9405c03     	ldr	x3, [x0, #0xb8]
 215956c: b4000ea3     	cbz	x3, 0x2159740 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9598b8>
 2159570: a90153f3     	stp	x19, x20, [sp, #0x10]
 2159574: aa0103e2     	mov	x2, x1
 2159578: aa0303e1     	mov	x1, x3
 215957c: f9400004     	ldr	x4, [x0]
 2159580: aa0003f4     	mov	x20, x0
 2159584: f9401083     	ldr	x3, [x4, #0x20]
 2159588: d63f0060     	blr	x3
 215958c: b940b280     	ldr	w0, [x20, #0xb0]
 2159590: 7100001f     	cmp	w0, #0x0
 2159594: 5400008c     	b.gt	0x21595a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x95971c>
 2159598: a94153f3     	ldp	x19, x20, [sp, #0x10]
 215959c: a8c87bfd     	ldp	x29, x30, [sp], #0x80
 21595a0: d65f03c0     	ret
 21595a4: 91010293     	add	x19, x20, #0x40
 21595a8: aa1303e0     	mov	x0, x19
 21595ac: 94074ad1     	bl	0x232c0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a3fd8>
 21595b0: 72001c1f     	tst	w0, #0xff
 21595b4: 54ffff20     	b.eq	0x2159598 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959710>
 21595b8: a9025bf5     	stp	x21, x22, [sp, #0x20]
 21595bc: b9408295     	ldr	w21, [x20, #0x80]
 21595c0: a9046bf9     	stp	x25, x26, [sp, #0x40]
 21595c4: 710002bf     	cmp	w21, #0x0
 21595c8: b9009a9f     	str	wzr, [x20, #0x98]
 21595cc: 54000d80     	b.eq	0x215977c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9598f4>
 21595d0: 54000c0d     	b.le	0x2159750 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9598c8>
 21595d4: 937d7ea0     	sbfiz	x0, x21, #3, #32
 21595d8: 978b2e7e     	bl	0x424fd0 <malloc@plt>
 21595dc: 91004003     	add	x3, x0, #0x10
 21595e0: aa0003e2     	mov	x2, x0
 21595e4: f9403a80     	ldr	x0, [x20, #0x70]
 21595e8: 510006a1     	sub	w1, w21, #0x1
 21595ec: eb03001f     	cmp	x0, x3
 21595f0: 91004003     	add	x3, x0, #0x10
 21595f4: fa433042     	ccmp	x2, x3, #0x2, lo
 21595f8: 7a442820     	ccmp	w1, #0x4, #0x0, hs
 21595fc: 54000c69     	b.ls	0x2159788 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959900>
 2159600: 53017ea3     	lsr	w3, w21, #1
 2159604: d2800001     	mov	x1, #0x0                // =0
 2159608: d37cec63     	lsl	x3, x3, #4
 215960c: d503201f     	nop
 2159610: 3ce16800     	ldr	q0, [x0, x1]
 2159614: 3ca16840     	str	q0, [x2, x1]
 2159618: 91004021     	add	x1, x1, #0x10
 215961c: eb03003f     	cmp	x1, x3
 2159620: 54ffff81     	b.ne	0x2159610 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959788>
 2159624: 121f7aa1     	and	w1, w21, #0xfffffffe
 2159628: 36000075     	tbz	w21, #0x0, 0x2159634 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9597ac>
 215962c: f8617800     	ldr	x0, [x0, x1, lsl #3]
 2159630: f8217840     	str	x0, [x2, x1, lsl #3]
 2159634: 2a1503e1     	mov	w1, w21
 2159638: f9404680     	ldr	x0, [x20, #0x88]
 215963c: b9009281     	str	w1, [x20, #0x90]
 2159640: 91022281     	add	x1, x20, #0x88
 2159644: f9004682     	str	x2, [x20, #0x88]
 2159648: b9009a95     	str	w21, [x20, #0x98]
 215964c: f90037e1     	str	x1, [sp, #0x68]
 2159650: 978b2d28     	bl	0x424af0 <free@plt>
 2159654: aa1303e0     	mov	x0, x19
 2159658: 94074aae     	bl	0x232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a3ff8>
 215965c: aa1403e0     	mov	x0, x20
 2159660: f84a0c01     	ldr	x1, [x0, #0xa0]!
 2159664: aa0103f6     	mov	x22, x1
 2159668: b980101a     	ldrsw	x26, [x0, #0x10]
 215966c: 8b1a0c3a     	add	x26, x1, x26, lsl #3
 2159670: eb1a003f     	cmp	x1, x26
 2159674: 540005a0     	b.eq	0x2159728 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9598a0>
 2159678: 9000cf79     	adrp	x25, 0x3b45000 <stdout+0x3f40>
 215967c: 91196339     	add	x25, x25, #0x658
 2159680: a90363f7     	stp	x23, x24, [sp, #0x30]
 2159684: d503201f     	nop
 2159688: f0002338     	adrp	x24, 0x25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb+0xf4e8>
 215968c: f94037e0     	ldr	x0, [sp, #0x68]
 2159690: 9000cf77     	adrp	x23, 0x3b45000 <stdout+0x3f40>
 2159694: f9404693     	ldr	x19, [x20, #0x88]
 2159698: 912a7318     	add	x24, x24, #0xa9c
 215969c: b9801015     	ldrsw	x21, [x0, #0x10]
 21596a0: 911982f7     	add	x23, x23, #0x660
 21596a4: f94002c0     	ldr	x0, [x22]
 21596a8: f9003fe0     	str	x0, [sp, #0x78]
 21596ac: 8b150e75     	add	x21, x19, x21, lsl #3
 21596b0: eb15027f     	cmp	x19, x21
 21596b4: 54000320     	b.eq	0x2159718 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959890>
 21596b8: a90573fb     	stp	x27, x28, [sp, #0x50]
 21596bc: d503201f     	nop
 21596c0: f940027c     	ldr	x28, [x19]
 21596c4: 91002380     	add	x0, x28, #0x8
 21596c8: eb18001f     	cmp	x0, x24
 21596cc: 540001e3     	b.lo	0x2159708 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959880>
 21596d0: f240041f     	tst	x0, #0x3
 21596d4: 540001a1     	b.ne	0x2159708 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959880>
 21596d8: b9400b9b     	ldr	w27, [x28, #0x8]
 21596dc: 08dfff20     	ldarb	w0, [x25]
 21596e0: 360003e0     	tbz	w0, #0x0, 0x215975c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9598d4>
 21596e4: b94002e0     	ldr	w0, [x23]
 21596e8: 6b00037f     	cmp	w27, w0
 21596ec: 540000e1     	b.ne	0x2159708 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959880>
 21596f0: f9400283     	ldr	x3, [x20]
 21596f4: aa1c03e1     	mov	x1, x28
 21596f8: 9101e3e2     	add	x2, sp, #0x78
 21596fc: aa1403e0     	mov	x0, x20
 2159700: f9400863     	ldr	x3, [x3, #0x10]
 2159704: d63f0060     	blr	x3
 2159708: 91002273     	add	x19, x19, #0x8
 215970c: eb1302bf     	cmp	x21, x19
 2159710: 54fffd81     	b.ne	0x21596c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959838>
 2159714: a94573fb     	ldp	x27, x28, [sp, #0x50]
 2159718: 910022d6     	add	x22, x22, #0x8
 215971c: eb16035f     	cmp	x26, x22
 2159720: 54fffb41     	b.ne	0x2159688 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959800>
 2159724: a94363f7     	ldp	x23, x24, [sp, #0x30]
 2159728: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 215972c: a9446bf9     	ldp	x25, x26, [sp, #0x40]
 2159730: b900b29f     	str	wzr, [x20, #0xb0]
 2159734: a94153f3     	ldp	x19, x20, [sp, #0x10]
 2159738: a8c87bfd     	ldp	x29, x30, [sp], #0x80
 215973c: d65f03c0     	ret
 2159740: d2800001     	mov	x1, #0x0                // =0
 2159744: 52800000     	mov	w0, #0x0                // =0
 2159748: 94029bde     	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 215974c: 17ffff94     	b	0x215959c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959714>
 2159750: 2a1503e1     	mov	w1, w21
 2159754: d2800002     	mov	x2, #0x0                // =0
 2159758: 17ffffb8     	b	0x2159638 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9597b0>
 215975c: aa1903e0     	mov	x0, x25
 2159760: 978b32c0     	bl	0x426260 <__cxa_guard_acquire@plt>
 2159764: 34fffc00     	cbz	w0, 0x21596e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x95985c>
 2159768: 97955c68     	bl	0x6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x1fd78>
 215976c: b90002e0     	str	w0, [x23]
 2159770: aa1903e0     	mov	x0, x25
 2159774: 978b3433     	bl	0x426840 <__cxa_guard_release@plt>
 2159778: 17ffffdb     	b	0x21596e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x95985c>
 215977c: 52800001     	mov	w1, #0x0                // =0
 2159780: d2800002     	mov	x2, #0x0                // =0
 2159784: 17ffffad     	b	0x2159638 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9597b0>
 2159788: d2800001     	mov	x1, #0x0                // =0
 215978c: d503201f     	nop
 2159790: f8617803     	ldr	x3, [x0, x1, lsl #3]
 2159794: f8217843     	str	x3, [x2, x1, lsl #3]
 2159798: 91000421     	add	x1, x1, #0x1
 215979c: 6b0102bf     	cmp	w21, w1
 21597a0: 54ffff8c     	b.gt	0x2159790 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959908>
 21597a4: 17ffffa4     	b	0x2159634 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9597ac>
 21597a8: a9b87bfd     	stp	x29, x30, [sp, #-0x80]!
 21597ac: 910003fd     	mov	x29, sp
 21597b0: f9405c03     	ldr	x3, [x0, #0xb8]
 21597b4: b4000f63     	cbz	x3, 0x21599a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959b18>
 21597b8: a90153f3     	stp	x19, x20, [sp, #0x10]
 21597bc: aa0103e2     	mov	x2, x1
 21597c0: aa0303e1     	mov	x1, x3
 21597c4: f9400004     	ldr	x4, [x0]
 21597c8: aa0003f3     	mov	x19, x0
 21597cc: f9401083     	ldr	x3, [x4, #0x20]
 21597d0: d63f0060     	blr	x3
 21597d4: b940b260     	ldr	w0, [x19, #0xb0]
 21597d8: 7100001f     	cmp	w0, #0x0
 21597dc: 5400008c     	b.gt	0x21597ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959964>
 21597e0: a94153f3     	ldp	x19, x20, [sp, #0x10]
 21597e4: a8c87bfd     	ldp	x29, x30, [sp], #0x80
 21597e8: d65f03c0     	ret
 21597ec: a9025bf5     	stp	x21, x22, [sp, #0x20]
 21597f0: 91010275     	add	x21, x19, #0x40
 21597f4: aa1503e0     	mov	x0, x21
 21597f8: 94074a3e     	bl	0x232c0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a3fd8>
 21597fc: 72001c1f     	tst	w0, #0xff
 2159800: 540000a1     	b.ne	0x2159814 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x95998c>
 2159804: a94153f3     	ldp	x19, x20, [sp, #0x10]
 2159808: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 215980c: a8c87bfd     	ldp	x29, x30, [sp], #0x80
 2159810: d65f03c0     	ret
 2159814: a9046bf9     	stp	x25, x26, [sp, #0x40]
 2159818: b9408274     	ldr	w20, [x19, #0x80]
 215981c: b9009a7f     	str	wzr, [x19, #0x98]
 2159820: 7100029f     	cmp	w20, #0x0
 2159824: 54000dc0     	b.eq	0x21599dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959b54>
 2159828: 54000c4d     	b.le	0x21599b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959b28>
 215982c: 937d7e80     	sbfiz	x0, x20, #3, #32
 2159830: 978b2de8     	bl	0x424fd0 <malloc@plt>
 2159834: 91004003     	add	x3, x0, #0x10
 2159838: aa0003e2     	mov	x2, x0
 215983c: f9403a60     	ldr	x0, [x19, #0x70]
 2159840: 51000681     	sub	w1, w20, #0x1
 2159844: eb03001f     	cmp	x0, x3
 2159848: 91004003     	add	x3, x0, #0x10
 215984c: fa433042     	ccmp	x2, x3, #0x2, lo
 2159850: 7a442820     	ccmp	w1, #0x4, #0x0, hs
 2159854: 54000ca9     	b.ls	0x21599e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959b60>
 2159858: 53017e83     	lsr	w3, w20, #1
 215985c: d2800001     	mov	x1, #0x0                // =0
 2159860: d37cec63     	lsl	x3, x3, #4
 2159864: d503201f     	nop
 2159868: 3ce16800     	ldr	q0, [x0, x1]
 215986c: 3ca16840     	str	q0, [x2, x1]
 2159870: 91004021     	add	x1, x1, #0x10
 2159874: eb03003f     	cmp	x1, x3
 2159878: 54ffff81     	b.ne	0x2159868 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9599e0>
 215987c: 121f7a81     	and	w1, w20, #0xfffffffe
 2159880: 36000074     	tbz	w20, #0x0, 0x215988c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959a04>
 2159884: f8617800     	ldr	x0, [x0, x1, lsl #3]
 2159888: f8217840     	str	x0, [x2, x1, lsl #3]
 215988c: 2a1403e1     	mov	w1, w20
 2159890: f9404660     	ldr	x0, [x19, #0x88]
 2159894: f9004662     	str	x2, [x19, #0x88]
 2159898: b9009261     	str	w1, [x19, #0x90]
 215989c: b9009a74     	str	w20, [x19, #0x98]
 21598a0: 978b2c94     	bl	0x424af0 <free@plt>
 21598a4: aa1503e0     	mov	x0, x21
 21598a8: 94074a1a     	bl	0x232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a3ff8>
 21598ac: aa1303e0     	mov	x0, x19
 21598b0: 52800181     	mov	w1, #0xc                // =12
 21598b4: f84a0c15     	ldr	x21, [x0, #0xa0]!
 21598b8: b9401019     	ldr	w25, [x0, #0x10]
 21598bc: 9b215739     	smaddl	x25, w25, w1, x21
 21598c0: eb1902bf     	cmp	x21, x25
 21598c4: 54000620     	b.eq	0x2159988 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959b00>
 21598c8: f000233a     	adrp	x26, 0x25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb+0xf4e8>
 21598cc: 912a735a     	add	x26, x26, #0xa9c
 21598d0: a90363f7     	stp	x23, x24, [sp, #0x30]
 21598d4: 9000cf78     	adrp	x24, 0x3b45000 <stdout+0x3f40>
 21598d8: 9118a318     	add	x24, x24, #0x628
 21598dc: 91022260     	add	x0, x19, #0x88
 21598e0: f90037e0     	str	x0, [sp, #0x68]
 21598e4: d503201f     	nop
 21598e8: 9000cf61     	adrp	x1, 0x3b45000 <stdout+0x3f40>
 21598ec: 9118c037     	add	x23, x1, #0x630
 21598f0: f94037e1     	ldr	x1, [sp, #0x68]
 21598f4: f94002a0     	ldr	x0, [x21]
 21598f8: f9003be0     	str	x0, [sp, #0x70]
 21598fc: f9404660     	ldr	x0, [x19, #0x88]
 2159900: b9801036     	ldrsw	x22, [x1, #0x10]
 2159904: b9400aa1     	ldr	w1, [x21, #0x8]
 2159908: aa0003f4     	mov	x20, x0
 215990c: b9007be1     	str	w1, [sp, #0x78]
 2159910: 8b160c16     	add	x22, x0, x22, lsl #3
 2159914: eb16001f     	cmp	x0, x22
 2159918: 54000300     	b.eq	0x2159978 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959af0>
 215991c: a90573fb     	stp	x27, x28, [sp, #0x50]
 2159920: f940029b     	ldr	x27, [x20]
 2159924: 91002360     	add	x0, x27, #0x8
 2159928: eb1a001f     	cmp	x0, x26
 215992c: 540001e3     	b.lo	0x2159968 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959ae0>
 2159930: f240041f     	tst	x0, #0x3
 2159934: 540001a1     	b.ne	0x2159968 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959ae0>
 2159938: b9400b7c     	ldr	w28, [x27, #0x8]
 215993c: 08dfff00     	ldarb	w0, [x24]
 2159940: 360003e0     	tbz	w0, #0x0, 0x21599bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959b34>
 2159944: b94002e0     	ldr	w0, [x23]
 2159948: 6b00039f     	cmp	w28, w0
 215994c: 540000e1     	b.ne	0x2159968 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959ae0>
 2159950: f9400263     	ldr	x3, [x19]
 2159954: aa1b03e1     	mov	x1, x27
 2159958: 9101c3e2     	add	x2, sp, #0x70
 215995c: aa1303e0     	mov	x0, x19
 2159960: f9400863     	ldr	x3, [x3, #0x10]
 2159964: d63f0060     	blr	x3
 2159968: 91002294     	add	x20, x20, #0x8
 215996c: eb1402df     	cmp	x22, x20
 2159970: 54fffd81     	b.ne	0x2159920 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959a98>
 2159974: a94573fb     	ldp	x27, x28, [sp, #0x50]
 2159978: 910032b5     	add	x21, x21, #0xc
 215997c: eb15033f     	cmp	x25, x21
 2159980: 54fffb41     	b.ne	0x21598e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959a60>
 2159984: a94363f7     	ldp	x23, x24, [sp, #0x30]
 2159988: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 215998c: a9446bf9     	ldp	x25, x26, [sp, #0x40]
 2159990: b900b27f     	str	wzr, [x19, #0xb0]
 2159994: a94153f3     	ldp	x19, x20, [sp, #0x10]
 2159998: a8c87bfd     	ldp	x29, x30, [sp], #0x80
 215999c: d65f03c0     	ret
 21599a0: d2800001     	mov	x1, #0x0                // =0
 21599a4: 52800000     	mov	w0, #0x0                // =0
 21599a8: 94029b46     	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 21599ac: 17ffff8e     	b	0x21597e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x95995c>
 21599b0: 2a1403e1     	mov	w1, w20
 21599b4: d2800002     	mov	x2, #0x0                // =0
 21599b8: 17ffffb6     	b	0x2159890 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959a08>
 21599bc: aa1803e0     	mov	x0, x24
 21599c0: 978b3228     	bl	0x426260 <__cxa_guard_acquire@plt>
 21599c4: 34fffc00     	cbz	w0, 0x2159944 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959abc>
 21599c8: 97955bd0     	bl	0x6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x1fd78>
 21599cc: b90002e0     	str	w0, [x23]
 21599d0: aa1803e0     	mov	x0, x24
 21599d4: 978b339b     	bl	0x426840 <__cxa_guard_release@plt>
 21599d8: 17ffffdb     	b	0x2159944 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959abc>
 21599dc: 52800001     	mov	w1, #0x0                // =0
 21599e0: d2800002     	mov	x2, #0x0                // =0
 21599e4: 17ffffab     	b	0x2159890 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959a08>
 21599e8: d2800001     	mov	x1, #0x0                // =0
 21599ec: d503201f     	nop
 21599f0: f8617803     	ldr	x3, [x0, x1, lsl #3]
 21599f4: f8217843     	str	x3, [x2, x1, lsl #3]
 21599f8: 91000421     	add	x1, x1, #0x1
 21599fc: 6b01029f     	cmp	w20, w1
 2159a00: 54ffff8c     	b.gt	0x21599f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959b68>
 2159a04: 17ffffa2     	b	0x215988c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x959a04>
