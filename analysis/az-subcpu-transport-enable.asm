
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021c4ae0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c9c8>:
 21c4ae0:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
 21c4ae4:	910003fd 	mov	x29, sp
 21c4ae8:	a90153f3 	stp	x19, x20, [sp,#16]
 21c4aec:	aa0003f4 	mov	x20, x0
 21c4af0:	b9401000 	ldr	w0, [x0,#16]
 21c4af4:	12001c33 	and	w19, w1, #0xff
 21c4af8:	37f80940 	tbnz	w0, #31, 21c4c20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3cb08>
 21c4afc:	d28e0021 	mov	x1, #0x7001                	// #28673
 21c4b00:	f2b00021 	movk	x1, #0x8001, lsl #16
 21c4b04:	91013fe2 	add	x2, sp, #0x4f
 21c4b08:	39013fff 	strb	wzr, [sp,#79]
 21c4b0c:	97898ab1 	bl	4275d0 <ioctl@plt>
 21c4b10:	37f80d60 	tbnz	w0, #31, 21c4cbc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3cba4>
 21c4b14:	39413fe0 	ldrb	w0, [sp,#79]
 21c4b18:	6b13001f 	cmp	w0, w19
 21c4b1c:	540000a1 	b.ne	21c4b30 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3ca18>
 21c4b20:	52800000 	mov	w0, #0x0                   	// #0
 21c4b24:	a94153f3 	ldp	x19, x20, [sp,#16]
 21c4b28:	a8c87bfd 	ldp	x29, x30, [sp],#128
 21c4b2c:	d65f03c0 	ret
 21c4b30:	b9401280 	ldr	w0, [x20,#16]
 21c4b34:	d28e0021 	mov	x1, #0x7001                	// #28673
 21c4b38:	f2a80021 	movk	x1, #0x4001, lsl #16
 21c4b3c:	91013fe2 	add	x2, sp, #0x4f
 21c4b40:	39013ff3 	strb	w19, [sp,#79]
 21c4b44:	97898aa3 	bl	4275d0 <ioctl@plt>
 21c4b48:	36fffec0 	tbz	w0, #31, 21c4b20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3ca08>
 21c4b4c:	910143f4 	add	x20, sp, #0x50
 21c4b50:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c4b54:	aa1403e0 	mov	x0, x20
 21c4b58:	911fc021 	add	x1, x1, #0x7f0
 21c4b5c:	a9025bf5 	stp	x21, x22, [sp,#32]
 21c4b60:	9405bc60 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c4b64:	910163f5 	add	x21, sp, #0x58
 21c4b68:	d00064a0 	adrp	x0, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c4b6c:	91214000 	add	x0, x0, #0x850
 21c4b70:	aa1403e1 	mov	x1, x20
 21c4b74:	aa1503e8 	mov	x8, x21
 21c4b78:	9405bd22 	bl	2334000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abee8>
 21c4b7c:	910183f6 	add	x22, sp, #0x60
 21c4b80:	2a1303e1 	mov	w1, w19
 21c4b84:	aa1603e0 	mov	x0, x22
 21c4b88:	94052fe2 	bl	2310b10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1889f8>
 21c4b8c:	a90363f7 	stp	x23, x24, [sp,#48]
 21c4b90:	9101a3f7 	add	x23, sp, #0x68
 21c4b94:	aa1603e1 	mov	x1, x22
 21c4b98:	aa1703e8 	mov	x8, x23
 21c4b9c:	aa1503e0 	mov	x0, x21
 21c4ba0:	94053bbc 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 21c4ba4:	aa1703e0 	mov	x0, x23
 21c4ba8:	94055406 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c4bac:	aa0003e1 	mov	x1, x0
 21c4bb0:	b4001040 	cbz	x0, 21c4db8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3cca0>
 21c4bb4:	9101c3f3 	add	x19, sp, #0x70
 21c4bb8:	aa1303e0 	mov	x0, x19
 21c4bbc:	9405bc49 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c4bc0:	aa1303e0 	mov	x0, x19
 21c4bc4:	940553ff 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c4bc8:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c4bcc:	9116c021 	add	x1, x1, #0x5b0
 21c4bd0:	aa0003e2 	mov	x2, x0
 21c4bd4:	9102e021 	add	x1, x1, #0xb8
 21c4bd8:	f0002aa0 	adrp	x0, 271b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1581a8>
 21c4bdc:	91152000 	add	x0, x0, #0x548
 21c4be0:	9400eb80 	bl	21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x778c8>
 21c4be4:	d503201f 	nop
 21c4be8:	aa1303e0 	mov	x0, x19
 21c4bec:	9404de85 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c4bf0:	aa1703e0 	mov	x0, x23
 21c4bf4:	9404de83 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c4bf8:	aa1603e0 	mov	x0, x22
 21c4bfc:	9404de81 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c4c00:	aa1503e0 	mov	x0, x21
 21c4c04:	9404de7f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c4c08:	aa1403e0 	mov	x0, x20
 21c4c0c:	9404de7d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c4c10:	12800000 	mov	w0, #0xffffffff            	// #-1
 21c4c14:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21c4c18:	a94363f7 	ldp	x23, x24, [sp,#48]
 21c4c1c:	17ffffc2 	b	21c4b24 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3ca0c>
