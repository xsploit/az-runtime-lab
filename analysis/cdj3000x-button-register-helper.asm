
runtime-lab/cdj3000x/rootfs/home/root/pdj/EP145:     file format elf64-littleaarch64


Disassembly of section .text:

000000000225cb18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x929748>:
 225cb18:	a9b57bfd 	stp	x29, x30, [sp,#-176]!
 225cb1c:	910003fd 	mov	x29, sp
 225cb20:	a9046bf9 	stp	x25, x26, [sp,#64]
 225cb24:	aa0103f9 	mov	x25, x1
 225cb28:	f9400021 	ldr	x1, [x1]
 225cb2c:	a90153f3 	stp	x19, x20, [sp,#16]
 225cb30:	aa0203f3 	mov	x19, x2
 225cb34:	a9025bf5 	stp	x21, x22, [sp,#32]
 225cb38:	aa0003f5 	mov	x21, x0
 225cb3c:	d2801c00 	mov	x0, #0xe0                  	// #224
 225cb40:	f9003be1 	str	x1, [sp,#112]
 225cb44:	978722cb 	bl	425670 <_Znwm@plt>
 225cb48:	f9403be1 	ldr	x1, [sp,#112]
 225cb4c:	aa0003f4 	mov	x20, x0
 225cb50:	9402ddb0 	bl	2314210 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69f40>
 225cb54:	f94002a0 	ldr	x0, [x21]
 225cb58:	a90363f7 	stp	x23, x24, [sp,#48]
 225cb5c:	a90573fb 	stp	x27, x28, [sp,#80]
 225cb60:	f90002b4 	str	x20, [x21]
 225cb64:	b4001d40 	cbz	x0, 225cf0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x929b3c>
 225cb68:	f9400001 	ldr	x1, [x0]
 225cb6c:	f9400421 	ldr	x1, [x1,#8]
 225cb70:	d63f0020 	blr	x1
 225cb74:	f9400261 	ldr	x1, [x19]
 225cb78:	f94002b4 	ldr	x20, [x21]
 225cb7c:	b4000121 	cbz	x1, 225cba0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9297d0>
 225cb80:	f900027f 	str	xzr, [x19]
 225cb84:	f9405e80 	ldr	x0, [x20,#184]
 225cb88:	f9005e81 	str	x1, [x20,#184]
 225cb8c:	b40000c0 	cbz	x0, 225cba4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9297d4>
 225cb90:	f9400001 	ldr	x1, [x0]
 225cb94:	f9400421 	ldr	x1, [x1,#8]
 225cb98:	d63f0020 	blr	x1
 225cb9c:	f94002b4 	ldr	x20, [x21]
 225cba0:	b4000054 	cbz	x20, 225cba8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9297d8>
 225cba4:	91030294 	add	x20, x20, #0xc0
 225cba8:	9000edb3 	adrp	x19, 4010000 <stdout@@GLIBC_2.17+0x18430>
 225cbac:	91346273 	add	x19, x19, #0xd18
 225cbb0:	08dffe60 	ldarb	w0, [x19]
 225cbb4:	36001420 	tbz	w0, #0, 225ce38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x929a68>
 225cbb8:	9000edb5 	adrp	x21, 4010000 <stdout@@GLIBC_2.17+0x18430>
 225cbbc:	913482b5 	add	x21, x21, #0xd20
