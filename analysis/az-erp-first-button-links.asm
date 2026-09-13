
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000006cbd28 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3b198>:
  6cbd28:	d293a002 	mov	x2, #0x9d00                	// #40192
  6cbd2c:	a9b67bfd 	stp	x29, x30, [sp,#-160]!
  6cbd30:	f2bacc42 	movk	x2, #0xd662, lsl #16
  6cbd34:	f2cb24c2 	movk	x2, #0x5926, lsl #32
  6cbd38:	910003fd 	mov	x29, sp
  6cbd3c:	f2e80082 	movk	x2, #0x4004, lsl #48
  6cbd40:	aa0003e1 	mov	x1, x0
  6cbd44:	a90153f3 	stp	x19, x20, [sp,#16]
  6cbd48:	a9025bf5 	stp	x21, x22, [sp,#32]
  6cbd4c:	a90363f7 	stp	x23, x24, [sp,#48]
  6cbd50:	aa0003f7 	mov	x23, x0
  6cbd54:	910263e0 	add	x0, sp, #0x98
  6cbd58:	f9004fe2 	str	x2, [sp,#152]
  6cbd5c:	97ffff47 	bl	6cba78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3aee8>
  6cbd60:	72001c1f 	tst	w0, #0xff
  6cbd64:	54000541 	b.ne	6cbe0c <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3b27c>
  6cbd68:	9101e3f6 	add	x22, sp, #0x78
  6cbd6c:	d000f7a1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  6cbd70:	aa1603e0 	mov	x0, x22
  6cbd74:	9136a021 	add	x1, x1, #0xda8
  6cbd78:	94719fda 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6cbd7c:	910203f3 	add	x19, sp, #0x80
  6cbd80:	9000f841 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  6cbd84:	9138a021 	add	x1, x1, #0xe28
  6cbd88:	91026021 	add	x1, x1, #0x98
  6cbd8c:	aa1603e0 	mov	x0, x22
  6cbd90:	aa1303e8 	mov	x8, x19
  6cbd94:	94711f97 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6cbd98:	910223f4 	add	x20, sp, #0x88
  6cbd9c:	90010801 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  6cbda0:	aa1403e8 	mov	x8, x20
  6cbda4:	91366021 	add	x1, x1, #0xd98
  6cbda8:	aa1303e0 	mov	x0, x19
  6cbdac:	94711f91 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6cbdb0:	910243f5 	add	x21, sp, #0x90
  6cbdb4:	9000f841 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  6cbdb8:	aa1503e0 	mov	x0, x21
  6cbdbc:	913e4021 	add	x1, x1, #0xf90
  6cbdc0:	94719fc8 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6cbdc4:	910263e8 	add	x8, sp, #0x98
  6cbdc8:	aa1503e1 	mov	x1, x21
  6cbdcc:	aa1403e0 	mov	x0, x20
  6cbdd0:	94711f30 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  6cbdd4:	52800022 	mov	w2, #0x1                   	// #1
  6cbdd8:	52800001 	mov	w1, #0x0                   	// #0
  6cbddc:	910263e0 	add	x0, sp, #0x98
  6cbde0:	946cd180 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  6cbde4:	910263e0 	add	x0, sp, #0x98
  6cbde8:	9470c206 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6cbdec:	aa1503e0 	mov	x0, x21
  6cbdf0:	9470c204 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6cbdf4:	aa1403e0 	mov	x0, x20
  6cbdf8:	9470c202 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6cbdfc:	aa1303e0 	mov	x0, x19
  6cbe00:	9470c200 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6cbe04:	aa1603e0 	mov	x0, x22
  6cbe08:	9470c1fe 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6cbe0c:	d282c002 	mov	x2, #0x1600                	// #5632
  6cbe10:	aa1703e1 	mov	x1, x23
  6cbe14:	f2be9062 	movk	x2, #0xf483, lsl #16
  6cbe18:	910263e0 	add	x0, sp, #0x98
  6cbe1c:	f2df43c2 	movk	x2, #0xfa1e, lsl #32
  6cbe20:	f2e62be2 	movk	x2, #0x315f, lsl #48
  6cbe24:	f9004fe2 	str	x2, [sp,#152]
  6cbe28:	97ffff14 	bl	6cba78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3aee8>
  6cbe2c:	72001c1f 	tst	w0, #0xff
  6cbe30:	54000541 	b.ne	6cbed8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3b348>
  6cbe34:	9101e3f6 	add	x22, sp, #0x78
  6cbe38:	d000f7a1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  6cbe3c:	aa1603e0 	mov	x0, x22
  6cbe40:	9136a021 	add	x1, x1, #0xda8
  6cbe44:	94719fa7 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6cbe48:	910203f3 	add	x19, sp, #0x80
  6cbe4c:	9000f841 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  6cbe50:	9138a021 	add	x1, x1, #0xe28
  6cbe54:	91026021 	add	x1, x1, #0x98
  6cbe58:	aa1603e0 	mov	x0, x22
  6cbe5c:	aa1303e8 	mov	x8, x19
  6cbe60:	94711f64 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6cbe64:	910223f4 	add	x20, sp, #0x88
  6cbe68:	90010801 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  6cbe6c:	aa1403e8 	mov	x8, x20
  6cbe70:	91366021 	add	x1, x1, #0xd98
  6cbe74:	aa1303e0 	mov	x0, x19
  6cbe78:	94711f5e 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6cbe7c:	910243f5 	add	x21, sp, #0x90
  6cbe80:	9000f841 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  6cbe84:	aa1503e0 	mov	x0, x21
  6cbe88:	913f4021 	add	x1, x1, #0xfd0
  6cbe8c:	94719f95 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6cbe90:	910263e8 	add	x8, sp, #0x98
  6cbe94:	aa1503e1 	mov	x1, x21
  6cbe98:	aa1403e0 	mov	x0, x20
  6cbe9c:	94711efd 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  6cbea0:	52800022 	mov	w2, #0x1                   	// #1
  6cbea4:	52800001 	mov	w1, #0x0                   	// #0
  6cbea8:	910263e0 	add	x0, sp, #0x98
  6cbeac:	946cd14d 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  6cbeb0:	910263e0 	add	x0, sp, #0x98
  6cbeb4:	9470c1d3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6cbeb8:	aa1503e0 	mov	x0, x21
  6cbebc:	9470c1d1 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
