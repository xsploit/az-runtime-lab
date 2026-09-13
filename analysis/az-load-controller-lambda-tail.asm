
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000a31940 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126d28>:
  a31940:	f9411661 	ldr	x1, [x19,#552]
  a31944:	aa0203e0 	mov	x0, x2
  a31948:	f9400045 	ldr	x5, [x2]
  a3194c:	52800002 	mov	w2, #0x0                   	// #0
  a31950:	d360bc23 	ubfx	x3, x1, #32, #16
  a31954:	b3407c24 	bfxil	x4, x1, #0, #32
  a31958:	910163e1 	add	x1, sp, #0x58
  a3195c:	f94008a5 	ldr	x5, [x5,#16]
  a31960:	b3603c64 	bfi	x4, x3, #32, #16
  a31964:	f9002fe4 	str	x4, [sp,#88]
  a31968:	d63f00a0 	blr	x5
  a3196c:	71000c1f 	cmp	w0, #0x3
  a31970:	54fffcc1 	b.ne	a31908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126cf0>
  a31974:	a9025bf5 	stp	x21, x22, [sp,#32]
  a31978:	f9411274 	ldr	x20, [x19,#544]
  a3197c:	17ffffd7 	b	a318d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126cc0>
  a31980:	9100e3e0 	add	x0, sp, #0x38
  a31984:	9000dc81 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a31988:	9136a021 	add	x1, x1, #0xda8
  a3198c:	946408d5 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a31990:	b000e441 	adrp	x1, 26ba000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xf71a8>
  a31994:	911b0021 	add	x1, x1, #0x6c0
  a31998:	91236021 	add	x1, x1, #0x8d8
  a3199c:	9100e3e0 	add	x0, sp, #0x38
  a319a0:	910103e8 	add	x8, sp, #0x40
  a319a4:	94638893 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a319a8:	d000ecc1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a319ac:	910123e8 	add	x8, sp, #0x48
  a319b0:	91366021 	add	x1, x1, #0xd98
  a319b4:	910103e0 	add	x0, sp, #0x40
  a319b8:	9463888e 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a319bc:	9000e481 	adrp	x1, 26c1000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xfe1a8>
  a319c0:	910143e0 	add	x0, sp, #0x50
  a319c4:	910f8021 	add	x1, x1, #0x3e0
  a319c8:	946408c6 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a319cc:	910143e1 	add	x1, sp, #0x50
  a319d0:	910163e8 	add	x8, sp, #0x58
  a319d4:	910123e0 	add	x0, sp, #0x48
  a319d8:	9463882e 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a319dc:	52800022 	mov	w2, #0x1                   	// #1
  a319e0:	52800001 	mov	w1, #0x0                   	// #0
  a319e4:	910163e0 	add	x0, sp, #0x58
  a319e8:	945f3a7e 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a319ec:	910163e0 	add	x0, sp, #0x58
  a319f0:	94632b04 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a319f4:	910143e0 	add	x0, sp, #0x50
  a319f8:	94632b02 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a319fc:	910123e0 	add	x0, sp, #0x48
  a31a00:	94632b00 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a31a04:	910103e0 	add	x0, sp, #0x40
  a31a08:	94632afe 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a31a0c:	9100e3e0 	add	x0, sp, #0x38
  a31a10:	94632afc 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a31a14:	a94153f3 	ldp	x19, x20, [sp,#16]
  a31a18:	a8c67bfd 	ldp	x29, x30, [sp],#96
  a31a1c:	d65f03c0 	ret
  a31a20:	528000e0 	mov	w0, #0x7                   	// #7
  a31a24:	b94c6a96 	ldr	w22, [x20,#3176]
  a31a28:	390163e0 	strb	w0, [sp,#88]
  a31a2c:	710002df 	cmp	w22, #0x0
  a31a30:	540002ed 	b.le	a31a8c <_ZSt20__throw_bad_weak_ptrv@@Base+0x126e74>
  a31a34:	2a1603e0 	mov	w0, w22
  a31a38:	510006d6 	sub	w22, w22, #0x1
  a31a3c:	6b0002df 	cmp	w22, w0
  a31a40:	5400006b 	b.lt	a31a4c <_ZSt20__throw_bad_weak_ptrv@@Base+0x126e34>
  a31a44:	71000416 	subs	w22, w0, #0x1
  a31a48:	54000224 	b.mi	a31a8c <_ZSt20__throw_bad_weak_ptrv@@Base+0x126e74>
  a31a4c:	f9462e80 	ldr	x0, [x20,#3160]
  a31a50:	910163e3 	add	x3, sp, #0x58
  a31a54:	aa1303e2 	mov	x2, x19
  a31a58:	aa1503e1 	mov	x1, x21
  a31a5c:	f876d804 	ldr	x4, [x0,w22,sxtw #3]
  a31a60:	aa0403e0 	mov	x0, x4
  a31a64:	f9400084 	ldr	x4, [x4]
  a31a68:	f9400884 	ldr	x4, [x4,#16]
  a31a6c:	d63f0080 	blr	x4
  a31a70:	710002df 	cmp	w22, #0x0
  a31a74:	540000cd 	b.le	a31a8c <_ZSt20__throw_bad_weak_ptrv@@Base+0x126e74>
  a31a78:	b94c6a80 	ldr	w0, [x20,#3176]
  a31a7c:	510006d6 	sub	w22, w22, #0x1
  a31a80:	6b0002df 	cmp	w22, w0
  a31a84:	54fffe0a 	b.ge	a31a44 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126e2c>
  a31a88:	17fffff1 	b	a31a4c <_ZSt20__throw_bad_weak_ptrv@@Base+0x126e34>
  a31a8c:	a9425bf5 	ldp	x21, x22, [sp,#32]
  a31a90:	17ffff9e 	b	a31908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126cf0>
  a31a94:	aa0003f3 	mov	x19, x0
  a31a98:	910163e0 	add	x0, sp, #0x58
  a31a9c:	94632ad9 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a31aa0:	910143e0 	add	x0, sp, #0x50
  a31aa4:	94632ad7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a31aa8:	910123e0 	add	x0, sp, #0x48
  a31aac:	94632ad5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a31ab0:	910103e0 	add	x0, sp, #0x40
  a31ab4:	94632ad3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a31ab8:	9100e3e0 	add	x0, sp, #0x38
  a31abc:	a9025bf5 	stp	x21, x22, [sp,#32]
  a31ac0:	94632ad0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a31ac4:	aa1303e0 	mov	x0, x19
  a31ac8:	97e7cc92 	bl	424d10 <_Unwind_Resume@plt>
  a31acc:	aa0003f3 	mov	x19, x0
  a31ad0:	17fffff4 	b	a31aa0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126e88>
  a31ad4:	aa0003f3 	mov	x19, x0
  a31ad8:	17fffff4 	b	a31aa8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126e90>
  a31adc:	aa0003f3 	mov	x19, x0
  a31ae0:	17fffff4 	b	a31ab0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126e98>
  a31ae4:	aa0003f3 	mov	x19, x0
  a31ae8:	17fffff4 	b	a31ab8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126ea0>
  a31aec:	d503201f 	nop
  a31af0:	91006000 	add	x0, x0, #0x18
  a31af4:	17ffff6b 	b	a318a0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126c88>
  a31af8:	f9400001 	ldr	x1, [x0]
  a31afc:	b9422021 	ldr	w1, [x1,#544]
  a31b00:	71001c3f 	cmp	w1, #0x7
  a31b04:	54000040 	b.eq	a31b0c <_ZSt20__throw_bad_weak_ptrv@@Base+0x126ef4>
