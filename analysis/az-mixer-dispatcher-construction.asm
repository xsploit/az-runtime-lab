
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021539d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953b48>:
 21539d0:	b0002378 	adrp	x24, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 21539d4:	f94037e0 	ldr	x0, [sp,#104]
 21539d8:	d000cf97 	adrp	x23, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 21539dc:	f9404693 	ldr	x19, [x20,#136]
 21539e0:	912a7318 	add	x24, x24, #0xa9c
 21539e4:	b9801015 	ldrsw	x21, [x0,#16]
 21539e8:	911942f7 	add	x23, x23, #0x650
 21539ec:	a94006c0 	ldp	x0, x1, [x22]
 21539f0:	a90807e0 	stp	x0, x1, [sp,#128]
 21539f4:	8b150e75 	add	x21, x19, x21, lsl #3
 21539f8:	eb15027f 	cmp	x19, x21
 21539fc:	54000320 	b.eq	2153a60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953bd8>
 2153a00:	a90573fb 	stp	x27, x28, [sp,#80]
 2153a04:	d503201f 	nop
 2153a08:	f940027c 	ldr	x28, [x19]
 2153a0c:	91002380 	add	x0, x28, #0x8
 2153a10:	eb18001f 	cmp	x0, x24
 2153a14:	540001e3 	b.cc	2153a50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953bc8>
 2153a18:	f240041f 	tst	x0, #0x3
 2153a1c:	540001a1 	b.ne	2153a50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953bc8>
 2153a20:	b9400b9b 	ldr	w27, [x28,#8]
 2153a24:	08dfff20 	ldarb	w0, [x25]
 2153a28:	360003e0 	tbz	w0, #0, 2153aa4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953c1c>
 2153a2c:	b94002e0 	ldr	w0, [x23]
 2153a30:	6b00037f 	cmp	w27, w0
 2153a34:	540000e1 	b.ne	2153a50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953bc8>
 2153a38:	f9400283 	ldr	x3, [x20]
 2153a3c:	aa1c03e1 	mov	x1, x28
 2153a40:	910203e2 	add	x2, sp, #0x80
 2153a44:	aa1403e0 	mov	x0, x20
 2153a48:	f9400863 	ldr	x3, [x3,#16]
 2153a4c:	d63f0060 	blr	x3
 2153a50:	91002273 	add	x19, x19, #0x8
 2153a54:	eb1302bf 	cmp	x21, x19
 2153a58:	54fffd81 	b.ne	2153a08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953b80>
 2153a5c:	a94573fb 	ldp	x27, x28, [sp,#80]
 2153a60:	910042d6 	add	x22, x22, #0x10
 2153a64:	eb16035f 	cmp	x26, x22
 2153a68:	54fffb41 	b.ne	21539d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953b48>
 2153a6c:	a94363f7 	ldp	x23, x24, [sp,#48]
 2153a70:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2153a74:	a9446bf9 	ldp	x25, x26, [sp,#64]
 2153a78:	b900b29f 	str	wzr, [x20,#176]
 2153a7c:	a94153f3 	ldp	x19, x20, [sp,#16]
 2153a80:	a8c97bfd 	ldp	x29, x30, [sp],#144
 2153a84:	d65f03c0 	ret
 2153a88:	d2800001 	mov	x1, #0x0                   	// #0
 2153a8c:	52800000 	mov	w0, #0x0                   	// #0
 2153a90:	9402b30c 	bl	22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x785a8>
 2153a94:	17ffff93 	b	21538e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953a58>
 2153a98:	2a1503e1 	mov	w1, w21
 2153a9c:	d2800002 	mov	x2, #0x0                   	// #0
 2153aa0:	17ffffb8 	b	2153980 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953af8>
 2153aa4:	aa1903e0 	mov	x0, x25
 2153aa8:	978b49ee 	bl	426260 <__cxa_guard_acquire@plt>
 2153aac:	34fffc00 	cbz	w0, 2153a2c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953ba4>
 2153ab0:	97957396 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 2153ab4:	b90002e0 	str	w0, [x23]
 2153ab8:	aa1903e0 	mov	x0, x25
 2153abc:	978b4b61 	bl	426840 <__cxa_guard_release@plt>
 2153ac0:	17ffffdb 	b	2153a2c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953ba4>
 2153ac4:	52800001 	mov	w1, #0x0                   	// #0
 2153ac8:	d2800002 	mov	x2, #0x0                   	// #0
 2153acc:	17ffffad 	b	2153980 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953af8>
 2153ad0:	d2800001 	mov	x1, #0x0                   	// #0
 2153ad4:	d503201f 	nop
 2153ad8:	f8617803 	ldr	x3, [x0,x1,lsl #3]
 2153adc:	f8217843 	str	x3, [x2,x1,lsl #3]
 2153ae0:	91000421 	add	x1, x1, #0x1
 2153ae4:	6b0102bf 	cmp	w21, w1
 2153ae8:	54ffff8c 	b.gt	2153ad8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953c50>
 2153aec:	17ffffa4 	b	215397c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953af4>
 2153af0:	f941a800 	ldr	x0, [x0,#848]
 2153af4:	39400021 	ldrb	w1, [x1]
 2153af8:	12000021 	and	w1, w1, #0x1
 2153afc:	17ff7adf 	b	2132678 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9327f0>
 2153b00:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 2153b04:	910003fd 	mov	x29, sp
 2153b08:	a90153f3 	stp	x19, x20, [sp,#16]
 2153b0c:	aa0103f4 	mov	x20, x1
 2153b10:	52800001 	mov	w1, #0x0                   	// #0
 2153b14:	f941a813 	ldr	x19, [x0,#848]
 2153b18:	39400282 	ldrb	w2, [x20]
 2153b1c:	910a0260 	add	x0, x19, #0x280
 2153b20:	d3473842 	ubfx	x2, x2, #7, #8
 2153b24:	97ff79d1 	bl	2132268 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9323e0>
 2153b28:	39400282 	ldrb	w2, [x20]
 2153b2c:	910b8260 	add	x0, x19, #0x2e0
 2153b30:	52800021 	mov	w1, #0x1                   	// #1
 2153b34:	d3461842 	ubfx	x2, x2, #6, #1
 2153b38:	97ff79cc 	bl	2132268 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9323e0>
 2153b3c:	39400282 	ldrb	w2, [x20]
 2153b40:	910d0260 	add	x0, x19, #0x340
 2153b44:	52800041 	mov	w1, #0x2                   	// #2
 2153b48:	d3451442 	ubfx	x2, x2, #5, #1
 2153b4c:	97ff79c7 	bl	2132268 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9323e0>
 2153b50:	39400282 	ldrb	w2, [x20]
 2153b54:	910e8260 	add	x0, x19, #0x3a0
 2153b58:	a94153f3 	ldp	x19, x20, [sp,#16]
 2153b5c:	52800061 	mov	w1, #0x3                   	// #3
 2153b60:	a8c27bfd 	ldp	x29, x30, [sp],#32
 2153b64:	d3441042 	ubfx	x2, x2, #4, #1
 2153b68:	17ff79c0 	b	2132268 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9323e0>
 2153b6c:	d503201f 	nop
 2153b70:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 2153b74:	b00067a3 	adrp	x3, 2e48000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8851a8>
 2153b78:	910ce063 	add	x3, x3, #0x338
 2153b7c:	910003fd 	mov	x29, sp
 2153b80:	a90153f3 	stp	x19, x20, [sp,#16]
 2153b84:	aa0003f3 	mov	x19, x0
 2153b88:	aa0103f4 	mov	x20, x1
 2153b8c:	f90013f5 	str	x21, [sp,#32]
 2153b90:	b00067a0 	adrp	x0, 2e48000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8851a8>
 2153b94:	910e8000 	add	x0, x0, #0x3a0
 2153b98:	a9000263 	stp	x3, x0, [x19]
 2153b9c:	91004275 	add	x21, x19, #0x10
 2153ba0:	aa1503e0 	mov	x0, x21
 2153ba4:	f9001fe2 	str	x2, [sp,#56]
 2153ba8:	94000e42 	bl	21574b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x957628>
 2153bac:	a9400281 	ldp	x1, x0, [x20]
 2153bb0:	f901aa61 	str	x1, [x19,#848]
 2153bb4:	f901ae60 	str	x0, [x19,#856]
 2153bb8:	f9401fe2 	ldr	x2, [sp,#56]
 2153bbc:	b4000120 	cbz	x0, 2153be0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953d58>
 2153bc0:	f00067a1 	adrp	x1, 2e4a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8871a8>
 2153bc4:	f9416021 	ldr	x1, [x1,#704]
 2153bc8:	b4000261 	cbz	x1, 2153c14 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953d8c>
 2153bcc:	91002000 	add	x0, x0, #0x8
 2153bd0:	885ffc01 	ldaxr	w1, [x0]
 2153bd4:	11000421 	add	w1, w1, #0x1
 2153bd8:	8803fc01 	stlxr	w3, w1, [x0]
 2153bdc:	35ffffa3 	cbnz	w3, 2153bd0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953d48>
 2153be0:	f901b262 	str	x2, [x19,#864]
 2153be4:	d00067a0 	adrp	x0, 2e49000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8861a8>
 2153be8:	f901b67f 	str	xzr, [x19,#872]
 2153bec:	91138000 	add	x0, x0, #0x4e0
 2153bf0:	7906e27f 	strh	wzr, [x19,#880]
 2153bf4:	91044000 	add	x0, x0, #0x110
 2153bf8:	390dca7f 	strb	wzr, [x19,#882]
 2153bfc:	91002261 	add	x1, x19, #0x8
 2153c00:	940011c6 	bl	2158318 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x958490>
 2153c04:	a94153f3 	ldp	x19, x20, [sp,#16]
 2153c08:	f94013f5 	ldr	x21, [sp,#32]
 2153c0c:	a8c47bfd 	ldp	x29, x30, [sp],#64
 2153c10:	d65f03c0 	ret
 2153c14:	b9400801 	ldr	w1, [x0,#8]
 2153c18:	11000421 	add	w1, w1, #0x1
 2153c1c:	b9000801 	str	w1, [x0,#8]
 2153c20:	17fffff0 	b	2153be0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953d58>
 2153c24:	f941ae61 	ldr	x1, [x19,#856]
 2153c28:	aa0003f3 	mov	x19, x0
 2153c2c:	b4000061 	cbz	x1, 2153c38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953db0>
 2153c30:	aa0103e0 	mov	x0, x1
 2153c34:	979481a9 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 2153c38:	aa1503e0 	mov	x0, x21
 2153c3c:	940005d3 	bl	2155388 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x955500>
 2153c40:	aa1303e0 	mov	x0, x19
 2153c44:	978b4433 	bl	424d10 <_Unwind_Resume@plt>
