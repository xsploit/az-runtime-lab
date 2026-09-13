
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f0290 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68178>:
 21f0290:	bd403fe0 	ldr	s0, [sp,#60]
 21f0294:	17ffffea 	b	21f023c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68124>
 21f0298:	d503201f 	nop
 21f029c:	d503201f 	nop
 21f02a0:	a9b97bfd 	stp	x29, x30, [sp,#-112]!
 21f02a4:	910003fd 	mov	x29, sp
 21f02a8:	a90153f3 	stp	x19, x20, [sp,#16]
 21f02ac:	aa0003f3 	mov	x19, x0
 21f02b0:	d000cf34 	adrp	x20, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f02b4:	9131e294 	add	x20, x20, #0xc78
 21f02b8:	a9025bf5 	stp	x21, x22, [sp,#32]
 21f02bc:	2a0103f6 	mov	w22, w1
 21f02c0:	08dffe80 	ldarb	w0, [x20]
 21f02c4:	d000cf35 	adrp	x21, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f02c8:	360001c0 	tbz	w0, #0, 21f0300 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x681e8>
 21f02cc:	1e202018 	fcmpe	s0, #0.0
 21f02d0:	b94c82a1 	ldr	w1, [x21,#3200]
 21f02d4:	f0006380 	adrp	x0, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f02d8:	91386000 	add	x0, x0, #0xe18
 21f02dc:	f9000260 	str	x0, [x19]
 21f02e0:	b9000a61 	str	w1, [x19,#8]
 21f02e4:	b9000e76 	str	w22, [x19,#12]
 21f02e8:	bd001260 	str	s0, [x19,#16]
 21f02ec:	5400022d 	b.le	21f0330 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68218>
 21f02f0:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f02f4:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21f02f8:	a8c77bfd 	ldp	x29, x30, [sp],#112
 21f02fc:	d65f03c0 	ret
 21f0300:	aa1403e0 	mov	x0, x20
 21f0304:	bd003fe0 	str	s0, [sp,#60]
 21f0308:	9788d7d6 	bl	426260 <__cxa_guard_acquire@plt>
 21f030c:	d000cf35 	adrp	x21, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f0310:	bd403fe0 	ldr	s0, [sp,#60]
 21f0314:	34fffdc0 	cbz	w0, 21f02cc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x681b4>
 21f0318:	9793017c 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 21f031c:	b90c82a0 	str	w0, [x21,#3200]
 21f0320:	aa1403e0 	mov	x0, x20
 21f0324:	9788d947 	bl	426840 <__cxa_guard_release@plt>
 21f0328:	bd403fe0 	ldr	s0, [sp,#60]
 21f032c:	17ffffe8 	b	21f02cc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x681b4>
 21f0330:	b0001e81 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 21f0334:	910183e0 	add	x0, sp, #0x60
 21f0338:	9136a021 	add	x1, x1, #0xda8
 21f033c:	94050e69 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21f0340:	900063a1 	adrp	x1, 2e64000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a11a8>
 21f0344:	9113e021 	add	x1, x1, #0x4f8
 21f0348:	912de021 	add	x1, x1, #0xb78
 21f034c:	910163e8 	add	x8, sp, #0x58
 21f0350:	910183e0 	add	x0, sp, #0x60
 21f0354:	94048e27 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 21f0358:	f0002ec1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 21f035c:	910143e8 	add	x8, sp, #0x50
 21f0360:	91366021 	add	x1, x1, #0xd98
 21f0364:	910163e0 	add	x0, sp, #0x58
 21f0368:	94048e22 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 21f036c:	d00063a1 	adrp	x1, 2e66000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a31a8>
 21f0370:	9101a3e0 	add	x0, sp, #0x68
 21f0374:	911e2021 	add	x1, x1, #0x788
 21f0378:	94050e5a 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21f037c:	9101a3e1 	add	x1, sp, #0x68
 21f0380:	910123e8 	add	x8, sp, #0x48
 21f0384:	910143e0 	add	x0, sp, #0x50
 21f0388:	94048dc2 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 21f038c:	52800022 	mov	w2, #0x1                   	// #1
 21f0390:	52800001 	mov	w1, #0x0                   	// #0
 21f0394:	910123e0 	add	x0, sp, #0x48
 21f0398:	94004012 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 21f039c:	910123e0 	add	x0, sp, #0x48
 21f03a0:	94043098 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21f03a4:	9101a3e0 	add	x0, sp, #0x68
 21f03a8:	94043096 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21f03ac:	910143e0 	add	x0, sp, #0x50
 21f03b0:	94043094 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21f03b4:	910163e0 	add	x0, sp, #0x58
 21f03b8:	94043092 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21f03bc:	910183e0 	add	x0, sp, #0x60
 21f03c0:	94043090 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21f03c4:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f03c8:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21f03cc:	a8c77bfd 	ldp	x29, x30, [sp],#112
 21f03d0:	d65f03c0 	ret
 21f03d4:	aa0003f4 	mov	x20, x0
 21f03d8:	910123e0 	add	x0, sp, #0x48
 21f03dc:	94043089 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21f03e0:	9101a3e0 	add	x0, sp, #0x68
 21f03e4:	94043087 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21f03e8:	910143e0 	add	x0, sp, #0x50
 21f03ec:	94043085 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21f03f0:	910163e0 	add	x0, sp, #0x58
 21f03f4:	94043083 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21f03f8:	910183e0 	add	x0, sp, #0x60
 21f03fc:	94043081 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21f0400:	aa1403e0 	mov	x0, x20
 21f0404:	b9000a7f 	str	wzr, [x19,#8]
 21f0408:	9788d242 	bl	424d10 <_Unwind_Resume@plt>
 21f040c:	17fffffe 	b	21f0404 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x682ec>
 21f0410:	aa0003f4 	mov	x20, x0
 21f0414:	17fffff9 	b	21f03f8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x682e0>
 21f0418:	aa0003f4 	mov	x20, x0
 21f041c:	17fffff5 	b	21f03f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x682d8>
 21f0420:	aa0003f4 	mov	x20, x0
 21f0424:	17fffff1 	b	21f03e8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x682d0>
 21f0428:	aa0003f4 	mov	x20, x0
 21f042c:	17ffffed 	b	21f03e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x682c8>
 21f0430:	f0006381 	adrp	x1, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f0434:	913c4021 	add	x1, x1, #0xf10
 21f0438:	a9007c01 	stp	x1, xzr, [x0]
 21f043c:	d65f03c0 	ret
