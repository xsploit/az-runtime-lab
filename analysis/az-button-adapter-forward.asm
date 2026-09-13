
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021eec60 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66b48>:
 21eec60:	d0001e83 	adrp	x3, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 21eec64:	912a7063 	add	x3, x3, #0xa9c
 21eec68:	91002024 	add	x4, x1, #0x8
 21eec6c:	eb03009f 	cmp	x4, x3
 21eec70:	54000323 	b.cc	21eecd4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66bbc>
 21eec74:	f240049f 	tst	x4, #0x3
 21eec78:	540002e1 	b.ne	21eecd4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66bbc>
 21eec7c:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 21eec80:	910003fd 	mov	x29, sp
 21eec84:	a90153f3 	stp	x19, x20, [sp,#16]
 21eec88:	aa0203f4 	mov	x20, x2
 21eec8c:	aa0103f3 	mov	x19, x1
 21eec90:	a9025bf5 	stp	x21, x22, [sp,#32]
 21eec94:	aa0003f5 	mov	x21, x0
 21eec98:	f000ce16 	adrp	x22, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 21eec9c:	913182d6 	add	x22, x22, #0xc60
 21eeca0:	a90363f7 	stp	x23, x24, [sp,#48]
 21eeca4:	b9400838 	ldr	w24, [x1,#8]
 21eeca8:	08dffec0 	ldarb	w0, [x22]
 21eecac:	f000ce17 	adrp	x23, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 21eecb0:	36000600 	tbz	w0, #0, 21eed70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66c58>
 21eecb4:	b94c6ae0 	ldr	w0, [x23,#3176]
 21eecb8:	6b00031f 	cmp	w24, w0
 21eecbc:	540000e0 	b.eq	21eecd8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66bc0>
 21eecc0:	a94153f3 	ldp	x19, x20, [sp,#16]
 21eecc4:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21eecc8:	a94363f7 	ldp	x23, x24, [sp,#48]
 21eeccc:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21eecd0:	d65f03c0 	ret
 21eecd4:	d65f03c0 	ret
 21eecd8:	f9400261 	ldr	x1, [x19]
 21eecdc:	b0000040 	adrp	x0, 21f7000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6eee8>
 21eece0:	910ac000 	add	x0, x0, #0x2b0
 21eece4:	f9400822 	ldr	x2, [x1,#16]
 21eece8:	eb00005f 	cmp	x2, x0
 21eecec:	54000541 	b.ne	21eed94 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66c7c>
 21eecf0:	39400280 	ldrb	w0, [x20]
 21eecf4:	7100001f 	cmp	w0, #0x0
 21eecf8:	1a9f07f3 	cset	w19, ne
 21eecfc:	394362a0 	ldrb	w0, [x21,#216]
 21eed00:	6b13001f 	cmp	w0, w19
 21eed04:	54fffde0 	b.eq	21eecc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66ba8>
 21eed08:	910282b7 	add	x23, x21, #0xa0
 21eed0c:	390362b3 	strb	w19, [x21,#216]
 21eed10:	f94052a0 	ldr	x0, [x21,#160]
 21eed14:	b94012f8 	ldr	w24, [x23,#16]
 21eed18:	b9400ae1 	ldr	w1, [x23,#8]
 21eed1c:	11000716 	add	w22, w24, #0x1
