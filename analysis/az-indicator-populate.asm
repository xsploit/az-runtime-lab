
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000207d6c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87d838>:
 207d6c0:	d103c3ff 	sub	sp, sp, #0xf0
 207d6c4:	a9017bfd 	stp	x29, x30, [sp,#16]
 207d6c8:	910043fd 	add	x29, sp, #0x10
 207d6cc:	fd003be8 	str	d8, [sp,#112]
 207d6d0:	9e670028 	fmov	d8, x1
 207d6d4:	a90253f3 	stp	x19, x20, [sp,#32]
 207d6d8:	aa0003f4 	mov	x20, x0
 207d6dc:	91002000 	add	x0, x0, #0x8
 207d6e0:	a9035bf5 	stp	x21, x22, [sp,#48]
 207d6e4:	aa0003f5 	mov	x21, x0
 207d6e8:	aa0203f6 	mov	x22, x2
 207d6ec:	d2800800 	mov	x0, #0x40                  	// #64
 207d6f0:	a908d3f5 	stp	x21, x20, [sp,#136]
 207d6f4:	978e9d93 	bl	424d40 <_Znwm@plt>
 207d6f8:	aa1503e1 	mov	x1, x21
 207d6fc:	aa0003f3 	mov	x19, x0
 207d700:	97ff739a 	bl	205a568 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85a6e0>
 207d704:	910bc280 	add	x0, x20, #0x2f0
 207d708:	f90077f3 	str	x19, [sp,#232]
 207d70c:	a9408801 	ldp	x1, x2, [x0,#8]
 207d710:	eb02003f 	cmp	x1, x2
 207d714:	54004f40 	b.eq	207e0fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e274>
 207d718:	f90077ff 	str	xzr, [sp,#232]
 207d71c:	f8008433 	str	x19, [x1],#8
 207d720:	f9000401 	str	x1, [x0,#8]
 207d724:	f94077f3 	ldr	x19, [sp,#232]
 207d728:	b4000233 	cbz	x19, 207d76c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87d8e4>
 207d72c:	f9400261 	ldr	x1, [x19]
 207d730:	d0fffee0 	adrp	x0, 205b000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85b178>
 207d734:	913da000 	add	x0, x0, #0xf68
 207d738:	f9400421 	ldr	x1, [x1,#8]
 207d73c:	eb00003f 	cmp	x1, x0
 207d740:	aa1303e0 	mov	x0, x19
 207d744:	54004e21 	b.ne	207e108 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e280>
 207d748:	f0006c61 	adrp	x1, 2e0c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8491a8>
 207d74c:	91380021 	add	x1, x1, #0xe00
 207d750:	f8028401 	str	x1, [x0],#40
 207d754:	97ffb0c5 	bl	2069a68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x869be0>
 207d758:	91002260 	add	x0, x19, #0x8
 207d75c:	97ff7a97 	bl	205c1b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x85c330>
 207d760:	aa1303e0 	mov	x0, x19
 207d764:	d2800801 	mov	x1, #0x40                  	// #64
 207d768:	978ea3be 	bl	426660 <_ZdlPvm@plt>
 207d76c:	d2800d00 	mov	x0, #0x68                  	// #104
 207d770:	978e9d74 	bl	424d40 <_Znwm@plt>
 207d774:	9e660102 	fmov	x2, d8
 207d778:	aa0003f3 	mov	x19, x0
 207d77c:	f94047e1 	ldr	x1, [sp,#136]
 207d780:	aa1603e3 	mov	x3, x22
 207d784:	97ffd749 	bl	20734a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x873620>
 207d788:	f9404be0 	ldr	x0, [sp,#144]
 207d78c:	f90077f3 	str	x19, [sp,#232]
 207d790:	910c2000 	add	x0, x0, #0x308
 207d794:	a9408801 	ldp	x1, x2, [x0,#8]
 207d798:	eb02003f 	cmp	x1, x2
 207d79c:	54004a60 	b.eq	207e0e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e260>
 207d7a0:	a90463f7 	stp	x23, x24, [sp,#64]
 207d7a4:	a9056bf9 	stp	x25, x26, [sp,#80]
 207d7a8:	f90077ff 	str	xzr, [sp,#232]
 207d7ac:	f8008433 	str	x19, [x1],#8
 207d7b0:	f9000401 	str	x1, [x0,#8]
 207d7b4:	f94077f5 	ldr	x21, [sp,#232]
 207d7b8:	b40008d5 	cbz	x21, 207d8d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87da48>
 207d7bc:	f94002a1 	ldr	x1, [x21]
 207d7c0:	90ffffc0 	adrp	x0, 2075000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x875178>
 207d7c4:	913f8000 	add	x0, x0, #0xfe0
 207d7c8:	f9400421 	ldr	x1, [x1,#8]
 207d7cc:	eb00003f 	cmp	x1, x0
 207d7d0:	aa1503e0 	mov	x0, x21
 207d7d4:	540049e1 	b.ne	207e110 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e288>
 207d7d8:	d0006ca1 	adrp	x1, 2e13000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8501a8>
 207d7dc:	910aa021 	add	x1, x1, #0x2a8
 207d7e0:	f9402ab3 	ldr	x19, [x21,#80]
 207d7e4:	f8050401 	str	x1, [x0],#80
 207d7e8:	f9400419 	ldr	x25, [x0,#8]
 207d7ec:	eb19027f 	cmp	x19, x25
 207d7f0:	54000360 	b.eq	207d85c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87d9d4>
 207d7f4:	b0ff36f7 	adrp	x23, 75a000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x61258>
 207d7f8:	d0002b78 	adrp	x24, 25eb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x281a8>
 207d7fc:	912382f7 	add	x23, x23, #0x8e0
 207d800:	910dc318 	add	x24, x24, #0x370
 207d804:	14000009 	b	207d828 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87d9a0>
 207d808:	f8018418 	str	x24, [x0],#24
 207d80c:	979b7385 	bl	75a620 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x61878>
 207d810:	aa1403e0 	mov	x0, x20
 207d814:	d281f201 	mov	x1, #0xf90                 	// #3984
 207d818:	978ea392 	bl	426660 <_ZdlPvm@plt>
 207d81c:	91002273 	add	x19, x19, #0x8
 207d820:	eb13033f 	cmp	x25, x19
 207d824:	540001a0 	b.eq	207d858 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87d9d0>
 207d828:	f9400274 	ldr	x20, [x19]
 207d82c:	b4ffff94 	cbz	x20, 207d81c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87d994>
 207d830:	f9400280 	ldr	x0, [x20]
 207d834:	f9400401 	ldr	x1, [x0,#8]
 207d838:	aa1403e0 	mov	x0, x20
 207d83c:	eb17003f 	cmp	x1, x23
 207d840:	54fffe40 	b.eq	207d808 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87d980>
 207d844:	d63f0020 	blr	x1
 207d848:	91002273 	add	x19, x19, #0x8
 207d84c:	eb13033f 	cmp	x25, x19
 207d850:	54fffec1 	b.ne	207d828 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87d9a0>
 207d854:	d503201f 	nop
 207d858:	f9402ab9 	ldr	x25, [x21,#80]
 207d85c:	b4000079 	cbz	x25, 207d868 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87d9e0>
 207d860:	aa1903e0 	mov	x0, x25
 207d864:	978e9d7b 	bl	424e50 <_ZdlPv@plt>
 207d868:	f94026a0 	ldr	x0, [x21,#72]
 207d86c:	b40001e0 	cbz	x0, 207d8a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87da20>
 207d870:	f0006ca1 	adrp	x1, 2e14000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8511a8>
 207d874:	f9444c21 	ldr	x1, [x1,#2200]
 207d878:	b40041e1 	cbz	x1, 207e0b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e22c>
 207d87c:	91003002 	add	x2, x0, #0xc
 207d880:	885ffc41 	ldaxr	w1, [x2]
 207d884:	51000423 	sub	w3, w1, #0x1
 207d888:	8804fc43 	stlxr	w4, w3, [x2]
 207d88c:	35ffffa4 	cbnz	w4, 207d880 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87d9f8>
 207d890:	7100043f 	cmp	w1, #0x1
 207d894:	540000a1 	b.ne	207d8a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87da20>
 207d898:	f9400001 	ldr	x1, [x0]
 207d89c:	f9400c21 	ldr	x1, [x1,#24]
 207d8a0:	d63f0020 	blr	x1
 207d8a4:	d503201f 	nop
 207d8a8:	aa1503e0 	mov	x0, x21
 207d8ac:	d0006ca1 	adrp	x1, 2e13000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8501a8>
 207d8b0:	9109e021 	add	x1, x1, #0x278
 207d8b4:	f8028401 	str	x1, [x0],#40
 207d8b8:	97ffb06c 	bl	2069a68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x869be0>
 207d8bc:	910022a0 	add	x0, x21, #0x8
 207d8c0:	97ffdf04 	bl	20754d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x875648>
 207d8c4:	aa1503e0 	mov	x0, x21
 207d8c8:	d2800d01 	mov	x1, #0x68                  	// #104
 207d8cc:	978ea365 	bl	426660 <_ZdlPvm@plt>
 207d8d0:	a94002da 	ldp	x26, x0, [x22]
 207d8d4:	f90053e0 	str	x0, [sp,#160]
 207d8d8:	d2800017 	mov	x23, #0x0                   	// #0
 207d8dc:	eb1a001f 	cmp	x0, x26
 207d8e0:	54003160 	b.eq	207df0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e084>
 207d8e4:	d28d1453 	mov	x19, #0x68a2                	// #26786
 207d8e8:	d2801674 	mov	x20, #0xb3                  	// #179
 207d8ec:	f2a7f113 	movk	x19, #0x3f88, lsl #16
 207d8f0:	f0ffff40 	adrp	x0, 2068000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x868178>
 207d8f4:	f2cbadd3 	movk	x19, #0x5d6e, lsl #32
 207d8f8:	91072000 	add	x0, x0, #0x1c8
 207d8fc:	f2f12014 	movk	x20, #0x8900, lsl #48
 207d900:	f2e03bd3 	movk	x19, #0x1de, lsl #48
 207d904:	a90673fb 	stp	x27, x28, [sp,#96]
 207d908:	f9004fe0 	str	x0, [sp,#152]
 207d90c:	d503201f 	nop
 207d910:	9e660101 	fmov	x1, d8
 207d914:	9103a3e0 	add	x0, sp, #0xe8
 207d918:	38776b56 	ldrb	w22, [x26,x23]
 207d91c:	2a1703f5 	mov	w21, w23
 207d920:	940ad8f0 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 207d924:	9103a3e0 	add	x0, sp, #0xe8
 207d928:	940a70a6 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 207d92c:	39400004 	ldrb	w4, [x0]
 207d930:	d2800001 	mov	x1, #0x0                   	// #0
 207d934:	35003664 	cbnz	w4, 207e000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e178>
 207d938:	92401eb5 	and	x21, x21, #0xff
 207d93c:	9103a3e0 	add	x0, sp, #0xe8
 207d940:	aa0102a1 	orr	x1, x21, x1
 207d944:	f9005be1 	str	x1, [sp,#176]
 207d948:	9409fb2e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 207d94c:	f0006ca0 	adrp	x0, 2e14000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8511a8>
 207d950:	91229800 	add	x0, x0, #0x8a6
 207d954:	97fff667 	bl	207b2f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87b468>
 207d958:	8b001001 	add	x1, x0, x0, lsl #4
 207d95c:	f0006ca2 	adrp	x2, 2e14000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8511a8>
 207d960:	8b010c01 	add	x1, x0, x1, lsl #3
 207d964:	9122f840 	add	x0, x2, #0x8be
 207d968:	91019422 	add	x2, x1, #0x65
 207d96c:	9bd47c41 	umulh	x1, x2, x20
 207d970:	d378fc21 	lsr	x1, x1, #56
 207d974:	9b138821 	msub	x1, x1, x19, x2
 207d978:	8b011022 	add	x2, x1, x1, lsl #4
 207d97c:	8b020c21 	add	x1, x1, x2, lsl #3
 207d980:	91011022 	add	x2, x1, #0x44
 207d984:	9bd47c41 	umulh	x1, x2, x20
 207d988:	d378fc21 	lsr	x1, x1, #56
 207d98c:	9b138821 	msub	x1, x1, x19, x2
 207d990:	8b011022 	add	x2, x1, x1, lsl #4
 207d994:	8b020c21 	add	x1, x1, x2, lsl #3
 207d998:	9100f822 	add	x2, x1, #0x3e
 207d99c:	9bd47c41 	umulh	x1, x2, x20
 207d9a0:	d378fc21 	lsr	x1, x1, #56
 207d9a4:	9b138821 	msub	x1, x1, x19, x2
 207d9a8:	8b011022 	add	x2, x1, x1, lsl #4
 207d9ac:	8b020c21 	add	x1, x1, x2, lsl #3
 207d9b0:	9100b422 	add	x2, x1, #0x2d
 207d9b4:	9bd47c41 	umulh	x1, x2, x20
 207d9b8:	d378fc21 	lsr	x1, x1, #56
 207d9bc:	9b138821 	msub	x1, x1, x19, x2
