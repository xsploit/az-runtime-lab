
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000221f1e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x970c8>:
 221f1e0:	a9b47bfd 	stp	x29, x30, [sp,#-192]!
 221f1e4:	910003fd 	mov	x29, sp
 221f1e8:	a90153f3 	stp	x19, x20, [sp,#16]
 221f1ec:	a9025bf5 	stp	x21, x22, [sp,#32]
 221f1f0:	a90363f7 	stp	x23, x24, [sp,#48]
 221f1f4:	2a0203f7 	mov	w23, w2
 221f1f8:	2a0303f8 	mov	w24, w3
 221f1fc:	a9046bf9 	stp	x25, x26, [sp,#64]
 221f200:	a90573fb 	stp	x27, x28, [sp,#80]
 221f204:	aa0003fb 	mov	x27, x0
 221f208:	37f81cc2 	tbnz	w2, #31, 221f5a0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97488>
 221f20c:	7100285f 	cmp	w2, #0xa
 221f210:	5400318c 	b.gt	221f840 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97728>
 221f214:	3100531f 	cmn	w24, #0x14
 221f218:	5400150b 	b.lt	221f4b8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x973a0>
 221f21c:	71004f1f 	cmp	w24, #0x13
 221f220:	54002b6c 	b.gt	221f78c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97674>
 221f224:	fd0033e8 	str	d8, [sp,#96]
 221f228:	9788130a 	bl	423e50 <pthread_self@plt>
 221f22c:	9e670008 	fmov	d8, x0
 221f230:	9101f3e1 	add	x1, sp, #0x7c
 221f234:	9101e3e2 	add	x2, sp, #0x78
 221f238:	97881bd6 	bl	426190 <pthread_getschedparam@plt>
 221f23c:	2a0003f9 	mov	w25, w0
 221f240:	35000d80 	cbnz	w0, 221f3f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x972d8>
 221f244:	d29e62c0 	mov	x0, #0xf316                	// #62230
 221f248:	f2a1f320 	movk	x0, #0xf99, lsl #16
 221f24c:	eb00037f 	cmp	x27, x0
 221f250:	54002960 	b.eq	221f77c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97664>
 221f254:	d2932a80 	mov	x0, #0x9954                	// #39252
 221f258:	f2a22400 	movk	x0, #0x1120, lsl #16
 221f25c:	eb00037f 	cmp	x27, x0
 221f260:	54002120 	b.eq	221f684 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x9756c>
 221f264:	d2858680 	mov	x0, #0x2c34                	// #11316
 221f268:	eb00037f 	cmp	x27, x0
 221f26c:	54002800 	b.eq	221f76c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97654>
 221f270:	b9007fff 	str	wzr, [sp,#124]
 221f274:	9e660100 	fmov	x0, d8
 221f278:	9101e3e2 	add	x2, sp, #0x78
 221f27c:	2a1903e1 	mov	w1, w25
 221f280:	b9007bff 	str	wzr, [sp,#120]
 221f284:	97881c2f 	bl	426340 <pthread_setschedparam@plt>
 221f288:	2a0003f7 	mov	w23, w0
 221f28c:	35002300 	cbnz	w0, 221f6ec <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x975d4>
 221f290:	b9407fe0 	ldr	w0, [sp,#124]
 221f294:	34000140 	cbz	w0, 221f2bc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x971a4>
 221f298:	52800020 	mov	w0, #0x1                   	// #1
 221f29c:	fd4033e8 	ldr	d8, [sp,#96]
 221f2a0:	a94153f3 	ldp	x19, x20, [sp,#16]
 221f2a4:	a9425bf5 	ldp	x21, x22, [sp,#32]
 221f2a8:	a94363f7 	ldp	x23, x24, [sp,#48]
 221f2ac:	a9446bf9 	ldp	x25, x26, [sp,#64]
 221f2b0:	a94573fb 	ldp	x27, x28, [sp,#80]
 221f2b4:	a8cc7bfd 	ldp	x29, x30, [sp],#192
 221f2b8:	d65f03c0 	ret
 221f2bc:	978815b9 	bl	4249a0 <__errno_location@plt>
 221f2c0:	aa0003f9 	mov	x25, x0
 221f2c4:	d2801640 	mov	x0, #0xb2                  	// #178
 221f2c8:	b900033f 	str	wzr, [x25]
 221f2cc:	9788201d 	bl	427340 <syscall@plt>
 221f2d0:	2a0003e1 	mov	w1, w0
 221f2d4:	2a1803e2 	mov	w2, w24
 221f2d8:	52800000 	mov	w0, #0x0                   	// #0
 221f2dc:	9788153d 	bl	4247d0 <setpriority@plt>
 221f2e0:	34fffdc0 	cbz	w0, 221f298 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97180>
 221f2e4:	910263f3 	add	x19, sp, #0x98
 221f2e8:	d0001d01 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 221f2ec:	aa1303e0 	mov	x0, x19
 221f2f0:	9136a021 	add	x1, x1, #0xda8
 221f2f4:	9404527b 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 221f2f8:	910283f4 	add	x20, sp, #0xa0
 221f2fc:	90006261 	adrp	x1, 2e6b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a81a8>
 221f300:	91090021 	add	x1, x1, #0x240
 221f304:	9107a021 	add	x1, x1, #0x1e8
 221f308:	aa1303e0 	mov	x0, x19
 221f30c:	aa1403e8 	mov	x8, x20
 221f310:	9403d238 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 221f314:	9102a3f6 	add	x22, sp, #0xa8
 221f318:	90002d61 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 221f31c:	aa1603e8 	mov	x8, x22
 221f320:	91366021 	add	x1, x1, #0xd98
 221f324:	aa1403e0 	mov	x0, x20
 221f328:	9403d232 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 221f32c:	9102c3f5 	add	x21, sp, #0xb0
 221f330:	90006261 	adrp	x1, 2e6b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a81a8>
 221f334:	aa1503e0 	mov	x0, x21
 221f338:	91256021 	add	x1, x1, #0x958
 221f33c:	94045269 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 221f340:	9102e3f7 	add	x23, sp, #0xb8
 221f344:	aa1503e1 	mov	x1, x21
 221f348:	aa1703e8 	mov	x8, x23
 221f34c:	aa1603e0 	mov	x0, x22
 221f350:	9403d1d0 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 221f354:	52800022 	mov	w2, #0x1                   	// #1
 221f358:	52800001 	mov	w1, #0x0                   	// #0
 221f35c:	aa1703e0 	mov	x0, x23
 221f360:	97ff8420 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 221f364:	aa1703e0 	mov	x0, x23
 221f368:	940374a6 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 221f36c:	aa1503e0 	mov	x0, x21
 221f370:	940374a4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 221f374:	aa1603e0 	mov	x0, x22
 221f378:	940374a2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 221f37c:	aa1403e0 	mov	x0, x20
 221f380:	940374a0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 221f384:	aa1303e0 	mov	x0, x19
 221f388:	9403749e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 221f38c:	aa1303e0 	mov	x0, x19
 221f390:	90006261 	adrp	x1, 2e6b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a81a8>
 221f394:	91266021 	add	x1, x1, #0x998
 221f398:	94045252 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 221f39c:	b00031e1 	adrp	x1, 285c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2991a8>
 221f3a0:	aa1403e8 	mov	x8, x20
 221f3a4:	aa1303e0 	mov	x0, x19
 221f3a8:	911e8021 	add	x1, x1, #0x7a0
 221f3ac:	9403d211 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
