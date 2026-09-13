
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000b4690c <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bcf4>:
  b4690c:	35000996 	cbnz	w22, b46a3c <_ZSt20__throw_bad_weak_ptrv@@Base+0x23be24>
  b46910:	79400ab6 	ldrh	w22, [x21,#4]
  b46914:	f9400282 	ldr	x2, [x20]
  b46918:	b0ffffe0 	adrp	x0, b43000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2383e8>
  b4691c:	b94002a1 	ldr	w1, [x21]
  b46920:	911ae000 	add	x0, x0, #0x6b8
  b46924:	f9400c44 	ldr	x4, [x2,#24]
  b46928:	b9009be1 	str	w1, [sp,#152]
  b4692c:	eb00009f 	cmp	x4, x0
  b46930:	54002921 	b.ne	b46e54 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23c23c>
  b46934:	91022295 	add	x21, x20, #0x88
  b46938:	12800013 	mov	w19, #0xffffffff            	// #-1
  b4693c:	aa1503e0 	mov	x0, x21
  b46940:	945f95e8 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
  b46944:	b9409be1 	ldr	w1, [sp,#152]
  b46948:	2a1603e2 	mov	w2, w22
  b4694c:	aa1403e0 	mov	x0, x20
  b46950:	52800003 	mov	w3, #0x0                   	// #0
  b46954:	97fff8b7 	bl	b44c30 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23a018>
  b46958:	b4000040 	cbz	x0, b46960 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bd48>
  b4695c:	b9405813 	ldr	w19, [x0,#88]
  b46960:	aa1503e0 	mov	x0, x21
  b46964:	945f95eb 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
  b46968:	2a1303e0 	mov	w0, w19
  b4696c:	a94153f3 	ldp	x19, x20, [sp,#16]
  b46970:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b46974:	a8ca7bfd 	ldp	x29, x30, [sp],#160
  b46978:	d65f03c0 	ret
  b4697c:	910203f8 	add	x24, sp, #0x80
  b46980:	f000d3c1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b46984:	aa1803e0 	mov	x0, x24
  b46988:	9136a021 	add	x1, x1, #0xda8
  b4698c:	a9046bf9 	stp	x25, x26, [sp,#64]
  b46990:	945fb4d4 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b46994:	910223f9 	add	x25, sp, #0x88
  b46998:	9000de81 	adrp	x1, 2716000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1531a8>
  b4699c:	9125a021 	add	x1, x1, #0x968
  b469a0:	91076021 	add	x1, x1, #0x1d8
  b469a4:	aa1803e0 	mov	x0, x24
  b469a8:	aa1903e8 	mov	x8, x25
  b469ac:	945f3491 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b469b0:	910243fa 	add	x26, sp, #0x90
  b469b4:	b000e421 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b469b8:	aa1a03e8 	mov	x8, x26
  b469bc:	91366021 	add	x1, x1, #0xd98
  b469c0:	aa1903e0 	mov	x0, x25
  b469c4:	945f348b 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b469c8:	a90573fb 	stp	x27, x28, [sp,#80]
  b469cc:	9101e3fb 	add	x27, sp, #0x78
  b469d0:	9000d3e1 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b469d4:	aa1b03e0 	mov	x0, x27
  b469d8:	912e6021 	add	x1, x1, #0xb98
  b469dc:	945fb4c1 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b469e0:	910263fc 	add	x28, sp, #0x98
  b469e4:	aa1b03e1 	mov	x1, x27
  b469e8:	aa1c03e8 	mov	x8, x28
  b469ec:	aa1a03e0 	mov	x0, x26
  b469f0:	945f3428 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b469f4:	52800022 	mov	w2, #0x1                   	// #1
  b469f8:	52800001 	mov	w1, #0x0                   	// #0
  b469fc:	aa1c03e0 	mov	x0, x28
  b46a00:	945ae678 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b46a04:	aa1c03e0 	mov	x0, x28
  b46a08:	945ed6fe 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b46a0c:	aa1b03e0 	mov	x0, x27
  b46a10:	945ed6fc 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b46a14:	aa1a03e0 	mov	x0, x26
  b46a18:	945ed6fa 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b46a1c:	aa1903e0 	mov	x0, x25
  b46a20:	945ed6f8 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b46a24:	aa1803e0 	mov	x0, x24
  b46a28:	945ed6f6 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b46a2c:	a94363f7 	ldp	x23, x24, [sp,#48]
  b46a30:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b46a34:	a94573fb 	ldp	x27, x28, [sp,#80]
  b46a38:	17ffff63 	b	b467c4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bbac>
  b46a3c:	79400ab6 	ldrh	w22, [x21,#4]
  b46a40:	12800013 	mov	w19, #0xffffffff            	// #-1
  b46a44:	3941dfe1 	ldrb	w1, [sp,#119]
  b46a48:	d3483ec0 	ubfx	x0, x22, #8, #8
  b46a4c:	6b00003f 	cmp	w1, w0
  b46a50:	54fff620 	b.eq	b46914 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bcfc>
  b46a54:	2a1303e0 	mov	w0, w19
  b46a58:	17ffffc5 	b	b4696c <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bd54>
  b46a5c:	f0017fc0 	adrp	x0, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b46a60:	9123e000 	add	x0, x0, #0x8f8
  b46a64:	a90363f7 	stp	x23, x24, [sp,#48]
  b46a68:	f90037e0 	str	x0, [sp,#104]
  b46a6c:	08dffc00 	ldarb	w0, [x0]
  b46a70:	36002020 	tbz	w0, #0, b46e74 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23c25c>
  b46a74:	f0017fd7 	adrp	x23, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b46a78:	912402f7 	add	x23, x23, #0x900
  b46a7c:	b9801ae1 	ldrsw	x1, [x23,#24]
