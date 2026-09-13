
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000bd4d8 <mixerengine::SoundColorFxSpace::initialize()>:
   bd4d8:	ed907a07 	vldr	s14, [r0, #28]
   bd4dc:	eddf7a72 	vldr	s15, [pc, #456]	@ bd6ac <mixerengine::SoundColorFxSpace::initialize()+0x1d4>
   bd4e0:	ee677a27 	vmul.f32	s15, s14, s15
   bd4e4:	e92d4010 	push	{r4, lr}
   bd4e8:	e1a04000 	mov	r4, r0
   bd4ec:	eefd7ae7 	vcvt.s32.f32	s15, s15
   bd4f0:	ee173a90 	vmov	r3, s15
   bd4f4:	e3530000 	cmp	r3, #0
   bd4f8:	ba00003b 	blt	bd5ec <mixerengine::SoundColorFxSpace::initialize()+0x114>
   bd4fc:	e35300ff 	cmp	r3, #255	@ 0xff
   bd500:	da00005a 	ble	bd670 <mixerengine::SoundColorFxSpace::initialize()+0x198>
   bd504:	e3a03000 	mov	r3, #0
   bd508:	e3a02000 	mov	r2, #0
   bd50c:	e5803030 	str	r3, [r0, #48]	@ 0x30
   bd510:	e5802050 	str	r2, [r0, #80]	@ 0x50
   bd514:	e3a020ff 	mov	r2, #255	@ 0xff
   bd518:	e5803058 	str	r3, [r0, #88]	@ 0x58
   bd51c:	e580305c 	str	r3, [r0, #92]	@ 0x5c
   bd520:	e5803060 	str	r3, [r0, #96]	@ 0x60
   bd524:	e5803064 	str	r3, [r0, #100]	@ 0x64
   bd528:	e5803068 	str	r3, [r0, #104]	@ 0x68
   bd52c:	e3a03001 	mov	r3, #1
   bd530:	e5802034 	str	r2, [r0, #52]	@ 0x34
   bd534:	e5803054 	str	r3, [r0, #84]	@ 0x54
   bd538:	e5940084 	ldr	r0, [r4, #132]	@ 0x84
   bd53c:	e3a03001 	mov	r3, #1
   bd540:	e584302c 	str	r3, [r4, #44]	@ 0x2c
   bd544:	e300244b 	movw	r2, #1099	@ 0x44b
   bd548:	e59f1160 	ldr	r1, [pc, #352]	@ bd6b0 <mixerengine::SoundColorFxSpace::initialize()+0x1d8>
   bd54c:	e5903000 	ldr	r3, [r0]
   bd550:	e584206c 	str	r2, [r4, #108]	@ 0x6c
   bd554:	e3002696 	movw	r2, #1686	@ 0x696
   bd558:	e5842070 	str	r2, [r4, #112]	@ 0x70
   bd55c:	e3002b64 	movw	r2, #2916	@ 0xb64
   bd560:	e5933008 	ldr	r3, [r3, #8]
   bd564:	e5842074 	str	r2, [r4, #116]	@ 0x74
   bd568:	e2422d16 	sub	r2, r2, #1408	@ 0x580
   bd56c:	e5842078 	str	r2, [r4, #120]	@ 0x78
   bd570:	e12fff33 	blx	r3
   bd574:	e5940088 	ldr	r0, [r4, #136]	@ 0x88
   bd578:	e59f1134 	ldr	r1, [pc, #308]	@ bd6b4 <mixerengine::SoundColorFxSpace::initialize()+0x1dc>
   bd57c:	e5903000 	ldr	r3, [r0]
   bd580:	e5933008 	ldr	r3, [r3, #8]
   bd584:	e12fff33 	blx	r3
   bd588:	e5940084 	ldr	r0, [r4, #132]	@ 0x84
   bd58c:	e5903000 	ldr	r3, [r0]
   bd590:	e5933018 	ldr	r3, [r3, #24]
   bd594:	e12fff33 	blx	r3
   bd598:	e5940088 	ldr	r0, [r4, #136]	@ 0x88
   bd59c:	e5903000 	ldr	r3, [r0]
   bd5a0:	e5933018 	ldr	r3, [r3, #24]
   bd5a4:	e12fff33 	blx	r3
   bd5a8:	e3a03000 	mov	r3, #0
   bd5ac:	e3022213 	movw	r2, #8723	@ 0x2213
   bd5b0:	e5843094 	str	r3, [r4, #148]	@ 0x94
   bd5b4:	e584207c 	str	r2, [r4, #124]	@ 0x7c
   bd5b8:	e303263a 	movw	r2, #13882	@ 0x363a
   bd5bc:	e5843098 	str	r3, [r4, #152]	@ 0x98
   bd5c0:	e584309c 	str	r3, [r4, #156]	@ 0x9c
   bd5c4:	e58430a8 	str	r3, [r4, #168]	@ 0xa8
   bd5c8:	e30e395c 	movw	r3, #59740	@ 0xe95c
   bd5cc:	e5842080 	str	r2, [r4, #128]	@ 0x80
   bd5d0:	e3433bde 	movt	r3, #15326	@ 0x3bde
   bd5d4:	e58430ac 	str	r3, [r4, #172]	@ 0xac
   bd5d8:	e3a03000 	mov	r3, #0
   bd5dc:	e5c43024 	strb	r3, [r4, #36]	@ 0x24
   bd5e0:	e3a035fe 	mov	r3, #1065353216	@ 0x3f800000
   bd5e4:	e58430a0 	str	r3, [r4, #160]	@ 0xa0
   bd5e8:	e8bd8010 	pop	{r4, pc}
   bd5ec:	e3a03000 	mov	r3, #0
   bd5f0:	e3a02000 	mov	r2, #0
   bd5f4:	e5803030 	str	r3, [r0, #48]	@ 0x30
   bd5f8:	e5803034 	str	r3, [r0, #52]	@ 0x34
   bd5fc:	e5803058 	str	r3, [r0, #88]	@ 0x58
   bd600:	e580305c 	str	r3, [r0, #92]	@ 0x5c
   bd604:	e5803060 	str	r3, [r0, #96]	@ 0x60
   bd608:	e5803064 	str	r3, [r0, #100]	@ 0x64
   bd60c:	e5803068 	str	r3, [r0, #104]	@ 0x68
   bd610:	e3a03001 	mov	r3, #1
   bd614:	e5802050 	str	r2, [r0, #80]	@ 0x50
   bd618:	e5803054 	str	r3, [r0, #84]	@ 0x54
   bd61c:	e5940084 	ldr	r0, [r4, #132]	@ 0x84
   bd620:	e3a03000 	mov	r3, #0
   bd624:	e584302c 	str	r3, [r4, #44]	@ 0x2c
   bd628:	e30034c7 	movw	r3, #1223	@ 0x4c7
   bd62c:	e584306c 	str	r3, [r4, #108]	@ 0x6c
   bd630:	e3002754 	movw	r2, #1876	@ 0x754
   bd634:	e5903000 	ldr	r3, [r0]
   bd638:	e59f1078 	ldr	r1, [pc, #120]	@ bd6b8 <mixerengine::SoundColorFxSpace::initialize()+0x1e0>
   bd63c:	e5842070 	str	r2, [r4, #112]	@ 0x70
   bd640:	e3002cae 	movw	r2, #3246	@ 0xcae
   bd644:	e5933008 	ldr	r3, [r3, #8]
   bd648:	e5842074 	str	r2, [r4, #116]	@ 0x74
   bd64c:	e300268f 	movw	r2, #1679	@ 0x68f
   bd650:	e5842078 	str	r2, [r4, #120]	@ 0x78
   bd654:	e12fff33 	blx	r3
   bd658:	e5940088 	ldr	r0, [r4, #136]	@ 0x88
   bd65c:	e59f1058 	ldr	r1, [pc, #88]	@ bd6bc <mixerengine::SoundColorFxSpace::initialize()+0x1e4>
   bd660:	e5903000 	ldr	r3, [r0]
   bd664:	e5933008 	ldr	r3, [r3, #8]
   bd668:	e12fff33 	blx	r3
   bd66c:	eaffffc5 	b	bd588 <mixerengine::SoundColorFxSpace::initialize()+0xb0>
   bd670:	e3530073 	cmp	r3, #115	@ 0x73
   bd674:	e3a02000 	mov	r2, #0
   bd678:	e3a01000 	mov	r1, #0
   bd67c:	e3a03001 	mov	r3, #1
   bd680:	e5802030 	str	r2, [r0, #48]	@ 0x30
   bd684:	edc47a0d 	vstr	s15, [r4, #52]	@ 0x34
   bd688:	e5801050 	str	r1, [r0, #80]	@ 0x50
   bd68c:	e5802058 	str	r2, [r0, #88]	@ 0x58
   bd690:	e580205c 	str	r2, [r0, #92]	@ 0x5c
   bd694:	e5802060 	str	r2, [r0, #96]	@ 0x60
   bd698:	e5802064 	str	r2, [r0, #100]	@ 0x64
   bd69c:	e5802068 	str	r2, [r0, #104]	@ 0x68
   bd6a0:	e5803054 	str	r3, [r0, #84]	@ 0x54
   bd6a4:	daffffdc 	ble	bd61c <mixerengine::SoundColorFxSpace::initialize()+0x144>
   bd6a8:	eaffffa2 	b	bd538 <mixerengine::SoundColorFxSpace::initialize()+0x60>
   bd6ac:	437fe666 	.word	0x437fe666
   bd6b0:	0042d230 	.word	0x0042d230
   bd6b4:	0042d248 	.word	0x0042d248
   bd6b8:	0042d200 	.word	0x0042d200
   bd6bc:	0042d218 	.word	0x0042d218

000bd6c0 <mixerengine::SoundColorFxSpace::changeColorValue()>:
   bd6c0:	e12fff1e 	bx	lr

000bd6c4 <mixerengine::SoundColorFxSpace::changeColorParameter()>:
   bd6c4:	e12fff1e 	bx	lr

000bd6c8 <mixerengine::SoundColorFxSpace::changeCfxStatus_On()>:
   bd6c8:	e30e395c 	movw	r3, #59740	@ 0xe95c
   bd6cc:	e3433bde 	movt	r3, #15326	@ 0x3bde
   bd6d0:	e58030ac 	str	r3, [r0, #172]	@ 0xac
   bd6d4:	e3a00001 	mov	r0, #1
   bd6d8:	e12fff1e 	bx	lr

000bd6dc <mixerengine::SoundColorFxSpace::changeCfxStatus_Off()>:
   bd6dc:	e30e395c 	movw	r3, #59740	@ 0xe95c
   bd6e0:	e34b3bde 	movt	r3, #48094	@ 0xbbde
   bd6e4:	e58030ac 	str	r3, [r0, #172]	@ 0xac
   bd6e8:	e3a00001 	mov	r0, #1
   bd6ec:	e12fff1e 	bx	lr

000bd6f0 <mixerengine::SoundColorFxSpace::~SoundColorFxSpace()>:
   bd6f0:	e92d4010 	push	{r4, lr}
   bd6f4:	e1a04000 	mov	r4, r0
   bd6f8:	e5900038 	ldr	r0, [r0, #56]	@ 0x38
   bd6fc:	e59f30a8 	ldr	r3, [pc, #168]	@ bd7ac <mixerengine::SoundColorFxSpace::~SoundColorFxSpace()+0xbc>
   bd700:	e3500000 	cmp	r0, #0
   bd704:	e5843000 	str	r3, [r4]
   bd708:	0a000000 	beq	bd710 <mixerengine::SoundColorFxSpace::~SoundColorFxSpace()+0x20>
   bd70c:	ebfd4656 	bl	f06c <operator delete[](void*)@plt>
   bd710:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   bd714:	e3500000 	cmp	r0, #0
   bd718:	0a000000 	beq	bd720 <mixerengine::SoundColorFxSpace::~SoundColorFxSpace()+0x30>
   bd71c:	ebfd4652 	bl	f06c <operator delete[](void*)@plt>
   bd720:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   bd724:	e3500000 	cmp	r0, #0
   bd728:	0a000000 	beq	bd730 <mixerengine::SoundColorFxSpace::~SoundColorFxSpace()+0x40>
   bd72c:	ebfd464e 	bl	f06c <operator delete[](void*)@plt>
   bd730:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   bd734:	e3500000 	cmp	r0, #0
   bd738:	0a000000 	beq	bd740 <mixerengine::SoundColorFxSpace::~SoundColorFxSpace()+0x50>
   bd73c:	ebfd464a 	bl	f06c <operator delete[](void*)@plt>
   bd740:	e5940048 	ldr	r0, [r4, #72]	@ 0x48
   bd744:	e3500000 	cmp	r0, #0
   bd748:	0a000000 	beq	bd750 <mixerengine::SoundColorFxSpace::~SoundColorFxSpace()+0x60>
   bd74c:	ebfd4646 	bl	f06c <operator delete[](void*)@plt>
   bd750:	e594004c 	ldr	r0, [r4, #76]	@ 0x4c
   bd754:	e3500000 	cmp	r0, #0
   bd758:	0a000000 	beq	bd760 <mixerengine::SoundColorFxSpace::~SoundColorFxSpace()+0x70>
   bd75c:	ebfd4642 	bl	f06c <operator delete[](void*)@plt>
   bd760:	e5940084 	ldr	r0, [r4, #132]	@ 0x84
   bd764:	e3500000 	cmp	r0, #0
   bd768:	0a000002 	beq	bd778 <mixerengine::SoundColorFxSpace::~SoundColorFxSpace()+0x88>
   bd76c:	e5903000 	ldr	r3, [r0]
   bd770:	e5933004 	ldr	r3, [r3, #4]
   bd774:	e12fff33 	blx	r3
   bd778:	e5940088 	ldr	r0, [r4, #136]	@ 0x88
   bd77c:	e3500000 	cmp	r0, #0
   bd780:	0a000002 	beq	bd790 <mixerengine::SoundColorFxSpace::~SoundColorFxSpace()+0xa0>
   bd784:	e5903000 	ldr	r3, [r0]
   bd788:	e5933004 	ldr	r3, [r3, #4]
   bd78c:	e12fff33 	blx	r3
   bd790:	e59f3018 	ldr	r3, [pc, #24]	@ bd7b0 <mixerengine::SoundColorFxSpace::~SoundColorFxSpace()+0xc0>
   bd794:	e1a00004 	mov	r0, r4
   bd798:	e5843000 	str	r3, [r4]
   bd79c:	e8bd8010 	pop	{r4, pc}
   bd7a0:	e59f3008 	ldr	r3, [pc, #8]	@ bd7b0 <mixerengine::SoundColorFxSpace::~SoundColorFxSpace()+0xc0>
   bd7a4:	e5843000 	str	r3, [r4]
   bd7a8:	ebfd45c3 	bl	eebc <__cxa_end_cleanup@plt>
   bd7ac:	0042d268 	.word	0x0042d268
   bd7b0:	0041db60 	.word	0x0041db60

000bd7b4 <mixerengine::SoundColorFxSpace::~SoundColorFxSpace()>:
   bd7b4:	e92d4010 	push	{r4, lr}
   bd7b8:	e1a04000 	mov	r4, r0
   bd7bc:	ebffffcb 	bl	bd6f0 <mixerengine::SoundColorFxSpace::~SoundColorFxSpace()>
   bd7c0:	e1a00004 	mov	r0, r4
   bd7c4:	ebfd4541 	bl	ecd0 <operator delete(void*)@plt>
   bd7c8:	e1a00004 	mov	r0, r4
   bd7cc:	e8bd8010 	pop	{r4, pc}

000bd7d0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)>:
   bd7d0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   bd7d4:	ed2d8b04 	vpush	{d8-d9}
   bd7d8:	e1a09001 	mov	r9, r1
   bd7dc:	e5d01024 	ldrb	r1, [r0, #36]	@ 0x24
   bd7e0:	e24dd01c 	sub	sp, sp, #28
   bd7e4:	e1a05000 	mov	r5, r0
   bd7e8:	e1a04003 	mov	r4, r3
   bd7ec:	e3510000 	cmp	r1, #0
   bd7f0:	e58d2008 	str	r2, [sp, #8]
   bd7f4:	1a0003a3 	bne	be688 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xeb8>
   bd7f8:	e3540000 	cmp	r4, #0
   bd7fc:	edd57a2a 	vldr	s15, [r5, #168]	@ 0xa8
   bd800:	edd56a2b 	vldr	s13, [r5, #172]	@ 0xac
   bd804:	da00000f 	ble	bd848 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x78>
   bd808:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   bd80c:	e59f3414 	ldr	r3, [pc, #1044]	@ bdc28 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x458>
   bd810:	ed9f6af6 	vldr	s12, [pc, #984]	@ bdbf0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x420>
   bd814:	e0832104 	add	r2, r3, r4, lsl #2
   bd818:	ee777aa6 	vadd.f32	s15, s15, s13
   bd81c:	eef47ac7 	vcmpe.f32	s15, s14
   bd820:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bd824:	cef77a00 	vmovgt.f32	s15, #112	@ 0x3f800000  1.0
   bd828:	ca000002 	bgt	bd838 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x68>
   bd82c:	eef57a40 	vcmp.f32	s15, #0.0
   bd830:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bd834:	4ef07a46 	vmovmi.f32	s15, s12
   bd838:	ee170a90 	vmov	r0, s15
   bd83c:	e5a30004 	str	r0, [r3, #4]!
   bd840:	e1530002 	cmp	r3, r2
   bd844:	1afffff3 	bne	bd818 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x48>
   bd848:	ed9f7ae9 	vldr	s14, [pc, #932]	@ bdbf4 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x424>
   bd84c:	edd56a08 	vldr	s13, [r5, #32]
   bd850:	ee666a87 	vmul.f32	s13, s13, s14
   bd854:	edc57a2a 	vstr	s15, [r5, #168]	@ 0xa8
   bd858:	ee667a87 	vmul.f32	s15, s13, s14
   bd85c:	eefd7ae7 	vcvt.s32.f32	s15, s15
   bd860:	ee171a90 	vmov	r1, s15
   bd864:	e3510000 	cmp	r1, #0
   bd868:	b3a01000 	movlt	r1, #0
   bd86c:	ba000001 	blt	bd878 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xa8>
   bd870:	e35100ff 	cmp	r1, #255	@ 0xff
   bd874:	a3a010ff 	movge	r1, #255	@ 0xff
   bd878:	ed957a07 	vldr	s14, [r5, #28]
   bd87c:	eddf7adc 	vldr	s15, [pc, #880]	@ bdbf4 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x424>
   bd880:	ee677a27 	vmul.f32	s15, s14, s15
   bd884:	eefd7ae7 	vcvt.s32.f32	s15, s15
   bd888:	ee173a90 	vmov	r3, s15
   bd88c:	e3530000 	cmp	r3, #0
   bd890:	b3a03000 	movlt	r3, #0
   bd894:	ba000001 	blt	bd8a0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xd0>
   bd898:	e35300ff 	cmp	r3, #255	@ 0xff
   bd89c:	a3a030ff 	movge	r3, #255	@ 0xff
   bd8a0:	e595202c 	ldr	r2, [r5, #44]	@ 0x2c
   bd8a4:	e3520001 	cmp	r2, #1
   bd8a8:	e5952034 	ldr	r2, [r5, #52]	@ 0x34
   bd8ac:	0a0003a3 	beq	be740 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xf70>
   bd8b0:	e1530002 	cmp	r3, r2
   bd8b4:	da00023e 	ble	be1b4 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x9e4>
   bd8b8:	e2822001 	add	r2, r2, #1
   bd8bc:	e5852034 	str	r2, [r5, #52]	@ 0x34
   bd8c0:	e1530002 	cmp	r3, r2
   bd8c4:	b5853034 	strlt	r3, [r5, #52]	@ 0x34
   bd8c8:	b1a02003 	movlt	r2, r3
   bd8cc:	e352008b 	cmp	r2, #139	@ 0x8b
   bd8d0:	c3a0308b 	movgt	r3, #139	@ 0x8b
   bd8d4:	c5853034 	strgt	r3, [r5, #52]	@ 0x34
   bd8d8:	c1a02003 	movgt	r2, r3
   bd8dc:	c3a03001 	movgt	r3, #1
   bd8e0:	c5853030 	strgt	r3, [r5, #48]	@ 0x30
   bd8e4:	e3510073 	cmp	r1, #115	@ 0x73
   bd8e8:	ca00023f 	bgt	be1ec <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xa1c>
   bd8ec:	ee041a90 	vmov	s9, r1
   bd8f0:	eeb87ae4 	vcvt.f32.s32	s14, s9
   bd8f4:	eddf7abf 	vldr	s15, [pc, #764]	@ bdbf8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x428>
   bd8f8:	ee677a27 	vmul.f32	s15, s14, s15
   bd8fc:	ed9f7abe 	vldr	s14, [pc, #760]	@ bdbfc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x42c>
   bd900:	ee276a87 	vmul.f32	s12, s15, s14
   bd904:	ed9f7abd 	vldr	s14, [pc, #756]	@ bdc00 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x430>
   bd908:	ee676a87 	vmul.f32	s13, s15, s14
   bd90c:	e3520073 	cmp	r2, #115	@ 0x73
   bd910:	ca00023b 	bgt	be204 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xa34>
   bd914:	ee072a10 	vmov	s14, r2
   bd918:	eeb85ac7 	vcvt.f32.s32	s10, s14
   bd91c:	eddf5ab5 	vldr	s11, [pc, #724]	@ bdbf8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x428>
   bd920:	e2622074 	rsb	r2, r2, #116	@ 0x74
   bd924:	ee042a90 	vmov	s9, r2
   bd928:	eddf7ab5 	vldr	s15, [pc, #724]	@ bdc04 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x434>
   bd92c:	ed9f7ab5 	vldr	s14, [pc, #724]	@ bdc08 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x438>
   bd930:	ee655a25 	vmul.f32	s11, s10, s11
   bd934:	eeb75a00 	vmov.f32	s10, #112	@ 0x3f800000  1.0
   bd938:	eeb84ae4 	vcvt.f32.s32	s8, s9
   bd93c:	eef04a45 	vmov.f32	s9, s10
   bd940:	ee454ae5 	vmls.f32	s9, s11, s11
   bd944:	eef05a64 	vmov.f32	s11, s9
   bd948:	eddf4aaf 	vldr	s9, [pc, #700]	@ bdc0c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x43c>
   bd94c:	ee457a86 	vmla.f32	s15, s11, s12
   bd950:	ee067aa5 	vmla.f32	s14, s13, s11
   bd954:	ee248a24 	vmul.f32	s16, s8, s9
   bd958:	eeb48ac5 	vcmpe.f32	s16, s10
   bd95c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bd960:	d3a06000 	movle	r6, #0
   bd964:	c3a06001 	movgt	r6, #1
   bd968:	e5950084 	ldr	r0, [r5, #132]	@ 0x84
   bd96c:	ed857a24 	vstr	s14, [r5, #144]	@ 0x90
   bd970:	e59f12b4 	ldr	r1, [pc, #692]	@ bdc2c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x45c>
   bd974:	edc57a23 	vstr	s15, [r5, #140]	@ 0x8c
   bd978:	e300768f 	movw	r7, #1679	@ 0x68f
   bd97c:	e300ccae 	movw	ip, #3246	@ 0xcae
   bd980:	e5903000 	ldr	r3, [r0]
   bd984:	eddf8aa1 	vldr	s17, [pc, #644]	@ bdc10 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x440>
   bd988:	e58d7014 	str	r7, [sp, #20]
   bd98c:	e28770c5 	add	r7, r7, #197	@ 0xc5
   bd990:	e58dc010 	str	ip, [sp, #16]
   bd994:	e300c4c7 	movw	ip, #1223	@ 0x4c7
   bd998:	e5933008 	ldr	r3, [r3, #8]
   bd99c:	ed9f9a9c 	vldr	s18, [pc, #624]	@ bdc14 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x444>
   bd9a0:	e58dc004 	str	ip, [sp, #4]
   bd9a4:	e58d700c 	str	r7, [sp, #12]
   bd9a8:	e12fff33 	blx	r3
   bd9ac:	e5950088 	ldr	r0, [r5, #136]	@ 0x88
   bd9b0:	e59f1278 	ldr	r1, [pc, #632]	@ bdc30 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x460>
   bd9b4:	e5903000 	ldr	r3, [r0]
   bd9b8:	e5933008 	ldr	r3, [r3, #8]
   bd9bc:	e12fff33 	blx	r3
   bd9c0:	eeb65a00 	vmov.f32	s10, #96	@ 0x3f000000  0.5
   bd9c4:	e595306c 	ldr	r3, [r5, #108]	@ 0x6c
   bd9c8:	ed9f7a92 	vldr	s14, [pc, #584]	@ bdc18 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x448>
   bd9cc:	e59d7004 	ldr	r7, [sp, #4]
   bd9d0:	eddf6a91 	vldr	s13, [pc, #580]	@ bdc1c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x44c>
   bd9d4:	edd57a28 	vldr	s15, [r5, #160]	@ 0xa0
   bd9d8:	e1530007 	cmp	r3, r7
   bd9dc:	0ef06a47 	vmoveq.f32	s13, s14
   bd9e0:	e3540000 	cmp	r4, #0
   bd9e4:	da00000f 	ble	bda28 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x258>
   bd9e8:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   bd9ec:	e59f3240 	ldr	r3, [pc, #576]	@ bdc34 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x464>
   bd9f0:	ed9f6a7e 	vldr	s12, [pc, #504]	@ bdbf0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x420>
   bd9f4:	e0832104 	add	r2, r3, r4, lsl #2
   bd9f8:	ee777aa6 	vadd.f32	s15, s15, s13
   bd9fc:	eef47ac7 	vcmpe.f32	s15, s14
   bda00:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bda04:	cef77a00 	vmovgt.f32	s15, #112	@ 0x3f800000  1.0
   bda08:	ca000002 	bgt	bda18 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x248>
   bda0c:	eef57a40 	vcmp.f32	s15, #0.0
   bda10:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bda14:	4ef07a46 	vmovmi.f32	s15, s12
   bda18:	ee17ca90 	vmov	ip, s15
   bda1c:	e5a3c004 	str	ip, [r3, #4]!
   bda20:	e1530002 	cmp	r3, r2
   bda24:	1afffff3 	bne	bd9f8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x228>
   bda28:	edc57a28 	vstr	s15, [r5, #160]	@ 0xa0
   bda2c:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   bda30:	e3560000 	cmp	r6, #0
   bda34:	ed957a27 	vldr	s14, [r5, #156]	@ 0x9c
   bda38:	1eb08a67 	vmovne.f32	s16, s15
   bda3c:	e3540000 	cmp	r4, #0
   bda40:	eddf7a76 	vldr	s15, [pc, #472]	@ bdc20 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x450>
   bda44:	ee786a47 	vsub.f32	s13, s16, s14
   bda48:	ee664aa7 	vmul.f32	s9, s13, s15
   bda4c:	da000012 	ble	bda9c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x2cc>
   bda50:	e59f31d0 	ldr	r3, [pc, #464]	@ bdc28 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x458>
   bda54:	e2892004 	add	r2, r9, #4
   bda58:	e2831c02 	add	r1, r3, #512	@ 0x200
   bda5c:	e0830104 	add	r0, r3, r4, lsl #2
   bda60:	ee377a24 	vadd.f32	s14, s14, s9
   bda64:	e2833004 	add	r3, r3, #4
   bda68:	edd37a00 	vldr	s15, [r3]
   bda6c:	ed126a01 	vldr	s12, [r2, #-4]
   bda70:	e1a07002 	mov	r7, r2
   bda74:	edd76a00 	vldr	s13, [r7]
   bda78:	e1530000 	cmp	r3, r0
   bda7c:	e2822008 	add	r2, r2, #8
   bda80:	ee655a07 	vmul.f32	s11, s10, s14
   bda84:	ee657aa7 	vmul.f32	s15, s11, s15
   bda88:	ee766a26 	vadd.f32	s13, s12, s13
   bda8c:	ee667aa7 	vmul.f32	s15, s13, s15
   bda90:	ee17ca90 	vmov	ip, s15
   bda94:	e5a1c004 	str	ip, [r1, #4]!
   bda98:	1afffff0 	bne	bda60 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x290>
   bda9c:	e5950084 	ldr	r0, [r5, #132]	@ 0x84
   bdaa0:	e1a03004 	mov	r3, r4
   bdaa4:	e59f118c 	ldr	r1, [pc, #396]	@ bdc38 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x468>
   bdaa8:	ed858a27 	vstr	s16, [r5, #156]	@ 0x9c
   bdaac:	e590c000 	ldr	ip, [r0]
   bdab0:	e2812c01 	add	r2, r1, #256	@ 0x100
   bdab4:	e59cc010 	ldr	ip, [ip, #16]
   bdab8:	e12fff3c 	blx	ip
   bdabc:	e5950088 	ldr	r0, [r5, #136]	@ 0x88
   bdac0:	e59f1174 	ldr	r1, [pc, #372]	@ bdc3c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x46c>
   bdac4:	e1a03004 	mov	r3, r4
   bdac8:	e590c000 	ldr	ip, [r0]
   bdacc:	e2412c01 	sub	r2, r1, #256	@ 0x100
   bdad0:	e59cc010 	ldr	ip, [ip, #16]
   bdad4:	e12fff3c 	blx	ip
   bdad8:	edd57a14 	vldr	s15, [r5, #80]	@ 0x50
   bdadc:	eefd7ae7 	vcvt.s32.f32	s15, s15
   bdae0:	e5953054 	ldr	r3, [r5, #84]	@ 0x54
   bdae4:	e3530001 	cmp	r3, #1
   bdae8:	ee176a90 	vmov	r6, s15
   bdaec:	0a0002e9 	beq	be698 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xec8>
   bdaf0:	e595106c 	ldr	r1, [r5, #108]	@ 0x6c
   bdaf4:	e5958038 	ldr	r8, [r5, #56]	@ 0x38
   bdaf8:	e0561001 	subs	r1, r6, r1
   bdafc:	42811902 	addmi	r1, r1, #32768	@ 0x8000
   bdb00:	e0817004 	add	r7, r1, r4
   bdb04:	e3570902 	cmp	r7, #32768	@ 0x8000
   bdb08:	ba0002d9 	blt	be674 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xea4>
   bdb0c:	e261b902 	rsb	fp, r1, #32768	@ 0x8000
   bdb10:	e59fa128 	ldr	sl, [pc, #296]	@ bdc40 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x470>
   bdb14:	e0881101 	add	r1, r8, r1, lsl #2
   bdb18:	e1a0b10b 	lsl	fp, fp, #2
   bdb1c:	e1a0000a 	mov	r0, sl
   bdb20:	e1a0200b 	mov	r2, fp
   bdb24:	ebfd45f5 	bl	f300 <memcpy@plt>
   bdb28:	e2572902 	subs	r2, r7, #32768	@ 0x8000
   bdb2c:	0a000003 	beq	bdb40 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x370>
   bdb30:	e08a000b 	add	r0, sl, fp
   bdb34:	e1a01008 	mov	r1, r8
   bdb38:	e1a02102 	lsl	r2, r2, #2
   bdb3c:	ebfd45ef 	bl	f300 <memcpy@plt>
   bdb40:	e3540000 	cmp	r4, #0
   bdb44:	da000017 	ble	bdba8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x3d8>
   bdb48:	e59f20f4 	ldr	r2, [pc, #244]	@ bdc44 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x474>
   bdb4c:	e3a03000 	mov	r3, #0
   bdb50:	eddf5a33 	vldr	s11, [pc, #204]	@ bdc24 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x454>
   bdb54:	e282ec02 	add	lr, r2, #512	@ 0x200
   bdb58:	e242cc01 	sub	ip, r2, #256	@ 0x100
   bdb5c:	e2420c03 	sub	r0, r2, #768	@ 0x300
   bdb60:	e2421b01 	sub	r1, r2, #1024	@ 0x400
   bdb64:	e28ee004 	add	lr, lr, #4
   bdb68:	edde6a00 	vldr	s13, [lr]
   bdb6c:	ee266aa5 	vmul.f32	s12, s13, s11
   bdb70:	e28cc004 	add	ip, ip, #4
   bdb74:	e2822004 	add	r2, r2, #4
   bdb78:	ed9c7a00 	vldr	s14, [ip]
   bdb7c:	edd27a00 	vldr	s15, [r2]
   bdb80:	e2833001 	add	r3, r3, #1
   bdb84:	e1530004 	cmp	r3, r4
   bdb88:	ee467a47 	vmls.f32	s15, s12, s14
   bdb8c:	eef04a67 	vmov.f32	s9, s15
   bdb90:	ee177a90 	vmov	r7, s15
   bdb94:	e5a07004 	str	r7, [r0, #4]!
   bdb98:	ee464a87 	vmla.f32	s9, s13, s14
   bdb9c:	ee147a90 	vmov	r7, s9
   bdba0:	e5a17004 	str	r7, [r1, #4]!
   bdba4:	1affffee 	bne	bdb64 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x394>
   bdba8:	e084b006 	add	fp, r4, r6
   bdbac:	e5957038 	ldr	r7, [r5, #56]	@ 0x38
   bdbb0:	e35b0902 	cmp	fp, #32768	@ 0x8000
   bdbb4:	ba0002a9 	blt	be660 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xe90>
   bdbb8:	e2663902 	rsb	r3, r6, #32768	@ 0x8000
   bdbbc:	e59f8090 	ldr	r8, [pc, #144]	@ bdc54 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x484>
   bdbc0:	e0870106 	add	r0, r7, r6, lsl #2
   bdbc4:	e1a06103 	lsl	r6, r3, #2
   bdbc8:	e1a01008 	mov	r1, r8
   bdbcc:	e1a02006 	mov	r2, r6
   bdbd0:	ebfd45ca 	bl	f300 <memcpy@plt>
   bdbd4:	e25bb902 	subs	fp, fp, #32768	@ 0x8000
   bdbd8:	0a00001f 	beq	bdc5c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x48c>
   bdbdc:	e1a00007 	mov	r0, r7
   bdbe0:	e0881006 	add	r1, r8, r6
   bdbe4:	e1a0210b 	lsl	r2, fp, #2
   bdbe8:	ebfd45c4 	bl	f300 <memcpy@plt>
   bdbec:	ea00001a 	b	bdc5c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x48c>
   bdbf0:	00000000 	.word	0x00000000
   bdbf4:	437fe666 	.word	0x437fe666
   bdbf8:	3c0d3dcb 	.word	0x3c0d3dcb
   bdbfc:	3f29c0fe 	.word	0x3f29c0fe
   bdc00:	3f425f20 	.word	0x3f425f20
   bdc04:	3e8295e4 	.word	0x3e8295e4
   bdc08:	3de8c4aa 	.word	0x3de8c4aa
   bdc0c:	3d0d3dcb 	.word	0x3d0d3dcb
   bdc10:	3f2dc3ae 	.word	0x3f2dc3ae
   bdc14:	3ea478a3 	.word	0x3ea478a3
   bdc18:	3d0b51d8 	.word	0x3d0b51d8
   bdc1c:	bd0b51d8 	.word	0xbd0b51d8
   bdc20:	3d0b51da 	.word	0x3d0b51da
   bdc24:	3f4ccccd 	.word	0x3f4ccccd
   bdc28:	0114b734 	.word	0x0114b734
   bdc2c:	0042d200 	.word	0x0042d200
   bdc30:	0042d218 	.word	0x0042d218
   bdc34:	0114b834 	.word	0x0114b834
   bdc38:	0114b938 	.word	0x0114b938
   bdc3c:	0114ba38 	.word	0x0114ba38
   bdc40:	0114bb38 	.word	0x0114bb38
   bdc44:	0114b934 	.word	0x0114b934
   bdc48:	0114b538 	.word	0x0114b538
   bdc4c:	0114bc38 	.word	0x0114bc38
   bdc50:	0114b634 	.word	0x0114b634
   bdc54:	0114b638 	.word	0x0114b638
   bdc58:	0114b534 	.word	0x0114b534
   bdc5c:	edd57a14 	vldr	s15, [r5, #80]	@ 0x50
   bdc60:	eefd7ae7 	vcvt.s32.f32	s15, s15
   bdc64:	e5953054 	ldr	r3, [r5, #84]	@ 0x54
   bdc68:	e3530002 	cmp	r3, #2
   bdc6c:	ee176a90 	vmov	r6, s15
   bdc70:	ca00024b 	bgt	be5a4 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xdd4>
   bdc74:	e595305c 	ldr	r3, [r5, #92]	@ 0x5c
   bdc78:	e3002767 	movw	r2, #1895	@ 0x767
   bdc7c:	e0843003 	add	r3, r4, r3
   bdc80:	e585305c 	str	r3, [r5, #92]	@ 0x5c
   bdc84:	e1530002 	cmp	r3, r2
   bdc88:	c3a03003 	movgt	r3, #3
   bdc8c:	c5853054 	strgt	r3, [r5, #84]	@ 0x54
   bdc90:	e3540000 	cmp	r4, #0
   bdc94:	da00001a 	ble	bdd04 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x534>
   bdc98:	e1a0e0a4 	lsr	lr, r4, #1
   bdc9c:	e35e0000 	cmp	lr, #0
   bdca0:	13540001 	cmpne	r4, #1
   bdca4:	e1a0708e 	lsl	r7, lr, #1
   bdca8:	83a03000 	movhi	r3, #0
   bdcac:	93a03001 	movls	r3, #1
   bdcb0:	9a000345 	bls	be9cc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x11fc>
   bdcb4:	e51f0074 	ldr	r0, [pc, #-116]	@ bdc48 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x478>
   bdcb8:	e280cc01 	add	ip, r0, #256	@ 0x100
   bdcbc:	e1a01000 	mov	r1, r0
   bdcc0:	e1a0200c 	mov	r2, ip
   bdcc4:	e2833001 	add	r3, r3, #1
   bdcc8:	ecf10b02 	vldmia	r1!, {d16}
   bdccc:	e15e0003 	cmp	lr, r3
   bdcd0:	ece20b02 	vstmia	r2!, {d16}
   bdcd4:	8afffffa 	bhi	bdcc4 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x4f4>
   bdcd8:	e1540007 	cmp	r4, r7
   bdcdc:	0a000008 	beq	bdd04 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x534>
   bdce0:	e2473001 	sub	r3, r7, #1
   bdce4:	e1a03103 	lsl	r3, r3, #2
   bdce8:	e0800003 	add	r0, r0, r3
   bdcec:	e08c3003 	add	r3, ip, r3
   bdcf0:	e5b02004 	ldr	r2, [r0, #4]!
   bdcf4:	e2877001 	add	r7, r7, #1
   bdcf8:	e1540007 	cmp	r4, r7
   bdcfc:	e5a32004 	str	r2, [r3, #4]!
   bdd00:	cafffffa 	bgt	bdcf0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x520>
   bdd04:	e0847006 	add	r7, r4, r6
   bdd08:	e595803c 	ldr	r8, [r5, #60]	@ 0x3c
   bdd0c:	e3570902 	cmp	r7, #32768	@ 0x8000
   bdd10:	ba00021e 	blt	be590 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xdc0>
   bdd14:	e2663902 	rsb	r3, r6, #32768	@ 0x8000
   bdd18:	e51fa0cc 	ldr	sl, [pc, #-204]	@ bdc54 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x484>
   bdd1c:	e0880106 	add	r0, r8, r6, lsl #2
   bdd20:	e1a06103 	lsl	r6, r3, #2
   bdd24:	e1a0100a 	mov	r1, sl
   bdd28:	e1a02006 	mov	r2, r6
   bdd2c:	ebfd4573 	bl	f300 <memcpy@plt>
   bdd30:	e2572902 	subs	r2, r7, #32768	@ 0x8000
   bdd34:	0a000003 	beq	bdd48 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x578>
   bdd38:	e1a00008 	mov	r0, r8
   bdd3c:	e08a1006 	add	r1, sl, r6
   bdd40:	e1a02102 	lsl	r2, r2, #2
   bdd44:	ebfd456d 	bl	f300 <memcpy@plt>
   bdd48:	edd57a14 	vldr	s15, [r5, #80]	@ 0x50
   bdd4c:	eefd7ae7 	vcvt.s32.f32	s15, s15
   bdd50:	e5953054 	ldr	r3, [r5, #84]	@ 0x54
   bdd54:	e3530003 	cmp	r3, #3
   bdd58:	ee176a90 	vmov	r6, s15
   bdd5c:	ca0001dc 	bgt	be4d4 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xd04>
   bdd60:	e5953060 	ldr	r3, [r5, #96]	@ 0x60
   bdd64:	e3002cbe 	movw	r2, #3262	@ 0xcbe
   bdd68:	e0843003 	add	r3, r4, r3
   bdd6c:	e5853060 	str	r3, [r5, #96]	@ 0x60
   bdd70:	e1530002 	cmp	r3, r2
   bdd74:	c3a03004 	movgt	r3, #4
   bdd78:	c5853054 	strgt	r3, [r5, #84]	@ 0x54
   bdd7c:	e3540000 	cmp	r4, #0
   bdd80:	da00001a 	ble	bddf0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x620>
   bdd84:	e1a0e0a4 	lsr	lr, r4, #1
   bdd88:	e35e0000 	cmp	lr, #0
   bdd8c:	13540001 	cmpne	r4, #1
   bdd90:	e1a0708e 	lsl	r7, lr, #1
   bdd94:	83a03000 	movhi	r3, #0
   bdd98:	93a03001 	movls	r3, #1
   bdd9c:	9a00030e 	bls	be9dc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x120c>
   bdda0:	e51f0160 	ldr	r0, [pc, #-352]	@ bdc48 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x478>
   bdda4:	e280cc01 	add	ip, r0, #256	@ 0x100
   bdda8:	e1a01000 	mov	r1, r0
   bddac:	e1a0200c 	mov	r2, ip
   bddb0:	e2833001 	add	r3, r3, #1
   bddb4:	ecf10b02 	vldmia	r1!, {d16}
   bddb8:	e153000e 	cmp	r3, lr
   bddbc:	ece20b02 	vstmia	r2!, {d16}
   bddc0:	3afffffa 	bcc	bddb0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x5e0>
   bddc4:	e1540007 	cmp	r4, r7
   bddc8:	0a000008 	beq	bddf0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x620>
   bddcc:	e2473001 	sub	r3, r7, #1
   bddd0:	e1a03103 	lsl	r3, r3, #2
   bddd4:	e0800003 	add	r0, r0, r3
   bddd8:	e08c3003 	add	r3, ip, r3
   bdddc:	e5b02004 	ldr	r2, [r0, #4]!
   bdde0:	e2877001 	add	r7, r7, #1
   bdde4:	e1540007 	cmp	r4, r7
   bdde8:	e5a32004 	str	r2, [r3, #4]!
   bddec:	cafffffa 	bgt	bdddc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x60c>
   bddf0:	e0847006 	add	r7, r4, r6
   bddf4:	e5958040 	ldr	r8, [r5, #64]	@ 0x40
   bddf8:	e3570902 	cmp	r7, #32768	@ 0x8000
   bddfc:	ba00019a 	blt	be46c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xc9c>
   bde00:	e2663902 	rsb	r3, r6, #32768	@ 0x8000
   bde04:	e51fa1b8 	ldr	sl, [pc, #-440]	@ bdc54 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x484>
   bde08:	e0880106 	add	r0, r8, r6, lsl #2
   bde0c:	e1a06103 	lsl	r6, r3, #2
   bde10:	e1a0100a 	mov	r1, sl
   bde14:	e1a02006 	mov	r2, r6
   bde18:	ebfd4538 	bl	f300 <memcpy@plt>
   bde1c:	e2572902 	subs	r2, r7, #32768	@ 0x8000
   bde20:	0a000003 	beq	bde34 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x664>
   bde24:	e1a00008 	mov	r0, r8
   bde28:	e08a1006 	add	r1, sl, r6
   bde2c:	e1a02102 	lsl	r2, r2, #2
   bde30:	ebfd4532 	bl	f300 <memcpy@plt>
   bde34:	e3540000 	cmp	r4, #0
   bde38:	da00000c 	ble	bde70 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x6a0>
   bde3c:	e51f31ec 	ldr	r3, [pc, #-492]	@ bdc58 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x488>
   bde40:	e2831b01 	add	r1, r3, #1024	@ 0x400
   bde44:	e2832c07 	add	r2, r3, #1792	@ 0x700
   bde48:	e0830104 	add	r0, r3, r4, lsl #2
   bde4c:	e2833004 	add	r3, r3, #4
   bde50:	e2811004 	add	r1, r1, #4
   bde54:	ed937a00 	vldr	s14, [r3]
   bde58:	edd17a00 	vldr	s15, [r1]
   bde5c:	ee777a67 	vsub.f32	s15, s14, s15
   bde60:	e1530000 	cmp	r3, r0
   bde64:	ee177a90 	vmov	r7, s15
   bde68:	e5a27004 	str	r7, [r2, #4]!
   bde6c:	1afffff6 	bne	bde4c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x67c>
   bde70:	edd57a14 	vldr	s15, [r5, #80]	@ 0x50
   bde74:	eefd7ae7 	vcvt.s32.f32	s15, s15
   bde78:	e5953054 	ldr	r3, [r5, #84]	@ 0x54
   bde7c:	e3530003 	cmp	r3, #3
   bde80:	ee176a90 	vmov	r6, s15
   bde84:	ca000149 	bgt	be3b0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xbe0>
   bde88:	e3540000 	cmp	r4, #0
   bde8c:	da00001a 	ble	bdefc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x72c>
   bde90:	e1a0e0a4 	lsr	lr, r4, #1
   bde94:	e35e0000 	cmp	lr, #0
   bde98:	13540001 	cmpne	r4, #1
   bde9c:	e1a0708e 	lsl	r7, lr, #1
   bdea0:	83a03000 	movhi	r3, #0
   bdea4:	93a03001 	movls	r3, #1
   bdea8:	9a0002cf 	bls	be9ec <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x121c>
   bdeac:	e51f026c 	ldr	r0, [pc, #-620]	@ bdc48 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x478>
   bdeb0:	e280cc01 	add	ip, r0, #256	@ 0x100
   bdeb4:	e1a01000 	mov	r1, r0
   bdeb8:	e1a0200c 	mov	r2, ip
   bdebc:	e2833001 	add	r3, r3, #1
   bdec0:	ecf10b02 	vldmia	r1!, {d16}
   bdec4:	e153000e 	cmp	r3, lr
   bdec8:	ece20b02 	vstmia	r2!, {d16}
   bdecc:	3afffffa 	bcc	bdebc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x6ec>
   bded0:	e1540007 	cmp	r4, r7
   bded4:	0a000008 	beq	bdefc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x72c>
   bded8:	e2473001 	sub	r3, r7, #1
   bdedc:	e1a03103 	lsl	r3, r3, #2
   bdee0:	e0800003 	add	r0, r0, r3
   bdee4:	e08c3003 	add	r3, ip, r3
   bdee8:	e5b02004 	ldr	r2, [r0, #4]!
   bdeec:	e2877001 	add	r7, r7, #1
   bdef0:	e1540007 	cmp	r4, r7
   bdef4:	e5a32004 	str	r2, [r3, #4]!
   bdef8:	cafffffa 	bgt	bdee8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x718>
   bdefc:	e0847006 	add	r7, r4, r6
   bdf00:	e5958044 	ldr	r8, [r5, #68]	@ 0x44
   bdf04:	e3570902 	cmp	r7, #32768	@ 0x8000
   bdf08:	ba000123 	blt	be39c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xbcc>
   bdf0c:	e2663902 	rsb	r3, r6, #32768	@ 0x8000
   bdf10:	e51fa2c4 	ldr	sl, [pc, #-708]	@ bdc54 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x484>
   bdf14:	e0880106 	add	r0, r8, r6, lsl #2
   bdf18:	e1a06103 	lsl	r6, r3, #2
   bdf1c:	e1a0100a 	mov	r1, sl
   bdf20:	e1a02006 	mov	r2, r6
   bdf24:	ebfd44f5 	bl	f300 <memcpy@plt>
   bdf28:	e2572902 	subs	r2, r7, #32768	@ 0x8000
   bdf2c:	0a000003 	beq	bdf40 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x770>
   bdf30:	e1a00008 	mov	r0, r8
   bdf34:	e08a1006 	add	r1, sl, r6
   bdf38:	e1a02102 	lsl	r2, r2, #2
   bdf3c:	ebfd44ef 	bl	f300 <memcpy@plt>
   bdf40:	e3540000 	cmp	r4, #0
   bdf44:	da000009 	ble	bdf70 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x7a0>
   bdf48:	e51f3308 	ldr	r3, [pc, #-776]	@ bdc48 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x478>
   bdf4c:	e2832fff 	add	r2, r3, #1020	@ 0x3fc
   bdf50:	e0831104 	add	r1, r3, r4, lsl #2
   bdf54:	ed937a00 	vldr	s14, [r3]
   bdf58:	e2822004 	add	r2, r2, #4
   bdf5c:	edd27a00 	vldr	s15, [r2]
   bdf60:	ee777a67 	vsub.f32	s15, s14, s15
   bdf64:	ece37a01 	vstmia	r3!, {s15}
   bdf68:	e1530001 	cmp	r3, r1
   bdf6c:	1afffff8 	bne	bdf54 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x784>
   bdf70:	edd57a14 	vldr	s15, [r5, #80]	@ 0x50
   bdf74:	eefd7ae7 	vcvt.s32.f32	s15, s15
   bdf78:	e5953054 	ldr	r3, [r5, #84]	@ 0x54
   bdf7c:	ed958a25 	vldr	s16, [r5, #148]	@ 0x94
   bdf80:	e3530004 	cmp	r3, #4
   bdf84:	ee176a90 	vmov	r6, s15
   bdf88:	ca0000d7 	bgt	be2ec <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xb1c>
   bdf8c:	e5953064 	ldr	r3, [r5, #100]	@ 0x64
   bdf90:	e302221b 	movw	r2, #8731	@ 0x221b
   bdf94:	e0843003 	add	r3, r4, r3
   bdf98:	e5853064 	str	r3, [r5, #100]	@ 0x64
   bdf9c:	e1530002 	cmp	r3, r2
   bdfa0:	c3a03005 	movgt	r3, #5
   bdfa4:	c5853054 	strgt	r3, [r5, #84]	@ 0x54
   bdfa8:	e3540000 	cmp	r4, #0
   bdfac:	da00000b 	ble	bdfe0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x810>
   bdfb0:	e51f3370 	ldr	r3, [pc, #-880]	@ bdc48 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x478>
   bdfb4:	e28320fc 	add	r2, r3, #252	@ 0xfc
   bdfb8:	e0831104 	add	r1, r3, r4, lsl #2
   bdfbc:	edd37a00 	vldr	s15, [r3]
   bdfc0:	ee677aa8 	vmul.f32	s15, s15, s17
   bdfc4:	ee487a09 	vmla.f32	s15, s16, s18
   bdfc8:	ece37a01 	vstmia	r3!, {s15}
   bdfcc:	e1530001 	cmp	r3, r1
   bdfd0:	ee17ea90 	vmov	lr, s15
   bdfd4:	eeb08a67 	vmov.f32	s16, s15
   bdfd8:	e5a2e004 	str	lr, [r2, #4]!
   bdfdc:	1afffff6 	bne	bdfbc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x7ec>
   bdfe0:	e0847006 	add	r7, r4, r6
   bdfe4:	ed858a25 	vstr	s16, [r5, #148]	@ 0x94
   bdfe8:	e3570902 	cmp	r7, #32768	@ 0x8000
   bdfec:	e5958048 	ldr	r8, [r5, #72]	@ 0x48
   bdff0:	ba0000b8 	blt	be2d8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xb08>
   bdff4:	e2663902 	rsb	r3, r6, #32768	@ 0x8000
   bdff8:	e51fa3ac 	ldr	sl, [pc, #-940]	@ bdc54 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x484>
   bdffc:	e0880106 	add	r0, r8, r6, lsl #2
   be000:	e1a06103 	lsl	r6, r3, #2
   be004:	e1a0100a 	mov	r1, sl
   be008:	e1a02006 	mov	r2, r6
   be00c:	ebfd44bb 	bl	f300 <memcpy@plt>
   be010:	e2572902 	subs	r2, r7, #32768	@ 0x8000
   be014:	0a000003 	beq	be028 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x858>
   be018:	e1a00008 	mov	r0, r8
   be01c:	e08a1006 	add	r1, sl, r6
   be020:	e1a02102 	lsl	r2, r2, #2
   be024:	ebfd44b5 	bl	f300 <memcpy@plt>
   be028:	edd57a14 	vldr	s15, [r5, #80]	@ 0x50
   be02c:	eefd7ae7 	vcvt.s32.f32	s15, s15
   be030:	e5953054 	ldr	r3, [r5, #84]	@ 0x54
   be034:	ed958a26 	vldr	s16, [r5, #152]	@ 0x98
   be038:	e3530005 	cmp	r3, #5
   be03c:	ee176a90 	vmov	r6, s15
   be040:	ca000079 	bgt	be22c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xa5c>
   be044:	e5953068 	ldr	r3, [r5, #104]	@ 0x68
   be048:	e3032643 	movw	r2, #13891	@ 0x3643
   be04c:	e0843003 	add	r3, r4, r3
   be050:	e5853068 	str	r3, [r5, #104]	@ 0x68
   be054:	e1530002 	cmp	r3, r2
   be058:	c3a03006 	movgt	r3, #6
   be05c:	c5853054 	strgt	r3, [r5, #84]	@ 0x54
   be060:	e3540000 	cmp	r4, #0
   be064:	da00000b 	ble	be098 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x8c8>
   be068:	e51f3424 	ldr	r3, [pc, #-1060]	@ bdc4c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x47c>
   be06c:	e51f2424 	ldr	r2, [pc, #-1060]	@ bdc50 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x480>
   be070:	e0831104 	add	r1, r3, r4, lsl #2
   be074:	edd37a00 	vldr	s15, [r3]
   be078:	ee677aa8 	vmul.f32	s15, s15, s17
   be07c:	ee487a09 	vmla.f32	s15, s16, s18
   be080:	ece37a01 	vstmia	r3!, {s15}
   be084:	e1530001 	cmp	r3, r1
   be088:	ee17ea90 	vmov	lr, s15
   be08c:	eeb08a67 	vmov.f32	s16, s15
   be090:	e5a2e004 	str	lr, [r2, #4]!
   be094:	1afffff6 	bne	be074 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x8a4>
   be098:	e0847006 	add	r7, r4, r6
   be09c:	ed858a26 	vstr	s16, [r5, #152]	@ 0x98
   be0a0:	e3570902 	cmp	r7, #32768	@ 0x8000
   be0a4:	e595804c 	ldr	r8, [r5, #76]	@ 0x4c
   be0a8:	ba00005a 	blt	be218 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xa48>
   be0ac:	e2663902 	rsb	r3, r6, #32768	@ 0x8000
   be0b0:	e51fa464 	ldr	sl, [pc, #-1124]	@ bdc54 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x484>
   be0b4:	e0880106 	add	r0, r8, r6, lsl #2
   be0b8:	e1a06103 	lsl	r6, r3, #2
   be0bc:	e1a0100a 	mov	r1, sl
   be0c0:	e1a02006 	mov	r2, r6
   be0c4:	ebfd448d 	bl	f300 <memcpy@plt>
   be0c8:	e2572902 	subs	r2, r7, #32768	@ 0x8000
   be0cc:	0a000003 	beq	be0e0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x910>
   be0d0:	e1a00008 	mov	r0, r8
   be0d4:	e08a1006 	add	r1, sl, r6
   be0d8:	e1a02102 	lsl	r2, r2, #2
   be0dc:	ebfd4487 	bl	f300 <memcpy@plt>
   be0e0:	ee04ba90 	vmov	s9, fp
   be0e4:	eef87ae4 	vcvt.f32.s32	s15, s9
   be0e8:	e3540000 	cmp	r4, #0
   be0ec:	edc57a14 	vstr	s15, [r5, #80]	@ 0x50
   be0f0:	da000016 	ble	be150 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x980>
   be0f4:	e51f34a4 	ldr	r3, [pc, #-1188]	@ bdc58 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x488>
   be0f8:	e2899004 	add	r9, r9, #4
   be0fc:	e59d7008 	ldr	r7, [sp, #8]
   be100:	e2831c07 	add	r1, r3, #1792	@ 0x700
   be104:	e0834104 	add	r4, r3, r4, lsl #2
   be108:	e2872004 	add	r2, r7, #4
   be10c:	e2833004 	add	r3, r3, #4
   be110:	edd37a00 	vldr	s15, [r3]
   be114:	ee777aa7 	vadd.f32	s15, s15, s15
   be118:	ed197a01 	vldr	s14, [r9, #-4]
   be11c:	e2811004 	add	r1, r1, #4
   be120:	e1a07009 	mov	r7, r9
   be124:	e1530004 	cmp	r3, r4
   be128:	e2899008 	add	r9, r9, #8
   be12c:	ee777a87 	vadd.f32	s15, s15, s14
   be130:	ed427a01 	vstr	s15, [r2, #-4]
   be134:	edd17a00 	vldr	s15, [r1]
   be138:	ee777aa7 	vadd.f32	s15, s15, s15
   be13c:	ed977a00 	vldr	s14, [r7]
   be140:	ee777a87 	vadd.f32	s15, s15, s14
   be144:	ee17ca90 	vmov	ip, s15
   be148:	e482c008 	str	ip, [r2], #8
   be14c:	1affffee 	bne	be10c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x93c>
   be150:	e5953030 	ldr	r3, [r5, #48]	@ 0x30
   be154:	e3530001 	cmp	r3, #1
   be158:	0a0001c0 	beq	be860 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1090>
   be15c:	ed957a28 	vldr	s14, [r5, #160]	@ 0xa0
   be160:	eddf7ac6 	vldr	s15, [pc, #792]	@ be480 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcb0>
   be164:	eeb47ae7 	vcmpe.f32	s14, s15
   be168:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   be16c:	5a00000d 	bpl	be1a8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x9d8>
   be170:	e59d7004 	ldr	r7, [sp, #4]
   be174:	e3a03000 	mov	r3, #0
   be178:	e59dc00c 	ldr	ip, [sp, #12]
   be17c:	e58530a0 	str	r3, [r5, #160]	@ 0xa0
   be180:	e3023213 	movw	r3, #8723	@ 0x2213
   be184:	e585706c 	str	r7, [r5, #108]	@ 0x6c
   be188:	e585c070 	str	ip, [r5, #112]	@ 0x70
   be18c:	e59d7010 	ldr	r7, [sp, #16]
   be190:	e59dc014 	ldr	ip, [sp, #20]
   be194:	e585307c 	str	r3, [r5, #124]	@ 0x7c
   be198:	e303363a 	movw	r3, #13882	@ 0x363a
   be19c:	e5857074 	str	r7, [r5, #116]	@ 0x74
   be1a0:	e585c078 	str	ip, [r5, #120]	@ 0x78
   be1a4:	e5853080 	str	r3, [r5, #128]	@ 0x80
   be1a8:	e28dd01c 	add	sp, sp, #28
   be1ac:	ecbd8b04 	vpop	{d8-d9}
   be1b0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
   be1b4:	aafffdc4 	bge	bd8cc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xfc>
   be1b8:	e2422001 	sub	r2, r2, #1
   be1bc:	e5852034 	str	r2, [r5, #52]	@ 0x34
   be1c0:	e1530002 	cmp	r3, r2
   be1c4:	c5853034 	strgt	r3, [r5, #52]	@ 0x34
   be1c8:	c1a02003 	movgt	r2, r3
   be1cc:	e352008b 	cmp	r2, #139	@ 0x8b
   be1d0:	c3a0308b 	movgt	r3, #139	@ 0x8b
   be1d4:	c5853034 	strgt	r3, [r5, #52]	@ 0x34
   be1d8:	c1a02003 	movgt	r2, r3
   be1dc:	c3a03001 	movgt	r3, #1
   be1e0:	c5853030 	strgt	r3, [r5, #48]	@ 0x30
   be1e4:	e3510073 	cmp	r1, #115	@ 0x73
   be1e8:	dafffdbf 	ble	bd8ec <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x11c>
   be1ec:	e351008b 	cmp	r1, #139	@ 0x8b
   be1f0:	ca0001c2 	bgt	be900 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1130>
   be1f4:	e3520073 	cmp	r2, #115	@ 0x73
   be1f8:	eddf6aa1 	vldr	s13, [pc, #644]	@ be484 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcb4>
   be1fc:	ed9f6aa1 	vldr	s12, [pc, #644]	@ be488 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcb8>
   be200:	dafffdc3 	ble	bd914 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x144>
   be204:	e3a06000 	mov	r6, #0
   be208:	ed9f7aac 	vldr	s14, [pc, #688]	@ be4c0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcf0>
   be20c:	eddf7aaa 	vldr	s15, [pc, #680]	@ be4bc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcec>
   be210:	ed9f8a9d 	vldr	s16, [pc, #628]	@ be48c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcbc>
   be214:	eafffdd3 	b	bd968 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x198>
   be218:	e0880106 	add	r0, r8, r6, lsl #2
   be21c:	e59f1274 	ldr	r1, [pc, #628]	@ be498 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcc8>
   be220:	e1a02104 	lsl	r2, r4, #2
   be224:	ebfd4435 	bl	f300 <memcpy@plt>
   be228:	eaffffac 	b	be0e0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x910>
   be22c:	e5951080 	ldr	r1, [r5, #128]	@ 0x80
   be230:	edd59a24 	vldr	s19, [r5, #144]	@ 0x90
   be234:	e595804c 	ldr	r8, [r5, #76]	@ 0x4c
   be238:	e0561001 	subs	r1, r6, r1
   be23c:	42811902 	addmi	r1, r1, #32768	@ 0x8000
   be240:	e0817004 	add	r7, r1, r4
   be244:	e3570902 	cmp	r7, #32768	@ 0x8000
   be248:	ba000193 	blt	be89c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x10cc>
   be24c:	e2613902 	rsb	r3, r1, #32768	@ 0x8000
   be250:	e59fa250 	ldr	sl, [pc, #592]	@ be4a8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcd8>
   be254:	e0881101 	add	r1, r8, r1, lsl #2
   be258:	e1a03103 	lsl	r3, r3, #2
   be25c:	e58d3000 	str	r3, [sp]
   be260:	e1a0000a 	mov	r0, sl
   be264:	e1a02003 	mov	r2, r3
   be268:	ebfd4424 	bl	f300 <memcpy@plt>
   be26c:	e2572902 	subs	r2, r7, #32768	@ 0x8000
   be270:	e59d3000 	ldr	r3, [sp]
   be274:	0a000003 	beq	be288 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xab8>
   be278:	e08a0003 	add	r0, sl, r3
   be27c:	e1a01008 	mov	r1, r8
   be280:	e1a02102 	lsl	r2, r2, #2
   be284:	ebfd441d 	bl	f300 <memcpy@plt>
   be288:	e3540000 	cmp	r4, #0
   be28c:	daffff81 	ble	be098 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x8c8>
   be290:	e59f11f8 	ldr	r1, [pc, #504]	@ be490 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcc0>
   be294:	e3a02000 	mov	r2, #0
   be298:	e2813f41 	add	r3, r1, #260	@ 0x104
   be29c:	e2410c05 	sub	r0, r1, #1280	@ 0x500
   be2a0:	edd37a00 	vldr	s15, [r3]
   be2a4:	e2811004 	add	r1, r1, #4
   be2a8:	ed917a00 	vldr	s14, [r1]
   be2ac:	ee497a87 	vmla.f32	s15, s19, s14
   be2b0:	e2822001 	add	r2, r2, #1
   be2b4:	e1520004 	cmp	r2, r4
   be2b8:	ee677aa8 	vmul.f32	s15, s15, s17
   be2bc:	ee487a09 	vmla.f32	s15, s16, s18
   be2c0:	ee17ca90 	vmov	ip, s15
   be2c4:	eeb08a67 	vmov.f32	s16, s15
   be2c8:	e5a0c004 	str	ip, [r0, #4]!
   be2cc:	ece37a01 	vstmia	r3!, {s15}
   be2d0:	1afffff2 	bne	be2a0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xad0>
   be2d4:	eaffff6f 	b	be098 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x8c8>
   be2d8:	e0880106 	add	r0, r8, r6, lsl #2
   be2dc:	e59f11b4 	ldr	r1, [pc, #436]	@ be498 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcc8>
   be2e0:	e1a02104 	lsl	r2, r4, #2
   be2e4:	ebfd4405 	bl	f300 <memcpy@plt>
   be2e8:	eaffff4e 	b	be028 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x858>
   be2ec:	e595107c 	ldr	r1, [r5, #124]	@ 0x7c
   be2f0:	edd59a23 	vldr	s19, [r5, #140]	@ 0x8c
   be2f4:	e5958048 	ldr	r8, [r5, #72]	@ 0x48
   be2f8:	e0561001 	subs	r1, r6, r1
   be2fc:	42811902 	addmi	r1, r1, #32768	@ 0x8000
   be300:	e0817004 	add	r7, r1, r4
   be304:	e3570902 	cmp	r7, #32768	@ 0x8000
   be308:	ba000177 	blt	be8ec <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x111c>
   be30c:	e2613902 	rsb	r3, r1, #32768	@ 0x8000
   be310:	e59fa190 	ldr	sl, [pc, #400]	@ be4a8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcd8>
   be314:	e0881101 	add	r1, r8, r1, lsl #2
   be318:	e1a03103 	lsl	r3, r3, #2
   be31c:	e58d3000 	str	r3, [sp]
   be320:	e1a0000a 	mov	r0, sl
   be324:	e1a02003 	mov	r2, r3
   be328:	ebfd43f4 	bl	f300 <memcpy@plt>
   be32c:	e2572902 	subs	r2, r7, #32768	@ 0x8000
   be330:	e59d3000 	ldr	r3, [sp]
   be334:	0a000003 	beq	be348 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xb78>
   be338:	e08a0003 	add	r0, sl, r3
   be33c:	e1a01008 	mov	r1, r8
   be340:	e1a02102 	lsl	r2, r2, #2
   be344:	ebfd43ed 	bl	f300 <memcpy@plt>
   be348:	e3540000 	cmp	r4, #0
   be34c:	daffff23 	ble	bdfe0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x810>
   be350:	e59f313c 	ldr	r3, [pc, #316]	@ be494 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcc4>
   be354:	e3a02000 	mov	r2, #0
   be358:	e2830e5f 	add	r0, r3, #1520	@ 0x5f0
   be35c:	e28310fc 	add	r1, r3, #252	@ 0xfc
   be360:	e280000c 	add	r0, r0, #12
   be364:	edd37a00 	vldr	s15, [r3]
   be368:	e2800004 	add	r0, r0, #4
   be36c:	ed907a00 	vldr	s14, [r0]
   be370:	ee497a87 	vmla.f32	s15, s19, s14
   be374:	e2822001 	add	r2, r2, #1
   be378:	e1520004 	cmp	r2, r4
   be37c:	ee677aa8 	vmul.f32	s15, s15, s17
   be380:	ee487a09 	vmla.f32	s15, s16, s18
   be384:	ee17ca90 	vmov	ip, s15
   be388:	eeb08a67 	vmov.f32	s16, s15
   be38c:	e5a1c004 	str	ip, [r1, #4]!
   be390:	ece37a01 	vstmia	r3!, {s15}
   be394:	1afffff2 	bne	be364 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xb94>
   be398:	eaffff10 	b	bdfe0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x810>
   be39c:	e0880106 	add	r0, r8, r6, lsl #2
   be3a0:	e59f10f0 	ldr	r1, [pc, #240]	@ be498 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcc8>
   be3a4:	e1a02104 	lsl	r2, r4, #2
   be3a8:	ebfd43d4 	bl	f300 <memcpy@plt>
   be3ac:	eafffee3 	b	bdf40 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x770>
   be3b0:	e5951078 	ldr	r1, [r5, #120]	@ 0x78
   be3b4:	e5958044 	ldr	r8, [r5, #68]	@ 0x44
   be3b8:	e0561001 	subs	r1, r6, r1
   be3bc:	42811902 	addmi	r1, r1, #32768	@ 0x8000
   be3c0:	e0817004 	add	r7, r1, r4
   be3c4:	e3570902 	cmp	r7, #32768	@ 0x8000
   be3c8:	ba000142 	blt	be8d8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1108>
   be3cc:	e2613902 	rsb	r3, r1, #32768	@ 0x8000
   be3d0:	e59fa0d0 	ldr	sl, [pc, #208]	@ be4a8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcd8>
   be3d4:	e0881101 	add	r1, r8, r1, lsl #2
   be3d8:	e1a03103 	lsl	r3, r3, #2
   be3dc:	e58d3000 	str	r3, [sp]
   be3e0:	e1a0000a 	mov	r0, sl
   be3e4:	e1a02003 	mov	r2, r3
   be3e8:	ebfd43c4 	bl	f300 <memcpy@plt>
   be3ec:	e2572902 	subs	r2, r7, #32768	@ 0x8000
   be3f0:	e59d3000 	ldr	r3, [sp]
   be3f4:	0a000003 	beq	be408 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xc38>
   be3f8:	e08a0003 	add	r0, sl, r3
   be3fc:	e1a01008 	mov	r1, r8
   be400:	e1a02102 	lsl	r2, r2, #2
   be404:	ebfd43bd 	bl	f300 <memcpy@plt>
   be408:	e3540000 	cmp	r4, #0
   be40c:	dafffeba 	ble	bdefc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x72c>
   be410:	e59f307c 	ldr	r3, [pc, #124]	@ be494 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcc4>
   be414:	e3a02000 	mov	r2, #0
   be418:	eddf5a23 	vldr	s11, [pc, #140]	@ be4ac <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcdc>
   be41c:	e2831e5f 	add	r1, r3, #1520	@ 0x5f0
   be420:	e283cfbf 	add	ip, r3, #764	@ 0x2fc
   be424:	e281100c 	add	r1, r1, #12
   be428:	e28300fc 	add	r0, r3, #252	@ 0xfc
   be42c:	e2811004 	add	r1, r1, #4
   be430:	edd16a00 	vldr	s13, [r1]
   be434:	ee266aa5 	vmul.f32	s12, s13, s11
   be438:	edd37a00 	vldr	s15, [r3]
   be43c:	e28cc004 	add	ip, ip, #4
   be440:	ed9c7a00 	vldr	s14, [ip]
   be444:	e2822001 	add	r2, r2, #1
   be448:	e1520004 	cmp	r2, r4
   be44c:	ee467a47 	vmls.f32	s15, s12, s14
   be450:	eef04a67 	vmov.f32	s9, s15
   be454:	ee177a90 	vmov	r7, s15
   be458:	e5a07004 	str	r7, [r0, #4]!
   be45c:	ee464a87 	vmla.f32	s9, s13, s14
   be460:	ece34a01 	vstmia	r3!, {s9}
   be464:	1afffff0 	bne	be42c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xc5c>
   be468:	eafffea3 	b	bdefc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x72c>
   be46c:	e0880106 	add	r0, r8, r6, lsl #2
   be470:	e59f1020 	ldr	r1, [pc, #32]	@ be498 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcc8>
   be474:	e1a02104 	lsl	r2, r4, #2
   be478:	ebfd43a0 	bl	f300 <memcpy@plt>
   be47c:	eafffe6c 	b	bde34 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x664>
   be480:	3d000000 	.word	0x3d000000
   be484:	3f425f20 	.word	0x3f425f20
   be488:	3f29c0fe 	.word	0x3f29c0fe
   be48c:	00000000 	.word	0x00000000
   be490:	0114bb34 	.word	0x0114bb34
   be494:	0114b538 	.word	0x0114b538
   be498:	0114b638 	.word	0x0114b638
   be49c:	0114b938 	.word	0x0114b938
   be4a0:	0042d230 	.word	0x0042d230
   be4a4:	0042d248 	.word	0x0042d248
   be4a8:	0114bb38 	.word	0x0114bb38
   be4ac:	3f4ccccd 	.word	0x3f4ccccd
   be4b0:	3f2dcd7a 	.word	0x3f2dcd7a
   be4b4:	3f48877b 	.word	0x3f48877b
   be4b8:	3c0d3dcb 	.word	0x3c0d3dcb
   be4bc:	3e8295e4 	.word	0x3e8295e4
   be4c0:	3de8c4aa 	.word	0x3de8c4aa
   be4c4:	3d0d3dcb 	.word	0x3d0d3dcb
   be4c8:	3f507b71 	.word	0x3f507b71
   be4cc:	3e3e123d 	.word	0x3e3e123d
   be4d0:	3f333333 	.word	0x3f333333
   be4d4:	e5951074 	ldr	r1, [r5, #116]	@ 0x74
   be4d8:	e5958040 	ldr	r8, [r5, #64]	@ 0x40
   be4dc:	e0561001 	subs	r1, r6, r1
   be4e0:	42811902 	addmi	r1, r1, #32768	@ 0x8000
   be4e4:	e0817004 	add	r7, r1, r4
   be4e8:	e3570902 	cmp	r7, #32768	@ 0x8000
   be4ec:	ba0000f4 	blt	be8c4 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x10f4>
   be4f0:	e2613902 	rsb	r3, r1, #32768	@ 0x8000
   be4f4:	e51fa054 	ldr	sl, [pc, #-84]	@ be4a8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcd8>
   be4f8:	e0881101 	add	r1, r8, r1, lsl #2
   be4fc:	e1a03103 	lsl	r3, r3, #2
   be500:	e58d3000 	str	r3, [sp]
   be504:	e1a0000a 	mov	r0, sl
   be508:	e1a02003 	mov	r2, r3
   be50c:	ebfd437b 	bl	f300 <memcpy@plt>
   be510:	e2572902 	subs	r2, r7, #32768	@ 0x8000
   be514:	e59d3000 	ldr	r3, [sp]
   be518:	0a000003 	beq	be52c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xd5c>
   be51c:	e08a0003 	add	r0, sl, r3
   be520:	e1a01008 	mov	r1, r8
   be524:	e1a02102 	lsl	r2, r2, #2
   be528:	ebfd4374 	bl	f300 <memcpy@plt>
   be52c:	e3540000 	cmp	r4, #0
   be530:	dafffe2e 	ble	bddf0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x620>
   be534:	e51f30a8 	ldr	r3, [pc, #-168]	@ be494 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcc4>
   be538:	e3a02000 	mov	r2, #0
   be53c:	ed5f5a26 	vldr	s11, [pc, #-152]	@ be4ac <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcdc>
   be540:	e2831e5f 	add	r1, r3, #1520	@ 0x5f0
   be544:	e283cfbf 	add	ip, r3, #764	@ 0x2fc
   be548:	e281100c 	add	r1, r1, #12
   be54c:	e28300fc 	add	r0, r3, #252	@ 0xfc
   be550:	e2811004 	add	r1, r1, #4
   be554:	edd16a00 	vldr	s13, [r1]
   be558:	ee266aa5 	vmul.f32	s12, s13, s11
   be55c:	edd37a00 	vldr	s15, [r3]
   be560:	e28cc004 	add	ip, ip, #4
   be564:	ed9c7a00 	vldr	s14, [ip]
   be568:	e2822001 	add	r2, r2, #1
   be56c:	e1520004 	cmp	r2, r4
   be570:	ee467a47 	vmls.f32	s15, s12, s14
   be574:	eef04a67 	vmov.f32	s9, s15
   be578:	ee177a90 	vmov	r7, s15
   be57c:	e5a07004 	str	r7, [r0, #4]!
   be580:	ee464a87 	vmla.f32	s9, s13, s14
   be584:	ece34a01 	vstmia	r3!, {s9}
   be588:	1afffff0 	bne	be550 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xd80>
   be58c:	eafffe17 	b	bddf0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x620>
   be590:	e0880106 	add	r0, r8, r6, lsl #2
   be594:	e51f1104 	ldr	r1, [pc, #-260]	@ be498 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcc8>
   be598:	e1a02104 	lsl	r2, r4, #2
   be59c:	ebfd4357 	bl	f300 <memcpy@plt>
   be5a0:	eafffde8 	b	bdd48 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x578>
   be5a4:	e5951070 	ldr	r1, [r5, #112]	@ 0x70
   be5a8:	e595803c 	ldr	r8, [r5, #60]	@ 0x3c
   be5ac:	e0561001 	subs	r1, r6, r1
   be5b0:	42811902 	addmi	r1, r1, #32768	@ 0x8000
   be5b4:	e0817004 	add	r7, r1, r4
   be5b8:	e3570902 	cmp	r7, #32768	@ 0x8000
   be5bc:	ba0000bb 	blt	be8b0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x10e0>
   be5c0:	e2613902 	rsb	r3, r1, #32768	@ 0x8000
   be5c4:	e51fa124 	ldr	sl, [pc, #-292]	@ be4a8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcd8>
   be5c8:	e0881101 	add	r1, r8, r1, lsl #2
   be5cc:	e1a03103 	lsl	r3, r3, #2
   be5d0:	e58d3000 	str	r3, [sp]
   be5d4:	e1a0000a 	mov	r0, sl
   be5d8:	e1a02003 	mov	r2, r3
   be5dc:	ebfd4347 	bl	f300 <memcpy@plt>
   be5e0:	e2572902 	subs	r2, r7, #32768	@ 0x8000
   be5e4:	e59d3000 	ldr	r3, [sp]
   be5e8:	0a000003 	beq	be5fc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xe2c>
   be5ec:	e08a0003 	add	r0, sl, r3
   be5f0:	e1a01008 	mov	r1, r8
   be5f4:	e1a02102 	lsl	r2, r2, #2
   be5f8:	ebfd4340 	bl	f300 <memcpy@plt>
   be5fc:	e3540000 	cmp	r4, #0
   be600:	dafffdbf 	ble	bdd04 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x534>
   be604:	e51f3178 	ldr	r3, [pc, #-376]	@ be494 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcc4>
   be608:	e3a02000 	mov	r2, #0
   be60c:	ed5f5a5a 	vldr	s11, [pc, #-360]	@ be4ac <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcdc>
   be610:	e2831e5f 	add	r1, r3, #1520	@ 0x5f0
   be614:	e283cfbf 	add	ip, r3, #764	@ 0x2fc
   be618:	e281100c 	add	r1, r1, #12
   be61c:	e28300fc 	add	r0, r3, #252	@ 0xfc
   be620:	e2811004 	add	r1, r1, #4
   be624:	edd16a00 	vldr	s13, [r1]
   be628:	ee266aa5 	vmul.f32	s12, s13, s11
   be62c:	edd37a00 	vldr	s15, [r3]
   be630:	e28cc004 	add	ip, ip, #4
   be634:	ed9c7a00 	vldr	s14, [ip]
   be638:	e2822001 	add	r2, r2, #1
   be63c:	e1520004 	cmp	r2, r4
   be640:	ee467a47 	vmls.f32	s15, s12, s14
   be644:	eef04a67 	vmov.f32	s9, s15
   be648:	ee177a90 	vmov	r7, s15
   be64c:	e5a07004 	str	r7, [r0, #4]!
   be650:	ee464a87 	vmla.f32	s9, s13, s14
   be654:	ece34a01 	vstmia	r3!, {s9}
   be658:	1afffff0 	bne	be620 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xe50>
   be65c:	eafffda8 	b	bdd04 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x534>
   be660:	e0870106 	add	r0, r7, r6, lsl #2
   be664:	e51f11d4 	ldr	r1, [pc, #-468]	@ be498 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcc8>
   be668:	e1a02104 	lsl	r2, r4, #2
   be66c:	ebfd4323 	bl	f300 <memcpy@plt>
   be670:	eafffd79 	b	bdc5c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x48c>
   be674:	e0881101 	add	r1, r8, r1, lsl #2
   be678:	e1a02104 	lsl	r2, r4, #2
   be67c:	e51f01dc 	ldr	r0, [pc, #-476]	@ be4a8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcd8>
   be680:	ebfd431e 	bl	f300 <memcpy@plt>
   be684:	eafffd2d 	b	bdb40 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x370>
   be688:	e5903000 	ldr	r3, [r0]
   be68c:	e5933010 	ldr	r3, [r3, #16]
   be690:	e12fff33 	blx	r3
   be694:	eafffc57 	b	bd7f8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x28>
   be698:	e5953058 	ldr	r3, [r5, #88]	@ 0x58
   be69c:	e30024d2 	movw	r2, #1234	@ 0x4d2
   be6a0:	e0843003 	add	r3, r4, r3
   be6a4:	e5853058 	str	r3, [r5, #88]	@ 0x58
   be6a8:	e1530002 	cmp	r3, r2
   be6ac:	c3a03002 	movgt	r3, #2
   be6b0:	c5853054 	strgt	r3, [r5, #84]	@ 0x54
   be6b4:	e3540000 	cmp	r4, #0
   be6b8:	dafffd3a 	ble	bdba8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x3d8>
   be6bc:	e1a070a4 	lsr	r7, r4, #1
   be6c0:	e51f822c 	ldr	r8, [pc, #-556]	@ be49c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xccc>
   be6c4:	e3570000 	cmp	r7, #0
   be6c8:	13540001 	cmpne	r4, #1
   be6cc:	e1a0a087 	lsl	sl, r7, #1
   be6d0:	83a03000 	movhi	r3, #0
   be6d4:	93a03001 	movls	r3, #1
   be6d8:	9a0000b7 	bls	be9bc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x11ec>
   be6dc:	e248cc03 	sub	ip, r8, #768	@ 0x300
   be6e0:	e2480b01 	sub	r0, r8, #1024	@ 0x400
   be6e4:	e1a0e008 	mov	lr, r8
   be6e8:	e1a0100c 	mov	r1, ip
   be6ec:	e1a02000 	mov	r2, r0
   be6f0:	e2833001 	add	r3, r3, #1
   be6f4:	ecfe0b02 	vldmia	lr!, {d16}
   be6f8:	e1570003 	cmp	r7, r3
   be6fc:	ece10b02 	vstmia	r1!, {d16}
   be700:	ece20b02 	vstmia	r2!, {d16}
   be704:	8afffff9 	bhi	be6f0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xf20>
   be708:	e154000a 	cmp	r4, sl
   be70c:	0afffd25 	beq	bdba8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x3d8>
   be710:	e24a3001 	sub	r3, sl, #1
   be714:	e1a03103 	lsl	r3, r3, #2
   be718:	e0888003 	add	r8, r8, r3
   be71c:	e08cc003 	add	ip, ip, r3
   be720:	e0803003 	add	r3, r0, r3
   be724:	e5b82004 	ldr	r2, [r8, #4]!
   be728:	e28aa001 	add	sl, sl, #1
   be72c:	e154000a 	cmp	r4, sl
   be730:	e5ac2004 	str	r2, [ip, #4]!
   be734:	e5a32004 	str	r2, [r3, #4]!
   be738:	cafffff9 	bgt	be724 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xf54>
   be73c:	eafffd19 	b	bdba8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x3d8>
   be740:	e1530002 	cmp	r3, r2
   be744:	ca000079 	bgt	be930 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1160>
   be748:	aa000004 	bge	be760 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xf90>
   be74c:	e2422001 	sub	r2, r2, #1
   be750:	e5852034 	str	r2, [r5, #52]	@ 0x34
   be754:	e1530002 	cmp	r3, r2
   be758:	c5853034 	strgt	r3, [r5, #52]	@ 0x34
   be75c:	c1a02003 	movgt	r2, r3
   be760:	e3520073 	cmp	r2, #115	@ 0x73
   be764:	d3a03074 	movle	r3, #116	@ 0x74
   be768:	d5853034 	strle	r3, [r5, #52]	@ 0x34
   be76c:	d1a02003 	movle	r2, r3
   be770:	d3a03001 	movle	r3, #1
   be774:	d5853030 	strle	r3, [r5, #48]	@ 0x30
   be778:	e3510073 	cmp	r1, #115	@ 0x73
   be77c:	ca000078 	bgt	be964 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1194>
   be780:	ee041a90 	vmov	s9, r1
   be784:	eeb87ae4 	vcvt.f32.s32	s14, s9
   be788:	ed5f7ab6 	vldr	s15, [pc, #-728]	@ be4b8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xce8>
   be78c:	ee677a27 	vmul.f32	s15, s14, s15
   be790:	ed1f7aba 	vldr	s14, [pc, #-744]	@ be4b0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xce0>
   be794:	ee276a87 	vmul.f32	s12, s15, s14
   be798:	ed1f7abb 	vldr	s14, [pc, #-748]	@ be4b4 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xce4>
   be79c:	ee676a87 	vmul.f32	s13, s15, s14
   be7a0:	e352008b 	cmp	r2, #139	@ 0x8b
   be7a4:	da00007c 	ble	be99c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x11cc>
   be7a8:	e26230ff 	rsb	r3, r2, #255	@ 0xff
   be7ac:	ee053a90 	vmov	s11, r3
   be7b0:	eef84ae5 	vcvt.f32.s32	s9, s11
   be7b4:	ed5f5ac1 	vldr	s11, [pc, #-772]	@ be4b8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xce8>
   be7b8:	e242208b 	sub	r2, r2, #139	@ 0x8b
   be7bc:	ed5f7ac2 	vldr	s15, [pc, #-776]	@ be4bc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcec>
   be7c0:	ed1f7ac2 	vldr	s14, [pc, #-776]	@ be4c0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcf0>
   be7c4:	eeb75a00 	vmov.f32	s10, #112	@ 0x3f800000  1.0
   be7c8:	ee645aa5 	vmul.f32	s11, s9, s11
   be7cc:	ee042a90 	vmov	s9, r2
   be7d0:	eeb84ae4 	vcvt.f32.s32	s8, s9
   be7d4:	eef04a45 	vmov.f32	s9, s10
   be7d8:	ee454ae5 	vmls.f32	s9, s11, s11
   be7dc:	eef05a64 	vmov.f32	s11, s9
   be7e0:	ed5f4ac9 	vldr	s9, [pc, #-804]	@ be4c4 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcf4>
   be7e4:	ee457a86 	vmla.f32	s15, s11, s12
   be7e8:	ee067aa5 	vmla.f32	s14, s13, s11
   be7ec:	ee248a24 	vmul.f32	s16, s8, s9
   be7f0:	eeb48ac5 	vcmpe.f32	s16, s10
   be7f4:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   be7f8:	d3a06000 	movle	r6, #0
   be7fc:	c3a06001 	movgt	r6, #1
   be800:	e5950084 	ldr	r0, [r5, #132]	@ 0x84
   be804:	ed857a24 	vstr	s14, [r5, #144]	@ 0x90
   be808:	e51f1370 	ldr	r1, [pc, #-880]	@ be4a0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcd0>
   be80c:	edc57a23 	vstr	s15, [r5, #140]	@ 0x8c
   be810:	e30075e4 	movw	r7, #1508	@ 0x5e4
   be814:	e300cb64 	movw	ip, #2916	@ 0xb64
   be818:	e5903000 	ldr	r3, [r0]
   be81c:	ed5f8ad7 	vldr	s17, [pc, #-860]	@ be4c8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcf8>
   be820:	e58d7014 	str	r7, [sp, #20]
   be824:	e28770b2 	add	r7, r7, #178	@ 0xb2
   be828:	e58dc010 	str	ip, [sp, #16]
   be82c:	e300c44b 	movw	ip, #1099	@ 0x44b
   be830:	e5933008 	ldr	r3, [r3, #8]
   be834:	ed1f9adc 	vldr	s18, [pc, #-880]	@ be4cc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcfc>
   be838:	e58dc004 	str	ip, [sp, #4]
   be83c:	e58d700c 	str	r7, [sp, #12]
   be840:	e12fff33 	blx	r3
   be844:	e5950088 	ldr	r0, [r5, #136]	@ 0x88
   be848:	e51f13ac 	ldr	r1, [pc, #-940]	@ be4a4 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcd4>
   be84c:	e5903000 	ldr	r3, [r0]
   be850:	e5933008 	ldr	r3, [r3, #8]
   be854:	e12fff33 	blx	r3
   be858:	ed1f5ae4 	vldr	s10, [pc, #-912]	@ be4d0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xd00>
   be85c:	eafffc58 	b	bd9c4 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1f4>
   be860:	e5950084 	ldr	r0, [r5, #132]	@ 0x84
   be864:	e595202c 	ldr	r2, [r5, #44]	@ 0x2c
   be868:	e5903000 	ldr	r3, [r0]
   be86c:	e2722001 	rsbs	r2, r2, #1
   be870:	33a02000 	movcc	r2, #0
   be874:	e585202c 	str	r2, [r5, #44]	@ 0x2c
   be878:	e5933018 	ldr	r3, [r3, #24]
   be87c:	e12fff33 	blx	r3
   be880:	e5950088 	ldr	r0, [r5, #136]	@ 0x88
   be884:	e5903000 	ldr	r3, [r0]
   be888:	e5933018 	ldr	r3, [r3, #24]
   be88c:	e12fff33 	blx	r3
   be890:	e3a03000 	mov	r3, #0
   be894:	e5853030 	str	r3, [r5, #48]	@ 0x30
   be898:	eafffe2f 	b	be15c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x98c>
   be89c:	e0881101 	add	r1, r8, r1, lsl #2
   be8a0:	e1a02104 	lsl	r2, r4, #2
   be8a4:	e51f0404 	ldr	r0, [pc, #-1028]	@ be4a8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcd8>
   be8a8:	ebfd4294 	bl	f300 <memcpy@plt>
   be8ac:	eafffe75 	b	be288 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xab8>
   be8b0:	e0881101 	add	r1, r8, r1, lsl #2
   be8b4:	e1a02104 	lsl	r2, r4, #2
   be8b8:	e51f0418 	ldr	r0, [pc, #-1048]	@ be4a8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcd8>
   be8bc:	ebfd428f 	bl	f300 <memcpy@plt>
   be8c0:	eaffff4d 	b	be5fc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xe2c>
   be8c4:	e0881101 	add	r1, r8, r1, lsl #2
   be8c8:	e1a02104 	lsl	r2, r4, #2
   be8cc:	e51f042c 	ldr	r0, [pc, #-1068]	@ be4a8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcd8>
   be8d0:	ebfd428a 	bl	f300 <memcpy@plt>
   be8d4:	eaffff14 	b	be52c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xd5c>
   be8d8:	e0881101 	add	r1, r8, r1, lsl #2
   be8dc:	e1a02104 	lsl	r2, r4, #2
   be8e0:	e51f0440 	ldr	r0, [pc, #-1088]	@ be4a8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcd8>
   be8e4:	ebfd4285 	bl	f300 <memcpy@plt>
   be8e8:	eafffec6 	b	be408 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xc38>
   be8ec:	e0881101 	add	r1, r8, r1, lsl #2
   be8f0:	e1a02104 	lsl	r2, r4, #2
   be8f4:	e51f0454 	ldr	r0, [pc, #-1108]	@ be4a8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xcd8>
   be8f8:	ebfd4280 	bl	f300 <memcpy@plt>
   be8fc:	eafffe91 	b	be348 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xb78>
   be900:	e241108b 	sub	r1, r1, #139	@ 0x8b
   be904:	ee051a90 	vmov	s11, r1
   be908:	eeb87ae5 	vcvt.f32.s32	s14, s11
   be90c:	eddf7a3a 	vldr	s15, [pc, #232]	@ be9fc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x122c>
   be910:	ed9f6a3a 	vldr	s12, [pc, #232]	@ bea00 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1230>
   be914:	eddf6a3a 	vldr	s13, [pc, #232]	@ bea04 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1234>
   be918:	ee677a27 	vmul.f32	s15, s14, s15
   be91c:	ed9f7a39 	vldr	s14, [pc, #228]	@ bea08 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1238>
   be920:	ee076a87 	vmla.f32	s12, s15, s14
   be924:	ed9f7a38 	vldr	s14, [pc, #224]	@ bea0c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x123c>
   be928:	ee476a87 	vmla.f32	s13, s15, s14
   be92c:	eafffbf6 	b	bd90c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x13c>
   be930:	e2822001 	add	r2, r2, #1
   be934:	e5852034 	str	r2, [r5, #52]	@ 0x34
   be938:	e1530002 	cmp	r3, r2
   be93c:	b5853034 	strlt	r3, [r5, #52]	@ 0x34
   be940:	b1a02003 	movlt	r2, r3
   be944:	e3520073 	cmp	r2, #115	@ 0x73
   be948:	d3a03074 	movle	r3, #116	@ 0x74
   be94c:	d5853034 	strle	r3, [r5, #52]	@ 0x34
   be950:	d1a02003 	movle	r2, r3
   be954:	d3a03001 	movle	r3, #1
   be958:	d5853030 	strle	r3, [r5, #48]	@ 0x30
   be95c:	e3510073 	cmp	r1, #115	@ 0x73
   be960:	daffff86 	ble	be780 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xfb0>
   be964:	e351008b 	cmp	r1, #139	@ 0x8b
   be968:	da000010 	ble	be9b0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x11e0>
   be96c:	e241108b 	sub	r1, r1, #139	@ 0x8b
   be970:	ee051a90 	vmov	s11, r1
   be974:	eeb87ae5 	vcvt.f32.s32	s14, s11
   be978:	eddf7a1f 	vldr	s15, [pc, #124]	@ be9fc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x122c>
   be97c:	ed9f6a23 	vldr	s12, [pc, #140]	@ bea10 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1240>
   be980:	eddf6a23 	vldr	s13, [pc, #140]	@ bea14 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1244>
   be984:	ee677a27 	vmul.f32	s15, s14, s15
   be988:	ed9f7a1e 	vldr	s14, [pc, #120]	@ bea08 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1238>
   be98c:	ee076a87 	vmla.f32	s12, s15, s14
   be990:	ed9f7a1d 	vldr	s14, [pc, #116]	@ bea0c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x123c>
   be994:	ee476a87 	vmla.f32	s13, s15, s14
   be998:	eaffff80 	b	be7a0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xfd0>
   be99c:	e3a06000 	mov	r6, #0
   be9a0:	ed9f7a1c 	vldr	s14, [pc, #112]	@ bea18 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1248>
   be9a4:	eddf7a1c 	vldr	s15, [pc, #112]	@ bea1c <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x124c>
   be9a8:	ed9f8a1c 	vldr	s16, [pc, #112]	@ bea20 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1250>
   be9ac:	eaffff93 	b	be800 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1030>
   be9b0:	eddf6a17 	vldr	s13, [pc, #92]	@ bea14 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1244>
   be9b4:	ed9f6a15 	vldr	s12, [pc, #84]	@ bea10 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1240>
   be9b8:	eaffff78 	b	be7a0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xfd0>
   be9bc:	e3a0a000 	mov	sl, #0
   be9c0:	e248cc03 	sub	ip, r8, #768	@ 0x300
   be9c4:	e2480b01 	sub	r0, r8, #1024	@ 0x400
   be9c8:	eaffff50 	b	be710 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0xf40>
   be9cc:	e59fc050 	ldr	ip, [pc, #80]	@ bea24 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1254>
   be9d0:	e3a07000 	mov	r7, #0
   be9d4:	e24c0c01 	sub	r0, ip, #256	@ 0x100
   be9d8:	eafffcc0 	b	bdce0 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x510>
   be9dc:	e59fc040 	ldr	ip, [pc, #64]	@ bea24 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1254>
   be9e0:	e3a07000 	mov	r7, #0
   be9e4:	e24c0c01 	sub	r0, ip, #256	@ 0x100
   be9e8:	eafffcf7 	b	bddcc <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x5fc>
   be9ec:	e59fc030 	ldr	ip, [pc, #48]	@ bea24 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x1254>
   be9f0:	e3a07000 	mov	r7, #0
   be9f4:	e24c0c01 	sub	r0, ip, #256	@ 0x100
   be9f8:	eafffd36 	b	bded8 <mixerengine::SoundColorFxSpace::execute(common::Float2 const*, common::Float2*, int)+0x708>
   be9fc:	3c0d3dcb 	.word	0x3c0d3dcb
   bea00:	3f29c0fe 	.word	0x3f29c0fe
   bea04:	3f425f20 	.word	0x3f425f20
   bea08:	3d75c28f 	.word	0x3d75c28f
   bea0c:	3dcccccd 	.word	0x3dcccccd
   bea10:	3f2dcd7a 	.word	0x3f2dcd7a
   bea14:	3f48877b 	.word	0x3f48877b
   bea18:	3de8c4aa 	.word	0x3de8c4aa
   bea1c:	3e8295e4 	.word	0x3e8295e4
   bea20:	00000000 	.word	0x00000000
   bea24:	0114b638 	.word	0x0114b638

000bea28 <mixerengine::SoundColorFxSpace::SoundColorFxSpace()>:
   bea28:	e92d45f8 	push	{r3, r4, r5, r6, r7, r8, sl, lr}
   bea2c:	ed2d8b02 	vpush	{d8}
   bea30:	f2c00010 	vmov.i32	d16, #0	@ 0x00000000
   bea34:	ed9f8b4b 	vldr	d8, [pc, #300]	@ beb68 <mixerengine::SoundColorFxSpace::SoundColorFxSpace()+0x140>
   bea38:	e59f3130 	ldr	r3, [pc, #304]	@ beb70 <mixerengine::SoundColorFxSpace::SoundColorFxSpace()+0x148>
   bea3c:	e2802010 	add	r2, r0, #16
   bea40:	e2806034 	add	r6, r0, #52	@ 0x34
   bea44:	e1a07000 	mov	r7, r0
   bea48:	e3a05000 	mov	r5, #0
   bea4c:	e3a04000 	mov	r4, #0
   bea50:	e5933000 	ldr	r3, [r3]
   bea54:	ee073a10 	vmov	s14, r3
   bea58:	eef87a47 	vcvt.f32.u32	s15, s14
   bea5c:	e5803004 	str	r3, [r0, #4]
   bea60:	e5803008 	str	r3, [r0, #8]
   bea64:	f442078f 	vst1.32	{d16}, [r2]
   bea68:	f2c60f10 	vmov.f32	d16, #0.5	@ 0x3f000000
   bea6c:	e59f3100 	ldr	r3, [pc, #256]	@ beb74 <mixerengine::SoundColorFxSpace::SoundColorFxSpace()+0x14c>
   bea70:	e3a02002 	mov	r2, #2
   bea74:	e5802018 	str	r2, [r0, #24]
   bea78:	e280201c 	add	r2, r0, #28
   bea7c:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   bea80:	e5803000 	str	r3, [r0]
   bea84:	e3a03001 	mov	r3, #1
   bea88:	f442078f 	vst1.32	{d16}, [r2]
   bea8c:	e5c03024 	strb	r3, [r0, #36]	@ 0x24
   bea90:	eec77a27 	vdiv.f32	s15, s14, s15
   bea94:	edc07a03 	vstr	s15, [r0, #12]
   bea98:	e3a00802 	mov	r0, #131072	@ 0x20000
   bea9c:	ebfd4001 	bl	eaa8 <operator new[](unsigned int)@plt>
   beaa0:	e7e01150 	ubfx	r1, r0, #2, #1
   beaa4:	e5a60004 	str	r0, [r6, #4]!
   beaa8:	e261a902 	rsb	sl, r1, #32768	@ 0x8000
   beaac:	e3510000 	cmp	r1, #0
   beab0:	15804000 	strne	r4, [r0]
   beab4:	e1a0c0aa 	lsr	ip, sl, #1
   beab8:	13073fff 	movwne	r3, #32767	@ 0x7fff
   beabc:	13a0e001 	movne	lr, #1
   beac0:	03a03902 	moveq	r3, #32768	@ 0x8000
   beac4:	01a0e001 	moveq	lr, r1
   beac8:	e1b0808c 	lsls	r8, ip, #1
   beacc:	0a000009 	beq	beaf8 <mixerengine::SoundColorFxSpace::SoundColorFxSpace()+0xd0>
   bead0:	e0801101 	add	r1, r0, r1, lsl #2
   bead4:	e3a02000 	mov	r2, #0
   bead8:	e2822001 	add	r2, r2, #1
   beadc:	eca18b02 	vstmia	r1!, {d8}
   beae0:	e152000c 	cmp	r2, ip
   beae4:	3afffffb 	bcc	bead8 <mixerengine::SoundColorFxSpace::SoundColorFxSpace()+0xb0>
   beae8:	e15a0008 	cmp	sl, r8
   beaec:	e08ee008 	add	lr, lr, r8
   beaf0:	e0683003 	rsb	r3, r8, r3
   beaf4:	0a000003 	beq	beb08 <mixerengine::SoundColorFxSpace::SoundColorFxSpace()+0xe0>
   beaf8:	e080210e 	add	r2, r0, lr, lsl #2
   beafc:	e2533001 	subs	r3, r3, #1
   beb00:	e4824004 	str	r4, [r2], #4
   beb04:	1afffffc 	bne	beafc <mixerengine::SoundColorFxSpace::SoundColorFxSpace()+0xd4>
   beb08:	e2855001 	add	r5, r5, #1
   beb0c:	e3550006 	cmp	r5, #6
   beb10:	1affffe0 	bne	bea98 <mixerengine::SoundColorFxSpace::SoundColorFxSpace()+0x70>
   beb14:	e3a00048 	mov	r0, #72	@ 0x48
   beb18:	ebfd3e02 	bl	e328 <operator new(unsigned int)@plt>
   beb1c:	e1a04000 	mov	r4, r0
   beb20:	ebff726a 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   beb24:	e5874084 	str	r4, [r7, #132]	@ 0x84
   beb28:	e3a00048 	mov	r0, #72	@ 0x48
   beb2c:	ebfd3dfd 	bl	e328 <operator new(unsigned int)@plt>
   beb30:	e1a04000 	mov	r4, r0
   beb34:	ebff7265 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   beb38:	e5874088 	str	r4, [r7, #136]	@ 0x88
   beb3c:	e1a00007 	mov	r0, r7
   beb40:	ecbd8b02 	vpop	{d8}
   beb44:	e8bd85f8 	pop	{r3, r4, r5, r6, r7, r8, sl, pc}
   beb48:	e59f3028 	ldr	r3, [pc, #40]	@ beb78 <mixerengine::SoundColorFxSpace::SoundColorFxSpace()+0x150>
   beb4c:	e5873000 	str	r3, [r7]
   beb50:	ebfd40d9 	bl	eebc <__cxa_end_cleanup@plt>
   beb54:	e1a00004 	mov	r0, r4
   beb58:	ebfd405c 	bl	ecd0 <operator delete(void*)@plt>
   beb5c:	eafffff9 	b	beb48 <mixerengine::SoundColorFxSpace::SoundColorFxSpace()+0x120>
   beb60:	eafffffb 	b	beb54 <mixerengine::SoundColorFxSpace::SoundColorFxSpace()+0x12c>
   beb64:	e320f000 	nop	{0}
	...
   beb70:	004172c0 	.word	0x004172c0
   beb74:	0042d268 	.word	0x0042d268
   beb78:	0041db60 	.word	0x0041db60

000beb7c <mixerengine::SoundColorFxSpace::delay_buffer_read(float*, int, int, float*, int)>:
   beb7c:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
   beb80:	e1a05001 	mov	r5, r1
   beb84:	e59dc01c 	ldr	ip, [sp, #28]
   beb88:	e59d6018 	ldr	r6, [sp, #24]
   beb8c:	e083400c 	add	r4, r3, ip
   beb90:	e1540002 	cmp	r4, r2
   beb94:	ba00000e 	blt	bebd4 <mixerengine::SoundColorFxSpace::delay_buffer_read(float*, int, int, float*, int)+0x58>
   beb98:	e0637002 	rsb	r7, r3, r2
   beb9c:	e0624004 	rsb	r4, r2, r4
   beba0:	e1a00006 	mov	r0, r6
   beba4:	e0811103 	add	r1, r1, r3, lsl #2
   beba8:	e1a07107 	lsl	r7, r7, #2
   bebac:	e1a02007 	mov	r2, r7
   bebb0:	ebfd41d2 	bl	f300 <memcpy@plt>
   bebb4:	e3540000 	cmp	r4, #0
   bebb8:	da000003 	ble	bebcc <mixerengine::SoundColorFxSpace::delay_buffer_read(float*, int, int, float*, int)+0x50>
   bebbc:	e0860007 	add	r0, r6, r7
   bebc0:	e1a01005 	mov	r1, r5
   bebc4:	e1a02104 	lsl	r2, r4, #2
   bebc8:	ebfd41cc 	bl	f300 <memcpy@plt>
   bebcc:	e1a00004 	mov	r0, r4
   bebd0:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
   bebd4:	e1a00006 	mov	r0, r6
   bebd8:	e0811103 	add	r1, r1, r3, lsl #2
   bebdc:	e1a0210c 	lsl	r2, ip, #2
   bebe0:	ebfd41c6 	bl	f300 <memcpy@plt>
   bebe4:	e1a00004 	mov	r0, r4
   bebe8:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}

000bebec <mixerengine::SoundColorFxSpace::delay_buffer_write(float*, int, float*, int, int)>:
   bebec:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
   bebf0:	e1a05001 	mov	r5, r1
   bebf4:	e59d001c 	ldr	r0, [sp, #28]
   bebf8:	e1a06003 	mov	r6, r3
   bebfc:	e59dc018 	ldr	ip, [sp, #24]
   bec00:	e0804002 	add	r4, r0, r2
   bec04:	e154000c 	cmp	r4, ip
   bec08:	ba00000d 	blt	bec44 <mixerengine::SoundColorFxSpace::delay_buffer_write(float*, int, float*, int, int)+0x58>
   bec0c:	e060700c 	rsb	r7, r0, ip
   bec10:	e06c4004 	rsb	r4, ip, r4
   bec14:	e0830100 	add	r0, r3, r0, lsl #2
   bec18:	e1a07107 	lsl	r7, r7, #2
   bec1c:	e1a02007 	mov	r2, r7
   bec20:	ebfd41b6 	bl	f300 <memcpy@plt>
   bec24:	e3540000 	cmp	r4, #0
   bec28:	da000003 	ble	bec3c <mixerengine::SoundColorFxSpace::delay_buffer_write(float*, int, float*, int, int)+0x50>
   bec2c:	e1a00006 	mov	r0, r6
   bec30:	e0851007 	add	r1, r5, r7
   bec34:	e1a02104 	lsl	r2, r4, #2
   bec38:	ebfd41b0 	bl	f300 <memcpy@plt>
   bec3c:	e1a00004 	mov	r0, r4
   bec40:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
   bec44:	e0830100 	add	r0, r3, r0, lsl #2
   bec48:	e1a02102 	lsl	r2, r2, #2
   bec4c:	ebfd41ab 	bl	f300 <memcpy@plt>
   bec50:	e1a00004 	mov	r0, r4
   bec54:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}

000bec58 <mixerengine::SoundColorFxSpace::detect(common::Float2 const*, int)>:
   bec58:	e12fff1e 	bx	lr
