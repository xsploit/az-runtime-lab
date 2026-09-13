
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021375d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937748>:
 21375d0:	a9b47bfd 	stp	x29, x30, [sp,#-192]!
 21375d4:	910003fd 	mov	x29, sp
 21375d8:	a90153f3 	stp	x19, x20, [sp,#16]
 21375dc:	f9400c13 	ldr	x19, [x0,#24]
 21375e0:	a9025bf5 	stp	x21, x22, [sp,#32]
 21375e4:	aa0003f6 	mov	x22, x0
 21375e8:	a90573fb 	stp	x27, x28, [sp,#80]
 21375ec:	aa0103fb 	mov	x27, x1
 21375f0:	39402420 	ldrb	w0, [x1,#9]
 21375f4:	79401826 	ldrh	w6, [x1,#12]
 21375f8:	79401425 	ldrh	w5, [x1,#10]
 21375fc:	f9405e61 	ldr	x1, [x19,#184]
 2137600:	d3410404 	ubfx	x4, x0, #1, #1
 2137604:	d3420802 	ubfx	x2, x0, #2, #1
 2137608:	d3430c00 	ubfx	x0, x0, #3, #1
 213760c:	790143e6 	strh	w6, [sp,#160]
 2137610:	790147e5 	strh	w5, [sp,#162]
 2137614:	390293e4 	strb	w4, [sp,#164]
 2137618:	390297e2 	strb	w2, [sp,#165]
 213761c:	39029be0 	strb	w0, [sp,#166]
 2137620:	790153ff 	strh	wzr, [sp,#168]
 2137624:	f9005bff 	str	xzr, [sp,#176]
 2137628:	b900bbff 	str	wzr, [sp,#184]
 213762c:	b4000f81 	cbz	x1, 213781c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937994>
 2137630:	f9400264 	ldr	x4, [x19]
 2137634:	aa1303e0 	mov	x0, x19
 2137638:	910283e2 	add	x2, sp, #0xa0
 213763c:	f9401084 	ldr	x4, [x4,#32]
 2137640:	d63f0080 	blr	x4
 2137644:	b940b260 	ldr	w0, [x19,#176]
 2137648:	7100001f 	cmp	w0, #0x0
 213764c:	5400014c 	b.gt	2137674 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9377ec>
 2137650:	f8416360 	ldur	x0, [x27,#22]
 2137654:	f807e2c0 	stur	x0, [x22,#126]
 2137658:	79403f60 	ldrh	w0, [x27,#30]
 213765c:	79010ec0 	strh	w0, [x22,#134]
 2137660:	a94153f3 	ldp	x19, x20, [sp,#16]
 2137664:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2137668:	a94573fb 	ldp	x27, x28, [sp,#80]
 213766c:	a8cc7bfd 	ldp	x29, x30, [sp],#192
 2137670:	d65f03c0 	ret
 2137674:	91010274 	add	x20, x19, #0x40
 2137678:	aa1403e0 	mov	x0, x20
 213767c:	9407d29d 	bl	232c0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fd8>
 2137680:	72001c1f 	tst	w0, #0xff
 2137684:	54fffe60 	b.eq	2137650 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9377c8>
 2137688:	a9046bf9 	stp	x25, x26, [sp,#64]
 213768c:	b9408275 	ldr	w21, [x19,#128]
 2137690:	b9009a7f 	str	wzr, [x19,#152]
 2137694:	710002bf 	cmp	w21, #0x0
 2137698:	54000e00 	b.eq	2137858 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9379d0>
 213769c:	54000c8d 	b.le	213782c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9379a4>
 21376a0:	937d7ea0 	sbfiz	x0, x21, #3, #32
 21376a4:	978bb64b 	bl	424fd0 <malloc@plt>
 21376a8:	91004004 	add	x4, x0, #0x10
 21376ac:	aa0003e2 	mov	x2, x0
 21376b0:	f9403a60 	ldr	x0, [x19,#112]
 21376b4:	510006a1 	sub	w1, w21, #0x1
 21376b8:	eb04001f 	cmp	x0, x4
 21376bc:	91004004 	add	x4, x0, #0x10
 21376c0:	fa443042 	ccmp	x2, x4, #0x2, cc
 21376c4:	7a442820 	ccmp	w1, #0x4, #0x0, cs
 21376c8:	54000ce9 	b.ls	2137864 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9379dc>
 21376cc:	53017ea4 	lsr	w4, w21, #1
 21376d0:	d2800001 	mov	x1, #0x0                   	// #0
 21376d4:	d37cec84 	lsl	x4, x4, #4
 21376d8:	3ce16800 	ldr	q0, [x0,x1]
 21376dc:	3ca16840 	str	q0, [x2,x1]
 21376e0:	91004021 	add	x1, x1, #0x10
 21376e4:	eb04003f 	cmp	x1, x4
 21376e8:	54ffff81 	b.ne	21376d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937850>
 21376ec:	121f7aa1 	and	w1, w21, #0xfffffffe
 21376f0:	36000075 	tbz	w21, #0, 21376fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937874>
 21376f4:	f8617800 	ldr	x0, [x0,x1,lsl #3]
 21376f8:	f8217840 	str	x0, [x2,x1,lsl #3]
 21376fc:	2a1503e1 	mov	w1, w21
 2137700:	f9404660 	ldr	x0, [x19,#136]
 2137704:	f9004662 	str	x2, [x19,#136]
 2137708:	b9009261 	str	w1, [x19,#144]
 213770c:	b9009a75 	str	w21, [x19,#152]
 2137710:	978bb4f8 	bl	424af0 <free@plt>
 2137714:	aa1403e0 	mov	x0, x20
 2137718:	9407d27e 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 213771c:	aa1303e0 	mov	x0, x19
 2137720:	52800381 	mov	w1, #0x1c                  	// #28
 2137724:	f84a0c14 	ldr	x20, [x0,#160]!
 2137728:	b9401019 	ldr	w25, [x0,#16]
 213772c:	9b215320 	smaddl	x0, w25, w1, x20
 2137730:	f90037e0 	str	x0, [sp,#104]
 2137734:	eb00029f 	cmp	x20, x0
 2137738:	540006c0 	b.eq	2137810 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937988>
 213773c:	b000245a 	adrp	x26, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 2137740:	912a7340 	add	x0, x26, #0xa9c
 2137744:	a90363f7 	stp	x23, x24, [sp,#48]
 2137748:	d000d078 	adrp	x24, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 213774c:	91186318 	add	x24, x24, #0x618
 2137750:	f9003be0 	str	x0, [sp,#112]
 2137754:	91022260 	add	x0, x19, #0x88
 2137758:	f9003fe0 	str	x0, [sp,#120]
 213775c:	d503201f 	nop
 2137760:	a9400680 	ldp	x0, x1, [x20]
 2137764:	a90807e0 	stp	x0, x1, [sp,#128]
 2137768:	f9403fe0 	ldr	x0, [sp,#120]
 213776c:	d000d061 	adrp	x1, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 2137770:	91188037 	add	x23, x1, #0x620
 2137774:	b9801015 	ldrsw	x21, [x0,#16]
 2137778:	f9400a80 	ldr	x0, [x20,#16]
 213777c:	f9004be0 	str	x0, [sp,#144]
 2137780:	f9404660 	ldr	x0, [x19,#136]
 2137784:	b9401a81 	ldr	w1, [x20,#24]
 2137788:	b9009be1 	str	w1, [sp,#152]
 213778c:	aa0003fc 	mov	x28, x0
 2137790:	8b150c15 	add	x21, x0, x21, lsl #3
 2137794:	eb15001f 	cmp	x0, x21
 2137798:	54000320 	b.eq	21377fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937974>
 213779c:	d503201f 	nop
 21377a0:	f940039a 	ldr	x26, [x28]
 21377a4:	f9403be1 	ldr	x1, [sp,#112]
 21377a8:	91002340 	add	x0, x26, #0x8
 21377ac:	eb01001f 	cmp	x0, x1
 21377b0:	54000203 	b.cc	21377f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937968>
 21377b4:	f240041f 	tst	x0, #0x3
 21377b8:	540001c1 	b.ne	21377f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937968>
 21377bc:	b9400b59 	ldr	w25, [x26,#8]
 21377c0:	08dfff00 	ldarb	w0, [x24]
 21377c4:	360003a0 	tbz	w0, #0, 2137838 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9379b0>
 21377c8:	b94002e0 	ldr	w0, [x23]
 21377cc:	6b00033f 	cmp	w25, w0
 21377d0:	54000101 	b.ne	21377f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937968>
 21377d4:	f9400265 	ldr	x5, [x19]
 21377d8:	aa1a03e1 	mov	x1, x26
 21377dc:	910203e2 	add	x2, sp, #0x80
 21377e0:	aa1303e0 	mov	x0, x19
 21377e4:	f94008a5 	ldr	x5, [x5,#16]
 21377e8:	d63f00a0 	blr	x5
 21377ec:	d503201f 	nop
 21377f0:	9100239c 	add	x28, x28, #0x8
 21377f4:	eb1c02bf 	cmp	x21, x28
 21377f8:	54fffd41 	b.ne	21377a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937918>
 21377fc:	f94037e0 	ldr	x0, [sp,#104]
 2137800:	91007294 	add	x20, x20, #0x1c
 2137804:	eb14001f 	cmp	x0, x20
 2137808:	54fffac1 	b.ne	2137760 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9378d8>
 213780c:	a94363f7 	ldp	x23, x24, [sp,#48]
 2137810:	a9446bf9 	ldp	x25, x26, [sp,#64]
 2137814:	b900b27f 	str	wzr, [x19,#176]
 2137818:	17ffff8e 	b	2137650 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9377c8>
 213781c:	d2800001 	mov	x1, #0x0                   	// #0
 2137820:	52800000 	mov	w0, #0x0                   	// #0
 2137824:	940323a7 	bl	22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x785a8>
 2137828:	17ffff8a 	b	2137650 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9377c8>
 213782c:	2a1503e1 	mov	w1, w21
 2137830:	d2800002 	mov	x2, #0x0                   	// #0
 2137834:	17ffffb3 	b	2137700 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937878>
 2137838:	aa1803e0 	mov	x0, x24
 213783c:	978bba89 	bl	426260 <__cxa_guard_acquire@plt>
 2137840:	34fffc40 	cbz	w0, 21377c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937940>
 2137844:	9795e431 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 2137848:	b90002e0 	str	w0, [x23]
 213784c:	aa1803e0 	mov	x0, x24
 2137850:	978bbbfc 	bl	426840 <__cxa_guard_release@plt>
 2137854:	17ffffdd 	b	21377c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937940>
 2137858:	52800001 	mov	w1, #0x0                   	// #0
 213785c:	d2800002 	mov	x2, #0x0                   	// #0
 2137860:	17ffffa8 	b	2137700 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937878>
 2137864:	d2800001 	mov	x1, #0x0                   	// #0
 2137868:	f8617804 	ldr	x4, [x0,x1,lsl #3]
 213786c:	f8217844 	str	x4, [x2,x1,lsl #3]
 2137870:	91000421 	add	x1, x1, #0x1
 2137874:	6b0102bf 	cmp	w21, w1
 2137878:	54ffff8c 	b.gt	2137868 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9379e0>
 213787c:	17ffffa0 	b	21376fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937874>
 2137880:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
 2137884:	52800022 	mov	w2, #0x1                   	// #1
 2137888:	910003fd 	mov	x29, sp
 213788c:	a90153f3 	stp	x19, x20, [sp,#16]
 2137890:	390203e2 	strb	w2, [sp,#128]
 2137894:	39404c22 	ldrb	w2, [x1,#19]
 2137898:	f9403414 	ldr	x20, [x0,#104]
 213789c:	39404420 	ldrb	w0, [x1,#17]
 21378a0:	53180442 	ubfiz	w2, w2, #8, #2
 21378a4:	39404823 	ldrb	w3, [x1,#18]
 21378a8:	39404021 	ldrb	w1, [x1,#16]
 21378ac:	53180400 	ubfiz	w0, w0, #8, #2
 21378b0:	2a030042 	orr	w2, w2, w3
 21378b4:	2a010000 	orr	w0, w0, w1
 21378b8:	f9405e81 	ldr	x1, [x20,#184]
 21378bc:	531a6442 	lsl	w2, w2, #6
 21378c0:	531a6400 	lsl	w0, w0, #6
 21378c4:	291083e2 	stp	w2, w0, [sp,#132]
 21378c8:	b4000e41 	cbz	x1, 2137a90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937c08>
 21378cc:	f9400283 	ldr	x3, [x20]
 21378d0:	aa1403e0 	mov	x0, x20
 21378d4:	910203e2 	add	x2, sp, #0x80
 21378d8:	f9401063 	ldr	x3, [x3,#32]
 21378dc:	d63f0060 	blr	x3
 21378e0:	b940b280 	ldr	w0, [x20,#176]
 21378e4:	7100001f 	cmp	w0, #0x0
 21378e8:	5400008c 	b.gt	21378f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937a70>
 21378ec:	a94153f3 	ldp	x19, x20, [sp,#16]
 21378f0:	a8c97bfd 	ldp	x29, x30, [sp],#144
 21378f4:	d65f03c0 	ret
 21378f8:	91010293 	add	x19, x20, #0x40
 21378fc:	aa1303e0 	mov	x0, x19
 2137900:	9407d1fc 	bl	232c0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fd8>
 2137904:	72001c1f 	tst	w0, #0xff
 2137908:	54ffff20 	b.eq	21378ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937a64>
 213790c:	a9025bf5 	stp	x21, x22, [sp,#32]
 2137910:	b9408295 	ldr	w21, [x20,#128]
 2137914:	a9046bf9 	stp	x25, x26, [sp,#64]
 2137918:	710002bf 	cmp	w21, #0x0
 213791c:	b9009a9f 	str	wzr, [x20,#152]
 2137920:	54000d60 	b.eq	2137acc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937c44>
 2137924:	54000bed 	b.le	2137aa0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937c18>
 2137928:	937d7ea0 	sbfiz	x0, x21, #3, #32
 213792c:	978bb5a9 	bl	424fd0 <malloc@plt>
 2137930:	91004003 	add	x3, x0, #0x10
 2137934:	aa0003e2 	mov	x2, x0
 2137938:	f9403a80 	ldr	x0, [x20,#112]
 213793c:	510006a1 	sub	w1, w21, #0x1
 2137940:	eb03001f 	cmp	x0, x3
 2137944:	91004003 	add	x3, x0, #0x10
 2137948:	fa433042 	ccmp	x2, x3, #0x2, cc
 213794c:	7a442820 	ccmp	w1, #0x4, #0x0, cs
 2137950:	54000c49 	b.ls	2137ad8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937c50>
 2137954:	53017ea3 	lsr	w3, w21, #1
 2137958:	d2800001 	mov	x1, #0x0                   	// #0
 213795c:	d37cec63 	lsl	x3, x3, #4
 2137960:	3ce16800 	ldr	q0, [x0,x1]
 2137964:	3ca16840 	str	q0, [x2,x1]
 2137968:	91004021 	add	x1, x1, #0x10
 213796c:	eb03003f 	cmp	x1, x3
 2137970:	54ffff81 	b.ne	2137960 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937ad8>
 2137974:	121f7aa1 	and	w1, w21, #0xfffffffe
 2137978:	36000075 	tbz	w21, #0, 2137984 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937afc>
 213797c:	f8617800 	ldr	x0, [x0,x1,lsl #3]
 2137980:	f8217840 	str	x0, [x2,x1,lsl #3]
 2137984:	2a1503e1 	mov	w1, w21
 2137988:	f9404680 	ldr	x0, [x20,#136]
 213798c:	b9009281 	str	w1, [x20,#144]
 2137990:	91022281 	add	x1, x20, #0x88
 2137994:	f9004682 	str	x2, [x20,#136]
 2137998:	b9009a95 	str	w21, [x20,#152]
 213799c:	f90037e1 	str	x1, [sp,#104]
 21379a0:	978bb454 	bl	424af0 <free@plt>
 21379a4:	aa1303e0 	mov	x0, x19
 21379a8:	9407d1da 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21379ac:	aa1403e0 	mov	x0, x20
 21379b0:	f84a0c01 	ldr	x1, [x0,#160]!
 21379b4:	aa0103f6 	mov	x22, x1
 21379b8:	b980101a 	ldrsw	x26, [x0,#16]
 21379bc:	8b1a0c3a 	add	x26, x1, x26, lsl #3
 21379c0:	eb1a003f 	cmp	x1, x26
 21379c4:	540005a0 	b.eq	2137a78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937bf0>
 21379c8:	d000d079 	adrp	x25, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 21379cc:	91196339 	add	x25, x25, #0x658
 21379d0:	a90363f7 	stp	x23, x24, [sp,#48]
 21379d4:	d503201f 	nop
 21379d8:	b0002458 	adrp	x24, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 21379dc:	f94037e0 	ldr	x0, [sp,#104]
 21379e0:	d000d077 	adrp	x23, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 21379e4:	f9404693 	ldr	x19, [x20,#136]
 21379e8:	912a7318 	add	x24, x24, #0xa9c
 21379ec:	b9801015 	ldrsw	x21, [x0,#16]
 21379f0:	911982f7 	add	x23, x23, #0x660
 21379f4:	f94002c0 	ldr	x0, [x22]
 21379f8:	f9003fe0 	str	x0, [sp,#120]
 21379fc:	8b150e75 	add	x21, x19, x21, lsl #3
 2137a00:	eb15027f 	cmp	x19, x21
 2137a04:	54000320 	b.eq	2137a68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937be0>
 2137a08:	a90573fb 	stp	x27, x28, [sp,#80]
 2137a0c:	d503201f 	nop
 2137a10:	f940027c 	ldr	x28, [x19]
 2137a14:	91002380 	add	x0, x28, #0x8
 2137a18:	eb18001f 	cmp	x0, x24
 2137a1c:	540001e3 	b.cc	2137a58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937bd0>
 2137a20:	f240041f 	tst	x0, #0x3
 2137a24:	540001a1 	b.ne	2137a58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937bd0>
 2137a28:	b9400b9b 	ldr	w27, [x28,#8]
 2137a2c:	08dfff20 	ldarb	w0, [x25]
 2137a30:	360003e0 	tbz	w0, #0, 2137aac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937c24>
 2137a34:	b94002e0 	ldr	w0, [x23]
 2137a38:	6b00037f 	cmp	w27, w0
 2137a3c:	540000e1 	b.ne	2137a58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937bd0>
 2137a40:	f9400283 	ldr	x3, [x20]
 2137a44:	aa1c03e1 	mov	x1, x28
 2137a48:	9101e3e2 	add	x2, sp, #0x78
 2137a4c:	aa1403e0 	mov	x0, x20
 2137a50:	f9400863 	ldr	x3, [x3,#16]
 2137a54:	d63f0060 	blr	x3
 2137a58:	91002273 	add	x19, x19, #0x8
 2137a5c:	eb1302bf 	cmp	x21, x19
 2137a60:	54fffd81 	b.ne	2137a10 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937b88>
 2137a64:	a94573fb 	ldp	x27, x28, [sp,#80]
 2137a68:	910022d6 	add	x22, x22, #0x8
 2137a6c:	eb16035f 	cmp	x26, x22
 2137a70:	54fffb41 	b.ne	21379d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937b50>
 2137a74:	a94363f7 	ldp	x23, x24, [sp,#48]
 2137a78:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2137a7c:	a9446bf9 	ldp	x25, x26, [sp,#64]
 2137a80:	b900b29f 	str	wzr, [x20,#176]
 2137a84:	a94153f3 	ldp	x19, x20, [sp,#16]
 2137a88:	a8c97bfd 	ldp	x29, x30, [sp],#144
 2137a8c:	d65f03c0 	ret
 2137a90:	d2800001 	mov	x1, #0x0                   	// #0
 2137a94:	52800000 	mov	w0, #0x0                   	// #0
 2137a98:	9403230a 	bl	22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x785a8>
 2137a9c:	17ffff94 	b	21378ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937a64>
 2137aa0:	2a1503e1 	mov	w1, w21
 2137aa4:	d2800002 	mov	x2, #0x0                   	// #0
 2137aa8:	17ffffb8 	b	2137988 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937b00>
 2137aac:	aa1903e0 	mov	x0, x25
 2137ab0:	978bb9ec 	bl	426260 <__cxa_guard_acquire@plt>
 2137ab4:	34fffc00 	cbz	w0, 2137a34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937bac>
 2137ab8:	9795e394 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 2137abc:	b90002e0 	str	w0, [x23]
 2137ac0:	aa1903e0 	mov	x0, x25
 2137ac4:	978bbb5f 	bl	426840 <__cxa_guard_release@plt>
 2137ac8:	17ffffdb 	b	2137a34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937bac>
 2137acc:	52800001 	mov	w1, #0x0                   	// #0
 2137ad0:	d2800002 	mov	x2, #0x0                   	// #0
 2137ad4:	17ffffad 	b	2137988 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937b00>
 2137ad8:	d2800001 	mov	x1, #0x0                   	// #0
 2137adc:	d503201f 	nop
 2137ae0:	f8617803 	ldr	x3, [x0,x1,lsl #3]
 2137ae4:	f8217843 	str	x3, [x2,x1,lsl #3]
 2137ae8:	91000421 	add	x1, x1, #0x1
 2137aec:	6b0102bf 	cmp	w21, w1
 2137af0:	54ffff8c 	b.gt	2137ae0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937c58>
 2137af4:	17ffffa4 	b	2137984 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937afc>
 2137af8:	b4000201 	cbz	x1, 2137b38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937cb0>
 2137afc:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 2137b00:	910003fd 	mov	x29, sp
 2137b04:	a90153f3 	stp	x19, x20, [sp,#16]
 2137b08:	aa0003f4 	mov	x20, x0
 2137b0c:	aa0103f3 	mov	x19, x1
 2137b10:	91000821 	add	x1, x1, #0x2
 2137b14:	97fffdb7 	bl	21371f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937368>
 2137b18:	aa1303e1 	mov	x1, x19
 2137b1c:	aa1403e0 	mov	x0, x20
 2137b20:	97fffeac 	bl	21375d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937748>
 2137b24:	aa1303e1 	mov	x1, x19
 2137b28:	aa1403e0 	mov	x0, x20
 2137b2c:	a94153f3 	ldp	x19, x20, [sp,#16]
 2137b30:	a8c27bfd 	ldp	x29, x30, [sp],#32
 2137b34:	17ffff53 	b	2137880 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9379f8>
 2137b38:	d65f03c0 	ret
 2137b3c:	d503201f 	nop
