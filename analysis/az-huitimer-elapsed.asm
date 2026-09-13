
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f0960 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68848>:
 21f0960:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 21f0964:	910003fd 	mov	x29, sp
 21f0968:	f9000bf3 	str	x19, [sp,#16]
 21f096c:	aa0003f3 	mov	x19, x0
 21f0970:	9404b7b8 	bl	231e850 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x196738>
 21f0974:	b9401661 	ldr	w1, [x19,#20]
 21f0978:	34000221 	cbz	w1, 21f09bc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x688a4>
 21f097c:	b9401661 	ldr	w1, [x19,#20]
 21f0980:	6b00003f 	cmp	w1, w0
 21f0984:	540001e0 	b.eq	21f09c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x688a8>
 21f0988:	b9401661 	ldr	w1, [x19,#20]
 21f098c:	b9401663 	ldr	w3, [x19,#20]
 21f0990:	6b00003f 	cmp	w1, w0
 21f0994:	540001c9 	b.ls	21f09cc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x688b4>
 21f0998:	4b000063 	sub	w3, w3, w0
 21f099c:	2a2303e3 	mvn	w3, w3
 21f09a0:	f9400661 	ldr	x1, [x19,#8]
 21f09a4:	b40000c1 	cbz	x1, 21f09bc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x688a4>
 21f09a8:	b9400822 	ldr	w2, [x1,#8]
 21f09ac:	4b030042 	sub	w2, w2, w3
 21f09b0:	b9000822 	str	w2, [x1,#8]
 21f09b4:	f9400c21 	ldr	x1, [x1,#24]
 21f09b8:	b5ffff81 	cbnz	x1, 21f09a8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68890>
 21f09bc:	b9001660 	str	w0, [x19,#20]
 21f09c0:	f9400bf3 	ldr	x19, [sp,#16]
 21f09c4:	a8c27bfd 	ldp	x29, x30, [sp],#32
 21f09c8:	d65f03c0 	ret
 21f09cc:	4b030003 	sub	w3, w0, w3
 21f09d0:	17fffff4 	b	21f09a0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68888>
 21f09d4:	d503201f 	nop
 21f09d8:	d503201f 	nop
 21f09dc:	d503201f 	nop
