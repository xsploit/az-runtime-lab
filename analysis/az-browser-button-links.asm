
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000006ca238 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x396a8>:
  6ca238:	d2958aa2 	mov	x2, #0xac55                	// #44117
  6ca23c:	aa1703e1 	mov	x1, x23
  6ca240:	f2aa4122 	movk	x2, #0x5209, lsl #16
  6ca244:	9101a3e0 	add	x0, sp, #0x68
  6ca248:	f2d83ea2 	movk	x2, #0xc1f5, lsl #32
  6ca24c:	f2e013e2 	movk	x2, #0x9f, lsl #48
  6ca250:	f90037e2 	str	x2, [sp,#104]
  6ca254:	94000609 	bl	6cba78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3aee8>
  6ca258:	72001c1f 	tst	w0, #0xff
  6ca25c:	54000541 	b.ne	6ca304 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x39774>
  6ca260:	910123f3 	add	x19, sp, #0x48
  6ca264:	f000f7a1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  6ca268:	aa1303e0 	mov	x0, x19
  6ca26c:	9136a021 	add	x1, x1, #0xda8
  6ca270:	9471a69c 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6ca274:	910143f4 	add	x20, sp, #0x50
  6ca278:	b000f841 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  6ca27c:	9138a021 	add	x1, x1, #0xe28
  6ca280:	91018021 	add	x1, x1, #0x60
  6ca284:	aa1303e0 	mov	x0, x19
  6ca288:	aa1403e8 	mov	x8, x20
  6ca28c:	94712659 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6ca290:	910163f5 	add	x21, sp, #0x58
  6ca294:	b0010801 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  6ca298:	aa1503e8 	mov	x8, x21
  6ca29c:	91366021 	add	x1, x1, #0xd98
  6ca2a0:	aa1403e0 	mov	x0, x20
  6ca2a4:	94712653 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6ca2a8:	910183f6 	add	x22, sp, #0x60
  6ca2ac:	f000f841 	adrp	x1, 25d5000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x121a8>
  6ca2b0:	aa1603e0 	mov	x0, x22
  6ca2b4:	91302021 	add	x1, x1, #0xc08
  6ca2b8:	9471a68a 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6ca2bc:	9101a3e8 	add	x8, sp, #0x68
  6ca2c0:	aa1603e1 	mov	x1, x22
  6ca2c4:	aa1503e0 	mov	x0, x21
  6ca2c8:	947125f2 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  6ca2cc:	52800022 	mov	w2, #0x1                   	// #1
  6ca2d0:	52800001 	mov	w1, #0x0                   	// #0
  6ca2d4:	9101a3e0 	add	x0, sp, #0x68
  6ca2d8:	946cd842 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  6ca2dc:	9101a3e0 	add	x0, sp, #0x68
  6ca2e0:	9470c8c8 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca2e4:	aa1603e0 	mov	x0, x22
  6ca2e8:	9470c8c6 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca2ec:	aa1503e0 	mov	x0, x21
  6ca2f0:	9470c8c4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca2f4:	aa1403e0 	mov	x0, x20
  6ca2f8:	9470c8c2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca2fc:	aa1303e0 	mov	x0, x19
  6ca300:	9470c8c0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca304:	d2927062 	mov	x2, #0x9383                	// #37763
  6ca308:	aa1703e1 	mov	x1, x23
  6ca30c:	f2a18802 	movk	x2, #0xc40, lsl #16
  6ca310:	9101a3e0 	add	x0, sp, #0x68
  6ca314:	f2c72862 	movk	x2, #0x3943, lsl #32
  6ca318:	f2e005e2 	movk	x2, #0x2f, lsl #48
  6ca31c:	f90037e2 	str	x2, [sp,#104]
  6ca320:	940005d6 	bl	6cba78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3aee8>
  6ca324:	72001c1f 	tst	w0, #0xff
  6ca328:	54000541 	b.ne	6ca3d0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x39840>
  6ca32c:	910123f3 	add	x19, sp, #0x48
  6ca330:	f000f7a1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  6ca334:	aa1303e0 	mov	x0, x19
  6ca338:	9136a021 	add	x1, x1, #0xda8
  6ca33c:	9471a669 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6ca340:	910143f4 	add	x20, sp, #0x50
  6ca344:	b000f841 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  6ca348:	9138a021 	add	x1, x1, #0xe28
  6ca34c:	91018021 	add	x1, x1, #0x60
  6ca350:	aa1303e0 	mov	x0, x19
  6ca354:	aa1403e8 	mov	x8, x20
  6ca358:	94712626 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6ca35c:	910163f5 	add	x21, sp, #0x58
  6ca360:	b0010801 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  6ca364:	aa1503e8 	mov	x8, x21
  6ca368:	91366021 	add	x1, x1, #0xd98
  6ca36c:	aa1403e0 	mov	x0, x20
  6ca370:	94712620 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6ca374:	910183f6 	add	x22, sp, #0x60
  6ca378:	f000f841 	adrp	x1, 25d5000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x121a8>
  6ca37c:	aa1603e0 	mov	x0, x22
  6ca380:	91312021 	add	x1, x1, #0xc48
  6ca384:	9471a657 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6ca388:	9101a3e8 	add	x8, sp, #0x68
  6ca38c:	aa1603e1 	mov	x1, x22
  6ca390:	aa1503e0 	mov	x0, x21
  6ca394:	947125bf 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  6ca398:	52800022 	mov	w2, #0x1                   	// #1
  6ca39c:	52800001 	mov	w1, #0x0                   	// #0
  6ca3a0:	9101a3e0 	add	x0, sp, #0x68
  6ca3a4:	946cd80f 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  6ca3a8:	9101a3e0 	add	x0, sp, #0x68
  6ca3ac:	9470c895 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca3b0:	aa1603e0 	mov	x0, x22
  6ca3b4:	9470c893 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca3b8:	aa1503e0 	mov	x0, x21
  6ca3bc:	9470c891 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca3c0:	aa1403e0 	mov	x0, x20
  6ca3c4:	9470c88f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca3c8:	aa1303e0 	mov	x0, x19
  6ca3cc:	9470c88d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca3d0:	d2847aa2 	mov	x2, #0x23d5                	// #9173
  6ca3d4:	aa1703e1 	mov	x1, x23
  6ca3d8:	f2a959c2 	movk	x2, #0x4ace, lsl #16
  6ca3dc:	9101a3e0 	add	x0, sp, #0x68
  6ca3e0:	f2cbc062 	movk	x2, #0x5e03, lsl #32
  6ca3e4:	f2e00b82 	movk	x2, #0x5c, lsl #48
  6ca3e8:	f90037e2 	str	x2, [sp,#104]
  6ca3ec:	940005a3 	bl	6cba78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3aee8>
  6ca3f0:	72001c1f 	tst	w0, #0xff
  6ca3f4:	54000541 	b.ne	6ca49c <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3990c>
  6ca3f8:	910123f3 	add	x19, sp, #0x48
  6ca3fc:	f000f7a1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  6ca400:	aa1303e0 	mov	x0, x19
  6ca404:	9136a021 	add	x1, x1, #0xda8
  6ca408:	9471a636 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6ca40c:	910143f4 	add	x20, sp, #0x50
  6ca410:	b000f841 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  6ca414:	9138a021 	add	x1, x1, #0xe28
  6ca418:	91018021 	add	x1, x1, #0x60
  6ca41c:	aa1303e0 	mov	x0, x19
  6ca420:	aa1403e8 	mov	x8, x20
  6ca424:	947125f3 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6ca428:	910163f5 	add	x21, sp, #0x58
  6ca42c:	b0010801 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  6ca430:	aa1503e8 	mov	x8, x21
  6ca434:	91366021 	add	x1, x1, #0xd98
  6ca438:	aa1403e0 	mov	x0, x20
  6ca43c:	947125ed 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6ca440:	910183f6 	add	x22, sp, #0x60
  6ca444:	f000f841 	adrp	x1, 25d5000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x121a8>
  6ca448:	aa1603e0 	mov	x0, x22
  6ca44c:	91322021 	add	x1, x1, #0xc88
  6ca450:	9471a624 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6ca454:	9101a3e8 	add	x8, sp, #0x68
  6ca458:	aa1603e1 	mov	x1, x22
  6ca45c:	aa1503e0 	mov	x0, x21
  6ca460:	9471258c 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  6ca464:	52800022 	mov	w2, #0x1                   	// #1
  6ca468:	52800001 	mov	w1, #0x0                   	// #0
  6ca46c:	9101a3e0 	add	x0, sp, #0x68
  6ca470:	946cd7dc 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  6ca474:	9101a3e0 	add	x0, sp, #0x68
  6ca478:	9470c862 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca47c:	aa1603e0 	mov	x0, x22
  6ca480:	9470c860 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca484:	aa1503e0 	mov	x0, x21
  6ca488:	9470c85e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca48c:	aa1403e0 	mov	x0, x20
  6ca490:	9470c85c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca494:	aa1303e0 	mov	x0, x19
  6ca498:	9470c85a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  6ca49c:	d297a7a2 	mov	x2, #0xbd3d                	// #48445
