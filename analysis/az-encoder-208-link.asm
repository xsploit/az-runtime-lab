
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000006c6df0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x36260>:
  6c6df0:	9470d604 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6c6df4:	aa1303e0 	mov	x0, x19
  6c6df8:	9470d602 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6c6dfc:	aa1603e0 	mov	x0, x22
  6c6e00:	9470d600 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6c6e04:	d28aaba2 	mov	x2, #0x555d                	// #21853
  6c6e08:	aa1703e1 	mov	x1, x23
  6c6e0c:	f2bce502 	movk	x2, #0xe728, lsl #16
  6c6e10:	910263e0 	add	x0, sp, #0x98
  6c6e14:	f2cc98c2 	movk	x2, #0x64c6, lsl #32
  6c6e18:	f2e012e2 	movk	x2, #0x97, lsl #48
  6c6e1c:	f9004fe2 	str	x2, [sp,#152]
  6c6e20:	97fff944 	bl	6c5330 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x347a0>
  6c6e24:	72001c1f 	tst	w0, #0xff
  6c6e28:	54000541 	b.ne	6c6ed0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x36340>
  6c6e2c:	9101e3f6 	add	x22, sp, #0x78
  6c6e30:	f000f7c1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  6c6e34:	aa1603e0 	mov	x0, x22
  6c6e38:	9136a021 	add	x1, x1, #0xda8
  6c6e3c:	9471b3a9 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6c6e40:	910203f3 	add	x19, sp, #0x80
  6c6e44:	b000f861 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  6c6e48:	9138a021 	add	x1, x1, #0xe28
  6c6e4c:	9100a021 	add	x1, x1, #0x28
  6c6e50:	aa1603e0 	mov	x0, x22
  6c6e54:	aa1303e8 	mov	x8, x19
  6c6e58:	94713366 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6c6e5c:	910223f4 	add	x20, sp, #0x88
  6c6e60:	b0010821 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  6c6e64:	aa1403e8 	mov	x8, x20
  6c6e68:	91366021 	add	x1, x1, #0xd98
  6c6e6c:	aa1303e0 	mov	x0, x19
  6c6e70:	94713360 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6c6e74:	910243f5 	add	x21, sp, #0x90
  6c6e78:	f000f861 	adrp	x1, 25d5000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x121a8>
  6c6e7c:	aa1503e0 	mov	x0, x21
  6c6e80:	91050021 	add	x1, x1, #0x140
  6c6e84:	9471b397 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6c6e88:	910263e8 	add	x8, sp, #0x98
  6c6e8c:	aa1503e1 	mov	x1, x21
  6c6e90:	aa1403e0 	mov	x0, x20
  6c6e94:	947132ff 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  6c6e98:	52800022 	mov	w2, #0x1                   	// #1
  6c6e9c:	52800001 	mov	w1, #0x0                   	// #0
  6c6ea0:	910263e0 	add	x0, sp, #0x98
  6c6ea4:	946ce54f 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  6c6ea8:	910263e0 	add	x0, sp, #0x98
  6c6eac:	9470d5d5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6c6eb0:	aa1503e0 	mov	x0, x21
  6c6eb4:	9470d5d3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6c6eb8:	aa1403e0 	mov	x0, x20
  6c6ebc:	9470d5d1 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6c6ec0:	aa1303e0 	mov	x0, x19
  6c6ec4:	9470d5cf 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6c6ec8:	aa1603e0 	mov	x0, x22
  6c6ecc:	9470d5cd 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6c6ed0:	d2880002 	mov	x2, #0x4000                	// #16384
  6c6ed4:	aa1703e1 	mov	x1, x23
  6c6ed8:	f2a82ea2 	movk	x2, #0x4175, lsl #16
  6c6edc:	910263e0 	add	x0, sp, #0x98
  6c6ee0:	f2d37b22 	movk	x2, #0x9bd9, lsl #32
  6c6ee4:	f2e04f42 	movk	x2, #0x27a, lsl #48
  6c6ee8:	f9004fe2 	str	x2, [sp,#152]
  6c6eec:	97fff911 	bl	6c5330 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x347a0>
  6c6ef0:	72001c1f 	tst	w0, #0xff
  6c6ef4:	54000541 	b.ne	6c6f9c <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3640c>
  6c6ef8:	9101e3f6 	add	x22, sp, #0x78
  6c6efc:	f000f7c1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  6c6f00:	aa1603e0 	mov	x0, x22
  6c6f04:	9136a021 	add	x1, x1, #0xda8
  6c6f08:	9471b376 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6c6f0c:	910203f3 	add	x19, sp, #0x80
  6c6f10:	b000f861 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  6c6f14:	9138a021 	add	x1, x1, #0xe28
  6c6f18:	9100a021 	add	x1, x1, #0x28
  6c6f1c:	aa1603e0 	mov	x0, x22
  6c6f20:	aa1303e8 	mov	x8, x19
  6c6f24:	94713333 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6c6f28:	910223f4 	add	x20, sp, #0x88
  6c6f2c:	b0010821 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  6c6f30:	aa1403e8 	mov	x8, x20
  6c6f34:	91366021 	add	x1, x1, #0xd98
  6c6f38:	aa1303e0 	mov	x0, x19
  6c6f3c:	9471332d 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6c6f40:	910243f5 	add	x21, sp, #0x90
  6c6f44:	f000f861 	adrp	x1, 25d5000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x121a8>
  6c6f48:	aa1503e0 	mov	x0, x21
  6c6f4c:	91062021 	add	x1, x1, #0x188
  6c6f50:	9471b364 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6c6f54:	910263e8 	add	x8, sp, #0x98
  6c6f58:	aa1503e1 	mov	x1, x21
  6c6f5c:	aa1403e0 	mov	x0, x20
  6c6f60:	947132cc 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  6c6f64:	52800022 	mov	w2, #0x1                   	// #1
  6c6f68:	52800001 	mov	w1, #0x0                   	// #0
  6c6f6c:	910263e0 	add	x0, sp, #0x98
