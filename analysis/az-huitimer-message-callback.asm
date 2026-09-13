
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021fc620 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74508>:
 21fc620:	d000cec0 	adrp	x0, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21fc624:	f946d800 	ldr	x0, [x0,#3504]
 21fc628:	b4000040 	cbz	x0, 21fc630 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74518>
 21fc62c:	17ffe8fd 	b	21f6a20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e908>
 21fc630:	d65f03c0 	ret
	...
 21fc640:	b4000200 	cbz	x0, 21fc680 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74568>
 21fc644:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 21fc648:	910003fd 	mov	x29, sp
 21fc64c:	f9000bf3 	str	x19, [sp,#16]
 21fc650:	aa0003f3 	mov	x19, x0
 21fc654:	f9400800 	ldr	x0, [x0,#16]
 21fc658:	b4000080 	cbz	x0, 21fc668 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74550>
 21fc65c:	f9400001 	ldr	x1, [x0]
 21fc660:	f9400421 	ldr	x1, [x1,#8]
 21fc664:	d63f0020 	blr	x1
 21fc668:	b900027f 	str	wzr, [x19]
 21fc66c:	aa1303e0 	mov	x0, x19
 21fc670:	f9400bf3 	ldr	x19, [sp,#16]
 21fc674:	d2800401 	mov	x1, #0x20                  	// #32
 21fc678:	a8c27bfd 	ldp	x29, x30, [sp],#32
 21fc67c:	1788a7f9 	b	426660 <_ZdlPvm@plt>
 21fc680:	d65f03c0 	ret
	...
 21fc690:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
 21fc694:	910003fd 	mov	x29, sp
 21fc698:	a90153f3 	stp	x19, x20, [sp,#16]
 21fc69c:	aa0003f4 	mov	x20, x0
 21fc6a0:	a9025bf5 	stp	x21, x22, [sp,#32]
 21fc6a4:	aa0103f6 	mov	x22, x1
 21fc6a8:	9400929e 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 21fc6ac:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 21fc6b0:	f0001ea1 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 21fc6b4:	9118e021 	add	x1, x1, #0x638
 21fc6b8:	f9002fe1 	str	x1, [sp,#88]
 21fc6bc:	fd0033e0 	str	d0, [sp,#96]
 21fc6c0:	72001c1f 	tst	w0, #0xff
 21fc6c4:	2f00e400 	movi	d0, #0x0
 21fc6c8:	54000080 	b.eq	21fc6d8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x745c0>
 21fc6cc:	f000cec0 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 21fc6d0:	394de000 	ldrb	w0, [x0,#888]
 21fc6d4:	34000720 	cbz	w0, 21fc7b8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x746a0>
 21fc6d8:	f9400683 	ldr	x3, [x20,#8]
 21fc6dc:	f90043ff 	str	xzr, [sp,#128]
 21fc6e0:	d2800102 	mov	x2, #0x8                   	// #8
 21fc6e4:	d2800601 	mov	x1, #0x30                  	// #48
 21fc6e8:	aa0303e0 	mov	x0, x3
 21fc6ec:	fd0037e0 	str	d0, [sp,#104]
 21fc6f0:	f9400063 	ldr	x3, [x3]
 21fc6f4:	f9400863 	ldr	x3, [x3,#16]
 21fc6f8:	d63f0060 	blr	x3
 21fc6fc:	aa0003f3 	mov	x19, x0
 21fc700:	b4000600 	cbz	x0, 21fc7c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x746a8>
 21fc704:	91008280 	add	x0, x20, #0x20
 21fc708:	c85ffc14 	ldaxr	x20, [x0]
 21fc70c:	91000694 	add	x20, x20, #0x1
