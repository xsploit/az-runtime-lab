
rx3-research/pi-runtime/rbp:	file format elf32-littlearm

Disassembly of section .text:

000b6404 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i>:
   b6404:      	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
   b6408:      	vpush	{d8, d9, d10, d11, d12}
   b640c:      	sub	sp, sp, #36
   b6410:      	ldr	r6, [r0, #0x7c]
   b6414:      	mov	r4, r0
   b6418:      	mov	r9, r1
   b641c:      	mov	r10, r2
   b6420:      	cmp	r6, #0
   b6424:      	str	r3, [sp, #0x18]
   b6428:      	beq	0xb67a8 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x3a4> @ imm = #0x378
   b642c:      	ldr	r3, [r4, #0x78]
   b6430:      	cmp	r3, r6
   b6434:      	movle	r2, #0
   b6438:      	strle	r2, [sp, #0x1c]
   b643c:      	strle	r2, [sp, #0x14]
   b6440:      	ble	0xb6470 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x6c> @ imm = #0x28
   b6444:      	ldr	r3, [r4, #0x70]
   b6448:      	cmp	r3, r6
   b644c:      	bge	0xb6848 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x444> @ imm = #0x3f4
   b6450:      	ldr	r12, [sp, #0x18]
   b6454:      	add	r3, r3, r12
   b6458:      	cmp	r3, r6
   b645c:      	bge	0xb6894 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x490> @ imm = #0x430
   b6460:      	mov	r3, #1
   b6464:      	mov	r12, #0
   b6468:      	str	r3, [sp, #0x1c]
   b646c:      	str	r12, [sp, #0x14]
   b6470:      	ldr	r2, [sp, #0x18]
   b6474:      	cmp	r2, #0
   b6478:      	ble	0xb6758 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x354> @ imm = #0x2d8
   b647c:      	vldr	d10, [pc, #796]         @ 0xb67a0 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x39c>
   b6480:      	vadd.f32	d12, d10, d10
   b6484:      	ldr	r3, [r4, #0x74]
   b6488:      	vmov.f32	d11, #1.000000e+00
   b648c:      	mov	r12, r10
   b6490:      	ldr	r11, [r4, #0x18]
   b6494:      	ldr	r8, [r4, #0x8c]
   b6498:      	mov	r10, #0
   b649c:      	vsub.f32	d12, d11, d12
   b64a0:      	ldr	r5, [r4, #0x84]
   b64a4:      	ldr	r7, [r4, #0x90]
   b64a8:      	mov	r1, r3
   b64ac:      	ldr	r6, [r4, #0x94]
   b64b0:      	ldr	r2, [r4, #0x1c]
   b64b4:      	vldr	d9, [pc, #732]          @ 0xb6798 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x394>
   b64b8:      	str	r12, [sp, #0x4]
   b64bc:      	b	0xb65ac <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x1a8> @ imm = #0xe8
   b64c0:      	ldrb	r1, [r4, #0x88]
   b64c4:      	cmp	r1, #0
   b64c8:      	beq	0xb6528 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x124> @ imm = #0x58
   b64cc:      	ldr	r12, [sp, #0x14]
   b64d0:      	cmp	r12, #0
   b64d4:      	beq	0xb672c <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x328> @ imm = #0x250
   b64d8:      	ldr	r1, [r4, #0x24]
   b64dc:      	str	r2, [sp, #0xc]
   b64e0:      	str	r3, [sp, #0x10]
   b64e4:      	lsl	r1, r1, #1
   b64e8:      	vmov	s14, r1
   b64ec:      	vcvt.f64.u32	d16, s14
   b64f0:      	vmul.f64	d16, d16, d9
   b64f4:      	vcmpe.f64	d16, #0
   b64f8:      	vmov	r0, r1, d16
   b64fc:      	vmrs	APSR_nzcv, fpscr
   b6500:      	bge	0xb6710 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x30c> @ imm = #0x208
   b6504:      	bl	0xed30 <ceil@plt>       @ imm = #-0xa77dc
   b6508:      	ldr	r3, [sp, #0x10]
   b650c:      	ldr	r2, [sp, #0xc]
   b6510:      	vmov	d7, r0, r1
   b6514:      	vcvt.u32.f64	s15, d7
   b6518:      	vmov	r1, s15
   b651c:      	add	r1, r1, #1
   b6520:      	lsr	r1, r1, #1
   b6524:      	str	r1, [r4, #0x70]
   b6528:      	ldrb	r1, [r8, #0x24]
   b652c:      	vldmia	r9!, {d19}
   b6530:      	vldr	d16, [r8, #16]
   b6534:      	vmul.f32	d19, d19, d16
   b6538:      	cmp	r1, #0
   b653c:      	beq	0xb666c <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x268> @ imm = #0x128
   b6540:      	vldr	d18, [r6, #16]
   b6544:      	vldr	d16, [r9, #-8]
   b6548:      	vldr	d17, [r7, #16]
   b654c:      	vmul.f32	d18, d8, d18
   b6550:      	vmul.f32	d16, d16, d17
   b6554:      	ldr	r12, [sp, #0x4]
   b6558:      	vadd.f32	d16, d16, d18
   b655c:      	vstmia	r12!, {d16}
   b6560:      	ldrb	r1, [r7, #0x24]
   b6564:      	str	r12, [sp, #0x4]
   b6568:      	cmp	r1, #0
   b656c:      	beq	0xb66d8 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x2d4> @ imm = #0x164
   b6570:      	ldrb	r1, [r6, #0x24]
   b6574:      	cmp	r1, #0
   b6578:      	beq	0xb66a0 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x29c> @ imm = #0x120
   b657c:      	add	r1, r3, #1
   b6580:      	add	r3, r11, r3, lsl #3
   b6584:      	vstr	d19, [r3]
   b6588:      	ldr	r3, [sp, #0x18]
   b658c:      	cmp	r1, r2
   b6590:      	add	r10, r10, #1
   b6594:      	str	r1, [r4, #0x74]
   b6598:      	rsbge	r1, r2, r1
   b659c:      	strge	r1, [r4, #0x74]
   b65a0:      	cmp	r10, r3
   b65a4:      	beq	0xb6758 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x354> @ imm = #0x1ac
   b65a8:      	ldr	r3, [r4, #0x74]
   b65ac:      	ldr	r0, [r4, #0x70]
   b65b0:      	ldr	r12, [r4, #0x80]
   b65b4:      	subs	lr, r1, r0
   b65b8:      	addmi	lr, lr, r2
   b65bc:      	subs	r1, r1, r12
   b65c0:      	ldr	r12, [sp, #0x1c]
   b65c4:      	addmi	r1, r1, r2
   b65c8:      	add	lr, r11, lr, lsl #3
   b65cc:      	vldr	d8, [lr]
   b65d0:      	cmp	r12, #0
   b65d4:      	add	r1, r11, r1, lsl #3
   b65d8:      	vldr	d16, [r1]
   b65dc:      	beq	0xb6608 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x204> @ imm = #0x24
   b65e0:      	ldr	r12, [sp, #0x14]
   b65e4:      	ldr	r1, [r4, #0x7c]
   b65e8:      	cmp	r12, #0
   b65ec:      	beq	0xb6600 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x1fc> @ imm = #0xc
   b65f0:      	cmp	r0, r1
   b65f4:      	movle	r12, #0
   b65f8:      	strle	r12, [sp, #0x14]
   b65fc:      	bgt	0xb6774 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x370> @ imm = #0x170
   b6600:      	add	r1, r1, #1
   b6604:      	str	r1, [r4, #0x7c]
   b6608:      	ldrb	r1, [r5, #0x24]
   b660c:      	vldr	d17, [r5, #16]
   b6610:      	cmp	r1, #0
   b6614:      	bne	0xb64c0 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0xbc> @ imm = #-0x15c
   b6618:      	vsub.f32	d8, d8, d16
   b661c:      	ldr	r1, [r5, #0x18]
   b6620:      	ldr	r0, [r5, #0x1c]
   b6624:      	vldr	d18, [r5]
   b6628:      	vadd.f32	d18, d17, d18
   b662c:      	vstr	d18, [r5, #16]
   b6630:      	cmp	r1, r0
   b6634:      	vmul.f32	d8, d8, d17
   b6638:      	vadd.f32	d8, d16, d8
   b663c:      	vldrhs	d16, [r5, #8]
   b6640:      	movhs	r0, #1
   b6644:      	vstrhs	d16, [r5, #16]
   b6648:      	strbhs	r0, [r5, #0x24]
   b664c:      	add	r1, r1, #1
   b6650:      	str	r1, [r5, #0x18]
   b6654:      	ldrb	r1, [r8, #0x24]
   b6658:      	vldmia	r9!, {d19}
   b665c:      	vldr	d16, [r8, #16]
   b6660:      	vmul.f32	d19, d19, d16
   b6664:      	cmp	r1, #0
   b6668:      	bne	0xb6540 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x13c> @ imm = #-0x130
   b666c:      	ldr	r1, [r8, #0x18]
   b6670:      	vldr	d17, [r8]
   b6674:      	ldr	r0, [r8, #0x1c]
   b6678:      	vadd.f32	d16, d16, d17
   b667c:      	vstr	d16, [r8, #16]
   b6680:      	cmp	r1, r0
   b6684:      	vldrhs	d16, [r8, #8]
   b6688:      	movhs	r0, #1
   b668c:      	vstrhs	d16, [r8, #16]
   b6690:      	strbhs	r0, [r8, #0x24]
   b6694:      	add	r1, r1, #1
   b6698:      	str	r1, [r8, #0x18]
   b669c:      	b	0xb6540 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x13c> @ imm = #-0x164
   b66a0:      	ldr	r1, [r6, #0x18]
   b66a4:      	vldr	d16, [r6, #16]
   b66a8:      	ldr	r0, [r6, #0x1c]
   b66ac:      	vldr	d17, [r6]
   b66b0:      	vadd.f32	d16, d16, d17
   b66b4:      	vstr	d16, [r6, #16]
   b66b8:      	cmp	r1, r0
   b66bc:      	vldrhs	d16, [r6, #8]
   b66c0:      	movhs	r12, #1
   b66c4:      	vstrhs	d16, [r6, #16]
   b66c8:      	strbhs	r12, [r6, #0x24]
   b66cc:      	add	r1, r1, #1
   b66d0:      	str	r1, [r6, #0x18]
   b66d4:      	b	0xb657c <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x178> @ imm = #-0x160
   b66d8:      	ldr	r1, [r7, #0x18]
   b66dc:      	vldr	d16, [r7, #16]
   b66e0:      	ldr	r0, [r7, #0x1c]
   b66e4:      	vldr	d17, [r7]
   b66e8:      	vadd.f32	d16, d16, d17
   b66ec:      	vstr	d16, [r7, #16]
   b66f0:      	cmp	r1, r0
   b66f4:      	vldrhs	d16, [r7, #8]
   b66f8:      	movhs	r0, #1
   b66fc:      	vstrhs	d16, [r7, #16]
   b6700:      	strbhs	r0, [r7, #0x24]
   b6704:      	add	r1, r1, #1
   b6708:      	str	r1, [r7, #0x18]
   b670c:      	b	0xb6570 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x16c> @ imm = #-0x1a4
   b6710:      	bl	0xf870 <_ZNSt15basic_streambufIcSt11char_traitsIcEED2Ev@plt+0xc> @ imm = #-0xa6ea8
   b6714:      	ldr	r2, [sp, #0xc]
   b6718:      	ldr	r3, [sp, #0x10]
   b671c:      	vmov	d7, r0, r1
   b6720:      	vcvt.u32.f64	s15, d7
   b6724:      	vmov	r1, s15
   b6728:      	b	0xb651c <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x118> @ imm = #-0x214
   b672c:      	ldr	r1, [r5, #0x20]
   b6730:      	strb	r12, [r4, #0x88]
   b6734:      	vstr	d10, [r5, #16]
   b6738:      	vstr	d11, [r5, #8]
   b673c:      	str	r12, [r5, #0x18]
   b6740:      	vdup.32	d16, r1
   b6744:      	strb	r12, [r5, #0x24]
   b6748:      	vmul.f32	d16, d12, d16
   b674c:      	vstr	d16, [r5]
   b6750:      	str	r0, [r4, #0x80]
   b6754:      	b	0xb64d8 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0xd4> @ imm = #-0x284
   b6758:      	mov	r0, r4
   b675c:      	bl	0x98fa0 <_ZN11mixerengine19QuantizedBeatEffect20checkQuantizeSettingEv> @ imm = #-0x1d7c4
   b6760:      	cmp	r0, #0
   b6764:      	bne	0xb6780 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x37c> @ imm = #0x14
   b6768:      	add	sp, sp, #36
   b676c:      	vpop	{d8, d9, d10, d11, d12}
   b6770:      	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
   b6774:      	vldr	d8, [pc, #36]           @ 0xb67a0 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x39c>
   b6778:      	vorr	d16, d8, d8
   b677c:      	b	0xb6600 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x1fc> @ imm = #-0x184
   b6780:      	mov	r0, r4
   b6784:      	add	sp, sp, #36
   b6788:      	vpop	{d8, d9, d10, d11, d12}
   b678c:      	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
   b6790:      	b	0x989dc <_ZN11mixerengine17BpmQuantizeEffect15checkTimeUpdateEv> @ imm = #-0x1ddbc
   b6794:      	nop
   b6798: cd cc cc cc  	.word	0xcccccccd
   b679c: cc 0c 46 40  	.word	0x40460ccc
		...
   b67a8:      	vldr	d16, [pc, #-16]         @ 0xb67a0 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x39c>
   b67ac:      	vadd.f32	d19, d16, d16
   b67b0:      	ldr	r3, [r0, #0x24]
   b67b4:      	vmov.f32	d17, #1.000000e+00
   b67b8:      	ldr	r8, [r0, #0x8c]
   b67bc:      	lsl	r3, r3, #1
   b67c0:      	vsub.f32	d19, d17, d19
   b67c4:      	ldr	r2, [r8, #0x20]
   b67c8:      	vmov	s14, r3
   b67cc:      	vcvt.f64.u32	d18, s14
   b67d0:      	str	r6, [r0, #0x74]
   b67d4:      	mov	r3, #1
   b67d8:      	strb	r3, [r0, #0x88]
   b67dc:      	vdup.32	d20, r2
   b67e0:      	vstr	d16, [r8, #16]
   b67e4:      	vmul.f32	d16, d19, d20
   b67e8:      	vstr	d16, [r8]
   b67ec:      	vldr	d16, [pc, #-92]         @ 0xb6798 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x394>
   b67f0:      	vstr	d17, [r8, #8]
   b67f4:      	str	r6, [r8, #0x18]
   b67f8:      	strb	r6, [r8, #0x24]
   b67fc:      	vmul.f64	d16, d18, d16
   b6800:      	vcmpe.f64	d16, #0
   b6804:      	vmov	r0, r1, d16
   b6808:      	vmrs	APSR_nzcv, fpscr
   b680c:      	bge	0xb6880 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x47c> @ imm = #0x6c
   b6810:      	bl	0xed30 <ceil@plt>       @ imm = #-0xa7ae8
   b6814:      	vmov	d7, r0, r1
   b6818:      	vcvt.u32.f64	s15, d7
   b681c:      	vmov	r3, s15
   b6820:      	add	r3, r3, #1
   b6824:      	ldr	r5, [r4, #0x84]
   b6828:      	vldr	d16, [pc, #-144]        @ 0xb67a0 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x39c>
   b682c:      	lsr	r3, r3, #1
   b6830:      	str	r3, [r4, #0x70]
   b6834:      	str	r3, [r4, #0x80]
   b6838:      	vstr	d16, [r5, #16]
   b683c:      	vstr	d16, [r5, #8]
   b6840:      	vstr	d16, [r5]
   b6844:      	b	0xb642c <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x28> @ imm = #-0x420
   b6848:      	ldr	r7, [r4, #0x90]
   b684c:      	vldr	d16, [pc, #-180]        @ 0xb67a0 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x39c>
   b6850:      	ldr	r6, [r4, #0x94]
   b6854:      	mov	r2, #1
   b6858:      	vstr	d16, [r7]
   b685c:      	vmov.f32	d17, #1.000000e+00
   b6860:      	str	r2, [sp, #0x1c]
   b6864:      	vstr	d17, [r7, #16]
   b6868:      	vstr	d17, [r7, #8]
   b686c:      	str	r2, [sp, #0x14]
   b6870:      	vstr	d16, [r6, #16]
   b6874:      	vstr	d16, [r6, #8]
   b6878:      	vstr	d16, [r6]
   b687c:      	b	0xb6470 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x6c> @ imm = #-0x414
   b6880:      	bl	0xf870 <_ZNSt15basic_streambufIcSt11char_traitsIcEED2Ev@plt+0xc> @ imm = #-0xa7018
   b6884:      	vmov	d7, r0, r1
   b6888:      	vcvt.u32.f64	s15, d7
   b688c:      	vmov	r3, s15
   b6890:      	b	0xb6820 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x41c> @ imm = #-0x78
   b6894:      	ldr	r3, [r4]
   b6898:      	mov	r2, #1
   b689c:      	mov	r12, #0
   b68a0:      	mov	r0, r4
   b68a4:      	str	r2, [sp, #0x1c]
   b68a8:      	str	r12, [sp, #0x14]
   b68ac:      	ldr	r3, [r3, #0x38]
   b68b0:      	blx	r3
   b68b4:      	b	0xb6470 <_ZN11mixerengine15BeatEffectDelay7executeEPKN6common6Float2EPS2_i+0x6c> @ imm = #-0x44c
