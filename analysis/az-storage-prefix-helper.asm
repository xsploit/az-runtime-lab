
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002316fa0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18ee88>:
 2316fa0:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 2316fa4:	d2800004 	mov	x4, #0x0                   	// #0
 2316fa8:	910003fd 	mov	x29, sp
 2316fac:	f9400025 	ldr	x5, [x1]
 2316fb0:	a90153f3 	stp	x19, x20, [sp,#16]
 2316fb4:	aa0503e2 	mov	x2, x5
 2316fb8:	394000a1 	ldrb	w1, [x5]
 2316fbc:	91000443 	add	x3, x2, #0x1
 2316fc0:	37380101 	tbnz	w1, #7, 2316fe0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18eec8>
 2316fc4:	d503201f 	nop
 2316fc8:	34000241 	cbz	w1, 2317010 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18eef8>
 2316fcc:	39400441 	ldrb	w1, [x2,#1]
 2316fd0:	aa0303e2 	mov	x2, x3
 2316fd4:	91000484 	add	x4, x4, #0x1
 2316fd8:	91000443 	add	x3, x2, #0x1
 2316fdc:	363fff61 	tbz	w1, #7, 2316fc8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18eeb0>
 2316fe0:	39400441 	ldrb	w1, [x2,#1]
 2316fe4:	121a0422 	and	w2, w1, #0xc0
 2316fe8:	7102005f 	cmp	w2, #0x80
 2316fec:	aa0303e2 	mov	x2, x3
 2316ff0:	54ffff21 	b.ne	2316fd4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18eebc>
 2316ff4:	d503201f 	nop
 2316ff8:	38401c41 	ldrb	w1, [x2,#1]!
 2316ffc:	121a0423 	and	w3, w1, #0xc0
