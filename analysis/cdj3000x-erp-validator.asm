
runtime-lab/cdj3000x/rootfs/home/root/pdj/EP145:     file format elf64-littleaarch64


Disassembly of section .text:

000000000225f800 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92c430>:
 225f800:	d109c3ff 	sub	sp, sp, #0x270
 225f804:	a9007bfd 	stp	x29, x30, [sp]
 225f808:	910003fd 	mov	x29, sp
 225f80c:	b9400802 	ldr	w2, [x0,#8]
 225f810:	a90153f3 	stp	x19, x20, [sp,#16]
 225f814:	7101005f 	cmp	w2, #0x40
 225f818:	540007c0 	b.eq	225f910 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92c540>
 225f81c:	f000ec60 	adrp	x0, 3fee000 <_ZTISt11range_error@@GLIBCXX_3.4+0x143c0>
 225f820:	d2800013 	mov	x19, #0x0                   	// #0
 225f824:	39630801 	ldrb	w1, [x0,#2242]
 225f828:	350000c1 	cbnz	w1, 225f840 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92c470>
 225f82c:	aa1303e0 	mov	x0, x19
 225f830:	a9407bfd 	ldp	x29, x30, [sp]
 225f834:	a94153f3 	ldp	x19, x20, [sp,#16]
 225f838:	9109c3ff 	add	sp, sp, #0x270
 225f83c:	d65f03c0 	ret
 225f840:	a9025bf5 	stp	x21, x22, [sp,#32]
 225f844:	910143f5 	add	x21, sp, #0x50
 225f848:	f0002421 	adrp	x1, 26e6000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0x15c18>
 225f84c:	3923081f 	strb	wzr, [x0,#2242]
 225f850:	91146021 	add	x1, x1, #0x518
 225f854:	aa1503e0 	mov	x0, x21
 225f858:	9407d0c6 	bl	2453b70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a98a0>
 225f85c:	910163f6 	add	x22, sp, #0x58
 225f860:	b0006ec1 	adrp	x1, 3038000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x946410>
 225f864:	9112c021 	add	x1, x1, #0x4b0
 225f868:	aa1503e0 	mov	x0, x21
 225f86c:	910de021 	add	x1, x1, #0x378
 225f870:	aa1603e8 	mov	x8, x22
 225f874:	94075083 	bl	2433a80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1897b0>
 225f878:	a90363f7 	stp	x23, x24, [sp,#48]
 225f87c:	910183f7 	add	x23, sp, #0x60
 225f880:	d00036c1 	adrp	x1, 2939000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x247410>
 225f884:	aa1703e8 	mov	x8, x23
 225f888:	91310021 	add	x1, x1, #0xc40
 225f88c:	aa1603e0 	mov	x0, x22
 225f890:	9407507c 	bl	2433a80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1897b0>
 225f894:	9101a3f8 	add	x24, sp, #0x68
 225f898:	b0006ec1 	adrp	x1, 3038000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x946410>
 225f89c:	aa1803e0 	mov	x0, x24
 225f8a0:	9138a021 	add	x1, x1, #0xe28
 225f8a4:	9407d0b3 	bl	2453b70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a98a0>
 225f8a8:	9101c3f4 	add	x20, sp, #0x70
 225f8ac:	aa1803e1 	mov	x1, x24
 225f8b0:	aa1403e8 	mov	x8, x20
 225f8b4:	aa1703e0 	mov	x0, x23
 225f8b8:	9407501a 	bl	2433920 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x189650>
 225f8bc:	52800022 	mov	w2, #0x1                   	// #1
