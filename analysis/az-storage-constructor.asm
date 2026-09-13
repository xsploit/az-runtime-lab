
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021ba400 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x322e8>:
 21ba400:	a9b67bfd 	stp	x29, x30, [sp,#-160]!
 21ba404:	910003fd 	mov	x29, sp
 21ba408:	a90153f3 	stp	x19, x20, [sp,#16]
 21ba40c:	aa0003f3 	mov	x19, x0
 21ba410:	d00064e0 	adrp	x0, 2e58000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8951a8>
 21ba414:	91128000 	add	x0, x0, #0x4a0
 21ba418:	a9025bf5 	stp	x21, x22, [sp,#32]
 21ba41c:	9000cc54 	adrp	x20, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 21ba420:	91396294 	add	x20, x20, #0xe58
 21ba424:	a90363f7 	stp	x23, x24, [sp,#48]
 21ba428:	aa0103f7 	mov	x23, x1
 21ba42c:	a9046bf9 	stp	x25, x26, [sp,#64]
 21ba430:	a90573fb 	stp	x27, x28, [sp,#80]
 21ba434:	aa0203fc 	mov	x28, x2
 21ba438:	6d0627e8 	stp	d8, d9, [sp,#96]
 21ba43c:	9e670068 	fmov	d8, x3
 21ba440:	9e670089 	fmov	d9, x4
 21ba444:	fd003bea 	str	d10, [sp,#112]
 21ba448:	9e6700aa 	fmov	d10, x5
 21ba44c:	f9000260 	str	x0, [x19]
 21ba450:	08dffe80 	ldarb	w0, [x20]
 21ba454:	9000cc55 	adrp	x21, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 21ba458:	36001180 	tbz	w0, #0, 21ba688 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x32570>
 21ba45c:	b94e62a0 	ldr	w0, [x21,#3680]
 21ba460:	b0002076 	adrp	x22, 25c7000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x41a8>
 21ba464:	910c02d6 	add	x22, x22, #0x300
 21ba468:	f9000676 	str	x22, [x19,#8]
 21ba46c:	b9001260 	str	w0, [x19,#16]
 21ba470:	9100a279 	add	x25, x19, #0x28
 21ba474:	f9000e7f 	str	xzr, [x19,#24]
 21ba478:	aa1903e0 	mov	x0, x25
 21ba47c:	3900827f 	strb	wzr, [x19,#32]
 21ba480:	91016278 	add	x24, x19, #0x58
 21ba484:	9405c627 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 21ba488:	f0003e81 	adrp	x1, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 21ba48c:	910223e0 	add	x0, sp, #0x88
 21ba490:	913c0021 	add	x1, x1, #0xf00
 21ba494:	9405e613 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21ba498:	910243e4 	add	x4, sp, #0x90
 21ba49c:	52808003 	mov	w3, #0x400                 	// #1024
 21ba4a0:	52817702 	mov	w2, #0xbb8                 	// #3000
 21ba4a4:	910223e1 	add	x1, sp, #0x88
 21ba4a8:	aa1803e0 	mov	x0, x24
 21ba4ac:	a9097fff 	stp	xzr, xzr, [sp,#144]
