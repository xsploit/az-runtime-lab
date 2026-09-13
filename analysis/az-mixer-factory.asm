
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021b2be0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2aac8>:
 21b2be0:	f9409ea0 	ldr	x0, [x21,#312]
 21b2be4:	b4000040 	cbz	x0, 21b2bec <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2aad4>
 21b2be8:	9789c89a 	bl	424e50 <_ZdlPv@plt>
 21b2bec:	d0002280 	adrp	x0, 2604000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x411a8>
 21b2bf0:	91272000 	add	x0, x0, #0x9c8
 21b2bf4:	f90002a0 	str	x0, [x21]
 21b2bf8:	aa1503e0 	mov	x0, x21
 21b2bfc:	940490e5 	bl	22d6f90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x14ee78>
 21b2c00:	aa1303e0 	mov	x0, x19
 21b2c04:	9789c843 	bl	424d10 <_Unwind_Resume@plt>
 21b2c08:	d503201f 	nop
 21b2c0c:	d503201f 	nop
 21b2c10:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 21b2c14:	910003fd 	mov	x29, sp
 21b2c18:	a90153f3 	stp	x19, x20, [sp,#16]
 21b2c1c:	aa0003f3 	mov	x19, x0
 21b2c20:	2a0103f4 	mov	w20, w1
 21b2c24:	f90013f5 	str	x21, [sp,#32]
 21b2c28:	91044275 	add	x21, x19, #0x110
 21b2c2c:	fd001fe0 	str	d0, [sp,#56]
 21b2c30:	9404c2e0 	bl	22e37b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x15b698>
 21b2c34:	fd401fe0 	ldr	d0, [sp,#56]
 21b2c38:	90006520 	adrp	x0, 2e56000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8931a8>
 21b2c3c:	91386000 	add	x0, x0, #0xe18
 21b2c40:	1e2e1001 	fmov	s1, #1.000000000000000000e+00
 21b2c44:	f9000260 	str	x0, [x19]
 21b2c48:	2a1403e1 	mov	w1, w20
 21b2c4c:	aa1503e0 	mov	x0, x21
 21b2c50:	97ffff64 	bl	21b29e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a8c8>
 21b2c54:	b9404263 	ldr	w3, [x19,#64]
 21b2c58:	531f7a81 	lsl	w1, w20, #1
 21b2c5c:	fd401e60 	ldr	d0, [x19,#56]
 21b2c60:	52800042 	mov	w2, #0x2                   	// #2
 21b2c64:	b9028a7f 	str	wzr, [x19,#648]
 21b2c68:	aa1303e0 	mov	x0, x19
 21b2c6c:	9404ba5d 	bl	22e15e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1594c8>
 21b2c70:	52800001 	mov	w1, #0x0                   	// #0
 21b2c74:	aa1303e0 	mov	x0, x19
 21b2c78:	97fffc72 	bl	21b1e40 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x29d28>
 21b2c7c:	a94153f3 	ldp	x19, x20, [sp,#16]
