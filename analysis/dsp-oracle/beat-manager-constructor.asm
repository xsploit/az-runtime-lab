
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000893d8 <mixerengine::BeatEffectManager::BeatEffectManager()>:
   893d8:	e92d4070 	push	{r4, r5, r6, lr}
   893dc:	ed2d8b04 	vpush	{d8-d9}
   893e0:	e1a04000 	mov	r4, r0
   893e4:	ed9f8bd5 	vldr	d8, [pc, #852]	@ 89740 <mixerengine::BeatEffectManager::BeatEffectManager()+0x368>
   893e8:	e24dd018 	sub	sp, sp, #24
   893ec:	e3a05000 	mov	r5, #0
   893f0:	e59f135c 	ldr	r1, [pc, #860]	@ 89754 <mixerengine::BeatEffectManager::BeatEffectManager()+0x37c>
   893f4:	e3a06000 	mov	r6, #0
   893f8:	e5805000 	str	r5, [r0]
   893fc:	e28d000c 	add	r0, sp, #12
   89400:	e5845004 	str	r5, [r4, #4]
   89404:	eef79a00 	vmov.f32	s19, #112	@ 0x3f800000  1.0
   89408:	e5845054 	str	r5, [r4, #84]	@ 0x54
   8940c:	e5845058 	str	r5, [r4, #88]	@ 0x58
   89410:	eb0c9f5c 	bl	3b1188 <juce::String::String(char const*)>
   89414:	e59f233c 	ldr	r2, [pc, #828]	@ 89758 <mixerengine::BeatEffectManager::BeatEffectManager()+0x380>
   89418:	eddf7aca 	vldr	s15, [pc, #808]	@ 89748 <mixerengine::BeatEffectManager::BeatEffectManager()+0x370>
   8941c:	e5845078 	str	r5, [r4, #120]	@ 0x78
   89420:	e3a03001 	mov	r3, #1
   89424:	eddf0bc5 	vldr	d16, [pc, #788]	@ 89740 <mixerengine::BeatEffectManager::BeatEffectManager()+0x368>
   89428:	e5922000 	ldr	r2, [r2]
   8942c:	ee072a10 	vmov	s14, r2
   89430:	edc40b18 	vstr	d16, [r4, #96]	@ 0x60
   89434:	edc40b1a 	vstr	d16, [r4, #104]	@ 0x68
   89438:	edc40b1c 	vstr	d16, [r4, #112]	@ 0x70
   8943c:	e5c43084 	strb	r3, [r4, #132]	@ 0x84
   89440:	f2c70f10 	vmov.f32	d16, #1	@ 0x3f800000
   89444:	ed848b18 	vstr	d8, [r4, #96]	@ 0x60
   89448:	eeb89a47 	vcvt.f32.u32	s18, s14
   8944c:	edc40b1c 	vstr	d16, [r4, #112]	@ 0x70
   89450:	edc40b1a 	vstr	d16, [r4, #104]	@ 0x68
   89454:	e28d000c 	add	r0, sp, #12
   89458:	ee297a27 	vmul.f32	s14, s18, s15
   8945c:	eddf7aba 	vldr	s15, [pc, #744]	@ 8974c <mixerengine::BeatEffectManager::BeatEffectManager()+0x374>
   89460:	eec77a27 	vdiv.f32	s15, s14, s15
   89464:	eefc7ae7 	vcvt.u32.f32	s15, s15
   89468:	ee175a90 	vmov	r5, s15
   8946c:	e3550000 	cmp	r5, #0
   89470:	edc47a1f 	vstr	s15, [r4, #124]	@ 0x7c
   89474:	0584307c 	streq	r3, [r4, #124]	@ 0x7c
   89478:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   8947c:	1ef87a67 	vcvtne.f32.u32	s15, s15
   89480:	1ec77a27 	vdivne.f32	s15, s14, s15
   89484:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   89488:	edc47a20 	vstr	s15, [r4, #128]	@ 0x80
   8948c:	eb0c9e37 	bl	3b0d70 <juce::String::~String()>
   89490:	e59f12c4 	ldr	r1, [pc, #708]	@ 8975c <mixerengine::BeatEffectManager::BeatEffectManager()+0x384>
   89494:	e28d0010 	add	r0, sp, #16
   89498:	e5846088 	str	r6, [r4, #136]	@ 0x88
   8949c:	eb0c9f39 	bl	3b1188 <juce::String::String(char const*)>
   894a0:	e1550006 	cmp	r5, r6
   894a4:	1e075a10 	vmovne	s14, r5
   894a8:	e3a03001 	mov	r3, #1
   894ac:	ed848b24 	vstr	d8, [r4, #144]	@ 0x90
   894b0:	ed848b26 	vstr	d8, [r4, #152]	@ 0x98
   894b4:	ed848b28 	vstr	d8, [r4, #160]	@ 0xa0
   894b8:	e5c430b4 	strb	r3, [r4, #180]	@ 0xb4
   894bc:	ed9f8b9f 	vldr	d8, [pc, #636]	@ 89740 <mixerengine::BeatEffectManager::BeatEffectManager()+0x368>
   894c0:	e58450ac 	str	r5, [r4, #172]	@ 0xac
   894c4:	e58460a8 	str	r6, [r4, #168]	@ 0xa8
   894c8:	ed848b28 	vstr	d8, [r4, #160]	@ 0xa0
   894cc:	058430ac 	streq	r3, [r4, #172]	@ 0xac
   894d0:	ed848b26 	vstr	d8, [r4, #152]	@ 0x98
   894d4:	ed848b24 	vstr	d8, [r4, #144]	@ 0x90
   894d8:	e28d0010 	add	r0, sp, #16
   894dc:	1ef87a47 	vcvtne.f32.u32	s15, s14
   894e0:	1ec99aa7 	vdivne.f32	s19, s19, s15
   894e4:	edc49a2c 	vstr	s19, [r4, #176]	@ 0xb0
   894e8:	eb0c9e20 	bl	3b0d70 <juce::String::~String()>
   894ec:	e59f126c 	ldr	r1, [pc, #620]	@ 89760 <mixerengine::BeatEffectManager::BeatEffectManager()+0x388>
   894f0:	e28d0014 	add	r0, sp, #20
   894f4:	eb0c9f23 	bl	3b1188 <juce::String::String(char const*)>
   894f8:	eddf7a94 	vldr	s15, [pc, #592]	@ 89750 <mixerengine::BeatEffectManager::BeatEffectManager()+0x378>
   894fc:	ee297a27 	vmul.f32	s14, s18, s15
   89500:	eddf7a91 	vldr	s15, [pc, #580]	@ 8974c <mixerengine::BeatEffectManager::BeatEffectManager()+0x374>
   89504:	e3a03000 	mov	r3, #0
   89508:	e58430d0 	str	r3, [r4, #208]	@ 0xd0
   8950c:	eddf0b8b 	vldr	d16, [pc, #556]	@ 89740 <mixerengine::BeatEffectManager::BeatEffectManager()+0x368>
   89510:	e3a02001 	mov	r2, #1
   89514:	ed848b2e 	vstr	d8, [r4, #184]	@ 0xb8
   89518:	ed848b30 	vstr	d8, [r4, #192]	@ 0xc0
   8951c:	ed848b32 	vstr	d8, [r4, #200]	@ 0xc8
   89520:	e5c420dc 	strb	r2, [r4, #220]	@ 0xdc
   89524:	edc40b32 	vstr	d16, [r4, #200]	@ 0xc8
   89528:	edc40b30 	vstr	d16, [r4, #192]	@ 0xc0
   8952c:	edc40b2e 	vstr	d16, [r4, #184]	@ 0xb8
   89530:	e28d0014 	add	r0, sp, #20
   89534:	eec77a27 	vdiv.f32	s15, s14, s15
   89538:	eefc7ae7 	vcvt.u32.f32	s15, s15
   8953c:	ee173a90 	vmov	r3, s15
   89540:	e3530000 	cmp	r3, #0
   89544:	edc47a35 	vstr	s15, [r4, #212]	@ 0xd4
   89548:	058420d4 	streq	r2, [r4, #212]	@ 0xd4
   8954c:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   89550:	1ef87a67 	vcvtne.f32.u32	s15, s15
   89554:	1ec77a27 	vdivne.f32	s15, s14, s15
   89558:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   8955c:	edc47a36 	vstr	s15, [r4, #216]	@ 0xd8
   89560:	eb0c9e02 	bl	3b0d70 <juce::String::~String()>
   89564:	e3a03000 	mov	r3, #0
   89568:	e3a02005 	mov	r2, #5
   8956c:	e3a01000 	mov	r1, #0
   89570:	e58420e0 	str	r2, [r4, #224]	@ 0xe0
   89574:	e3a00054 	mov	r0, #84	@ 0x54
   89578:	e58410e8 	str	r1, [r4, #232]	@ 0xe8
   8957c:	e58420e4 	str	r2, [r4, #228]	@ 0xe4
   89580:	e5c430ec 	strb	r3, [r4, #236]	@ 0xec
   89584:	e5c430ed 	strb	r3, [r4, #237]	@ 0xed
   89588:	e5c430ee 	strb	r3, [r4, #238]	@ 0xee
   8958c:	e5c430ef 	strb	r3, [r4, #239]	@ 0xef
   89590:	ebfe1364 	bl	e328 <operator new(unsigned int)@plt>
   89594:	e1a05000 	mov	r5, r0
   89598:	eb000685 	bl	8afb4 <mixerengine::BeatEffectOff::BeatEffectOff()>
   8959c:	e5845010 	str	r5, [r4, #16]
   895a0:	e3a00f8a 	mov	r0, #552	@ 0x228
   895a4:	ebfe135f 	bl	e328 <operator new(unsigned int)@plt>
   895a8:	e1a05000 	mov	r5, r0
   895ac:	eb000fc4 	bl	8d4c4 <mixerengine::BeatEffectReverb::BeatEffectReverb()>
   895b0:	e5845014 	str	r5, [r4, #20]
   895b4:	e3a0008c 	mov	r0, #140	@ 0x8c
   895b8:	ebfe135a 	bl	e328 <operator new(unsigned int)@plt>
   895bc:	e1a05000 	mov	r5, r0
   895c0:	eb001ff8 	bl	915a8 <mixerengine::BeatEffectTrans::BeatEffectTrans()>
   895c4:	e5845018 	str	r5, [r4, #24]
   895c8:	e3a000e8 	mov	r0, #232	@ 0xe8
   895cc:	ebfe1355 	bl	e328 <operator new(unsigned int)@plt>
   895d0:	e1a05000 	mov	r5, r0
   895d4:	eb001755 	bl	8f330 <mixerengine::BeatEffectRoll::BeatEffectRoll()>
   895d8:	e584501c 	str	r5, [r4, #28]
   895dc:	e3a000b4 	mov	r0, #180	@ 0xb4
   895e0:	ebfe1350 	bl	e328 <operator new(unsigned int)@plt>
   895e4:	e1a05000 	mov	r5, r0
   895e8:	eb00ba14 	bl	b7e40 <mixerengine::BeatEffectFlanger::BeatEffectFlanger()>
   895ec:	e5845020 	str	r5, [r4, #32]
   895f0:	e3a0009c 	mov	r0, #156	@ 0x9c
   895f4:	ebfe134b 	bl	e328 <operator new(unsigned int)@plt>
   895f8:	e1a05000 	mov	r5, r0
   895fc:	eb00b7e9 	bl	b75a8 <mixerengine::BeatEffectEcho::BeatEffectEcho()>
   89600:	e5845024 	str	r5, [r4, #36]	@ 0x24
   89604:	e3a00098 	mov	r0, #152	@ 0x98
   89608:	ebfe1346 	bl	e328 <operator new(unsigned int)@plt>
   8960c:	e1a05000 	mov	r5, r0
   89610:	eb00b4c4 	bl	b6928 <mixerengine::BeatEffectDelay::BeatEffectDelay()>
   89614:	e5845028 	str	r5, [r4, #40]	@ 0x28
   89618:	e3a000f8 	mov	r0, #248	@ 0xf8
   8961c:	ebfe1341 	bl	e328 <operator new(unsigned int)@plt>
   89620:	e1a05000 	mov	r5, r0
   89624:	eb001ae6 	bl	901c4 <mixerengine::BeatEffectSpiral::BeatEffectSpiral()>
   89628:	e584502c 	str	r5, [r4, #44]	@ 0x2c
   8962c:	e3a000bc 	mov	r0, #188	@ 0xbc
   89630:	ebfe133c 	bl	e328 <operator new(unsigned int)@plt>
   89634:	e1a05000 	mov	r5, r0
   89638:	eb000830 	bl	8b700 <mixerengine::BeatEffectPitch::BeatEffectPitch()>
   8963c:	e5845030 	str	r5, [r4, #48]	@ 0x30
   89640:	e3a0009c 	mov	r0, #156	@ 0x9c
   89644:	ebfe1337 	bl	e328 <operator new(unsigned int)@plt>
   89648:	e1a05000 	mov	r5, r0
   8964c:	eb003b64 	bl	983e4 <mixerengine::BeatEffectPingPong::BeatEffectPingPong()>
   89650:	e5845034 	str	r5, [r4, #52]	@ 0x34
   89654:	e3a000b8 	mov	r0, #184	@ 0xb8
   89658:	ebfe1332 	bl	e328 <operator new(unsigned int)@plt>
   8965c:	e1a05000 	mov	r5, r0
   89660:	eb00368e 	bl	970a0 <mixerengine::BeatEffectPhaser::BeatEffectPhaser()>
   89664:	e5845038 	str	r5, [r4, #56]	@ 0x38
   89668:	e3a000c0 	mov	r0, #192	@ 0xc0
   8966c:	ebfe132d 	bl	e328 <operator new(unsigned int)@plt>
   89670:	e1a05000 	mov	r5, r0
   89674:	eb00291b 	bl	93ae8 <mixerengine::BeatEffectFilter::BeatEffectFilter()>
   89678:	e584503c 	str	r5, [r4, #60]	@ 0x3c
   8967c:	e3a000c8 	mov	r0, #200	@ 0xc8
   89680:	ebfe1328 	bl	e328 <operator new(unsigned int)@plt>
   89684:	e1a05000 	mov	r5, r0
   89688:	eb0024b9 	bl	92974 <mixerengine::BeatEffectHelix::BeatEffectHelix()>
   8968c:	e5845040 	str	r5, [r4, #64]	@ 0x40
   89690:	e3a00f49 	mov	r0, #292	@ 0x124
   89694:	ebfe1323 	bl	e328 <operator new(unsigned int)@plt>
   89698:	e1a05000 	mov	r5, r0
   8969c:	eb002dc1 	bl	94da8 <mixerengine::BeatEffectVinylBrake::BeatEffectVinylBrake()>
   896a0:	e5845044 	str	r5, [r4, #68]	@ 0x44
   896a4:	e3a000e8 	mov	r0, #232	@ 0xe8
   896a8:	ebfe131e 	bl	e328 <operator new(unsigned int)@plt>
   896ac:	e1a05000 	mov	r5, r0
   896b0:	eb00217c 	bl	91ca8 <mixerengine::BeatEffectSlipRoll::BeatEffectSlipRoll()>
   896b4:	e5940010 	ldr	r0, [r4, #16]
   896b8:	f2c00010 	vmov.i32	d16, #0	@ 0x00000000
   896bc:	e5943028 	ldr	r3, [r4, #40]	@ 0x28
   896c0:	e5845048 	str	r5, [r4, #72]	@ 0x48
   896c4:	e5d0203c 	ldrb	r2, [r0, #60]	@ 0x3c
   896c8:	e584300c 	str	r3, [r4, #12]
   896cc:	e284304c 	add	r3, r4, #76	@ 0x4c
   896d0:	e3520000 	cmp	r2, #0
   896d4:	e5840008 	str	r0, [r4, #8]
   896d8:	f443078f 	vst1.32	{d16}, [r3]
   896dc:	1a000002 	bne	896ec <mixerengine::BeatEffectManager::BeatEffectManager()+0x314>
   896e0:	e5903000 	ldr	r3, [r0]
   896e4:	e593301c 	ldr	r3, [r3, #28]
   896e8:	e12fff33 	blx	r3
   896ec:	e1a00004 	mov	r0, r4
   896f0:	e28dd018 	add	sp, sp, #24
   896f4:	ecbd8b04 	vpop	{d8-d9}
   896f8:	e8bd8070 	pop	{r4, r5, r6, pc}
   896fc:	e1a00005 	mov	r0, r5
   89700:	ebfe1572 	bl	ecd0 <operator delete(void*)@plt>
   89704:	ebfe15ec 	bl	eebc <__cxa_end_cleanup@plt>
   89708:	eafffffb 	b	896fc <mixerengine::BeatEffectManager::BeatEffectManager()+0x324>
   8970c:	eafffffa 	b	896fc <mixerengine::BeatEffectManager::BeatEffectManager()+0x324>
   89710:	eafffff9 	b	896fc <mixerengine::BeatEffectManager::BeatEffectManager()+0x324>
   89714:	eafffff8 	b	896fc <mixerengine::BeatEffectManager::BeatEffectManager()+0x324>
   89718:	eafffff7 	b	896fc <mixerengine::BeatEffectManager::BeatEffectManager()+0x324>
   8971c:	eafffff6 	b	896fc <mixerengine::BeatEffectManager::BeatEffectManager()+0x324>
   89720:	eafffff5 	b	896fc <mixerengine::BeatEffectManager::BeatEffectManager()+0x324>
   89724:	eafffff4 	b	896fc <mixerengine::BeatEffectManager::BeatEffectManager()+0x324>
   89728:	eafffff3 	b	896fc <mixerengine::BeatEffectManager::BeatEffectManager()+0x324>
   8972c:	eafffff2 	b	896fc <mixerengine::BeatEffectManager::BeatEffectManager()+0x324>
   89730:	eafffff1 	b	896fc <mixerengine::BeatEffectManager::BeatEffectManager()+0x324>
   89734:	eafffff0 	b	896fc <mixerengine::BeatEffectManager::BeatEffectManager()+0x324>
   89738:	eaffffef 	b	896fc <mixerengine::BeatEffectManager::BeatEffectManager()+0x324>
   8973c:	eaffffee 	b	896fc <mixerengine::BeatEffectManager::BeatEffectManager()+0x324>
	...
   89748:	408b3f46 	.word	0x408b3f46
   8974c:	447a0000 	.word	0x447a0000
   89750:	44bb646d 	.word	0x44bb646d
   89754:	0041db10 	.word	0x0041db10
   89758:	004172c0 	.word	0x004172c0
   8975c:	0041db24 	.word	0x0041db24
   89760:	0041db3c 	.word	0x0041db3c
