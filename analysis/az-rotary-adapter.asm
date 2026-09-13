
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021eedd0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66cb8>:
 21eedd0:	d0001e83 	adrp	x3, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 21eedd4:	912a7063 	add	x3, x3, #0xa9c
 21eedd8:	91002024 	add	x4, x1, #0x8
 21eeddc:	eb03009f 	cmp	x4, x3
 21eede0:	54000323 	b.cc	21eee44 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66d2c>
 21eede4:	f240049f 	tst	x4, #0x3
 21eede8:	540002e1 	b.ne	21eee44 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66d2c>
 21eedec:	a9ba7bfd 	stp	x29, x30, [sp,#-96]!
 21eedf0:	910003fd 	mov	x29, sp
 21eedf4:	a90153f3 	stp	x19, x20, [sp,#16]
 21eedf8:	aa0203f4 	mov	x20, x2
 21eedfc:	aa0103f3 	mov	x19, x1
 21eee00:	a9025bf5 	stp	x21, x22, [sp,#32]
 21eee04:	aa0003f5 	mov	x21, x0
 21eee08:	9000cf56 	adrp	x22, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21eee0c:	9134e2d6 	add	x22, x22, #0xd38
 21eee10:	a90363f7 	stp	x23, x24, [sp,#48]
 21eee14:	b9400838 	ldr	w24, [x1,#8]
 21eee18:	08dffec0 	ldarb	w0, [x22]
 21eee1c:	9000cf57 	adrp	x23, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21eee20:	36000800 	tbz	w0, #0, 21eef20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66e08>
 21eee24:	b94d42e0 	ldr	w0, [x23,#3392]
 21eee28:	6b00031f 	cmp	w24, w0
 21eee2c:	540000e0 	b.eq	21eee48 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66d30>
 21eee30:	a94153f3 	ldp	x19, x20, [sp,#16]
 21eee34:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21eee38:	a94363f7 	ldp	x23, x24, [sp,#48]
 21eee3c:	a8c67bfd 	ldp	x29, x30, [sp],#96
 21eee40:	d65f03c0 	ret
 21eee44:	d65f03c0 	ret
 21eee48:	f9400261 	ldr	x1, [x19]
 21eee4c:	b0000040 	adrp	x0, 21f7000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6eee8>
 21eee50:	910c4000 	add	x0, x0, #0x310
 21eee54:	f9400822 	ldr	x2, [x1,#16]
 21eee58:	eb00005f 	cmp	x2, x0
 21eee5c:	54000741 	b.ne	21eef44 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66e2c>
 21eee60:	39401280 	ldrb	w0, [x20,#4]
 21eee64:	b9400294 	ldr	w20, [x20]
 21eee68:	2a0003f6 	mov	w22, w0
 21eee6c:	394372b3 	ldrb	w19, [x21,#220]
 21eee70:	7100029f 	cmp	w20, #0x0
 21eee74:	4a000273 	eor	w19, w19, w0
 21eee78:	7a400a60 	ccmp	w19, #0x0, #0x0, eq
 21eee7c:	54fffda0 	b.eq	21eee30 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66d18>
 21eee80:	a9046bf9 	stp	x25, x26, [sp,#64]
 21eee84:	f9002bfb 	str	x27, [sp,#80]
 21eee88:	910282bb 	add	x27, x21, #0xa0
 21eee8c:	390372a0 	strb	w0, [x21,#220]
 21eee90:	b940dab8 	ldr	w24, [x21,#216]
 21eee94:	f94052a0 	ldr	x0, [x21,#160]
 21eee98:	0b180298 	add	w24, w20, w24
 21eee9c:	b900dab8 	str	w24, [x21,#216]
 21eeea0:	b9401377 	ldr	w23, [x27,#16]
 21eeea4:	b9400b61 	ldr	w1, [x27,#8]
 21eeea8:	110006fa 	add	w26, w23, #0x1
 21eeeac:	6b01035f 	cmp	w26, w1
 21eeeb0:	5400022d 	b.le	21eeef4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66ddc>
 21eeeb4:	0b5a7f59 	add	w25, w26, w26, lsr #31
 21eeeb8:	0b990759 	add	w25, w26, w25, asr #1
 21eeebc:	11002339 	add	w25, w25, #0x8
 21eeec0:	121d7339 	and	w25, w25, #0xfffffff8
 21eeec4:	6b19003f 	cmp	w1, w25
 21eeec8:	54000160 	b.eq	21eeef4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66ddc>
 21eeecc:	7100033f 	cmp	w25, #0x0
 21eeed0:	5400048d 	b.le	21eef60 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66e48>
 21eeed4:	52800181 	mov	w1, #0xc                   	// #12
 21eeed8:	9b217f21 	smull	x1, w25, w1
 21eeedc:	b40004e0 	cbz	x0, 21eef78 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66e60>
 21eeee0:	9788d570 	bl	4244a0 <realloc@plt>
 21eeee4:	b9401377 	ldr	w23, [x27,#16]
 21eeee8:	f90052a0 	str	x0, [x21,#160]
 21eeeec:	110006fa 	add	w26, w23, #0x1
 21eeef0:	b9000b79 	str	w25, [x27,#8]
 21eeef4:	52800181 	mov	w1, #0xc                   	// #12
 21eeef8:	b900137a 	str	w26, [x27,#16]
 21eeefc:	a9446bf9 	ldp	x25, x26, [sp,#64]
 21eef00:	9b217ef7 	smull	x23, w23, w1
 21eef04:	f9402bfb 	ldr	x27, [sp,#80]
 21eef08:	8b170001 	add	x1, x0, x23
 21eef0c:	b8376814 	str	w20, [x0,x23]
 21eef10:	b9000438 	str	w24, [x1,#4]
 21eef14:	39002036 	strb	w22, [x1,#8]
 21eef18:	39002433 	strb	w19, [x1,#9]
 21eef1c:	17ffffc5 	b	21eee30 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66d18>
 21eef20:	aa1603e0 	mov	x0, x22
 21eef24:	9000cf57 	adrp	x23, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21eef28:	9788dcce 	bl	426260 <__cxa_guard_acquire@plt>
 21eef2c:	34fff7c0 	cbz	w0, 21eee24 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66d0c>
