
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000220a9d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x828b8>:
 220a9d0:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 220a9d4:	910003fd 	mov	x29, sp
 220a9d8:	a90153f3 	stp	x19, x20, [sp,#16]
 220a9dc:	aa0103f4 	mov	x20, x1
 220a9e0:	aa0003f3 	mov	x19, x0
 220a9e4:	f9400041 	ldr	x1, [x2]
 220a9e8:	f900005f 	str	xzr, [x2]
 220a9ec:	f9401400 	ldr	x0, [x0,#40]
 220a9f0:	f9001661 	str	x1, [x19,#40]
 220a9f4:	b40000a0 	cbz	x0, 220aa08 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x828f0>
 220a9f8:	f9400001 	ldr	x1, [x0]
 220a9fc:	f9400421 	ldr	x1, [x1,#8]
 220aa00:	d63f0020 	blr	x1
 220aa04:	f9401661 	ldr	x1, [x19,#40]
 220aa08:	aa1303e0 	mov	x0, x19
 220aa0c:	97961d19 	bl	791e70 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x990c8>
 220aa10:	f9001a74 	str	x20, [x19,#48]
 220aa14:	a94153f3 	ldp	x19, x20, [sp,#16]
 220aa18:	a8c27bfd 	ldp	x29, x30, [sp],#32
 220aa1c:	d65f03c0 	ret
 220aa20:	a9b67bfd 	stp	x29, x30, [sp,#-160]!
 220aa24:	910003fd 	mov	x29, sp
 220aa28:	a90153f3 	stp	x19, x20, [sp,#16]
 220aa2c:	aa0003f3 	mov	x19, x0
 220aa30:	aa0103f4 	mov	x20, x1
 220aa34:	940059bb 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 220aa38:	72001c1f 	tst	w0, #0xff
 220aa3c:	540000c1 	b.ne	220aa54 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8293c>
