
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000001cf3d08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4f3e80>:
 1cf3d08:	a9b57bfd 	stp	x29, x30, [sp,#-176]!
 1cf3d0c:	910003fd 	mov	x29, sp
 1cf3d10:	b9400041 	ldr	w1, [x2]
 1cf3d14:	a90153f3 	stp	x19, x20, [sp,#16]
 1cf3d18:	aa0003f3 	mov	x19, x0
 1cf3d1c:	d1024000 	sub	x0, x0, #0x90
 1cf3d20:	a9025bf5 	stp	x21, x22, [sp,#32]
 1cf3d24:	b9006be1 	str	w1, [sp,#104]
 1cf3d28:	f9003be0 	str	x0, [sp,#112]
 1cf3d2c:	9418e7c9 	bl	232dc50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5b38>
 1cf3d30:	aa0003f4 	mov	x20, x0
 1cf3d34:	941a87af 	bl	2395bf0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x207d0>
 1cf3d38:	b4000040 	cbz	x0, 1cf3d40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4f3eb8>
 1cf3d3c:	f9400800 	ldr	x0, [x0,#16]
 1cf3d40:	eb00029f 	cmp	x20, x0
 1cf3d44:	54000a80 	b.eq	1cf3e94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4f400c>
 1cf3d48:	9414b4f6 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 1cf3d4c:	72001c1f 	tst	w0, #0xff
 1cf3d50:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 1cf3d54:	90004701 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 1cf3d58:	9118e021 	add	x1, x1, #0x638
 1cf3d5c:	f9003fe1 	str	x1, [sp,#120]
 1cf3d60:	fd0043e0 	str	d0, [sp,#128]
 1cf3d64:	2f00e400 	movi	d0, #0x0
 1cf3d68:	54000080 	b.eq	1cf3d78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4f3ef0>
 1cf3d6c:	9000f720 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 1cf3d70:	394de000 	ldrb	w0, [x0,#888]
 1cf3d74:	340009e0 	cbz	w0, 1cf3eb0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4f4028>
 1cf3d78:	f9411a63 	ldr	x3, [x19,#560]
 1cf3d7c:	f90053ff 	str	xzr, [sp,#160]
 1cf3d80:	d2800102 	mov	x2, #0x8                   	// #8
 1cf3d84:	d2800601 	mov	x1, #0x30                  	// #48
 1cf3d88:	aa0303e0 	mov	x0, x3
 1cf3d8c:	fd0047e0 	str	d0, [sp,#136]
 1cf3d90:	f9400063 	ldr	x3, [x3]
 1cf3d94:	f9400863 	ldr	x3, [x3,#16]
 1cf3d98:	d63f0060 	blr	x3
 1cf3d9c:	aa0003f5 	mov	x21, x0
 1cf3da0:	b4000ac0 	cbz	x0, 1cf3ef8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4f4070>
 1cf3da4:	91092260 	add	x0, x19, #0x248
 1cf3da8:	f9001bf7 	str	x23, [sp,#48]
 1cf3dac:	c85ffc17 	ldaxr	x23, [x0]
 1cf3db0:	910006f7 	add	x23, x23, #0x1
 1cf3db4:	c801fc17 	stlxr	w1, x23, [x0]
 1cf3db8:	35ffffa1 	cbnz	w1, 1cf3dac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4f3f24>
 1cf3dbc:	97a7ebb1 	bl	6eec80 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x5e0f0>
 1cf3dc0:	f000f4f4 	adrp	x20, 3b92000 <stdout@@GLIBC_2.17+0x50f40>
 1cf3dc4:	f0007ca1 	adrp	x1, 2c8a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x6c71a8>
 1cf3dc8:	91372294 	add	x20, x20, #0xdc8
 1cf3dcc:	910ea021 	add	x1, x1, #0x3a8
 1cf3dd0:	91038296 	add	x22, x20, #0xe0
 1cf3dd4:	a9468fe2 	ldp	x2, x3, [sp,#104]
 1cf3dd8:	91340021 	add	x1, x1, #0xd00
 1cf3ddc:	f90002a1 	str	x1, [x21]
 1cf3de0:	b9000aa0 	str	w0, [x21,#8]
 1cf3de4:	f9000ab7 	str	x23, [x21,#16]
 1cf3de8:	a9018ea2 	stp	x2, x3, [x21,#24]
 1cf3dec:	08dffec0 	ldarb	w0, [x22]
 1cf3df0:	36000640 	tbz	w0, #0, 1cf3eb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4f4030>
 1cf3df4:	9103a294 	add	x20, x20, #0xe8
 1cf3df8:	885ffe80 	ldaxr	w0, [x20]
 1cf3dfc:	11000400 	add	w0, w0, #0x1
 1cf3e00:	8801fe80 	stlxr	w1, w0, [x20]
 1cf3e04:	35ffffa1 	cbnz	w1, 1cf3df8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4f3f70>
 1cf3e08:	f9401bf7 	ldr	x23, [sp,#48]
 1cf3e0c:	9101e3e0 	add	x0, sp, #0x78
 1cf3e10:	9108a273 	add	x19, x19, #0x228
 1cf3e14:	97a73bd9 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 1cf3e18:	aa1503e1 	mov	x1, x21
 1cf3e1c:	aa1303e0 	mov	x0, x19
 1cf3e20:	94146460 	bl	220cfa0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84e88>
 1cf3e24:	b40003e0 	cbz	x0, 1cf3ea0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4f4018>
 1cf3e28:	f9400e60 	ldr	x0, [x19,#24]
 1cf3e2c:	b40003a0 	cbz	x0, 1cf3ea0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4f4018>
 1cf3e30:	9414b4bc 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 1cf3e34:	72001c1f 	tst	w0, #0xff
 1cf3e38:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 1cf3e3c:	90004701 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 1cf3e40:	91196021 	add	x1, x1, #0x658
 1cf3e44:	f9003fe1 	str	x1, [sp,#120]
 1cf3e48:	fd0043e0 	str	d0, [sp,#128]
 1cf3e4c:	2f00e400 	movi	d0, #0x0
 1cf3e50:	54000080 	b.eq	1cf3e60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4f3fd8>
 1cf3e54:	9000f720 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 1cf3e58:	394de000 	ldrb	w0, [x0,#888]
 1cf3e5c:	340004a0 	cbz	w0, 1cf3ef0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4f4068>
 1cf3e60:	f9400e61 	ldr	x1, [x19,#24]
 1cf3e64:	f90053ff 	str	xzr, [sp,#160]
 1cf3e68:	fd0047e0 	str	d0, [sp,#136]
 1cf3e6c:	aa0103e0 	mov	x0, x1
 1cf3e70:	f9400021 	ldr	x1, [x1]
 1cf3e74:	f9400821 	ldr	x1, [x1,#16]
 1cf3e78:	d63f0020 	blr	x1
 1cf3e7c:	9101e3e0 	add	x0, sp, #0x78
 1cf3e80:	97a73bbe 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 1cf3e84:	a94153f3 	ldp	x19, x20, [sp,#16]
 1cf3e88:	a9425bf5 	ldp	x21, x22, [sp,#32]
 1cf3e8c:	a8cb7bfd 	ldp	x29, x30, [sp],#176
 1cf3e90:	d65f03c0 	ret
 1cf3e94:	9101a3e0 	add	x0, sp, #0x68
 1cf3e98:	9101c3e1 	add	x1, sp, #0x70
 1cf3e9c:	97ffdc1f 	bl	1ceaf18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4eb090>
 1cf3ea0:	a94153f3 	ldp	x19, x20, [sp,#16]
 1cf3ea4:	a9425bf5 	ldp	x21, x22, [sp,#32]
 1cf3ea8:	a8cb7bfd 	ldp	x29, x30, [sp],#176
 1cf3eac:	d65f03c0 	ret
 1cf3eb0:	9418ea10 	bl	232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a65d8>
 1cf3eb4:	17ffffb1 	b	1cf3d78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4f3ef0>
 1cf3eb8:	aa1603e0 	mov	x0, x22
 1cf3ebc:	979cc8e9 	bl	426260 <__cxa_guard_acquire@plt>
