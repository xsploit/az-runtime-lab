
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002154ec0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x955038>:
 2154ec0:	a9ba7bfd 	stp	x29, x30, [sp,#-96]!
 2154ec4:	aa0103e2 	mov	x2, x1
 2154ec8:	52800021 	mov	w1, #0x1                   	// #1
 2154ecc:	910003fd 	mov	x29, sp
 2154ed0:	f90013f5 	str	x21, [sp,#32]
 2154ed4:	aa0003f5 	mov	x21, x0
 2154ed8:	aa0203e0 	mov	x0, x2
 2154edc:	940012cb 	bl	2159a08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959b80>
 2154ee0:	b4000980 	cbz	x0, 2155010 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x955188>
 2154ee4:	a90153f3 	stp	x19, x20, [sp,#16]
 2154ee8:	aa0003f3 	mov	x19, x0
 2154eec:	79400000 	ldrh	w0, [x0]
 2154ef0:	340002e0 	cbz	w0, 2154f4c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9550c4>
 2154ef4:	b000d2f4 	adrp	x20, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 2154ef8:	912ac294 	add	x20, x20, #0xab0
 2154efc:	91004280 	add	x0, x20, #0x10
 2154f00:	08dffc01 	ldarb	w1, [x0]
 2154f04:	36000781 	tbz	w1, #0, 2154ff4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95516c>
 2154f08:	f9400e81 	ldr	x1, [x20,#24]
 2154f0c:	b4000101 	cbz	x1, 2154f2c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9550a4>
 2154f10:	b9400c22 	ldr	w2, [x1,#12]
 2154f14:	52800020 	mov	w0, #0x1                   	// #1
 2154f18:	6b00005f 	cmp	w2, w0
 2154f1c:	54000820 	b.eq	2155020 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x955198>
 2154f20:	910a6020 	add	x0, x1, #0x298
 2154f24:	aa1303e1 	mov	x1, x19
 2154f28:	9400111a 	bl	2159390 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959508>
 2154f2c:	aa1303e1 	mov	x1, x19
 2154f30:	aa1503e0 	mov	x0, x21
 2154f34:	97fffdff 	bl	2154730 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9548a8>
 2154f38:	52800020 	mov	w0, #0x1                   	// #1
 2154f3c:	a94153f3 	ldp	x19, x20, [sp,#16]
 2154f40:	f94013f5 	ldr	x21, [sp,#32]
 2154f44:	a8c67bfd 	ldp	x29, x30, [sp],#96
 2154f48:	d65f03c0 	ret
 2154f4c:	9100e3e0 	add	x0, sp, #0x38
 2154f50:	b0002361 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 2154f54:	9136a021 	add	x1, x1, #0xda8
 2154f58:	94077b62 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2154f5c:	b00067a1 	adrp	x1, 2e49000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8861a8>
 2154f60:	91138021 	add	x1, x1, #0x4e0
 2154f64:	911da021 	add	x1, x1, #0x768
 2154f68:	9100e3e0 	add	x0, sp, #0x38
 2154f6c:	910103e8 	add	x8, sp, #0x40
 2154f70:	9406fb20 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2154f74:	f00033a1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 2154f78:	910123e8 	add	x8, sp, #0x48
 2154f7c:	91366021 	add	x1, x1, #0xd98
 2154f80:	910103e0 	add	x0, sp, #0x40
 2154f84:	9406fb1b 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2154f88:	d00067a1 	adrp	x1, 2e4a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8871a8>
 2154f8c:	910143e0 	add	x0, sp, #0x50
 2154f90:	910b2021 	add	x1, x1, #0x2c8
 2154f94:	94077b53 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2154f98:	910143e1 	add	x1, sp, #0x50
 2154f9c:	910163e8 	add	x8, sp, #0x58
