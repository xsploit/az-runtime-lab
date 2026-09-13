
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000981d00 <_ZSt20__throw_bad_weak_ptrv@@Base+0x770e8>:
  981d00:	a9b97bfd 	stp	x29, x30, [sp,#-112]!
  981d04:	910003fd 	mov	x29, sp
  981d08:	a90363f7 	stp	x23, x24, [sp,#48]
  981d0c:	aa0003f8 	mov	x24, x0
  981d10:	f9403400 	ldr	x0, [x0,#104]
  981d14:	b4000e80 	cbz	x0, 981ee4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x772cc>
  981d18:	f9400021 	ldr	x1, [x1]
  981d1c:	f9401000 	ldr	x0, [x0,#32]
  981d20:	eb01001f 	cmp	x0, x1
  981d24:	54000620 	b.eq	981de8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x771d0>
  981d28:	a90153f3 	stp	x19, x20, [sp,#16]
  981d2c:	910123f3 	add	x19, sp, #0x48
  981d30:	aa1303e0 	mov	x0, x19
  981d34:	9000e201 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  981d38:	910143f4 	add	x20, sp, #0x50
  981d3c:	9136a021 	add	x1, x1, #0xda8
  981d40:	9466c7e8 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  981d44:	b000e881 	adrp	x1, 2692000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xcf1a8>
  981d48:	aa1303e0 	mov	x0, x19
  981d4c:	aa1403e8 	mov	x8, x20
  981d50:	9112e021 	add	x1, x1, #0x4b8
  981d54:	946647a7 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  981d58:	a9025bf5 	stp	x21, x22, [sp,#32]
  981d5c:	910163f5 	add	x21, sp, #0x58
  981d60:	d000f241 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  981d64:	aa1503e8 	mov	x8, x21
  981d68:	91366021 	add	x1, x1, #0xd98
  981d6c:	aa1403e0 	mov	x0, x20
  981d70:	946647a0 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  981d74:	910183f6 	add	x22, sp, #0x60
  981d78:	d000e881 	adrp	x1, 2693000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xd01a8>
  981d7c:	aa1603e0 	mov	x0, x22
  981d80:	913d2021 	add	x1, x1, #0xf48
  981d84:	9466c7d7 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  981d88:	9101a3f7 	add	x23, sp, #0x68
  981d8c:	aa1603e1 	mov	x1, x22
  981d90:	aa1703e8 	mov	x8, x23
  981d94:	aa1503e0 	mov	x0, x21
  981d98:	9466473e 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  981d9c:	52800022 	mov	w2, #0x1                   	// #1
  981da0:	52800001 	mov	w1, #0x0                   	// #0
  981da4:	aa1703e0 	mov	x0, x23
  981da8:	9461f98e 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  981dac:	aa1703e0 	mov	x0, x23
  981db0:	9465ea14 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  981db4:	aa1603e0 	mov	x0, x22
  981db8:	9465ea12 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  981dbc:	aa1503e0 	mov	x0, x21
  981dc0:	9465ea10 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  981dc4:	aa1403e0 	mov	x0, x20
  981dc8:	9465ea0e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  981dcc:	aa1303e0 	mov	x0, x19
  981dd0:	9465ea0c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  981dd4:	a94153f3 	ldp	x19, x20, [sp,#16]
  981dd8:	a9425bf5 	ldp	x21, x22, [sp,#32]
  981ddc:	a94363f7 	ldp	x23, x24, [sp,#48]
  981de0:	a8c77bfd 	ldp	x29, x30, [sp],#112
  981de4:	d65f03c0 	ret
  981de8:	b9400041 	ldr	w1, [x2]
  981dec:	7100083f 	cmp	w1, #0x2
  981df0:	540001a8 	b.hi	981e24 <_ZSt20__throw_bad_weak_ptrv@@Base+0x7720c>
  981df4:	b000e880 	adrp	x0, 2692000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xcf1a8>
  981df8:	9112e000 	add	x0, x0, #0x4b8
  981dfc:	91022000 	add	x0, x0, #0x88
