
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000204d6f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d870>:
 204d6f8:	a9b97bfd 	stp	x29, x30, [sp,#-112]!
 204d6fc:	910003fd 	mov	x29, sp
 204d700:	a9025bf5 	stp	x21, x22, [sp,#32]
 204d704:	a9405416 	ldp	x22, x21, [x0]
 204d708:	a90153f3 	stp	x19, x20, [sp,#16]
 204d70c:	a90363f7 	stp	x23, x24, [sp,#48]
 204d710:	aa0003f7 	mov	x23, x0
 204d714:	a9046bf9 	stp	x25, x26, [sp,#64]
 204d718:	aa0103fa 	mov	x26, x1
 204d71c:	cb1602a0 	sub	x0, x21, x22
 204d720:	f9002bfb 	str	x27, [sp,#80]
 204d724:	cb160033 	sub	x19, x1, x22
 204d728:	9343fc00 	asr	x0, x0, #3
 204d72c:	b4000980 	cbz	x0, 204d85c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d9d4>
 204d730:	d37ff803 	lsl	x3, x0, #1
 204d734:	928000f9 	mov	x25, #0xfffffffffffffff8    	// #-8
 204d738:	eb03001f 	cmp	x0, x3
 204d73c:	54000809 	b.ls	204d83c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d9b4>
 204d740:	aa1903e0 	mov	x0, x25
 204d744:	f90037e2 	str	x2, [sp,#104]
 204d748:	978f5d7e 	bl	424d40 <_Znwm@plt>
 204d74c:	aa0003f8 	mov	x24, x0
 204d750:	f94037e2 	ldr	x2, [sp,#104]
 204d754:	8b190019 	add	x25, x0, x25
 204d758:	9100201b 	add	x27, x0, #0x8
 204d75c:	aa0203e1 	mov	x1, x2
 204d760:	8b130300 	add	x0, x24, x19
 204d764:	940b031f 	bl	230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862c8>
 204d768:	eb16035f 	cmp	x26, x22
 204d76c:	540001e0 	b.eq	204d7a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d920>
 204d770:	aa1603f3 	mov	x19, x22
 204d774:	aa1803f4 	mov	x20, x24
 204d778:	aa1303e1 	mov	x1, x19
 204d77c:	aa1403e0 	mov	x0, x20
 204d780:	91002273 	add	x19, x19, #0x8
 204d784:	940b0323 	bl	230e410 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862f8>
 204d788:	eb13035f 	cmp	x26, x19
 204d78c:	91002294 	add	x20, x20, #0x8
 204d790:	54ffff41 	b.ne	204d778 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d8f0>
 204d794:	d100235b 	sub	x27, x26, #0x8
 204d798:	cb16037b 	sub	x27, x27, x22
 204d79c:	927df37b 	and	x27, x27, #0xfffffffffffffff8
 204d7a0:	9100437b 	add	x27, x27, #0x10
 204d7a4:	8b1b031b 	add	x27, x24, x27
 204d7a8:	eb15035f 	cmp	x26, x21
 204d7ac:	aa1a03f3 	mov	x19, x26
 204d7b0:	aa1b03f4 	mov	x20, x27
 204d7b4:	540001a0 	b.eq	204d7e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d960>
 204d7b8:	aa1303e1 	mov	x1, x19
 204d7bc:	aa1403e0 	mov	x0, x20
 204d7c0:	91002273 	add	x19, x19, #0x8
 204d7c4:	940b0313 	bl	230e410 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862f8>
 204d7c8:	eb1302bf 	cmp	x21, x19
 204d7cc:	91002294 	add	x20, x20, #0x8
 204d7d0:	54ffff41 	b.ne	204d7b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d930>
 204d7d4:	cb1a02a0 	sub	x0, x21, x26
 204d7d8:	d1002000 	sub	x0, x0, #0x8
 204d7dc:	927df000 	and	x0, x0, #0xfffffffffffffff8
 204d7e0:	91002000 	add	x0, x0, #0x8
 204d7e4:	8b00037b 	add	x27, x27, x0
 204d7e8:	eb1502df 	cmp	x22, x21
 204d7ec:	aa1603f3 	mov	x19, x22
 204d7f0:	540000e0 	b.eq	204d80c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d984>
 204d7f4:	d503201f 	nop
 204d7f8:	aa1303e0 	mov	x0, x19
 204d7fc:	91002273 	add	x19, x19, #0x8
 204d800:	940abbe4 	bl	22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x174678>
 204d804:	eb15027f 	cmp	x19, x21
 204d808:	54ffff81 	b.ne	204d7f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d970>
 204d80c:	b4000076 	cbz	x22, 204d818 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d990>
 204d810:	aa1603e0 	mov	x0, x22
 204d814:	978f5d8f 	bl	424e50 <_ZdlPv@plt>
 204d818:	a94153f3 	ldp	x19, x20, [sp,#16]
 204d81c:	a9425bf5 	ldp	x21, x22, [sp,#32]
 204d820:	a9006ef8 	stp	x24, x27, [x23]
 204d824:	f9000af9 	str	x25, [x23,#16]
 204d828:	a94363f7 	ldp	x23, x24, [sp,#48]
 204d82c:	a9446bf9 	ldp	x25, x26, [sp,#64]
 204d830:	f9402bfb 	ldr	x27, [sp,#80]
 204d834:	a8c77bfd 	ldp	x29, x30, [sp],#112
 204d838:	d65f03c0 	ret
 204d83c:	92fc0000 	mov	x0, #0x1fffffffffffffff    	// #2305843009213693951
 204d840:	eb00007f 	cmp	x3, x0
 204d844:	54fff7e8 	b.hi	204d740 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d8b8>
 204d848:	b50000c3 	cbnz	x3, 204d860 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d9d8>
 204d84c:	d280011b 	mov	x27, #0x8                   	// #8
 204d850:	d2800019 	mov	x25, #0x0                   	// #0
 204d854:	d2800018 	mov	x24, #0x0                   	// #0
 204d858:	17ffffc1 	b	204d75c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d8d4>
 204d85c:	d2800023 	mov	x3, #0x1                   	// #1
 204d860:	d37df079 	lsl	x25, x3, #3
 204d864:	17ffffb7 	b	204d740 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d8b8>
 204d868:	39018001 	strb	w1, [x0,#96]
 204d86c:	d65f03c0 	ret
 204d870:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 204d874:	b0006de1 	adrp	x1, 2e0a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8471a8>
 204d878:	9120e021 	add	x1, x1, #0x838
 204d87c:	91000421 	add	x1, x1, #0x1
 204d880:	910003fd 	mov	x29, sp
 204d884:	9100a3e0 	add	x0, sp, #0x28
 204d888:	f9000bf3 	str	x19, [sp,#16]
 204d88c:	aa0803f3 	mov	x19, x8
 204d890:	940b3270 	bl	231a250 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x192138>
 204d894:	aa1303e8 	mov	x8, x19
 204d898:	9100a3e0 	add	x0, sp, #0x28
 204d89c:	9406cbe9 	bl	2200840 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x78728>
 204d8a0:	aa1303e0 	mov	x0, x19
 204d8a4:	f9400bf3 	ldr	x19, [sp,#16]
 204d8a8:	a8c37bfd 	ldp	x29, x30, [sp],#48
 204d8ac:	d65f03c0 	ret
 204d8b0:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 204d8b4:	b0006de1 	adrp	x1, 2e0a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8471a8>
 204d8b8:	9120e021 	add	x1, x1, #0x838
 204d8bc:	91028421 	add	x1, x1, #0xa1
