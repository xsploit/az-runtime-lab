
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

00098980 <mixerengine::BpmQuantizeEffect::setQuantizedTime()+0x124>:
   98980:	e59f1050 	ldr	r1, [pc, #80]	@ 989d8 <mixerengine::BpmQuantizeEffect::setQuantizedTime()+0x17c>
   98984:	e0000093 	mul	r0, r3, r0
   98988:	e7911102 	ldr	r1, [r1, r2, lsl #2]
   9898c:	ebfdda2e 	bl	f24c <__aeabi_uidiv@plt>
   98990:	e1a01004 	mov	r1, r4
   98994:	ebfdda2c 	bl	f24c <__aeabi_uidiv@plt>
   98998:	e596300c 	ldr	r3, [r6, #12]
   9899c:	e3a01003 	mov	r1, #3
   989a0:	ee070a10 	vmov	s14, r0
   989a4:	eef87a47 	vcvt.f32.u32	s15, s14
   989a8:	e1a00005 	mov	r0, r5
   989ac:	ee172a90 	vmov	r2, s15
   989b0:	e12fff33 	blx	r3
   989b4:	eaffffe9 	b	98960 <mixerengine::BpmQuantizeEffect::setQuantizedTime()+0x104>
   989b8:	e1a02003 	mov	r2, r3
   989bc:	e1a0300c 	mov	r3, ip
   989c0:	e0623003 	rsb	r3, r2, r3
   989c4:	e2814008 	add	r4, r1, #8
   989c8:	e243c001 	sub	ip, r3, #1
   989cc:	eaffffba 	b	988bc <mixerengine::BpmQuantizeEffect::setQuantizedTime()+0x60>
   989d0:	00420074 	.word	0x00420074
   989d4:	00420010 	.word	0x00420010
   989d8:	0041ffe0 	.word	0x0041ffe0

000989dc <mixerengine::BpmQuantizeEffect::checkTimeUpdate()>:
   989dc:	e92d40f0 	push	{r4, r5, r6, r7, lr}
   989e0:	e24dd00c 	sub	sp, sp, #12
   989e4:	e1a04000 	mov	r4, r0
   989e8:	e28d0004 	add	r0, sp, #4
   989ec:	eb00019b 	bl	99060 <mixerengine::QuantizedBeatEffect::checkBeatPosition(djengine::EnPlayerChannel*)>
   989f0:	e2505000 	subs	r5, r0, #0
   989f4:	0a000005 	beq	98a10 <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0x34>
   989f8:	eb007525 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   989fc:	e59d1004 	ldr	r1, [sp, #4]
   98a00:	e1a06000 	mov	r6, r0
   98a04:	ebff158c 	bl	5e03c <playengine::PlayEngine::isReversing(djengine::EnPlayerChannel) const>
   98a08:	e3500000 	cmp	r0, #0
   98a0c:	0a000001 	beq	98a18 <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0x3c>
   98a10:	e28dd00c 	add	sp, sp, #12
   98a14:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
   98a18:	e1a00006 	mov	r0, r6
   98a1c:	e59d1004 	ldr	r1, [sp, #4]
   98a20:	ebff1669 	bl	5e3cc <playengine::PlayEngine::isJogScratching(djengine::EnPlayerChannel) const>
   98a24:	e3500000 	cmp	r0, #0
   98a28:	1afffff8 	bne	98a10 <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0x34>
   98a2c:	e1a00006 	mov	r0, r6
   98a30:	e59d1004 	ldr	r1, [sp, #4]
   98a34:	ebff1673 	bl	5e408 <playengine::PlayEngine::isJogSpinning(djengine::EnPlayerChannel) const>
   98a38:	e3500000 	cmp	r0, #0
   98a3c:	1afffff3 	bne	98a10 <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0x34>
   98a40:	e1a00006 	mov	r0, r6
   98a44:	e59d1004 	ldr	r1, [sp, #4]
   98a48:	ebff15af 	bl	5e10c <playengine::PlayEngine::isScanning(djengine::EnPlayerChannel) const>
   98a4c:	e3500000 	cmp	r0, #0
   98a50:	1affffee 	bne	98a10 <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0x34>
   98a54:	e1a00006 	mov	r0, r6
   98a58:	e59d1004 	ldr	r1, [sp, #4]
   98a5c:	ebff13da 	bl	5d9cc <playengine::PlayEngine::getPlayingTime(djengine::EnPlayerChannel) const>
   98a60:	e5953024 	ldr	r3, [r5, #36]	@ 0x24
   98a64:	e3530000 	cmp	r3, #0
   98a68:	05955038 	ldreq	r5, [r5, #56]	@ 0x38
   98a6c:	e1a0c000 	mov	ip, r0
   98a70:	0a000021 	beq	98afc <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0x120>
   98a74:	e5953028 	ldr	r3, [r5, #40]	@ 0x28
   98a78:	e05cc003 	subs	ip, ip, r3
   98a7c:	45955034 	ldrmi	r5, [r5, #52]	@ 0x34
   98a80:	4a00001d 	bmi	98afc <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0x120>
   98a84:	e5956034 	ldr	r6, [r5, #52]	@ 0x34
   98a88:	e5957038 	ldr	r7, [r5, #56]	@ 0x38
   98a8c:	e585c030 	str	ip, [r5, #48]	@ 0x30
   98a90:	e0660007 	rsb	r0, r6, r7
   98a94:	e1a05006 	mov	r5, r6
   98a98:	e1a001c0 	asr	r0, r0, #3
   98a9c:	e3500000 	cmp	r0, #0
   98aa0:	da000011 	ble	98aec <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0x110>
   98aa4:	e1a030c0 	asr	r3, r0, #1
   98aa8:	e0851183 	add	r1, r5, r3, lsl #3
   98aac:	e5912004 	ldr	r2, [r1, #4]
   98ab0:	e15c0002 	cmp	ip, r2
   98ab4:	9a000001 	bls	98ac0 <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0xe4>
   98ab8:	ea000016 	b	98b18 <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0x13c>
   98abc:	e1a03002 	mov	r3, r2
   98ac0:	e1a020c3 	asr	r2, r3, #1
   98ac4:	e3530000 	cmp	r3, #0
   98ac8:	e0851182 	add	r1, r5, r2, lsl #3
   98acc:	0a000006 	beq	98aec <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0x110>
   98ad0:	e5910004 	ldr	r0, [r1, #4]
   98ad4:	e15c0000 	cmp	ip, r0
   98ad8:	9afffff7 	bls	98abc <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0xe0>
   98adc:	e0623003 	rsb	r3, r2, r3
   98ae0:	e2815008 	add	r5, r1, #8
   98ae4:	e2430001 	sub	r0, r3, #1
   98ae8:	eaffffeb 	b	98a9c <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0xc0>
   98aec:	e1560005 	cmp	r6, r5
   98af0:	0a000001 	beq	98afc <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0x120>
   98af4:	e1570005 	cmp	r7, r5
   98af8:	02455008 	subeq	r5, r5, #8
   98afc:	e594306c 	ldr	r3, [r4, #108]	@ 0x6c
   98b00:	e1530005 	cmp	r3, r5
   98b04:	0affffc1 	beq	98a10 <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0x34>
   98b08:	e1a00004 	mov	r0, r4
   98b0c:	ebffff52 	bl	9885c <mixerengine::BpmQuantizeEffect::setQuantizedTime()>
   98b10:	e584506c 	str	r5, [r4, #108]	@ 0x6c
   98b14:	eaffffbd 	b	98a10 <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0x34>
   98b18:	e1a02003 	mov	r2, r3
   98b1c:	e1a03000 	mov	r3, r0
   98b20:	eaffffed 	b	98adc <mixerengine::BpmQuantizeEffect::checkTimeUpdate()+0x100>

00098b24 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)>:
   98b24:	e351000b 	cmp	r1, #11
   98b28:	e92d40f0 	push	{r4, r5, r6, r7, lr}
   98b2c:	e1a04000 	mov	r4, r0
   98b30:	e24dd00c 	sub	sp, sp, #12
   98b34:	9a000001 	bls	98b40 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x1c>
   98b38:	e28dd00c 	add	sp, sp, #12
   98b3c:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
   98b40:	eb00744e 	bl	b5c80 <mixerengine::BeatEffect::checkBeatButtonRange(djengine::EnBeatButtonType, bool)>
   98b44:	e1a00004 	mov	r0, r4
   98b48:	eb000114 	bl	98fa0 <mixerengine::QuantizedBeatEffect::checkQuantizeSetting()>
   98b4c:	e3500000 	cmp	r0, #0
   98b50:	0afffff8 	beq	98b38 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x14>
   98b54:	e1a00004 	mov	r0, r4
   98b58:	ebffff3f 	bl	9885c <mixerengine::BpmQuantizeEffect::setQuantizedTime()>
   98b5c:	e28d0004 	add	r0, sp, #4
   98b60:	eb00013e 	bl	99060 <mixerengine::QuantizedBeatEffect::checkBeatPosition(djengine::EnPlayerChannel*)>
   98b64:	e2505000 	subs	r5, r0, #0
   98b68:	0afffff2 	beq	98b38 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x14>
   98b6c:	eb0074c8 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   98b70:	e59d1004 	ldr	r1, [sp, #4]
   98b74:	ebff1394 	bl	5d9cc <playengine::PlayEngine::getPlayingTime(djengine::EnPlayerChannel) const>
   98b78:	e5953024 	ldr	r3, [r5, #36]	@ 0x24
   98b7c:	e3530000 	cmp	r3, #0
   98b80:	05955038 	ldreq	r5, [r5, #56]	@ 0x38
   98b84:	0a000021 	beq	98c10 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0xec>
   98b88:	e5953028 	ldr	r3, [r5, #40]	@ 0x28
   98b8c:	e0500003 	subs	r0, r0, r3
   98b90:	45955034 	ldrmi	r5, [r5, #52]	@ 0x34
   98b94:	4a00001d 	bmi	98c10 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0xec>
   98b98:	e5956034 	ldr	r6, [r5, #52]	@ 0x34
   98b9c:	e5957038 	ldr	r7, [r5, #56]	@ 0x38
   98ba0:	e5850030 	str	r0, [r5, #48]	@ 0x30
   98ba4:	e066c007 	rsb	ip, r6, r7
   98ba8:	e1a05006 	mov	r5, r6
   98bac:	e1a0c1cc 	asr	ip, ip, #3
   98bb0:	e35c0000 	cmp	ip, #0
   98bb4:	da000011 	ble	98c00 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0xdc>
   98bb8:	e1a030cc 	asr	r3, ip, #1
   98bbc:	e0851183 	add	r1, r5, r3, lsl #3
   98bc0:	e5912004 	ldr	r2, [r1, #4]
   98bc4:	e1500002 	cmp	r0, r2
   98bc8:	9a000001 	bls	98bd4 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0xb0>
   98bcc:	ea000011 	b	98c18 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0xf4>
   98bd0:	e1a03002 	mov	r3, r2
   98bd4:	e1a020c3 	asr	r2, r3, #1
   98bd8:	e3530000 	cmp	r3, #0
   98bdc:	e0851182 	add	r1, r5, r2, lsl #3
   98be0:	0a000006 	beq	98c00 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0xdc>
   98be4:	e591c004 	ldr	ip, [r1, #4]
   98be8:	e150000c 	cmp	r0, ip
   98bec:	9afffff7 	bls	98bd0 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0xac>
   98bf0:	e0623003 	rsb	r3, r2, r3
   98bf4:	e2815008 	add	r5, r1, #8
   98bf8:	e243c001 	sub	ip, r3, #1
   98bfc:	eaffffeb 	b	98bb0 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x8c>
   98c00:	e1560005 	cmp	r6, r5
   98c04:	0a000001 	beq	98c10 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0xec>
   98c08:	e1570005 	cmp	r7, r5
   98c0c:	02455008 	subeq	r5, r5, #8
   98c10:	e584506c 	str	r5, [r4, #108]	@ 0x6c
   98c14:	eaffffc7 	b	98b38 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x14>
   98c18:	e1a02003 	mov	r2, r3
   98c1c:	e1a0300c 	mov	r3, ip
   98c20:	eafffff2 	b	98bf0 <mixerengine::BpmQuantizeEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0xcc>

00098c24 <mixerengine::BpmQuantizeEffect::~BpmQuantizeEffect()>:
   98c24:	e59f3004 	ldr	r3, [pc, #4]	@ 98c30 <mixerengine::BpmQuantizeEffect::~BpmQuantizeEffect()+0xc>
   98c28:	e5803000 	str	r3, [r0]
   98c2c:	e12fff1e 	bx	lr
   98c30:	0041db60 	.word	0x0041db60

00098c34 <mixerengine::BpmQuantizeEffect::~BpmQuantizeEffect()>:
   98c34:	e59f3014 	ldr	r3, [pc, #20]	@ 98c50 <mixerengine::BpmQuantizeEffect::~BpmQuantizeEffect()+0x1c>
   98c38:	e92d4010 	push	{r4, lr}
   98c3c:	e1a04000 	mov	r4, r0
   98c40:	e5803000 	str	r3, [r0]
   98c44:	ebfdd821 	bl	ecd0 <operator delete(void*)@plt>
   98c48:	e1a00004 	mov	r0, r4
   98c4c:	e8bd8010 	pop	{r4, pc}
   98c50:	0041db60 	.word	0x0041db60
   98c54:	00000000 	.word	0x00000000

00098c58 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int) [clone .constprop.21]>:
   98c58:	e92d4030 	push	{r4, r5, lr}
   98c5c:	e24dd00c 	sub	sp, sp, #12
   98c60:	e28d0004 	add	r0, sp, #4
   98c64:	eb0074e8 	bl	b600c <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)>
   98c68:	e3500000 	cmp	r0, #0
   98c6c:	1a000001 	bne	98c78 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int) [clone .constprop.21]+0x20>
   98c70:	e28dd00c 	add	sp, sp, #12
   98c74:	e8bd8030 	pop	{r4, r5, pc}
   98c78:	eb007485 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   98c7c:	e59d1004 	ldr	r1, [sp, #4]
   98c80:	e1a05000 	mov	r5, r0
   98c84:	ebff1331 	bl	5d950 <playengine::PlayEngine::getPlayingPosition(djengine::EnPlayerChannel) const>
   98c88:	e59d1004 	ldr	r1, [sp, #4]
   98c8c:	e3a02000 	mov	r2, #0
   98c90:	e1a04000 	mov	r4, r0
   98c94:	e1a00005 	mov	r0, r5
   98c98:	ebff1421 	bl	5dd24 <playengine::PlayEngine::getTempo(djengine::EnPlayerChannel, bool) const>
   98c9c:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   98ca0:	eddf0b18 	vldr	d16, [pc, #96]	@ 98d08 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int) [clone .constprop.21]+0xb0>
   98ca4:	ee070a90 	vmov	s15, r0
   98ca8:	ee377a87 	vadd.f32	s14, s15, s14
   98cac:	eddf7a17 	vldr	s15, [pc, #92]	@ 98d10 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int) [clone .constprop.21]+0xb8>
   98cb0:	ee677a27 	vmul.f32	s15, s14, s15
   98cb4:	eefd7ae7 	vcvt.s32.f32	s15, s15
   98cb8:	ee173a90 	vmov	r3, s15
   98cbc:	e1540003 	cmp	r4, r3
   98cc0:	c0634004 	rsbgt	r4, r3, r4
   98cc4:	ee074a90 	vmov	s15, r4
   98cc8:	eef81be7 	vcvt.f64.s32	d17, s15
   98ccc:	ee610ba0 	vmul.f64	d16, d17, d16
   98cd0:	eef50bc0 	vcmpe.f64	d16, #0.0
   98cd4:	ec510b30 	vmov	r0, r1, d16
   98cd8:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   98cdc:	ba000004 	blt	98cf4 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int) [clone .constprop.21]+0x9c>
   98ce0:	ebfdd812 	bl	ed30 <ceil@plt>
   98ce4:	ec410b30 	vmov	d16, r0, r1
   98ce8:	eefd7be0 	vcvt.s32.f64	s15, d16
   98cec:	ee170a90 	vmov	r0, s15
   98cf0:	eaffffde 	b	98c70 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int) [clone .constprop.21]+0x18>
   98cf4:	ebfddadd 	bl	f870 <floor@plt>
   98cf8:	ec410b30 	vmov	d16, r0, r1
   98cfc:	eefd7be0 	vcvt.s32.f64	s15, d16
   98d00:	ee170a90 	vmov	r0, s15
   98d04:	eaffffd9 	b	98c70 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int) [clone .constprop.21]+0x18>
   98d08:	f2a605ce 	.word	0xf2a605ce
   98d0c:	3f97384e 	.word	0x3f97384e
   98d10:	00000000 	.word	0x00000000

00098d14 <mixerengine::QuantizedBeatEffect::changeEffectStatus()>:
   98d14:	e92d4070 	push	{r4, r5, r6, lr}
   98d18:	e1a04000 	mov	r4, r0
   98d1c:	e5d0503c 	ldrb	r5, [r0, #60]	@ 0x3c
   98d20:	e5903000 	ldr	r3, [r0]
   98d24:	e3550000 	cmp	r5, #0
   98d28:	1a00000b 	bne	98d5c <mixerengine::QuantizedBeatEffect::changeEffectStatus()+0x48>
   98d2c:	e5933024 	ldr	r3, [r3, #36]	@ 0x24
   98d30:	e3a06001 	mov	r6, #1
   98d34:	e12fff33 	blx	r3
   98d38:	e5c4603c 	strb	r6, [r4, #60]	@ 0x3c
   98d3c:	eb007483 	bl	b5f50 <mixerengine::BeatEffect::getMixerEngine()>
   98d40:	ebfef975 	bl	5731c <mixerengine::MixerEngine::isBeatEffectQuantizeOn() const>
   98d44:	e5c45060 	strb	r5, [r4, #96]	@ 0x60
   98d48:	e5c4505d 	strb	r5, [r4, #93]	@ 0x5d
   98d4c:	e5845058 	str	r5, [r4, #88]	@ 0x58
   98d50:	e5c4605e 	strb	r6, [r4, #94]	@ 0x5e
   98d54:	e5c40061 	strb	r0, [r4, #97]	@ 0x61
   98d58:	e8bd8070 	pop	{r4, r5, r6, pc}
   98d5c:	e5933020 	ldr	r3, [r3, #32]
   98d60:	e12fff33 	blx	r3
   98d64:	e3a03000 	mov	r3, #0
   98d68:	e5c4303c 	strb	r3, [r4, #60]	@ 0x3c
   98d6c:	e8bd8070 	pop	{r4, r5, r6, pc}

00098d70 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]>:
   98d70:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   98d74:	e24dd008 	sub	sp, sp, #8
   98d78:	e1a05000 	mov	r5, r0
   98d7c:	e1a07001 	mov	r7, r1
   98d80:	e1a0000d 	mov	r0, sp
   98d84:	e1a06002 	mov	r6, r2
   98d88:	eb00749f 	bl	b600c <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)>
   98d8c:	e2504000 	subs	r4, r0, #0
   98d90:	0a000036 	beq	98e70 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x100>
   98d94:	eb00743e 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   98d98:	e59d1000 	ldr	r1, [sp]
   98d9c:	ebff1a06 	bl	5f5bc <playengine::PlayEngine::getBeatPosInfo(djengine::EnPlayerChannel) const>
   98da0:	e2504000 	subs	r4, r0, #0
   98da4:	0a000031 	beq	98e70 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x100>
   98da8:	e5962000 	ldr	r2, [r6]
   98dac:	e5943038 	ldr	r3, [r4, #56]	@ 0x38
   98db0:	e2822008 	add	r2, r2, #8
   98db4:	e59d8000 	ldr	r8, [sp]
   98db8:	e1520003 	cmp	r2, r3
   98dbc:	0a00002a 	beq	98e6c <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0xfc>
   98dc0:	eb007433 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   98dc4:	e3a02001 	mov	r2, #1
   98dc8:	e1a01008 	mov	r1, r8
   98dcc:	ebff13d4 	bl	5dd24 <playengine::PlayEngine::getTempo(djengine::EnPlayerChannel, bool) const>
   98dd0:	e5963000 	ldr	r3, [r6]
   98dd4:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   98dd8:	e1d320b2 	ldrh	r2, [r3, #2]
   98ddc:	ee062a10 	vmov	s12, r2
   98de0:	eef87a46 	vcvt.f32.u32	s15, s12
   98de4:	eefc7ae7 	vcvt.u32.f32	s15, s15
   98de8:	eef86a67 	vcvt.f32.u32	s13, s15
   98dec:	ee060a10 	vmov	s12, r0
   98df0:	ee367a07 	vadd.f32	s14, s12, s14
   98df4:	ee276a26 	vmul.f32	s12, s14, s13
   98df8:	eebc6ac6 	vcvt.u32.f32	s12, s12
   98dfc:	ee162a10 	vmov	r2, s12
   98e00:	e3520efa 	cmp	r2, #4000	@ 0xfa0
   98e04:	2a000005 	bcs	98e20 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0xb0>
   98e08:	ee172a90 	vmov	r2, s15
   98e0c:	e3520000 	cmp	r2, #0
   98e10:	0e174a90 	vmoveq	r4, s15
   98e14:	0a000015 	beq	98e70 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x100>
   98e18:	eddf7a5e 	vldr	s15, [pc, #376]	@ 98f98 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x228>
   98e1c:	ee877aa6 	vdiv.f32	s14, s15, s13
   98e20:	e5951044 	ldr	r1, [r5, #68]	@ 0x44
   98e24:	e59f2170 	ldr	r2, [pc, #368]	@ 98f9c <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x22c>
   98e28:	e0821101 	add	r1, r2, r1, lsl #2
   98e2c:	e5916058 	ldr	r6, [r1, #88]	@ 0x58
   98e30:	e2162001 	ands	r2, r6, #1
   98e34:	0a000010 	beq	98e7c <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x10c>
   98e38:	e5911088 	ldr	r1, [r1, #136]	@ 0x88
   98e3c:	e5856068 	str	r6, [r5, #104]	@ 0x68
   98e40:	e3510000 	cmp	r1, #0
   98e44:	0a00001a 	beq	98eb4 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x144>
   98e48:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   98e4c:	e3a02000 	mov	r2, #0
   98e50:	ea000001 	b	98e5c <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0xec>
   98e54:	e1520001 	cmp	r2, r1
   98e58:	0a000015 	beq	98eb4 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x144>
   98e5c:	e2833008 	add	r3, r3, #8
   98e60:	e2822001 	add	r2, r2, #1
   98e64:	e1530000 	cmp	r3, r0
   98e68:	1afffff9 	bne	98e54 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0xe4>
   98e6c:	e3a04000 	mov	r4, #0
   98e70:	e1a00004 	mov	r0, r4
   98e74:	e28dd008 	add	sp, sp, #8
   98e78:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
   98e7c:	e5910088 	ldr	r0, [r1, #136]	@ 0x88
   98e80:	e1a060a6 	lsr	r6, r6, #1
   98e84:	e5941038 	ldr	r1, [r4, #56]	@ 0x38
   98e88:	e5856068 	str	r6, [r5, #104]	@ 0x68
   98e8c:	e1b000a0 	lsrs	r0, r0, #1
   98e90:	1a000002 	bne	98ea0 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x130>
   98e94:	ea000028 	b	98f3c <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x1cc>
   98e98:	e1520000 	cmp	r2, r0
   98e9c:	0a000026 	beq	98f3c <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x1cc>
   98ea0:	e2833008 	add	r3, r3, #8
   98ea4:	e2822001 	add	r2, r2, #1
   98ea8:	e1530001 	cmp	r3, r1
   98eac:	1afffff9 	bne	98e98 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x128>
   98eb0:	eaffffed 	b	98e6c <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0xfc>
   98eb4:	e5942024 	ldr	r2, [r4, #36]	@ 0x24
   98eb8:	e3520000 	cmp	r2, #0
   98ebc:	15940028 	ldrne	r0, [r4, #40]	@ 0x28
   98ec0:	01a00002 	moveq	r0, r2
   98ec4:	1593100c 	ldrne	r1, [r3, #12]
   98ec8:	15932004 	ldrne	r2, [r3, #4]
   98ecc:	10822000 	addne	r2, r2, r0
   98ed0:	10810000 	addne	r0, r1, r0
   98ed4:	e5d51060 	ldrb	r1, [r5, #96]	@ 0x60
   98ed8:	e3510000 	cmp	r1, #0
   98edc:	0a000006 	beq	98efc <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x18c>
   98ee0:	e5941038 	ldr	r1, [r4, #56]	@ 0x38
   98ee4:	e2833008 	add	r3, r3, #8
   98ee8:	e1530001 	cmp	r3, r1
   98eec:	0affffde 	beq	98e6c <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0xfc>
   98ef0:	e0620000 	rsb	r0, r2, r0
   98ef4:	e0800fa0 	add	r0, r0, r0, lsr #31
   98ef8:	e08220c0 	add	r2, r2, r0, asr #1
   98efc:	e1570002 	cmp	r7, r2
   98f00:	aaffffd9 	bge	98e6c <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0xfc>
   98f04:	e0672002 	rsb	r2, r7, r2
   98f08:	ee062a10 	vmov	s12, r2
   98f0c:	eef87ac6 	vcvt.f32.s32	s15, s12
   98f10:	e1a01006 	mov	r1, r6
   98f14:	eec77a87 	vdiv.f32	s15, s15, s14
   98f18:	eefd7ae7 	vcvt.s32.f32	s15, s15
   98f1c:	ee170a90 	vmov	r0, s15
   98f20:	ebfdd8c9 	bl	f24c <__aeabi_uidiv@plt>
   98f24:	e1a01006 	mov	r1, r6
   98f28:	e1a04000 	mov	r4, r0
   98f2c:	ebfdd5d8 	bl	e694 <__aeabi_uidivmod@plt>
   98f30:	e3510000 	cmp	r1, #0
   98f34:	12844001 	addne	r4, r4, #1
   98f38:	eaffffcc 	b	98e70 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x100>
   98f3c:	e5942024 	ldr	r2, [r4, #36]	@ 0x24
   98f40:	e3520000 	cmp	r2, #0
   98f44:	15940028 	ldrne	r0, [r4, #40]	@ 0x28
   98f48:	01a0c002 	moveq	ip, r2
   98f4c:	1593c004 	ldrne	ip, [r3, #4]
   98f50:	01a0200c 	moveq	r2, ip
   98f54:	1593200c 	ldrne	r2, [r3, #12]
   98f58:	e2833008 	add	r3, r3, #8
   98f5c:	e5d5405f 	ldrb	r4, [r5, #95]	@ 0x5f
   98f60:	108cc000 	addne	ip, ip, r0
   98f64:	10822000 	addne	r2, r2, r0
   98f68:	e3540000 	cmp	r4, #0
   98f6c:	1a000005 	bne	98f88 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x218>
   98f70:	e1530001 	cmp	r3, r1
   98f74:	0affffbd 	beq	98e70 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x100>
   98f78:	e06c2002 	rsb	r2, ip, r2
   98f7c:	e0822fa2 	add	r2, r2, r2, lsr #31
   98f80:	e08c20c2 	add	r2, ip, r2, asr #1
   98f84:	eaffffdc 	b	98efc <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x18c>
   98f88:	e1530001 	cmp	r3, r1
   98f8c:	1affffda 	bne	98efc <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x18c>
   98f90:	e3a04000 	mov	r4, #0
   98f94:	eaffffb5 	b	98e70 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]+0x100>
   98f98:	457a0000 	.word	0x457a0000
   98f9c:	0041ff88 	.word	0x0041ff88

00098fa0 <mixerengine::QuantizedBeatEffect::checkQuantizeSetting()>:
   98fa0:	e92d4030 	push	{r4, r5, lr}
   98fa4:	e24dd00c 	sub	sp, sp, #12
   98fa8:	e1a04000 	mov	r4, r0
   98fac:	e28d0004 	add	r0, sp, #4
   98fb0:	eb007415 	bl	b600c <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)>
   98fb4:	e3500000 	cmp	r0, #0
   98fb8:	0a000018 	beq	99020 <mixerengine::QuantizedBeatEffect::checkQuantizeSetting()+0x80>
   98fbc:	eb0073b4 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   98fc0:	e59d1004 	ldr	r1, [sp, #4]
   98fc4:	ebff197c 	bl	5f5bc <playengine::PlayEngine::getBeatPosInfo(djengine::EnPlayerChannel) const>
   98fc8:	e1a05000 	mov	r5, r0
   98fcc:	eb0073df 	bl	b5f50 <mixerengine::BeatEffect::getMixerEngine()>
   98fd0:	ebfef8d1 	bl	5731c <mixerengine::MixerEngine::isBeatEffectQuantizeOn() const>
   98fd4:	e3550000 	cmp	r5, #0
   98fd8:	e5c40061 	strb	r0, [r4, #97]	@ 0x61
   98fdc:	0a000002 	beq	98fec <mixerengine::QuantizedBeatEffect::checkQuantizeSetting()+0x4c>
   98fe0:	e3500000 	cmp	r0, #0
   98fe4:	13a02001 	movne	r2, #1
   98fe8:	1a000009 	bne	99014 <mixerengine::QuantizedBeatEffect::checkQuantizeSetting()+0x74>
   98fec:	eb0073d7 	bl	b5f50 <mixerengine::BeatEffect::getMixerEngine()>
   98ff0:	ebfef8c9 	bl	5731c <mixerengine::MixerEngine::isBeatEffectQuantizeOn() const>
   98ff4:	e3a03000 	mov	r3, #0
   98ff8:	e1a02003 	mov	r2, r3
   98ffc:	e5c43060 	strb	r3, [r4, #96]	@ 0x60
   99000:	e5c4305d 	strb	r3, [r4, #93]	@ 0x5d
   99004:	e5843058 	str	r3, [r4, #88]	@ 0x58
   99008:	e3a03001 	mov	r3, #1
   9900c:	e5c4305e 	strb	r3, [r4, #94]	@ 0x5e
   99010:	e5c40061 	strb	r0, [r4, #97]	@ 0x61
   99014:	e1a00002 	mov	r0, r2
   99018:	e28dd00c 	add	sp, sp, #12
   9901c:	e8bd8030 	pop	{r4, r5, pc}
   99020:	eb0073ca 	bl	b5f50 <mixerengine::BeatEffect::getMixerEngine()>
   99024:	ebfef8bc 	bl	5731c <mixerengine::MixerEngine::isBeatEffectQuantizeOn() const>
   99028:	e5c40061 	strb	r0, [r4, #97]	@ 0x61
   9902c:	eaffffee 	b	98fec <mixerengine::QuantizedBeatEffect::checkQuantizeSetting()+0x4c>

00099030 <mixerengine::QuantizedBeatEffect::initQuantizeSetting()>:
   99030:	e92d4010 	push	{r4, lr}
   99034:	e1a04000 	mov	r4, r0
   99038:	eb0073c4 	bl	b5f50 <mixerengine::BeatEffect::getMixerEngine()>
   9903c:	ebfef8b6 	bl	5731c <mixerengine::MixerEngine::isBeatEffectQuantizeOn() const>
   99040:	e3a03000 	mov	r3, #0
   99044:	e5c43060 	strb	r3, [r4, #96]	@ 0x60
   99048:	e5c4305d 	strb	r3, [r4, #93]	@ 0x5d
   9904c:	e5843058 	str	r3, [r4, #88]	@ 0x58
   99050:	e3a03001 	mov	r3, #1
   99054:	e5c4305e 	strb	r3, [r4, #94]	@ 0x5e
   99058:	e5c40061 	strb	r0, [r4, #97]	@ 0x61
   9905c:	e8bd8010 	pop	{r4, pc}

00099060 <mixerengine::QuantizedBeatEffect::checkBeatPosition(djengine::EnPlayerChannel*)>:
   99060:	e92d4010 	push	{r4, lr}
   99064:	e24dd008 	sub	sp, sp, #8
   99068:	e1a04000 	mov	r4, r0
   9906c:	e1a0000d 	mov	r0, sp
   99070:	eb0073e5 	bl	b600c <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)>
   99074:	e3500000 	cmp	r0, #0
   99078:	0a000007 	beq	9909c <mixerengine::QuantizedBeatEffect::checkBeatPosition(djengine::EnPlayerChannel*)+0x3c>
   9907c:	eb007384 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   99080:	e59d1000 	ldr	r1, [sp]
   99084:	ebff194c 	bl	5f5bc <playengine::PlayEngine::getBeatPosInfo(djengine::EnPlayerChannel) const>
   99088:	e3500000 	cmp	r0, #0
   9908c:	0a000002 	beq	9909c <mixerengine::QuantizedBeatEffect::checkBeatPosition(djengine::EnPlayerChannel*)+0x3c>
   99090:	e3540000 	cmp	r4, #0
   99094:	159d3000 	ldrne	r3, [sp]
   99098:	15843000 	strne	r3, [r4]
   9909c:	e28dd008 	add	sp, sp, #8
   990a0:	e8bd8010 	pop	{r4, pc}

000990a4 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int)>:
   990a4:	e92d4070 	push	{r4, r5, r6, lr}
   990a8:	e24dd008 	sub	sp, sp, #8
   990ac:	e28d0004 	add	r0, sp, #4
   990b0:	e1a05001 	mov	r5, r1
   990b4:	eb0073d4 	bl	b600c <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)>
   990b8:	e3500000 	cmp	r0, #0
   990bc:	1a000001 	bne	990c8 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int)+0x24>
   990c0:	e28dd008 	add	sp, sp, #8
   990c4:	e8bd8070 	pop	{r4, r5, r6, pc}
   990c8:	eb007371 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   990cc:	e59d1004 	ldr	r1, [sp, #4]
   990d0:	e1a06000 	mov	r6, r0
   990d4:	ebff121d 	bl	5d950 <playengine::PlayEngine::getPlayingPosition(djengine::EnPlayerChannel) const>
   990d8:	e59d1004 	ldr	r1, [sp, #4]
   990dc:	e3a02000 	mov	r2, #0
   990e0:	e1a04000 	mov	r4, r0
   990e4:	e1a00006 	mov	r0, r6
   990e8:	ebff130d 	bl	5dd24 <playengine::PlayEngine::getTempo(djengine::EnPlayerChannel, bool) const>
   990ec:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   990f0:	ee065a90 	vmov	s13, r5
   990f4:	eddf0b19 	vldr	d16, [pc, #100]	@ 99160 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int)+0xbc>
   990f8:	eeb87ae6 	vcvt.f32.s32	s14, s13
   990fc:	ee060a90 	vmov	s13, r0
