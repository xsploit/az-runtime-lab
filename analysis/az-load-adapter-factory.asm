
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002144c18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944d90>:
 2144c18:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 2144c1c:	910003fd 	mov	x29, sp
 2144c20:	a9025bf5 	stp	x21, x22, [sp,#32]
 2144c24:	aa0103f5 	mov	x21, x1
 2144c28:	aa0203f6 	mov	x22, x2
 2144c2c:	f9400021 	ldr	x1, [x1]
 2144c30:	a90153f3 	stp	x19, x20, [sp,#16]
 2144c34:	aa0003f4 	mov	x20, x0
 2144c38:	d2801c00 	mov	x0, #0xe0                  	// #224
 2144c3c:	f9001fe1 	str	x1, [sp,#56]
 2144c40:	978b8040 	bl	424d40 <_Znwm@plt>
 2144c44:	aa0003f3 	mov	x19, x0
 2144c48:	f9401fe1 	ldr	x1, [sp,#56]
 2144c4c:	9402bb29 	bl	21f38f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6b7d8>
 2144c50:	f9400280 	ldr	x0, [x20]
 2144c54:	f9000293 	str	x19, [x20]
 2144c58:	b40002e0 	cbz	x0, 2144cb4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944e2c>
 2144c5c:	f9400001 	ldr	x1, [x0]
 2144c60:	f9400421 	ldr	x1, [x1,#8]
 2144c64:	d63f0020 	blr	x1
 2144c68:	f94002c1 	ldr	x1, [x22]
 2144c6c:	f9400293 	ldr	x19, [x20]
 2144c70:	b4000121 	cbz	x1, 2144c94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944e0c>
 2144c74:	f90002df 	str	xzr, [x22]
 2144c78:	f9405e60 	ldr	x0, [x19,#184]
 2144c7c:	f9005e61 	str	x1, [x19,#184]
 2144c80:	b40000c0 	cbz	x0, 2144c98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944e10>
 2144c84:	f9400001 	ldr	x1, [x0]
 2144c88:	f9400421 	ldr	x1, [x1,#8]
 2144c8c:	d63f0020 	blr	x1
 2144c90:	f9400293 	ldr	x19, [x20]
 2144c94:	b4000053 	cbz	x19, 2144c9c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944e14>
 2144c98:	91030273 	add	x19, x19, #0xc0
 2144c9c:	aa1303e1 	mov	x1, x19
 2144ca0:	aa1503e0 	mov	x0, x21
 2144ca4:	a94153f3 	ldp	x19, x20, [sp,#16]
 2144ca8:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2144cac:	a8c47bfd 	ldp	x29, x30, [sp],#64
 2144cb0:	17fffe38 	b	2144590 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944708>
 2144cb4:	f94002c1 	ldr	x1, [x22]
 2144cb8:	b4ffff01 	cbz	x1, 2144c98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944e10>
 2144cbc:	f90002df 	str	xzr, [x22]
 2144cc0:	f9405e60 	ldr	x0, [x19,#184]
 2144cc4:	f9005e61 	str	x1, [x19,#184]
 2144cc8:	b5fffde0 	cbnz	x0, 2144c84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944dfc>
 2144ccc:	17fffff3 	b	2144c98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944e10>
 2144cd0:	d2801c01 	mov	x1, #0xe0                  	// #224
 2144cd4:	aa0003f4 	mov	x20, x0
 2144cd8:	aa1303e0 	mov	x0, x19
 2144cdc:	978b8661 	bl	426660 <_ZdlPvm@plt>
 2144ce0:	aa1403e0 	mov	x0, x20
 2144ce4:	978b800b 	bl	424d10 <_Unwind_Resume@plt>
 2144ce8:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 2144cec:	910003fd 	mov	x29, sp
 2144cf0:	a90153f3 	stp	x19, x20, [sp,#16]
 2144cf4:	aa0103f4 	mov	x20, x1
 2144cf8:	aa0003f3 	mov	x19, x0
 2144cfc:	d2800300 	mov	x0, #0x18                  	// #24
 2144d00:	a9025bf5 	stp	x21, x22, [sp,#32]
 2144d04:	2a0203f6 	mov	w22, w2
 2144d08:	978b800e 	bl	424d40 <_Znwm@plt>
 2144d0c:	aa0003f5 	mov	x21, x0
 2144d10:	1e2e1000 	fmov	s0, #1.000000000000000000e+00
 2144d14:	510006c1 	sub	w1, w22, #0x1
 2144d18:	9402ad3e 	bl	21f0210 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x680f8>
 2144d1c:	d2801d00 	mov	x0, #0xe8                  	// #232
 2144d20:	f9001ff5 	str	x21, [sp,#56]
 2144d24:	978b8007 	bl	424d40 <_Znwm@plt>
 2144d28:	aa0003f5 	mov	x21, x0
 2144d2c:	9100e3e2 	add	x2, sp, #0x38
