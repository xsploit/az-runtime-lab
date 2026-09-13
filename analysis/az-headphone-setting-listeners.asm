
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000a82200 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1775e8>:
  a82200:	f9400821 	ldr	x1, [x1,#16]
  a82204:	d63f0020 	blr	x1
  a82208:	b4000235 	cbz	x21, a8224c <_ZSt20__throw_bad_weak_ptrv@@Base+0x177634>
  a8220c:	91003281 	add	x1, x20, #0xc
  a82210:	885ffc20 	ldaxr	w0, [x1]
  a82214:	51000402 	sub	w2, w0, #0x1
  a82218:	8803fc22 	stlxr	w3, w2, [x1]
  a8221c:	35ffffa3 	cbnz	w3, a82210 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1775f8>
  a82220:	7100041f 	cmp	w0, #0x1
  a82224:	54fffa81 	b.ne	a82174 <_ZSt20__throw_bad_weak_ptrv@@Base+0x17755c>
  a82228:	f9400281 	ldr	x1, [x20]
  a8222c:	aa1403e0 	mov	x0, x20
  a82230:	f9400c21 	ldr	x1, [x1,#24]
  a82234:	d63f0020 	blr	x1
  a82238:	17ffffcf 	b	a82174 <_ZSt20__throw_bad_weak_ptrv@@Base+0x17755c>
  a8223c:	b9400e80 	ldr	w0, [x20,#12]
  a82240:	51000401 	sub	w1, w0, #0x1
  a82244:	b9000e81 	str	w1, [x20,#12]
  a82248:	17ffffe0 	b	a821c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1775b0>
  a8224c:	b9400e80 	ldr	w0, [x20,#12]
  a82250:	51000401 	sub	w1, w0, #0x1
  a82254:	b9000e81 	str	w1, [x20,#12]
  a82258:	17fffff2 	b	a82220 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177608>
  a8225c:	00000000 	.inst	0x00000000 ; undefined
  a82260:	a9b97bfd 	stp	x29, x30, [sp,#-112]!
  a82264:	910003fd 	mov	x29, sp
  a82268:	a90363f7 	stp	x23, x24, [sp,#48]
  a8226c:	aa0003f8 	mov	x24, x0
  a82270:	f9402000 	ldr	x0, [x0,#64]
  a82274:	b4000e80 	cbz	x0, a82444 <_ZSt20__throw_bad_weak_ptrv@@Base+0x17782c>
  a82278:	f9400021 	ldr	x1, [x1]
  a8227c:	f9401000 	ldr	x0, [x0,#32]
  a82280:	eb01001f 	cmp	x0, x1
  a82284:	54000620 	b.eq	a82348 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177730>
  a82288:	a90153f3 	stp	x19, x20, [sp,#16]
  a8228c:	910123f3 	add	x19, sp, #0x48
  a82290:	aa1303e0 	mov	x0, x19
  a82294:	f000d9e1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a82298:	910143f4 	add	x20, sp, #0x50
  a8229c:	9136a021 	add	x1, x1, #0xda8
  a822a0:	9462c690 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a822a4:	f000e281 	adrp	x1, 26d5000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1121a8>
  a822a8:	aa1303e0 	mov	x0, x19
  a822ac:	aa1403e8 	mov	x8, x20
  a822b0:	910ee021 	add	x1, x1, #0x3b8
  a822b4:	9462464f 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a822b8:	a9025bf5 	stp	x21, x22, [sp,#32]
  a822bc:	910163f5 	add	x21, sp, #0x58
  a822c0:	b000ea41 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a822c4:	aa1503e8 	mov	x8, x21
  a822c8:	91366021 	add	x1, x1, #0xd98
  a822cc:	aa1403e0 	mov	x0, x20
  a822d0:	94624648 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a822d4:	910183f6 	add	x22, sp, #0x60
  a822d8:	9000e2a1 	adrp	x1, 26d6000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1131a8>
  a822dc:	aa1603e0 	mov	x0, x22
  a822e0:	91040021 	add	x1, x1, #0x100
  a822e4:	9462c67f 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a822e8:	9101a3f7 	add	x23, sp, #0x68
  a822ec:	aa1603e1 	mov	x1, x22
  a822f0:	aa1703e8 	mov	x8, x23
  a822f4:	aa1503e0 	mov	x0, x21
  a822f8:	946245e6 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a822fc:	52800022 	mov	w2, #0x1                   	// #1
  a82300:	52800001 	mov	w1, #0x0                   	// #0
  a82304:	aa1703e0 	mov	x0, x23
  a82308:	945df836 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a8230c:	aa1703e0 	mov	x0, x23
  a82310:	9461e8bc 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82314:	aa1603e0 	mov	x0, x22
  a82318:	9461e8ba 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a8231c:	aa1503e0 	mov	x0, x21
  a82320:	9461e8b8 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82324:	aa1403e0 	mov	x0, x20
  a82328:	9461e8b6 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a8232c:	aa1303e0 	mov	x0, x19
  a82330:	9461e8b4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82334:	a94153f3 	ldp	x19, x20, [sp,#16]
  a82338:	a9425bf5 	ldp	x21, x22, [sp,#32]
  a8233c:	a94363f7 	ldp	x23, x24, [sp,#48]
  a82340:	a8c77bfd 	ldp	x29, x30, [sp],#112
  a82344:	d65f03c0 	ret
  a82348:	b9400040 	ldr	w0, [x2]
  a8234c:	71000c1f 	cmp	w0, #0x3
  a82350:	540001a8 	b.hi	a82384 <_ZSt20__throw_bad_weak_ptrv@@Base+0x17776c>
  a82354:	f000e281 	adrp	x1, 26d5000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1121a8>
  a82358:	910ee021 	add	x1, x1, #0x3b8
  a8235c:	8b204020 	add	x0, x1, w0, uxtw
  a82360:	39420001 	ldrb	w1, [x0,#128]
  a82364:	f9401702 	ldr	x2, [x24,#40]
  a82368:	aa0203e0 	mov	x0, x2
  a8236c:	f9400042 	ldr	x2, [x2]
  a82370:	f9400c42 	ldr	x2, [x2,#24]
  a82374:	d63f0040 	blr	x2
  a82378:	a94363f7 	ldp	x23, x24, [sp,#48]
  a8237c:	a8c77bfd 	ldp	x29, x30, [sp],#112
  a82380:	d65f03c0 	ret
  a82384:	a9025bf5 	stp	x21, x22, [sp,#32]
  a82388:	910183f6 	add	x22, sp, #0x60
  a8238c:	aa1603e0 	mov	x0, x22
  a82390:	f000d9e1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a82394:	9136a021 	add	x1, x1, #0xda8
  a82398:	9462c652 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a8239c:	910163f5 	add	x21, sp, #0x58
  a823a0:	f000e281 	adrp	x1, 26d5000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1121a8>
  a823a4:	910ee021 	add	x1, x1, #0x3b8
  a823a8:	91022021 	add	x1, x1, #0x88
  a823ac:	aa1603e0 	mov	x0, x22
  a823b0:	aa1503e8 	mov	x8, x21
  a823b4:	9462460f 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a823b8:	a90153f3 	stp	x19, x20, [sp,#16]
  a823bc:	910143f4 	add	x20, sp, #0x50
  a823c0:	b000ea41 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a823c4:	aa1403e8 	mov	x8, x20
  a823c8:	91366021 	add	x1, x1, #0xd98
  a823cc:	aa1503e0 	mov	x0, x21
  a823d0:	94624608 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a823d4:	9101a3f7 	add	x23, sp, #0x68
  a823d8:	b000e081 	adrp	x1, 2693000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xd01a8>
  a823dc:	aa1703e0 	mov	x0, x23
  a823e0:	913dc021 	add	x1, x1, #0xf70
  a823e4:	9462c63f 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a823e8:	910123f3 	add	x19, sp, #0x48
  a823ec:	aa1703e1 	mov	x1, x23
  a823f0:	aa1303e8 	mov	x8, x19
  a823f4:	aa1403e0 	mov	x0, x20
  a823f8:	946245a6 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a823fc:	52800022 	mov	w2, #0x1                   	// #1
  a82400:	52800001 	mov	w1, #0x0                   	// #0
  a82404:	aa1303e0 	mov	x0, x19
  a82408:	945df7f6 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a8240c:	aa1303e0 	mov	x0, x19
  a82410:	9461e87c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82414:	aa1703e0 	mov	x0, x23
  a82418:	9461e87a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a8241c:	aa1403e0 	mov	x0, x20
  a82420:	9461e878 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82424:	aa1503e0 	mov	x0, x21
  a82428:	9461e876 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a8242c:	aa1603e0 	mov	x0, x22
  a82430:	9461e874 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82434:	52800001 	mov	w1, #0x0                   	// #0
  a82438:	a94153f3 	ldp	x19, x20, [sp,#16]
  a8243c:	a9425bf5 	ldp	x21, x22, [sp,#32]
  a82440:	17ffffc9 	b	a82364 <_ZSt20__throw_bad_weak_ptrv@@Base+0x17774c>
  a82444:	a90153f3 	stp	x19, x20, [sp,#16]
  a82448:	910123f3 	add	x19, sp, #0x48
  a8244c:	aa1303e0 	mov	x0, x19
  a82450:	f000d9e1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a82454:	910143f4 	add	x20, sp, #0x50
  a82458:	9136a021 	add	x1, x1, #0xda8
  a8245c:	9462c621 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a82460:	f000e281 	adrp	x1, 26d5000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1121a8>
  a82464:	aa1303e0 	mov	x0, x19
  a82468:	aa1403e8 	mov	x8, x20
  a8246c:	910ee021 	add	x1, x1, #0x3b8
  a82470:	946245e0 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a82474:	a9025bf5 	stp	x21, x22, [sp,#32]
  a82478:	910163f5 	add	x21, sp, #0x58
  a8247c:	b000ea41 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a82480:	aa1503e8 	mov	x8, x21
  a82484:	91366021 	add	x1, x1, #0xd98
  a82488:	aa1403e0 	mov	x0, x20
  a8248c:	946245d9 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a82490:	910183f6 	add	x22, sp, #0x60
  a82494:	9000e2a1 	adrp	x1, 26d6000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1131a8>
  a82498:	aa1603e0 	mov	x0, x22
  a8249c:	9103a021 	add	x1, x1, #0xe8
  a824a0:	9462c610 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a824a4:	9101a3f7 	add	x23, sp, #0x68
  a824a8:	aa1603e1 	mov	x1, x22
  a824ac:	aa1703e8 	mov	x8, x23
  a824b0:	aa1503e0 	mov	x0, x21
  a824b4:	94624577 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a824b8:	52800022 	mov	w2, #0x1                   	// #1
  a824bc:	52800001 	mov	w1, #0x0                   	// #0
  a824c0:	aa1703e0 	mov	x0, x23
  a824c4:	945df7c7 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a824c8:	17ffff91 	b	a8230c <_ZSt20__throw_bad_weak_ptrv@@Base+0x1776f4>
  a824cc:	a90153f3 	stp	x19, x20, [sp,#16]
  a824d0:	aa0003f3 	mov	x19, x0
  a824d4:	aa1603e0 	mov	x0, x22
  a824d8:	9461e84a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a824dc:	aa1303e0 	mov	x0, x19
  a824e0:	97e68a0c 	bl	424d10 <_Unwind_Resume@plt>
  a824e4:	aa0003f5 	mov	x21, x0
  a824e8:	aa1403e0 	mov	x0, x20
  a824ec:	9461e845 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a824f0:	aa1303e0 	mov	x0, x19
  a824f4:	9461e843 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a824f8:	aa1503e0 	mov	x0, x21
  a824fc:	97e68a05 	bl	424d10 <_Unwind_Resume@plt>
  a82500:	aa0003f7 	mov	x23, x0
  a82504:	aa1503e0 	mov	x0, x21
  a82508:	aa1703f5 	mov	x21, x23
  a8250c:	9461e83d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82510:	17fffff6 	b	a824e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1778d0>
  a82514:	aa0003f7 	mov	x23, x0
  a82518:	14000005 	b	a8252c <_ZSt20__throw_bad_weak_ptrv@@Base+0x177914>
  a8251c:	aa0003e1 	mov	x1, x0
  a82520:	aa1703e0 	mov	x0, x23
  a82524:	aa0103f7 	mov	x23, x1
  a82528:	9461e836 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a8252c:	aa1603e0 	mov	x0, x22
  a82530:	9461e834 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82534:	17fffff4 	b	a82504 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1778ec>
  a82538:	a9025bf5 	stp	x21, x22, [sp,#32]
  a8253c:	aa0003f5 	mov	x21, x0
  a82540:	17ffffec 	b	a824f0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1778d8>
  a82544:	17fffff6 	b	a8251c <_ZSt20__throw_bad_weak_ptrv@@Base+0x177904>
  a82548:	aa0003f7 	mov	x23, x0
  a8254c:	17fffff8 	b	a8252c <_ZSt20__throw_bad_weak_ptrv@@Base+0x177914>
  a82550:	aa0003f7 	mov	x23, x0
  a82554:	17ffffec 	b	a82504 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1778ec>
  a82558:	aa0003f5 	mov	x21, x0
  a8255c:	17ffffe3 	b	a824e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1778d0>
  a82560:	17fffff6 	b	a82538 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177920>
  a82564:	aa0003e1 	mov	x1, x0
  a82568:	aa1303e0 	mov	x0, x19
  a8256c:	aa0103f3 	mov	x19, x1
  a82570:	9461e824 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82574:	aa1703e0 	mov	x0, x23
  a82578:	9461e822 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a8257c:	aa1403e0 	mov	x0, x20
  a82580:	9461e820 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82584:	aa1503e0 	mov	x0, x21
  a82588:	9461e81e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a8258c:	17ffffd2 	b	a824d4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1778bc>
  a82590:	aa0003f3 	mov	x19, x0
  a82594:	17fffff8 	b	a82574 <_ZSt20__throw_bad_weak_ptrv@@Base+0x17795c>
  a82598:	aa0003f3 	mov	x19, x0
  a8259c:	17fffff8 	b	a8257c <_ZSt20__throw_bad_weak_ptrv@@Base+0x177964>
  a825a0:	aa0003f3 	mov	x19, x0
  a825a4:	17fffff8 	b	a82584 <_ZSt20__throw_bad_weak_ptrv@@Base+0x17796c>
  a825a8:	d1006000 	sub	x0, x0, #0x18
  a825ac:	17ffff2d 	b	a82260 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177648>
  a825b0:	a9b97bfd 	stp	x29, x30, [sp,#-112]!
  a825b4:	910003fd 	mov	x29, sp
  a825b8:	a90363f7 	stp	x23, x24, [sp,#48]
  a825bc:	aa0003f8 	mov	x24, x0
  a825c0:	f9401800 	ldr	x0, [x0,#48]
  a825c4:	b4000f00 	cbz	x0, a827a4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177b8c>
  a825c8:	f9400021 	ldr	x1, [x1]
  a825cc:	f9401000 	ldr	x0, [x0,#32]
  a825d0:	eb01001f 	cmp	x0, x1
  a825d4:	54000640 	b.eq	a8269c <_ZSt20__throw_bad_weak_ptrv@@Base+0x177a84>
  a825d8:	a90153f3 	stp	x19, x20, [sp,#16]
  a825dc:	910123f3 	add	x19, sp, #0x48
  a825e0:	aa1303e0 	mov	x0, x19
  a825e4:	f000d9e1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a825e8:	9136a021 	add	x1, x1, #0xda8
  a825ec:	9462c5bd 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a825f0:	910143f4 	add	x20, sp, #0x50
  a825f4:	f000e281 	adrp	x1, 26d5000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1121a8>
  a825f8:	910ee021 	add	x1, x1, #0x3b8
  a825fc:	91044021 	add	x1, x1, #0x110
  a82600:	aa1303e0 	mov	x0, x19
  a82604:	aa1403e8 	mov	x8, x20
  a82608:	9462457a 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a8260c:	a9025bf5 	stp	x21, x22, [sp,#32]
  a82610:	910163f5 	add	x21, sp, #0x58
  a82614:	b000ea41 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a82618:	aa1503e8 	mov	x8, x21
  a8261c:	91366021 	add	x1, x1, #0xd98
  a82620:	aa1403e0 	mov	x0, x20
  a82624:	94624573 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a82628:	910183f6 	add	x22, sp, #0x60
  a8262c:	9000e2a1 	adrp	x1, 26d6000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1131a8>
  a82630:	aa1603e0 	mov	x0, x22
  a82634:	91052021 	add	x1, x1, #0x148
  a82638:	9462c5aa 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a8263c:	9101a3f7 	add	x23, sp, #0x68
  a82640:	aa1603e1 	mov	x1, x22
  a82644:	aa1703e8 	mov	x8, x23
  a82648:	aa1503e0 	mov	x0, x21
  a8264c:	94624511 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a82650:	52800022 	mov	w2, #0x1                   	// #1
  a82654:	52800001 	mov	w1, #0x0                   	// #0
  a82658:	aa1703e0 	mov	x0, x23
  a8265c:	945df761 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a82660:	aa1703e0 	mov	x0, x23
  a82664:	9461e7e7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82668:	aa1603e0 	mov	x0, x22
  a8266c:	9461e7e5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82670:	aa1503e0 	mov	x0, x21
  a82674:	9461e7e3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82678:	aa1403e0 	mov	x0, x20
  a8267c:	9461e7e1 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82680:	aa1303e0 	mov	x0, x19
  a82684:	9461e7df 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82688:	a94153f3 	ldp	x19, x20, [sp,#16]
  a8268c:	a9425bf5 	ldp	x21, x22, [sp,#32]
  a82690:	a94363f7 	ldp	x23, x24, [sp,#48]
  a82694:	a8c77bfd 	ldp	x29, x30, [sp],#112
  a82698:	d65f03c0 	ret
  a8269c:	b9400041 	ldr	w1, [x2]
  a826a0:	34000741 	cbz	w1, a82788 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177b70>
  a826a4:	7100043f 	cmp	w1, #0x1
  a826a8:	54000600 	b.eq	a82768 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177b50>
  a826ac:	a9025bf5 	stp	x21, x22, [sp,#32]
  a826b0:	910183f6 	add	x22, sp, #0x60
  a826b4:	aa1603e0 	mov	x0, x22
  a826b8:	f000d9e1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a826bc:	9136a021 	add	x1, x1, #0xda8
  a826c0:	9462c588 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a826c4:	910163f5 	add	x21, sp, #0x58
  a826c8:	f000e281 	adrp	x1, 26d5000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1121a8>
  a826cc:	910ee021 	add	x1, x1, #0x3b8
  a826d0:	91066021 	add	x1, x1, #0x198
  a826d4:	aa1603e0 	mov	x0, x22
  a826d8:	aa1503e8 	mov	x8, x21
  a826dc:	94624545 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a826e0:	a90153f3 	stp	x19, x20, [sp,#16]
  a826e4:	910143f4 	add	x20, sp, #0x50
  a826e8:	b000ea41 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a826ec:	aa1403e8 	mov	x8, x20
  a826f0:	91366021 	add	x1, x1, #0xd98
  a826f4:	aa1503e0 	mov	x0, x21
  a826f8:	9462453e 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a826fc:	9101a3f7 	add	x23, sp, #0x68
  a82700:	b000e081 	adrp	x1, 2693000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xd01a8>
  a82704:	aa1703e0 	mov	x0, x23
  a82708:	913dc021 	add	x1, x1, #0xf70
  a8270c:	9462c575 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a82710:	910123f3 	add	x19, sp, #0x48
  a82714:	aa1703e1 	mov	x1, x23
  a82718:	aa1303e8 	mov	x8, x19
  a8271c:	aa1403e0 	mov	x0, x20
  a82720:	946244dc 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a82724:	52800022 	mov	w2, #0x1                   	// #1
  a82728:	52800001 	mov	w1, #0x0                   	// #0
  a8272c:	aa1303e0 	mov	x0, x19
  a82730:	945df72c 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a82734:	aa1303e0 	mov	x0, x19
  a82738:	9461e7b2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a8273c:	aa1703e0 	mov	x0, x23
  a82740:	9461e7b0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82744:	aa1403e0 	mov	x0, x20
  a82748:	9461e7ae 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a8274c:	aa1503e0 	mov	x0, x21
  a82750:	9461e7ac 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82754:	aa1603e0 	mov	x0, x22
  a82758:	9461e7aa 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a8275c:	a94153f3 	ldp	x19, x20, [sp,#16]
  a82760:	52800001 	mov	w1, #0x0                   	// #0
  a82764:	a9425bf5 	ldp	x21, x22, [sp,#32]
  a82768:	f9401702 	ldr	x2, [x24,#40]
  a8276c:	aa0203e0 	mov	x0, x2
  a82770:	f9400042 	ldr	x2, [x2]
  a82774:	f9400842 	ldr	x2, [x2,#16]
  a82778:	d63f0040 	blr	x2
  a8277c:	a94363f7 	ldp	x23, x24, [sp,#48]
  a82780:	a8c77bfd 	ldp	x29, x30, [sp],#112
  a82784:	d65f03c0 	ret
  a82788:	f9401702 	ldr	x2, [x24,#40]
  a8278c:	52800001 	mov	w1, #0x0                   	// #0
  a82790:	aa0203e0 	mov	x0, x2
  a82794:	f9400042 	ldr	x2, [x2]
  a82798:	f9400842 	ldr	x2, [x2,#16]
  a8279c:	d63f0040 	blr	x2
  a827a0:	17fffff7 	b	a8277c <_ZSt20__throw_bad_weak_ptrv@@Base+0x177b64>
  a827a4:	a90153f3 	stp	x19, x20, [sp,#16]
  a827a8:	910123f3 	add	x19, sp, #0x48
  a827ac:	aa1303e0 	mov	x0, x19
  a827b0:	f000d9e1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a827b4:	9136a021 	add	x1, x1, #0xda8
  a827b8:	9462c54a 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a827bc:	910143f4 	add	x20, sp, #0x50
  a827c0:	f000e281 	adrp	x1, 26d5000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1121a8>
  a827c4:	910ee021 	add	x1, x1, #0x3b8
  a827c8:	91044021 	add	x1, x1, #0x110
  a827cc:	aa1303e0 	mov	x0, x19
  a827d0:	aa1403e8 	mov	x8, x20
  a827d4:	94624507 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a827d8:	a9025bf5 	stp	x21, x22, [sp,#32]
  a827dc:	910163f5 	add	x21, sp, #0x58
  a827e0:	b000ea41 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a827e4:	aa1503e8 	mov	x8, x21
  a827e8:	91366021 	add	x1, x1, #0xd98
  a827ec:	aa1403e0 	mov	x0, x20
  a827f0:	94624500 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a827f4:	910183f6 	add	x22, sp, #0x60
  a827f8:	9000e2a1 	adrp	x1, 26d6000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1131a8>
  a827fc:	aa1603e0 	mov	x0, x22
  a82800:	9104a021 	add	x1, x1, #0x128
  a82804:	9462c537 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a82808:	9101a3f7 	add	x23, sp, #0x68
  a8280c:	aa1603e1 	mov	x1, x22
  a82810:	aa1703e8 	mov	x8, x23
  a82814:	aa1503e0 	mov	x0, x21
  a82818:	9462449e 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a8281c:	52800022 	mov	w2, #0x1                   	// #1
  a82820:	52800001 	mov	w1, #0x0                   	// #0
  a82824:	aa1703e0 	mov	x0, x23
  a82828:	945df6ee 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a8282c:	17ffff8d 	b	a82660 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177a48>
  a82830:	a9025bf5 	stp	x21, x22, [sp,#32]
  a82834:	aa0003f5 	mov	x21, x0
  a82838:	aa1303e0 	mov	x0, x19
  a8283c:	9461e771 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82840:	aa1503e0 	mov	x0, x21
  a82844:	97e68933 	bl	424d10 <_Unwind_Resume@plt>
  a82848:	a90153f3 	stp	x19, x20, [sp,#16]
  a8284c:	aa0003f3 	mov	x19, x0
  a82850:	aa1603e0 	mov	x0, x22
  a82854:	9461e76b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82858:	aa1303e0 	mov	x0, x19
  a8285c:	97e6892d 	bl	424d10 <_Unwind_Resume@plt>
  a82860:	aa0003f3 	mov	x19, x0
  a82864:	aa1503e0 	mov	x0, x21
  a82868:	9461e766 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a8286c:	17fffff9 	b	a82850 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177c38>
  a82870:	aa0003f3 	mov	x19, x0
  a82874:	aa1403e0 	mov	x0, x20
  a82878:	9461e762 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a8287c:	17fffffa 	b	a82864 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177c4c>
  a82880:	aa0003f3 	mov	x19, x0
  a82884:	aa1703e0 	mov	x0, x23
  a82888:	9461e75e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a8288c:	17fffffa 	b	a82874 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177c5c>
  a82890:	17ffffe8 	b	a82830 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177c18>
  a82894:	aa0003f5 	mov	x21, x0
  a82898:	1400000f 	b	a828d4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177cbc>
  a8289c:	aa0003e1 	mov	x1, x0
  a828a0:	aa1303e0 	mov	x0, x19
  a828a4:	aa0103f3 	mov	x19, x1
  a828a8:	9461e756 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a828ac:	17fffff6 	b	a82884 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177c6c>
  a828b0:	aa0003e1 	mov	x1, x0
  a828b4:	aa1703e0 	mov	x0, x23
  a828b8:	aa0103f7 	mov	x23, x1
  a828bc:	9461e751 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a828c0:	aa1603e0 	mov	x0, x22
  a828c4:	9461e74f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a828c8:	aa1503e0 	mov	x0, x21
  a828cc:	aa1703f5 	mov	x21, x23
  a828d0:	9461e74c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a828d4:	aa1403e0 	mov	x0, x20
  a828d8:	9461e74a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a828dc:	17ffffd7 	b	a82838 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177c20>
  a828e0:	aa0003f7 	mov	x23, x0
  a828e4:	17fffff7 	b	a828c0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177ca8>
  a828e8:	aa0003f7 	mov	x23, x0
  a828ec:	17fffff7 	b	a828c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177cb0>
  a828f0:	aa0003f5 	mov	x21, x0
  a828f4:	17fffff8 	b	a828d4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177cbc>
  a828f8:	aa0003f7 	mov	x23, x0
  a828fc:	17fffff3 	b	a828c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177cb0>
  a82900:	aa0003f7 	mov	x23, x0
  a82904:	17ffffef 	b	a828c0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177ca8>
  a82908:	17ffffea 	b	a828b0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177c98>
  a8290c:	d503201f 	nop
  a82910:	d1002000 	sub	x0, x0, #0x8
  a82914:	17ffff27 	b	a825b0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177998>
  a82918:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
  a8291c:	d2800700 	mov	x0, #0x38                  	// #56
  a82920:	910003fd 	mov	x29, sp
  a82924:	f9000bf3 	str	x19, [sp,#16]
