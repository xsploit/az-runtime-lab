
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

0009e3a8 <mixerengine::MixerChannel::changeEqualizerMode(djengine::EnEqualizerMode)>:
   9e3a8:	e3510002 	cmp	r1, #2
   9e3ac:	e92d4008 	push	{r3, lr}
   9e3b0:	08bd8008 	popeq	{r3, pc}
   9e3b4:	e3510000 	cmp	r1, #0
   9e3b8:	1a000006 	bne	9e3d8 <mixerengine::MixerChannel::changeEqualizerMode(djengine::EnEqualizerMode)+0x30>
   9e3bc:	e59021a4 	ldr	r2, [r0, #420]	@ 0x1a4
   9e3c0:	e5923000 	ldr	r3, [r2]
   9e3c4:	e58021ac 	str	r2, [r0, #428]	@ 0x1ac
   9e3c8:	e1a00002 	mov	r0, r2
   9e3cc:	e5933014 	ldr	r3, [r3, #20]
   9e3d0:	e12fff33 	blx	r3
   9e3d4:	e8bd8008 	pop	{r3, pc}
   9e3d8:	e3510001 	cmp	r1, #1
   9e3dc:	18bd8008 	popne	{r3, pc}
   9e3e0:	e59021a8 	ldr	r2, [r0, #424]	@ 0x1a8
   9e3e4:	e5923000 	ldr	r3, [r2]
   9e3e8:	e58021ac 	str	r2, [r0, #428]	@ 0x1ac
   9e3ec:	e1a00002 	mov	r0, r2
   9e3f0:	e5933014 	ldr	r3, [r3, #20]
   9e3f4:	e12fff33 	blx	r3
   9e3f8:	e8bd8008 	pop	{r3, pc}

0009e3fc <mixerengine::MixerChannel::updateFilter(int)>:
   9e3fc:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   9e400:	e1a04000 	mov	r4, r0
   9e404:	e59001e0 	ldr	r0, [r0, #480]	@ 0x1e0
   9e408:	e1a05001 	mov	r5, r1
   9e40c:	eb0078db 	bl	bc780 <mixerengine::SoundColorFxManager::getEffectPosition() const>
   9e410:	e2506000 	subs	r6, r0, #0
   9e414:	0a0000cf 	beq	9e758 <mixerengine::MixerChannel::updateFilter(int)+0x35c>
   9e418:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e41c:	ebffad38 	bl	89904 <mixerengine::BeatEffectManager::getBeatEffectSelectChannel() const>
   9e420:	e5943210 	ldr	r3, [r4, #528]	@ 0x210
   9e424:	e1500003 	cmp	r0, r3
   9e428:	0a0000d3 	beq	9e77c <mixerengine::MixerChannel::updateFilter(int)+0x380>
   9e42c:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e430:	ebffad39 	bl	8991c <mixerengine::BeatEffectManager::getEffectPosition() const>
   9e434:	e2507000 	subs	r7, r0, #0
   9e438:	0a0000d7 	beq	9e79c <mixerengine::MixerChannel::updateFilter(int)+0x3a0>
   9e43c:	e59401ac 	ldr	r0, [r4, #428]	@ 0x1ac
   9e440:	e1a03005 	mov	r3, r5
   9e444:	e594101c 	ldr	r1, [r4, #28]
   9e448:	e590c000 	ldr	ip, [r0]
   9e44c:	e1a02001 	mov	r2, r1
   9e450:	e59cc008 	ldr	ip, [ip, #8]
   9e454:	e12fff3c 	blx	ip
   9e458:	e5d471b4 	ldrb	r7, [r4, #436]	@ 0x1b4
   9e45c:	e3570000 	cmp	r7, #0
   9e460:	1a000085 	bne	9e67c <mixerengine::MixerChannel::updateFilter(int)+0x280>
   9e464:	e5d431dc 	ldrb	r3, [r4, #476]	@ 0x1dc
   9e468:	e3530000 	cmp	r3, #0
   9e46c:	0a000082 	beq	9e67c <mixerengine::MixerChannel::updateFilter(int)+0x280>
   9e470:	e3560001 	cmp	r6, #1
   9e474:	0a0000f1 	beq	9e840 <mixerengine::MixerChannel::updateFilter(int)+0x444>
   9e478:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e47c:	ebffad26 	bl	8991c <mixerengine::BeatEffectManager::getEffectPosition() const>
   9e480:	e3500001 	cmp	r0, #1
   9e484:	0a0000e2 	beq	9e814 <mixerengine::MixerChannel::updateFilter(int)+0x418>
   9e488:	e3550000 	cmp	r5, #0
   9e48c:	da000024 	ble	9e524 <mixerengine::MixerChannel::updateFilter(int)+0x128>
   9e490:	e594001c 	ldr	r0, [r4, #28]
   9e494:	e3a03000 	mov	r3, #0
   9e498:	e594c020 	ldr	ip, [r4, #32]
   9e49c:	e3a0e001 	mov	lr, #1
   9e4a0:	ea000001 	b	9e4ac <mixerengine::MixerChannel::updateFilter(int)+0xb0>
   9e4a4:	e1530005 	cmp	r3, r5
   9e4a8:	0a00001d 	beq	9e524 <mixerengine::MixerChannel::updateFilter(int)+0x128>
   9e4ac:	e1a01183 	lsl	r1, r3, #3
   9e4b0:	edd41b16 	vldr	d17, [r4, #88]	@ 0x58
   9e4b4:	e0802001 	add	r2, r0, r1
   9e4b8:	edd22b00 	vldr	d18, [r2]
   9e4bc:	f3f92722 	vabs.f32	d18, d18
   9e4c0:	edd40b1c 	vldr	d16, [r4, #112]	@ 0x70
   9e4c4:	e08c1001 	add	r1, ip, r1
   9e4c8:	e2833001 	add	r3, r3, #1
   9e4cc:	f2421fa1 	vmax.f32	d17, d18, d17
   9e4d0:	edc41b16 	vstr	d17, [r4, #88]	@ 0x58
   9e4d4:	edd21b00 	vldr	d17, [r2]
   9e4d8:	f3410db0 	vmul.f32	d16, d17, d16
   9e4dc:	edc10b00 	vstr	d16, [r1]
   9e4e0:	e5d42084 	ldrb	r2, [r4, #132]	@ 0x84
   9e4e4:	e3520000 	cmp	r2, #0
   9e4e8:	1affffed 	bne	9e4a4 <mixerengine::MixerChannel::updateFilter(int)+0xa8>
   9e4ec:	e5942078 	ldr	r2, [r4, #120]	@ 0x78
   9e4f0:	edd41b1c 	vldr	d17, [r4, #112]	@ 0x70
   9e4f4:	e594107c 	ldr	r1, [r4, #124]	@ 0x7c
   9e4f8:	edd40b18 	vldr	d16, [r4, #96]	@ 0x60
   9e4fc:	f2410da0 	vadd.f32	d16, d17, d16
   9e500:	edc40b1c 	vstr	d16, [r4, #112]	@ 0x70
   9e504:	e1520001 	cmp	r2, r1
   9e508:	e2822001 	add	r2, r2, #1
   9e50c:	2dd40b1a 	vldrcs	d16, [r4, #104]	@ 0x68
   9e510:	25c4e084 	strbcs	lr, [r4, #132]	@ 0x84
   9e514:	2dc40b1c 	vstrcs	d16, [r4, #112]	@ 0x70
   9e518:	e1530005 	cmp	r3, r5
   9e51c:	e5842078 	str	r2, [r4, #120]	@ 0x78
   9e520:	1affffe1 	bne	9e4ac <mixerengine::MixerChannel::updateFilter(int)+0xb0>
   9e524:	e3560002 	cmp	r6, #2
   9e528:	0a0000a6 	beq	9e7c8 <mixerengine::MixerChannel::updateFilter(int)+0x3cc>
   9e52c:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e530:	ebffacf9 	bl	8991c <mixerengine::BeatEffectManager::getEffectPosition() const>
   9e534:	e3500002 	cmp	r0, #2
   9e538:	0a0000aa 	beq	9e7e8 <mixerengine::MixerChannel::updateFilter(int)+0x3ec>
   9e53c:	e3550000 	cmp	r5, #0
   9e540:	da00003b 	ble	9e634 <mixerengine::MixerChannel::updateFilter(int)+0x238>
   9e544:	e594001c 	ldr	r0, [r4, #28]
   9e548:	e3a03000 	mov	r3, #0
   9e54c:	e594c020 	ldr	ip, [r4, #32]
   9e550:	e3a07001 	mov	r7, #1
   9e554:	e5946024 	ldr	r6, [r4, #36]	@ 0x24
   9e558:	ea000008 	b	9e580 <mixerengine::MixerChannel::updateFilter(int)+0x184>
   9e55c:	edd21b00 	vldr	d17, [r2]
   9e560:	edd40b7e 	vldr	d16, [r4, #504]	@ 0x1f8
   9e564:	f3410db0 	vmul.f32	d16, d17, d16
   9e568:	edc10b00 	vstr	d16, [r1]
   9e56c:	e5d4220c 	ldrb	r2, [r4, #524]	@ 0x20c
   9e570:	e3520000 	cmp	r2, #0
   9e574:	0a000020 	beq	9e5fc <mixerengine::MixerChannel::updateFilter(int)+0x200>
   9e578:	e1530005 	cmp	r3, r5
   9e57c:	0a00002c 	beq	9e634 <mixerengine::MixerChannel::updateFilter(int)+0x238>
   9e580:	e1a02183 	lsl	r2, r3, #3
   9e584:	edd40b28 	vldr	d16, [r4, #160]	@ 0xa0
   9e588:	e08c1002 	add	r1, ip, r2
   9e58c:	edd11b00 	vldr	d17, [r1]
   9e590:	f3410db0 	vmul.f32	d16, d17, d16
   9e594:	edc10b00 	vstr	d16, [r1]
   9e598:	e5d4e0b4 	ldrb	lr, [r4, #180]	@ 0xb4
   9e59c:	e0861002 	add	r1, r6, r2
   9e5a0:	e2833001 	add	r3, r3, #1
   9e5a4:	e0802002 	add	r2, r0, r2
   9e5a8:	e35e0000 	cmp	lr, #0
   9e5ac:	1affffea 	bne	9e55c <mixerengine::MixerChannel::updateFilter(int)+0x160>
   9e5b0:	e594e0a8 	ldr	lr, [r4, #168]	@ 0xa8
   9e5b4:	edd41b28 	vldr	d17, [r4, #160]	@ 0xa0
   9e5b8:	e59480ac 	ldr	r8, [r4, #172]	@ 0xac
   9e5bc:	edd40b24 	vldr	d16, [r4, #144]	@ 0x90
   9e5c0:	f2410da0 	vadd.f32	d16, d17, d16
   9e5c4:	edc40b28 	vstr	d16, [r4, #160]	@ 0xa0
   9e5c8:	e15e0008 	cmp	lr, r8
   9e5cc:	e28ee001 	add	lr, lr, #1
   9e5d0:	2dd40b26 	vldrcs	d16, [r4, #152]	@ 0x98
   9e5d4:	25c470b4 	strbcs	r7, [r4, #180]	@ 0xb4
   9e5d8:	2dc40b28 	vstrcs	d16, [r4, #160]	@ 0xa0
   9e5dc:	edd21b00 	vldr	d17, [r2]
   9e5e0:	edd40b7e 	vldr	d16, [r4, #504]	@ 0x1f8
   9e5e4:	e584e0a8 	str	lr, [r4, #168]	@ 0xa8
   9e5e8:	f3410db0 	vmul.f32	d16, d17, d16
   9e5ec:	edc10b00 	vstr	d16, [r1]
   9e5f0:	e5d4220c 	ldrb	r2, [r4, #524]	@ 0x20c
   9e5f4:	e3520000 	cmp	r2, #0
   9e5f8:	1affffde 	bne	9e578 <mixerengine::MixerChannel::updateFilter(int)+0x17c>
   9e5fc:	e5942200 	ldr	r2, [r4, #512]	@ 0x200
   9e600:	edd41b7e 	vldr	d17, [r4, #504]	@ 0x1f8
   9e604:	e5941204 	ldr	r1, [r4, #516]	@ 0x204
   9e608:	edd40b7a 	vldr	d16, [r4, #488]	@ 0x1e8
   9e60c:	f2410da0 	vadd.f32	d16, d17, d16
   9e610:	edc40b7e 	vstr	d16, [r4, #504]	@ 0x1f8
   9e614:	e1520001 	cmp	r2, r1
   9e618:	e2822001 	add	r2, r2, #1
   9e61c:	2dd40b7c 	vldrcs	d16, [r4, #496]	@ 0x1f0
   9e620:	25c4720c 	strbcs	r7, [r4, #524]	@ 0x20c
   9e624:	2dc40b7e 	vstrcs	d16, [r4, #504]	@ 0x1f8
   9e628:	e1530005 	cmp	r3, r5
   9e62c:	e5842200 	str	r2, [r4, #512]	@ 0x200
   9e630:	1affffd2 	bne	9e580 <mixerengine::MixerChannel::updateFilter(int)+0x184>
   9e634:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e638:	ebffacb1 	bl	89904 <mixerengine::BeatEffectManager::getBeatEffectSelectChannel() const>
   9e63c:	e5943214 	ldr	r3, [r4, #532]	@ 0x214
   9e640:	e1500003 	cmp	r0, r3
   9e644:	0a000082 	beq	9e854 <mixerengine::MixerChannel::updateFilter(int)+0x458>
   9e648:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e64c:	ebffacac 	bl	89904 <mixerengine::BeatEffectManager::getBeatEffectSelectChannel() const>
   9e650:	e5943214 	ldr	r3, [r4, #532]	@ 0x214
   9e654:	e1500003 	cmp	r0, r3
   9e658:	18bd81f0 	popne	{r4, r5, r6, r7, r8, pc}
   9e65c:	e59430c4 	ldr	r3, [r4, #196]	@ 0xc4
   9e660:	e1a02005 	mov	r2, r5
   9e664:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e668:	e2733001 	rsbs	r3, r3, #1
   9e66c:	e5941020 	ldr	r1, [r4, #32]
   9e670:	33a03000 	movcc	r3, #0
   9e674:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   9e678:	eaffafab 	b	8a52c <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)>
   9e67c:	e3550000 	cmp	r5, #0
   9e680:	da000016 	ble	9e6e0 <mixerengine::MixerChannel::updateFilter(int)+0x2e4>
   9e684:	e594001c 	ldr	r0, [r4, #28]
   9e688:	e3a03000 	mov	r3, #0
   9e68c:	e594c1d4 	ldr	ip, [r4, #468]	@ 0x1d4
   9e690:	e3a0e001 	mov	lr, #1
   9e694:	e59411d0 	ldr	r1, [r4, #464]	@ 0x1d0
   9e698:	e151000c 	cmp	r1, ip
   9e69c:	edd41b72 	vldr	d17, [r4, #456]	@ 0x1c8
   9e6a0:	e0802183 	add	r2, r0, r3, lsl #3
   9e6a4:	edd40b6e 	vldr	d16, [r4, #440]	@ 0x1b8
   9e6a8:	e2833001 	add	r3, r3, #1
   9e6ac:	f2410da0 	vadd.f32	d16, d17, d16
   9e6b0:	edc40b72 	vstr	d16, [r4, #456]	@ 0x1c8
   9e6b4:	2dd40b70 	vldrcs	d16, [r4, #448]	@ 0x1c0
   9e6b8:	25c4e1dc 	strbcs	lr, [r4, #476]	@ 0x1dc
   9e6bc:	2dc40b72 	vstrcs	d16, [r4, #456]	@ 0x1c8
   9e6c0:	e1530005 	cmp	r3, r5
   9e6c4:	edd21b00 	vldr	d17, [r2]
   9e6c8:	edd40b72 	vldr	d16, [r4, #456]	@ 0x1c8
   9e6cc:	e2811001 	add	r1, r1, #1
   9e6d0:	f3410db0 	vmul.f32	d16, d17, d16
   9e6d4:	e58411d0 	str	r1, [r4, #464]	@ 0x1d0
   9e6d8:	edc20b00 	vstr	d16, [r2]
   9e6dc:	1affffed 	bne	9e698 <mixerengine::MixerChannel::updateFilter(int)+0x29c>
   9e6e0:	e5d431dc 	ldrb	r3, [r4, #476]	@ 0x1dc
   9e6e4:	e3530000 	cmp	r3, #0
   9e6e8:	0affff60 	beq	9e470 <mixerengine::MixerChannel::updateFilter(int)+0x74>
   9e6ec:	e3570000 	cmp	r7, #0
   9e6f0:	0affff5e 	beq	9e470 <mixerengine::MixerChannel::updateFilter(int)+0x74>
   9e6f4:	edd41b6e 	vldr	d17, [r4, #440]	@ 0x1b8
   9e6f8:	edd40b72 	vldr	d16, [r4, #456]	@ 0x1c8
   9e6fc:	f2401da1 	vadd.f32	d17, d16, d17
   9e700:	e59431d8 	ldr	r3, [r4, #472]	@ 0x1d8
   9e704:	f2c70f10 	vmov.f32	d16, #1	@ 0x3f800000
   9e708:	e59421b0 	ldr	r2, [r4, #432]	@ 0x1b0
   9e70c:	edc40b70 	vstr	d16, [r4, #448]	@ 0x1c0
   9e710:	e3520002 	cmp	r2, #2
   9e714:	ee823b90 	vdup.32	d18, r3
   9e718:	f2601da1 	vsub.f32	d17, d16, d17
   9e71c:	e3a03000 	mov	r3, #0
   9e720:	e5c431b4 	strb	r3, [r4, #436]	@ 0x1b4
   9e724:	e58431d0 	str	r3, [r4, #464]	@ 0x1d0
   9e728:	e5c431dc 	strb	r3, [r4, #476]	@ 0x1dc
   9e72c:	f3410db2 	vmul.f32	d16, d17, d18
   9e730:	edc40b6e 	vstr	d16, [r4, #440]	@ 0x1b8
   9e734:	0affff4d 	beq	9e470 <mixerengine::MixerChannel::updateFilter(int)+0x74>
   9e738:	e1520003 	cmp	r2, r3
   9e73c:	1a00004e 	bne	9e87c <mixerengine::MixerChannel::updateFilter(int)+0x480>
   9e740:	e59401a4 	ldr	r0, [r4, #420]	@ 0x1a4
   9e744:	e58401ac 	str	r0, [r4, #428]	@ 0x1ac
   9e748:	e5903000 	ldr	r3, [r0]
   9e74c:	e5933014 	ldr	r3, [r3, #20]
   9e750:	e12fff33 	blx	r3
   9e754:	eaffff45 	b	9e470 <mixerengine::MixerChannel::updateFilter(int)+0x74>
   9e758:	e59401e0 	ldr	r0, [r4, #480]	@ 0x1e0
   9e75c:	e1a02005 	mov	r2, r5
   9e760:	e594101c 	ldr	r1, [r4, #28]
   9e764:	eb00753f 	bl	bbc68 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)>
   9e768:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e76c:	ebffac64 	bl	89904 <mixerengine::BeatEffectManager::getBeatEffectSelectChannel() const>
   9e770:	e5943210 	ldr	r3, [r4, #528]	@ 0x210
   9e774:	e1500003 	cmp	r0, r3
   9e778:	1affff2b 	bne	9e42c <mixerengine::MixerChannel::updateFilter(int)+0x30>
   9e77c:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e780:	e1a02005 	mov	r2, r5
   9e784:	e594101c 	ldr	r1, [r4, #28]
   9e788:	ebffb1f0 	bl	8af50 <mixerengine::BeatEffectManager::copyMusicData(common::Float2 const*, int)>
   9e78c:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e790:	ebffac61 	bl	8991c <mixerengine::BeatEffectManager::getEffectPosition() const>
   9e794:	e2507000 	subs	r7, r0, #0
   9e798:	1affff27 	bne	9e43c <mixerengine::MixerChannel::updateFilter(int)+0x40>
   9e79c:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e7a0:	ebffac57 	bl	89904 <mixerengine::BeatEffectManager::getBeatEffectSelectChannel() const>
   9e7a4:	e5943210 	ldr	r3, [r4, #528]	@ 0x210
   9e7a8:	e1500003 	cmp	r0, r3
   9e7ac:	1affff22 	bne	9e43c <mixerengine::MixerChannel::updateFilter(int)+0x40>
   9e7b0:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e7b4:	e1a02005 	mov	r2, r5
   9e7b8:	e594101c 	ldr	r1, [r4, #28]
   9e7bc:	e1a03007 	mov	r3, r7
   9e7c0:	ebffaf59 	bl	8a52c <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)>
   9e7c4:	eaffff1c 	b	9e43c <mixerengine::MixerChannel::updateFilter(int)+0x40>
   9e7c8:	e59401e0 	ldr	r0, [r4, #480]	@ 0x1e0
   9e7cc:	e1a02005 	mov	r2, r5
   9e7d0:	e5941020 	ldr	r1, [r4, #32]
   9e7d4:	eb007523 	bl	bbc68 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)>
   9e7d8:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e7dc:	ebffac4e 	bl	8991c <mixerengine::BeatEffectManager::getEffectPosition() const>
   9e7e0:	e3500002 	cmp	r0, #2
   9e7e4:	1affff54 	bne	9e53c <mixerengine::MixerChannel::updateFilter(int)+0x140>
   9e7e8:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e7ec:	ebffac44 	bl	89904 <mixerengine::BeatEffectManager::getBeatEffectSelectChannel() const>
   9e7f0:	e5943210 	ldr	r3, [r4, #528]	@ 0x210
   9e7f4:	e1500003 	cmp	r0, r3
   9e7f8:	1affff4f 	bne	9e53c <mixerengine::MixerChannel::updateFilter(int)+0x140>
   9e7fc:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e800:	e1a02005 	mov	r2, r5
   9e804:	e5941020 	ldr	r1, [r4, #32]
   9e808:	e3a03000 	mov	r3, #0
   9e80c:	ebffaf46 	bl	8a52c <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)>
   9e810:	eaffff49 	b	9e53c <mixerengine::MixerChannel::updateFilter(int)+0x140>
   9e814:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e818:	ebffac39 	bl	89904 <mixerengine::BeatEffectManager::getBeatEffectSelectChannel() const>
   9e81c:	e5943210 	ldr	r3, [r4, #528]	@ 0x210
   9e820:	e1500003 	cmp	r0, r3
   9e824:	1affff17 	bne	9e488 <mixerengine::MixerChannel::updateFilter(int)+0x8c>
   9e828:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e82c:	e1a02005 	mov	r2, r5
   9e830:	e594101c 	ldr	r1, [r4, #28]
   9e834:	e3a03000 	mov	r3, #0
   9e838:	ebffaf3b 	bl	8a52c <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)>
   9e83c:	eaffff11 	b	9e488 <mixerengine::MixerChannel::updateFilter(int)+0x8c>
   9e840:	e59401e0 	ldr	r0, [r4, #480]	@ 0x1e0
   9e844:	e1a02005 	mov	r2, r5
   9e848:	e594101c 	ldr	r1, [r4, #28]
   9e84c:	eb007505 	bl	bbc68 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)>
   9e850:	eaffff08 	b	9e478 <mixerengine::MixerChannel::updateFilter(int)+0x7c>
   9e854:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e858:	e1a02005 	mov	r2, r5
   9e85c:	e5941020 	ldr	r1, [r4, #32]
   9e860:	ebffb1ba 	bl	8af50 <mixerengine::BeatEffectManager::copyMusicData(common::Float2 const*, int)>
   9e864:	e5940218 	ldr	r0, [r4, #536]	@ 0x218
   9e868:	ebffac25 	bl	89904 <mixerengine::BeatEffectManager::getBeatEffectSelectChannel() const>
   9e86c:	e5943214 	ldr	r3, [r4, #532]	@ 0x214
   9e870:	e1500003 	cmp	r0, r3
   9e874:	18bd81f0 	popne	{r4, r5, r6, r7, r8, pc}
   9e878:	eaffff77 	b	9e65c <mixerengine::MixerChannel::updateFilter(int)+0x260>
   9e87c:	e3520001 	cmp	r2, #1
   9e880:	1afffefa 	bne	9e470 <mixerengine::MixerChannel::updateFilter(int)+0x74>
   9e884:	e59401a8 	ldr	r0, [r4, #424]	@ 0x1a8
   9e888:	e58401ac 	str	r0, [r4, #428]	@ 0x1ac
   9e88c:	eaffffad 	b	9e748 <mixerengine::MixerChannel::updateFilter(int)+0x34c>

0009e890 <mixerengine::MixerChannel::update(int)>:
   9e890:	e59030d0 	ldr	r3, [r0, #208]	@ 0xd0
   9e894:	e92d4070 	push	{r4, r5, r6, lr}
   9e898:	e3530002 	cmp	r3, #2
   9e89c:	e1a04000 	mov	r4, r0
   9e8a0:	e1a05001 	mov	r5, r1
   9e8a4:	0a0000bc 	beq	9eb9c <mixerengine::MixerChannel::update(int)+0x30c>
   9e8a8:	e3530003 	cmp	r3, #3
   9e8ac:	0a0000b5 	beq	9eb88 <mixerengine::MixerChannel::update(int)+0x2f8>
   9e8b0:	e3530001 	cmp	r3, #1
   9e8b4:	0a0000a3 	beq	9eb48 <mixerengine::MixerChannel::update(int)+0x2b8>
   9e8b8:	e5943108 	ldr	r3, [r4, #264]	@ 0x108
   9e8bc:	e2433001 	sub	r3, r3, #1
   9e8c0:	e3530003 	cmp	r3, #3
   9e8c4:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
   9e8c8:	ea000007 	b	9e8ec <mixerengine::MixerChannel::update(int)+0x5c>
   9e8cc:	0009eaf8 	.word	0x0009eaf8
   9e8d0:	0009ea7c 	.word	0x0009ea7c
   9e8d4:	0009ea28 	.word	0x0009ea28
   9e8d8:	0009e8dc 	.word	0x0009e8dc
   9e8dc:	e5d43134 	ldrb	r3, [r4, #308]	@ 0x134
   9e8e0:	e3530000 	cmp	r3, #0
   9e8e4:	13a03000 	movne	r3, #0
   9e8e8:	15843108 	strne	r3, [r4, #264]	@ 0x108
   9e8ec:	e5940014 	ldr	r0, [r4, #20]
   9e8f0:	ebff9be8 	bl	85898 <djengine::MixerRouteMngr::getPlayerDataPointer(djengine::EnMixerInput)>
   9e8f4:	e3500000 	cmp	r0, #0
   9e8f8:	08bd8070 	popeq	{r4, r5, r6, pc}
   9e8fc:	e3550000 	cmp	r5, #0
