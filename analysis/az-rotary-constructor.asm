
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f3e10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6bcf8>:
 21f3e10:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 21f3e14:	90006382 	adrp	x2, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f3e18:	910e6042 	add	x2, x2, #0x398
 21f3e1c:	910003fd 	mov	x29, sp
 21f3e20:	a90153f3 	stp	x19, x20, [sp,#16]
 21f3e24:	aa0003f3 	mov	x19, x0
 21f3e28:	f000cf14 	adrp	x20, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f3e2c:	91352294 	add	x20, x20, #0xd48
 21f3e30:	a9025bf5 	stp	x21, x22, [sp,#32]
 21f3e34:	52800415 	mov	w21, #0x20                  	// #32
 21f3e38:	a90363f7 	stp	x23, x24, [sp,#48]
 21f3e3c:	aa0103f8 	mov	x24, x1
 21f3e40:	f8008402 	str	x2, [x0],#8
 21f3e44:	97fff8d3 	bl	21f2190 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6a078>
 21f3e48:	91010260 	add	x0, x19, #0x40
 21f3e4c:	9404dfb5 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 21f3e50:	b900827f 	str	wzr, [x19,#128]
 21f3e54:	d2805400 	mov	x0, #0x2a0                 	// #672
 21f3e58:	b9009a7f 	str	wzr, [x19,#152]
 21f3e5c:	b900b27f 	str	wzr, [x19,#176]
 21f3e60:	9788c45c 	bl	424fd0 <malloc@plt>
 21f3e64:	f9005260 	str	x0, [x19,#160]
 21f3e68:	52800700 	mov	w0, #0x38                  	// #56
 21f3e6c:	b900aa60 	str	w0, [x19,#168]
 21f3e70:	d2802000 	mov	x0, #0x100                 	// #256
 21f3e74:	9788c457 	bl	424fd0 <malloc@plt>
 21f3e78:	f9003a60 	str	x0, [x19,#112]
 21f3e7c:	b9007a75 	str	w21, [x19,#120]
 21f3e80:	d2802000 	mov	x0, #0x100                 	// #256
 21f3e84:	9788c453 	bl	424fd0 <malloc@plt>
 21f3e88:	f9004660 	str	x0, [x19,#136]
 21f3e8c:	b9009275 	str	w21, [x19,#144]
 21f3e90:	90006395 	adrp	x21, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f3e94:	910f22b5 	add	x21, x21, #0x3c8
 21f3e98:	f9000275 	str	x21, [x19]
 21f3e9c:	f9005e7f 	str	xzr, [x19,#184]
 21f3ea0:	08dffe80 	ldarb	w0, [x20]
 21f3ea4:	f000cf16 	adrp	x22, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f3ea8:	360005c0 	tbz	w0, #0, 21f3f60 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6be48>
 21f3eac:	b94d52c1 	ldr	w1, [x22,#3408]
 21f3eb0:	90006382 	adrp	x2, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f3eb4:	9110a042 	add	x2, x2, #0x428
 21f3eb8:	90006380 	adrp	x0, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f3ebc:	91120000 	add	x0, x0, #0x480
 21f3ec0:	f9000262 	str	x2, [x19]
 21f3ec4:	f9006260 	str	x0, [x19,#192]
 21f3ec8:	d2800200 	mov	x0, #0x10                  	// #16
 21f3ecc:	b900ca61 	str	w1, [x19,#200]
 21f3ed0:	f9006a78 	str	x24, [x19,#208]
 21f3ed4:	b900da7f 	str	wzr, [x19,#216]
 21f3ed8:	3903727f 	strb	wzr, [x19,#220]
 21f3edc:	9788c399 	bl	424d40 <_Znwm@plt>
 21f3ee0:	aa0003f5 	mov	x21, x0
 21f3ee4:	f000cf14 	adrp	x20, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f3ee8:	9134e294 	add	x20, x20, #0xd38
 21f3eec:	08dffe80 	ldarb	w0, [x20]
 21f3ef0:	f000cf16 	adrp	x22, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f3ef4:	36000480 	tbz	w0, #0, 21f3f84 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6be6c>
 21f3ef8:	f9405e60 	ldr	x0, [x19,#184]
 21f3efc:	90006381 	adrp	x1, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f3f00:	91100021 	add	x1, x1, #0x400
 21f3f04:	b94d42c2 	ldr	w2, [x22,#3392]
 21f3f08:	f90002a1 	str	x1, [x21]
 21f3f0c:	b9000aa2 	str	w2, [x21,#8]
 21f3f10:	f9005e75 	str	x21, [x19,#184]
 21f3f14:	b40001c0 	cbz	x0, 21f3f4c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6be34>
 21f3f18:	f9400002 	ldr	x2, [x0]
 21f3f1c:	90000021 	adrp	x1, 21f7000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6eee8>
 21f3f20:	91214021 	add	x1, x1, #0x850
 21f3f24:	f9400442 	ldr	x2, [x2,#8]
 21f3f28:	eb01005f 	cmp	x2, x1
 21f3f2c:	540003c1 	b.ne	21f3fa4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6be8c>
 21f3f30:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f3f34:	d2800201 	mov	x1, #0x10                  	// #16
 21f3f38:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21f3f3c:	a94363f7 	ldp	x23, x24, [sp,#48]
 21f3f40:	b900081f 	str	wzr, [x0,#8]
 21f3f44:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21f3f48:	1788c9c6 	b	426660 <_ZdlPvm@plt>
 21f3f4c:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f3f50:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21f3f54:	a94363f7 	ldp	x23, x24, [sp,#48]
 21f3f58:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21f3f5c:	d65f03c0 	ret
 21f3f60:	aa1403e0 	mov	x0, x20
 21f3f64:	f000cf16 	adrp	x22, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f3f68:	9788c8be 	bl	426260 <__cxa_guard_acquire@plt>
 21f3f6c:	34fffa00 	cbz	w0, 21f3eac <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6bd94>
 21f3f70:	9792f266 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 21f3f74:	b90d52c0 	str	w0, [x22,#3408]
 21f3f78:	aa1403e0 	mov	x0, x20
 21f3f7c:	9788ca31 	bl	426840 <__cxa_guard_release@plt>
 21f3f80:	17ffffcb 	b	21f3eac <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6bd94>
 21f3f84:	aa1403e0 	mov	x0, x20
 21f3f88:	9788c8b6 	bl	426260 <__cxa_guard_acquire@plt>
 21f3f8c:	34fffb60 	cbz	w0, 21f3ef8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6bde0>
