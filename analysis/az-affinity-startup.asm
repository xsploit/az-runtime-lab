
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002347350 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf238>:
 2347350:	aa0003f3 	mov	x19, x0
 2347354:	97ffb94f 	bl	2335890 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1ad778>
 2347358:	f9401fe0 	ldr	x0, [sp,#56]
 234735c:	91004000 	add	x0, x0, #0x10
 2347360:	9400b7f4 	bl	2375330 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1ed218>
 2347364:	f9400674 	ldr	x20, [x19,#8]
 2347368:	f9000013 	str	x19, [x0]
 234736c:	39400280 	ldrb	w0, [x20]
 2347370:	35000640 	cbnz	w0, 2347438 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf320>
 2347374:	5284e201 	mov	w1, #0x2710                	// #10000
 2347378:	91014260 	add	x0, x19, #0x50
 234737c:	97ff93cd 	bl	232c2b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a4198>
 2347380:	72001c1f 	tst	w0, #0xff
 2347384:	540000e0 	b.eq	23473a0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf288>
 2347388:	b9413260 	ldr	w0, [x19,#304]
 234738c:	35000520 	cbnz	w0, 2347430 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf318>
 2347390:	f9400261 	ldr	x1, [x19]
 2347394:	aa1303e0 	mov	x0, x19
 2347398:	f9400821 	ldr	x1, [x1,#16]
 234739c:	d63f0020 	blr	x1
 23473a0:	978372ac 	bl	423e50 <pthread_self@plt>
 23473a4:	f9401fe1 	ldr	x1, [sp,#56]
 23473a8:	91004021 	add	x1, x1, #0x10
 23473ac:	c8dffc21 	ldar	x1, [x1]
 23473b0:	b40000e1 	cbz	x1, 23473cc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf2b4>
 23473b4:	c85ffc22 	ldaxr	x2, [x1]
 23473b8:	eb00005f 	cmp	x2, x0
 23473bc:	54000061 	b.ne	23473c8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf2b0>
 23473c0:	c803fc3f 	stlxr	w3, xzr, [x1]
 23473c4:	35ffff83 	cbnz	w3, 23473b4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf29c>
 23473c8:	54000401 	b.ne	2347448 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf330>
 23473cc:	3944d260 	ldrb	w0, [x19,#308]
 23473d0:	91006261 	add	x1, x19, #0x18
 23473d4:	c89ffc3f 	stlr	xzr, [x1]
 23473d8:	91004261 	add	x1, x19, #0x10
 23473dc:	c89ffc3f 	stlr	xzr, [x1]
 23473e0:	350001e0 	cbnz	w0, 234741c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf304>
 23473e4:	f9401fe0 	ldr	x0, [sp,#56]
 23473e8:	b4000140 	cbz	x0, 2347410 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf2f8>
 23473ec:	91002001 	add	x1, x0, #0x8
 23473f0:	885ffc22 	ldaxr	w2, [x1]
 23473f4:	51000442 	sub	w2, w2, #0x1
 23473f8:	8803fc22 	stlxr	w3, w2, [x1]
 23473fc:	35ffffa3 	cbnz	w3, 23473f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf2d8>
 2347400:	35000082 	cbnz	w2, 2347410 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf2f8>
 2347404:	f9400001 	ldr	x1, [x0]
 2347408:	f9400421 	ldr	x1, [x1,#8]
 234740c:	d63f0020 	blr	x1
 2347410:	a94153f3 	ldp	x19, x20, [sp,#16]
 2347414:	a8c47bfd 	ldp	x29, x30, [sp],#64
 2347418:	d65f03c0 	ret
 234741c:	f9400261 	ldr	x1, [x19]
 2347420:	aa1303e0 	mov	x0, x19
 2347424:	f9400421 	ldr	x1, [x1,#8]
 2347428:	d63f0020 	blr	x1
 234742c:	17ffffee 	b	23473e4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf2cc>
 2347430:	97ff9a10 	bl	232dc70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5b58>
 2347434:	17ffffd7 	b	2347390 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf278>
 2347438:	97837286 	bl	423e50 <pthread_self@plt>
 234743c:	aa1403e1 	mov	x1, x20
 2347440:	978374bc 	bl	424730 <pthread_setname_np@plt>
 2347444:	17ffffcc 	b	2347374 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf25c>
 2347448:	f9400421 	ldr	x1, [x1,#8]
 234744c:	b5fffb41 	cbnz	x1, 23473b4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf29c>
 2347450:	17ffffdf 	b	23473cc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf2b4>
 2347454:	f100043f 	cmp	x1, #0x1
 2347458:	540000e0 	b.eq	2347474 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf35c>
 234745c:	978372f1 	bl	424020 <__cxa_begin_catch@plt>
 2347460:	d2800001 	mov	x1, #0x0                   	// #0
 2347464:	52800000 	mov	w0, #0x0                   	// #0
 2347468:	97fae496 	bl	22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x785a8>
 234746c:	97837e5d 	bl	426de0 <__cxa_end_catch@plt>
 2347470:	17ffffcc 	b	23473a0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bf288>
 2347474:	978372eb 	bl	424020 <__cxa_begin_catch@plt>
 2347478:	97837e92 	bl	426ec0 <__cxa_rethrow@plt>
 234747c:	f90017e0 	str	x0, [sp,#40]
