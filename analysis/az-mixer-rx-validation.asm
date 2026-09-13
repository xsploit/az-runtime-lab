
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002159a08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959b80>:
 2159a08:	d109c3ff 	sub	sp, sp, #0x270
 2159a0c:	12001c22 	and	w2, w1, #0xff
 2159a10:	a9007bfd 	stp	x29, x30, [sp]
 2159a14:	910003fd 	mov	x29, sp
 2159a18:	b9400801 	ldr	w1, [x0,#8]
 2159a1c:	a90153f3 	stp	x19, x20, [sp,#16]
 2159a20:	7102003f 	cmp	w1, #0x80
 2159a24:	540007c0 	b.eq	2159b1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959c94>
 2159a28:	d000cee0 	adrp	x0, 3b37000 <_ZTISt11range_error@@GLIBCXX_3.4+0x12440>
 2159a2c:	d2800013 	mov	x19, #0x0                   	// #0
 2159a30:	39785c01 	ldrb	w1, [x0,#3607]
 2159a34:	350000c1 	cbnz	w1, 2159a4c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959bc4>
 2159a38:	aa1303e0 	mov	x0, x19
 2159a3c:	a9407bfd 	ldp	x29, x30, [sp]
 2159a40:	a94153f3 	ldp	x19, x20, [sp,#16]
 2159a44:	9109c3ff 	add	sp, sp, #0x270
 2159a48:	d65f03c0 	ret
 2159a4c:	a9025bf5 	stp	x21, x22, [sp,#32]
 2159a50:	910143f5 	add	x21, sp, #0x50
 2159a54:	90002341 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 2159a58:	39385c1f 	strb	wzr, [x0,#3607]
 2159a5c:	9136a021 	add	x1, x1, #0xda8
 2159a60:	aa1503e0 	mov	x0, x21
 2159a64:	9407689f 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2159a68:	910163f6 	add	x22, sp, #0x58
 2159a6c:	90006781 	adrp	x1, 2e49000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8861a8>
 2159a70:	91138021 	add	x1, x1, #0x4e0
 2159a74:	aa1503e0 	mov	x0, x21
 2159a78:	910ea021 	add	x1, x1, #0x3a8
 2159a7c:	aa1603e8 	mov	x8, x22
 2159a80:	9406e85c 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2159a84:	a90363f7 	stp	x23, x24, [sp,#48]
 2159a88:	910183f7 	add	x23, sp, #0x60
 2159a8c:	d0003381 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 2159a90:	aa1703e8 	mov	x8, x23
 2159a94:	91366021 	add	x1, x1, #0xd98
 2159a98:	aa1603e0 	mov	x0, x22
 2159a9c:	9406e855 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2159aa0:	9101a3f8 	add	x24, sp, #0x68
 2159aa4:	f0006741 	adrp	x1, 2e44000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8811a8>
 2159aa8:	aa1803e0 	mov	x0, x24
 2159aac:	9119c021 	add	x1, x1, #0x670
 2159ab0:	9407688c 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2159ab4:	9101c3f4 	add	x20, sp, #0x70
 2159ab8:	aa1803e1 	mov	x1, x24
 2159abc:	aa1403e8 	mov	x8, x20
 2159ac0:	aa1703e0 	mov	x0, x23
 2159ac4:	9406e7f3 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 2159ac8:	52800022 	mov	w2, #0x1                   	// #1
 2159acc:	52800001 	mov	w1, #0x0                   	// #0
 2159ad0:	aa1403e0 	mov	x0, x20
 2159ad4:	94029a43 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 2159ad8:	aa1403e0 	mov	x0, x20
 2159adc:	94068ac9 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159ae0:	aa1803e0 	mov	x0, x24
 2159ae4:	94068ac7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159ae8:	aa1703e0 	mov	x0, x23
 2159aec:	94068ac5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159af0:	aa1603e0 	mov	x0, x22
 2159af4:	94068ac3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159af8:	aa1503e0 	mov	x0, x21
 2159afc:	94068ac1 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2159b00:	aa1303e0 	mov	x0, x19
 2159b04:	a9407bfd 	ldp	x29, x30, [sp]
 2159b08:	a94153f3 	ldp	x19, x20, [sp,#16]
 2159b0c:	a9425bf5 	ldp	x21, x22, [sp,#32]
