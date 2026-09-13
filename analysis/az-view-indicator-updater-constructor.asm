
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000204d260 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d3d8>:
 204d260:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
 204d264:	910003fd 	mov	x29, sp
 204d268:	a9025bf5 	stp	x21, x22, [sp,#32]
 204d26c:	aa0003f5 	mov	x21, x0
 204d270:	b0006df6 	adrp	x22, 2e0a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8471a8>
 204d274:	a90153f3 	stp	x19, x20, [sp,#16]
 204d278:	91004014 	add	x20, x0, #0x10
 204d27c:	d2800100 	mov	x0, #0x8                   	// #8
 204d280:	a90363f7 	stp	x23, x24, [sp,#48]
 204d284:	aa0303f7 	mov	x23, x3
 204d288:	12001c98 	and	w24, w4, #0xff
 204d28c:	a9046bf9 	stp	x25, x26, [sp,#64]
 204d290:	aa0203f9 	mov	x25, x2
 204d294:	911042d6 	add	x22, x22, #0x410
 204d298:	f90037e1 	str	x1, [sp,#104]
 204d29c:	b9007fff 	str	wzr, [sp,#124]
 204d2a0:	978f5ea8 	bl	424d40 <_Znwm@plt>
 204d2a4:	aa0003f3 	mov	x19, x0
 204d2a8:	a9007eb6 	stp	x22, xzr, [x21]
 204d2ac:	d2800100 	mov	x0, #0x8                   	// #8
 204d2b0:	f94037e1 	ldr	x1, [sp,#104]
 204d2b4:	f9000abf 	str	xzr, [x21,#16]
 204d2b8:	f9000261 	str	x1, [x19]
 204d2bc:	a900fe9f 	stp	xzr, xzr, [x20,#8]
 204d2c0:	978f5ea0 	bl	424d40 <_Znwm@plt>
 204d2c4:	a90573fb 	stp	x27, x28, [sp,#80]
 204d2c8:	91002002 	add	x2, x0, #0x8
 204d2cc:	f9000aa0 	str	x0, [x21,#16]
 204d2d0:	f9400261 	ldr	x1, [x19]
 204d2d4:	a9008a82 	stp	x2, x2, [x20,#8]
 204d2d8:	f9000001 	str	x1, [x0]
 204d2dc:	f90006a1 	str	x1, [x21,#8]
 204d2e0:	b4000d41 	cbz	x1, 204d488 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d600>
 204d2e4:	aa1303e0 	mov	x0, x19
 204d2e8:	978f5eda 	bl	424e50 <_ZdlPv@plt>
 204d2ec:	a9416ab3 	ldp	x19, x26, [x21,#16]
 204d2f0:	eb1a027f 	cmp	x19, x26
 204d2f4:	54000760 	b.eq	204d3e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d558>
 204d2f8:	b0006de2 	adrp	x2, 2e0a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8471a8>
 204d2fc:	91114042 	add	x2, x2, #0x450
 204d300:	9106c054 	add	x20, x2, #0x1b0
 204d304:	1400000b 	b	204d330 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d4a8>
 204d308:	91002361 	add	x1, x27, #0x8
 204d30c:	885ffc20 	ldaxr	w0, [x1]
 204d310:	51000402 	sub	w2, w0, #0x1
 204d314:	8803fc22 	stlxr	w3, w2, [x1]
 204d318:	35ffffa3 	cbnz	w3, 204d30c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d484>
 204d31c:	7100041f 	cmp	w0, #0x1
 204d320:	540002a0 	b.eq	204d374 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d4ec>
 204d324:	91002273 	add	x19, x19, #0x8
 204d328:	eb13035f 	cmp	x26, x19
 204d32c:	540005a0 	b.eq	204d3e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d558>
 204d330:	f9400260 	ldr	x0, [x19]
 204d334:	b4ffff80 	cbz	x0, 204d324 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d49c>
 204d338:	910203e3 	add	x3, sp, #0x80
 204d33c:	aa1403e2 	mov	x2, x20
 204d340:	9101f3e1 	add	x1, sp, #0x7c
 204d344:	a9087fff 	stp	xzr, xzr, [sp,#128]
 204d348:	9400b410 	bl	207a388 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87a500>
 204d34c:	f94047fb 	ldr	x27, [sp,#136]
 204d350:	b4fffebb 	cbz	x27, 204d324 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d49c>
 204d354:	b0006de0 	adrp	x0, 2e0a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8471a8>
 204d358:	f943041c 	ldr	x28, [x0,#1544]
 204d35c:	b5fffd7c 	cbnz	x28, 204d308 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d480>
 204d360:	b9400b60 	ldr	w0, [x27,#8]
 204d364:	51000401 	sub	w1, w0, #0x1
 204d368:	b9000b61 	str	w1, [x27,#8]
 204d36c:	7100041f 	cmp	w0, #0x1
 204d370:	54fffda1 	b.ne	204d324 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d49c>
 204d374:	f9400361 	ldr	x1, [x27]
 204d378:	f0ff45e0 	adrp	x0, 90c000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x13e8>
 204d37c:	911cc000 	add	x0, x0, #0x730
 204d380:	f9400821 	ldr	x1, [x1,#16]
 204d384:	eb00003f 	cmp	x1, x0
 204d388:	54000901 	b.ne	204d4a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d620>
 204d38c:	b400087c 	cbz	x28, 204d498 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d610>
 204d390:	91003361 	add	x1, x27, #0xc
 204d394:	885ffc20 	ldaxr	w0, [x1]
 204d398:	51000402 	sub	w2, w0, #0x1
 204d39c:	8803fc22 	stlxr	w3, w2, [x1]
 204d3a0:	35ffffa3 	cbnz	w3, 204d394 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d50c>
 204d3a4:	7100041f 	cmp	w0, #0x1
 204d3a8:	54fffbe1 	b.ne	204d324 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d49c>
 204d3ac:	f9400361 	ldr	x1, [x27]
 204d3b0:	f0ff45e0 	adrp	x0, 90c000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x13e8>
 204d3b4:	911ce000 	add	x0, x0, #0x738
 204d3b8:	f9400c22 	ldr	x2, [x1,#24]
 204d3bc:	eb00005f 	cmp	x2, x0
 204d3c0:	540007c1 	b.ne	204d4b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d630>
 204d3c4:	f9400421 	ldr	x1, [x1,#8]
 204d3c8:	aa1b03e0 	mov	x0, x27
 204d3cc:	91002273 	add	x19, x19, #0x8
 204d3d0:	d63f0020 	blr	x1
 204d3d4:	eb13035f 	cmp	x26, x19
 204d3d8:	54fffac1 	b.ne	204d330 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d4a8>
 204d3dc:	d503201f 	nop
 204d3e0:	aa1503f4 	mov	x20, x21
 204d3e4:	b0006de0 	adrp	x0, 2e0a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8471a8>
 204d3e8:	9110e000 	add	x0, x0, #0x438
 204d3ec:	910122ba 	add	x26, x21, #0x48
 204d3f0:	f94006e1 	ldr	x1, [x23,#8]
 204d3f4:	f8028680 	str	x0, [x20],#40
 204d3f8:	a902febf 	stp	xzr, xzr, [x21,#40]
 204d3fc:	f9400320 	ldr	x0, [x25]
 204d400:	f9000a9f 	str	xzr, [x20,#16]
 204d404:	390102b8 	strb	w24, [x21,#64]
 204d408:	f94002f3 	ldr	x19, [x23]
 204d40c:	a90482bf 	stp	xzr, x0, [x21,#72]
 204d410:	8b010e77 	add	x23, x19, x1, lsl #3
 204d414:	eb17027f 	cmp	x19, x23
 204d418:	540002a0 	b.eq	204d46c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d5e4>
 204d41c:	d2800001 	mov	x1, #0x0                   	// #0
 204d420:	d2800000 	mov	x0, #0x0                   	// #0
 204d424:	1400000a 	b	204d44c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d5c4>
 204d428:	aa1303e1 	mov	x1, x19
 204d42c:	940b03ed 	bl	230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862c8>
 204d430:	f9400680 	ldr	x0, [x20,#8]
 204d434:	91002273 	add	x19, x19, #0x8
 204d438:	eb1302ff 	cmp	x23, x19
 204d43c:	91002000 	add	x0, x0, #0x8
 204d440:	f9000680 	str	x0, [x20,#8]
 204d444:	54000140 	b.eq	204d46c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d5e4>
 204d448:	a9408680 	ldp	x0, x1, [x20,#8]
 204d44c:	eb00003f 	cmp	x1, x0
 204d450:	54fffec1 	b.ne	204d428 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d5a0>
 204d454:	aa1303e2 	mov	x2, x19
 204d458:	aa1403e0 	mov	x0, x20
 204d45c:	940000a7 	bl	204d6f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d870>
 204d460:	91002273 	add	x19, x19, #0x8
 204d464:	eb1302ff 	cmp	x23, x19
 204d468:	54ffff01 	b.ne	204d448 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d5c0>
 204d46c:	a94153f3 	ldp	x19, x20, [sp,#16]
 204d470:	a9425bf5 	ldp	x21, x22, [sp,#32]
 204d474:	a94363f7 	ldp	x23, x24, [sp,#48]
 204d478:	a9446bf9 	ldp	x25, x26, [sp,#64]
 204d47c:	a94573fb 	ldp	x27, x28, [sp,#80]
 204d480:	a8c97bfd 	ldp	x29, x30, [sp],#144
 204d484:	d65f03c0 	ret
 204d488:	d2800001 	mov	x1, #0x0                   	// #0
 204d48c:	52800000 	mov	w0, #0x0                   	// #0
 204d490:	9406cc8c 	bl	22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x785a8>
 204d494:	17ffff94 	b	204d2e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d45c>
 204d498:	b9400f60 	ldr	w0, [x27,#12]
 204d49c:	51000401 	sub	w1, w0, #0x1
 204d4a0:	b9000f61 	str	w1, [x27,#12]
 204d4a4:	17ffffc0 	b	204d3a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d51c>
 204d4a8:	aa1b03e0 	mov	x0, x27
 204d4ac:	d63f0020 	blr	x1
 204d4b0:	b5fff71c 	cbnz	x28, 204d390 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d508>
 204d4b4:	17fffff9 	b	204d498 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d610>
 204d4b8:	aa1b03e0 	mov	x0, x27
 204d4bc:	d63f0040 	blr	x2
 204d4c0:	17ffff99 	b	204d324 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d49c>
 204d4c4:	f94047e1 	ldr	x1, [sp,#136]
 204d4c8:	aa0003f3 	mov	x19, x0
 204d4cc:	b4000061 	cbz	x1, 204d4d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d650>
 204d4d0:	aa0103e0 	mov	x0, x1
 204d4d4:	97989b81 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 204d4d8:	f9400aa0 	ldr	x0, [x21,#16]
 204d4dc:	f90002b6 	str	x22, [x21]
 204d4e0:	b4000040 	cbz	x0, 204d4e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d660>
 204d4e4:	978f5e5b 	bl	424e50 <_ZdlPv@plt>
 204d4e8:	aa1303e0 	mov	x0, x19
 204d4ec:	978f5e09 	bl	424d10 <_Unwind_Resume@plt>
 204d4f0:	aa0003f4 	mov	x20, x0
 204d4f4:	a90573fb 	stp	x27, x28, [sp,#80]
 204d4f8:	14000016 	b	204d550 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d6c8>
 204d4fc:	aa0003f7 	mov	x23, x0
 204d500:	aa1a03e0 	mov	x0, x26
 204d504:	97e4d3af 	bl	19823c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x182538>
 204d508:	f9400694 	ldr	x20, [x20,#8]
 204d50c:	f94016b3 	ldr	x19, [x21,#40]
 204d510:	eb13029f 	cmp	x20, x19
 204d514:	54000261 	b.ne	204d560 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d6d8>
 204d518:	f94016a0 	ldr	x0, [x21,#40]
 204d51c:	b4000040 	cbz	x0, 204d524 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d69c>
 204d520:	978f5e4c 	bl	424e50 <_ZdlPv@plt>
 204d524:	f9400aa0 	ldr	x0, [x21,#16]
 204d528:	f90002b6 	str	x22, [x21]
 204d52c:	b4000040 	cbz	x0, 204d534 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d6ac>
 204d530:	978f5e48 	bl	424e50 <_ZdlPv@plt>
 204d534:	aa1703e0 	mov	x0, x23
 204d538:	978f5df6 	bl	424d10 <_Unwind_Resume@plt>
 204d53c:	f9400aa1 	ldr	x1, [x21,#16]
 204d540:	aa0003f4 	mov	x20, x0
 204d544:	b4000061 	cbz	x1, 204d550 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d6c8>
 204d548:	aa0103e0 	mov	x0, x1
 204d54c:	978f5e41 	bl	424e50 <_ZdlPv@plt>
 204d550:	aa1303e0 	mov	x0, x19
 204d554:	978f5e3f 	bl	424e50 <_ZdlPv@plt>
 204d558:	aa1403e0 	mov	x0, x20
 204d55c:	978f5ded 	bl	424d10 <_Unwind_Resume@plt>
 204d560:	aa1303e0 	mov	x0, x19
 204d564:	91002273 	add	x19, x19, #0x8
 204d568:	940abc8a 	bl	22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x174678>
 204d56c:	17ffffe9 	b	204d510 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d688>
