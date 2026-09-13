
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021b99c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x318a8>:
 21b99c0:	d2820a10 	mov	x16, #0x1050                	// #4176
 21b99c4:	cb3063ff 	sub	sp, sp, x16
 21b99c8:	a9007bfd 	stp	x29, x30, [sp]
 21b99cc:	910003fd 	mov	x29, sp
 21b99d0:	a90153f3 	stp	x19, x20, [sp,#16]
 21b99d4:	2a0103f3 	mov	w19, w1
 21b99d8:	aa0003f4 	mov	x20, x0
 21b99dc:	9100e3e0 	add	x0, sp, #0x38
 21b99e0:	a9025bf5 	stp	x21, x22, [sp,#32]
 21b99e4:	aa0203f6 	mov	x22, x2
 21b99e8:	940556ca 	bl	230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1873f8>
 21b99ec:	d2820002 	mov	x2, #0x1000                	// #4096
 21b99f0:	52800001 	mov	w1, #0x0                   	// #0
 21b99f4:	910143e0 	add	x0, sp, #0x50
 21b99f8:	9789aafe 	bl	4245f0 <memset@plt>
 21b99fc:	2a1303e0 	mov	w0, w19
 21b9a00:	910143e1 	add	x1, sp, #0x50
 21b9a04:	d281ffe2 	mov	x2, #0xfff                 	// #4095
 21b9a08:	9789abca 	bl	424930 <read@plt>
 21b9a0c:	7100001f 	cmp	w0, #0x0
 21b9a10:	540007cd 	b.le	21b9b08 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x319f0>
 21b9a14:	910143e1 	add	x1, sp, #0x50
 21b9a18:	910103e0 	add	x0, sp, #0x40
 21b9a1c:	9405e8b1 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21b9a20:	910103e1 	add	x1, sp, #0x40
 21b9a24:	9100e3e0 	add	x0, sp, #0x38
 21b9a28:	9405591a 	bl	230fe90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187d78>
 21b9a2c:	910e0295 	add	x21, x20, #0x380
 21b9a30:	910103e0 	add	x0, sp, #0x40
 21b9a34:	94050af3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21b9a38:	aa1503e1 	mov	x1, x21
 21b9a3c:	910123e0 	add	x0, sp, #0x48
 21b9a40:	9405820c 	bl	231a270 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x192158>
 21b9a44:	910123e1 	add	x1, sp, #0x48
 21b9a48:	9100e3e0 	add	x0, sp, #0x38
 21b9a4c:	94057555 	bl	2316fa0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18ee88>
 21b9a50:	72001c1f 	tst	w0, #0xff
 21b9a54:	540003e0 	b.eq	21b9ad0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x319b8>
 21b9a58:	9100e3e1 	add	x1, sp, #0x38
 21b9a5c:	aa1603e0 	mov	x0, x22
