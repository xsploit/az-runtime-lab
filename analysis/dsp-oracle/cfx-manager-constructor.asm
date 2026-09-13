
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000bb970 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)>:
   bb970:	e92d40f0 	push	{r4, r5, r6, r7, lr}
   bb974:	ed2d8b04 	vpush	{d8-d9}
   bb978:	e24dd00c 	sub	sp, sp, #12
   bb97c:	ed9f9b81 	vldr	d9, [pc, #516]	@ bbb88 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)+0x218>
   bb980:	e1a04000 	mov	r4, r0
   bb984:	e3a05000 	mov	r5, #0
   bb988:	e1a07001 	mov	r7, r1
   bb98c:	e5805020 	str	r5, [r0, #32]
   bb990:	e59f1200 	ldr	r1, [pc, #512]	@ bbb98 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)+0x228>
   bb994:	e1a0000d 	mov	r0, sp
   bb998:	e5845024 	str	r5, [r4, #36]	@ 0x24
   bb99c:	eef78a00 	vmov.f32	s17, #112	@ 0x3f800000  1.0
   bb9a0:	e5845028 	str	r5, [r4, #40]	@ 0x28
   bb9a4:	e584502c 	str	r5, [r4, #44]	@ 0x2c
   bb9a8:	eb0bd5f6 	bl	3b1188 <juce::String::String(char const*)>
   bb9ac:	e59f21e8 	ldr	r2, [pc, #488]	@ bbb9c <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)+0x22c>
   bb9b0:	eddf7a76 	vldr	s15, [pc, #472]	@ bbb90 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)+0x220>
   bb9b4:	e5845048 	str	r5, [r4, #72]	@ 0x48
   bb9b8:	e3a03001 	mov	r3, #1
   bb9bc:	eddf0b71 	vldr	d16, [pc, #452]	@ bbb88 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)+0x218>
   bb9c0:	e5926000 	ldr	r6, [r2]
   bb9c4:	ee076a10 	vmov	s14, r6
   bb9c8:	edc40b0c 	vstr	d16, [r4, #48]	@ 0x30
   bb9cc:	edc40b0e 	vstr	d16, [r4, #56]	@ 0x38
   bb9d0:	edc40b10 	vstr	d16, [r4, #64]	@ 0x40
   bb9d4:	e5c43054 	strb	r3, [r4, #84]	@ 0x54
   bb9d8:	f2c70f10 	vmov.f32	d16, #1	@ 0x3f800000
   bb9dc:	ed849b0c 	vstr	d9, [r4, #48]	@ 0x30
   bb9e0:	eeb88a47 	vcvt.f32.u32	s16, s14
   bb9e4:	edc40b10 	vstr	d16, [r4, #64]	@ 0x40
   bb9e8:	edc40b0e 	vstr	d16, [r4, #56]	@ 0x38
   bb9ec:	e1a0000d 	mov	r0, sp
   bb9f0:	ee287a27 	vmul.f32	s14, s16, s15
   bb9f4:	eddf7a66 	vldr	s15, [pc, #408]	@ bbb94 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)+0x224>
   bb9f8:	eec77a27 	vdiv.f32	s15, s14, s15
   bb9fc:	eefc7ae7 	vcvt.u32.f32	s15, s15
   bba00:	ee175a90 	vmov	r5, s15
   bba04:	e3550000 	cmp	r5, #0
   bba08:	edc47a13 	vstr	s15, [r4, #76]	@ 0x4c
   bba0c:	0584304c 	streq	r3, [r4, #76]	@ 0x4c
   bba10:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   bba14:	1ef87a67 	vcvtne.f32.u32	s15, s15
   bba18:	1ec77a27 	vdivne.f32	s15, s14, s15
   bba1c:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   bba20:	edc47a14 	vstr	s15, [r4, #80]	@ 0x50
   bba24:	eb0bd4d1 	bl	3b0d70 <juce::String::~String()>
   bba28:	e59f1170 	ldr	r1, [pc, #368]	@ bbba0 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)+0x230>
   bba2c:	e28d0004 	add	r0, sp, #4
   bba30:	eb0bd5d4 	bl	3b1188 <juce::String::String(char const*)>
   bba34:	e3550000 	cmp	r5, #0
   bba38:	1e075a10 	vmovne	s14, r5
   bba3c:	eddf0b51 	vldr	d16, [pc, #324]	@ bbb88 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)+0x218>
   bba40:	e3a03001 	mov	r3, #1
   bba44:	e3a02000 	mov	r2, #0
   bba48:	e5c4307c 	strb	r3, [r4, #124]	@ 0x7c
   bba4c:	ed849b16 	vstr	d9, [r4, #88]	@ 0x58
   bba50:	e5842070 	str	r2, [r4, #112]	@ 0x70
   bba54:	edc40b16 	vstr	d16, [r4, #88]	@ 0x58
   bba58:	e5845074 	str	r5, [r4, #116]	@ 0x74
   bba5c:	ed849b18 	vstr	d9, [r4, #96]	@ 0x60
   bba60:	05843074 	streq	r3, [r4, #116]	@ 0x74
   bba64:	edc40b18 	vstr	d16, [r4, #96]	@ 0x60
   bba68:	ed849b1a 	vstr	d9, [r4, #104]	@ 0x68
   bba6c:	e28d0004 	add	r0, sp, #4
   bba70:	edc40b1a 	vstr	d16, [r4, #104]	@ 0x68
   bba74:	e3a05000 	mov	r5, #0
   bba78:	1ef87a47 	vcvtne.f32.u32	s15, s14
   bba7c:	1ec88aa7 	vdivne.f32	s17, s17, s15
   bba80:	edc48a1e 	vstr	s17, [r4, #120]	@ 0x78
   bba84:	eb0bd4b9 	bl	3b0d70 <juce::String::~String()>
   bba88:	e5845080 	str	r5, [r4, #128]	@ 0x80
   bba8c:	e5847084 	str	r7, [r4, #132]	@ 0x84
   bba90:	e3a00024 	mov	r0, #36	@ 0x24
   bba94:	ebfd4a23 	bl	e328 <operator new(unsigned int)@plt>
   bba98:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   bba9c:	f2c60f10 	vmov.f32	d16, #0.5	@ 0x3f000000
   bbaa0:	e3a02001 	mov	r2, #1
   bbaa4:	eec77a88 	vdiv.f32	s15, s15, s16
   bbaa8:	e1a03000 	mov	r3, r0
   bbaac:	e5805010 	str	r5, [r0, #16]
   bbab0:	e5806004 	str	r6, [r0, #4]
   bbab4:	e5806008 	str	r6, [r0, #8]
   bbab8:	e3a00058 	mov	r0, #88	@ 0x58
   bbabc:	e5832018 	str	r2, [r3, #24]
   bbac0:	e283201c 	add	r2, r3, #28
   bbac4:	e5835014 	str	r5, [r3, #20]
   bbac8:	f442078f 	vst1.32	{d16}, [r2]
   bbacc:	e59f20d0 	ldr	r2, [pc, #208]	@ bbba4 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)+0x234>
   bbad0:	e5832000 	str	r2, [r3]
   bbad4:	edc37a03 	vstr	s15, [r3, #12]
   bbad8:	e5843004 	str	r3, [r4, #4]
   bbadc:	ebfd4a11 	bl	e328 <operator new(unsigned int)@plt>
   bbae0:	e1a05000 	mov	r5, r0
   bbae4:	eb004965 	bl	ce080 <mixerengine::SoundColorFxFilter::SoundColorFxFilter()>
   bbae8:	e5845008 	str	r5, [r4, #8]
   bbaec:	e3a00070 	mov	r0, #112	@ 0x70
   bbaf0:	ebfd4a0c 	bl	e328 <operator new(unsigned int)@plt>
   bbaf4:	e1a05000 	mov	r5, r0
   bbaf8:	eb000390 	bl	bc940 <mixerengine::SoundColorFxNoise::SoundColorFxNoise()>
   bbafc:	e584500c 	str	r5, [r4, #12]
   bbb00:	e3a00f43 	mov	r0, #268	@ 0x10c
   bbb04:	ebfd4a07 	bl	e328 <operator new(unsigned int)@plt>
   bbb08:	e1a05000 	mov	r5, r0
   bbb0c:	eb000cd1 	bl	bee58 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()>
   bbb10:	e5845010 	str	r5, [r4, #16]
   bbb14:	e3a000b0 	mov	r0, #176	@ 0xb0
   bbb18:	ebfd4a02 	bl	e328 <operator new(unsigned int)@plt>
   bbb1c:	e1a05000 	mov	r5, r0
   bbb20:	eb0047c9 	bl	cda4c <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()>
   bbb24:	e5845014 	str	r5, [r4, #20]
   bbb28:	e3a000b0 	mov	r0, #176	@ 0xb0
   bbb2c:	ebfd49fd 	bl	e328 <operator new(unsigned int)@plt>
   bbb30:	e1a05000 	mov	r5, r0
   bbb34:	eb000bbb 	bl	bea28 <mixerengine::SoundColorFxSpace::SoundColorFxSpace()>
   bbb38:	e5845018 	str	r5, [r4, #24]
   bbb3c:	e3a00098 	mov	r0, #152	@ 0x98
   bbb40:	ebfd49f8 	bl	e328 <operator new(unsigned int)@plt>
   bbb44:	e1a05000 	mov	r5, r0
   bbb48:	eb0040c6 	bl	cbe68 <mixerengine::SoundColorFxCrush::SoundColorFxCrush()>
   bbb4c:	e5943004 	ldr	r3, [r4, #4]
   bbb50:	e1a00004 	mov	r0, r4
   bbb54:	e584501c 	str	r5, [r4, #28]
   bbb58:	e5843000 	str	r3, [r4]
   bbb5c:	e28dd00c 	add	sp, sp, #12
   bbb60:	ecbd8b04 	vpop	{d8-d9}
   bbb64:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
   bbb68:	e1a00005 	mov	r0, r5
   bbb6c:	ebfd4c57 	bl	ecd0 <operator delete(void*)@plt>
   bbb70:	ebfd4cd1 	bl	eebc <__cxa_end_cleanup@plt>
   bbb74:	eafffffb 	b	bbb68 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)+0x1f8>
   bbb78:	eafffffa 	b	bbb68 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)+0x1f8>
   bbb7c:	eafffff9 	b	bbb68 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)+0x1f8>
   bbb80:	eafffff8 	b	bbb68 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)+0x1f8>
   bbb84:	eafffff7 	b	bbb68 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)+0x1f8>
	...
   bbb90:	408b3333 	.word	0x408b3333
   bbb94:	447a0000 	.word	0x447a0000
   bbb98:	0042d0f4 	.word	0x0042d0f4
   bbb9c:	004172c0 	.word	0x004172c0
   bbba0:	0042d108 	.word	0x0042d108
   bbba4:	0042d1a8 	.word	0x0042d1a8
