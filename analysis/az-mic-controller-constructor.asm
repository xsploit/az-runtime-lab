
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000019eb290 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb408>:
 19eb290:	b9000e81 	str	w1, [x20,#12]
 19eb294:	17fffff2 	b	19eb25c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb3d4>
 19eb298:	a9ae7bfd 	stp	x29, x30, [sp,#-288]!
 19eb29c:	910003fd 	mov	x29, sp
 19eb2a0:	a90153f3 	stp	x19, x20, [sp,#16]
 19eb2a4:	aa0003f3 	mov	x19, x0
 19eb2a8:	f0008020 	adrp	x0, 29f2000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x42f1a8>
 19eb2ac:	910a0000 	add	x0, x0, #0x280
 19eb2b0:	a9025bf5 	stp	x21, x22, [sp,#32]
 19eb2b4:	f0010b14 	adrp	x20, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
 19eb2b8:	a90573fb 	stp	x27, x28, [sp,#80]
 19eb2bc:	aa0103f6 	mov	x22, x1
 19eb2c0:	91106294 	add	x20, x20, #0x418
 19eb2c4:	f9000260 	str	x0, [x19]
 19eb2c8:	08dffe80 	ldarb	w0, [x20]
 19eb2cc:	f0010b15 	adrp	x21, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
 19eb2d0:	36003460 	tbz	w0, #0, 19eb95c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebad4>
 19eb2d4:	b94422a2 	ldr	w2, [x21,#1056]
 19eb2d8:	f0008021 	adrp	x1, 29f2000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x42f1a8>
 19eb2dc:	910b0021 	add	x1, x1, #0x2c0
 19eb2e0:	f0008020 	adrp	x0, 29f2000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x42f1a8>
 19eb2e4:	910c2000 	add	x0, x0, #0x308
 19eb2e8:	a9000261 	stp	x1, x0, [x19]
 19eb2ec:	90008040 	adrp	x0, 29f3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x4301a8>
 19eb2f0:	b9001262 	str	w2, [x19,#16]
 19eb2f4:	91025c00 	add	x0, x0, #0x97
 19eb2f8:	91006274 	add	x20, x19, #0x18
 19eb2fc:	97fffc4d 	bl	19ea430 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ea5a8>
 19eb300:	8b001004 	add	x4, x0, x0, lsl #4
 19eb304:	d2801662 	mov	x2, #0xb3                  	// #179
 19eb308:	d28d1443 	mov	x3, #0x68a2                	// #26786
 19eb30c:	8b040c04 	add	x4, x0, x4, lsl #3
 19eb310:	f2f12002 	movk	x2, #0x8900, lsl #48
 19eb314:	9101a085 	add	x5, x4, #0x68
 19eb318:	f2a7f103 	movk	x3, #0x3f88, lsl #16
 19eb31c:	f2cbadc3 	movk	x3, #0x5d6e, lsl #32
 19eb320:	aa1403e0 	mov	x0, x20
 19eb324:	f2e03bc3 	movk	x3, #0x1de, lsl #48
 19eb328:	52800021 	mov	w1, #0x1                   	// #1
 19eb32c:	9bc27ca4 	umulh	x4, x5, x2
 19eb330:	d378fc84 	lsr	x4, x4, #56
 19eb334:	9b039484 	msub	x4, x4, x3, x5
 19eb338:	8b041085 	add	x5, x4, x4, lsl #4
 19eb33c:	8b050c84 	add	x4, x4, x5, lsl #3
 19eb340:	91014c85 	add	x5, x4, #0x53
 19eb344:	9bc27ca4 	umulh	x4, x5, x2
 19eb348:	d378fc84 	lsr	x4, x4, #56
 19eb34c:	9b039484 	msub	x4, x4, x3, x5
 19eb350:	8b041085 	add	x5, x4, x4, lsl #4
 19eb354:	8b050c84 	add	x4, x4, x5, lsl #3
 19eb358:	9100f885 	add	x5, x4, #0x3e
 19eb35c:	9bc27ca4 	umulh	x4, x5, x2
 19eb360:	d378fc84 	lsr	x4, x4, #56
 19eb364:	9b039484 	msub	x4, x4, x3, x5
 19eb368:	8b041085 	add	x5, x4, x4, lsl #4
 19eb36c:	8b050c84 	add	x4, x4, x5, lsl #3
 19eb370:	9100b485 	add	x5, x4, #0x2d
 19eb374:	9bc27ca4 	umulh	x4, x5, x2
 19eb378:	d378fc84 	lsr	x4, x4, #56
 19eb37c:	9b039484 	msub	x4, x4, x3, x5
 19eb380:	8b041085 	add	x5, x4, x4, lsl #4
 19eb384:	8b050c84 	add	x4, x4, x5, lsl #3
 19eb388:	91012485 	add	x5, x4, #0x49
 19eb38c:	9bc27ca4 	umulh	x4, x5, x2
 19eb390:	d378fc84 	lsr	x4, x4, #56
 19eb394:	9b039484 	msub	x4, x4, x3, x5
 19eb398:	8b041085 	add	x5, x4, x4, lsl #4
 19eb39c:	8b050c84 	add	x4, x4, x5, lsl #3
 19eb3a0:	91015485 	add	x5, x4, #0x55
 19eb3a4:	9bc27ca4 	umulh	x4, x5, x2
 19eb3a8:	d378fc84 	lsr	x4, x4, #56
 19eb3ac:	9b039484 	msub	x4, x4, x3, x5
 19eb3b0:	8b041085 	add	x5, x4, x4, lsl #4
 19eb3b4:	8b050c84 	add	x4, x4, x5, lsl #3
 19eb3b8:	91011c84 	add	x4, x4, #0x47
 19eb3bc:	9bc27c82 	umulh	x2, x4, x2
 19eb3c0:	d378fc42 	lsr	x2, x2, #56
 19eb3c4:	9b039042 	msub	x2, x2, x3, x4
 19eb3c8:	a9018a7f 	stp	xzr, x2, [x19,#24]
 19eb3cc:	97b4c989 	bl	71d9f0 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x24c48>
 19eb3d0:	f9400e61 	ldr	x1, [x19,#24]
 19eb3d4:	9100a268 	add	x8, x19, #0x28
 19eb3d8:	aa0103e0 	mov	x0, x1
 19eb3dc:	f9400021 	ldr	x1, [x1]
 19eb3e0:	f940a021 	ldr	x1, [x1,#320]
 19eb3e4:	d63f0020 	blr	x1
 19eb3e8:	a90363f7 	stp	x23, x24, [sp,#48]
 19eb3ec:	90005ef8 	adrp	x24, 25c7000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x41a8>
 19eb3f0:	910ca318 	add	x24, x24, #0x328
 19eb3f4:	a903e276 	stp	x22, x24, [x19,#56]
 19eb3f8:	d2800400 	mov	x0, #0x20                  	// #32
 19eb3fc:	97a8e651 	bl	424d40 <_Znwm@plt>
 19eb400:	0f000420 	movi	v0.2s, #0x1
 19eb404:	aa0003f5 	mov	x21, x0
 19eb408:	aa0003f6 	mov	x22, x0
 19eb40c:	a9046bf9 	stp	x25, x26, [sp,#64]
 19eb410:	90005ee0 	adrp	x0, 25c7000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x41a8>
 19eb414:	911c6000 	add	x0, x0, #0x718
 19eb418:	f0010ab7 	adrp	x23, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 19eb41c:	fd0006a0 	str	d0, [x21,#8]
 19eb420:	913862f7 	add	x23, x23, #0xe18
 19eb424:	f80106c0 	str	x0, [x22],#16
 19eb428:	f9000abf 	str	xzr, [x21,#16]
 19eb42c:	b9000adf 	str	wzr, [x22,#8]
 19eb430:	08dffee0 	ldarb	w0, [x23]
 19eb434:	f0010ab9 	adrp	x25, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 19eb438:	36002ec0 	tbz	w0, #0, 19eba10 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebb88>
 19eb43c:	b94e2322 	ldr	w2, [x25,#3616]
 19eb440:	9000a3e1 	adrp	x1, 2e67000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a41a8>
 19eb444:	91292021 	add	x1, x1, #0xa48
 19eb448:	9000a3e0 	adrp	x0, 2e67000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a41a8>
 19eb44c:	912fe000 	add	x0, x0, #0xbf8
 19eb450:	f9000aa1 	str	x1, [x21,#16]
 19eb454:	b9001aa2 	str	w2, [x21,#24]
 19eb458:	a9045a60 	stp	x0, x22, [x19,#64]
 19eb45c:	52800020 	mov	w0, #0x1                   	// #1
 19eb460:	a9057e75 	stp	x21, xzr, [x19,#80]
 19eb464:	f900327f 	str	xzr, [x19,#96]
 19eb468:	9420860e 	bl	220cca0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84b88>
 19eb46c:	52800021 	mov	w1, #0x1                   	// #1
 19eb470:	aa1403e0 	mov	x0, x20
 19eb474:	97b4c95f 	bl	71d9f0 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x24c48>
 19eb478:	72001c1f 	tst	w0, #0xff
 19eb47c:	540026a0 	b.eq	19eb950 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebac8>
 19eb480:	f9401675 	ldr	x21, [x19,#40]
 19eb484:	f9400ab7 	ldr	x23, [x21,#16]
 19eb488:	b4000a57 	cbz	x23, 19eb5d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb748>
 19eb48c:	910082b9 	add	x25, x21, #0x20
 19eb490:	d2800400 	mov	x0, #0x20                  	// #32
 19eb494:	97a8e62b 	bl	424d40 <_Znwm@plt>
 19eb498:	aa0003f6 	mov	x22, x0
 19eb49c:	b9402aa1 	ldr	w1, [x21,#40]
 19eb4a0:	d2800800 	mov	x0, #0x40                  	// #64
 19eb4a4:	b90002c1 	str	w1, [x22]
 19eb4a8:	97a8e6ca 	bl	424fd0 <malloc@plt>
 19eb4ac:	aa0003e2 	mov	x2, x0
 19eb4b0:	aa1603e1 	mov	x1, x22
 19eb4b4:	91002265 	add	x5, x19, #0x8
 19eb4b8:	52800104 	mov	w4, #0x8                   	// #8
 19eb4bc:	52800023 	mov	w3, #0x1                   	// #1
 19eb4c0:	f9000045 	str	x5, [x2]
 19eb4c4:	d2800400 	mov	x0, #0x20                  	// #32
 19eb4c8:	f8008c22 	str	x2, [x1,#8]!
 19eb4cc:	b9000824 	str	w4, [x1,#8]
 19eb4d0:	b9001023 	str	w3, [x1,#16]
 19eb4d4:	97a8e61b 	bl	424d40 <_Znwm@plt>
 19eb4d8:	aa0003f5 	mov	x21, x0
 19eb4dc:	b0006241 	adrp	x1, 2634000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x711a8>
 19eb4e0:	912b8021 	add	x1, x1, #0xae0
 19eb4e4:	d2800200 	mov	x0, #0x10                  	// #16
 19eb4e8:	f90002a1 	str	x1, [x21]
 19eb4ec:	b9000abf 	str	wzr, [x21,#8]
 19eb4f0:	a9015abf 	stp	xzr, x22, [x21,#16]
 19eb4f4:	97a8e613 	bl	424d40 <_Znwm@plt>
 19eb4f8:	f9400aa2 	ldr	x2, [x21,#16]
 19eb4fc:	f0006241 	adrp	x1, 2636000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x731a8>
 19eb500:	912e8021 	add	x1, x1, #0xba0
 19eb504:	a9005801 	stp	x1, x22, [x0]
 19eb508:	f9000aa0 	str	x0, [x21,#16]
 19eb50c:	b40000a2 	cbz	x2, 19eb520 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb698>
 19eb510:	f9400041 	ldr	x1, [x2]
 19eb514:	aa0203e0 	mov	x0, x2
 19eb518:	f9400421 	ldr	x1, [x1,#8]
 19eb51c:	d63f0020 	blr	x1
 19eb520:	910022b6 	add	x22, x21, #0x8
 19eb524:	885ffec0 	ldaxr	w0, [x22]
 19eb528:	11000400 	add	w0, w0, #0x1
 19eb52c:	8801fec0 	stlxr	w1, w0, [x22]
 19eb530:	35ffffa1 	cbnz	w1, 19eb524 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb69c>
 19eb534:	aa1903e1 	mov	x1, x25
 19eb538:	910263e0 	add	x0, sp, #0x98
 19eb53c:	f94006f9 	ldr	x25, [x23,#8]
 19eb540:	94248ba8 	bl	230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862c8>
 19eb544:	a90a57f7 	stp	x23, x21, [sp,#160]
 19eb548:	885ffec0 	ldaxr	w0, [x22]
 19eb54c:	11000400 	add	w0, w0, #0x1
 19eb550:	8801fec0 	stlxr	w1, w0, [x22]
 19eb554:	35ffffa1 	cbnz	w1, 19eb548 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb6c0>
 19eb558:	f9400321 	ldr	x1, [x25]
 19eb55c:	aa1903e0 	mov	x0, x25
 19eb560:	f9401421 	ldr	x1, [x1,#40]
 19eb564:	d63f0020 	blr	x1
 19eb568:	72001c1f 	tst	w0, #0xff
 19eb56c:	54001421 	b.ne	19eb7f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb968>
 19eb570:	f94053e0 	ldr	x0, [sp,#160]
 19eb574:	52800023 	mov	w3, #0x1                   	// #1
 19eb578:	910263e1 	add	x1, sp, #0x98
 19eb57c:	9102a3e2 	add	x2, sp, #0xa8
 19eb580:	97ba570e 	bl	8811b8 <_ZNSt5mutex4lockEv@@Base+0x4cf08>
 19eb584:	f94057e0 	ldr	x0, [sp,#168]
 19eb588:	b40000e0 	cbz	x0, 19eb5a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb71c>
 19eb58c:	91002001 	add	x1, x0, #0x8
 19eb590:	885ffc22 	ldaxr	w2, [x1]
 19eb594:	51000442 	sub	w2, w2, #0x1
 19eb598:	8803fc22 	stlxr	w3, w2, [x1]
 19eb59c:	35ffffa3 	cbnz	w3, 19eb590 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb708>
 19eb5a0:	34001f02 	cbz	w2, 19eb980 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebaf8>
 19eb5a4:	910263e0 	add	x0, sp, #0x98
 19eb5a8:	9424447a 	bl	22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x174678>
 19eb5ac:	885ffec0 	ldaxr	w0, [x22]
 19eb5b0:	51000400 	sub	w0, w0, #0x1
 19eb5b4:	8801fec0 	stlxr	w1, w0, [x22]
 19eb5b8:	35ffffa1 	cbnz	w1, 19eb5ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb724>
 19eb5bc:	350000a0 	cbnz	w0, 19eb5d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb748>
 19eb5c0:	f94002a1 	ldr	x1, [x21]
 19eb5c4:	aa1503e0 	mov	x0, x21
 19eb5c8:	f9400421 	ldr	x1, [x1,#8]
 19eb5cc:	d63f0020 	blr	x1
 19eb5d0:	f9401e75 	ldr	x21, [x19,#56]
 19eb5d4:	f94066b7 	ldr	x23, [x21,#200]
 19eb5d8:	910822f6 	add	x22, x23, #0x208
 19eb5dc:	b94012c2 	ldr	w2, [x22,#16]
 19eb5e0:	f94106e0 	ldr	x0, [x23,#520]
 19eb5e4:	937d7c58 	sbfiz	x24, x2, #3, #32
 19eb5e8:	8b180003 	add	x3, x0, x24
 19eb5ec:	eb03001f 	cmp	x0, x3
 19eb5f0:	54000180 	b.eq	19eb620 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb798>
 19eb5f4:	f9400001 	ldr	x1, [x0]
 19eb5f8:	eb01027f 	cmp	x19, x1
 19eb5fc:	54000420 	b.eq	19eb680 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb7f8>
 19eb600:	aa0003e1 	mov	x1, x0
 19eb604:	14000004 	b	19eb614 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb78c>
 19eb608:	f9400024 	ldr	x4, [x1]
 19eb60c:	eb04027f 	cmp	x19, x4
 19eb610:	54000380 	b.eq	19eb680 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb7f8>
 19eb614:	91002021 	add	x1, x1, #0x8
 19eb618:	eb01007f 	cmp	x3, x1
 19eb61c:	54ffff61 	b.ne	19eb608 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb780>
 19eb620:	b9400ac1 	ldr	w1, [x22,#8]
 19eb624:	11000454 	add	w20, w2, #0x1
 19eb628:	6b01029f 	cmp	w20, w1
 19eb62c:	5400026d 	b.le	19eb678 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb7f0>
 19eb630:	0b547e99 	add	w25, w20, w20, lsr #31
 19eb634:	0b990699 	add	w25, w20, w25, asr #1
 19eb638:	11002339 	add	w25, w25, #0x8
 19eb63c:	121d7339 	and	w25, w25, #0xfffffff8
 19eb640:	6b19003f 	cmp	w1, w25
 19eb644:	540001a0 	b.eq	19eb678 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb7f0>
 19eb648:	7100033f 	cmp	w25, #0x0
 19eb64c:	5400224d 	b.le	19eba94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebc0c>
 19eb650:	937d7f21 	sbfiz	x1, x25, #3, #32
 19eb654:	b4001fc0 	cbz	x0, 19eba4c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebbc4>
 19eb658:	97a8e392 	bl	4244a0 <realloc@plt>
 19eb65c:	b94012d8 	ldr	w24, [x22,#16]
 19eb660:	f9401e75 	ldr	x21, [x19,#56]
 19eb664:	11000714 	add	w20, w24, #0x1
 19eb668:	937d7f18 	sbfiz	x24, x24, #3, #32
 19eb66c:	f90106e0 	str	x0, [x23,#520]
 19eb670:	8b180003 	add	x3, x0, x24
 19eb674:	b9000ad9 	str	w25, [x22,#8]
 19eb678:	b90012d4 	str	w20, [x22,#16]
 19eb67c:	f9000073 	str	x19, [x3]
 19eb680:	f9406ab7 	ldr	x23, [x21,#208]
 19eb684:	910822f6 	add	x22, x23, #0x208
 19eb688:	b94012c2 	ldr	w2, [x22,#16]
 19eb68c:	f94106e0 	ldr	x0, [x23,#520]
 19eb690:	937d7c58 	sbfiz	x24, x2, #3, #32
 19eb694:	8b180003 	add	x3, x0, x24
 19eb698:	eb03001f 	cmp	x0, x3
 19eb69c:	54000180 	b.eq	19eb6cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb844>
 19eb6a0:	f9400001 	ldr	x1, [x0]
 19eb6a4:	eb01027f 	cmp	x19, x1
 19eb6a8:	54000420 	b.eq	19eb72c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb8a4>
 19eb6ac:	aa0003e1 	mov	x1, x0
 19eb6b0:	14000004 	b	19eb6c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb838>
 19eb6b4:	f9400024 	ldr	x4, [x1]
 19eb6b8:	eb04027f 	cmp	x19, x4
 19eb6bc:	54000380 	b.eq	19eb72c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb8a4>
 19eb6c0:	91002021 	add	x1, x1, #0x8
 19eb6c4:	eb01007f 	cmp	x3, x1
 19eb6c8:	54ffff61 	b.ne	19eb6b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb82c>
 19eb6cc:	b9400ac1 	ldr	w1, [x22,#8]
 19eb6d0:	11000454 	add	w20, w2, #0x1
 19eb6d4:	6b01029f 	cmp	w20, w1
 19eb6d8:	5400026d 	b.le	19eb724 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb89c>
 19eb6dc:	0b547e99 	add	w25, w20, w20, lsr #31
 19eb6e0:	0b990699 	add	w25, w20, w25, asr #1
 19eb6e4:	11002339 	add	w25, w25, #0x8
 19eb6e8:	121d7339 	and	w25, w25, #0xfffffff8
 19eb6ec:	6b19003f 	cmp	w1, w25
 19eb6f0:	540001a0 	b.eq	19eb724 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb89c>
 19eb6f4:	7100033f 	cmp	w25, #0x0
 19eb6f8:	54001b0d 	b.le	19eba58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebbd0>
 19eb6fc:	937d7f21 	sbfiz	x1, x25, #3, #32
 19eb700:	b40019a0 	cbz	x0, 19eba34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebbac>
 19eb704:	97a8e367 	bl	4244a0 <realloc@plt>
 19eb708:	b94012d8 	ldr	w24, [x22,#16]
 19eb70c:	f9401e75 	ldr	x21, [x19,#56]
 19eb710:	11000714 	add	w20, w24, #0x1
 19eb714:	937d7f18 	sbfiz	x24, x24, #3, #32
 19eb718:	f90106e0 	str	x0, [x23,#520]
 19eb71c:	8b180003 	add	x3, x0, x24
 19eb720:	b9000ad9 	str	w25, [x22,#8]
 19eb724:	b90012d4 	str	w20, [x22,#16]
 19eb728:	f9000073 	str	x19, [x3]
 19eb72c:	f9406eb6 	ldr	x22, [x21,#216]
 19eb730:	910822d5 	add	x21, x22, #0x208
 19eb734:	b94012a2 	ldr	w2, [x21,#16]
 19eb738:	f94106c0 	ldr	x0, [x22,#520]
 19eb73c:	937d7c57 	sbfiz	x23, x2, #3, #32
 19eb740:	8b170003 	add	x3, x0, x23
 19eb744:	eb03001f 	cmp	x0, x3
 19eb748:	54000180 	b.eq	19eb778 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb8f0>
 19eb74c:	f9400001 	ldr	x1, [x0]
 19eb750:	eb01027f 	cmp	x19, x1
 19eb754:	54000400 	b.eq	19eb7d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb94c>
 19eb758:	aa0003e1 	mov	x1, x0
 19eb75c:	14000004 	b	19eb76c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb8e4>
 19eb760:	f9400024 	ldr	x4, [x1]
 19eb764:	eb04027f 	cmp	x19, x4
 19eb768:	54000360 	b.eq	19eb7d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb94c>
 19eb76c:	91002021 	add	x1, x1, #0x8
 19eb770:	eb01007f 	cmp	x3, x1
 19eb774:	54ffff61 	b.ne	19eb760 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb8d8>
 19eb778:	b9400aa1 	ldr	w1, [x21,#8]
 19eb77c:	11000454 	add	w20, w2, #0x1
 19eb780:	6b01029f 	cmp	w20, w1
 19eb784:	5400024d 	b.le	19eb7cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb944>
 19eb788:	0b547e98 	add	w24, w20, w20, lsr #31
 19eb78c:	0b980698 	add	w24, w20, w24, asr #1
 19eb790:	11002318 	add	w24, w24, #0x8
 19eb794:	121d7318 	and	w24, w24, #0xfffffff8
 19eb798:	6b18003f 	cmp	w1, w24
 19eb79c:	54000180 	b.eq	19eb7cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb944>
 19eb7a0:	7100031f 	cmp	w24, #0x0
 19eb7a4:	540016ad 	b.le	19eba78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebbf0>
 19eb7a8:	937d7f01 	sbfiz	x1, x24, #3, #32
 19eb7ac:	b40014a0 	cbz	x0, 19eba40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebbb8>
 19eb7b0:	97a8e33c 	bl	4244a0 <realloc@plt>
 19eb7b4:	b94012b7 	ldr	w23, [x21,#16]
 19eb7b8:	110006f4 	add	w20, w23, #0x1
 19eb7bc:	937d7ef7 	sbfiz	x23, x23, #3, #32
 19eb7c0:	f90106c0 	str	x0, [x22,#520]
 19eb7c4:	8b170003 	add	x3, x0, x23
 19eb7c8:	b9000ab8 	str	w24, [x21,#8]
 19eb7cc:	b90012b4 	str	w20, [x21,#16]
 19eb7d0:	f9000073 	str	x19, [x3]
 19eb7d4:	a94153f3 	ldp	x19, x20, [sp,#16]
 19eb7d8:	a9425bf5 	ldp	x21, x22, [sp,#32]
 19eb7dc:	a94363f7 	ldp	x23, x24, [sp,#48]
 19eb7e0:	a9446bf9 	ldp	x25, x26, [sp,#64]
 19eb7e4:	a94573fb 	ldp	x27, x28, [sp,#80]
 19eb7e8:	a8d27bfd 	ldp	x29, x30, [sp],#288
 19eb7ec:	d65f03c0 	ret
 19eb7f0:	f9400320 	ldr	x0, [x25]
 19eb7f4:	f940181b 	ldr	x27, [x0,#48]
 19eb7f8:	9420d64a 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 19eb7fc:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 19eb800:	90005f41 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 19eb804:	9118e021 	add	x1, x1, #0x638
 19eb808:	f90077e1 	str	x1, [sp,#232]
 19eb80c:	fd007be0 	str	d0, [sp,#240]
 19eb810:	72001c1f 	tst	w0, #0xff
 19eb814:	2f00e400 	movi	d0, #0x0
 19eb818:	54000bc1 	b.ne	19eb990 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebb08>
 19eb81c:	f9008bff 	str	xzr, [sp,#272]
 19eb820:	d2800102 	mov	x2, #0x8                   	// #8
 19eb824:	d2800701 	mov	x1, #0x38                  	// #56
 19eb828:	fd007fe0 	str	d0, [sp,#248]
 19eb82c:	f9400723 	ldr	x3, [x25,#8]
 19eb830:	aa0303e0 	mov	x0, x3
 19eb834:	f9400063 	ldr	x3, [x3]
 19eb838:	f9400863 	ldr	x3, [x3,#16]
 19eb83c:	d63f0060 	blr	x3
 19eb840:	aa0003f7 	mov	x23, x0
 19eb844:	b4001380 	cbz	x0, 19ebab4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebc2c>
 19eb848:	91008320 	add	x0, x25, #0x20
 19eb84c:	c85ffc01 	ldaxr	x1, [x0]
 19eb850:	91000421 	add	x1, x1, #0x1
 19eb854:	c802fc01 	stlxr	w2, x1, [x0]
 19eb858:	35ffffa2 	cbnz	w2, 19eb84c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb9c4>
 19eb85c:	d0010ada 	adrp	x26, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 19eb860:	9113035a 	add	x26, x26, #0x4c0
 19eb864:	08dfff40 	ldarb	w0, [x26]
 19eb868:	d0010adc 	adrp	x28, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 19eb86c:	36000ba0 	tbz	w0, #0, 19eb9e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebb58>
 19eb870:	aa1703fa 	mov	x26, x23
 19eb874:	b944cb80 	ldr	w0, [x28,#1224]
 19eb878:	b9000ae0 	str	w0, [x23,#8]
 19eb87c:	f0010b1c 	adrp	x28, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
 19eb880:	f9000ae1 	str	x1, [x23,#16]
 19eb884:	d0006240 	adrp	x0, 2635000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x721a8>
 19eb888:	910b8000 	add	x0, x0, #0x2e0
 19eb88c:	f8018740 	str	x0, [x26],#24
 19eb890:	910263e1 	add	x1, sp, #0x98
 19eb894:	9105e39c 	add	x28, x28, #0x178
 19eb898:	aa1a03e0 	mov	x0, x26
 19eb89c:	94248ad1 	bl	230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862c8>
 19eb8a0:	f94053e0 	ldr	x0, [sp,#160]
 19eb8a4:	f9000740 	str	x0, [x26,#8]
 19eb8a8:	f94057e0 	ldr	x0, [sp,#168]
 19eb8ac:	f90016e0 	str	x0, [x23,#40]
 19eb8b0:	f90057ff 	str	xzr, [sp,#168]
 19eb8b4:	08dfff80 	ldarb	w0, [x28]
 19eb8b8:	36000760 	tbz	w0, #0, 19eb9a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebb1c>
 19eb8bc:	f0010b1a 	adrp	x26, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
 19eb8c0:	9106035a 	add	x26, x26, #0x180
 19eb8c4:	885fff40 	ldaxr	w0, [x26]
 19eb8c8:	11000400 	add	w0, w0, #0x1
 19eb8cc:	8801ff40 	stlxr	w1, w0, [x26]
 19eb8d0:	35ffffa1 	cbnz	w1, 19eb8c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eba3c>
 19eb8d4:	9103a3e0 	add	x0, sp, #0xe8
 19eb8d8:	97b35d28 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 19eb8dc:	aa1703e1 	mov	x1, x23
 19eb8e0:	aa1903e0 	mov	x0, x25
 19eb8e4:	d63f0360 	blr	x27
 19eb8e8:	b4ffe4e0 	cbz	x0, 19eb584 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb6fc>
 19eb8ec:	f9400f20 	ldr	x0, [x25,#24]
 19eb8f0:	b4ffe4a0 	cbz	x0, 19eb584 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb6fc>
 19eb8f4:	9420d60b 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 19eb8f8:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 19eb8fc:	90005f41 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 19eb900:	91196021 	add	x1, x1, #0x658
 19eb904:	f9005be1 	str	x1, [sp,#176]
 19eb908:	fd005fe0 	str	d0, [sp,#184]
 19eb90c:	72001c1f 	tst	w0, #0xff
 19eb910:	2f00e400 	movi	d0, #0x0
 19eb914:	540000a0 	b.eq	19eb928 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebaa0>
 19eb918:	90010f60 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 19eb91c:	394de000 	ldrb	w0, [x0,#888]
 19eb920:	35000040 	cbnz	w0, 19eb928 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebaa0>
 19eb924:	94250b73 	bl	232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a65d8>
 19eb928:	f9006fff 	str	xzr, [sp,#216]
 19eb92c:	fd0063e0 	str	d0, [sp,#192]
 19eb930:	f9400f21 	ldr	x1, [x25,#24]
 19eb934:	aa0103e0 	mov	x0, x1
 19eb938:	f9400021 	ldr	x1, [x1]
 19eb93c:	f9400821 	ldr	x1, [x1,#16]
 19eb940:	d63f0020 	blr	x1
 19eb944:	9102c3e0 	add	x0, sp, #0xb0
 19eb948:	97b35d0c 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 19eb94c:	17ffff0e 	b	19eb584 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb6fc>
 19eb950:	d2800001 	mov	x1, #0x0                   	// #0
 19eb954:	9420535b 	bl	22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x785a8>
 19eb958:	17fffeca 	b	19eb480 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb5f8>
 19eb95c:	aa1403e0 	mov	x0, x20
 19eb960:	f0010b15 	adrp	x21, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
 19eb964:	97a8ea3f 	bl	426260 <__cxa_guard_acquire@plt>
 19eb968:	34ffcb60 	cbz	w0, 19eb2d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb44c>
 19eb96c:	97b313e7 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 19eb970:	b90422a0 	str	w0, [x21,#1056]
 19eb974:	aa1403e0 	mov	x0, x20
 19eb978:	97a8ebb2 	bl	426840 <__cxa_guard_release@plt>
 19eb97c:	17fffe56 	b	19eb2d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb44c>
 19eb980:	f9400001 	ldr	x1, [x0]
 19eb984:	f9400421 	ldr	x1, [x1,#8]
 19eb988:	d63f0020 	blr	x1
 19eb98c:	17ffff06 	b	19eb5a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb71c>
 19eb990:	90010f60 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 19eb994:	394de000 	ldrb	w0, [x0,#888]
 19eb998:	35fff420 	cbnz	w0, 19eb81c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb994>
 19eb99c:	94250b55 	bl	232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a65d8>
 19eb9a0:	17ffff9f 	b	19eb81c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb994>
 19eb9a4:	aa1c03e0 	mov	x0, x28
 19eb9a8:	97a8ea2e 	bl	426260 <__cxa_guard_acquire@plt>
 19eb9ac:	f0010b01 	adrp	x1, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
 19eb9b0:	9106003a 	add	x26, x1, #0x180
 19eb9b4:	34fff880 	cbz	w0, 19eb8c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eba3c>
 19eb9b8:	aa1c03e0 	mov	x0, x28
 19eb9bc:	b901803f 	str	wzr, [x1,#384]
 19eb9c0:	97a8eba0 	bl	426840 <__cxa_guard_release@plt>
 19eb9c4:	f00109c2 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
 19eb9c8:	f0ff7340 	adrp	x0, 856000 <_ZNSt5mutex4lockEv@@Base+0x21d50>
 19eb9cc:	9135a042 	add	x2, x2, #0xd68
 19eb9d0:	aa1a03e1 	mov	x1, x26
 19eb9d4:	9112a000 	add	x0, x0, #0x4a8
 19eb9d8:	97a8ed36 	bl	426eb0 <__cxa_atexit@plt>
 19eb9dc:	17ffffba 	b	19eb8c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eba3c>
 19eb9e0:	aa1a03e0 	mov	x0, x26
 19eb9e4:	f90037e1 	str	x1, [sp,#104]
 19eb9e8:	97a8ea1e 	bl	426260 <__cxa_guard_acquire@plt>
 19eb9ec:	d0010adc 	adrp	x28, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 19eb9f0:	f94037e1 	ldr	x1, [sp,#104]
 19eb9f4:	34fff3e0 	cbz	w0, 19eb870 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb9e8>
 19eb9f8:	97b313c4 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 19eb9fc:	b904cb80 	str	w0, [x28,#1224]
 19eba00:	aa1a03e0 	mov	x0, x26
 19eba04:	97a8eb8f 	bl	426840 <__cxa_guard_release@plt>
 19eba08:	f94037e1 	ldr	x1, [sp,#104]
 19eba0c:	17ffff99 	b	19eb870 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb9e8>
 19eba10:	aa1703e0 	mov	x0, x23
 19eba14:	f0010ab9 	adrp	x25, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 19eba18:	97a8ea12 	bl	426260 <__cxa_guard_acquire@plt>
 19eba1c:	34ffd100 	cbz	w0, 19eb43c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb5b4>
 19eba20:	97b313ba 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 19eba24:	b90e2320 	str	w0, [x25,#3616]
 19eba28:	aa1703e0 	mov	x0, x23
 19eba2c:	97a8eb85 	bl	426840 <__cxa_guard_release@plt>
 19eba30:	17fffe83 	b	19eb43c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb5b4>
 19eba34:	aa0103e0 	mov	x0, x1
 19eba38:	97a8e566 	bl	424fd0 <malloc@plt>
 19eba3c:	17ffff37 	b	19eb718 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb890>
 19eba40:	aa0103e0 	mov	x0, x1
 19eba44:	97a8e563 	bl	424fd0 <malloc@plt>
 19eba48:	17ffff5e 	b	19eb7c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb938>
 19eba4c:	aa0103e0 	mov	x0, x1
 19eba50:	97a8e560 	bl	424fd0 <malloc@plt>
 19eba54:	17ffff06 	b	19eb66c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb7e4>
 19eba58:	97a8e426 	bl	424af0 <free@plt>
 19eba5c:	b94012d8 	ldr	w24, [x22,#16]
 19eba60:	d2800000 	mov	x0, #0x0                   	// #0
 19eba64:	11000714 	add	w20, w24, #0x1
 19eba68:	937d7f18 	sbfiz	x24, x24, #3, #32
 19eba6c:	f9401e75 	ldr	x21, [x19,#56]
 19eba70:	f90106ff 	str	xzr, [x23,#520]
 19eba74:	17ffff2a 	b	19eb71c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb894>
 19eba78:	97a8e41e 	bl	424af0 <free@plt>
 19eba7c:	b94012b7 	ldr	w23, [x21,#16]
 19eba80:	d2800000 	mov	x0, #0x0                   	// #0
 19eba84:	f90106df 	str	xzr, [x22,#520]
 19eba88:	110006f4 	add	w20, w23, #0x1
 19eba8c:	937d7ef7 	sbfiz	x23, x23, #3, #32
 19eba90:	17ffff4d 	b	19eb7c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb93c>
 19eba94:	97a8e417 	bl	424af0 <free@plt>
 19eba98:	b94012d8 	ldr	w24, [x22,#16]
 19eba9c:	d2800000 	mov	x0, #0x0                   	// #0
 19ebaa0:	11000714 	add	w20, w24, #0x1
 19ebaa4:	937d7f18 	sbfiz	x24, x24, #3, #32
 19ebaa8:	f9401e75 	ldr	x21, [x19,#56]
 19ebaac:	f90106ff 	str	xzr, [x23,#520]
 19ebab0:	17fffef0 	b	19eb670 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eb7e8>
 19ebab4:	d0005ea1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 19ebab8:	910203e0 	add	x0, sp, #0x80
 19ebabc:	9136a021 	add	x1, x1, #0xda8
 19ebac0:	94252088 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 19ebac4:	f0008021 	adrp	x1, 29f2000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x42f1a8>
 19ebac8:	910c8021 	add	x1, x1, #0x320
 19ebacc:	910223e8 	add	x8, sp, #0x88
 19ebad0:	91202021 	add	x1, x1, #0x808
 19ebad4:	910203e0 	add	x0, sp, #0x80
 19ebad8:	9424a046 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 19ebadc:	90006f01 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 19ebae0:	910243e8 	add	x8, sp, #0x90
 19ebae4:	91366021 	add	x1, x1, #0xd98
 19ebae8:	910223e0 	add	x0, sp, #0x88
 19ebaec:	9424a041 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 19ebaf0:	b0006121 	adrp	x1, 2610000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x4d1a8>
 19ebaf4:	9101e3e0 	add	x0, sp, #0x78
 19ebaf8:	9108a021 	add	x1, x1, #0x228
 19ebafc:	94252079 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 19ebb00:	9101e3e1 	add	x1, sp, #0x78
 19ebb04:	9102c3e8 	add	x8, sp, #0xb0
 19ebb08:	910243e0 	add	x0, sp, #0x90
 19ebb0c:	94249fe1 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 19ebb10:	52800022 	mov	w2, #0x1                   	// #1
 19ebb14:	52800001 	mov	w1, #0x0                   	// #0
 19ebb18:	9102c3e0 	add	x0, sp, #0xb0
 19ebb1c:	94205231 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 19ebb20:	9102c3e0 	add	x0, sp, #0xb0
 19ebb24:	942442b7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 19ebb28:	9101e3e0 	add	x0, sp, #0x78
 19ebb2c:	942442b5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 19ebb30:	910243e0 	add	x0, sp, #0x90
 19ebb34:	942442b3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 19ebb38:	910223e0 	add	x0, sp, #0x88
 19ebb3c:	942442b1 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 19ebb40:	910203e0 	add	x0, sp, #0x80
 19ebb44:	942442af 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 19ebb48:	17ffff63 	b	19eb8d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1eba4c>
 19ebb4c:	aa0003f6 	mov	x22, x0
 19ebb50:	9102c3e0 	add	x0, sp, #0xb0
 19ebb54:	97b35c89 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 19ebb58:	f94057e0 	ldr	x0, [sp,#168]
 19ebb5c:	b4000140 	cbz	x0, 19ebb84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebcfc>
 19ebb60:	91002001 	add	x1, x0, #0x8
 19ebb64:	885ffc22 	ldaxr	w2, [x1]
 19ebb68:	51000442 	sub	w2, w2, #0x1
 19ebb6c:	8803fc22 	stlxr	w3, w2, [x1]
 19ebb70:	35ffffa3 	cbnz	w3, 19ebb64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebcdc>
 19ebb74:	35000082 	cbnz	w2, 19ebb84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebcfc>
 19ebb78:	f9400001 	ldr	x1, [x0]
 19ebb7c:	f9400421 	ldr	x1, [x1,#8]
 19ebb80:	d63f0020 	blr	x1
 19ebb84:	910263e0 	add	x0, sp, #0x98
 19ebb88:	94244302 	bl	22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x174678>
 19ebb8c:	aa1503e0 	mov	x0, x21
 19ebb90:	97a917c3 	bl	431a9c <sqlite3_key@plt+0xa22c>
 19ebb94:	f9402a60 	ldr	x0, [x19,#80]
 19ebb98:	f9002278 	str	x24, [x19,#64]
 19ebb9c:	b4000340 	cbz	x0, 19ebc04 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebd7c>
 19ebba0:	97b221ce 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 19ebba4:	a9446bf9 	ldp	x25, x26, [sp,#64]
 19ebba8:	f9401a60 	ldr	x0, [x19,#48]
 19ebbac:	b4000040 	cbz	x0, 19ebbb4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebd2c>
 19ebbb0:	97b221ca 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 19ebbb4:	aa1403e0 	mov	x0, x20
 19ebbb8:	a9046bf9 	stp	x25, x26, [sp,#64]
 19ebbbc:	97b4c63b 	bl	71d4a8 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x24700>
 19ebbc0:	b900127f 	str	wzr, [x19,#16]
 19ebbc4:	aa1603e0 	mov	x0, x22
 19ebbc8:	97a8e452 	bl	424d10 <_Unwind_Resume@plt>
 19ebbcc:	aa0003f6 	mov	x22, x0
 19ebbd0:	17ffffe2 	b	19ebb58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebcd0>
 19ebbd4:	f9402a61 	ldr	x1, [x19,#80]
 19ebbd8:	f9002278 	str	x24, [x19,#64]
 19ebbdc:	aa0003f6 	mov	x22, x0
 19ebbe0:	b4000121 	cbz	x1, 19ebc04 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebd7c>
 19ebbe4:	aa0103e0 	mov	x0, x1
 19ebbe8:	97b221bc 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 19ebbec:	a9446bf9 	ldp	x25, x26, [sp,#64]
 19ebbf0:	17ffffee 	b	19ebba8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebd20>
 19ebbf4:	aa0003f6 	mov	x22, x0
 19ebbf8:	17ffffec 	b	19ebba8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebd20>
 19ebbfc:	aa0003f6 	mov	x22, x0
 19ebc00:	17ffffe5 	b	19ebb94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebd0c>
 19ebc04:	a9446bf9 	ldp	x25, x26, [sp,#64]
 19ebc08:	17ffffe8 	b	19ebba8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebd20>
 19ebc0c:	f9400ea1 	ldr	x1, [x21,#24]
 19ebc10:	aa0003f6 	mov	x22, x0
 19ebc14:	b4000061 	cbz	x1, 19ebc20 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebd98>
 19ebc18:	aa0103e0 	mov	x0, x1
 19ebc1c:	97a91793 	bl	431a68 <sqlite3_key@plt+0xa1f8>
 19ebc20:	f9400aa0 	ldr	x0, [x21,#16]
 19ebc24:	d0006001 	adrp	x1, 25ed000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a1a8>
 19ebc28:	910e0021 	add	x1, x1, #0x380
 19ebc2c:	f90002a1 	str	x1, [x21]
 19ebc30:	b4000080 	cbz	x0, 19ebc40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebdb8>
 19ebc34:	f9400001 	ldr	x1, [x0]
 19ebc38:	f9400421 	ldr	x1, [x1,#8]
 19ebc3c:	d63f0020 	blr	x1
 19ebc40:	aa1503e0 	mov	x0, x21
 19ebc44:	d2800401 	mov	x1, #0x20                  	// #32
 19ebc48:	97a8ea86 	bl	426660 <_ZdlPvm@plt>
 19ebc4c:	17ffffd2 	b	19ebb94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebd0c>
 19ebc50:	aa0003f6 	mov	x22, x0
 19ebc54:	a90363f7 	stp	x23, x24, [sp,#48]
 19ebc58:	17ffffd7 	b	19ebbb4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebd2c>
 19ebc5c:	aa0003f6 	mov	x22, x0
 19ebc60:	1400000c 	b	19ebc90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebe08>
 19ebc64:	aa0003f6 	mov	x22, x0
 19ebc68:	9102c3e0 	add	x0, sp, #0xb0
 19ebc6c:	94244265 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 19ebc70:	9101e3e0 	add	x0, sp, #0x78
 19ebc74:	94244263 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 19ebc78:	910243e0 	add	x0, sp, #0x90
 19ebc7c:	94244261 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 19ebc80:	910223e0 	add	x0, sp, #0x88
 19ebc84:	9424425f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 19ebc88:	910203e0 	add	x0, sp, #0x80
 19ebc8c:	9424425d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 19ebc90:	9103a3e0 	add	x0, sp, #0xe8
 19ebc94:	97b35c39 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 19ebc98:	17ffffb0 	b	19ebb58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebcd0>
 19ebc9c:	aa0003f6 	mov	x22, x0
 19ebca0:	17fffff4 	b	19ebc70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebde8>
 19ebca4:	aa0003f6 	mov	x22, x0
 19ebca8:	17fffff4 	b	19ebc78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebdf0>
 19ebcac:	aa0003f6 	mov	x22, x0
 19ebcb0:	17fffff4 	b	19ebc80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebdf8>
 19ebcb4:	aa0003f6 	mov	x22, x0
 19ebcb8:	17fffff4 	b	19ebc88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebe00>
 19ebcbc:	d503201f 	nop
