
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021597a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959920>:
 21597a8:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
 21597ac:	910003fd 	mov	x29, sp
 21597b0:	f9405c03 	ldr	x3, [x0,#184]
 21597b4:	b4000f63 	cbz	x3, 21599a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959b18>
 21597b8:	a90153f3 	stp	x19, x20, [sp,#16]
 21597bc:	aa0103e2 	mov	x2, x1
 21597c0:	aa0303e1 	mov	x1, x3
 21597c4:	f9400004 	ldr	x4, [x0]
 21597c8:	aa0003f3 	mov	x19, x0
 21597cc:	f9401083 	ldr	x3, [x4,#32]
 21597d0:	d63f0060 	blr	x3
 21597d4:	b940b260 	ldr	w0, [x19,#176]
 21597d8:	7100001f 	cmp	w0, #0x0
 21597dc:	5400008c 	b.gt	21597ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959964>
 21597e0:	a94153f3 	ldp	x19, x20, [sp,#16]
 21597e4:	a8c87bfd 	ldp	x29, x30, [sp],#128
 21597e8:	d65f03c0 	ret
 21597ec:	a9025bf5 	stp	x21, x22, [sp,#32]
 21597f0:	91010275 	add	x21, x19, #0x40
 21597f4:	aa1503e0 	mov	x0, x21
 21597f8:	94074a3e 	bl	232c0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fd8>
 21597fc:	72001c1f 	tst	w0, #0xff
 2159800:	540000a1 	b.ne	2159814 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95998c>
 2159804:	a94153f3 	ldp	x19, x20, [sp,#16]
 2159808:	a9425bf5 	ldp	x21, x22, [sp,#32]
 215980c:	a8c87bfd 	ldp	x29, x30, [sp],#128
 2159810:	d65f03c0 	ret
 2159814:	a9046bf9 	stp	x25, x26, [sp,#64]
 2159818:	b9408274 	ldr	w20, [x19,#128]
 215981c:	b9009a7f 	str	wzr, [x19,#152]
 2159820:	7100029f 	cmp	w20, #0x0
 2159824:	54000dc0 	b.eq	21599dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959b54>
 2159828:	54000c4d 	b.le	21599b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959b28>
 215982c:	937d7e80 	sbfiz	x0, x20, #3, #32
 2159830:	978b2de8 	bl	424fd0 <malloc@plt>
 2159834:	91004003 	add	x3, x0, #0x10
 2159838:	aa0003e2 	mov	x2, x0
 215983c:	f9403a60 	ldr	x0, [x19,#112]
 2159840:	51000681 	sub	w1, w20, #0x1
 2159844:	eb03001f 	cmp	x0, x3
 2159848:	91004003 	add	x3, x0, #0x10
 215984c:	fa433042 	ccmp	x2, x3, #0x2, cc
 2159850:	7a442820 	ccmp	w1, #0x4, #0x0, cs
 2159854:	54000ca9 	b.ls	21599e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959b60>
 2159858:	53017e83 	lsr	w3, w20, #1
 215985c:	d2800001 	mov	x1, #0x0                   	// #0
 2159860:	d37cec63 	lsl	x3, x3, #4
 2159864:	d503201f 	nop
 2159868:	3ce16800 	ldr	q0, [x0,x1]
 215986c:	3ca16840 	str	q0, [x2,x1]
 2159870:	91004021 	add	x1, x1, #0x10
 2159874:	eb03003f 	cmp	x1, x3
 2159878:	54ffff81 	b.ne	2159868 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9599e0>
 215987c:	121f7a81 	and	w1, w20, #0xfffffffe
 2159880:	36000074 	tbz	w20, #0, 215988c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959a04>
 2159884:	f8617800 	ldr	x0, [x0,x1,lsl #3]
 2159888:	f8217840 	str	x0, [x2,x1,lsl #3]
 215988c:	2a1403e1 	mov	w1, w20
 2159890:	f9404660 	ldr	x0, [x19,#136]
 2159894:	f9004662 	str	x2, [x19,#136]
 2159898:	b9009261 	str	w1, [x19,#144]
 215989c:	b9009a74 	str	w20, [x19,#152]
 21598a0:	978b2c94 	bl	424af0 <free@plt>
 21598a4:	aa1503e0 	mov	x0, x21
 21598a8:	94074a1a 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21598ac:	aa1303e0 	mov	x0, x19
 21598b0:	52800181 	mov	w1, #0xc                   	// #12
 21598b4:	f84a0c15 	ldr	x21, [x0,#160]!
 21598b8:	b9401019 	ldr	w25, [x0,#16]
 21598bc:	9b215739 	smaddl	x25, w25, w1, x21
 21598c0:	eb1902bf 	cmp	x21, x25
 21598c4:	54000620 	b.eq	2159988 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959b00>
 21598c8:	f000233a 	adrp	x26, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 21598cc:	912a735a 	add	x26, x26, #0xa9c
 21598d0:	a90363f7 	stp	x23, x24, [sp,#48]
 21598d4:	9000cf78 	adrp	x24, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 21598d8:	9118a318 	add	x24, x24, #0x628
 21598dc:	91022260 	add	x0, x19, #0x88
 21598e0:	f90037e0 	str	x0, [sp,#104]
 21598e4:	d503201f 	nop
 21598e8:	9000cf61 	adrp	x1, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 21598ec:	9118c037 	add	x23, x1, #0x630
 21598f0:	f94037e1 	ldr	x1, [sp,#104]
 21598f4:	f94002a0 	ldr	x0, [x21]
 21598f8:	f9003be0 	str	x0, [sp,#112]
 21598fc:	f9404660 	ldr	x0, [x19,#136]
 2159900:	b9801036 	ldrsw	x22, [x1,#16]
 2159904:	b9400aa1 	ldr	w1, [x21,#8]
 2159908:	aa0003f4 	mov	x20, x0
 215990c:	b9007be1 	str	w1, [sp,#120]
 2159910:	8b160c16 	add	x22, x0, x22, lsl #3
 2159914:	eb16001f 	cmp	x0, x22
 2159918:	54000300 	b.eq	2159978 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959af0>
 215991c:	a90573fb 	stp	x27, x28, [sp,#80]
 2159920:	f940029b 	ldr	x27, [x20]
 2159924:	91002360 	add	x0, x27, #0x8
 2159928:	eb1a001f 	cmp	x0, x26
 215992c:	540001e3 	b.cc	2159968 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959ae0>
 2159930:	f240041f 	tst	x0, #0x3
 2159934:	540001a1 	b.ne	2159968 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959ae0>
 2159938:	b9400b7c 	ldr	w28, [x27,#8]
 215993c:	08dfff00 	ldarb	w0, [x24]
 2159940:	360003e0 	tbz	w0, #0, 21599bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959b34>
 2159944:	b94002e0 	ldr	w0, [x23]
 2159948:	6b00039f 	cmp	w28, w0
 215994c:	540000e1 	b.ne	2159968 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959ae0>
 2159950:	f9400263 	ldr	x3, [x19]
 2159954:	aa1b03e1 	mov	x1, x27
 2159958:	9101c3e2 	add	x2, sp, #0x70
 215995c:	aa1303e0 	mov	x0, x19
 2159960:	f9400863 	ldr	x3, [x3,#16]
 2159964:	d63f0060 	blr	x3
 2159968:	91002294 	add	x20, x20, #0x8
 215996c:	eb1402df 	cmp	x22, x20
 2159970:	54fffd81 	b.ne	2159920 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959a98>
 2159974:	a94573fb 	ldp	x27, x28, [sp,#80]
 2159978:	910032b5 	add	x21, x21, #0xc
 215997c:	eb15033f 	cmp	x25, x21
 2159980:	54fffb41 	b.ne	21598e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959a60>
 2159984:	a94363f7 	ldp	x23, x24, [sp,#48]
 2159988:	a9425bf5 	ldp	x21, x22, [sp,#32]
 215998c:	a9446bf9 	ldp	x25, x26, [sp,#64]
 2159990:	b900b27f 	str	wzr, [x19,#176]
 2159994:	a94153f3 	ldp	x19, x20, [sp,#16]
 2159998:	a8c87bfd 	ldp	x29, x30, [sp],#128
 215999c:	d65f03c0 	ret
 21599a0:	d2800001 	mov	x1, #0x0                   	// #0
 21599a4:	52800000 	mov	w0, #0x0                   	// #0
 21599a8:	94029b46 	bl	22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x785a8>
 21599ac:	17ffff8e 	b	21597e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95995c>
 21599b0:	2a1403e1 	mov	w1, w20
 21599b4:	d2800002 	mov	x2, #0x0                   	// #0
 21599b8:	17ffffb6 	b	2159890 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959a08>
 21599bc:	aa1803e0 	mov	x0, x24
 21599c0:	978b3228 	bl	426260 <__cxa_guard_acquire@plt>
 21599c4:	34fffc00 	cbz	w0, 2159944 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959abc>
 21599c8:	97955bd0 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 21599cc:	b90002e0 	str	w0, [x23]
 21599d0:	aa1803e0 	mov	x0, x24
 21599d4:	978b339b 	bl	426840 <__cxa_guard_release@plt>
 21599d8:	17ffffdb 	b	2159944 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959abc>
 21599dc:	52800001 	mov	w1, #0x0                   	// #0
 21599e0:	d2800002 	mov	x2, #0x0                   	// #0
 21599e4:	17ffffab 	b	2159890 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959a08>
 21599e8:	d2800001 	mov	x1, #0x0                   	// #0
 21599ec:	d503201f 	nop
 21599f0:	f8617803 	ldr	x3, [x0,x1,lsl #3]
 21599f4:	f8217843 	str	x3, [x2,x1,lsl #3]
 21599f8:	91000421 	add	x1, x1, #0x1
 21599fc:	6b01029f 	cmp	w20, w1
 2159a00:	54ffff8c 	b.gt	21599f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959b68>
 2159a04:	17ffffa2 	b	215988c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959a04>
