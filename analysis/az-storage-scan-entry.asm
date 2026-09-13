
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021b9b90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x31a78>:
 21b9b90:	a9b67bfd 	stp	x29, x30, [sp,#-160]!
 21b9b94:	910003fd 	mov	x29, sp
 21b9b98:	a90153f3 	stp	x19, x20, [sp,#16]
 21b9b9c:	aa0003f3 	mov	x19, x0
 21b9ba0:	a9025bf5 	stp	x21, x22, [sp,#32]
 21b9ba4:	a90363f7 	stp	x23, x24, [sp,#48]
 21b9ba8:	a9046bf9 	stp	x25, x26, [sp,#64]
 21b9bac:	9101601a 	add	x26, x0, #0x58
 21b9bb0:	a90573fb 	stp	x27, x28, [sp,#80]
 21b9bb4:	9100201b 	add	x27, x0, #0x8
 21b9bb8:	aa1b03e1 	mov	x1, x27
 21b9bbc:	f9402e62 	ldr	x2, [x19,#88]
 21b9bc0:	aa1a03e0 	mov	x0, x26
 21b9bc4:	f9403842 	ldr	x2, [x2,#112]
 21b9bc8:	d63f0040 	blr	x2
 21b9bcc:	9101e3e0 	add	x0, sp, #0x78
 21b9bd0:	94055650 	bl	230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1873f8>
 21b9bd4:	910203e0 	add	x0, sp, #0x80
 21b9bd8:	b9436a78 	ldr	w24, [x19,#872]
 21b9bdc:	9405564d 	bl	230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1873f8>
 21b9be0:	b9435260 	ldr	w0, [x19,#848]
 21b9be4:	34000be0 	cbz	w0, 21b9d60 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x31c48>
 21b9be8:	7100031f 	cmp	w24, #0x0
 21b9bec:	54000bad 	b.le	21b9d60 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x31c48>
 21b9bf0:	f00064f9 	adrp	x25, 2e58000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8951a8>
 21b9bf4:	910c2339 	add	x25, x25, #0x308
 21b9bf8:	910d6276 	add	x22, x19, #0x358
 21b9bfc:	910e4260 	add	x0, x19, #0x390
 21b9c00:	d2800014 	mov	x20, #0x0                   	// #0
 21b9c04:	f90037e0 	str	x0, [sp,#104]
 21b9c08:	b94012c0 	ldr	w0, [x22,#16]
 21b9c0c:	2a1403f7 	mov	w23, w20
 21b9c10:	6b14001f 	cmp	w0, w20
 21b9c14:	54001129 	b.ls	21b9e38 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x31d20>
 21b9c18:	f941ae75 	ldr	x21, [x19,#856]
 21b9c1c:	910243e0 	add	x0, sp, #0x90
 21b9c20:	8b1412b5 	add	x21, x21, x20, lsl #4
 21b9c24:	aa1503e1 	mov	x1, x21
 21b9c28:	94055642 	bl	230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187418>
 21b9c2c:	b9400aa0 	ldr	w0, [x21,#8]
 21b9c30:	b9009be0 	str	w0, [sp,#152]
 21b9c34:	910243e1 	add	x1, sp, #0x90
 21b9c38:	910223e0 	add	x0, sp, #0x88
 21b9c3c:	9405588d 	bl	230fe70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187d58>
 21b9c40:	f94047e0 	ldr	x0, [sp,#136]
 21b9c44:	39400001 	ldrb	w1, [x0]
 21b9c48:	340007e1 	cbz	w1, 21b9d44 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x31c2c>
 21b9c4c:	52800001 	mov	w1, #0x0                   	// #0
 21b9c50:	9789a940 	bl	424150 <open64@plt>
 21b9c54:	2a0003f5 	mov	w21, w0
 21b9c58:	37f80760 	tbnz	w0, #31, 21b9d44 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x31c2c>
 21b9c5c:	910223e0 	add	x0, sp, #0x88
 21b9c60:	94050a68 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21b9c64:	910243e0 	add	x0, sp, #0x90
 21b9c68:	94050a66 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21b9c6c:	52800002 	mov	w2, #0x0                   	// #0
 21b9c70:	52800061 	mov	w1, #0x3                   	// #3
 21b9c74:	2a1503e0 	mov	w0, w21
 21b9c78:	9789a966 	bl	424210 <fcntl64@plt>
 21b9c7c:	32150002 	orr	w2, w0, #0x800
 21b9c80:	52800081 	mov	w1, #0x4                   	// #4
 21b9c84:	2a1503e0 	mov	w0, w21
 21b9c88:	9789a962 	bl	424210 <fcntl64@plt>
 21b9c8c:	37f80e00 	tbnz	w0, #31, 21b9e4c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x31d34>
 21b9c90:	910203e2 	add	x2, sp, #0x80
 21b9c94:	2a1503e1 	mov	w1, w21
 21b9c98:	aa1303e0 	mov	x0, x19
 21b9c9c:	97ffff49 	bl	21b99c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x318a8>
 21b9ca0:	2a0003fc 	mov	w28, w0
 21b9ca4:	2a1503e0 	mov	w0, w21
 21b9ca8:	9789ace6 	bl	425040 <close@plt>
 21b9cac:	71000f9f 	cmp	w28, #0x3
 21b9cb0:	54001c40 	b.eq	21ba038 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x31f20>
 21b9cb4:	5400078c 	b.gt	21b9da4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x31c8c>
 21b9cb8:	7100079f 	cmp	w28, #0x1
 21b9cbc:	54001620 	b.eq	21b9f80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x31e68>
