
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000001df7350 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f74c8>:
 1df7350:	d65f03c0 	ret
 1df7354:	d503201f 	nop
 1df7358:	a9aa7bfd 	stp	x29, x30, [sp,#-352]!
 1df735c:	910003fd 	mov	x29, sp
 1df7360:	a90153f3 	stp	x19, x20, [sp,#16]
 1df7364:	aa0103f3 	mov	x19, x1
 1df7368:	a9025bf5 	stp	x21, x22, [sp,#32]
 1df736c:	aa0003f5 	mov	x21, x0
 1df7370:	91032016 	add	x22, x0, #0xc8
 1df7374:	f90023f9 	str	x25, [sp,#64]
 1df7378:	b9005fe2 	str	w2, [sp,#92]
 1df737c:	9419171d 	bl	243cff0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0xc7bd0>
 1df7380:	a9400261 	ldp	x1, x0, [x19]
 1df7384:	a90903e1 	stp	x1, x0, [sp,#144]
 1df7388:	b9405fe2 	ldr	w2, [sp,#92]
 1df738c:	b4000120 	cbz	x0, 1df73b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f7528>
 1df7390:	d0007ce1 	adrp	x1, 2d95000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x7d21a8>
 1df7394:	f943d821 	ldr	x1, [x1,#1968]
 1df7398:	b40020c1 	cbz	x1, 1df77b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f7928>
 1df739c:	91002000 	add	x0, x0, #0x8
 1df73a0:	885ffc01 	ldaxr	w1, [x0]
 1df73a4:	11000421 	add	w1, w1, #0x1
 1df73a8:	8803fc01 	stlxr	w3, w1, [x0]
 1df73ac:	35ffffa3 	cbnz	w3, 1df73a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f7518>
 1df73b0:	910243f4 	add	x20, sp, #0x90
 1df73b4:	aa1603e0 	mov	x0, x22
 1df73b8:	aa1403e1 	mov	x1, x20
 1df73bc:	97fffcc7 	bl	1df66d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6850>
 1df73c0:	f9404ff3 	ldr	x19, [sp,#152]
 1df73c4:	a90363f7 	stp	x23, x24, [sp,#48]
 1df73c8:	b4000173 	cbz	x19, 1df73f4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f756c>
 1df73cc:	d0007ce0 	adrp	x0, 2d95000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x7d21a8>
 1df73d0:	f943d817 	ldr	x23, [x0,#1968]
 1df73d4:	b4001f77 	cbz	x23, 1df77c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f7938>
 1df73d8:	91002261 	add	x1, x19, #0x8
 1df73dc:	885ffc20 	ldaxr	w0, [x1]
 1df73e0:	51000402 	sub	w2, w0, #0x1
 1df73e4:	8803fc22 	stlxr	w3, w2, [x1]
 1df73e8:	35ffffa3 	cbnz	w3, 1df73dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f7554>
 1df73ec:	7100041f 	cmp	w0, #0x1
 1df73f0:	54001f20 	b.eq	1df77d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f794c>
 1df73f4:	90007cc0 	adrp	x0, 2d8f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x7cc1a8>
 1df73f8:	91296000 	add	x0, x0, #0xa58
 1df73fc:	f90002a0 	str	x0, [x21]
 1df7400:	f0005fa1 	adrp	x1, 29ee000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x42b1a8>
 1df7404:	f9007abf 	str	xzr, [x21,#240]
 1df7408:	913c4021 	add	x1, x1, #0xf10
 1df740c:	9101c3e0 	add	x0, sp, #0x70
 1df7410:	9414f234 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 1df7414:	f000e9f7 	adrp	x23, 3b36000 <_ZTISt11range_error@@GLIBCXX_3.4+0x11440>
 1df7418:	aa1403e8 	mov	x8, x20
 1df741c:	52807f81 	mov	w1, #0x3fc                 	// #1020
 1df7420:	f94026e0 	ldr	x0, [x23,#72]
 1df7424:	9417d8e7 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df7428:	910122f3 	add	x19, x23, #0x48
 1df742c:	910263e8 	add	x8, sp, #0x98
 1df7430:	528074a1 	mov	w1, #0x3a5                 	// #933
 1df7434:	f9400660 	ldr	x0, [x19,#8]
 1df7438:	9417d8e2 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df743c:	f9400a60 	ldr	x0, [x19,#16]
 1df7440:	910283e8 	add	x8, sp, #0xa0
 1df7444:	52805181 	mov	w1, #0x28c                 	// #652
 1df7448:	9417d8de 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df744c:	f9400e60 	ldr	x0, [x19,#24]
 1df7450:	9102a3e8 	add	x8, sp, #0xa8
 1df7454:	52804921 	mov	w1, #0x249                 	// #585
 1df7458:	9417d8da 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df745c:	f9401260 	ldr	x0, [x19,#32]
 1df7460:	9102c3e8 	add	x8, sp, #0xb0
 1df7464:	528080e1 	mov	w1, #0x407                 	// #1031
 1df7468:	9417d8d6 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df746c:	f9401660 	ldr	x0, [x19,#40]
 1df7470:	9102e3e8 	add	x8, sp, #0xb8
 1df7474:	528073e1 	mov	w1, #0x39f                 	// #927
 1df7478:	9417d8d2 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df747c:	f9401a60 	ldr	x0, [x19,#48]
 1df7480:	910303e8 	add	x8, sp, #0xc0
 1df7484:	5280a7e1 	mov	w1, #0x53f                 	// #1343
 1df7488:	9417d8ce 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df748c:	f9401e60 	ldr	x0, [x19,#56]
 1df7490:	910323e8 	add	x8, sp, #0xc8
 1df7494:	52809a41 	mov	w1, #0x4d2                 	// #1234
 1df7498:	9417d8ca 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df749c:	f9402260 	ldr	x0, [x19,#64]
 1df74a0:	910343e8 	add	x8, sp, #0xd0
 1df74a4:	52801521 	mov	w1, #0xa9                  	// #169
 1df74a8:	9417d8c6 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df74ac:	f9402660 	ldr	x0, [x19,#72]
 1df74b0:	910363e8 	add	x8, sp, #0xd8
 1df74b4:	528011a1 	mov	w1, #0x8d                  	// #141
 1df74b8:	9417d8c2 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df74bc:	f94026e0 	ldr	x0, [x23,#72]
 1df74c0:	910383e8 	add	x8, sp, #0xe0
 1df74c4:	52807f81 	mov	w1, #0x3fc                 	// #1020
 1df74c8:	9417d8be 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df74cc:	f9400660 	ldr	x0, [x19,#8]
 1df74d0:	9103a3e8 	add	x8, sp, #0xe8
 1df74d4:	528074a1 	mov	w1, #0x3a5                 	// #933
 1df74d8:	9417d8ba 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df74dc:	f9402a60 	ldr	x0, [x19,#80]
 1df74e0:	9103c3e8 	add	x8, sp, #0xf0
 1df74e4:	528079a1 	mov	w1, #0x3cd                 	// #973
 1df74e8:	9417d8b6 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df74ec:	f9402e60 	ldr	x0, [x19,#88]
 1df74f0:	9103e3e8 	add	x8, sp, #0xf8
 1df74f4:	52806dc1 	mov	w1, #0x36e                 	// #878
 1df74f8:	9417d8b2 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df74fc:	f9403260 	ldr	x0, [x19,#96]
 1df7500:	910403e8 	add	x8, sp, #0x100
 1df7504:	52808a01 	mov	w1, #0x450                 	// #1104
 1df7508:	9417d8ae 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df750c:	f9403660 	ldr	x0, [x19,#104]
 1df7510:	910423e8 	add	x8, sp, #0x108
 1df7514:	52807941 	mov	w1, #0x3ca                 	// #970
 1df7518:	9417d8aa 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df751c:	f9401260 	ldr	x0, [x19,#32]
 1df7520:	910443e8 	add	x8, sp, #0x110
 1df7524:	528080e1 	mov	w1, #0x407                 	// #1031
 1df7528:	9417d8a6 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df752c:	f9401660 	ldr	x0, [x19,#40]
 1df7530:	910463e8 	add	x8, sp, #0x118
 1df7534:	528073e1 	mov	w1, #0x39f                 	// #927
 1df7538:	9417d8a2 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df753c:	f9403a60 	ldr	x0, [x19,#112]
 1df7540:	910483e8 	add	x8, sp, #0x120
 1df7544:	5280bfe1 	mov	w1, #0x5ff                 	// #1535
 1df7548:	9417d89e 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df754c:	f9403e60 	ldr	x0, [x19,#120]
 1df7550:	9104a3e8 	add	x8, sp, #0x128
 1df7554:	5280b6e1 	mov	w1, #0x5b7                 	// #1463
 1df7558:	9417d89a 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df755c:	f9404260 	ldr	x0, [x19,#128]
 1df7560:	9104c3e8 	add	x8, sp, #0x130
 1df7564:	52809261 	mov	w1, #0x493                 	// #1171
 1df7568:	9417d896 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df756c:	f9404660 	ldr	x0, [x19,#136]
 1df7570:	9104e3e8 	add	x8, sp, #0x138
 1df7574:	52808721 	mov	w1, #0x439                 	// #1081
 1df7578:	9417d892 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df757c:	f9404a60 	ldr	x0, [x19,#144]
 1df7580:	910503e8 	add	x8, sp, #0x140
 1df7584:	5280ada1 	mov	w1, #0x56d                 	// #1389
 1df7588:	9417d88e 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df758c:	f9404e60 	ldr	x0, [x19,#152]
 1df7590:	910523e8 	add	x8, sp, #0x148
 1df7594:	52809f61 	mov	w1, #0x4fb                 	// #1275
 1df7598:	9417d88a 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df759c:	f9405260 	ldr	x0, [x19,#160]
 1df75a0:	910543e8 	add	x8, sp, #0x150
 1df75a4:	5280b6c1 	mov	w1, #0x5b6                 	// #1462
 1df75a8:	9417d886 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df75ac:	f9405660 	ldr	x0, [x19,#168]
 1df75b0:	910563e8 	add	x8, sp, #0x158
 1df75b4:	5280b001 	mov	w1, #0x580                 	// #1408
 1df75b8:	9417d882 	bl	23ed7c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x783a0>
 1df75bc:	d2802800 	mov	x0, #0x140                 	// #320
 1df75c0:	b9008bff 	str	wzr, [sp,#136]
 1df75c4:	9798b683 	bl	424fd0 <malloc@plt>
 1df75c8:	910583f7 	add	x23, sp, #0x160
 1df75cc:	52800502 	mov	w2, #0x28                  	// #40
 1df75d0:	aa1403f3 	mov	x19, x20
 1df75d4:	52800001 	mov	w1, #0x0                   	// #0
 1df75d8:	f9003fe0 	str	x0, [sp,#120]
 1df75dc:	b90083e2 	str	w2, [sp,#128]
 1df75e0:	14000002 	b	1df75e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f7760>
 1df75e4:	f9403fe0 	ldr	x0, [sp,#120]
 1df75e8:	8b21cc00 	add	x0, x0, w1, sxtw #3
 1df75ec:	aa1303e1 	mov	x1, x19
 1df75f0:	9416e788 	bl	23b1410 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x3bff0>
 1df75f4:	b9408be1 	ldr	w1, [sp,#136]
 1df75f8:	91002273 	add	x19, x19, #0x8
 1df75fc:	eb17027f 	cmp	x19, x23
