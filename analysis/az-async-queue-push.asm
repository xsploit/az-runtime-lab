
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000022122d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a1b8>:
 22122d0:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 22122d4:	91020003 	add	x3, x0, #0x80
 22122d8:	910003fd 	mov	x29, sp
 22122dc:	f9000bf3 	str	x19, [sp,#16]
 22122e0:	aa0003f3 	mov	x19, x0
 22122e4:	c8dffc60 	ldar	x0, [x3]
 22122e8:	f9001fe0 	str	x0, [sp,#56]
 22122ec:	f9401fe0 	ldr	x0, [sp,#56]
 22122f0:	f240bc1f 	tst	x0, #0xffffffffffff
 22122f4:	54000a80 	b.eq	2212444 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a32c>
 22122f8:	f9401fe0 	ldr	x0, [sp,#56]
 22122fc:	f9401fe4 	ldr	x4, [sp,#56]
 2212300:	9240bc00 	and	x0, x0, #0xffffffffffff
 2212304:	f9400002 	ldr	x2, [x0]
 2212308:	f9401fe0 	ldr	x0, [sp,#56]
 221230c:	9240bc42 	and	x2, x2, #0xffffffffffff
 2212310:	d370fc00 	lsr	x0, x0, #48
 2212314:	11000400 	add	w0, w0, #0x1
 2212318:	b3503c02 	bfi	x2, x0, #48, #16
 221231c:	c85ffc60 	ldaxr	x0, [x3]
 2212320:	eb04001f 	cmp	x0, x4
 2212324:	54000061 	b.ne	2212330 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a218>
 2212328:	c805fc62 	stlxr	w5, x2, [x3]
 221232c:	710000bf 	cmp	w5, #0x0
 2212330:	54fffdc1 	b.ne	22122e8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a1d0>
 2212334:	f9401fe2 	ldr	x2, [sp,#56]
 2212338:	52800000 	mov	w0, #0x0                   	// #0
 221233c:	f240bc42 	ands	x2, x2, #0xffffffffffff
 2212340:	54000620 	b.eq	2212404 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a2ec>
 2212344:	aa0203e0 	mov	x0, x2
 2212348:	f9400021 	ldr	x1, [x1]
 221234c:	f9000401 	str	x1, [x0,#8]
 2212350:	f9400001 	ldr	x1, [x0]
 2212354:	d370fc21 	lsr	x1, x1, #48
 2212358:	11000421 	add	w1, w1, #0x1
 221235c:	d2800003 	mov	x3, #0x0                   	// #0
 2212360:	b3503c23 	bfi	x3, x1, #48, #16
 2212364:	c89ffc03 	stlr	x3, [x0]
 2212368:	91010261 	add	x1, x19, #0x40
 221236c:	c8dffc20 	ldar	x0, [x1]
 2212370:	f9001be0 	str	x0, [sp,#48]
 2212374:	f9401be0 	ldr	x0, [sp,#48]
 2212378:	9240bc00 	and	x0, x0, #0xffffffffffff
 221237c:	c8dffc03 	ldar	x3, [x0]
 2212380:	f9001fe3 	str	x3, [sp,#56]
 2212384:	f9401fe3 	ldr	x3, [sp,#56]
 2212388:	9240bc63 	and	x3, x3, #0xffffffffffff
 221238c:	c8dffc26 	ldar	x6, [x1]
 2212390:	f9401be5 	ldr	x5, [sp,#48]
 2212394:	aa0203e4 	mov	x4, x2
 2212398:	eb0500df 	cmp	x6, x5
 221239c:	54fffe81 	b.ne	221236c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a254>
 22123a0:	b5000383 	cbnz	x3, 2212410 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a2f8>
 22123a4:	f9401fe3 	ldr	x3, [sp,#56]
 22123a8:	f9401fe5 	ldr	x5, [sp,#56]
 22123ac:	d370fc63 	lsr	x3, x3, #48
 22123b0:	11000463 	add	w3, w3, #0x1
 22123b4:	b3503c64 	bfi	x4, x3, #48, #16
 22123b8:	c85ffc03 	ldaxr	x3, [x0]
 22123bc:	eb05007f 	cmp	x3, x5
 22123c0:	54000061 	b.ne	22123cc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a2b4>
 22123c4:	c806fc04 	stlxr	w6, x4, [x0]
 22123c8:	710000df 	cmp	w6, #0x0
 22123cc:	1a9f17e0 	cset	w0, eq
 22123d0:	35000040 	cbnz	w0, 22123d8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a2c0>
 22123d4:	f9001fe3 	str	x3, [sp,#56]
 22123d8:	34fffca0 	cbz	w0, 221236c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a254>
 22123dc:	f9401be3 	ldr	x3, [sp,#48]
 22123e0:	f9401be4 	ldr	x4, [sp,#48]
 22123e4:	d370fc63 	lsr	x3, x3, #48
 22123e8:	11000463 	add	w3, w3, #0x1
 22123ec:	b3503c62 	bfi	x2, x3, #48, #16
 22123f0:	c85ffc23 	ldaxr	x3, [x1]
 22123f4:	eb04007f 	cmp	x3, x4
 22123f8:	54000061 	b.ne	2212404 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a2ec>
 22123fc:	c805fc22 	stlxr	w5, x2, [x1]
 2212400:	35ffff85 	cbnz	w5, 22123f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a2d8>
 2212404:	f9400bf3 	ldr	x19, [sp,#16]
 2212408:	a8c47bfd 	ldp	x29, x30, [sp],#64
 221240c:	d65f03c0 	ret
 2212410:	f9401be0 	ldr	x0, [sp,#48]
 2212414:	f9401be4 	ldr	x4, [sp,#48]
 2212418:	d370fc00 	lsr	x0, x0, #48
 221241c:	11000400 	add	w0, w0, #0x1
 2212420:	b3503c03 	bfi	x3, x0, #48, #16
 2212424:	c85ffc20 	ldaxr	x0, [x1]
 2212428:	eb04001f 	cmp	x0, x4
 221242c:	54000061 	b.ne	2212438 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a320>
 2212430:	c805fc23 	stlxr	w5, x3, [x1]
 2212434:	35ffff85 	cbnz	w5, 2212424 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a30c>
 2212438:	54fff9a0 	b.eq	221236c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a254>
 221243c:	f9001be0 	str	x0, [sp,#48]
 2212440:	17ffffcb 	b	221236c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a254>
 2212444:	d2800800 	mov	x0, #0x40                  	// #64
 2212448:	f90017e1 	str	x1, [sp,#40]
 221244c:	97884a3d 	bl	424d40 <_Znwm@plt>
 2212450:	aa0003e2 	mov	x2, x0
 2212454:	f94017e1 	ldr	x1, [sp,#40]
 2212458:	17ffffbc 	b	2212348 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a230>
 221245c:	00000000 	.inst	0x00000000 ; undefined
