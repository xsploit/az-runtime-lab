
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1e02280:      	add	x20, sp, #0x150
 1e02284:      	fadd	d8, d9, d10
 1e02288:      	add	x23, x20, #0x1
 1e0228c:      	fmov	d11, d0
 1e02290:      	mov	w28, #0x0               // =0
 1e02294:      	mov	w25, #0x0               // =0
 1e02298:      	mov	w19, #0x1               // =1
 1e0229c:      	mov	w1, w24
 1e022a0:      	ldp	w26, w27, [sp, #0x90]
 1e022a4:      	str	wzr, [sp, #0x98]
 1e022a8:      	str	wzr, [sp, #0xa0]
 1e022ac:      	b	0x1e022bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602434>
 1e022b0:      	ldr	x0, [x22]
 1e022b4:      	fcvtzs	w1, d9
 1e022b8:      	ldr	x3, [x0, #0x30]
 1e022bc:      	mov	x0, x22
 1e022c0:      	mov	x8, x20
 1e022c4:      	mov	w2, #0x0                // =0
 1e022c8:      	blr	x3
 1e022cc:      	ldrb	w0, [sp, #0x150]
 1e022d0:      	mul	w0, w0, w26
 1e022d4:      	sdiv	w0, w0, w27
 1e022d8:      	ands	w0, w0, #0xff
 1e022dc:      	csel	w0, w0, w19, ne
 1e022e0:      	cmp	w25, w0
 1e022e4:      	b.hs	0x1e02300 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602478>
 1e022e8:      	ldrb	w28, [sp, #0x152]
 1e022ec:      	mov	w25, w0
 1e022f0:      	ldrb	w1, [sp, #0x153]
 1e022f4:      	ldrb	w0, [sp, #0x151]
 1e022f8:      	str	w1, [sp, #0x98]
 1e022fc:      	str	w0, [sp, #0xa0]
 1e02300:      	fadd	d9, d9, d11
 1e02304:      	mov	x0, x23
 1e02308:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e0230c:      	fcmpe	d8, d9
 1e02310:      	b.gt	0x1e022b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602428>
 1e02314:      	mov	x1, x21
 1e02318:      	ldrb	w2, [x21, #0x2]
 1e0231c:      	str	w2, [sp, #0xb8]
 1e02320:      	fadd	d9, d8, d10
 1e02324:      	ldrb	w2, [sp, #0x90]
 1e02328:      	str	w2, [sp, #0xe4]
 1e0232c:      	ldrb	w2, [x21, #0x1]
 1e02330:      	str	w2, [sp, #0xc4]
 1e02334:      	ldrb	w2, [x1], #0x4
 1e02338:      	ldr	w0, [sp, #0x9c]
 1e0233c:      	str	w28, [sp, #0xb0]
 1e02340:      	str	w2, [sp, #0xc0]
 1e02344:      	cmp	w0, #0x1
 1e02348:      	str	x1, [sp, #0xc8]
 1e0234c:      	str	w25, [sp, #0xe0]
 1e02350:      	b.le	0x1e02aac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602c24>
 1e02354:      	sub	w0, w0, #0x2
 1e02358:      	mov	w25, #0x0               // =0
 1e0235c:      	add	x0, x0, #0x2
 1e02360:      	mov	w27, #0x0               // =0
 1e02364:      	ldr	x24, [sp, #0xd0]
 1e02368:      	add	x0, x21, x0, lsl #2
 1e0236c:      	mov	w26, #0x0               // =0
 1e02370:      	mov	w28, #0x0               // =0
 1e02374:      	str	x0, [sp, #0xf0]
 1e02378:      	str	w26, [sp, #0x80]
 1e0237c:      	add	x23, x20, #0x1
 1e02380:      	str	x24, [sp, #0xd8]
 1e02384:      	mov	w19, #0x0               // =0
 1e02388:      	ldp	w26, w24, [sp, #0x90]
 1e0238c:      	mov	w21, #0x1               // =1
 1e02390:      	fmov	d11, #1.00000000
 1e02394:      	nop
 1e02398:      	ldr	x3, [x22]
 1e0239c:      	fcvtzs	w1, d8
 1e023a0:      	mov	x0, x22
 1e023a4:      	mov	x8, x20
 1e023a8:      	mov	w2, #0x0                // =0
 1e023ac:      	ldr	x3, [x3, #0x30]
 1e023b0:      	blr	x3
 1e023b4:      	ldrb	w0, [sp, #0x150]
 1e023b8:      	mul	w0, w0, w26
 1e023bc:      	sdiv	w0, w0, w24
 1e023c0:      	ands	w0, w0, #0xff
 1e023c4:      	csel	w0, w0, w21, ne
 1e023c8:      	cmp	w19, w0
 1e023cc:      	b.hs	0x1e023e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602560>
 1e023d0:      	mov	w25, w0
 1e023d4:      	ldrb	w27, [sp, #0x153]
 1e023d8:      	ldrb	w28, [sp, #0x151]
 1e023dc:      	mov	w19, w25
 1e023e0:      	ldrb	w0, [sp, #0x152]
 1e023e4:      	str	w0, [sp, #0x80]
 1e023e8:      	fadd	d8, d8, d11
 1e023ec:      	mov	x0, x23
 1e023f0:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e023f4:      	fcmpe	d8, d9
 1e023f8:      	b.mi	0x1e02398 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602510>
 1e023fc:      	ldr	w1, [sp, #0xb0]
 1e02400:      	add	w6, w27, w27, lsl #8
 1e02404:      	ldr	w26, [sp, #0x80]
 1e02408:      	mov	w10, #0x3e80            // =16000
 1e0240c:      	ldr	w2, [sp, #0x98]
 1e02410:      	mov	w11, #0x3e80            // =16000
 1e02414:      	lsl	w0, w1, #6
 1e02418:      	sub	w0, w0, w1
 1e0241c:      	lsl	w1, w26, #6
 1e02420:      	add	w2, w2, w2, lsl #8
 1e02424:      	sub	w1, w1, w26
 1e02428:      	add	w0, w2, w0, lsl #3
 1e0242c:      	ldr	x2, [sp, #0xc8]
 1e02430:      	add	w6, w6, w1, lsl #3
 1e02434:      	ldr	w1, [sp, #0xa0]
 1e02438:      	ldr	x24, [sp, #0xd8]
 1e0243c:      	ldrb	w3, [x2, #0x2]
 1e02440:      	ldrb	w4, [x2, #0x1]
 1e02444:      	ldrb	w5, [x2]
 1e02448:      	mov	w2, #0x62               // =98
 1e0244c:      	madd	w0, w1, w2, w0
 1e02450:      	mov	w1, #0x64               // =100
 1e02454:      	madd	w6, w28, w2, w6
 1e02458:      	add	w0, w0, w10
 1e0245c:      	add	w6, w6, w11
 1e02460:      	mul	w8, w0, w1
 1e02464:      	udiv	w1, w8, w6
 1e02468:      	cmp	w1, #0x2c
 1e0246c:      	b.le	0x1e026b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602830>
 1e02470:      	mov	w1, #0x3e8              // =1000
 1e02474:      	mul	w1, w0, w1
 1e02478:      	udiv	w1, w1, w6
 1e0247c:      	cmp	w1, #0x8ae
 1e02480:      	b.gt	0x1e026b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602830>
 1e02484:      	ldr	x1, [sp, #0x88]
 1e02488:      	mov	w10, #0xff              // =255
 1e0248c:      	ldr	w11, [sp, #0x98]
 1e02490:      	ldr	d0, [x1]
 1e02494:      	mov	w1, #0x8000             // =32768
 1e02498:      	fcvtzs	w9, d0, #0xf
 1e0249c:      	sub	w1, w1, w9
 1e024a0:      	mul	w7, w27, w9
 1e024a4:      	mul	w2, w26, w9
 1e024a8:      	mul	w9, w28, w9
 1e024ac:      	madd	w7, w11, w1, w7
 1e024b0:      	ldr	w11, [sp, #0xb0]
 1e024b4:      	asr	w7, w7, #15
 1e024b8:      	madd	w2, w11, w1, w2
 1e024bc:      	ldr	w11, [sp, #0xa0]
 1e024c0:      	cmp	w7, w10
 1e024c4:      	csel	w7, w7, w10, le
 1e024c8:      	strb	w7, [x24, #0x2]
 1e024cc:      	asr	w2, w2, #15
 1e024d0:      	madd	w1, w11, w1, w9
 1e024d4:      	cmp	w2, w10
 1e024d8:      	csel	w2, w2, w10, le
 1e024dc:      	strb	w2, [x24, #0x1]
 1e024e0:      	asr	w1, w1, #15
 1e024e4:      	cmp	w1, w10
 1e024e8:      	csel	w1, w1, w10, le
 1e024ec:      	strb	w1, [x24]
 1e024f0:      	ldr	w2, [sp, #0xc4]
 1e024f4:      	ldr	w7, [sp, #0xb8]
 1e024f8:      	lsl	w1, w2, #6
 1e024fc:      	sub	w1, w1, w2
 1e02500:      	lsl	w2, w4, #6
 1e02504:      	sub	w2, w2, w4
 1e02508:      	add	w9, w7, w7, lsl #8
 1e0250c:      	add	w7, w3, w3, lsl #8
 1e02510:      	add	w1, w9, w1, lsl #3
 1e02514:      	add	w2, w7, w2, lsl #3
 1e02518:      	ldr	w7, [sp, #0xc0]
 1e0251c:      	mov	w9, #0x62               // =98
 1e02520:      	madd	w2, w5, w9, w2
 1e02524:      	madd	w1, w7, w9, w1
 1e02528:      	mov	w7, #0x3e80             // =16000
 1e0252c:      	mov	w9, #0x3e80             // =16000
 1e02530:      	add	w2, w2, w9
 1e02534:      	add	w1, w1, w7
 1e02538:      	mov	w7, #0x64               // =100
 1e0253c:      	mul	w10, w1, w7
 1e02540:      	udiv	w7, w10, w2
 1e02544:      	cmp	w7, #0x2c
 1e02548:      	b.le	0x1e02734 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6028ac>
 1e0254c:      	mov	w7, #0x3e8              // =1000
 1e02550:      	mul	w7, w1, w7
 1e02554:      	udiv	w7, w7, w2
 1e02558:      	cmp	w7, #0x8ae
 1e0255c:      	b.gt	0x1e02734 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6028ac>
 1e02560:      	ldr	x7, [sp, #0x88]
 1e02564:      	mov	w12, #0xff              // =255
 1e02568:      	ldr	w14, [sp, #0xb8]
 1e0256c:      	ldr	d0, [x7]
 1e02570:      	mov	w7, #0x8000             // =32768
 1e02574:      	fcvtzs	w13, d0, #0xf
 1e02578:      	sub	w7, w7, w13
 1e0257c:      	mul	w11, w3, w13
 1e02580:      	mul	w9, w4, w13
 1e02584:      	mul	w13, w5, w13
 1e02588:      	madd	w11, w14, w7, w11
 1e0258c:      	ldr	w14, [sp, #0xc4]
 1e02590:      	asr	w11, w11, #15
 1e02594:      	madd	w9, w14, w7, w9
 1e02598:      	ldr	w14, [sp, #0xc0]
 1e0259c:      	cmp	w11, w12
 1e025a0:      	csel	w11, w11, w12, le
 1e025a4:      	strb	w11, [x24, #0xa]
 1e025a8:      	asr	w9, w9, #15
 1e025ac:      	madd	w7, w14, w7, w13
 1e025b0:      	cmp	w9, w12
 1e025b4:      	csel	w9, w9, w12, le
 1e025b8:      	strb	w9, [x24, #0x9]
 1e025bc:      	asr	w7, w7, #15
 1e025c0:      	cmp	w7, w12
 1e025c4:      	csel	w7, w7, w12, le
 1e025c8:      	strb	w7, [x24, #0x8]
 1e025cc:      	ldr	w7, [sp, #0xe0]
 1e025d0:      	cmp	w7, w25
 1e025d4:      	b.hs	0x1e027b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602930>
 1e025d8:      	udiv	w10, w10, w6
 1e025dc:      	ldrb	w0, [sp, #0xe4]
 1e025e0:      	strb	w7, [x24, #0x3]
 1e025e4:      	strb	w25, [x24, #0x7]
 1e025e8:      	strb	w0, [x24, #0xb]
 1e025ec:      	cmp	w10, #0x2c
 1e025f0:      	b.le	0x1e02964 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602adc>
 1e025f4:      	mov	w0, #0x3e8              // =1000
 1e025f8:      	mul	w1, w1, w0
 1e025fc:      	udiv	w6, w1, w6
 1e02600:      	cmp	w6, #0x8ae
 1e02604:      	b.gt	0x1e02964 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602adc>
 1e02608:      	ldr	x0, [sp, #0x88]
 1e0260c:      	mov	w7, #0xff               // =255
 1e02610:      	ldr	w8, [sp, #0xb8]
 1e02614:      	ldr	d0, [x0]
 1e02618:      	mov	w0, #0x8000             // =32768
 1e0261c:      	fcvtzs	w6, d0, #0xf
 1e02620:      	sub	w0, w0, w6
 1e02624:      	mul	w2, w27, w6
 1e02628:      	mul	w1, w26, w6
 1e0262c:      	mul	w6, w28, w6
 1e02630:      	madd	w2, w8, w0, w2
 1e02634:      	ldr	w8, [sp, #0xc4]
 1e02638:      	madd	w1, w8, w0, w1
 1e0263c:      	ldr	w8, [sp, #0xc0]
 1e02640:      	madd	w0, w8, w0, w6
 1e02644:      	asr	w2, w2, #15
 1e02648:      	cmp	w2, w7
 1e0264c:      	asr	w1, w1, #15
 1e02650:      	csel	w2, w2, w7, le
 1e02654:      	cmp	w1, w7
 1e02658:      	asr	w0, w0, #15
 1e0265c:      	csel	w1, w1, w7, le
 1e02660:      	cmp	w0, w7
 1e02664:      	strb	w1, [x24, #0x5]
 1e02668:      	csel	w0, w0, w7, le
 1e0266c:      	strb	w0, [x24, #0x4]
 1e02670:      	strb	w2, [x24, #0x6]
 1e02674:      	ldr	x0, [sp, #0xc8]
 1e02678:      	str	w27, [sp, #0x98]
 1e0267c:      	ldr	x1, [sp, #0xf0]
 1e02680:      	add	x0, x0, #0x4
 1e02684:      	str	w28, [sp, #0xa0]
 1e02688:      	add	x24, x24, #0x1c
 1e0268c:      	str	w26, [sp, #0xb0]
 1e02690:      	fadd	d0, d10, d9
 1e02694:      	str	w3, [sp, #0xb8]
 1e02698:      	fmov	d8, d9
 1e0269c:      	stp	w5, w4, [sp, #0xc0]
 1e026a0:      	cmp	x0, x1
 1e026a4:      	str	x0, [sp, #0xc8]
 1e026a8:      	str	w25, [sp, #0xe0]
 1e026ac:      	b.eq	0x1e02a10 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602b88>
 1e026b0:      	fmov	d9, d0
 1e026b4:      	b	0x1e02378 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6024f0>
 1e026b8:      	ldr	x1, [sp, #0xa8]
 1e026bc:      	ldr	w7, [sp, #0x98]
 1e026c0:      	ldr	w9, [x1, #0x4]
 1e026c4:      	cmp	w7, w27
 1e026c8:      	ldr	w1, [x1]
 1e026cc:      	mul	w2, w27, w9
 1e026d0:      	madd	w2, w7, w1, w2
 1e026d4:      	asr	w2, w2, #15
 1e026d8:      	b.lo	0x1e0290c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602a84>
 1e026dc:      	cmp	w7, w2
 1e026e0:      	csel	w7, w7, w2, le
 1e026e4:      	strb	w7, [x24, #0x2]
 1e026e8:      	ldr	w7, [sp, #0xb0]
 1e026ec:      	mul	w2, w26, w9
 1e026f0:      	cmp	w7, w26
 1e026f4:      	madd	w2, w7, w1, w2
 1e026f8:      	asr	w2, w2, #15
 1e026fc:      	b.lo	0x1e02930 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602aa8>
 1e02700:      	cmp	w7, w2
 1e02704:      	mul	w9, w28, w9
 1e02708:      	csel	w2, w7, w2, le
 1e0270c:      	strb	w2, [x24, #0x1]
 1e02710:      	ldr	w2, [sp, #0xa0]
 1e02714:      	cmp	w2, w28
 1e02718:      	madd	w1, w2, w1, w9
 1e0271c:      	asr	w1, w1, #15
 1e02720:      	b.lo	0x1e02954 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602acc>
 1e02724:      	cmp	w2, w1
 1e02728:      	csel	w1, w2, w1, le
 1e0272c:      	strb	w1, [x24]
 1e02730:      	b	0x1e024f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602668>
 1e02734:      	ldr	x7, [sp, #0xa8]
 1e02738:      	ldr	w11, [sp, #0xb8]
 1e0273c:      	ldr	w12, [x7, #0x4]
 1e02740:      	cmp	w3, w11
 1e02744:      	ldr	w7, [x7]
 1e02748:      	mul	w9, w3, w12
 1e0274c:      	madd	w9, w11, w7, w9
 1e02750:      	asr	w9, w9, #15
 1e02754:      	b.hi	0x1e02828 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6029a0>
 1e02758:      	cmp	w11, w9
 1e0275c:      	csel	w11, w11, w9, le
 1e02760:      	strb	w11, [x24, #0xa]
 1e02764:      	ldr	w11, [sp, #0xc4]
 1e02768:      	mul	w9, w4, w12
 1e0276c:      	cmp	w4, w11
 1e02770:      	madd	w9, w11, w7, w9
 1e02774:      	asr	w9, w9, #15
 1e02778:      	b.hi	0x1e0284c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6029c4>
 1e0277c:      	cmp	w11, w9
 1e02780:      	mul	w12, w5, w12
 1e02784:      	csel	w9, w11, w9, le
 1e02788:      	strb	w9, [x24, #0x9]
 1e0278c:      	ldr	w9, [sp, #0xc0]
 1e02790:      	cmp	w5, w9
 1e02794:      	madd	w7, w9, w7, w12
 1e02798:      	asr	w7, w7, #15
 1e0279c:      	b.hi	0x1e02870 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6029e8>
 1e027a0:      	cmp	w9, w7
 1e027a4:      	csel	w7, w9, w7, le
 1e027a8:      	strb	w7, [x24, #0x8]
 1e027ac:      	ldr	w7, [sp, #0xe0]
 1e027b0:      	cmp	w7, w25
 1e027b4:      	b.lo	0x1e025d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602750>
 1e027b8:      	udiv	w8, w8, w2
 1e027bc:      	ldrb	w1, [sp, #0xe0]
 1e027c0:      	strb	w1, [x24, #0x7]
 1e027c4:      	ldrb	w1, [sp, #0xe4]
 1e027c8:      	strb	w25, [x24, #0x3]
 1e027cc:      	strb	w1, [x24, #0xb]
 1e027d0:      	cmp	w8, #0x2c
 1e027d4:      	b.le	0x1e02880 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6029f8>
 1e027d8:      	mov	w1, #0x3e8              // =1000
 1e027dc:      	mul	w0, w0, w1
 1e027e0:      	udiv	w2, w0, w2
 1e027e4:      	cmp	w2, #0x8ae
 1e027e8:      	b.gt	0x1e02880 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6029f8>
 1e027ec:      	ldr	x0, [sp, #0x88]
 1e027f0:      	mov	w7, #0xff               // =255
 1e027f4:      	ldr	w8, [sp, #0x98]
 1e027f8:      	ldr	d0, [x0]
 1e027fc:      	mov	w0, #0x8000             // =32768
 1e02800:      	fcvtzs	w6, d0, #0xf
 1e02804:      	sub	w0, w0, w6
 1e02808:      	mul	w2, w3, w6
 1e0280c:      	mul	w1, w4, w6
 1e02810:      	mul	w6, w5, w6
 1e02814:      	madd	w2, w8, w0, w2
 1e02818:      	ldr	w8, [sp, #0xb0]
 1e0281c:      	madd	w1, w8, w0, w1
 1e02820:      	ldr	w8, [sp, #0xa0]
 1e02824:      	b	0x1e02640 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6027b8>
 1e02828:      	cmp	w3, w9
 1e0282c:      	csel	w11, w3, w9, le
 1e02830:      	strb	w11, [x24, #0xa]
 1e02834:      	ldr	w11, [sp, #0xc4]
 1e02838:      	mul	w9, w4, w12
 1e0283c:      	cmp	w4, w11
 1e02840:      	madd	w9, w11, w7, w9
 1e02844:      	asr	w9, w9, #15
 1e02848:      	b.ls	0x1e0277c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6028f4>
 1e0284c:      	cmp	w4, w9
 1e02850:      	mul	w12, w5, w12
 1e02854:      	csel	w9, w4, w9, le
 1e02858:      	strb	w9, [x24, #0x9]
 1e0285c:      	ldr	w9, [sp, #0xc0]
 1e02860:      	cmp	w5, w9
 1e02864:      	madd	w7, w9, w7, w12
 1e02868:      	asr	w7, w7, #15
 1e0286c:      	b.ls	0x1e027a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602918>
 1e02870:      	cmp	w5, w7
 1e02874:      	csel	w7, w5, w7, le
 1e02878:      	strb	w7, [x24, #0x8]
 1e0287c:      	b	0x1e027ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602924>
 1e02880:      	ldr	x0, [sp, #0xa8]
 1e02884:      	ldr	w2, [sp, #0x98]
 1e02888:      	ldr	w6, [x0, #0x4]
 1e0288c:      	cmp	w3, w2
 1e02890:      	ldr	w0, [x0]
 1e02894:      	mul	w1, w3, w6
 1e02898:      	madd	w1, w2, w0, w1
 1e0289c:      	asr	w1, w1, #15
 1e028a0:      	b.hi	0x1e029ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602b64>
 1e028a4:      	cmp	w2, w1
 1e028a8:      	csel	w2, w2, w1, le
 1e028ac:      	strb	w2, [x24, #0x6]
 1e028b0:      	mul	w1, w4, w6
 1e028b4:      	ldr	w2, [sp, #0xb0]
 1e028b8:      	cmp	w4, w2
 1e028bc:      	madd	w1, w2, w0, w1
 1e028c0:      	asr	w1, w1, #15
 1e028c4:      	b.hi	0x1e029e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602b58>
 1e028c8:      	cmp	w2, w1
 1e028cc:      	csel	w1, w2, w1, le
 1e028d0:      	strb	w1, [x24, #0x5]
 1e028d4:      	mul	w6, w5, w6
 1e028d8:      	ldr	w1, [sp, #0xa0]
 1e028dc:      	cmp	w5, w1
 1e028e0:      	madd	w0, w1, w0, w6
 1e028e4:      	asr	w0, w0, #15
 1e028e8:      	b.ls	0x1e028fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602a74>
 1e028ec:      	cmp	w5, w0
 1e028f0:      	csel	w0, w5, w0, le
 1e028f4:      	strb	w0, [x24, #0x4]
 1e028f8:      	b	0x1e02674 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6027ec>
 1e028fc:      	cmp	w1, w0
 1e02900:      	csel	w0, w1, w0, le
 1e02904:      	strb	w0, [x24, #0x4]
 1e02908:      	b	0x1e02674 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6027ec>
 1e0290c:      	cmp	w27, w2
 1e02910:      	csel	w7, w27, w2, le
 1e02914:      	strb	w7, [x24, #0x2]
 1e02918:      	ldr	w7, [sp, #0xb0]
 1e0291c:      	mul	w2, w26, w9
 1e02920:      	cmp	w7, w26
 1e02924:      	madd	w2, w7, w1, w2
 1e02928:      	asr	w2, w2, #15
 1e0292c:      	b.hs	0x1e02700 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602878>
 1e02930:      	cmp	w26, w2
 1e02934:      	mul	w9, w28, w9
 1e02938:      	csel	w2, w26, w2, le
 1e0293c:      	strb	w2, [x24, #0x1]
 1e02940:      	ldr	w2, [sp, #0xa0]
 1e02944:      	cmp	w2, w28
 1e02948:      	madd	w1, w2, w1, w9
 1e0294c:      	asr	w1, w1, #15
 1e02950:      	b.hs	0x1e02724 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x60289c>
 1e02954:      	cmp	w28, w1
 1e02958:      	csel	w1, w28, w1, le
 1e0295c:      	strb	w1, [x24]
 1e02960:      	b	0x1e024f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602668>
 1e02964:      	ldr	x0, [sp, #0xa8]
 1e02968:      	ldr	w2, [sp, #0xb8]
 1e0296c:      	ldr	w6, [x0, #0x4]
 1e02970:      	cmp	w2, w27
 1e02974:      	ldr	w0, [x0]
 1e02978:      	mul	w1, w27, w6
 1e0297c:      	madd	w1, w2, w0, w1
 1e02980:      	asr	w1, w1, #15
 1e02984:      	b.lo	0x1e02a04 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602b7c>
 1e02988:      	cmp	w2, w1
 1e0298c:      	csel	w2, w2, w1, le
 1e02990:      	strb	w2, [x24, #0x6]
 1e02994:      	mul	w1, w26, w6
 1e02998:      	ldr	w2, [sp, #0xc4]
 1e0299c:      	cmp	w26, w2
 1e029a0:      	madd	w1, w2, w0, w1
 1e029a4:      	asr	w1, w1, #15
 1e029a8:      	b.hi	0x1e029f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602b70>
 1e029ac:      	cmp	w2, w1
 1e029b0:      	csel	w1, w2, w1, le
 1e029b4:      	strb	w1, [x24, #0x5]
 1e029b8:      	mul	w6, w28, w6
 1e029bc:      	ldr	w1, [sp, #0xc0]
 1e029c0:      	cmp	w1, w28
 1e029c4:      	madd	w0, w1, w0, w6
 1e029c8:      	asr	w0, w0, #15
 1e029cc:      	b.hs	0x1e028fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602a74>
 1e029d0:      	cmp	w28, w0
 1e029d4:      	csel	w0, w28, w0, le
 1e029d8:      	strb	w0, [x24, #0x4]
 1e029dc:      	b	0x1e02674 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6027ec>
 1e029e0:      	cmp	w4, w1
 1e029e4:      	csel	w1, w4, w1, le
 1e029e8:      	b	0x1e028d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602a48>
 1e029ec:      	cmp	w3, w1
 1e029f0:      	csel	w2, w3, w1, le
 1e029f4:      	b	0x1e028ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602a24>
 1e029f8:      	cmp	w26, w1
 1e029fc:      	csel	w1, w26, w1, le
 1e02a00:      	b	0x1e029b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602b2c>
 1e02a04:      	cmp	w27, w1
 1e02a08:      	csel	w2, w27, w1, le
 1e02a0c:      	b	0x1e02990 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602b08>
 1e02a10:      	ldr	w1, [sp, #0x9c]
 1e02a14:      	mov	w0, #0x1c               // =28
 1e02a18:      	ldr	x2, [sp, #0xd0]
 1e02a1c:      	smaddl	x0, w1, w0, x2
 1e02a20:      	sub	x0, x0, #0x1c
 1e02a24:      	dup	v0.8b, w28
 1e02a28:      	ldrb	w1, [sp, #0xe4]
 1e02a2c:      	strb	w5, [x0, #0x8]
 1e02a30:      	strb	w4, [x0, #0x9]
 1e02a34:      	strb	w3, [x0, #0xa]
 1e02a38:      	mov	v0.b[1], w26
 1e02a3c:      	strb	w1, [x0, #0xb]
 1e02a40:      	mov	v0.b[2], w27
 1e02a44:      	mov	v0.b[3], w25
 1e02a48:      	mov	v0.b[5], w26
 1e02a4c:      	mov	v0.b[6], w27
