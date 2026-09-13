
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021c38d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3b7b8>:
 21c38d0:	d65f03c0 	ret
 21c38d4:	d503201f 	nop
 21c38d8:	d503201f 	nop
 21c38dc:	d503201f 	nop
 21c38e0:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21c38e4:	910003fd 	mov	x29, sp
 21c38e8:	b9800822 	ldrsw	x2, [x1,#8]
 21c38ec:	b9401000 	ldr	w0, [x0,#16]
 21c38f0:	f9400021 	ldr	x1, [x1]
 21c38f4:	f9000bf3 	str	x19, [sp,#16]
 21c38f8:	9789840e 	bl	424930 <read@plt>
 21c38fc:	b7f80080 	tbnz	x0, #63, 21c390c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3b7f4>
 21c3900:	f9400bf3 	ldr	x19, [sp,#16]
 21c3904:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21c3908:	d65f03c0 	ret
 21c390c:	f00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c3910:	911e6021 	add	x1, x1, #0x798
 21c3914:	9100a3e0 	add	x0, sp, #0x28
 21c3918:	9405c0f2 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c391c:	9100a3e0 	add	x0, sp, #0x28
 21c3920:	940558a8 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c3924:	aa0003e2 	mov	x2, x0
 21c3928:	f00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c392c:	90002ac0 	adrp	x0, 271b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1581a8>
 21c3930:	9116c021 	add	x1, x1, #0x5b0
 21c3934:	91152000 	add	x0, x0, #0x548
 21c3938:	9400f02a 	bl	21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x778c8>
 21c393c:	9100a3e0 	add	x0, sp, #0x28
 21c3940:	9404e330 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c3944:	f9400bf3 	ldr	x19, [sp,#16]
 21c3948:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21c394c:	d65f03c0 	ret
 21c3950:	aa0003f3 	mov	x19, x0
 21c3954:	9100a3e0 	add	x0, sp, #0x28
 21c3958:	9404e32a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c395c:	aa1303e0 	mov	x0, x19
 21c3960:	978984ec 	bl	424d10 <_Unwind_Resume@plt>
 21c3964:	d503201f 	nop
 21c3968:	d503201f 	nop
 21c396c:	d503201f 	nop
 21c3970:	f9400023 	ldr	x3, [x1]
 21c3974:	b4000463 	cbz	x3, 21c3a00 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3b8e8>
 21c3978:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 21c397c:	52a02005 	mov	w5, #0x1000000             	// #16777216
 21c3980:	910003fd 	mov	x29, sp
 21c3984:	b9400824 	ldr	w4, [x1,#8]
 21c3988:	b9401000 	ldr	w0, [x0,#16]
 21c398c:	d28e0001 	mov	x1, #0x7000                	// #28672
 21c3990:	f2a80201 	movk	x1, #0x4010, lsl #16
 21c3994:	9100c3e2 	add	x2, sp, #0x30
 21c3998:	f9000bf3 	str	x19, [sp,#16]
 21c399c:	290613e5 	stp	w5, w4, [sp,#48]
 21c39a0:	f9001fe3 	str	x3, [sp,#56]
 21c39a4:	97898f0b 	bl	4275d0 <ioctl@plt>
 21c39a8:	35000080 	cbnz	w0, 21c39b8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3b8a0>
 21c39ac:	f9400bf3 	ldr	x19, [sp,#16]
 21c39b0:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21c39b4:	d65f03c0 	ret
 21c39b8:	f00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c39bc:	911ec021 	add	x1, x1, #0x7b0
 21c39c0:	9100a3e0 	add	x0, sp, #0x28
 21c39c4:	9405c0c7 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c39c8:	9100a3e0 	add	x0, sp, #0x28
 21c39cc:	9405587d 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c39d0:	f00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c39d4:	9116c021 	add	x1, x1, #0x5b0
 21c39d8:	aa0003e2 	mov	x2, x0
 21c39dc:	91012021 	add	x1, x1, #0x48
 21c39e0:	90002ac0 	adrp	x0, 271b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1581a8>
 21c39e4:	91152000 	add	x0, x0, #0x548
 21c39e8:	9400effe 	bl	21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x778c8>
 21c39ec:	9100a3e0 	add	x0, sp, #0x28
 21c39f0:	9404e304 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c39f4:	f9400bf3 	ldr	x19, [sp,#16]
 21c39f8:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21c39fc:	d65f03c0 	ret
 21c3a00:	d65f03c0 	ret
 21c3a04:	aa0003f3 	mov	x19, x0
 21c3a08:	9100a3e0 	add	x0, sp, #0x28
 21c3a0c:	9404e2fd 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c3a10:	aa1303e0 	mov	x0, x19
 21c3a14:	978984bf 	bl	424d10 <_Unwind_Resume@plt>
 21c3a18:	d503201f 	nop
 21c3a1c:	d503201f 	nop
 21c3a20:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21c3a24:	910003fd 	mov	x29, sp
 21c3a28:	f9000bf3 	str	x19, [sp,#16]
 21c3a2c:	aa0003f3 	mov	x19, x0
 21c3a30:	b9401000 	ldr	w0, [x0,#16]
 21c3a34:	7100001f 	cmp	w0, #0x0
 21c3a38:	5400010d 	b.le	21c3a58 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3b940>
 21c3a3c:	97898581 	bl	425040 <close@plt>
 21c3a40:	35000060 	cbnz	w0, 21c3a4c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3b934>
 21c3a44:	12800000 	mov	w0, #0xffffffff            	// #-1
 21c3a48:	b9001260 	str	w0, [x19,#16]
 21c3a4c:	f9400bf3 	ldr	x19, [sp,#16]
 21c3a50:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21c3a54:	d65f03c0 	ret
 21c3a58:	f00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c3a5c:	911f4021 	add	x1, x1, #0x7d0
 21c3a60:	9100a3e0 	add	x0, sp, #0x28
 21c3a64:	9405c09f 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c3a68:	9100a3e0 	add	x0, sp, #0x28
 21c3a6c:	94055855 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c3a70:	f00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c3a74:	9116c021 	add	x1, x1, #0x5b0
 21c3a78:	aa0003e2 	mov	x2, x0
 21c3a7c:	91026021 	add	x1, x1, #0x98
 21c3a80:	90002ac0 	adrp	x0, 271b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1581a8>
 21c3a84:	91152000 	add	x0, x0, #0x548
 21c3a88:	9400efd6 	bl	21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x778c8>
 21c3a8c:	9100a3e0 	add	x0, sp, #0x28
 21c3a90:	9404e2dc 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c3a94:	f9400bf3 	ldr	x19, [sp,#16]
 21c3a98:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21c3a9c:	d65f03c0 	ret
 21c3aa0:	aa0003f3 	mov	x19, x0
 21c3aa4:	9100a3e0 	add	x0, sp, #0x28
 21c3aa8:	9404e2d6 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c3aac:	aa1303e0 	mov	x0, x19
 21c3ab0:	97898498 	bl	424d10 <_Unwind_Resume@plt>
 21c3ab4:	d503201f 	nop
 21c3ab8:	d503201f 	nop
 21c3abc:	d503201f 	nop
 21c3ac0:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
 21c3ac4:	910003fd 	mov	x29, sp
 21c3ac8:	a90153f3 	stp	x19, x20, [sp,#16]
 21c3acc:	aa0003f3 	mov	x19, x0
 21c3ad0:	b9401000 	ldr	w0, [x0,#16]
 21c3ad4:	37f808c0 	tbnz	w0, #31, 21c3bec <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3bad4>
 21c3ad8:	d28e0021 	mov	x1, #0x7001                	// #28673
 21c3adc:	f2b00021 	movk	x1, #0x8001, lsl #16
 21c3ae0:	91013fe2 	add	x2, sp, #0x4f
 21c3ae4:	39013fff 	strb	wzr, [sp,#79]
 21c3ae8:	97898eba 	bl	4275d0 <ioctl@plt>
 21c3aec:	37f80ce0 	tbnz	w0, #31, 21c3c88 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3bb70>
 21c3af0:	39413fe0 	ldrb	w0, [sp,#79]
 21c3af4:	35000080 	cbnz	w0, 21c3b04 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3b9ec>
 21c3af8:	a94153f3 	ldp	x19, x20, [sp,#16]
 21c3afc:	a8c87bfd 	ldp	x29, x30, [sp],#128
 21c3b00:	d65f03c0 	ret
 21c3b04:	b9401260 	ldr	w0, [x19,#16]
 21c3b08:	d28e0021 	mov	x1, #0x7001                	// #28673
 21c3b0c:	f2a80021 	movk	x1, #0x4001, lsl #16
 21c3b10:	91013fe2 	add	x2, sp, #0x4f
 21c3b14:	39013fff 	strb	wzr, [sp,#79]
 21c3b18:	97898eae 	bl	4275d0 <ioctl@plt>
 21c3b1c:	36fffee0 	tbz	w0, #31, 21c3af8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3b9e0>
 21c3b20:	910163f4 	add	x20, sp, #0x58
 21c3b24:	f00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c3b28:	aa1403e0 	mov	x0, x20
 21c3b2c:	911fc021 	add	x1, x1, #0x7f0
 21c3b30:	a9025bf5 	stp	x21, x22, [sp,#32]
 21c3b34:	9405c06b 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c3b38:	910183f5 	add	x21, sp, #0x60
 21c3b3c:	f00064a0 	adrp	x0, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c3b40:	91214000 	add	x0, x0, #0x850
 21c3b44:	aa1403e1 	mov	x1, x20
 21c3b48:	aa1503e8 	mov	x8, x21
 21c3b4c:	9405c12d 	bl	2334000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abee8>
 21c3b50:	910143f6 	add	x22, sp, #0x50
 21c3b54:	52800001 	mov	w1, #0x0                   	// #0
 21c3b58:	aa1603e0 	mov	x0, x22
 21c3b5c:	940533ed 	bl	2310b10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1889f8>
 21c3b60:	a90363f7 	stp	x23, x24, [sp,#48]
 21c3b64:	9101a3f7 	add	x23, sp, #0x68
 21c3b68:	aa1603e1 	mov	x1, x22
 21c3b6c:	aa1703e8 	mov	x8, x23
 21c3b70:	aa1503e0 	mov	x0, x21
 21c3b74:	94053fc7 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 21c3b78:	aa1703e0 	mov	x0, x23
 21c3b7c:	94055811 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c3b80:	aa0003e1 	mov	x1, x0
 21c3b84:	b4001000 	cbz	x0, 21c3d84 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3bc6c>
 21c3b88:	9101c3f3 	add	x19, sp, #0x70
 21c3b8c:	aa1303e0 	mov	x0, x19
 21c3b90:	9405c054 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c3b94:	aa1303e0 	mov	x0, x19
 21c3b98:	9405580a 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c3b9c:	f00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c3ba0:	9116c021 	add	x1, x1, #0x5b0
 21c3ba4:	aa0003e2 	mov	x2, x0
 21c3ba8:	9102e021 	add	x1, x1, #0xb8
 21c3bac:	90002ac0 	adrp	x0, 271b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1581a8>
 21c3bb0:	91152000 	add	x0, x0, #0x548
 21c3bb4:	9400ef8b 	bl	21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x778c8>
 21c3bb8:	aa1303e0 	mov	x0, x19
 21c3bbc:	9404e291 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c3bc0:	aa1703e0 	mov	x0, x23
 21c3bc4:	9404e28f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c3bc8:	aa1603e0 	mov	x0, x22
 21c3bcc:	9404e28d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c3bd0:	aa1503e0 	mov	x0, x21
 21c3bd4:	9404e28b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c3bd8:	aa1403e0 	mov	x0, x20
 21c3bdc:	9404e289 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c3be0:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21c3be4:	a94363f7 	ldp	x23, x24, [sp,#48]
 21c3be8:	17ffffc4 	b	21c3af8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3b9e0>
 21c3bec:	910163f4 	add	x20, sp, #0x58
 21c3bf0:	f00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c3bf4:	aa1403e0 	mov	x0, x20
 21c3bf8:	911fc021 	add	x1, x1, #0x7f0
 21c3bfc:	a9025bf5 	stp	x21, x22, [sp,#32]
