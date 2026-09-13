
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000cc7d8 <mixerengine::SoundColorFxDubecho::changeColorValue()>:
   cc7d8:	ed907a07 	vldr	s14, [r0, #28]
   cc7dc:	eddf7a05 	vldr	s15, [pc, #20]	@ cc7f8 <mixerengine::SoundColorFxDubecho::changeColorValue()+0x20>
   cc7e0:	ee677a27 	vmul.f32	s15, s14, s15
   cc7e4:	eefd7ae7 	vcvt.s32.f32	s15, s15
   cc7e8:	ee173a90 	vmov	r3, s15
   cc7ec:	e1a03143 	asr	r3, r3, #2
   cc7f0:	e58030ac 	str	r3, [r0, #172]	@ 0xac
   cc7f4:	e12fff1e 	bx	lr
   cc7f8:	447fc000 	.word	0x447fc000

000cc7fc <mixerengine::SoundColorFxDubecho::changeCfxStatus_On()>:
   cc7fc:	e5903024 	ldr	r3, [r0, #36]	@ 0x24
   cc800:	e3530003 	cmp	r3, #3
   cc804:	03a03002 	moveq	r3, #2
   cc808:	05803024 	streq	r3, [r0, #36]	@ 0x24
   cc80c:	e3a00001 	mov	r0, #1
   cc810:	e12fff1e 	bx	lr

000cc814 <mixerengine::SoundColorFxDubecho::changeCfxStatus_Off()>:
   cc814:	e5902024 	ldr	r2, [r0, #36]	@ 0x24
   cc818:	e1a03000 	mov	r3, r0
   cc81c:	e3520002 	cmp	r2, #2
   cc820:	13a02000 	movne	r2, #0
   cc824:	03a02003 	moveq	r2, #3
   cc828:	13a00000 	movne	r0, #0
   cc82c:	03a00001 	moveq	r0, #1
   cc830:	e5832024 	str	r2, [r3, #36]	@ 0x24
   cc834:	e12fff1e 	bx	lr

000cc838 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()>:
   cc838:	e92d4038 	push	{r3, r4, r5, lr}
   cc83c:	e1a04000 	mov	r4, r0
   cc840:	e5905050 	ldr	r5, [r0, #80]	@ 0x50
   cc844:	e59f3110 	ldr	r3, [pc, #272]	@ cc95c <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0x124>
   cc848:	e3550000 	cmp	r5, #0
   cc84c:	e5803000 	str	r3, [r0]
   cc850:	0a000003 	beq	cc864 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0x2c>
   cc854:	e1a00005 	mov	r0, r5
   cc858:	ebff3dff 	bl	9c05c <mixerengine::DelayUnit::~DelayUnit()>
   cc85c:	e1a00005 	mov	r0, r5
   cc860:	ebfd091a 	bl	ecd0 <operator delete(void*)@plt>
   cc864:	e5945054 	ldr	r5, [r4, #84]	@ 0x54
   cc868:	e3550000 	cmp	r5, #0
   cc86c:	0a000003 	beq	cc880 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0x48>
   cc870:	e1a00005 	mov	r0, r5
   cc874:	ebff3df8 	bl	9c05c <mixerengine::DelayUnit::~DelayUnit()>
   cc878:	e1a00005 	mov	r0, r5
   cc87c:	ebfd0913 	bl	ecd0 <operator delete(void*)@plt>
   cc880:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   cc884:	e3500000 	cmp	r0, #0
   cc888:	0a000002 	beq	cc898 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0x60>
   cc88c:	e5903000 	ldr	r3, [r0]
   cc890:	e5933004 	ldr	r3, [r3, #4]
   cc894:	e12fff33 	blx	r3
   cc898:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   cc89c:	e3500000 	cmp	r0, #0
   cc8a0:	0a000002 	beq	cc8b0 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0x78>
   cc8a4:	e5903000 	ldr	r3, [r0]
   cc8a8:	e5933004 	ldr	r3, [r3, #4]
   cc8ac:	e12fff33 	blx	r3
   cc8b0:	e5940030 	ldr	r0, [r4, #48]	@ 0x30
   cc8b4:	e3500000 	cmp	r0, #0
   cc8b8:	0a000002 	beq	cc8c8 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0x90>
   cc8bc:	e5903000 	ldr	r3, [r0]
   cc8c0:	e5933004 	ldr	r3, [r3, #4]
   cc8c4:	e12fff33 	blx	r3
   cc8c8:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   cc8cc:	e3500000 	cmp	r0, #0
   cc8d0:	0a000002 	beq	cc8e0 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0xa8>
   cc8d4:	e5903000 	ldr	r3, [r0]
   cc8d8:	e5933004 	ldr	r3, [r3, #4]
   cc8dc:	e12fff33 	blx	r3
   cc8e0:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   cc8e4:	e3500000 	cmp	r0, #0
   cc8e8:	0a000000 	beq	cc8f0 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0xb8>
   cc8ec:	ebfd09de 	bl	f06c <operator delete[](void*)@plt>
   cc8f0:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   cc8f4:	e3500000 	cmp	r0, #0
   cc8f8:	0a000000 	beq	cc900 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0xc8>
   cc8fc:	ebfd09da 	bl	f06c <operator delete[](void*)@plt>
   cc900:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   cc904:	e3500000 	cmp	r0, #0
   cc908:	0a000000 	beq	cc910 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0xd8>
   cc90c:	ebfd09d6 	bl	f06c <operator delete[](void*)@plt>
   cc910:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   cc914:	e3500000 	cmp	r0, #0
   cc918:	0a000000 	beq	cc920 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0xe8>
   cc91c:	ebfd09d2 	bl	f06c <operator delete[](void*)@plt>
   cc920:	e5940048 	ldr	r0, [r4, #72]	@ 0x48
   cc924:	e3500000 	cmp	r0, #0
   cc928:	0a000000 	beq	cc930 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0xf8>
   cc92c:	ebfd09ce 	bl	f06c <operator delete[](void*)@plt>
   cc930:	e594004c 	ldr	r0, [r4, #76]	@ 0x4c
   cc934:	e3500000 	cmp	r0, #0
   cc938:	0a000000 	beq	cc940 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0x108>
   cc93c:	ebfd09ca 	bl	f06c <operator delete[](void*)@plt>
   cc940:	e59f3018 	ldr	r3, [pc, #24]	@ cc960 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0x128>
   cc944:	e1a00004 	mov	r0, r4
   cc948:	e5843000 	str	r3, [r4]
   cc94c:	e8bd8038 	pop	{r3, r4, r5, pc}
   cc950:	e59f3008 	ldr	r3, [pc, #8]	@ cc960 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()+0x128>
   cc954:	e5843000 	str	r3, [r4]
   cc958:	ebfd0957 	bl	eebc <__cxa_end_cleanup@plt>
   cc95c:	0042d8b8 	.word	0x0042d8b8
   cc960:	0041db60 	.word	0x0041db60

000cc964 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()>:
   cc964:	e92d4010 	push	{r4, lr}
   cc968:	e1a04000 	mov	r4, r0
   cc96c:	ebffffb1 	bl	cc838 <mixerengine::SoundColorFxDubecho::~SoundColorFxDubecho()>
   cc970:	e1a00004 	mov	r0, r4
   cc974:	ebfd08d5 	bl	ecd0 <operator delete(void*)@plt>
   cc978:	e1a00004 	mov	r0, r4
   cc97c:	e8bd8010 	pop	{r4, pc}

000cc980 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]>:
   cc980:	e59020ac 	ldr	r2, [r0, #172]	@ 0xac
   cc984:	e59030a8 	ldr	r3, [r0, #168]	@ 0xa8
   cc988:	e1520003 	cmp	r2, r3
   cc98c:	e0632002 	rsb	r2, r3, r2
   cc990:	da000077 	ble	ccb74 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x1f4>
   cc994:	e3530073 	cmp	r3, #115	@ 0x73
   cc998:	da0000a8 	ble	ccc40 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x2c0>
   cc99c:	eddf7ac3 	vldr	s15, [pc, #780]	@ cccb0 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x330>
   cc9a0:	ed907a08 	vldr	s14, [r0, #32]
   cc9a4:	eeb47ae7 	vcmpe.f32	s14, s15
   cc9a8:	e0833002 	add	r3, r3, r2
   cc9ac:	e3a02000 	mov	r2, #0
   cc9b0:	ee063a90 	vmov	s13, r3
   cc9b4:	e58030a8 	str	r3, [r0, #168]	@ 0xa8
   cc9b8:	e5c020a0 	strb	r2, [r0, #160]	@ 0xa0
   cc9bc:	eef87ae6 	vcvt.f32.s32	s15, s13
   cc9c0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cc9c4:	5a00005e 	bpl	ccb44 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x1c4>
   cc9c8:	eddf6ab9 	vldr	s13, [pc, #740]	@ cccb4 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x334>
   cc9cc:	ee277a26 	vmul.f32	s14, s14, s13
   cc9d0:	eddf6ab8 	vldr	s13, [pc, #736]	@ cccb8 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x338>
   cc9d4:	ed9f6ab8 	vldr	s12, [pc, #736]	@ cccbc <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x33c>
   cc9d8:	ee676a26 	vmul.f32	s13, s14, s13
   cc9dc:	ee277a06 	vmul.f32	s14, s14, s12
   cc9e0:	edc06a21 	vstr	s13, [r0, #132]	@ 0x84
   cc9e4:	eef76a00 	vmov.f32	s13, #112	@ 0x3f800000  1.0
   cc9e8:	ed807a24 	vstr	s14, [r0, #144]	@ 0x90
   cc9ec:	ed9f7ab3 	vldr	s14, [pc, #716]	@ cccc0 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x340>
   cc9f0:	eef47ac7 	vcmpe.f32	s15, s14
   cc9f4:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cc9f8:	da000024 	ble	cca90 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x110>
   cc9fc:	ed9f7ab0 	vldr	s14, [pc, #704]	@ cccc4 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x344>
   cca00:	eef47ac7 	vcmpe.f32	s15, s14
   cca04:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cca08:	8a000020 	bhi	cca90 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x110>
   cca0c:	eddf7aad 	vldr	s15, [pc, #692]	@ cccc8 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x348>
   cca10:	ed9f6aad 	vldr	s12, [pc, #692]	@ ccccc <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x34c>
   cca14:	ee066aa7 	vmla.f32	s12, s13, s15
   cca18:	edd05a21 	vldr	s11, [r0, #132]	@ 0x84
   cca1c:	edd06a24 	vldr	s13, [r0, #144]	@ 0x90
   cca20:	e3a02000 	mov	r2, #0
   cca24:	e3a03b26 	mov	r3, #38912	@ 0x9800
   cca28:	e5802074 	str	r2, [r0, #116]	@ 0x74
   cca2c:	e3443517 	movt	r3, #17687	@ 0x4517
   cca30:	e580207c 	str	r2, [r0, #124]	@ 0x7c
   cca34:	ee073a90 	vmov	s15, r3
   cca38:	e580305c 	str	r3, [r0, #92]	@ 0x5c
   cca3c:	e5803064 	str	r3, [r0, #100]	@ 0x64
   cca40:	ee073a10 	vmov	s14, r3
   cca44:	ee655a86 	vmul.f32	s11, s11, s12
   cca48:	ee666a86 	vmul.f32	s13, s13, s12
   cca4c:	edc05a21 	vstr	s11, [r0, #132]	@ 0x84
   cca50:	edc06a24 	vstr	s13, [r0, #144]	@ 0x90
   cca54:	edd06a16 	vldr	s13, [r0, #88]	@ 0x58
   cca58:	eeb47a66 	vcmp.f32	s14, s13
   cca5c:	ed907a18 	vldr	s14, [r0, #96]	@ 0x60
   cca60:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cca64:	eeb47a67 	vcmp.f32	s14, s15
   cca68:	13a03001 	movne	r3, #1
   cca6c:	15c030a1 	strbne	r3, [r0, #161]	@ 0xa1
   cca70:	13a03000 	movne	r3, #0
   cca74:	15803098 	strne	r3, [r0, #152]	@ 0x98
   cca78:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cca7c:	13a03001 	movne	r3, #1
   cca80:	15c030a2 	strbne	r3, [r0, #162]	@ 0xa2
   cca84:	13a03000 	movne	r3, #0
   cca88:	1580309c 	strne	r3, [r0, #156]	@ 0x9c
   cca8c:	e12fff1e 	bx	lr
   cca90:	ed9f7a8a 	vldr	s14, [pc, #552]	@ cccc0 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x340>
   cca94:	eef47ac7 	vcmpe.f32	s15, s14
   cca98:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cca9c:	8a00003b 	bhi	ccb90 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x210>
   ccaa0:	ed9f7a8a 	vldr	s14, [pc, #552]	@ cccd0 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x350>
   ccaa4:	ee675a87 	vmul.f32	s11, s15, s14
   ccaa8:	ed9f5a86 	vldr	s10, [pc, #536]	@ cccc8 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x348>
   ccaac:	ed9f6a86 	vldr	s12, [pc, #536]	@ ccccc <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x34c>
   ccab0:	ed904a24 	vldr	s8, [r0, #144]	@ 0x90
   ccab4:	eddf4a86 	vldr	s9, [pc, #536]	@ cccd4 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x354>
   ccab8:	ed9f7a86 	vldr	s14, [pc, #536]	@ cccd8 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x358>
   ccabc:	e3a03000 	mov	r3, #0
   ccac0:	ed807a19 	vstr	s14, [r0, #100]	@ 0x64
   ccac4:	e580307c 	str	r3, [r0, #124]	@ 0x7c
   ccac8:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   ccacc:	ee755aa5 	vadd.f32	s11, s11, s11
   ccad0:	ee775ae5 	vsub.f32	s11, s15, s11
   ccad4:	ee066a85 	vmla.f32	s12, s13, s10
   ccad8:	ed9f5a7f 	vldr	s10, [pc, #508]	@ cccdc <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x35c>
   ccadc:	ee255a85 	vmul.f32	s10, s11, s10
   ccae0:	ee246a06 	vmul.f32	s12, s8, s12
   ccae4:	eeb45a67 	vcmp.f32	s10, s15
   ccae8:	ed806a24 	vstr	s12, [r0, #144]	@ 0x90
   ccaec:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ccaf0:	eef45ae4 	vcmpe.f32	s11, s9
   ccaf4:	def07a45 	vmovle.f32	s15, s10
   ccaf8:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ccafc:	dd807a17 	vstrle	s14, [r0, #92]	@ 0x5c
   ccb00:	edc07a1d 	vstr	s15, [r0, #116]	@ 0x74
   ccb04:	def07a47 	vmovle.f32	s15, s14
   ccb08:	deb07a67 	vmovle.f32	s14, s15
   ccb0c:	daffffd0 	ble	cca54 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0xd4>
   ccb10:	ee755ae4 	vsub.f32	s11, s11, s9
   ccb14:	ed9f5a71 	vldr	s10, [pc, #452]	@ ccce0 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x360>
   ccb18:	eddf4a71 	vldr	s9, [pc, #452]	@ ccce4 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x364>
   ccb1c:	ed906a21 	vldr	s12, [r0, #132]	@ 0x84
   ccb20:	ee255a85 	vmul.f32	s10, s11, s10
   ccb24:	ee655aa4 	vmul.f32	s11, s11, s9
   ccb28:	ee066aa5 	vmla.f32	s12, s13, s11
   ccb2c:	eef76a04 	vmov.f32	s13, #116	@ 0x3fa00000  1.250
   ccb30:	ed806a21 	vstr	s12, [r0, #132]	@ 0x84
   ccb34:	eef07a47 	vmov.f32	s15, s14
   ccb38:	ee057a26 	vmla.f32	s14, s10, s13
   ccb3c:	ed807a17 	vstr	s14, [r0, #92]	@ 0x5c
   ccb40:	eaffffc3 	b	cca54 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0xd4>
   ccb44:	eddf6a67 	vldr	s13, [pc, #412]	@ ccce8 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x368>
   ccb48:	eeb47ae6 	vcmpe.f32	s14, s13
   ccb4c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ccb50:	5a00003d 	bpl	ccc4c <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x2cc>
   ccb54:	e30b3852 	movw	r3, #47186	@ 0xb852
   ccb58:	eef76a00 	vmov.f32	s13, #112	@ 0x3f800000  1.0
   ccb5c:	e3433f5e 	movt	r3, #16222	@ 0x3f5e
   ccb60:	e5803084 	str	r3, [r0, #132]	@ 0x84
   ccb64:	e30437ae 	movw	r3, #18350	@ 0x47ae
   ccb68:	e3433f61 	movt	r3, #16225	@ 0x3f61
   ccb6c:	e5803090 	str	r3, [r0, #144]	@ 0x90
   ccb70:	eaffff9d 	b	cc9ec <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x6c>
   ccb74:	aaffff88 	bge	cc99c <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x1c>
   ccb78:	e353008b 	cmp	r3, #139	@ 0x8b
   ccb7c:	daffff86 	ble	cc99c <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x1c>
   ccb80:	e3e01001 	mvn	r1, #1
   ccb84:	e1520001 	cmp	r2, r1
   ccb88:	b1a02001 	movlt	r2, r1
   ccb8c:	eaffff82 	b	cc99c <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x1c>
   ccb90:	ed9f7a4b 	vldr	s14, [pc, #300]	@ cccc4 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x344>
   ccb94:	eef47ac7 	vcmpe.f32	s15, s14
   ccb98:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ccb9c:	da00003a 	ble	ccc8c <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x30c>
   ccba0:	ee777ac7 	vsub.f32	s15, s15, s14
   ccba4:	eddf5a49 	vldr	s11, [pc, #292]	@ cccd0 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x350>
   ccba8:	ed9f7a46 	vldr	s14, [pc, #280]	@ cccc8 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x348>
   ccbac:	ed9f6a46 	vldr	s12, [pc, #280]	@ ccccc <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x34c>
   ccbb0:	ed905a21 	vldr	s10, [r0, #132]	@ 0x84
   ccbb4:	e3a03000 	mov	r3, #0
   ccbb8:	e5803074 	str	r3, [r0, #116]	@ 0x74
   ccbbc:	e3a03b26 	mov	r3, #38912	@ 0x9800
   ccbc0:	e3443517 	movt	r3, #17687	@ 0x4517
   ccbc4:	e580305c 	str	r3, [r0, #92]	@ 0x5c
   ccbc8:	ee677aa5 	vmul.f32	s15, s15, s11
   ccbcc:	ee066a87 	vmla.f32	s12, s13, s14
   ccbd0:	ed9f7a41 	vldr	s14, [pc, #260]	@ cccdc <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x35c>
   ccbd4:	ee777aa7 	vadd.f32	s15, s15, s15
   ccbd8:	ee277a87 	vmul.f32	s14, s15, s14
   ccbdc:	eef75a00 	vmov.f32	s11, #112	@ 0x3f800000  1.0
   ccbe0:	ed807a1f 	vstr	s14, [r0, #124]	@ 0x7c
   ccbe4:	ee256a06 	vmul.f32	s12, s10, s12
   ccbe8:	eeb47ae5 	vcmpe.f32	s14, s11
   ccbec:	ed9f7a38 	vldr	s14, [pc, #224]	@ cccd4 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x354>
   ccbf0:	ed806a21 	vstr	s12, [r0, #132]	@ 0x84
   ccbf4:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ccbf8:	eef47ac7 	vcmpe.f32	s15, s14
   ccbfc:	cdc05a1f 	vstrgt	s11, [r0, #124]	@ 0x7c
   ccc00:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ccc04:	da000023 	ble	ccc98 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x318>
   ccc08:	ee775ac7 	vsub.f32	s11, s15, s14
   ccc0c:	ed9f5a36 	vldr	s10, [pc, #216]	@ cccec <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x36c>
   ccc10:	eddf4a33 	vldr	s9, [pc, #204]	@ ccce4 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x364>
   ccc14:	ed906a24 	vldr	s12, [r0, #144]	@ 0x90
   ccc18:	eddf7a2e 	vldr	s15, [pc, #184]	@ cccd8 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x358>
   ccc1c:	ee255a85 	vmul.f32	s10, s11, s10
   ccc20:	ee655aa4 	vmul.f32	s11, s11, s9
   ccc24:	ee066aa5 	vmla.f32	s12, s13, s11
   ccc28:	eef76a04 	vmov.f32	s13, #116	@ 0x3fa00000  1.250
   ccc2c:	ed806a24 	vstr	s12, [r0, #144]	@ 0x90
   ccc30:	eeb07a67 	vmov.f32	s14, s15
   ccc34:	ee457a26 	vmla.f32	s15, s10, s13
   ccc38:	edc07a19 	vstr	s15, [r0, #100]	@ 0x64
   ccc3c:	eaffff84 	b	cca54 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0xd4>
   ccc40:	e3520002 	cmp	r2, #2
   ccc44:	a3a02002 	movge	r2, #2
   ccc48:	eaffff53 	b	cc99c <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x1c>
   ccc4c:	ed9f5a27 	vldr	s10, [pc, #156]	@ cccf0 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x370>
   ccc50:	ee375a45 	vsub.f32	s10, s14, s10
   ccc54:	eddf5a16 	vldr	s11, [pc, #88]	@ cccb4 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x334>
   ccc58:	eddf6a16 	vldr	s13, [pc, #88]	@ cccb8 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x338>
   ccc5c:	ed9f6a16 	vldr	s12, [pc, #88]	@ cccbc <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x33c>
   ccc60:	ee255a25 	vmul.f32	s10, s10, s11
   ccc64:	eef74a00 	vmov.f32	s9, #112	@ 0x3f800000  1.0
   ccc68:	ee347ac7 	vsub.f32	s14, s9, s14
   ccc6c:	eddf4a20 	vldr	s9, [pc, #128]	@ cccf4 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x374>
   ccc70:	ee456a24 	vmla.f32	s13, s10, s9
   ccc74:	eddf4a1f 	vldr	s9, [pc, #124]	@ cccf8 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x378>
   ccc78:	ee056a24 	vmla.f32	s12, s10, s9
   ccc7c:	edc06a21 	vstr	s13, [r0, #132]	@ 0x84
   ccc80:	ed806a24 	vstr	s12, [r0, #144]	@ 0x90
   ccc84:	ee676a25 	vmul.f32	s13, s14, s11
   ccc88:	eaffff57 	b	cc9ec <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0x6c>
   ccc8c:	ed907a17 	vldr	s14, [r0, #92]	@ 0x5c
   ccc90:	edd07a19 	vldr	s15, [r0, #100]	@ 0x64
   ccc94:	eaffff6e 	b	cca54 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0xd4>
   ccc98:	e3a03b26 	mov	r3, #38912	@ 0x9800
   ccc9c:	e3443517 	movt	r3, #17687	@ 0x4517
   ccca0:	ee073a90 	vmov	s15, r3
   ccca4:	e5803064 	str	r3, [r0, #100]	@ 0x64
   ccca8:	ee073a10 	vmov	s14, r3
   cccac:	eaffff68 	b	cca54 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]+0xd4>
   cccb0:	3ee8e8e9 	.word	0x3ee8e8e9
   cccb4:	400cb08d 	.word	0x400cb08d
   cccb8:	3f5eb852 	.word	0x3f5eb852
   cccbc:	3f6147ae 	.word	0x3f6147ae
   cccc0:	42e60000 	.word	0x42e60000
   cccc4:	430b0000 	.word	0x430b0000
   cccc8:	3ca3d70a 	.word	0x3ca3d70a
   ccccc:	3f7ae148 	.word	0x3f7ae148
   cccd0:	3b8d3dcb 	.word	0x3b8d3dcb
   cccd4:	3e4ccccd 	.word	0x3e4ccccd
   cccd8:	45179800 	.word	0x45179800
   cccdc:	40555555 	.word	0x40555555
   ccce0:	45b8ab33 	.word	0x45b8ab33
   ccce4:	3dcccccd 	.word	0x3dcccccd
   ccce8:	3f0c8c8d 	.word	0x3f0c8c8d
   cccec:	4582ec00 	.word	0x4582ec00
   cccf0:	3f0b8b8c 	.word	0x3f0b8b8c
   cccf4:	3df5c290 	.word	0x3df5c290
   cccf8:	3de147b0 	.word	0x3de147b0

000cccfc <mixerengine::SoundColorFxDubecho::initialize()>:
   cccfc:	e92d4038 	push	{r3, r4, r5, lr}
   ccd00:	e1a04000 	mov	r4, r0
   ccd04:	e5900028 	ldr	r0, [r0, #40]	@ 0x28
   ccd08:	e3a05000 	mov	r5, #0
   ccd0c:	e5845024 	str	r5, [r4, #36]	@ 0x24
   ccd10:	e5903000 	ldr	r3, [r0]
   ccd14:	e5933018 	ldr	r3, [r3, #24]
   ccd18:	e12fff33 	blx	r3
   ccd1c:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   ccd20:	e5903000 	ldr	r3, [r0]
   ccd24:	e5933018 	ldr	r3, [r3, #24]
   ccd28:	e12fff33 	blx	r3
   ccd2c:	e5940030 	ldr	r0, [r4, #48]	@ 0x30
   ccd30:	e5903000 	ldr	r3, [r0]
   ccd34:	e5933018 	ldr	r3, [r3, #24]
   ccd38:	e12fff33 	blx	r3
   ccd3c:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   ccd40:	e5903000 	ldr	r3, [r0]
   ccd44:	e5933018 	ldr	r3, [r3, #24]
   ccd48:	e12fff33 	blx	r3
   ccd4c:	ed947a07 	vldr	s14, [r4, #28]
   ccd50:	eddf7a1a 	vldr	s15, [pc, #104]	@ ccdc0 <mixerengine::SoundColorFxDubecho::initialize()+0xc4>
   ccd54:	ee677a27 	vmul.f32	s15, s14, s15
   ccd58:	e3a03000 	mov	r3, #0
   ccd5c:	e5c450a1 	strb	r5, [r4, #161]	@ 0xa1
   ccd60:	e5843068 	str	r3, [r4, #104]	@ 0x68
   ccd64:	e1a00004 	mov	r0, r4
   ccd68:	e584306c 	str	r3, [r4, #108]	@ 0x6c
   ccd6c:	e5843070 	str	r3, [r4, #112]	@ 0x70
   ccd70:	e5843078 	str	r3, [r4, #120]	@ 0x78
   ccd74:	e5843080 	str	r3, [r4, #128]	@ 0x80
   ccd78:	e584308c 	str	r3, [r4, #140]	@ 0x8c
   ccd7c:	e5843098 	str	r3, [r4, #152]	@ 0x98
   ccd80:	e584309c 	str	r3, [r4, #156]	@ 0x9c
   ccd84:	e5c450a2 	strb	r5, [r4, #162]	@ 0xa2
   ccd88:	e58450a4 	str	r5, [r4, #164]	@ 0xa4
   ccd8c:	eefd7ae7 	vcvt.s32.f32	s15, s15
   ccd90:	ee173a90 	vmov	r3, s15
   ccd94:	e1a03143 	asr	r3, r3, #2
   ccd98:	e58430ac 	str	r3, [r4, #172]	@ 0xac
   ccd9c:	e58430a8 	str	r3, [r4, #168]	@ 0xa8
   ccda0:	ebfffef6 	bl	cc980 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]>
   ccda4:	e594205c 	ldr	r2, [r4, #92]	@ 0x5c
   ccda8:	e5943064 	ldr	r3, [r4, #100]	@ 0x64
   ccdac:	e5c450a1 	strb	r5, [r4, #161]	@ 0xa1
   ccdb0:	e5842058 	str	r2, [r4, #88]	@ 0x58
   ccdb4:	e5843060 	str	r3, [r4, #96]	@ 0x60
   ccdb8:	e5c450a2 	strb	r5, [r4, #162]	@ 0xa2
   ccdbc:	e8bd8038 	pop	{r3, r4, r5, pc}
   ccdc0:	447fc000 	.word	0x447fc000

000ccdc4 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)>:
   ccdc4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   ccdc8:	e2436001 	sub	r6, r3, #1
   ccdcc:	e28db020 	add	fp, sp, #32
   ccdd0:	e1a07183 	lsl	r7, r3, #3
   ccdd4:	e3760001 	cmn	r6, #1
   ccdd8:	e24dd044 	sub	sp, sp, #68	@ 0x44
   ccddc:	e1a05003 	mov	r5, r3
   ccde0:	e2873008 	add	r3, r7, #8
   ccde4:	e1a04000 	mov	r4, r0
   ccde8:	e04dd003 	sub	sp, sp, r3
   ccdec:	e50b604c 	str	r6, [fp, #-76]	@ 0xffffffb4
   ccdf0:	e50b1054 	str	r1, [fp, #-84]	@ 0xffffffac
   ccdf4:	e50b2058 	str	r2, [fp, #-88]	@ 0xffffffa8
   ccdf8:	e50bd050 	str	sp, [fp, #-80]	@ 0xffffffb0
   ccdfc:	0a000006 	beq	cce1c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x58>
   cce00:	e1a03006 	mov	r3, r6
   cce04:	e1a0200d 	mov	r2, sp
   cce08:	eddf0bf0 	vldr	d16, [pc, #960]	@ cd1d0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x40c>
   cce0c:	e2433001 	sub	r3, r3, #1
   cce10:	ece20b02 	vstmia	r2!, {d16}
   cce14:	e3730001 	cmn	r3, #1
   cce18:	1afffffb 	bne	cce0c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x48>
   cce1c:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
   cce20:	eddf0bea 	vldr	d16, [pc, #936]	@ cd1d0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x40c>
   cce24:	ed4b0b11 	vstr	d16, [fp, #-68]	@ 0xffffffbc
   cce28:	ed4b0b0f 	vstr	d16, [fp, #-60]	@ 0xffffffc4
   cce2c:	e3530000 	cmp	r3, #0
   cce30:	ed4b0b0d 	vstr	d16, [fp, #-52]	@ 0xffffffcc
   cce34:	ed4b0b0b 	vstr	d16, [fp, #-44]	@ 0xffffffd4
   cce38:	1a00025e 	bne	cd7b8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x9f4>
   cce3c:	e59430a4 	ldr	r3, [r4, #164]	@ 0xa4
   cce40:	e3530000 	cmp	r3, #0
   cce44:	1a000068 	bne	ccfec <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x228>
   cce48:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   cce4c:	e3500000 	cmp	r0, #0
   cce50:	0a000000 	beq	cce58 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x94>
   cce54:	ebfd0884 	bl	f06c <operator delete[](void*)@plt>
   cce58:	e1a00007 	mov	r0, r7
   cce5c:	ebfd0711 	bl	eaa8 <operator new[](unsigned int)@plt>
   cce60:	e51b604c 	ldr	r6, [fp, #-76]	@ 0xffffffb4
   cce64:	e3760001 	cmn	r6, #1
   cce68:	0a000006 	beq	cce88 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xc4>
   cce6c:	e1a02000 	mov	r2, r0
   cce70:	e1a03006 	mov	r3, r6
   cce74:	eddf0bd5 	vldr	d16, [pc, #852]	@ cd1d0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x40c>
   cce78:	e2433001 	sub	r3, r3, #1
   cce7c:	ece20b02 	vstmia	r2!, {d16}
   cce80:	e3730001 	cmn	r3, #1
   cce84:	1afffffb 	bne	cce78 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xb4>
   cce88:	e594303c 	ldr	r3, [r4, #60]	@ 0x3c
   cce8c:	e5840038 	str	r0, [r4, #56]	@ 0x38
   cce90:	e3530000 	cmp	r3, #0
   cce94:	0a000001 	beq	ccea0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xdc>
   cce98:	e1a00003 	mov	r0, r3
   cce9c:	ebfd0872 	bl	f06c <operator delete[](void*)@plt>
   ccea0:	e1a00007 	mov	r0, r7
   ccea4:	ebfd06ff 	bl	eaa8 <operator new[](unsigned int)@plt>
   ccea8:	e51bc04c 	ldr	ip, [fp, #-76]	@ 0xffffffb4
   cceac:	e37c0001 	cmn	ip, #1
   cceb0:	0a000006 	beq	cced0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x10c>
   cceb4:	e1a02000 	mov	r2, r0
   cceb8:	e1a0300c 	mov	r3, ip
   ccebc:	eddf0bc3 	vldr	d16, [pc, #780]	@ cd1d0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x40c>
   ccec0:	e2433001 	sub	r3, r3, #1
   ccec4:	ece20b02 	vstmia	r2!, {d16}
   ccec8:	e3730001 	cmn	r3, #1
   ccecc:	1afffffb 	bne	ccec0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xfc>
   cced0:	e5943040 	ldr	r3, [r4, #64]	@ 0x40
   cced4:	e584003c 	str	r0, [r4, #60]	@ 0x3c
   cced8:	e3530000 	cmp	r3, #0
   ccedc:	0a000001 	beq	ccee8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x124>
   ccee0:	e1a00003 	mov	r0, r3
   ccee4:	ebfd0860 	bl	f06c <operator delete[](void*)@plt>
   ccee8:	e1a00007 	mov	r0, r7
   cceec:	ebfd06ed 	bl	eaa8 <operator new[](unsigned int)@plt>
   ccef0:	e51be04c 	ldr	lr, [fp, #-76]	@ 0xffffffb4
   ccef4:	e37e0001 	cmn	lr, #1
   ccef8:	0a000006 	beq	ccf18 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x154>
   ccefc:	e1a02000 	mov	r2, r0
   ccf00:	e1a0300e 	mov	r3, lr
   ccf04:	eddf0bb1 	vldr	d16, [pc, #708]	@ cd1d0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x40c>
   ccf08:	e2433001 	sub	r3, r3, #1
   ccf0c:	ece20b02 	vstmia	r2!, {d16}
   ccf10:	e3730001 	cmn	r3, #1
   ccf14:	1afffffb 	bne	ccf08 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x144>
   ccf18:	e5943044 	ldr	r3, [r4, #68]	@ 0x44
   ccf1c:	e5840040 	str	r0, [r4, #64]	@ 0x40
   ccf20:	e3530000 	cmp	r3, #0
   ccf24:	0a000001 	beq	ccf30 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x16c>
   ccf28:	e1a00003 	mov	r0, r3
   ccf2c:	ebfd084e 	bl	f06c <operator delete[](void*)@plt>
   ccf30:	e1a00007 	mov	r0, r7
   ccf34:	ebfd06db 	bl	eaa8 <operator new[](unsigned int)@plt>
   ccf38:	e51b304c 	ldr	r3, [fp, #-76]	@ 0xffffffb4
   ccf3c:	e3730001 	cmn	r3, #1
   ccf40:	0a000005 	beq	ccf5c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x198>
   ccf44:	e1a02000 	mov	r2, r0
   ccf48:	eddf0ba0 	vldr	d16, [pc, #640]	@ cd1d0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x40c>
   ccf4c:	e2433001 	sub	r3, r3, #1
   ccf50:	ece20b02 	vstmia	r2!, {d16}
   ccf54:	e3730001 	cmn	r3, #1
   ccf58:	1afffffb 	bne	ccf4c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x188>
   ccf5c:	e5943048 	ldr	r3, [r4, #72]	@ 0x48
   ccf60:	e5840044 	str	r0, [r4, #68]	@ 0x44
   ccf64:	e3530000 	cmp	r3, #0
   ccf68:	0a000001 	beq	ccf74 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x1b0>
   ccf6c:	e1a00003 	mov	r0, r3
   ccf70:	ebfd083d 	bl	f06c <operator delete[](void*)@plt>
   ccf74:	e1a00007 	mov	r0, r7
   ccf78:	ebfd06ca 	bl	eaa8 <operator new[](unsigned int)@plt>
   ccf7c:	e51bc04c 	ldr	ip, [fp, #-76]	@ 0xffffffb4
   ccf80:	e37c0001 	cmn	ip, #1
   ccf84:	0a000006 	beq	ccfa4 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x1e0>
   ccf88:	e1a02000 	mov	r2, r0
   ccf8c:	e1a0300c 	mov	r3, ip
   ccf90:	eddf0b8e 	vldr	d16, [pc, #568]	@ cd1d0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x40c>
   ccf94:	e2433001 	sub	r3, r3, #1
   ccf98:	ece20b02 	vstmia	r2!, {d16}
   ccf9c:	e3730001 	cmn	r3, #1
   ccfa0:	1afffffb 	bne	ccf94 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x1d0>
   ccfa4:	e594304c 	ldr	r3, [r4, #76]	@ 0x4c
   ccfa8:	e5840048 	str	r0, [r4, #72]	@ 0x48
   ccfac:	e3530000 	cmp	r3, #0
   ccfb0:	0a000001 	beq	ccfbc <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x1f8>
   ccfb4:	e1a00003 	mov	r0, r3
   ccfb8:	ebfd082b 	bl	f06c <operator delete[](void*)@plt>
   ccfbc:	e1a00007 	mov	r0, r7
   ccfc0:	ebfd06b8 	bl	eaa8 <operator new[](unsigned int)@plt>
   ccfc4:	e51be04c 	ldr	lr, [fp, #-76]	@ 0xffffffb4
   ccfc8:	e37e0001 	cmn	lr, #1
   ccfcc:	0a000005 	beq	ccfe8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x224>
   ccfd0:	e1a03000 	mov	r3, r0
   ccfd4:	eddf0b7d 	vldr	d16, [pc, #500]	@ cd1d0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x40c>
   ccfd8:	e2466001 	sub	r6, r6, #1
   ccfdc:	ece30b02 	vstmia	r3!, {d16}
   ccfe0:	e3760001 	cmn	r6, #1
   ccfe4:	1afffffb 	bne	ccfd8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x214>
   ccfe8:	e584004c 	str	r0, [r4, #76]	@ 0x4c
   ccfec:	e3550000 	cmp	r5, #0
   ccff0:	ddd47a1a 	vldrle	s15, [r4, #104]	@ 0x68
   ccff4:	da00001b 	ble	cd068 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x2a4>
   ccff8:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   ccffc:	e5946038 	ldr	r6, [r4, #56]	@ 0x38
   cd000:	e51b2054 	ldr	r2, [fp, #-84]	@ 0xffffffac
   cd004:	e3a03000 	mov	r3, #0
   cd008:	e51bc050 	ldr	ip, [fp, #-80]	@ 0xffffffb0
   cd00c:	edd47a1a 	vldr	s15, [r4, #104]	@ 0x68
   cd010:	eddf6a70 	vldr	s13, [pc, #448]	@ cd1d8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x414>
   cd014:	ee777aa6 	vadd.f32	s15, s15, s13
   cd018:	e1a01183 	lsl	r1, r3, #3
   cd01c:	e2833001 	add	r3, r3, #1
   cd020:	edd21b00 	vldr	d17, [r2]
   cd024:	eef47ac7 	vcmpe.f32	s15, s14
   cd028:	ee170a90 	vmov	r0, s15
   cd02c:	edc47a1a 	vstr	s15, [r4, #104]	@ 0x68
   cd030:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd034:	cef77a00 	vmovgt.f32	s15, #112	@ 0x3f800000  1.0
   cd038:	cd847a1a 	vstrgt	s14, [r4, #104]	@ 0x68
   cd03c:	ce170a90 	vmovgt	r0, s15
   cd040:	e1530005 	cmp	r3, r5
   cd044:	ee800b90 	vdup.32	d16, r0
   cd048:	e0860001 	add	r0, r6, r1
   cd04c:	f3401db1 	vmul.f32	d17, d16, d17
   cd050:	e08c1001 	add	r1, ip, r1
   cd054:	edc01b00 	vstr	d17, [r0]
   cd058:	ecf21b02 	vldmia	r2!, {d17}
   cd05c:	f3400db1 	vmul.f32	d16, d16, d17
   cd060:	edc10b00 	vstr	d16, [r1]
   cd064:	1affffea 	bne	cd014 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x250>
   cd068:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   cd06c:	eef47ac7 	vcmpe.f32	s15, s14
   cd070:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd074:	a3a03001 	movge	r3, #1
   cd078:	a5843024 	strge	r3, [r4, #36]	@ 0x24
   cd07c:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   cd080:	e1a03005 	mov	r3, r5
   cd084:	e51b1050 	ldr	r1, [fp, #-80]	@ 0xffffffb0
   cd088:	e594203c 	ldr	r2, [r4, #60]	@ 0x3c
   cd08c:	e590c000 	ldr	ip, [r0]
   cd090:	e59cc014 	ldr	ip, [ip, #20]
   cd094:	e12fff3c 	blx	ip
   cd098:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   cd09c:	e1a03005 	mov	r3, r5
   cd0a0:	e51b2050 	ldr	r2, [fp, #-80]	@ 0xffffffb0
   cd0a4:	e5941038 	ldr	r1, [r4, #56]	@ 0x38
   cd0a8:	e590c000 	ldr	ip, [r0]
   cd0ac:	e59cc014 	ldr	ip, [ip, #20]
   cd0b0:	e12fff3c 	blx	ip
   cd0b4:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   cd0b8:	e1a03005 	mov	r3, r5
   cd0bc:	e51b1050 	ldr	r1, [fp, #-80]	@ 0xffffffb0
   cd0c0:	e5942038 	ldr	r2, [r4, #56]	@ 0x38
   cd0c4:	e590c000 	ldr	ip, [r0]
   cd0c8:	e59cc014 	ldr	ip, [ip, #20]
   cd0cc:	e12fff3c 	blx	ip
   cd0d0:	e59420a8 	ldr	r2, [r4, #168]	@ 0xa8
   cd0d4:	e59430ac 	ldr	r3, [r4, #172]	@ 0xac
   cd0d8:	e1520003 	cmp	r2, r3
   cd0dc:	0a00021b 	beq	cd950 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xb8c>
   cd0e0:	e5d430a1 	ldrb	r3, [r4, #161]	@ 0xa1
   cd0e4:	e3530000 	cmp	r3, #0
   cd0e8:	1a0001d6 	bne	cd848 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xa84>
   cd0ec:	e5d430a2 	ldrb	r3, [r4, #162]	@ 0xa2
   cd0f0:	e3530000 	cmp	r3, #0
   cd0f4:	1a0001d3 	bne	cd848 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xa84>
   cd0f8:	e1a00004 	mov	r0, r4
   cd0fc:	ebfffe1f 	bl	cc980 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]>
   cd100:	edd47a1c 	vldr	s15, [r4, #112]	@ 0x70
   cd104:	edd46a1d 	vldr	s13, [r4, #116]	@ 0x74
   cd108:	eef47a66 	vcmp.f32	s15, s13
   cd10c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd110:	0a0001d3 	beq	cd864 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xaa0>
   cd114:	e3550000 	cmp	r5, #0
   cd118:	da00000f 	ble	cd15c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x398>
   cd11c:	ee366ae7 	vsub.f32	s12, s13, s15
   cd120:	ed9f7a2d 	vldr	s14, [pc, #180]	@ cd1dc <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x418>
   cd124:	e5946038 	ldr	r6, [r4, #56]	@ 0x38
   cd128:	e3a03000 	mov	r3, #0
   cd12c:	ee267a07 	vmul.f32	s14, s12, s14
   cd130:	eeb66a00 	vmov.f32	s12, #96	@ 0x3f000000  0.5
   cd134:	ee477a06 	vmla.f32	s15, s14, s12
   cd138:	e0862183 	add	r2, r6, r3, lsl #3
   cd13c:	e2833001 	add	r3, r3, #1
   cd140:	e1530005 	cmp	r3, r5
   cd144:	f3fc1c07 	vdup.32	d17, d7[1]
   cd148:	edd20b00 	vldr	d16, [r2]
   cd14c:	ee777a87 	vadd.f32	s15, s15, s14
   cd150:	f3410db0 	vmul.f32	d16, d17, d16
   cd154:	edc20b00 	vstr	d16, [r2]
   cd158:	1afffff6 	bne	cd138 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x374>
   cd15c:	edc46a1c 	vstr	s13, [r4, #112]	@ 0x70
   cd160:	edd47a1e 	vldr	s15, [r4, #120]	@ 0x78
   cd164:	edd46a1f 	vldr	s13, [r4, #124]	@ 0x7c
   cd168:	eef47a66 	vcmp.f32	s15, s13
   cd16c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd170:	0a0001cc 	beq	cd8a8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xae4>
   cd174:	e3550000 	cmp	r5, #0
   cd178:	da00000f 	ble	cd1bc <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x3f8>
   cd17c:	ee366ae7 	vsub.f32	s12, s13, s15
   cd180:	ed9f7a15 	vldr	s14, [pc, #84]	@ cd1dc <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x418>
   cd184:	e594703c 	ldr	r7, [r4, #60]	@ 0x3c
   cd188:	e3a03000 	mov	r3, #0
   cd18c:	ee267a07 	vmul.f32	s14, s12, s14
   cd190:	eeb66a00 	vmov.f32	s12, #96	@ 0x3f000000  0.5
   cd194:	ee477a06 	vmla.f32	s15, s14, s12
   cd198:	e0872183 	add	r2, r7, r3, lsl #3
   cd19c:	e2833001 	add	r3, r3, #1
   cd1a0:	e1530005 	cmp	r3, r5
   cd1a4:	f3fc1c07 	vdup.32	d17, d7[1]
   cd1a8:	edd20b00 	vldr	d16, [r2]
   cd1ac:	ee777a87 	vadd.f32	s15, s15, s14
   cd1b0:	f3410db0 	vmul.f32	d16, d17, d16
   cd1b4:	edc20b00 	vstr	d16, [r2]
   cd1b8:	1afffff6 	bne	cd198 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x3d4>
   cd1bc:	edc46a1e 	vstr	s13, [r4, #120]	@ 0x78
   cd1c0:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
   cd1c4:	e3530001 	cmp	r3, #1
   cd1c8:	da0001c5 	ble	cd8e4 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xb20>
   cd1cc:	ea000005 	b	cd1e8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x424>
	...
   cd1d8:	3baaab3a 	.word	0x3baaab3a
   cd1dc:	3c800000 	.word	0x3c800000
   cd1e0:	0114c1e8 	.word	0x0114c1e8
   cd1e4:	3b1f383f 	.word	0x3b1f383f
   cd1e8:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   cd1ec:	ed947a16 	vldr	s14, [r4, #88]	@ 0x58
   cd1f0:	e5940050 	ldr	r0, [r4, #80]	@ 0x50
   cd1f4:	e1a03005 	mov	r3, r5
   cd1f8:	e5941040 	ldr	r1, [r4, #64]	@ 0x40
   cd1fc:	ee777a27 	vadd.f32	s15, s14, s15
   cd200:	eefd7ae7 	vcvt.s32.f32	s15, s15
   cd204:	ee172a90 	vmov	r2, s15
   cd208:	ebff3c10 	bl	9c250 <mixerengine::DelayUnit::getDelayData(common::Float2*, long, int)>
   cd20c:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   cd210:	ed947a18 	vldr	s14, [r4, #96]	@ 0x60
   cd214:	e5940054 	ldr	r0, [r4, #84]	@ 0x54
   cd218:	e1a03005 	mov	r3, r5
   cd21c:	e5941044 	ldr	r1, [r4, #68]	@ 0x44
   cd220:	ee777a27 	vadd.f32	s15, s14, s15
   cd224:	eefd7ae7 	vcvt.s32.f32	s15, s15
   cd228:	ee172a90 	vmov	r2, s15
   cd22c:	ebff3c07 	bl	9c250 <mixerengine::DelayUnit::getDelayData(common::Float2*, long, int)>
   cd230:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   cd234:	ed947a17 	vldr	s14, [r4, #92]	@ 0x5c
   cd238:	e5940050 	ldr	r0, [r4, #80]	@ 0x50
   cd23c:	e1a03005 	mov	r3, r5
   cd240:	e5941048 	ldr	r1, [r4, #72]	@ 0x48
   cd244:	ee777a27 	vadd.f32	s15, s14, s15
   cd248:	eefd7ae7 	vcvt.s32.f32	s15, s15
   cd24c:	ee172a90 	vmov	r2, s15
   cd250:	ebff3bfe 	bl	9c250 <mixerengine::DelayUnit::getDelayData(common::Float2*, long, int)>
   cd254:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   cd258:	ed947a19 	vldr	s14, [r4, #100]	@ 0x64
   cd25c:	e5940054 	ldr	r0, [r4, #84]	@ 0x54
   cd260:	e1a03005 	mov	r3, r5
   cd264:	e594104c 	ldr	r1, [r4, #76]	@ 0x4c
   cd268:	ee777a27 	vadd.f32	s15, s14, s15
   cd26c:	eefd7ae7 	vcvt.s32.f32	s15, s15
   cd270:	ee172a90 	vmov	r2, s15
   cd274:	ebff3bf5 	bl	9c250 <mixerengine::DelayUnit::getDelayData(common::Float2*, long, int)>
   cd278:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   cd27c:	ed947a16 	vldr	s14, [r4, #88]	@ 0x58
   cd280:	e5940050 	ldr	r0, [r4, #80]	@ 0x50
   cd284:	e24b1044 	sub	r1, fp, #68	@ 0x44
   cd288:	ee777a27 	vadd.f32	s15, s14, s15
   cd28c:	eefd7ae7 	vcvt.s32.f32	s15, s15
   cd290:	ee172a90 	vmov	r2, s15
   cd294:	e0652002 	rsb	r2, r5, r2
   cd298:	ebff3c02 	bl	9c2a8 <mixerengine::DelayUnit::getDelayData(common::Float2*, long)>
   cd29c:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   cd2a0:	ed947a18 	vldr	s14, [r4, #96]	@ 0x60
   cd2a4:	e5940054 	ldr	r0, [r4, #84]	@ 0x54
   cd2a8:	e24b1034 	sub	r1, fp, #52	@ 0x34
   cd2ac:	ee777a27 	vadd.f32	s15, s14, s15
   cd2b0:	eefd7ae7 	vcvt.s32.f32	s15, s15
   cd2b4:	ee172a90 	vmov	r2, s15
   cd2b8:	e0652002 	rsb	r2, r5, r2
   cd2bc:	ebff3bf9 	bl	9c2a8 <mixerengine::DelayUnit::getDelayData(common::Float2*, long)>
   cd2c0:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   cd2c4:	ed947a17 	vldr	s14, [r4, #92]	@ 0x5c
   cd2c8:	e5940050 	ldr	r0, [r4, #80]	@ 0x50
   cd2cc:	e24b103c 	sub	r1, fp, #60	@ 0x3c
   cd2d0:	ee777a27 	vadd.f32	s15, s14, s15
   cd2d4:	eefd7ae7 	vcvt.s32.f32	s15, s15
   cd2d8:	ee172a90 	vmov	r2, s15
   cd2dc:	e0652002 	rsb	r2, r5, r2
   cd2e0:	ebff3bf0 	bl	9c2a8 <mixerengine::DelayUnit::getDelayData(common::Float2*, long)>
   cd2e4:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   cd2e8:	ed947a19 	vldr	s14, [r4, #100]	@ 0x64
   cd2ec:	e5940054 	ldr	r0, [r4, #84]	@ 0x54
   cd2f0:	e24b102c 	sub	r1, fp, #44	@ 0x2c
   cd2f4:	ee777a27 	vadd.f32	s15, s14, s15
   cd2f8:	eefd7ae7 	vcvt.s32.f32	s15, s15
   cd2fc:	ee172a90 	vmov	r2, s15
   cd300:	e0652002 	rsb	r2, r5, r2
   cd304:	ebff3be7 	bl	9c2a8 <mixerengine::DelayUnit::getDelayData(common::Float2*, long)>
   cd308:	ed946a16 	vldr	s12, [r4, #88]	@ 0x58
   cd30c:	eebd4ac6 	vcvt.s32.f32	s8, s12
   cd310:	edd47a17 	vldr	s15, [r4, #92]	@ 0x5c
   cd314:	edd46a18 	vldr	s13, [r4, #96]	@ 0x60
   cd318:	ed947a19 	vldr	s14, [r4, #100]	@ 0x64
   cd31c:	e51b604c 	ldr	r6, [fp, #-76]	@ 0xffffffb4
   cd320:	e5942040 	ldr	r2, [r4, #64]	@ 0x40
   cd324:	e3560000 	cmp	r6, #0
   cd328:	eeb84ac4 	vcvt.f32.s32	s8, s8
   cd32c:	eefd4ae6 	vcvt.s32.f32	s9, s13
   cd330:	eebd5ae7 	vcvt.s32.f32	s10, s15
   cd334:	eefd5ac7 	vcvt.s32.f32	s11, s14
   cd338:	ee366a44 	vsub.f32	s12, s12, s8
   cd33c:	eeb85ac5 	vcvt.f32.s32	s10, s10
   cd340:	f3f47c06 	vdup.32	d23, d6[0]
   cd344:	eef84ae4 	vcvt.f32.s32	s9, s9
   cd348:	eef85ae5 	vcvt.f32.s32	s11, s11
   cd34c:	ee375ac5 	vsub.f32	s10, s15, s10
   cd350:	ee766ae4 	vsub.f32	s13, s13, s9
   cd354:	f3f49c05 	vdup.32	d25, d5[0]
   cd358:	ee376a65 	vsub.f32	s12, s14, s11
   cd35c:	f3fc8c06 	vdup.32	d24, d6[1]
   cd360:	f3f4ac06 	vdup.32	d26, d6[0]
   cd364:	da0001b2 	ble	cda34 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xc70>
   cd368:	e594e04c 	ldr	lr, [r4, #76]	@ 0x4c
   cd36c:	e3a03008 	mov	r3, #8
   cd370:	e5941044 	ldr	r1, [r4, #68]	@ 0x44
   cd374:	e3a00000 	mov	r0, #0
   cd378:	e5948048 	ldr	r8, [r4, #72]	@ 0x48
   cd37c:	e51fa1a4 	ldr	sl, [pc, #-420]	@ cd1e0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x41c>
   cd380:	e50be048 	str	lr, [fp, #-72]	@ 0xffffffb8
   cd384:	e50b405c 	str	r4, [fp, #-92]	@ 0xffffffa4
   cd388:	e50b5060 	str	r5, [fp, #-96]	@ 0xffffffa0
   cd38c:	edda0b00 	vldr	d16, [sl]
   cd390:	f2603da7 	vsub.f32	d19, d16, d23
   cd394:	e1a0c180 	lsl	ip, r0, #3
   cd398:	e082e003 	add	lr, r2, r3
   cd39c:	e082500c 	add	r5, r2, ip
   cd3a0:	edde1b00 	vldr	d17, [lr]
   cd3a4:	edd52b00 	vldr	d18, [r5]
   cd3a8:	f2605da8 	vsub.f32	d21, d16, d24
   cd3ac:	f3472db2 	vmul.f32	d18, d23, d18
   cd3b0:	e081400c 	add	r4, r1, ip
   cd3b4:	f3431db1 	vmul.f32	d17, d19, d17
   cd3b8:	e0819003 	add	r9, r1, r3
   cd3bc:	f2604da9 	vsub.f32	d20, d16, d25
   cd3c0:	e088e00c 	add	lr, r8, ip
   cd3c4:	f2606daa 	vsub.f32	d22, d16, d26
   cd3c8:	e0887003 	add	r7, r8, r3
   cd3cc:	e51b6048 	ldr	r6, [fp, #-72]	@ 0xffffffb8
   cd3d0:	e2800001 	add	r0, r0, #1
   cd3d4:	f2421da1 	vadd.f32	d17, d18, d17
   cd3d8:	edc51b00 	vstr	d17, [r5]
   cd3dc:	edd40b00 	vldr	d16, [r4]
   cd3e0:	edd91b00 	vldr	d17, [r9]
   cd3e4:	f3480db0 	vmul.f32	d16, d24, d16
   cd3e8:	e086c00c 	add	ip, r6, ip
   cd3ec:	f3451db1 	vmul.f32	d17, d21, d17
   cd3f0:	e0866003 	add	r6, r6, r3
   cd3f4:	e51b504c 	ldr	r5, [fp, #-76]	@ 0xffffffb4
   cd3f8:	e2833008 	add	r3, r3, #8
   cd3fc:	e50b6064 	str	r6, [fp, #-100]	@ 0xffffff9c
   cd400:	e1550000 	cmp	r5, r0
   cd404:	f2401da1 	vadd.f32	d17, d16, d17
   cd408:	edc41b00 	vstr	d17, [r4]
   cd40c:	edd71b00 	vldr	d17, [r7]
   cd410:	edde0b00 	vldr	d16, [lr]
   cd414:	f3444db1 	vmul.f32	d20, d20, d17
   cd418:	f3490db0 	vmul.f32	d16, d25, d16
   cd41c:	f2404da4 	vadd.f32	d20, d16, d20
   cd420:	edce4b00 	vstr	d20, [lr]
   cd424:	eddc1b00 	vldr	d17, [ip]
   cd428:	edd60b00 	vldr	d16, [r6]
   cd42c:	f34a1db1 	vmul.f32	d17, d26, d17
   cd430:	f3460db0 	vmul.f32	d16, d22, d16
   cd434:	f2410da0 	vadd.f32	d16, d17, d16
   cd438:	edcc0b00 	vstr	d16, [ip]
   cd43c:	caffffd2 	bgt	cd38c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x5c8>
   cd440:	e51b405c 	ldr	r4, [fp, #-92]	@ 0xffffffa4
   cd444:	e51b5060 	ldr	r5, [fp, #-96]	@ 0xffffffa0
   cd448:	edda1b00 	vldr	d17, [sl]
   cd44c:	e51b604c 	ldr	r6, [fp, #-76]	@ 0xffffffb4
   cd450:	f2612da7 	vsub.f32	d18, d17, d23
   cd454:	f2613da9 	vsub.f32	d19, d17, d25
   cd458:	e1a03186 	lsl	r3, r6, #3
   cd45c:	e51b6048 	ldr	r6, [fp, #-72]	@ 0xffffffb8
   cd460:	e082e003 	add	lr, r2, r3
   cd464:	edde0b00 	vldr	d16, [lr]
   cd468:	f3477db0 	vmul.f32	d23, d23, d16
   cd46c:	ed5b0b11 	vldr	d16, [fp, #-68]	@ 0xffffffbc
   cd470:	f3420db0 	vmul.f32	d16, d18, d16
   cd474:	e081c003 	add	ip, r1, r3
   cd478:	f2612da8 	vsub.f32	d18, d17, d24
   cd47c:	e0880003 	add	r0, r8, r3
   cd480:	e0863003 	add	r3, r6, r3
   cd484:	e5d460a1 	ldrb	r6, [r4, #161]	@ 0xa1
   cd488:	f2611daa 	vsub.f32	d17, d17, d26
   cd48c:	f2470da0 	vadd.f32	d16, d23, d16
   cd490:	edce0b00 	vstr	d16, [lr]
   cd494:	eddc0b00 	vldr	d16, [ip]
   cd498:	f3488db0 	vmul.f32	d24, d24, d16
   cd49c:	ed5b0b0d 	vldr	d16, [fp, #-52]	@ 0xffffffcc
   cd4a0:	f3420db0 	vmul.f32	d16, d18, d16
   cd4a4:	e3560000 	cmp	r6, #0
   cd4a8:	f2480da0 	vadd.f32	d16, d24, d16
   cd4ac:	edcc0b00 	vstr	d16, [ip]
   cd4b0:	edd00b00 	vldr	d16, [r0]
   cd4b4:	f3499db0 	vmul.f32	d25, d25, d16
   cd4b8:	ed5b0b0f 	vldr	d16, [fp, #-60]	@ 0xffffffc4
   cd4bc:	f3430db0 	vmul.f32	d16, d19, d16
   cd4c0:	f2490da0 	vadd.f32	d16, d25, d16
   cd4c4:	edc00b00 	vstr	d16, [r0]
   cd4c8:	edd30b00 	vldr	d16, [r3]
   cd4cc:	f34aadb0 	vmul.f32	d26, d26, d16
   cd4d0:	ed5b0b0b 	vldr	d16, [fp, #-44]	@ 0xffffffd4
   cd4d4:	f3410db0 	vmul.f32	d16, d17, d16
   cd4d8:	f24a0da0 	vadd.f32	d16, d26, d16
   cd4dc:	edc30b00 	vstr	d16, [r3]
   cd4e0:	0a000025 	beq	cd57c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x7b8>
   cd4e4:	e3550000 	cmp	r5, #0
   cd4e8:	ddd46a26 	vldrle	s13, [r4, #152]	@ 0x98
   cd4ec:	da00001a 	ble	cd55c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x798>
   cd4f0:	eeb76a00 	vmov.f32	s12, #112	@ 0x3f800000  1.0
   cd4f4:	e3a03000 	mov	r3, #0
   cd4f8:	edd46a26 	vldr	s13, [r4, #152]	@ 0x98
   cd4fc:	ed5f5ac8 	vldr	s11, [pc, #-800]	@ cd1e4 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x420>
   cd500:	ee766aa5 	vadd.f32	s13, s13, s11
   cd504:	edda2b00 	vldr	d18, [sl]
   cd508:	e1a0c183 	lsl	ip, r3, #3
   cd50c:	e2833001 	add	r3, r3, #1
   cd510:	eef46ac6 	vcmpe.f32	s13, s12
   cd514:	ee160a90 	vmov	r0, s13
   cd518:	edc46a26 	vstr	s13, [r4, #152]	@ 0x98
   cd51c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd520:	aef76a00 	vmovge.f32	s13, #112	@ 0x3f800000  1.0
   cd524:	ad846a26 	vstrge	s12, [r4, #152]	@ 0x98
   cd528:	ae160a90 	vmovge	r0, s13
   cd52c:	ee800b90 	vdup.32	d16, r0
   cd530:	f2622da0 	vsub.f32	d18, d18, d16
   cd534:	e082000c 	add	r0, r2, ip
   cd538:	e088c00c 	add	ip, r8, ip
   cd53c:	edd03b00 	vldr	d19, [r0]
   cd540:	eddc1b00 	vldr	d17, [ip]
   cd544:	f3401db1 	vmul.f32	d17, d16, d17
   cd548:	e1530005 	cmp	r3, r5
   cd54c:	f3420db3 	vmul.f32	d16, d18, d19
   cd550:	f2410da0 	vadd.f32	d16, d17, d16
   cd554:	edc00b00 	vstr	d16, [r0]
   cd558:	1affffe8 	bne	cd500 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x73c>
   cd55c:	eeb76a00 	vmov.f32	s12, #112	@ 0x3f800000  1.0
   cd560:	eef46ac6 	vcmpe.f32	s13, s12
   cd564:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd568:	a3a03000 	movge	r3, #0
   cd56c:	adc47a16 	vstrge	s15, [r4, #88]	@ 0x58
   cd570:	a5843098 	strge	r3, [r4, #152]	@ 0x98
   cd574:	a3a03000 	movge	r3, #0
   cd578:	a5c430a1 	strbge	r3, [r4, #161]	@ 0xa1
   cd57c:	e5d430a2 	ldrb	r3, [r4, #162]	@ 0xa2
   cd580:	e3530000 	cmp	r3, #0
   cd584:	0a000026 	beq	cd624 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x860>
   cd588:	e3550000 	cmp	r5, #0
   cd58c:	ddd47a27 	vldrle	s15, [r4, #156]	@ 0x9c
   cd590:	da00001b 	ble	cd604 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x840>
   cd594:	eef76a00 	vmov.f32	s13, #112	@ 0x3f800000  1.0
   cd598:	e51be048 	ldr	lr, [fp, #-72]	@ 0xffffffb8
   cd59c:	e3a03000 	mov	r3, #0
   cd5a0:	edd47a27 	vldr	s15, [r4, #156]	@ 0x9c
   cd5a4:	ed1f6af2 	vldr	s12, [pc, #-968]	@ cd1e4 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x420>
   cd5a8:	ee777a86 	vadd.f32	s15, s15, s12
   cd5ac:	edda2b00 	vldr	d18, [sl]
   cd5b0:	e1a0c183 	lsl	ip, r3, #3
   cd5b4:	e2833001 	add	r3, r3, #1
   cd5b8:	eef47ae6 	vcmpe.f32	s15, s13
   cd5bc:	ee170a90 	vmov	r0, s15
   cd5c0:	edc47a27 	vstr	s15, [r4, #156]	@ 0x9c
   cd5c4:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd5c8:	aef77a00 	vmovge.f32	s15, #112	@ 0x3f800000  1.0
   cd5cc:	adc46a27 	vstrge	s13, [r4, #156]	@ 0x9c
   cd5d0:	ae170a90 	vmovge	r0, s15
   cd5d4:	ee800b90 	vdup.32	d16, r0
   cd5d8:	f2622da0 	vsub.f32	d18, d18, d16
   cd5dc:	e081000c 	add	r0, r1, ip
   cd5e0:	e08ec00c 	add	ip, lr, ip
   cd5e4:	edd03b00 	vldr	d19, [r0]
   cd5e8:	eddc1b00 	vldr	d17, [ip]
   cd5ec:	f3401db1 	vmul.f32	d17, d16, d17
   cd5f0:	e1530005 	cmp	r3, r5
   cd5f4:	f3420db3 	vmul.f32	d16, d18, d19
   cd5f8:	f2410da0 	vadd.f32	d16, d17, d16
   cd5fc:	edc00b00 	vstr	d16, [r0]
   cd600:	1affffe8 	bne	cd5a8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x7e4>
   cd604:	eef76a00 	vmov.f32	s13, #112	@ 0x3f800000  1.0
   cd608:	eef47ae6 	vcmpe.f32	s15, s13
   cd60c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd610:	a3a03000 	movge	r3, #0
   cd614:	ad847a18 	vstrge	s14, [r4, #96]	@ 0x60
   cd618:	a584309c 	strge	r3, [r4, #156]	@ 0x9c
   cd61c:	a3a03000 	movge	r3, #0
   cd620:	a5c430a2 	strbge	r3, [r4, #162]	@ 0xa2
   cd624:	edd44a21 	vldr	s9, [r4, #132]	@ 0x84
   cd628:	edd47a20 	vldr	s15, [r4, #128]	@ 0x80
   cd62c:	eef44a67 	vcmp.f32	s9, s15
   cd630:	ed944a24 	vldr	s8, [r4, #144]	@ 0x90
   cd634:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd638:	1e746ae7 	vsubne.f32	s13, s9, s15
   cd63c:	1d9f7adb 	vldrne	s14, [pc, #876]	@ cd9b0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xbec>
   cd640:	0ddf6add 	vldreq	s13, [pc, #884]	@ cd9bc <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xbf8>
   cd644:	1e666a87 	vmulne.f32	s13, s13, s14
   cd648:	ed947a23 	vldr	s14, [r4, #140]	@ 0x8c
   cd64c:	eeb44a47 	vcmp.f32	s8, s14
   cd650:	edc46a22 	vstr	s13, [r4, #136]	@ 0x88
   cd654:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd658:	1e346a47 	vsubne.f32	s12, s8, s14
   cd65c:	1ddf6ad3 	vldrne	s13, [pc, #844]	@ cd9b0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xbec>
   cd660:	0ddf5ad5 	vldreq	s11, [pc, #852]	@ cd9bc <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xbf8>
   cd664:	1e665a26 	vmulne.f32	s11, s12, s13
   cd668:	e3550000 	cmp	r5, #0
   cd66c:	edc45a25 	vstr	s11, [r4, #148]	@ 0x94
   cd670:	da000029 	ble	cd71c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x958>
   cd674:	eef76a00 	vmov.f32	s13, #112	@ 0x3f800000  1.0
   cd678:	e5946038 	ldr	r6, [r4, #56]	@ 0x38
   cd67c:	e594703c 	ldr	r7, [r4, #60]	@ 0x3c
   cd680:	e3a00000 	mov	r0, #0
   cd684:	ed946a22 	vldr	s12, [r4, #136]	@ 0x88
   cd688:	ed9f5aca 	vldr	s10, [pc, #808]	@ cd9b8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xbf4>
   cd68c:	edd43a1b 	vldr	s7, [r4, #108]	@ 0x6c
   cd690:	eef43ae6 	vcmpe.f32	s7, s13
   cd694:	e1a03180 	lsl	r3, r0, #3
   cd698:	e2800001 	add	r0, r0, #1
   cd69c:	e082e003 	add	lr, r2, r3
   cd6a0:	e081c003 	add	ip, r1, r3
   cd6a4:	edde2b00 	vldr	d18, [lr]
   cd6a8:	e0868003 	add	r8, r6, r3
   cd6ac:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd6b0:	ee777a86 	vadd.f32	s15, s15, s12
   cd6b4:	e0873003 	add	r3, r7, r3
   cd6b8:	4e733a85 	vaddmi.f32	s7, s7, s10
   cd6bc:	edc47a20 	vstr	s15, [r4, #128]	@ 0x80
   cd6c0:	f3fc0c07 	vdup.32	d16, d7[1]
   cd6c4:	ee377a25 	vadd.f32	s14, s14, s11
   cd6c8:	4dc43a1b 	vstrmi	s7, [r4, #108]	@ 0x6c
   cd6cc:	f3fc1c03 	vdup.32	d17, d3[1]
   cd6d0:	e1500005 	cmp	r0, r5
   cd6d4:	f3422db1 	vmul.f32	d18, d18, d17
   cd6d8:	ed847a23 	vstr	s14, [r4, #140]	@ 0x8c
   cd6dc:	edce2b00 	vstr	d18, [lr]
   cd6e0:	eddc2b00 	vldr	d18, [ip]
   cd6e4:	f3421db1 	vmul.f32	d17, d18, d17
   cd6e8:	edcc1b00 	vstr	d17, [ip]
   cd6ec:	edde1b00 	vldr	d17, [lr]
   cd6f0:	f3400db1 	vmul.f32	d16, d16, d17
   cd6f4:	f3f41c07 	vdup.32	d17, d7[0]
   cd6f8:	edd82b00 	vldr	d18, [r8]
   cd6fc:	f2420da0 	vadd.f32	d16, d18, d16
   cd700:	edc80b00 	vstr	d16, [r8]
   cd704:	eddc0b00 	vldr	d16, [ip]
   cd708:	f3410db0 	vmul.f32	d16, d17, d16
   cd70c:	edd31b00 	vldr	d17, [r3]
   cd710:	f2410da0 	vadd.f32	d16, d17, d16
   cd714:	edc30b00 	vstr	d16, [r3]
   cd718:	1affffdb 	bne	cd68c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x8c8>
   cd71c:	edc44a20 	vstr	s9, [r4, #128]	@ 0x80
   cd720:	ed844a23 	vstr	s8, [r4, #140]	@ 0x8c
   cd724:	e5940030 	ldr	r0, [r4, #48]	@ 0x30
   cd728:	e1a03005 	mov	r3, r5
   cd72c:	e51b2050 	ldr	r2, [fp, #-80]	@ 0xffffffb0
   cd730:	e590c000 	ldr	ip, [r0]
   cd734:	e59cc014 	ldr	ip, [ip, #20]
   cd738:	e12fff3c 	blx	ip
   cd73c:	e3550000 	cmp	r5, #0
   cd740:	eddf4b96 	vldr	d20, [pc, #600]	@ cd9a0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xbdc>
   cd744:	da000011 	ble	cd790 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x9cc>
   cd748:	e5942040 	ldr	r2, [r4, #64]	@ 0x40
   cd74c:	e3a03000 	mov	r3, #0
   cd750:	e51bc058 	ldr	ip, [fp, #-88]	@ 0xffffffa8
   cd754:	e51b0054 	ldr	r0, [fp, #-84]	@ 0xffffffac
   cd758:	e51b6050 	ldr	r6, [fp, #-80]	@ 0xffffffb0
   cd75c:	e1a01183 	lsl	r1, r3, #3
   cd760:	ecf03b02 	vldmia	r0!, {d19}
   cd764:	e082e001 	add	lr, r2, r1
   cd768:	edde1b00 	vldr	d17, [lr]
   cd76c:	f3441db1 	vmul.f32	d17, d20, d17
   cd770:	e2833001 	add	r3, r3, #1
   cd774:	e1530005 	cmp	r3, r5
   cd778:	e0861001 	add	r1, r6, r1
   cd77c:	edd12b00 	vldr	d18, [r1]
   cd780:	f2431da1 	vadd.f32	d17, d19, d17
   cd784:	f2410da2 	vadd.f32	d16, d17, d18
   cd788:	ecec0b02 	vstmia	ip!, {d16}
   cd78c:	1afffff2 	bne	cd75c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x998>
   cd790:	e5940050 	ldr	r0, [r4, #80]	@ 0x50
   cd794:	e1a02005 	mov	r2, r5
   cd798:	e5941038 	ldr	r1, [r4, #56]	@ 0x38
   cd79c:	ebff3a8b 	bl	9c1d0 <mixerengine::DelayUnit::saveDelayData(common::Float2 const*, int)>
   cd7a0:	e5940054 	ldr	r0, [r4, #84]	@ 0x54
   cd7a4:	e1a02005 	mov	r2, r5
   cd7a8:	e594103c 	ldr	r1, [r4, #60]	@ 0x3c
   cd7ac:	ebff3a87 	bl	9c1d0 <mixerengine::DelayUnit::saveDelayData(common::Float2 const*, int)>
   cd7b0:	e24bd020 	sub	sp, fp, #32
   cd7b4:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
   cd7b8:	e3530003 	cmp	r3, #3
   cd7bc:	0a00007f 	beq	cd9c0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xbfc>
   cd7c0:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   cd7c4:	edd47a1a 	vldr	s15, [r4, #104]	@ 0x68
   cd7c8:	eef47ac7 	vcmpe.f32	s15, s14
   cd7cc:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd7d0:	5a000062 	bpl	cd960 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xb9c>
   cd7d4:	e3550000 	cmp	r5, #0
   cd7d8:	dafffe27 	ble	cd07c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x2b8>
   cd7dc:	e5946038 	ldr	r6, [r4, #56]	@ 0x38
   cd7e0:	e3a03000 	mov	r3, #0
   cd7e4:	e51b2054 	ldr	r2, [fp, #-84]	@ 0xffffffac
   cd7e8:	eddf6a72 	vldr	s13, [pc, #456]	@ cd9b8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xbf4>
   cd7ec:	e51bc050 	ldr	ip, [fp, #-80]	@ 0xffffffb0
   cd7f0:	ea000000 	b	cd7f8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xa34>
   cd7f4:	edd47a1a 	vldr	s15, [r4, #104]	@ 0x68
   cd7f8:	ee777aa6 	vadd.f32	s15, s15, s13
   cd7fc:	e1a01183 	lsl	r1, r3, #3
   cd800:	e2833001 	add	r3, r3, #1
   cd804:	edd21b00 	vldr	d17, [r2]
   cd808:	e0860001 	add	r0, r6, r1
   cd80c:	e08c1001 	add	r1, ip, r1
   cd810:	eef47ac7 	vcmpe.f32	s15, s14
   cd814:	edc47a1a 	vstr	s15, [r4, #104]	@ 0x68
   cd818:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd81c:	cef77a00 	vmovgt.f32	s15, #112	@ 0x3f800000  1.0
   cd820:	cd847a1a 	vstrgt	s14, [r4, #104]	@ 0x68
   cd824:	e1530005 	cmp	r3, r5
   cd828:	f3fc0c07 	vdup.32	d16, d7[1]
   cd82c:	f3401db1 	vmul.f32	d17, d16, d17
   cd830:	edc01b00 	vstr	d17, [r0]
   cd834:	ecf21b02 	vldmia	r2!, {d17}
   cd838:	f3400db1 	vmul.f32	d16, d16, d17
   cd83c:	edc10b00 	vstr	d16, [r1]
   cd840:	1affffeb 	bne	cd7f4 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xa30>
   cd844:	eafffe0c 	b	cd07c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x2b8>
   cd848:	edd47a1c 	vldr	s15, [r4, #112]	@ 0x70
   cd84c:	edd46a1d 	vldr	s13, [r4, #116]	@ 0x74
   cd850:	eef47a66 	vcmp.f32	s15, s13
   cd854:	e3a03001 	mov	r3, #1
   cd858:	e5c430a0 	strb	r3, [r4, #160]	@ 0xa0
   cd85c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd860:	1afffe2b 	bne	cd114 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x350>
   cd864:	e3550000 	cmp	r5, #0
   cd868:	f3fc1c07 	vdup.32	d17, d7[1]
   cd86c:	dafffe3b 	ble	cd160 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x39c>
   cd870:	e5946038 	ldr	r6, [r4, #56]	@ 0x38
   cd874:	e3a03000 	mov	r3, #0
   cd878:	e0862183 	add	r2, r6, r3, lsl #3
   cd87c:	e2833001 	add	r3, r3, #1
   cd880:	e1530005 	cmp	r3, r5
   cd884:	edd20b00 	vldr	d16, [r2]
   cd888:	f3410db0 	vmul.f32	d16, d17, d16
   cd88c:	edc20b00 	vstr	d16, [r2]
   cd890:	1afffff8 	bne	cd878 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xab4>
   cd894:	edd47a1e 	vldr	s15, [r4, #120]	@ 0x78
   cd898:	edd46a1f 	vldr	s13, [r4, #124]	@ 0x7c
   cd89c:	eef47a66 	vcmp.f32	s15, s13
   cd8a0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cd8a4:	1afffe32 	bne	cd174 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x3b0>
   cd8a8:	e3550000 	cmp	r5, #0
   cd8ac:	f3fc1c07 	vdup.32	d17, d7[1]
   cd8b0:	dafffe42 	ble	cd1c0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x3fc>
   cd8b4:	e594703c 	ldr	r7, [r4, #60]	@ 0x3c
   cd8b8:	e3a03000 	mov	r3, #0
   cd8bc:	e0872183 	add	r2, r7, r3, lsl #3
   cd8c0:	e2833001 	add	r3, r3, #1
   cd8c4:	e1530005 	cmp	r3, r5
   cd8c8:	edd20b00 	vldr	d16, [r2]
   cd8cc:	f3410db0 	vmul.f32	d16, d17, d16
   cd8d0:	edc20b00 	vstr	d16, [r2]
   cd8d4:	1afffff8 	bne	cd8bc <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xaf8>
   cd8d8:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
   cd8dc:	e3530001 	cmp	r3, #1
   cd8e0:	cafffe40 	bgt	cd1e8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x424>
   cd8e4:	e594e0a4 	ldr	lr, [r4, #164]	@ 0xa4
   cd8e8:	e3550000 	cmp	r5, #0
   cd8ec:	e28ee001 	add	lr, lr, #1
   cd8f0:	d5941044 	ldrle	r1, [r4, #68]	@ 0x44
   cd8f4:	e584e0a4 	str	lr, [r4, #164]	@ 0xa4
   cd8f8:	da00000b 	ble	cd92c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xb68>
   cd8fc:	e5942040 	ldr	r2, [r4, #64]	@ 0x40
   cd900:	e3a03000 	mov	r3, #0
   cd904:	e5941044 	ldr	r1, [r4, #68]	@ 0x44
   cd908:	eddf0b26 	vldr	d16, [pc, #152]	@ cd9a8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xbe4>
   cd90c:	e1a00183 	lsl	r0, r3, #3
   cd910:	e2833001 	add	r3, r3, #1
   cd914:	e1530005 	cmp	r3, r5
   cd918:	e082c000 	add	ip, r2, r0
   cd91c:	e0810000 	add	r0, r1, r0
   cd920:	edcc0b00 	vstr	d16, [ip]
   cd924:	edc00b00 	vstr	d16, [r0]
   cd928:	1afffff7 	bne	cd90c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xb48>
   cd92c:	e35e0082 	cmp	lr, #130	@ 0x82
   cd930:	eddf0b1c 	vldr	d16, [pc, #112]	@ cd9a8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xbe4>
   cd934:	ed4b0b11 	vstr	d16, [fp, #-68]	@ 0xffffffbc
   cd938:	ed4b0b0d 	vstr	d16, [fp, #-52]	@ 0xffffffcc
   cd93c:	c3a03002 	movgt	r3, #2
   cd940:	c5843024 	strgt	r3, [r4, #36]	@ 0x24
   cd944:	c3a03000 	movgt	r3, #0
   cd948:	c58430a4 	strgt	r3, [r4, #164]	@ 0xa4
   cd94c:	eaffff74 	b	cd724 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x960>
   cd950:	e5d430a0 	ldrb	r3, [r4, #160]	@ 0xa0
   cd954:	e3530000 	cmp	r3, #0
   cd958:	0afffde8 	beq	cd100 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x33c>
   cd95c:	eafffddf 	b	cd0e0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x31c>
   cd960:	e3550000 	cmp	r5, #0
   cd964:	dafffdc4 	ble	cd07c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x2b8>
   cd968:	e5941038 	ldr	r1, [r4, #56]	@ 0x38
   cd96c:	e3a03000 	mov	r3, #0
   cd970:	e51b2054 	ldr	r2, [fp, #-84]	@ 0xffffffac
   cd974:	e51bc050 	ldr	ip, [fp, #-80]	@ 0xffffffb0
   cd978:	e08c0183 	add	r0, ip, r3, lsl #3
   cd97c:	e2833001 	add	r3, r3, #1
   cd980:	e1530005 	cmp	r3, r5
   cd984:	edd20b00 	vldr	d16, [r2]
   cd988:	ece10b02 	vstmia	r1!, {d16}
   cd98c:	ecf20b02 	vldmia	r2!, {d16}
   cd990:	edc00b00 	vstr	d16, [r0]
   cd994:	1afffff7 	bne	cd978 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xbb4>
   cd998:	eafffdb7 	b	cd07c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x2b8>
   cd99c:	e320f000 	nop	{0}
   cd9a0:	3f333333 	.word	0x3f333333
   cd9a4:	3f333333 	.word	0x3f333333
	...
   cd9b0:	3c800000 	.word	0x3c800000
   cd9b4:	0114c1e8 	.word	0x0114c1e8
   cd9b8:	3baaab3a 	.word	0x3baaab3a
   cd9bc:	00000000 	.word	0x00000000
   cd9c0:	e3550000 	cmp	r5, #0
   cd9c4:	dafffdac 	ble	cd07c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x2b8>
   cd9c8:	e5946038 	ldr	r6, [r4, #56]	@ 0x38
   cd9cc:	e3a03000 	mov	r3, #0
   cd9d0:	e51b2054 	ldr	r2, [fp, #-84]	@ 0xffffffac
   cd9d4:	e3a0c000 	mov	ip, #0
   cd9d8:	e51be050 	ldr	lr, [fp, #-80]	@ 0xffffffb0
   cd9dc:	ed1f7a0b 	vldr	s14, [pc, #-44]	@ cd9b8 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xbf4>
   cd9e0:	edd47a1a 	vldr	s15, [r4, #104]	@ 0x68
   cd9e4:	ee777ac7 	vsub.f32	s15, s15, s14
   cd9e8:	e1a01183 	lsl	r1, r3, #3
   cd9ec:	e2833001 	add	r3, r3, #1
   cd9f0:	edd21b00 	vldr	d17, [r2]
   cd9f4:	e0860001 	add	r0, r6, r1
   cd9f8:	e08e1001 	add	r1, lr, r1
   cd9fc:	eef57ac0 	vcmpe.f32	s15, #0.0
   cda00:	edc47a1a 	vstr	s15, [r4, #104]	@ 0x68
   cda04:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cda08:	9584c068 	strls	ip, [r4, #104]	@ 0x68
   cda0c:	9d5f7a16 	vldrls	s15, [pc, #-88]	@ cd9bc <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xbf8>
   cda10:	e1530005 	cmp	r3, r5
   cda14:	f3fc0c07 	vdup.32	d16, d7[1]
   cda18:	f3401db1 	vmul.f32	d17, d16, d17
   cda1c:	edc01b00 	vstr	d17, [r0]
   cda20:	ecf21b02 	vldmia	r2!, {d17}
   cda24:	f3400db1 	vmul.f32	d16, d16, d17
   cda28:	edc10b00 	vstr	d16, [r1]
   cda2c:	1affffeb 	bne	cd9e0 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xc1c>
   cda30:	eafffd91 	b	cd07c <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x2b8>
   cda34:	e2841044 	add	r1, r4, #68	@ 0x44
   cda38:	e51fa08c 	ldr	sl, [pc, #-140]	@ cd9b4 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0xbf0>
   cda3c:	e8911102 	ldm	r1, {r1, r8, ip}
   cda40:	e50bc048 	str	ip, [fp, #-72]	@ 0xffffffb8
   cda44:	eafffe7f 	b	cd448 <mixerengine::SoundColorFxDubecho::execute(common::Float2 const*, common::Float2*, int)+0x684>
   cda48:	ebfd051b 	bl	eebc <__cxa_end_cleanup@plt>

000cda4c <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()>:
   cda4c:	e92d4038 	push	{r3, r4, r5, lr}
   cda50:	f2c00010 	vmov.i32	d16, #0	@ 0x00000000
   cda54:	e59f32c4 	ldr	r3, [pc, #708]	@ cdd20 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2d4>
   cda58:	e1a04000 	mov	r4, r0
   cda5c:	e2800010 	add	r0, r0, #16
   cda60:	e3a02000 	mov	r2, #0
   cda64:	e5931000 	ldr	r1, [r3]
   cda68:	ee071a10 	vmov	s14, r1
   cda6c:	eef87a47 	vcvt.f32.u32	s15, s14
   cda70:	e3a03000 	mov	r3, #0
   cda74:	f440078f 	vst1.32	{d16}, [r0]
   cda78:	f2c60f10 	vmov.f32	d16, #0.5	@ 0x3f000000
   cda7c:	e3a00002 	mov	r0, #2
   cda80:	e5840018 	str	r0, [r4, #24]
   cda84:	e284001c 	add	r0, r4, #28
   cda88:	e5842068 	str	r2, [r4, #104]	@ 0x68
   cda8c:	e5841004 	str	r1, [r4, #4]
   cda90:	e584206c 	str	r2, [r4, #108]	@ 0x6c
   cda94:	e5841008 	str	r1, [r4, #8]
   cda98:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   cda9c:	e5842070 	str	r2, [r4, #112]	@ 0x70
   cdaa0:	e5842074 	str	r2, [r4, #116]	@ 0x74
   cdaa4:	f440078f 	vst1.32	{d16}, [r0]
   cdaa8:	e59f0274 	ldr	r0, [pc, #628]	@ cdd24 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2d8>
   cdaac:	e5842078 	str	r2, [r4, #120]	@ 0x78
   cdab0:	e584207c 	str	r2, [r4, #124]	@ 0x7c
   cdab4:	e5840000 	str	r0, [r4]
   cdab8:	e3a00048 	mov	r0, #72	@ 0x48
   cdabc:	e5843024 	str	r3, [r4, #36]	@ 0x24
   cdac0:	e5842080 	str	r2, [r4, #128]	@ 0x80
   cdac4:	e5842084 	str	r2, [r4, #132]	@ 0x84
   cdac8:	eec77a27 	vdiv.f32	s15, s14, s15
   cdacc:	e5842088 	str	r2, [r4, #136]	@ 0x88
   cdad0:	e584208c 	str	r2, [r4, #140]	@ 0x8c
   cdad4:	e5842090 	str	r2, [r4, #144]	@ 0x90
   cdad8:	e5842094 	str	r2, [r4, #148]	@ 0x94
   cdadc:	e5842098 	str	r2, [r4, #152]	@ 0x98
   cdae0:	e584209c 	str	r2, [r4, #156]	@ 0x9c
   cdae4:	e5c430a0 	strb	r3, [r4, #160]	@ 0xa0
   cdae8:	e5c430a1 	strb	r3, [r4, #161]	@ 0xa1
   cdaec:	e5c430a2 	strb	r3, [r4, #162]	@ 0xa2
   cdaf0:	e58430a8 	str	r3, [r4, #168]	@ 0xa8
   cdaf4:	e58430ac 	str	r3, [r4, #172]	@ 0xac
   cdaf8:	edc47a03 	vstr	s15, [r4, #12]
   cdafc:	ebfd0209 	bl	e328 <operator new(unsigned int)@plt>
   cdb00:	e1a05000 	mov	r5, r0
   cdb04:	ebff3671 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   cdb08:	e5845028 	str	r5, [r4, #40]	@ 0x28
   cdb0c:	e3a00048 	mov	r0, #72	@ 0x48
   cdb10:	ebfd0204 	bl	e328 <operator new(unsigned int)@plt>
   cdb14:	e1a05000 	mov	r5, r0
   cdb18:	ebff366c 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   cdb1c:	e584502c 	str	r5, [r4, #44]	@ 0x2c
   cdb20:	e3a00048 	mov	r0, #72	@ 0x48
   cdb24:	ebfd01ff 	bl	e328 <operator new(unsigned int)@plt>
   cdb28:	e1a05000 	mov	r5, r0
   cdb2c:	ebff3667 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   cdb30:	e5845030 	str	r5, [r4, #48]	@ 0x30
   cdb34:	e3a00048 	mov	r0, #72	@ 0x48
   cdb38:	ebfd01fa 	bl	e328 <operator new(unsigned int)@plt>
   cdb3c:	e1a05000 	mov	r5, r0
   cdb40:	ebff3662 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   cdb44:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   cdb48:	e5845034 	str	r5, [r4, #52]	@ 0x34
   cdb4c:	e59f11d4 	ldr	r1, [pc, #468]	@ cdd28 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2dc>
   cdb50:	e5903000 	ldr	r3, [r0]
   cdb54:	e5933008 	ldr	r3, [r3, #8]
   cdb58:	e12fff33 	blx	r3
   cdb5c:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   cdb60:	e59f11c4 	ldr	r1, [pc, #452]	@ cdd2c <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2e0>
   cdb64:	e5903000 	ldr	r3, [r0]
   cdb68:	e5933008 	ldr	r3, [r3, #8]
   cdb6c:	e12fff33 	blx	r3
   cdb70:	e5940030 	ldr	r0, [r4, #48]	@ 0x30
   cdb74:	e59f11b4 	ldr	r1, [pc, #436]	@ cdd30 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2e4>
   cdb78:	e5903000 	ldr	r3, [r0]
   cdb7c:	e5933008 	ldr	r3, [r3, #8]
   cdb80:	e12fff33 	blx	r3
   cdb84:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   cdb88:	e59f11a4 	ldr	r1, [pc, #420]	@ cdd34 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2e8>
   cdb8c:	e5903000 	ldr	r3, [r0]
   cdb90:	e5933008 	ldr	r3, [r3, #8]
   cdb94:	e12fff33 	blx	r3
   cdb98:	e3a0000c 	mov	r0, #12
   cdb9c:	ebfd01e1 	bl	e328 <operator new(unsigned int)@plt>
   cdba0:	e1a05000 	mov	r5, r0
   cdba4:	ebff3927 	bl	9c048 <mixerengine::DelayUnit::DelayUnit()>
   cdba8:	e5845050 	str	r5, [r4, #80]	@ 0x50
   cdbac:	e3a0000c 	mov	r0, #12
   cdbb0:	ebfd01dc 	bl	e328 <operator new(unsigned int)@plt>
   cdbb4:	e1a05000 	mov	r5, r0
   cdbb8:	ebff3922 	bl	9c048 <mixerengine::DelayUnit::DelayUnit()>
   cdbbc:	e5845054 	str	r5, [r4, #84]	@ 0x54
   cdbc0:	e3a00c02 	mov	r0, #512	@ 0x200
   cdbc4:	ebfd03b7 	bl	eaa8 <operator new[](unsigned int)@plt>
   cdbc8:	e2802c02 	add	r2, r0, #512	@ 0x200
   cdbcc:	e1a03000 	mov	r3, r0
   cdbd0:	eddf0b50 	vldr	d16, [pc, #320]	@ cdd18 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2cc>
   cdbd4:	ece30b02 	vstmia	r3!, {d16}
   cdbd8:	e1530002 	cmp	r3, r2
   cdbdc:	1afffffc 	bne	cdbd4 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x188>
   cdbe0:	e5840038 	str	r0, [r4, #56]	@ 0x38
   cdbe4:	e3a00c02 	mov	r0, #512	@ 0x200
   cdbe8:	ebfd03ae 	bl	eaa8 <operator new[](unsigned int)@plt>
   cdbec:	e2802c02 	add	r2, r0, #512	@ 0x200
   cdbf0:	e1a03000 	mov	r3, r0
   cdbf4:	eddf0b47 	vldr	d16, [pc, #284]	@ cdd18 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2cc>
   cdbf8:	ece30b02 	vstmia	r3!, {d16}
   cdbfc:	e1530002 	cmp	r3, r2
   cdc00:	1afffffc 	bne	cdbf8 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x1ac>
   cdc04:	e584003c 	str	r0, [r4, #60]	@ 0x3c
   cdc08:	e3a00c02 	mov	r0, #512	@ 0x200
   cdc0c:	ebfd03a5 	bl	eaa8 <operator new[](unsigned int)@plt>
   cdc10:	e2802c02 	add	r2, r0, #512	@ 0x200
   cdc14:	e1a03000 	mov	r3, r0
   cdc18:	eddf0b3e 	vldr	d16, [pc, #248]	@ cdd18 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2cc>
   cdc1c:	ece30b02 	vstmia	r3!, {d16}
   cdc20:	e1530002 	cmp	r3, r2
   cdc24:	1afffffc 	bne	cdc1c <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x1d0>
   cdc28:	e5840040 	str	r0, [r4, #64]	@ 0x40
   cdc2c:	e3a00c02 	mov	r0, #512	@ 0x200
   cdc30:	ebfd039c 	bl	eaa8 <operator new[](unsigned int)@plt>
   cdc34:	e2802c02 	add	r2, r0, #512	@ 0x200
   cdc38:	e1a03000 	mov	r3, r0
   cdc3c:	eddf0b35 	vldr	d16, [pc, #212]	@ cdd18 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2cc>
   cdc40:	ece30b02 	vstmia	r3!, {d16}
   cdc44:	e1530002 	cmp	r3, r2
   cdc48:	1afffffc 	bne	cdc40 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x1f4>
   cdc4c:	e5840044 	str	r0, [r4, #68]	@ 0x44
   cdc50:	e3a00c02 	mov	r0, #512	@ 0x200
   cdc54:	ebfd0393 	bl	eaa8 <operator new[](unsigned int)@plt>
   cdc58:	e2802c02 	add	r2, r0, #512	@ 0x200
   cdc5c:	e1a03000 	mov	r3, r0
   cdc60:	eddf0b2c 	vldr	d16, [pc, #176]	@ cdd18 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2cc>
   cdc64:	ece30b02 	vstmia	r3!, {d16}
   cdc68:	e1530002 	cmp	r3, r2
   cdc6c:	1afffffc 	bne	cdc64 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x218>
   cdc70:	e5840048 	str	r0, [r4, #72]	@ 0x48
   cdc74:	e3a00c02 	mov	r0, #512	@ 0x200
   cdc78:	ebfd038a 	bl	eaa8 <operator new[](unsigned int)@plt>
   cdc7c:	e2802c02 	add	r2, r0, #512	@ 0x200
   cdc80:	e1a03000 	mov	r3, r0
   cdc84:	eddf0b23 	vldr	d16, [pc, #140]	@ cdd18 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2cc>
   cdc88:	ece30b02 	vstmia	r3!, {d16}
   cdc8c:	e1530002 	cmp	r3, r2
   cdc90:	1afffffc 	bne	cdc88 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x23c>
   cdc94:	e584004c 	str	r0, [r4, #76]	@ 0x4c
   cdc98:	e3033f9a 	movw	r3, #16282	@ 0x3f9a
   cdc9c:	e5940050 	ldr	r0, [r4, #80]	@ 0x50
   cdca0:	e3443602 	movt	r3, #17922	@ 0x4602
   cdca4:	e3a01c21 	mov	r1, #8448	@ 0x2100
   cdca8:	e5843058 	str	r3, [r4, #88]	@ 0x58
   cdcac:	e3a03903 	mov	r3, #49152	@ 0xc000
   cdcb0:	e34435ce 	movt	r3, #17870	@ 0x45ce
   cdcb4:	e5843060 	str	r3, [r4, #96]	@ 0x60
   cdcb8:	ebff391a 	bl	9c128 <mixerengine::DelayUnit::init2(long)>
   cdcbc:	edd47a18 	vldr	s15, [r4, #96]	@ 0x60
   cdcc0:	eefd7ae7 	vcvt.s32.f32	s15, s15
   cdcc4:	e5940054 	ldr	r0, [r4, #84]	@ 0x54
   cdcc8:	ee173a90 	vmov	r3, s15
   cdccc:	e2932080 	adds	r2, r3, #128	@ 0x80
   cdcd0:	428330bf 	addmi	r3, r3, #191	@ 0xbf
   cdcd4:	51a03002 	movpl	r3, r2
   cdcd8:	e3c3103f 	bic	r1, r3, #63	@ 0x3f
   cdcdc:	ebff3911 	bl	9c128 <mixerengine::DelayUnit::init2(long)>
   cdce0:	e1a00004 	mov	r0, r4
   cdce4:	e8bd8038 	pop	{r3, r4, r5, pc}
   cdce8:	e59f3048 	ldr	r3, [pc, #72]	@ cdd38 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2ec>
   cdcec:	e5843000 	str	r3, [r4]
   cdcf0:	ebfd0471 	bl	eebc <__cxa_end_cleanup@plt>
   cdcf4:	e1a00005 	mov	r0, r5
   cdcf8:	ebfd03f4 	bl	ecd0 <operator delete(void*)@plt>
   cdcfc:	eafffff9 	b	cdce8 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x29c>
   cdd00:	eafffffb 	b	cdcf4 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2a8>
   cdd04:	eafffffa 	b	cdcf4 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2a8>
   cdd08:	eafffff9 	b	cdcf4 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2a8>
   cdd0c:	eafffff8 	b	cdcf4 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2a8>
   cdd10:	eafffff7 	b	cdcf4 <mixerengine::SoundColorFxDubecho::SoundColorFxDubecho()+0x2a8>
   cdd14:	e320f000 	nop	{0}
	...
   cdd20:	004172c0 	.word	0x004172c0
   cdd24:	0042d8b8 	.word	0x0042d8b8
   cdd28:	0042d8e0 	.word	0x0042d8e0
   cdd2c:	0042d8f8 	.word	0x0042d8f8
   cdd30:	0042d910 	.word	0x0042d910
   cdd34:	0042d928 	.word	0x0042d928
   cdd38:	0041db60 	.word	0x0041db60

000cdd3c <mixerengine::SoundColorFxDubecho::calcParameter()>:
   cdd3c:	e5d020a1 	ldrb	r2, [r0, #161]	@ 0xa1
   cdd40:	e1a03000 	mov	r3, r0
   cdd44:	e3520000 	cmp	r2, #0
   cdd48:	1a000003 	bne	cdd5c <mixerengine::SoundColorFxDubecho::calcParameter()+0x20>
   cdd4c:	e5d020a2 	ldrb	r2, [r0, #162]	@ 0xa2
   cdd50:	e3520000 	cmp	r2, #0
   cdd54:	1a000000 	bne	cdd5c <mixerengine::SoundColorFxDubecho::calcParameter()+0x20>
   cdd58:	eafffb08 	b	cc980 <mixerengine::SoundColorFxDubecho::calcParameter() [clone .part.3]>
   cdd5c:	e3a02001 	mov	r2, #1
   cdd60:	e5c320a0 	strb	r2, [r3, #160]	@ 0xa0
   cdd64:	e12fff1e 	bx	lr

000cdd68 <mixerengine::SoundColorFxDubecho::calcFeedback()>:
   cdd68:	eddf7a65 	vldr	s15, [pc, #404]	@ cdf04 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x19c>
   cdd6c:	ed907a08 	vldr	s14, [r0, #32]
   cdd70:	eeb47ae7 	vcmpe.f32	s14, s15
   cdd74:	edd06a2a 	vldr	s13, [r0, #168]	@ 0xa8
   cdd78:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cdd7c:	eef87ae6 	vcvt.f32.s32	s15, s13
   cdd80:	5a00002b 	bpl	cde34 <mixerengine::SoundColorFxDubecho::calcFeedback()+0xcc>
   cdd84:	eddf6a5f 	vldr	s13, [pc, #380]	@ cdf08 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1a0>
   cdd88:	ee277a26 	vmul.f32	s14, s14, s13
   cdd8c:	ed9f6a5e 	vldr	s12, [pc, #376]	@ cdf0c <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1a4>
   cdd90:	eddf6a5e 	vldr	s13, [pc, #376]	@ cdf10 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1a8>
   cdd94:	ee276a06 	vmul.f32	s12, s14, s12
   cdd98:	ee676a26 	vmul.f32	s13, s14, s13
   cdd9c:	ed806a24 	vstr	s12, [r0, #144]	@ 0x90
   cdda0:	eef75a00 	vmov.f32	s11, #112	@ 0x3f800000  1.0
   cdda4:	edc06a21 	vstr	s13, [r0, #132]	@ 0x84
   cdda8:	ed9f7a59 	vldr	s14, [pc, #356]	@ cdf14 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1ac>
   cddac:	eef47ac7 	vcmpe.f32	s15, s14
   cddb0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cddb4:	da000003 	ble	cddc8 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x60>
   cddb8:	ed9f7a56 	vldr	s14, [pc, #344]	@ cdf18 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1b0>
   cddbc:	eef47ac7 	vcmpe.f32	s15, s14
   cddc0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cddc4:	9a000046 	bls	cdee4 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x17c>
   cddc8:	ed9f7a51 	vldr	s14, [pc, #324]	@ cdf14 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1ac>
   cddcc:	eef47ac7 	vcmpe.f32	s15, s14
   cddd0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cddd4:	9a000024 	bls	cde6c <mixerengine::SoundColorFxDubecho::calcFeedback()+0x104>
   cddd8:	ed9f7a4e 	vldr	s14, [pc, #312]	@ cdf18 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1b0>
   cdddc:	eef47ac7 	vcmpe.f32	s15, s14
   cdde0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cdde4:	d12fff1e 	bxle	lr
   cdde8:	ed9f7a4b 	vldr	s14, [pc, #300]	@ cdf1c <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1b4>
   cddec:	ee777ac7 	vsub.f32	s15, s15, s14
   cddf0:	eddf4a4a 	vldr	s9, [pc, #296]	@ cdf20 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1b8>
   cddf4:	ed9f7a4a 	vldr	s14, [pc, #296]	@ cdf24 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1bc>
   cddf8:	ed9f5a4a 	vldr	s10, [pc, #296]	@ cdf28 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1c0>
   cddfc:	ee057aa4 	vmla.f32	s14, s11, s9
   cde00:	eddf4a49 	vldr	s9, [pc, #292]	@ cdf2c <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1c4>
   cde04:	ee677aa4 	vmul.f32	s15, s15, s9
   cde08:	ee777aa7 	vadd.f32	s15, s15, s15
   cde0c:	eef47ac5 	vcmpe.f32	s15, s10
   cde10:	ee277a26 	vmul.f32	s14, s14, s13
   cde14:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cde18:	ce777ac5 	vsubgt.f32	s15, s15, s10
   cde1c:	ed807a21 	vstr	s14, [r0, #132]	@ 0x84
   cde20:	cd9f7a42 	vldrgt	s14, [pc, #264]	@ cdf30 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1c8>
   cde24:	ce677a87 	vmulgt.f32	s15, s15, s14
   cde28:	ce076aa5 	vmlagt.f32	s12, s15, s11
   cde2c:	cd806a24 	vstrgt	s12, [r0, #144]	@ 0x90
   cde30:	e12fff1e 	bx	lr
   cde34:	eddf6a3e 	vldr	s13, [pc, #248]	@ cdf34 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1cc>
   cde38:	eeb47ae6 	vcmpe.f32	s14, s13
   cde3c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cde40:	5a000017 	bpl	cdea4 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x13c>
   cde44:	e30b3852 	movw	r3, #47186	@ 0xb852
   cde48:	e30427ae 	movw	r2, #18350	@ 0x47ae
   cde4c:	e3433f5e 	movt	r3, #16222	@ 0x3f5e
   cde50:	e3432f61 	movt	r2, #16225	@ 0x3f61
   cde54:	e5803084 	str	r3, [r0, #132]	@ 0x84
   cde58:	ee062a10 	vmov	s12, r2
   cde5c:	e5802090 	str	r2, [r0, #144]	@ 0x90
   cde60:	ee063a90 	vmov	s13, r3
   cde64:	eef75a00 	vmov.f32	s11, #112	@ 0x3f800000  1.0
   cde68:	eaffffce 	b	cdda8 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x40>
   cde6c:	ed9f7a2e 	vldr	s14, [pc, #184]	@ cdf2c <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1c4>
   cde70:	ee677a87 	vmul.f32	s15, s15, s14
   cde74:	ed9f7a2b 	vldr	s14, [pc, #172]	@ cdf28 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1c0>
   cde78:	eeb76a00 	vmov.f32	s12, #112	@ 0x3f800000  1.0
   cde7c:	ee777aa7 	vadd.f32	s15, s15, s15
   cde80:	ee767a67 	vsub.f32	s15, s12, s15
   cde84:	eef47ac7 	vcmpe.f32	s15, s14
   cde88:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cde8c:	ce777ac7 	vsubgt.f32	s15, s15, s14
   cde90:	cd9f6a26 	vldrgt	s12, [pc, #152]	@ cdf30 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1c8>
   cde94:	ce677a86 	vmulgt.f32	s15, s15, s12
   cde98:	ce476aa5 	vmlagt.f32	s13, s15, s11
   cde9c:	cdc06a21 	vstrgt	s13, [r0, #132]	@ 0x84
   cdea0:	e12fff1e 	bx	lr
   cdea4:	ed9f5a23 	vldr	s10, [pc, #140]	@ cdf38 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1d0>
   cdea8:	ee375a45 	vsub.f32	s10, s14, s10
   cdeac:	eddf5a15 	vldr	s11, [pc, #84]	@ cdf08 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1a0>
   cdeb0:	eddf6a16 	vldr	s13, [pc, #88]	@ cdf10 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1a8>
   cdeb4:	ed9f6a14 	vldr	s12, [pc, #80]	@ cdf0c <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1a4>
   cdeb8:	ee255a25 	vmul.f32	s10, s10, s11
   cdebc:	eef74a00 	vmov.f32	s9, #112	@ 0x3f800000  1.0
   cdec0:	ee347ac7 	vsub.f32	s14, s9, s14
   cdec4:	eddf4a1c 	vldr	s9, [pc, #112]	@ cdf3c <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1d4>
   cdec8:	ee456a24 	vmla.f32	s13, s10, s9
   cdecc:	eddf4a1b 	vldr	s9, [pc, #108]	@ cdf40 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1d8>
   cded0:	ee056a24 	vmla.f32	s12, s10, s9
   cded4:	edc06a21 	vstr	s13, [r0, #132]	@ 0x84
   cded8:	ee675a25 	vmul.f32	s11, s14, s11
   cdedc:	ed806a24 	vstr	s12, [r0, #144]	@ 0x90
   cdee0:	eaffffb0 	b	cdda8 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x40>
   cdee4:	ed9f7a0d 	vldr	s14, [pc, #52]	@ cdf20 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1b8>
   cdee8:	eddf7a0d 	vldr	s15, [pc, #52]	@ cdf24 <mixerengine::SoundColorFxDubecho::calcFeedback()+0x1bc>
   cdeec:	ee457a87 	vmla.f32	s15, s11, s14
   cdef0:	ee277aa6 	vmul.f32	s14, s15, s13
   cdef4:	ee667a27 	vmul.f32	s15, s12, s15
   cdef8:	ed807a21 	vstr	s14, [r0, #132]	@ 0x84
   cdefc:	edc07a24 	vstr	s15, [r0, #144]	@ 0x90
   cdf00:	e12fff1e 	bx	lr
   cdf04:	3ee8e8e9 	.word	0x3ee8e8e9
   cdf08:	400cb08d 	.word	0x400cb08d
   cdf0c:	3f6147ae 	.word	0x3f6147ae
   cdf10:	3f5eb852 	.word	0x3f5eb852
   cdf14:	42e60000 	.word	0x42e60000
   cdf18:	430b0000 	.word	0x430b0000
   cdf1c:	430c0000 	.word	0x430c0000
   cdf20:	3ca3d70a 	.word	0x3ca3d70a
   cdf24:	3f7ae148 	.word	0x3f7ae148
   cdf28:	3e4ccccd 	.word	0x3e4ccccd
   cdf2c:	3b8d3dcb 	.word	0x3b8d3dcb
   cdf30:	3dcccccd 	.word	0x3dcccccd
   cdf34:	3f0c8c8d 	.word	0x3f0c8c8d
   cdf38:	3f0b8b8c 	.word	0x3f0b8b8c
   cdf3c:	3df5c290 	.word	0x3df5c290
   cdf40:	3de147b0 	.word	0x3de147b0

000cdf44 <mixerengine::SoundColorFxDubecho::changeColorParameter()>:
   cdf44:	e5d030a1 	ldrb	r3, [r0, #161]	@ 0xa1
   cdf48:	e3530000 	cmp	r3, #0
   cdf4c:	1a000004 	bne	cdf64 <mixerengine::SoundColorFxDubecho::changeColorParameter()+0x20>
   cdf50:	e5d030a2 	ldrb	r3, [r0, #162]	@ 0xa2
   cdf54:	e3530000 	cmp	r3, #0
   cdf58:	03a03001 	moveq	r3, #1
   cdf5c:	05c030a0 	strbeq	r3, [r0, #160]	@ 0xa0
   cdf60:	012fff1e 	bxeq	lr
   cdf64:	eaffff7f 	b	cdd68 <mixerengine::SoundColorFxDubecho::calcFeedback()>

000cdf68 <mixerengine::SoundColorFxDubecho::detect(common::Float2 const*, int)>:
   cdf68:	e12fff1e 	bx	lr
