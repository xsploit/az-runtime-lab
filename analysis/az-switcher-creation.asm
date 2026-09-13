
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000007c5c40 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xcce98>:
  7c5c40:	aa0003f3 	mov	x19, x0
  7c5c44:	17fffff7 	b	7c5c20 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xcce78>
  7c5c48:	aa0003f3 	mov	x19, x0
  7c5c4c:	9102a3e0 	add	x0, sp, #0xa8
  7c5c50:	946cda6c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  7c5c54:	17fffff1 	b	7c5c18 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xcce70>
  7c5c58:	aa0003f3 	mov	x19, x0
  7c5c5c:	9102c3e0 	add	x0, sp, #0xb0
  7c5c60:	946cda68 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  7c5c64:	17fffffa 	b	7c5c4c <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xccea4>
  7c5c68:	aa0003f3 	mov	x19, x0
  7c5c6c:	17ffffef 	b	7c5c28 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xcce80>
  7c5c70:	aa0003f3 	mov	x19, x0
  7c5c74:	9102e3e0 	add	x0, sp, #0xb8
  7c5c78:	946cda62 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  7c5c7c:	17fffff8 	b	7c5c5c <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xcceb4>
  7c5c80:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
  7c5c84:	910003fd 	mov	x29, sp
  7c5c88:	a90153f3 	stp	x19, x20, [sp,#16]
  7c5c8c:	aa0803f4 	mov	x20, x8
  7c5c90:	a9025bf5 	stp	x21, x22, [sp,#32]
  7c5c94:	aa0003f5 	mov	x21, x0
  7c5c98:	aa0203f6 	mov	x22, x2
  7c5c9c:	d2805200 	mov	x0, #0x290                 	// #656
  7c5ca0:	f9001bf7 	str	x23, [sp,#48]
  7c5ca4:	aa0103f7 	mov	x23, x1
  7c5ca8:	97f17c26 	bl	424d40 <_Znwm@plt>
  7c5cac:	d000f241 	adrp	x1, 260f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x4c1a8>
  7c5cb0:	aa0003f3 	mov	x19, x0
  7c5cb4:	fd45ec20 	ldr	d0, [x1,#3032]
  7c5cb8:	52800041 	mov	w1, #0x2                   	// #2
  7c5cbc:	9467b3d5 	bl	21b2c10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2aaf8>
  7c5cc0:	f000f1e2 	adrp	x2, 2604000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x411a8>
  7c5cc4:	912fa042 	add	x2, x2, #0xbe8
  7c5cc8:	aa1303e1 	mov	x1, x19
  7c5ccc:	aa1703e0 	mov	x0, x23
  7c5cd0:	f9000262 	str	x2, [x19]
  7c5cd4:	97fffec5 	bl	7c57e8 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xcca40>
  7c5cd8:	aa1403e8 	mov	x8, x20
  7c5cdc:	aa1603e2 	mov	x2, x22
  7c5ce0:	aa1303e1 	mov	x1, x19
  7c5ce4:	aa1503e0 	mov	x0, x21
  7c5ce8:	52800003 	mov	w3, #0x0                   	// #0
  7c5cec:	9467abfd 	bl	21b0ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x28bc8>
  7c5cf0:	aa1403e0 	mov	x0, x20
  7c5cf4:	a94153f3 	ldp	x19, x20, [sp,#16]
  7c5cf8:	a9425bf5 	ldp	x21, x22, [sp,#32]
  7c5cfc:	f9401bf7 	ldr	x23, [sp,#48]
  7c5d00:	a8c47bfd 	ldp	x29, x30, [sp],#64
  7c5d04:	d65f03c0 	ret
  7c5d08:	d2805201 	mov	x1, #0x290                 	// #656
  7c5d0c:	aa0003f4 	mov	x20, x0
  7c5d10:	aa1303e0 	mov	x0, x19
  7c5d14:	97f18253 	bl	426660 <_ZdlPvm@plt>
  7c5d18:	aa1403e0 	mov	x0, x20
  7c5d1c:	97f17bfd 	bl	424d10 <_Unwind_Resume@plt>
  7c5d20:	a9b47bfd 	stp	x29, x30, [sp,#-192]!
  7c5d24:	910003fd 	mov	x29, sp
  7c5d28:	a90153f3 	stp	x19, x20, [sp,#16]
  7c5d2c:	910283f4 	add	x20, sp, #0xa0
  7c5d30:	aa1403e8 	mov	x8, x20
  7c5d34:	aa0003f3 	mov	x19, x0
  7c5d38:	a9025bf5 	stp	x21, x22, [sp,#32]
  7c5d3c:	aa0103f5 	mov	x21, x1
  7c5d40:	52800001 	mov	w1, #0x0                   	// #0
  7c5d44:	97ffd855 	bl	7bbe98 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xc30f0>
  7c5d48:	9102a3e8 	add	x8, sp, #0xa8
  7c5d4c:	52800021 	mov	w1, #0x1                   	// #1
  7c5d50:	aa1303e0 	mov	x0, x19
  7c5d54:	97ffd851 	bl	7bbe98 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xc30f0>
  7c5d58:	9102c3e8 	add	x8, sp, #0xb0
  7c5d5c:	52800041 	mov	w1, #0x2                   	// #2
