
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002159d00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959e78>:
 2159d00:	54ffff41 	b.ne	2159ce8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959e60>
 2159d04:	2a2103e1 	mvn	w1, w1
 2159d08:	12003c21 	and	w1, w1, #0xffff
 2159d0c:	7940c260 	ldrh	w0, [x19,#96]
 2159d10:	6b01001f 	cmp	w0, w1
 2159d14:	54000241 	b.ne	2159d5c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959ed4>
 2159d18:	aa1303e0 	mov	x0, x19
 2159d1c:	a9407bfd 	ldp	x29, x30, [sp]
 2159d20:	a94153f3 	ldp	x19, x20, [sp,#16]
 2159d24:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2159d28:	a94363f7 	ldp	x23, x24, [sp,#48]
 2159d2c:	9109c3ff 	add	sp, sp, #0x270
 2159d30:	d65f03c0 	ret
 2159d34:	b4000873 	cbz	x19, 2159e40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959fb8>
 2159d38:	a9007e7f 	stp	xzr, xzr, [x19]
 2159d3c:	a9017e7f 	stp	xzr, xzr, [x19,#16]
 2159d40:	a9027e7f 	stp	xzr, xzr, [x19,#32]
 2159d44:	a9037e7f 	stp	xzr, xzr, [x19,#48]
 2159d48:	a9047e7f 	stp	xzr, xzr, [x19,#64]
 2159d4c:	a9057e7f 	stp	xzr, xzr, [x19,#80]
 2159d50:	a9067e7f 	stp	xzr, xzr, [x19,#96]
 2159d54:	a9077e7f 	stp	xzr, xzr, [x19,#112]
 2159d58:	17ffff38 	b	2159a38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959bb0>
 2159d5c:	f0006761 	adrp	x1, 2e48000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8851a8>
 2159d60:	910b8021 	add	x1, x1, #0x2e0
 2159d64:	aa1403e0 	mov	x0, x20
 2159d68:	9407013a 	bl	231a250 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x192138>
 2159d6c:	910103e8 	add	x8, sp, #0x40
 2159d70:	aa1403e0 	mov	x0, x20
 2159d74:	94029ab3 	bl	2200840 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x78728>
 2159d78:	f0006740 	adrp	x0, 2e44000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8811a8>
 2159d7c:	910103e1 	add	x1, sp, #0x40
 2159d80:	910123e8 	add	x8, sp, #0x48
 2159d84:	911a2000 	add	x0, x0, #0x688
 2159d88:	9407689e 	bl	2334000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abee8>
 2159d8c:	910143f5 	add	x21, sp, #0x50
 2159d90:	d0003701 	adrp	x1, 283b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2781a8>
 2159d94:	aa1503e8 	mov	x8, x21
 2159d98:	911a2021 	add	x1, x1, #0x688
 2159d9c:	910123e0 	add	x0, sp, #0x48
 2159da0:	9406e794 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2159da4:	9000d2c2 	adrp	x2, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 2159da8:	910163f6 	add	x22, sp, #0x58
 2159dac:	aa1603e0 	mov	x0, x22
 2159db0:	b94adc41 	ldr	w1, [x2,#2780]
 2159db4:	11000421 	add	w1, w1, #0x1
 2159db8:	b90adc41 	str	w1, [x2,#2780]
 2159dbc:	9406db55 	bl	2310b10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1889f8>
 2159dc0:	910183f7 	add	x23, sp, #0x60
 2159dc4:	aa1603e1 	mov	x1, x22
 2159dc8:	aa1703e8 	mov	x8, x23
 2159dcc:	aa1503e0 	mov	x0, x21
 2159dd0:	9406e730 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 2159dd4:	9101a3f8 	add	x24, sp, #0x68
 2159dd8:	d0002be1 	adrp	x1, 26d7000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1141a8>
 2159ddc:	aa1803e8 	mov	x8, x24
 2159de0:	91388021 	add	x1, x1, #0xe20
 2159de4:	aa1703e0 	mov	x0, x23
 2159de8:	9406e782 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2159dec:	aa1803e1 	mov	x1, x24
 2159df0:	aa1403e0 	mov	x0, x20
 2159df4:	9407011f 	bl	231a270 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x192158>
 2159df8:	aa1403e0 	mov	x0, x20
 2159dfc:	94029871 	bl	21fffc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x77ea8>
 2159e00:	aa1803e0 	mov	x0, x24
 2159e04:	940689ff 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159e08:	aa1703e0 	mov	x0, x23
 2159e0c:	940689fd 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159e10:	aa1603e0 	mov	x0, x22
 2159e14:	940689fb 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159e18:	aa1503e0 	mov	x0, x21
 2159e1c:	940689f9 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159e20:	910123e0 	add	x0, sp, #0x48
 2159e24:	940689f7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159e28:	910103e0 	add	x0, sp, #0x40
 2159e2c:	d2800013 	mov	x19, #0x0                   	// #0
 2159e30:	940689f4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159e34:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2159e38:	a94363f7 	ldp	x23, x24, [sp,#48]
 2159e3c:	17fffeff 	b	2159a38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959bb0>
 2159e40:	9101a3e0 	add	x0, sp, #0x68
 2159e44:	90002341 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 2159e48:	9136a021 	add	x1, x1, #0xda8
 2159e4c:	940767a5 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2159e50:	90006781 	adrp	x1, 2e49000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8861a8>
 2159e54:	91138021 	add	x1, x1, #0x4e0
 2159e58:	9101a3e0 	add	x0, sp, #0x68
 2159e5c:	910183e8 	add	x8, sp, #0x60
 2159e60:	911bc021 	add	x1, x1, #0x6f0
 2159e64:	9406e763 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2159e68:	910163e8 	add	x8, sp, #0x58
 2159e6c:	910183e0 	add	x0, sp, #0x60
 2159e70:	d0003381 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 2159e74:	91366021 	add	x1, x1, #0xd98
 2159e78:	9406e75e 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2159e7c:	9101c3e0 	add	x0, sp, #0x70
 2159e80:	d00023a1 	adrp	x1, 25cf000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xc1a8>
 2159e84:	9124a021 	add	x1, x1, #0x928
 2159e88:	94076796 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2159e8c:	910143e8 	add	x8, sp, #0x50
 2159e90:	9101c3e1 	add	x1, sp, #0x70
 2159e94:	910163e0 	add	x0, sp, #0x58
 2159e98:	9406e6fe 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 2159e9c:	52800022 	mov	w2, #0x1                   	// #1
 2159ea0:	52800001 	mov	w1, #0x0                   	// #0
 2159ea4:	910143e0 	add	x0, sp, #0x50
 2159ea8:	9402994e 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 2159eac:	910143e0 	add	x0, sp, #0x50
 2159eb0:	940689d4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159eb4:	9101c3e0 	add	x0, sp, #0x70
 2159eb8:	940689d2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159ebc:	910163e0 	add	x0, sp, #0x58
 2159ec0:	940689d0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159ec4:	910183e0 	add	x0, sp, #0x60
 2159ec8:	940689ce 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159ecc:	9101a3e0 	add	x0, sp, #0x68
 2159ed0:	940689cc 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159ed4:	17fffed9 	b	2159a38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959bb0>
 2159ed8:	52800001 	mov	w1, #0x0                   	// #0
 2159edc:	17ffff8c 	b	2159d0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959e84>
 2159ee0:	910163f6 	add	x22, sp, #0x58
 2159ee4:	90002341 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 2159ee8:	aa1603e0 	mov	x0, x22
 2159eec:	9136a021 	add	x1, x1, #0xda8
 2159ef0:	910183f7 	add	x23, sp, #0x60
 2159ef4:	9407677b 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2159ef8:	911702a1 	add	x1, x21, #0x5c0
 2159efc:	aa1603e0 	mov	x0, x22
 2159f00:	aa1703e8 	mov	x8, x23
 2159f04:	9406e73b 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2159f08:	9101a3f8 	add	x24, sp, #0x68
 2159f0c:	d0003381 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
