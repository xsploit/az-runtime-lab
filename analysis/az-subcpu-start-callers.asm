
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002100b60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900cd8>:
 2100b60:	aa1503e2 	mov	x2, x21
 2100b64:	9400dc3d 	bl	2137c58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937dd0>
 2100b68:	f94002c2 	ldr	x2, [x22]
 2100b6c:	aa1503e1 	mov	x1, x21
 2100b70:	aa1603e0 	mov	x0, x22
 2100b74:	f9401042 	ldr	x2, [x2,#32]
 2100b78:	d63f0040 	blr	x2
 2100b7c:	f9400341 	ldr	x1, [x26]
 2100b80:	d2800f00 	mov	x0, #0x78                  	// #120
 2100b84:	f8737835 	ldr	x21, [x1,x19,lsl #3]
 2100b88:	a907f3f4 	stp	x20, x28, [sp,#120]
 2100b8c:	978c906d 	bl	424d40 <_Znwm@plt>
 2100b90:	9e660122 	fmov	x2, d9
 2100b94:	aa0003f4 	mov	x20, x0
 2100b98:	9101e3e5 	add	x5, sp, #0x78
 2100b9c:	910203e4 	add	x4, sp, #0x80
 2100ba0:	aa1503e3 	mov	x3, x21
 2100ba4:	910223e1 	add	x1, sp, #0x88
 2100ba8:	940312ae 	bl	21c5660 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3d548>
 2100bac:	f9403fe0 	ldr	x0, [sp,#120]
 2100bb0:	b4000080 	cbz	x0, 2100bc0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900d38>
 2100bb4:	f9400001 	ldr	x1, [x0]
 2100bb8:	f9400421 	ldr	x1, [x1,#8]
 2100bbc:	d63f0020 	blr	x1
 2100bc0:	f94043e0 	ldr	x0, [sp,#128]
 2100bc4:	b4000080 	cbz	x0, 2100bd4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900d4c>
 2100bc8:	f9400001 	ldr	x1, [x0]
 2100bcc:	f9400421 	ldr	x1, [x1,#8]
 2100bd0:	d63f0020 	blr	x1
 2100bd4:	91008335 	add	x21, x25, #0x20
 2100bd8:	f8737aa0 	ldr	x0, [x21,x19,lsl #3]
 2100bdc:	f8337ab4 	str	x20, [x21,x19,lsl #3]
 2100be0:	b40000a0 	cbz	x0, 2100bf4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900d6c>
 2100be4:	f9400001 	ldr	x1, [x0]
 2100be8:	f9400421 	ldr	x1, [x1,#8]
 2100bec:	d63f0020 	blr	x1
 2100bf0:	f8737ab4 	ldr	x20, [x21,x19,lsl #3]
 2100bf4:	aa1403e0 	mov	x0, x20
 2100bf8:	9403127a 	bl	21c55e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3d4c8>
 2100bfc:	910223e0 	add	x0, sp, #0x88
 2100c00:	9407ee80 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2100c04:	b4000133 	cbz	x19, 2100c28 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900da0>
 2100c08:	a94153f3 	ldp	x19, x20, [sp,#16]
 2100c0c:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2100c10:	a94363f7 	ldp	x23, x24, [sp,#48]
 2100c14:	a9446bf9 	ldp	x25, x26, [sp,#64]
 2100c18:	a94573fb 	ldp	x27, x28, [sp,#80]
 2100c1c:	6d4627e8 	ldp	d8, d9, [sp,#96]
 2100c20:	a8ca7bfd 	ldp	x29, x30, [sp],#160
 2100c24:	d65f03c0 	ret
 2100c28:	d2800033 	mov	x19, #0x1                   	// #1
 2100c2c:	1e270268 	fmov	s8, w19
 2100c30:	910223e0 	add	x0, sp, #0x88
 2100c34:	94083a37 	bl	230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1873f8>
 2100c38:	b5fff653 	cbnz	x19, 2100b00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900c78>
 2100c3c:	aa1803e1 	mov	x1, x24
 2100c40:	9101e3e0 	add	x0, sp, #0x78
 2100c44:	9408cc27 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2100c48:	17ffffb1 	b	2100b0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900c84>
 2100c4c:	aa0003f3 	mov	x19, x0
 2100c50:	910223e0 	add	x0, sp, #0x88
 2100c54:	9407ee6b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2100c58:	aa1303e0 	mov	x0, x19
 2100c5c:	978c902d 	bl	424d10 <_Unwind_Resume@plt>
 2100c60:	aa0003f3 	mov	x19, x0
 2100c64:	d2800014 	mov	x20, #0x0                   	// #0
 2100c68:	b4ffff54 	cbz	x20, 2100c50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900dc8>
 2100c6c:	f9400281 	ldr	x1, [x20]
 2100c70:	aa1403e0 	mov	x0, x20
 2100c74:	f9400421 	ldr	x1, [x1,#8]
 2100c78:	d63f0020 	blr	x1
 2100c7c:	17fffff5 	b	2100c50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900dc8>
 2100c80:	aa0003f3 	mov	x19, x0
 2100c84:	d2800f01 	mov	x1, #0x78                  	// #120
 2100c88:	aa1403e0 	mov	x0, x20
 2100c8c:	978c9675 	bl	426660 <_ZdlPvm@plt>
 2100c90:	f9403fe0 	ldr	x0, [sp,#120]
 2100c94:	b4000080 	cbz	x0, 2100ca4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900e1c>
 2100c98:	f9400001 	ldr	x1, [x0]
 2100c9c:	f9400421 	ldr	x1, [x1,#8]
 2100ca0:	d63f0020 	blr	x1
 2100ca4:	f94043e0 	ldr	x0, [sp,#128]
 2100ca8:	b4fffde0 	cbz	x0, 2100c64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900ddc>
 2100cac:	f9400001 	ldr	x1, [x0]
 2100cb0:	d2800014 	mov	x20, #0x0                   	// #0
 2100cb4:	f9400421 	ldr	x1, [x1,#8]
 2100cb8:	d63f0020 	blr	x1
 2100cbc:	17ffffeb 	b	2100c68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900de0>
 2100cc0:	aa0003f3 	mov	x19, x0
 2100cc4:	17fffff3 	b	2100c90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900e08>
 2100cc8:	f9400381 	ldr	x1, [x28]
 2100ccc:	aa0003f3 	mov	x19, x0
 2100cd0:	aa1c03e0 	mov	x0, x28
 2100cd4:	f9400421 	ldr	x1, [x1,#8]
 2100cd8:	d63f0020 	blr	x1
 2100cdc:	b4fffbb4 	cbz	x20, 2100c50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900dc8>
 2100ce0:	17ffffe3 	b	2100c6c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900de4>
 2100ce4:	aa0003f3 	mov	x19, x0
 2100ce8:	d2801201 	mov	x1, #0x90                  	// #144
 2100cec:	aa1c03e0 	mov	x0, x28
 2100cf0:	978c965c 	bl	426660 <_ZdlPvm@plt>
 2100cf4:	17ffffde 	b	2100c6c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900de4>
 2100cf8:	aa0003f3 	mov	x19, x0
 2100cfc:	17ffffdc 	b	2100c6c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900de4>
 2100d00:	aa0003f3 	mov	x19, x0
 2100d04:	d2802201 	mov	x1, #0x110                 	// #272
 2100d08:	aa1403e0 	mov	x0, x20
 2100d0c:	978c9655 	bl	426660 <_ZdlPvm@plt>
 2100d10:	17ffffd0 	b	2100c50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900dc8>
 2100d14:	d503201f 	nop
 2100d18:	a9b97bfd 	stp	x29, x30, [sp,#-112]!
 2100d1c:	910003fd 	mov	x29, sp
 2100d20:	a90153f3 	stp	x19, x20, [sp,#16]
 2100d24:	aa0003f4 	mov	x20, x0
 2100d28:	12001c73 	and	w19, w3, #0xff
 2100d2c:	910163e0 	add	x0, sp, #0x58
 2100d30:	a90363f7 	stp	x23, x24, [sp,#48]
 2100d34:	aa0103f8 	mov	x24, x1
 2100d38:	aa0203f7 	mov	x23, x2
 2100d3c:	940839f5 	bl	230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1873f8>
 2100d40:	f0006981 	adrp	x1, 2e33000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8701a8>
 2100d44:	910143e0 	add	x0, sp, #0x50
 2100d48:	912a8021 	add	x1, x1, #0xaa0
 2100d4c:	9408cbe5 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2100d50:	910143e1 	add	x1, sp, #0x50
 2100d54:	910163e0 	add	x0, sp, #0x58
 2100d58:	94083c4e 	bl	230fe90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187d78>
 2100d5c:	910143e0 	add	x0, sp, #0x50
 2100d60:	9407ee28 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2100d64:	f0006980 	adrp	x0, 2e33000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8701a8>
 2100d68:	52801001 	mov	w1, #0x80                  	// #128
 2100d6c:	b9006be1 	str	w1, [sp,#104]
 2100d70:	fd451c00 	ldr	d0, [x0,#2616]
 2100d74:	d2805000 	mov	x0, #0x280                 	// #640
 2100d78:	fd0033e0 	str	d0, [sp,#96]
 2100d7c:	978c8ff1 	bl	424d40 <_Znwm@plt>
 2100d80:	2a1303e1 	mov	w1, w19
 2100d84:	a9025bf5 	stp	x21, x22, [sp,#32]
 2100d88:	aa0003f5 	mov	x21, x0
 2100d8c:	94012325 	bl	2149a20 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x949b98>
 2100d90:	d2805f00 	mov	x0, #0x2f8                 	// #760
 2100d94:	f9401ab3 	ldr	x19, [x21,#48]
 2100d98:	978c8fea 	bl	424d40 <_Znwm@plt>
 2100d9c:	aa0003f6 	mov	x22, x0
 2100da0:	94010630 	bl	2142660 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9427d8>
 2100da4:	d2800f00 	mov	x0, #0x78                  	// #120
 2100da8:	a904d7f6 	stp	x22, x21, [sp,#72]
 2100dac:	978c8fe5 	bl	424d40 <_Znwm@plt>
 2100db0:	aa0003f5 	mov	x21, x0
 2100db4:	910143e5 	add	x5, sp, #0x50
 2100db8:	aa1803e3 	mov	x3, x24
 2100dbc:	aa1703e2 	mov	x2, x23
 2100dc0:	910123e4 	add	x4, sp, #0x48
 2100dc4:	910163e1 	add	x1, sp, #0x58
 2100dc8:	94031226 	bl	21c5660 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3d548>
 2100dcc:	f9401a80 	ldr	x0, [x20,#48]
 2100dd0:	f9001a95 	str	x21, [x20,#48]
 2100dd4:	b4000080 	cbz	x0, 2100de4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900f5c>
 2100dd8:	f9400001 	ldr	x1, [x0]
 2100ddc:	f9400421 	ldr	x1, [x1,#8]
 2100de0:	d63f0020 	blr	x1
 2100de4:	f9402be0 	ldr	x0, [sp,#80]
 2100de8:	b4000080 	cbz	x0, 2100df8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900f70>
 2100dec:	f9400001 	ldr	x1, [x0]
 2100df0:	f9400421 	ldr	x1, [x1,#8]
 2100df4:	d63f0020 	blr	x1
 2100df8:	f94027e0 	ldr	x0, [sp,#72]
 2100dfc:	b4000080 	cbz	x0, 2100e0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x900f84>
 2100e00:	f9400001 	ldr	x1, [x0]
 2100e04:	f9400421 	ldr	x1, [x1,#8]
 2100e08:	d63f0020 	blr	x1
 2100e0c:	f9401a80 	ldr	x0, [x20,#48]
 2100e10:	940311f4 	bl	21c55e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3d4c8>
 2100e14:	910163e0 	add	x0, sp, #0x58
 2100e18:	9407edfa 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2100e1c:	9104a260 	add	x0, x19, #0x128
 2100e20:	a94153f3 	ldp	x19, x20, [sp,#16]
 2100e24:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2100e28:	a94363f7 	ldp	x23, x24, [sp,#48]
 2100e2c:	a8c77bfd 	ldp	x29, x30, [sp],#112
