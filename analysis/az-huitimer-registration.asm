
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f09e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x688c8>:
 21f09e0:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 21f09e4:	910003fd 	mov	x29, sp
 21f09e8:	a90153f3 	stp	x19, x20, [sp,#16]
 21f09ec:	aa0103f3 	mov	x19, x1
 21f09f0:	aa0003f4 	mov	x20, x0
 21f09f4:	f9400401 	ldr	x1, [x0,#8]
 21f09f8:	b40000a1 	cbz	x1, 21f0a0c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x688f4>
 21f09fc:	b9400820 	ldr	w0, [x1,#8]
 21f0a00:	b9400a63 	ldr	w3, [x19,#8]
 21f0a04:	6b03001f 	cmp	w0, w3
 21f0a08:	540002ad 	b.le	21f0a5c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68944>
 21f0a0c:	f9400680 	ldr	x0, [x20,#8]
 21f0a10:	f9000e60 	str	x0, [x19,#24]
 21f0a14:	f9000693 	str	x19, [x20,#8]
 21f0a18:	f9400680 	ldr	x0, [x20,#8]
 21f0a1c:	b40002a0 	cbz	x0, 21f0a70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68958>
 21f0a20:	9404b78c 	bl	231e850 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x196738>
 21f0a24:	f9400681 	ldr	x1, [x20,#8]
 21f0a28:	b9400821 	ldr	w1, [x1,#8]
 21f0a2c:	0b010000 	add	w0, w0, w1
 21f0a30:	b9001280 	str	w0, [x20,#16]
 21f0a34:	f9400e60 	ldr	x0, [x19,#24]
 21f0a38:	b4000040 	cbz	x0, 21f0a40 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68928>
 21f0a3c:	f9000813 	str	x19, [x0,#16]
 21f0a40:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f0a44:	a8c27bfd 	ldp	x29, x30, [sp],#32
 21f0a48:	d65f03c0 	ret
 21f0a4c:	b9400802 	ldr	w2, [x0,#8]
 21f0a50:	6b02007f 	cmp	w3, w2
 21f0a54:	5400008b 	b.lt	21f0a64 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6894c>
 21f0a58:	aa0003e1 	mov	x1, x0
 21f0a5c:	f9400c20 	ldr	x0, [x1,#24]
 21f0a60:	b5ffff60 	cbnz	x0, 21f0a4c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68934>
 21f0a64:	a9010261 	stp	x1, x0, [x19,#16]
 21f0a68:	f9000c33 	str	x19, [x1,#24]
 21f0a6c:	17fffff2 	b	21f0a34 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6891c>
 21f0a70:	d2800001 	mov	x1, #0x0                   	// #0
 21f0a74:	52800000 	mov	w0, #0x0                   	// #0
 21f0a78:	94003f12 	bl	22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x785a8>
 21f0a7c:	17ffffee 	b	21f0a34 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6891c>
 21f0a80:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21f0a84:	910003fd 	mov	x29, sp
 21f0a88:	f9400c22 	ldr	x2, [x1,#24]
 21f0a8c:	f9000bf3 	str	x19, [sp,#16]
 21f0a90:	aa0003f3 	mov	x19, x0
 21f0a94:	f9400820 	ldr	x0, [x1,#16]
 21f0a98:	b4000140 	cbz	x0, 21f0ac0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x689a8>
 21f0a9c:	f9000c02 	str	x2, [x0,#24]
 21f0aa0:	f9400c22 	ldr	x2, [x1,#24]
 21f0aa4:	b4000062 	cbz	x2, 21f0ab0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68998>
 21f0aa8:	f9400820 	ldr	x0, [x1,#16]
 21f0aac:	f9000840 	str	x0, [x2,#16]
 21f0ab0:	f9400bf3 	ldr	x19, [sp,#16]
 21f0ab4:	a9017c3f 	stp	xzr, xzr, [x1,#16]
 21f0ab8:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21f0abc:	d65f03c0 	ret
 21f0ac0:	f9000662 	str	x2, [x19,#8]
 21f0ac4:	f9400660 	ldr	x0, [x19,#8]
 21f0ac8:	b4fffee0 	cbz	x0, 21f0aa4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6898c>
 21f0acc:	f90017e1 	str	x1, [sp,#40]
 21f0ad0:	9404b760 	bl	231e850 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x196738>
 21f0ad4:	f9400663 	ldr	x3, [x19,#8]
 21f0ad8:	f94017e1 	ldr	x1, [sp,#40]
 21f0adc:	b9400863 	ldr	w3, [x3,#8]
 21f0ae0:	0b030000 	add	w0, w0, w3
 21f0ae4:	f9400c22 	ldr	x2, [x1,#24]
 21f0ae8:	b9001260 	str	w0, [x19,#16]
 21f0aec:	17ffffee 	b	21f0aa4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6898c>
 21f0af0:	d000cf22 	adrp	x2, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f0af4:	f946d842 	ldr	x2, [x2,#3504]
 21f0af8:	b4000082 	cbz	x2, 21f0b08 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x689f0>
 21f0afc:	aa0003e1 	mov	x1, x0
 21f0b00:	aa0203e0 	mov	x0, x2
 21f0b04:	17ffffdf 	b	21f0a80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68968>
 21f0b08:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 21f0b0c:	d2800001 	mov	x1, #0x0                   	// #0
 21f0b10:	52800000 	mov	w0, #0x0                   	// #0
 21f0b14:	910003fd 	mov	x29, sp
 21f0b18:	94003eea 	bl	22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x785a8>
 21f0b1c:	a8c17bfd 	ldp	x29, x30, [sp],#16
 21f0b20:	d65f03c0 	ret
 21f0b24:	d503201f 	nop
 21f0b28:	d503201f 	nop
 21f0b2c:	d503201f 	nop
