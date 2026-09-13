
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021ba1c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x320a8>:
 21ba1c0:	d1002000 	sub	x0, x0, #0x8
 21ba1c4:	17fffe73 	b	21b9b90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x31a78>
 21ba1c8:	d503201f 	nop
 21ba1cc:	d503201f 	nop
 21ba1d0:	b9435002 	ldr	w2, [x0,#848]
 21ba1d4:	7100005f 	cmp	w2, #0x0
 21ba1d8:	5400032d 	b.le	21ba23c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x32124>
 21ba1dc:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21ba1e0:	910003fd 	mov	x29, sp
 21ba1e4:	a90153f3 	stp	x19, x20, [sp,#16]
 21ba1e8:	aa0003f4 	mov	x20, x0
 21ba1ec:	d2800013 	mov	x19, #0x0                   	// #0
 21ba1f0:	f90013f5 	str	x21, [sp,#32]
 21ba1f4:	2a0103f5 	mov	w21, w1
 21ba1f8:	6b13005f 	cmp	w2, w19
 21ba1fc:	54000229 	b.ls	21ba240 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x32128>
 21ba200:	f941a280 	ldr	x0, [x20,#832]
 21ba204:	2a1503e1 	mov	w1, w21
 21ba208:	f8737802 	ldr	x2, [x0,x19,lsl #3]
 21ba20c:	91000673 	add	x19, x19, #0x1
 21ba210:	aa0203e0 	mov	x0, x2
 21ba214:	f9400042 	ldr	x2, [x2]
 21ba218:	f9400842 	ldr	x2, [x2,#16]
 21ba21c:	d63f0040 	blr	x2
 21ba220:	b9435282 	ldr	w2, [x20,#848]
 21ba224:	6b13005f 	cmp	w2, w19
 21ba228:	54fffe8c 	b.gt	21ba1f8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x320e0>
 21ba22c:	a94153f3 	ldp	x19, x20, [sp,#16]
 21ba230:	f94013f5 	ldr	x21, [sp,#32]
 21ba234:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21ba238:	d65f03c0 	ret
 21ba23c:	d65f03c0 	ret
 21ba240:	d2800000 	mov	x0, #0x0                   	// #0
 21ba244:	f9400000 	ldr	x0, [x0]
 21ba248:	d4207d00 	brk	#0x3e8
 21ba24c:	d503201f 	nop
 21ba250:	b9435002 	ldr	w2, [x0,#848]
 21ba254:	7100005f 	cmp	w2, #0x0
 21ba258:	5400032d 	b.le	21ba2bc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x321a4>
 21ba25c:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21ba260:	910003fd 	mov	x29, sp
 21ba264:	a90153f3 	stp	x19, x20, [sp,#16]
 21ba268:	aa0003f4 	mov	x20, x0
 21ba26c:	d2800013 	mov	x19, #0x0                   	// #0
 21ba270:	f90013f5 	str	x21, [sp,#32]
 21ba274:	2a0103f5 	mov	w21, w1
 21ba278:	6b13005f 	cmp	w2, w19
 21ba27c:	54000229 	b.ls	21ba2c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x321a8>
 21ba280:	f941a280 	ldr	x0, [x20,#832]
 21ba284:	2a1503e1 	mov	w1, w21
 21ba288:	f8737802 	ldr	x2, [x0,x19,lsl #3]
 21ba28c:	91000673 	add	x19, x19, #0x1
 21ba290:	aa0203e0 	mov	x0, x2
 21ba294:	f9400042 	ldr	x2, [x2]
 21ba298:	f9400c42 	ldr	x2, [x2,#24]
 21ba29c:	d63f0040 	blr	x2
 21ba2a0:	b9435282 	ldr	w2, [x20,#848]
 21ba2a4:	6b13005f 	cmp	w2, w19
 21ba2a8:	54fffe8c 	b.gt	21ba278 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x32160>
 21ba2ac:	a94153f3 	ldp	x19, x20, [sp,#16]
 21ba2b0:	f94013f5 	ldr	x21, [sp,#32]
 21ba2b4:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21ba2b8:	d65f03c0 	ret
 21ba2bc:	d65f03c0 	ret
