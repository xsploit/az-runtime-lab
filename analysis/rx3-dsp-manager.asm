
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

00089904 <mixerengine::BeatEffectManager::getBeatEffectSelectChannel() const>:
   89904:	e5900000 	ldr	r0, [r0]
   89908:	e12fff1e 	bx	lr

0008990c <mixerengine::BeatEffectManager::getBeatEffectNextSelectChannel() const>:
   8990c:	e5900004 	ldr	r0, [r0, #4]
   89910:	e12fff1e 	bx	lr

00089914 <mixerengine::BeatEffectManager::setBeatEffectSelectChannel(djengine::EnBeatEffectSelectChannel)>:
   89914:	e5801004 	str	r1, [r0, #4]
   89918:	e12fff1e 	bx	lr

0008991c <mixerengine::BeatEffectManager::getEffectPosition() const>:
   8991c:	e5903008 	ldr	r3, [r0, #8]
   89920:	e5930040 	ldr	r0, [r3, #64]	@ 0x40
   89924:	e12fff1e 	bx	lr

00089928 <mixerengine::BeatEffectManager::changeEffectStatus()>:
   89928:	e5900008 	ldr	r0, [r0, #8]
   8992c:	e92d4008 	push	{r3, lr}
   89930:	e5903000 	ldr	r3, [r0]
   89934:	e593301c 	ldr	r3, [r3, #28]
   89938:	e12fff33 	blx	r3
   8993c:	e8bd8008 	pop	{r3, pc}

00089940 <mixerengine::BeatEffectManager::setBeatEffectOnOff(bool)>:
   89940:	e5900008 	ldr	r0, [r0, #8]
   89944:	e92d4008 	push	{r3, lr}
   89948:	e5d0303c 	ldrb	r3, [r0, #60]	@ 0x3c
   8994c:	e1530001 	cmp	r3, r1
   89950:	08bd8008 	popeq	{r3, pc}
   89954:	e5903000 	ldr	r3, [r0]
   89958:	e593301c 	ldr	r3, [r3, #28]
   8995c:	e12fff33 	blx	r3
   89960:	e8bd8008 	pop	{r3, pc}

00089964 <mixerengine::BeatEffectManager::isBeatEffectOn() const>:
   89964:	e5903008 	ldr	r3, [r0, #8]
   89968:	e5d3003c 	ldrb	r0, [r3, #60]	@ 0x3c
   8996c:	e12fff1e 	bx	lr

00089970 <mixerengine::BeatEffectManager::setBeatEffectTime(unsigned long)>:
   89970:	e92d4010 	push	{r4, lr}
   89974:	ee071a90 	vmov	s15, r1
   89978:	ed2d8b02 	vpush	{d8}
   8997c:	eeb88a67 	vcvt.f32.u32	s16, s15
   89980:	e1a04000 	mov	r4, r0
   89984:	e5900008 	ldr	r0, [r0, #8]
   89988:	e3a01003 	mov	r1, #3
   8998c:	e5903000 	ldr	r3, [r0]
   89990:	ee182a10 	vmov	r2, s16
   89994:	e593300c 	ldr	r3, [r3, #12]
   89998:	e12fff33 	blx	r3
   8999c:	e594000c 	ldr	r0, [r4, #12]
   899a0:	e3a01003 	mov	r1, #3
   899a4:	ee182a10 	vmov	r2, s16
   899a8:	e5903000 	ldr	r3, [r0]
   899ac:	e593300c 	ldr	r3, [r3, #12]
   899b0:	e12fff33 	blx	r3
   899b4:	ecbd8b02 	vpop	{d8}
   899b8:	e8bd8010 	pop	{r4, pc}

000899bc <mixerengine::BeatEffectManager::getBeatEffectTime()>:
   899bc:	e5d020ec 	ldrb	r2, [r0, #236]	@ 0xec
   899c0:	e1a03000 	mov	r3, r0
   899c4:	e3520000 	cmp	r2, #0
   899c8:	1a000002 	bne	899d8 <mixerengine::BeatEffectManager::getBeatEffectTime()+0x1c>
   899cc:	e5903008 	ldr	r3, [r0, #8]
   899d0:	e5930024 	ldr	r0, [r3, #36]	@ 0x24
   899d4:	e12fff1e 	bx	lr
   899d8:	e5900008 	ldr	r0, [r0, #8]
   899dc:	e59310e0 	ldr	r1, [r3, #224]	@ 0xe0
   899e0:	ea00b0eb 	b	b5d94 <mixerengine::BeatEffect::calDisplayEffectTime(djengine::EnBeatButtonType)>

000899e4 <mixerengine::BeatEffectManager::getBeatEffectOldTime() const>:
   899e4:	e5903008 	ldr	r3, [r0, #8]
   899e8:	e5930024 	ldr	r0, [r3, #36]	@ 0x24
   899ec:	e12fff1e 	bx	lr

000899f0 <mixerengine::BeatEffectManager::getBeatEffectMaxTime() const>:
   899f0:	e5903008 	ldr	r3, [r0, #8]
   899f4:	e5930028 	ldr	r0, [r3, #40]	@ 0x28
   899f8:	e12fff1e 	bx	lr

000899fc <mixerengine::BeatEffectManager::getBeatEffectMinTime() const>:
   899fc:	e5903008 	ldr	r3, [r0, #8]
   89a00:	e593002c 	ldr	r0, [r3, #44]	@ 0x2c
   89a04:	e12fff1e 	bx	lr

00089a08 <mixerengine::BeatEffectManager::setBeatEffectPercent(long, bool)>:
   89a08:	e3520000 	cmp	r2, #0
   89a0c:	ee071a90 	vmov	s15, r1
   89a10:	e92d4010 	push	{r4, lr}
   89a14:	ed2d8b02 	vpush	{d8}
   89a18:	e1a04000 	mov	r4, r0
   89a1c:	eeb88ae7 	vcvt.f32.s32	s16, s15
   89a20:	e5900008 	ldr	r0, [r0, #8]
   89a24:	1a00000c 	bne	89a5c <mixerengine::BeatEffectManager::setBeatEffectPercent(long, bool)+0x54>
   89a28:	e5903000 	ldr	r3, [r0]
   89a2c:	e3a01004 	mov	r1, #4
   89a30:	ee182a10 	vmov	r2, s16
   89a34:	e593300c 	ldr	r3, [r3, #12]
   89a38:	e12fff33 	blx	r3
   89a3c:	e594000c 	ldr	r0, [r4, #12]
   89a40:	e3a01004 	mov	r1, #4
   89a44:	ee182a10 	vmov	r2, s16
   89a48:	e5903000 	ldr	r3, [r0]
   89a4c:	e593300c 	ldr	r3, [r3, #12]
   89a50:	e12fff33 	blx	r3
   89a54:	ecbd8b02 	vpop	{d8}
   89a58:	e8bd8010 	pop	{r4, pc}
   89a5c:	e5903000 	ldr	r3, [r0]
   89a60:	ee182a10 	vmov	r2, s16
   89a64:	e3a01005 	mov	r1, #5
   89a68:	e593300c 	ldr	r3, [r3, #12]
   89a6c:	e12fff33 	blx	r3
   89a70:	e594000c 	ldr	r0, [r4, #12]
   89a74:	e3a01005 	mov	r1, #5
   89a78:	ee182a10 	vmov	r2, s16
   89a7c:	e5903000 	ldr	r3, [r0]
   89a80:	e593300c 	ldr	r3, [r3, #12]
   89a84:	e12fff33 	blx	r3
   89a88:	eafffff1 	b	89a54 <mixerengine::BeatEffectManager::setBeatEffectPercent(long, bool)+0x4c>

00089a8c <mixerengine::BeatEffectManager::getBeatEffectPercent() const>:
   89a8c:	e5903008 	ldr	r3, [r0, #8]
   89a90:	e5930030 	ldr	r0, [r3, #48]	@ 0x30
   89a94:	e12fff1e 	bx	lr

00089a98 <mixerengine::BeatEffectManager::getBeatEffectMaxPercent() const>:
   89a98:	e5903008 	ldr	r3, [r0, #8]
   89a9c:	e5930034 	ldr	r0, [r3, #52]	@ 0x34
   89aa0:	e12fff1e 	bx	lr

00089aa4 <mixerengine::BeatEffectManager::getBeatEffectMinPercent() const>:
   89aa4:	e5903008 	ldr	r3, [r0, #8]
   89aa8:	e5930038 	ldr	r0, [r3, #56]	@ 0x38
   89aac:	e12fff1e 	bx	lr

00089ab0 <mixerengine::BeatEffectManager::setBeatEffectLevelDepth(float)>:
   89ab0:	e58010e8 	str	r1, [r0, #232]	@ 0xe8
   89ab4:	e12fff1e 	bx	lr

00089ab8 <mixerengine::BeatEffectManager::getBeatEffectLevelDepth() const>:
   89ab8:	e5903008 	ldr	r3, [r0, #8]
   89abc:	e5930020 	ldr	r0, [r3, #32]
   89ac0:	e12fff1e 	bx	lr

00089ac4 <mixerengine::BeatEffectManager::setBeatEffectType(djengine::EnBeatEffectType)>:
   89ac4:	e5801050 	str	r1, [r0, #80]	@ 0x50
   89ac8:	e12fff1e 	bx	lr

00089acc <mixerengine::BeatEffectManager::getBeatEffectType() const>:
   89acc:	e5900050 	ldr	r0, [r0, #80]	@ 0x50
   89ad0:	e12fff1e 	bx	lr

00089ad4 <mixerengine::BeatEffectManager::setBeatEffectBeatButton(djengine::EnBeatButtonType, bool)>:
   89ad4:	e3520000 	cmp	r2, #0
   89ad8:	e58010e4 	str	r1, [r0, #228]	@ 0xe4
   89adc:	15903008 	ldrne	r3, [r0, #8]
   89ae0:	1a000005 	bne	89afc <mixerengine::BeatEffectManager::setBeatEffectBeatButton(djengine::EnBeatButtonType, bool)+0x28>
   89ae4:	e351000b 	cmp	r1, #11
   89ae8:	e58010e0 	str	r1, [r0, #224]	@ 0xe0
   89aec:	e5903008 	ldr	r3, [r0, #8]
   89af0:	9590000c 	ldrls	r0, [r0, #12]
   89af4:	95831044 	strls	r1, [r3, #68]	@ 0x44
   89af8:	95801044 	strls	r1, [r0, #68]	@ 0x44
   89afc:	e5c32051 	strb	r2, [r3, #81]	@ 0x51
   89b00:	e12fff1e 	bx	lr

00089b04 <mixerengine::BeatEffectManager::getBeatEffectBeatButton() const>:
   89b04:	e5903008 	ldr	r3, [r0, #8]
   89b08:	e5930044 	ldr	r0, [r3, #68]	@ 0x44
   89b0c:	e12fff1e 	bx	lr

00089b10 <mixerengine::BeatEffectManager::getBeatEffectMaxBeatButton() const>:
   89b10:	e5903008 	ldr	r3, [r0, #8]
   89b14:	e5930048 	ldr	r0, [r3, #72]	@ 0x48
   89b18:	e12fff1e 	bx	lr

00089b1c <mixerengine::BeatEffectManager::getBeatEffectMinBeatButton() const>:
   89b1c:	e5903008 	ldr	r3, [r0, #8]
   89b20:	e593004c 	ldr	r0, [r3, #76]	@ 0x4c
   89b24:	e12fff1e 	bx	lr

00089b28 <mixerengine::BeatEffectManager::setBeatEffectXpadLinear(long)>:
   89b28:	e92d4010 	push	{r4, lr}
   89b2c:	ee071a90 	vmov	s15, r1
   89b30:	ed2d8b02 	vpush	{d8}
   89b34:	eeb88ae7 	vcvt.f32.s32	s16, s15
   89b38:	e1a04000 	mov	r4, r0
   89b3c:	e5900008 	ldr	r0, [r0, #8]
   89b40:	e3a01006 	mov	r1, #6
   89b44:	e5903000 	ldr	r3, [r0]
   89b48:	ee182a10 	vmov	r2, s16
   89b4c:	e5933014 	ldr	r3, [r3, #20]
   89b50:	e12fff33 	blx	r3
   89b54:	e594000c 	ldr	r0, [r4, #12]
   89b58:	e3a01006 	mov	r1, #6
   89b5c:	ee182a10 	vmov	r2, s16
   89b60:	e5903000 	ldr	r3, [r0]
   89b64:	e5933014 	ldr	r3, [r3, #20]
   89b68:	e12fff33 	blx	r3
   89b6c:	ecbd8b02 	vpop	{d8}
   89b70:	e8bd8010 	pop	{r4, pc}

00089b74 <mixerengine::BeatEffectManager::setQuantizeOnOff(bool)>:
   89b74:	e5d030ec 	ldrb	r3, [r0, #236]	@ 0xec
   89b78:	e1530001 	cmp	r3, r1
   89b7c:	15c010ec 	strbne	r1, [r0, #236]	@ 0xec
   89b80:	e12fff1e 	bx	lr

00089b84 <mixerengine::BeatEffectManager::initBeatEffect(unsigned long, int)>:
   89b84:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
   89b88:	ed2d8b02 	vpush	{d8}
   89b8c:	e1a04000 	mov	r4, r0
   89b90:	e5900058 	ldr	r0, [r0, #88]	@ 0x58
   89b94:	e1a05001 	mov	r5, r1
   89b98:	e1a06002 	mov	r6, r2
   89b9c:	e3500000 	cmp	r0, #0
   89ba0:	0a000000 	beq	89ba8 <mixerengine::BeatEffectManager::initBeatEffect(unsigned long, int)+0x24>
   89ba4:	ebfe1530 	bl	f06c <operator delete[](void*)@plt>
   89ba8:	e1a00186 	lsl	r0, r6, #3
   89bac:	ebfe13bd 	bl	eaa8 <operator new[](unsigned int)@plt>
   89bb0:	e2563001 	subs	r3, r6, #1
   89bb4:	3a000005 	bcc	89bd0 <mixerengine::BeatEffectManager::initBeatEffect(unsigned long, int)+0x4c>
   89bb8:	e1a02000 	mov	r2, r0
   89bbc:	eddf0bb7 	vldr	d16, [pc, #732]	@ 89ea0 <mixerengine::BeatEffectManager::initBeatEffect(unsigned long, int)+0x31c>
   89bc0:	e2433001 	sub	r3, r3, #1
   89bc4:	ece20b02 	vstmia	r2!, {d16}
   89bc8:	e3730001 	cmn	r3, #1
   89bcc:	1afffffb 	bne	89bc0 <mixerengine::BeatEffectManager::initBeatEffect(unsigned long, int)+0x3c>
   89bd0:	e5942010 	ldr	r2, [r4, #16]
   89bd4:	e30a3c44 	movw	r3, #44100	@ 0xac44
   89bd8:	e1550003 	cmp	r5, r3
   89bdc:	e5840058 	str	r0, [r4, #88]	@ 0x58
   89be0:	030377c6 	movweq	r7, #14278	@ 0x37c6
   89be4:	e5825004 	str	r5, [r2, #4]
   89be8:	e5826010 	str	r6, [r2, #16]
   89bec:	034377be 	movteq	r7, #14270	@ 0x37be
   89bf0:	e5923000 	ldr	r3, [r2]
   89bf4:	0a000002 	beq	89c04 <mixerengine::BeatEffectManager::initBeatEffect(unsigned long, int)+0x80>
   89bf8:	e3550000 	cmp	r5, #0
   89bfc:	03a07000 	moveq	r7, #0
   89c00:	1a0000a8 	bne	89ea8 <mixerengine::BeatEffectManager::initBeatEffect(unsigned long, int)+0x324>
   89c04:	e1a00002 	mov	r0, r2
   89c08:	e582700c 	str	r7, [r2, #12]
   89c0c:	e5933010 	ldr	r3, [r3, #16]
   89c10:	e12fff33 	blx	r3
   89c14:	e5943014 	ldr	r3, [r4, #20]
   89c18:	e5932000 	ldr	r2, [r3]
   89c1c:	e1a00003 	mov	r0, r3
   89c20:	e583700c 	str	r7, [r3, #12]
   89c24:	e5835004 	str	r5, [r3, #4]
   89c28:	e5836010 	str	r6, [r3, #16]
   89c2c:	e5923010 	ldr	r3, [r2, #16]
   89c30:	e12fff33 	blx	r3
   89c34:	e5943018 	ldr	r3, [r4, #24]
   89c38:	e5932000 	ldr	r2, [r3]
   89c3c:	e1a00003 	mov	r0, r3
   89c40:	e583700c 	str	r7, [r3, #12]
   89c44:	e5835004 	str	r5, [r3, #4]
   89c48:	e5836010 	str	r6, [r3, #16]
   89c4c:	e5923010 	ldr	r3, [r2, #16]
   89c50:	e12fff33 	blx	r3
   89c54:	e594301c 	ldr	r3, [r4, #28]
   89c58:	e5932000 	ldr	r2, [r3]
   89c5c:	e1a00003 	mov	r0, r3
   89c60:	e583700c 	str	r7, [r3, #12]
   89c64:	e5835004 	str	r5, [r3, #4]
   89c68:	e5836010 	str	r6, [r3, #16]
   89c6c:	e5923010 	ldr	r3, [r2, #16]
   89c70:	e12fff33 	blx	r3
   89c74:	e5943020 	ldr	r3, [r4, #32]
   89c78:	e5932000 	ldr	r2, [r3]
   89c7c:	e1a00003 	mov	r0, r3
   89c80:	e583700c 	str	r7, [r3, #12]
   89c84:	e5835004 	str	r5, [r3, #4]
   89c88:	e5836010 	str	r6, [r3, #16]
   89c8c:	e5923010 	ldr	r3, [r2, #16]
   89c90:	e12fff33 	blx	r3
   89c94:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
   89c98:	e5932000 	ldr	r2, [r3]
   89c9c:	e1a00003 	mov	r0, r3
   89ca0:	e583700c 	str	r7, [r3, #12]
   89ca4:	e5835004 	str	r5, [r3, #4]
   89ca8:	e5836010 	str	r6, [r3, #16]
   89cac:	e5923010 	ldr	r3, [r2, #16]
   89cb0:	e12fff33 	blx	r3
   89cb4:	e5943028 	ldr	r3, [r4, #40]	@ 0x28
   89cb8:	e5932000 	ldr	r2, [r3]
   89cbc:	e1a00003 	mov	r0, r3
   89cc0:	e583700c 	str	r7, [r3, #12]
   89cc4:	e5835004 	str	r5, [r3, #4]
   89cc8:	e5836010 	str	r6, [r3, #16]
   89ccc:	e5923010 	ldr	r3, [r2, #16]
   89cd0:	e12fff33 	blx	r3
   89cd4:	e594302c 	ldr	r3, [r4, #44]	@ 0x2c
   89cd8:	e5932000 	ldr	r2, [r3]
   89cdc:	e1a00003 	mov	r0, r3
   89ce0:	e583700c 	str	r7, [r3, #12]
   89ce4:	e5835004 	str	r5, [r3, #4]
   89ce8:	e5836010 	str	r6, [r3, #16]
   89cec:	e5923010 	ldr	r3, [r2, #16]
   89cf0:	e12fff33 	blx	r3
   89cf4:	e5943030 	ldr	r3, [r4, #48]	@ 0x30
   89cf8:	e5932000 	ldr	r2, [r3]
   89cfc:	e1a00003 	mov	r0, r3
   89d00:	e583700c 	str	r7, [r3, #12]
   89d04:	e5835004 	str	r5, [r3, #4]
   89d08:	e5836010 	str	r6, [r3, #16]
   89d0c:	e5923010 	ldr	r3, [r2, #16]
   89d10:	e12fff33 	blx	r3
   89d14:	e5943034 	ldr	r3, [r4, #52]	@ 0x34
   89d18:	e5932000 	ldr	r2, [r3]
   89d1c:	e1a00003 	mov	r0, r3
   89d20:	e583700c 	str	r7, [r3, #12]
   89d24:	e5835004 	str	r5, [r3, #4]
   89d28:	e5836010 	str	r6, [r3, #16]
   89d2c:	e5923010 	ldr	r3, [r2, #16]
   89d30:	e12fff33 	blx	r3
   89d34:	e5943038 	ldr	r3, [r4, #56]	@ 0x38
   89d38:	e5932000 	ldr	r2, [r3]
   89d3c:	e1a00003 	mov	r0, r3
   89d40:	e583700c 	str	r7, [r3, #12]
   89d44:	e5835004 	str	r5, [r3, #4]
   89d48:	e5836010 	str	r6, [r3, #16]
   89d4c:	e5923010 	ldr	r3, [r2, #16]
   89d50:	e12fff33 	blx	r3
   89d54:	e5943044 	ldr	r3, [r4, #68]	@ 0x44
   89d58:	e5932000 	ldr	r2, [r3]
   89d5c:	e1a00003 	mov	r0, r3
   89d60:	e583700c 	str	r7, [r3, #12]
   89d64:	e5835004 	str	r5, [r3, #4]
   89d68:	e5836010 	str	r6, [r3, #16]
   89d6c:	e5923010 	ldr	r3, [r2, #16]
   89d70:	e12fff33 	blx	r3
   89d74:	e594303c 	ldr	r3, [r4, #60]	@ 0x3c
   89d78:	e5932000 	ldr	r2, [r3]
   89d7c:	e1a00003 	mov	r0, r3
   89d80:	e583700c 	str	r7, [r3, #12]
   89d84:	e5835004 	str	r5, [r3, #4]
   89d88:	e5836010 	str	r6, [r3, #16]
   89d8c:	e5923010 	ldr	r3, [r2, #16]
   89d90:	e12fff33 	blx	r3
   89d94:	e5943040 	ldr	r3, [r4, #64]	@ 0x40
   89d98:	e5932000 	ldr	r2, [r3]
   89d9c:	e1a00003 	mov	r0, r3
   89da0:	e583700c 	str	r7, [r3, #12]
   89da4:	e5835004 	str	r5, [r3, #4]
   89da8:	e5836010 	str	r6, [r3, #16]
   89dac:	e5923010 	ldr	r3, [r2, #16]
   89db0:	e12fff33 	blx	r3
   89db4:	e5940048 	ldr	r0, [r4, #72]	@ 0x48
   89db8:	e580700c 	str	r7, [r0, #12]
   89dbc:	e5805004 	str	r5, [r0, #4]
   89dc0:	e5806010 	str	r6, [r0, #16]
   89dc4:	e5903000 	ldr	r3, [r0]
   89dc8:	e5933010 	ldr	r3, [r3, #16]
   89dcc:	e12fff33 	blx	r3
   89dd0:	e594001c 	ldr	r0, [r4, #28]
   89dd4:	e5903000 	ldr	r3, [r0]
   89dd8:	e5933030 	ldr	r3, [r3, #48]	@ 0x30
   89ddc:	e12fff33 	blx	r3
   89de0:	e2505000 	subs	r5, r0, #0
   89de4:	0a000029 	beq	89e90 <mixerengine::BeatEffectManager::initBeatEffect(unsigned long, int)+0x30c>
   89de8:	e5940054 	ldr	r0, [r4, #84]	@ 0x54
   89dec:	e3500000 	cmp	r0, #0
   89df0:	0a000000 	beq	89df8 <mixerengine::BeatEffectManager::initBeatEffect(unsigned long, int)+0x274>
   89df4:	ebfe149c 	bl	f06c <operator delete[](void*)@plt>
   89df8:	e1a00185 	lsl	r0, r5, #3
   89dfc:	ebfe1329 	bl	eaa8 <operator new[](unsigned int)@plt>
   89e00:	e2553001 	subs	r3, r5, #1
   89e04:	3a000005 	bcc	89e20 <mixerengine::BeatEffectManager::initBeatEffect(unsigned long, int)+0x29c>
   89e08:	e1a02000 	mov	r2, r0
   89e0c:	eddf0b23 	vldr	d16, [pc, #140]	@ 89ea0 <mixerengine::BeatEffectManager::initBeatEffect(unsigned long, int)+0x31c>
   89e10:	e2433001 	sub	r3, r3, #1
   89e14:	ece20b02 	vstmia	r2!, {d16}
   89e18:	e3730001 	cmn	r3, #1
   89e1c:	1afffffb 	bne	89e10 <mixerengine::BeatEffectManager::initBeatEffect(unsigned long, int)+0x28c>
   89e20:	e594201c 	ldr	r2, [r4, #28]
   89e24:	e5840054 	str	r0, [r4, #84]	@ 0x54
   89e28:	e5820018 	str	r0, [r2, #24]
   89e2c:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
   89e30:	e5941054 	ldr	r1, [r4, #84]	@ 0x54
   89e34:	e582501c 	str	r5, [r2, #28]
   89e38:	e583501c 	str	r5, [r3, #28]
   89e3c:	e5831018 	str	r1, [r3, #24]
   89e40:	e5943028 	ldr	r3, [r4, #40]	@ 0x28
   89e44:	e5942054 	ldr	r2, [r4, #84]	@ 0x54
   89e48:	e583501c 	str	r5, [r3, #28]
   89e4c:	e5832018 	str	r2, [r3, #24]
   89e50:	e5943034 	ldr	r3, [r4, #52]	@ 0x34
   89e54:	e5942054 	ldr	r2, [r4, #84]	@ 0x54
   89e58:	e583501c 	str	r5, [r3, #28]
   89e5c:	e5832018 	str	r2, [r3, #24]
   89e60:	e5943044 	ldr	r3, [r4, #68]	@ 0x44
   89e64:	e5942054 	ldr	r2, [r4, #84]	@ 0x54
   89e68:	e583501c 	str	r5, [r3, #28]
   89e6c:	e5832018 	str	r2, [r3, #24]
   89e70:	e5943040 	ldr	r3, [r4, #64]	@ 0x40
   89e74:	e5942054 	ldr	r2, [r4, #84]	@ 0x54
   89e78:	e583501c 	str	r5, [r3, #28]
   89e7c:	e5832018 	str	r2, [r3, #24]
   89e80:	e5943048 	ldr	r3, [r4, #72]	@ 0x48
   89e84:	e5942054 	ldr	r2, [r4, #84]	@ 0x54
   89e88:	e583501c 	str	r5, [r3, #28]
   89e8c:	e5832018 	str	r2, [r3, #24]
   89e90:	e3a03000 	mov	r3, #0
   89e94:	e5843088 	str	r3, [r4, #136]	@ 0x88
   89e98:	ecbd8b02 	vpop	{d8}
   89e9c:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
	...
   89ea8:	ee075a10 	vmov	s14, r5
   89eac:	eef87a47 	vcvt.f32.u32	s15, s14
   89eb0:	e1a00002 	mov	r0, r2
   89eb4:	e5933010 	ldr	r3, [r3, #16]
   89eb8:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   89ebc:	ee878a27 	vdiv.f32	s16, s14, s15
   89ec0:	ed828a03 	vstr	s16, [r2, #12]
   89ec4:	e12fff33 	blx	r3
   89ec8:	e5943014 	ldr	r3, [r4, #20]
   89ecc:	ed838a03 	vstr	s16, [r3, #12]
   89ed0:	e5932000 	ldr	r2, [r3]
   89ed4:	e1a00003 	mov	r0, r3
   89ed8:	e5835004 	str	r5, [r3, #4]
   89edc:	e5836010 	str	r6, [r3, #16]
   89ee0:	e5923010 	ldr	r3, [r2, #16]
   89ee4:	e12fff33 	blx	r3
   89ee8:	e5943018 	ldr	r3, [r4, #24]
   89eec:	ed838a03 	vstr	s16, [r3, #12]
   89ef0:	e5932000 	ldr	r2, [r3]
   89ef4:	e1a00003 	mov	r0, r3
   89ef8:	e5835004 	str	r5, [r3, #4]
   89efc:	e5836010 	str	r6, [r3, #16]
   89f00:	e5923010 	ldr	r3, [r2, #16]
   89f04:	e12fff33 	blx	r3
   89f08:	e594301c 	ldr	r3, [r4, #28]
   89f0c:	ed838a03 	vstr	s16, [r3, #12]
   89f10:	e5932000 	ldr	r2, [r3]
   89f14:	e1a00003 	mov	r0, r3
   89f18:	e5835004 	str	r5, [r3, #4]
   89f1c:	e5836010 	str	r6, [r3, #16]
   89f20:	e5923010 	ldr	r3, [r2, #16]
   89f24:	e12fff33 	blx	r3
   89f28:	e5943020 	ldr	r3, [r4, #32]
   89f2c:	ed838a03 	vstr	s16, [r3, #12]
   89f30:	e5932000 	ldr	r2, [r3]
   89f34:	e1a00003 	mov	r0, r3
   89f38:	e5835004 	str	r5, [r3, #4]
   89f3c:	e5836010 	str	r6, [r3, #16]
   89f40:	e5923010 	ldr	r3, [r2, #16]
   89f44:	e12fff33 	blx	r3
   89f48:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
   89f4c:	ed838a03 	vstr	s16, [r3, #12]
   89f50:	e5932000 	ldr	r2, [r3]
   89f54:	e1a00003 	mov	r0, r3
   89f58:	e5835004 	str	r5, [r3, #4]
   89f5c:	e5836010 	str	r6, [r3, #16]
   89f60:	e5923010 	ldr	r3, [r2, #16]
   89f64:	e12fff33 	blx	r3
   89f68:	e5943028 	ldr	r3, [r4, #40]	@ 0x28
   89f6c:	ed838a03 	vstr	s16, [r3, #12]
   89f70:	e5932000 	ldr	r2, [r3]
   89f74:	e1a00003 	mov	r0, r3
   89f78:	e5835004 	str	r5, [r3, #4]
   89f7c:	e5836010 	str	r6, [r3, #16]
   89f80:	e5923010 	ldr	r3, [r2, #16]
   89f84:	e12fff33 	blx	r3
   89f88:	e594302c 	ldr	r3, [r4, #44]	@ 0x2c
   89f8c:	ed838a03 	vstr	s16, [r3, #12]
   89f90:	e5932000 	ldr	r2, [r3]
   89f94:	e1a00003 	mov	r0, r3
   89f98:	e5835004 	str	r5, [r3, #4]
   89f9c:	e5836010 	str	r6, [r3, #16]
   89fa0:	e5923010 	ldr	r3, [r2, #16]
   89fa4:	e12fff33 	blx	r3
   89fa8:	e5943030 	ldr	r3, [r4, #48]	@ 0x30
   89fac:	ed838a03 	vstr	s16, [r3, #12]
   89fb0:	e5932000 	ldr	r2, [r3]
   89fb4:	e1a00003 	mov	r0, r3
   89fb8:	e5835004 	str	r5, [r3, #4]
   89fbc:	e5836010 	str	r6, [r3, #16]
   89fc0:	e5923010 	ldr	r3, [r2, #16]
   89fc4:	e12fff33 	blx	r3
   89fc8:	e5943034 	ldr	r3, [r4, #52]	@ 0x34
   89fcc:	ed838a03 	vstr	s16, [r3, #12]
   89fd0:	e5932000 	ldr	r2, [r3]
   89fd4:	e1a00003 	mov	r0, r3
   89fd8:	e5835004 	str	r5, [r3, #4]
   89fdc:	e5836010 	str	r6, [r3, #16]
   89fe0:	e5923010 	ldr	r3, [r2, #16]
   89fe4:	e12fff33 	blx	r3
   89fe8:	e5943038 	ldr	r3, [r4, #56]	@ 0x38
   89fec:	ed838a03 	vstr	s16, [r3, #12]
   89ff0:	e5932000 	ldr	r2, [r3]
   89ff4:	e1a00003 	mov	r0, r3
   89ff8:	e5835004 	str	r5, [r3, #4]
   89ffc:	e5836010 	str	r6, [r3, #16]
   8a000:	e5923010 	ldr	r3, [r2, #16]
   8a004:	e12fff33 	blx	r3
   8a008:	e5943044 	ldr	r3, [r4, #68]	@ 0x44
   8a00c:	ed838a03 	vstr	s16, [r3, #12]
   8a010:	e5932000 	ldr	r2, [r3]
   8a014:	e1a00003 	mov	r0, r3
   8a018:	e5835004 	str	r5, [r3, #4]
   8a01c:	e5836010 	str	r6, [r3, #16]
   8a020:	e5923010 	ldr	r3, [r2, #16]
   8a024:	e12fff33 	blx	r3
   8a028:	e594303c 	ldr	r3, [r4, #60]	@ 0x3c
   8a02c:	ed838a03 	vstr	s16, [r3, #12]
   8a030:	e5932000 	ldr	r2, [r3]
   8a034:	e1a00003 	mov	r0, r3
   8a038:	e5835004 	str	r5, [r3, #4]
   8a03c:	e5836010 	str	r6, [r3, #16]
   8a040:	e5923010 	ldr	r3, [r2, #16]
   8a044:	e12fff33 	blx	r3
   8a048:	e5943040 	ldr	r3, [r4, #64]	@ 0x40
   8a04c:	ed838a03 	vstr	s16, [r3, #12]
   8a050:	e5932000 	ldr	r2, [r3]
   8a054:	e1a00003 	mov	r0, r3
   8a058:	e5835004 	str	r5, [r3, #4]
   8a05c:	e5836010 	str	r6, [r3, #16]
   8a060:	e5923010 	ldr	r3, [r2, #16]
   8a064:	e12fff33 	blx	r3
   8a068:	e5940048 	ldr	r0, [r4, #72]	@ 0x48
   8a06c:	ed808a03 	vstr	s16, [r0, #12]
   8a070:	e5805004 	str	r5, [r0, #4]
   8a074:	e5806010 	str	r6, [r0, #16]
   8a078:	eaffff51 	b	89dc4 <mixerengine::BeatEffectManager::initBeatEffect(unsigned long, int)+0x240>

0008a07c <mixerengine::BeatEffectManager::switchNextBeatEffect()>:
   8a07c:	e590204c 	ldr	r2, [r0, #76]	@ 0x4c
   8a080:	e5903050 	ldr	r3, [r0, #80]	@ 0x50
   8a084:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   8a088:	e1520003 	cmp	r2, r3
   8a08c:	e1a04000 	mov	r4, r0
   8a090:	08bd81f0 	popeq	{r4, r5, r6, r7, r8, pc}
   8a094:	e5906008 	ldr	r6, [r0, #8]
   8a098:	e3520007 	cmp	r2, #7
   8a09c:	e5968020 	ldr	r8, [r6, #32]
   8a0a0:	9a000017 	bls	8a104 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x88>
   8a0a4:	e3a02000 	mov	r2, #0
   8a0a8:	e5941010 	ldr	r1, [r4, #16]
   8a0ac:	e584304c 	str	r3, [r4, #76]	@ 0x4c
   8a0b0:	e1560001 	cmp	r6, r1
   8a0b4:	0594700c 	ldreq	r7, [r4, #12]
   8a0b8:	11a07006 	movne	r7, r6
   8a0bc:	e353000e 	cmp	r3, #14
   8a0c0:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
   8a0c4:	ea0000b6 	b	8a3a4 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x328>
   8a0c8:	0008a374 	.word	0x0008a374
   8a0cc:	0008a368 	.word	0x0008a368
   8a0d0:	0008a35c 	.word	0x0008a35c
   8a0d4:	0008a350 	.word	0x0008a350
   8a0d8:	0008a344 	.word	0x0008a344
   8a0dc:	0008a338 	.word	0x0008a338
   8a0e0:	0008a32c 	.word	0x0008a32c
   8a0e4:	0008a320 	.word	0x0008a320
   8a0e8:	0008a314 	.word	0x0008a314
   8a0ec:	0008a308 	.word	0x0008a308
   8a0f0:	0008a2fc 	.word	0x0008a2fc
   8a0f4:	0008a2f0 	.word	0x0008a2f0
   8a0f8:	0008a2e4 	.word	0x0008a2e4
   8a0fc:	0008a2d8 	.word	0x0008a2d8
   8a100:	0008a11c 	.word	0x0008a11c
   8a104:	e3a01001 	mov	r1, #1
   8a108:	e1a02211 	lsl	r2, r1, r2
   8a10c:	e31200e2 	tst	r2, #226	@ 0xe2
   8a110:	11a02001 	movne	r2, r1
   8a114:	1affffe3 	bne	8a0a8 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x2c>
   8a118:	eaffffe1 	b	8a0a4 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x28>
   8a11c:	e5945040 	ldr	r5, [r4, #64]	@ 0x40
   8a120:	e584100c 	str	r1, [r4, #12]
   8a124:	e1560001 	cmp	r6, r1
   8a128:	0a0000c1 	beq	8a434 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x3b8>
   8a12c:	e1510005 	cmp	r1, r5
   8a130:	0a0000bf 	beq	8a434 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x3b8>
   8a134:	e1570005 	cmp	r7, r5
   8a138:	0a000015 	beq	8a194 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x118>
   8a13c:	e3520000 	cmp	r2, #0
   8a140:	e5973004 	ldr	r3, [r7, #4]
   8a144:	1a0000c3 	bne	8a458 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x3dc>
   8a148:	e30a2c44 	movw	r2, #44100	@ 0xac44
   8a14c:	e1530002 	cmp	r3, r2
   8a150:	030337c6 	movweq	r3, #14278	@ 0x37c6
   8a154:	034337be 	movteq	r3, #14270	@ 0x37be
   8a158:	0587300c 	streq	r3, [r7, #12]
   8a15c:	0a000007 	beq	8a180 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x104>
   8a160:	e3530000 	cmp	r3, #0
   8a164:	1e073a10 	vmovne	s14, r3
   8a168:	1ef87a47 	vcvtne.f32.u32	s15, s14
   8a16c:	03a03000 	moveq	r3, #0
   8a170:	0587300c 	streq	r3, [r7, #12]
   8a174:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   8a178:	1ec77a27 	vdivne.f32	s15, s14, s15
   8a17c:	1dc77a03 	vstrne	s15, [r7, #12]
   8a180:	e5973000 	ldr	r3, [r7]
   8a184:	e1a00007 	mov	r0, r7
   8a188:	e5933010 	ldr	r3, [r3, #16]
   8a18c:	e12fff33 	blx	r3
   8a190:	e5941010 	ldr	r1, [r4, #16]
   8a194:	e595c024 	ldr	ip, [r5, #36]	@ 0x24
   8a198:	e1a00001 	mov	r0, r1
   8a19c:	e5d420ec 	ldrb	r2, [r4, #236]	@ 0xec
   8a1a0:	e5913000 	ldr	r3, [r1]
   8a1a4:	e581c024 	str	ip, [r1, #36]	@ 0x24
   8a1a8:	e595c028 	ldr	ip, [r5, #40]	@ 0x28
   8a1ac:	e5933018 	ldr	r3, [r3, #24]
   8a1b0:	e581c028 	str	ip, [r1, #40]	@ 0x28
   8a1b4:	e595c02c 	ldr	ip, [r5, #44]	@ 0x2c
   8a1b8:	e581c02c 	str	ip, [r1, #44]	@ 0x2c
   8a1bc:	e595c030 	ldr	ip, [r5, #48]	@ 0x30
   8a1c0:	e581c030 	str	ip, [r1, #48]	@ 0x30
   8a1c4:	e595c034 	ldr	ip, [r5, #52]	@ 0x34
   8a1c8:	e581c034 	str	ip, [r1, #52]	@ 0x34
   8a1cc:	e595c038 	ldr	ip, [r5, #56]	@ 0x38
   8a1d0:	e581c038 	str	ip, [r1, #56]	@ 0x38
   8a1d4:	e595c048 	ldr	ip, [r5, #72]	@ 0x48
   8a1d8:	e581c048 	str	ip, [r1, #72]	@ 0x48
   8a1dc:	e595c04c 	ldr	ip, [r5, #76]	@ 0x4c
   8a1e0:	e581c04c 	str	ip, [r1, #76]	@ 0x4c
   8a1e4:	e5951044 	ldr	r1, [r5, #68]	@ 0x44
   8a1e8:	e12fff33 	blx	r3
   8a1ec:	e5953000 	ldr	r3, [r5]
   8a1f0:	e1a02008 	mov	r2, r8
   8a1f4:	e1a00005 	mov	r0, r5
   8a1f8:	e3a01002 	mov	r1, #2
   8a1fc:	e593300c 	ldr	r3, [r3, #12]
   8a200:	e12fff33 	blx	r3
   8a204:	e5943010 	ldr	r3, [r4, #16]
   8a208:	e5d5203c 	ldrb	r2, [r5, #60]	@ 0x3c
   8a20c:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
   8a210:	e3520000 	cmp	r2, #0
   8a214:	e58430e0 	str	r3, [r4, #224]	@ 0xe0
   8a218:	e58430e4 	str	r3, [r4, #228]	@ 0xe4
   8a21c:	0a000065 	beq	8a3b8 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x33c>
   8a220:	e5953000 	ldr	r3, [r5]
   8a224:	e1a00005 	mov	r0, r5
   8a228:	e5845008 	str	r5, [r4, #8]
   8a22c:	e5933028 	ldr	r3, [r3, #40]	@ 0x28
   8a230:	e12fff33 	blx	r3
   8a234:	e5940008 	ldr	r0, [r4, #8]
   8a238:	e59410e0 	ldr	r1, [r4, #224]	@ 0xe0
   8a23c:	e5903044 	ldr	r3, [r0, #68]	@ 0x44
   8a240:	e1530001 	cmp	r3, r1
   8a244:	0a000005 	beq	8a260 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x1e4>
   8a248:	e5903000 	ldr	r3, [r0]
   8a24c:	e5d420ec 	ldrb	r2, [r4, #236]	@ 0xec
   8a250:	e5933018 	ldr	r3, [r3, #24]
   8a254:	e12fff33 	blx	r3
   8a258:	e5940008 	ldr	r0, [r4, #8]
   8a25c:	e59410e0 	ldr	r1, [r4, #224]	@ 0xe0
   8a260:	e590304c 	ldr	r3, [r0, #76]	@ 0x4c
   8a264:	e5902048 	ldr	r2, [r0, #72]	@ 0x48
   8a268:	e1510003 	cmp	r1, r3
   8a26c:	b58430e4 	strlt	r3, [r4, #228]	@ 0xe4
   8a270:	ba000001 	blt	8a27c <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x200>
   8a274:	e1510002 	cmp	r1, r2
   8a278:	c58420e4 	strgt	r2, [r4, #228]	@ 0xe4
   8a27c:	edd41b18 	vldr	d17, [r4, #96]	@ 0x60
   8a280:	edd42b1c 	vldr	d18, [r4, #112]	@ 0x70
   8a284:	f2421da1 	vadd.f32	d17, d18, d17
   8a288:	e5d6203c 	ldrb	r2, [r6, #60]	@ 0x3c
   8a28c:	f2c70f10 	vmov.f32	d16, #1	@ 0x3f800000
   8a290:	e5943080 	ldr	r3, [r4, #128]	@ 0x80
   8a294:	e3520000 	cmp	r2, #0
   8a298:	edc40b1a 	vstr	d16, [r4, #104]	@ 0x68
   8a29c:	f2601da1 	vsub.f32	d17, d16, d17
   8a2a0:	ee823b90 	vdup.32	d18, r3
   8a2a4:	e3a03000 	mov	r3, #0
   8a2a8:	e5843078 	str	r3, [r4, #120]	@ 0x78
   8a2ac:	e5c43084 	strb	r3, [r4, #132]	@ 0x84
   8a2b0:	e3a03002 	mov	r3, #2
   8a2b4:	e5843088 	str	r3, [r4, #136]	@ 0x88
   8a2b8:	f3410db2 	vmul.f32	d16, d17, d18
   8a2bc:	edc40b18 	vstr	d16, [r4, #96]	@ 0x60
   8a2c0:	08bd81f0 	popeq	{r4, r5, r6, r7, r8, pc}
   8a2c4:	e5963000 	ldr	r3, [r6]
   8a2c8:	e1a00006 	mov	r0, r6
   8a2cc:	e593301c 	ldr	r3, [r3, #28]
   8a2d0:	e12fff33 	blx	r3
   8a2d4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
   8a2d8:	e5945034 	ldr	r5, [r4, #52]	@ 0x34
   8a2dc:	e584100c 	str	r1, [r4, #12]
   8a2e0:	eaffff8f 	b	8a124 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xa8>
   8a2e4:	e5945048 	ldr	r5, [r4, #72]	@ 0x48
   8a2e8:	e584100c 	str	r1, [r4, #12]
   8a2ec:	eaffff8c 	b	8a124 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xa8>
   8a2f0:	e5945044 	ldr	r5, [r4, #68]	@ 0x44
   8a2f4:	e584100c 	str	r1, [r4, #12]
   8a2f8:	eaffff89 	b	8a124 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xa8>
   8a2fc:	e594503c 	ldr	r5, [r4, #60]	@ 0x3c
   8a300:	e584100c 	str	r1, [r4, #12]
   8a304:	eaffff86 	b	8a124 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xa8>
   8a308:	e5945038 	ldr	r5, [r4, #56]	@ 0x38
   8a30c:	e584100c 	str	r1, [r4, #12]
   8a310:	eaffff83 	b	8a124 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xa8>
   8a314:	e5945030 	ldr	r5, [r4, #48]	@ 0x30
   8a318:	e584100c 	str	r1, [r4, #12]
   8a31c:	eaffff80 	b	8a124 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xa8>
   8a320:	e594502c 	ldr	r5, [r4, #44]	@ 0x2c
   8a324:	e584100c 	str	r1, [r4, #12]
   8a328:	eaffff7d 	b	8a124 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xa8>
   8a32c:	e5945028 	ldr	r5, [r4, #40]	@ 0x28
   8a330:	e584100c 	str	r1, [r4, #12]
   8a334:	eaffff7a 	b	8a124 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xa8>
   8a338:	e5945024 	ldr	r5, [r4, #36]	@ 0x24
   8a33c:	e584100c 	str	r1, [r4, #12]
   8a340:	eaffff77 	b	8a124 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xa8>
   8a344:	e5945020 	ldr	r5, [r4, #32]
   8a348:	e584100c 	str	r1, [r4, #12]
   8a34c:	eaffff74 	b	8a124 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xa8>
   8a350:	e594501c 	ldr	r5, [r4, #28]
   8a354:	e584100c 	str	r1, [r4, #12]
   8a358:	eaffff71 	b	8a124 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xa8>
   8a35c:	e5945018 	ldr	r5, [r4, #24]
   8a360:	e584100c 	str	r1, [r4, #12]
   8a364:	eaffff6e 	b	8a124 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xa8>
   8a368:	e5945014 	ldr	r5, [r4, #20]
   8a36c:	e584100c 	str	r1, [r4, #12]
   8a370:	eaffff6b 	b	8a124 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xa8>
   8a374:	e1560001 	cmp	r6, r1
   8a378:	0a00002c 	beq	8a430 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x3b4>
   8a37c:	e594300c 	ldr	r3, [r4, #12]
   8a380:	e1560003 	cmp	r6, r3
   8a384:	0a000002 	beq	8a394 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x318>
   8a388:	e1510003 	cmp	r1, r3
   8a38c:	11a05001 	movne	r5, r1
   8a390:	1a000027 	bne	8a434 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x3b8>
   8a394:	e584600c 	str	r6, [r4, #12]
   8a398:	e1a07001 	mov	r7, r1
   8a39c:	e1a05001 	mov	r5, r1
   8a3a0:	eaffff61 	b	8a12c <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xb0>
   8a3a4:	e3a03000 	mov	r3, #0
   8a3a8:	e1a05001 	mov	r5, r1
   8a3ac:	e584100c 	str	r1, [r4, #12]
   8a3b0:	e584304c 	str	r3, [r4, #76]	@ 0x4c
   8a3b4:	eaffff5a 	b	8a124 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xa8>
   8a3b8:	e5953000 	ldr	r3, [r5]
   8a3bc:	e1a00005 	mov	r0, r5
   8a3c0:	e593301c 	ldr	r3, [r3, #28]
   8a3c4:	e12fff33 	blx	r3
   8a3c8:	e5943030 	ldr	r3, [r4, #48]	@ 0x30
   8a3cc:	e1560003 	cmp	r6, r3
   8a3d0:	1affff92 	bne	8a220 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x1a4>
   8a3d4:	e5973004 	ldr	r3, [r7, #4]
   8a3d8:	e30a1c44 	movw	r1, #44100	@ 0xac44
   8a3dc:	e5972010 	ldr	r2, [r7, #16]
   8a3e0:	e1530001 	cmp	r3, r1
   8a3e4:	e5863004 	str	r3, [r6, #4]
   8a3e8:	e5862010 	str	r2, [r6, #16]
   8a3ec:	030337c6 	movweq	r3, #14278	@ 0x37c6
   8a3f0:	034337be 	movteq	r3, #14270	@ 0x37be
   8a3f4:	0586300c 	streq	r3, [r6, #12]
   8a3f8:	0a000007 	beq	8a41c <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x3a0>
   8a3fc:	e3530000 	cmp	r3, #0
   8a400:	1e073a10 	vmovne	s14, r3
   8a404:	1ef87a47 	vcvtne.f32.u32	s15, s14
   8a408:	03a03000 	moveq	r3, #0
   8a40c:	0586300c 	streq	r3, [r6, #12]
   8a410:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   8a414:	1ec77a27 	vdivne.f32	s15, s14, s15
   8a418:	1dc67a03 	vstrne	s15, [r6, #12]
   8a41c:	e5963000 	ldr	r3, [r6]
   8a420:	e1a00006 	mov	r0, r6
   8a424:	e5933010 	ldr	r3, [r3, #16]
   8a428:	e12fff33 	blx	r3
   8a42c:	eaffff7b 	b	8a220 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x1a4>
   8a430:	e1a05006 	mov	r5, r6
   8a434:	e5950044 	ldr	r0, [r5, #68]	@ 0x44
   8a438:	e5963044 	ldr	r3, [r6, #68]	@ 0x44
   8a43c:	e1500003 	cmp	r0, r3
   8a440:	1affff3b 	bne	8a134 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xb8>
   8a444:	e5963024 	ldr	r3, [r6, #36]	@ 0x24
   8a448:	e5950024 	ldr	r0, [r5, #36]	@ 0x24
   8a44c:	e1500003 	cmp	r0, r3
   8a450:	15853024 	strne	r3, [r5, #36]	@ 0x24
   8a454:	eaffff36 	b	8a134 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0xb8>
   8a458:	e5973000 	ldr	r3, [r7]
   8a45c:	e1a00007 	mov	r0, r7
   8a460:	e5933028 	ldr	r3, [r3, #40]	@ 0x28
   8a464:	e12fff33 	blx	r3
   8a468:	e5941010 	ldr	r1, [r4, #16]
   8a46c:	eaffff48 	b	8a194 <mixerengine::BeatEffectManager::switchNextBeatEffect()+0x118>

0008a470 <mixerengine::BeatEffectManager::switchNextBeatButton(bool)>:
   8a470:	e92d4038 	push	{r3, r4, r5, lr}
   8a474:	e1a04000 	mov	r4, r0
   8a478:	e5900008 	ldr	r0, [r0, #8]
   8a47c:	e1a05001 	mov	r5, r1
   8a480:	e5d0303c 	ldrb	r3, [r0, #60]	@ 0x3c
   8a484:	e3530000 	cmp	r3, #0
   8a488:	0a000013 	beq	8a4dc <mixerengine::BeatEffectManager::switchNextBeatButton(bool)+0x6c>
   8a48c:	e59430e4 	ldr	r3, [r4, #228]	@ 0xe4
   8a490:	e590204c 	ldr	r2, [r0, #76]	@ 0x4c
   8a494:	e5901048 	ldr	r1, [r0, #72]	@ 0x48
   8a498:	e1530002 	cmp	r3, r2
   8a49c:	b8bd8038 	poplt	{r3, r4, r5, pc}
   8a4a0:	e1530001 	cmp	r3, r1
   8a4a4:	c8bd8038 	popgt	{r3, r4, r5, pc}
   8a4a8:	e590c000 	ldr	ip, [r0]
   8a4ac:	e1a01003 	mov	r1, r3
   8a4b0:	e58430e0 	str	r3, [r4, #224]	@ 0xe0
   8a4b4:	e1a02005 	mov	r2, r5
   8a4b8:	e59c3018 	ldr	r3, [ip, #24]
   8a4bc:	e12fff33 	blx	r3
   8a4c0:	e594000c 	ldr	r0, [r4, #12]
   8a4c4:	e59410e0 	ldr	r1, [r4, #224]	@ 0xe0
   8a4c8:	e1a02005 	mov	r2, r5
   8a4cc:	e5903000 	ldr	r3, [r0]
   8a4d0:	e5933018 	ldr	r3, [r3, #24]
   8a4d4:	e12fff33 	blx	r3
   8a4d8:	e8bd8038 	pop	{r3, r4, r5, pc}
   8a4dc:	e5943010 	ldr	r3, [r4, #16]
   8a4e0:	e59410e4 	ldr	r1, [r4, #228]	@ 0xe4
   8a4e4:	e593204c 	ldr	r2, [r3, #76]	@ 0x4c
   8a4e8:	e5933048 	ldr	r3, [r3, #72]	@ 0x48
   8a4ec:	e1510002 	cmp	r1, r2
   8a4f0:	b8bd8038 	poplt	{r3, r4, r5, pc}
   8a4f4:	e1510003 	cmp	r1, r3
   8a4f8:	c8bd8038 	popgt	{r3, r4, r5, pc}
   8a4fc:	e590304c 	ldr	r3, [r0, #76]	@ 0x4c
   8a500:	e58410e0 	str	r1, [r4, #224]	@ 0xe0
   8a504:	e1510003 	cmp	r1, r3
   8a508:	e5903048 	ldr	r3, [r0, #72]	@ 0x48
   8a50c:	b8bd8038 	poplt	{r3, r4, r5, pc}
   8a510:	e1510003 	cmp	r1, r3
   8a514:	c8bd8038 	popgt	{r3, r4, r5, pc}
   8a518:	e5903000 	ldr	r3, [r0]
   8a51c:	e1a02005 	mov	r2, r5
   8a520:	e5933018 	ldr	r3, [r3, #24]
   8a524:	eaffffe4 	b	8a4bc <mixerengine::BeatEffectManager::switchNextBeatButton(bool)+0x4c>

0008a528 <mixerengine::BeatEffectManager::notifyBeatEffectBpmChanged(bool)>:
   8a528:	eaffffd0 	b	8a470 <mixerengine::BeatEffectManager::switchNextBeatButton(bool)>

0008a52c <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)>:
   8a52c:	e92d45f8 	push	{r3, r4, r5, r6, r7, r8, sl, lr}
   8a530:	e1a06001 	mov	r6, r1
   8a534:	e5901058 	ldr	r1, [r0, #88]	@ 0x58
   8a538:	e1a04000 	mov	r4, r0
   8a53c:	e1a05002 	mov	r5, r2
   8a540:	e1a07003 	mov	r7, r3
   8a544:	e3510000 	cmp	r1, #0
   8a548:	08bd85f8 	popeq	{r3, r4, r5, r6, r7, r8, sl, pc}
   8a54c:	e5d030ef 	ldrb	r3, [r0, #239]	@ 0xef
   8a550:	e3530000 	cmp	r3, #0
   8a554:	18bd85f8 	popne	{r3, r4, r5, r6, r7, r8, sl, pc}
   8a558:	e5d030ee 	ldrb	r3, [r0, #238]	@ 0xee
   8a55c:	e1530007 	cmp	r3, r7
   8a560:	0a00000d 	beq	8a59c <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x70>
   8a564:	e3570000 	cmp	r7, #0
   8a568:	1a00000a 	bne	8a598 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x6c>
   8a56c:	e590304c 	ldr	r3, [r0, #76]	@ 0x4c
   8a570:	e3530007 	cmp	r3, #7
   8a574:	8a000007 	bhi	8a598 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x6c>
   8a578:	e3a02001 	mov	r2, #1
   8a57c:	e1a03312 	lsl	r3, r2, r3
   8a580:	e31300e2 	tst	r3, #226	@ 0xe2
   8a584:	0a000003 	beq	8a598 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x6c>
   8a588:	e5900008 	ldr	r0, [r0, #8]
   8a58c:	e5903000 	ldr	r3, [r0]
   8a590:	e5933028 	ldr	r3, [r3, #40]	@ 0x28
   8a594:	e12fff33 	blx	r3
   8a598:	e5c470ee 	strb	r7, [r4, #238]	@ 0xee
   8a59c:	e3570000 	cmp	r7, #0
   8a5a0:	1a0000b5 	bne	8a87c <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x350>
   8a5a4:	edd47a3a 	vldr	s15, [r4, #232]	@ 0xe8
   8a5a8:	e5940008 	ldr	r0, [r4, #8]
   8a5ac:	edd06a08 	vldr	s13, [r0, #32]
   8a5b0:	ee776ae6 	vsub.f32	s13, s15, s13
   8a5b4:	ed9f7ae5 	vldr	s14, [pc, #916]	@ 8a950 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x424>
   8a5b8:	eef06ae6 	vabs.f32	s13, s13
   8a5bc:	eef46ac7 	vcmpe.f32	s13, s14
   8a5c0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   8a5c4:	ca000126 	bgt	8aa64 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x538>
   8a5c8:	e59420e0 	ldr	r2, [r4, #224]	@ 0xe0
   8a5cc:	e59430e4 	ldr	r3, [r4, #228]	@ 0xe4
   8a5d0:	e1520003 	cmp	r2, r3
   8a5d4:	0a0000b2 	beq	8a8a4 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x378>
   8a5d8:	e1a00004 	mov	r0, r4
   8a5dc:	e3a01001 	mov	r1, #1
   8a5e0:	ebffffa2 	bl	8a470 <mixerengine::BeatEffectManager::switchNextBeatButton(bool)>
   8a5e4:	e59430e0 	ldr	r3, [r4, #224]	@ 0xe0
   8a5e8:	e5940008 	ldr	r0, [r4, #8]
   8a5ec:	e58430e4 	str	r3, [r4, #228]	@ 0xe4
   8a5f0:	e5943088 	ldr	r3, [r4, #136]	@ 0x88
   8a5f4:	e2432001 	sub	r2, r3, #1
   8a5f8:	e3520001 	cmp	r2, #1
   8a5fc:	9a000028 	bls	8a6a4 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x178>
   8a600:	e5942050 	ldr	r2, [r4, #80]	@ 0x50
   8a604:	e594104c 	ldr	r1, [r4, #76]	@ 0x4c
   8a608:	e1510002 	cmp	r1, r2
   8a60c:	0a00011a 	beq	8aa7c <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x550>
   8a610:	e3530003 	cmp	r3, #3
   8a614:	0a00013e 	beq	8ab14 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x5e8>
   8a618:	e3520000 	cmp	r2, #0
   8a61c:	e3a03001 	mov	r3, #1
   8a620:	e5843088 	str	r3, [r4, #136]	@ 0x88
   8a624:	1a000002 	bne	8a634 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x108>
   8a628:	e5d03050 	ldrb	r3, [r0, #80]	@ 0x50
   8a62c:	e3530000 	cmp	r3, #0
   8a630:	1a000162 	bne	8abc0 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x694>
   8a634:	edd44b24 	vldr	d20, [r4, #144]	@ 0x90
   8a638:	edd41b18 	vldr	d17, [r4, #96]	@ 0x60
   8a63c:	edd40b28 	vldr	d16, [r4, #160]	@ 0xa0
   8a640:	edd42b1c 	vldr	d18, [r4, #112]	@ 0x70
   8a644:	f2404da4 	vadd.f32	d20, d16, d20
   8a648:	e5943080 	ldr	r3, [r4, #128]	@ 0x80
   8a64c:	f2421da1 	vadd.f32	d17, d18, d17
   8a650:	eddf0bbc 	vldr	d16, [pc, #752]	@ 8a948 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x41c>
   8a654:	e59420b0 	ldr	r2, [r4, #176]	@ 0xb0
   8a658:	f2c75f10 	vmov.f32	d21, #1	@ 0x3f800000
   8a65c:	ee823b90 	vdup.32	d18, r3
   8a660:	edc40b26 	vstr	d16, [r4, #152]	@ 0x98
   8a664:	f2604da4 	vsub.f32	d20, d16, d20
   8a668:	e3a03000 	mov	r3, #0
   8a66c:	f2601da1 	vsub.f32	d17, d16, d17
   8a670:	ee832b90 	vdup.32	d19, r2
   8a674:	e58430a8 	str	r3, [r4, #168]	@ 0xa8
   8a678:	edc45b32 	vstr	d21, [r4, #200]	@ 0xc8
   8a67c:	e5c430b4 	strb	r3, [r4, #180]	@ 0xb4
   8a680:	edc45b30 	vstr	d21, [r4, #192]	@ 0xc0
   8a684:	f3443db3 	vmul.f32	d19, d20, d19
   8a688:	edc40b2e 	vstr	d16, [r4, #184]	@ 0xb8
   8a68c:	f3411db2 	vmul.f32	d17, d17, d18
   8a690:	edc43b24 	vstr	d19, [r4, #144]	@ 0x90
   8a694:	edc40b1a 	vstr	d16, [r4, #104]	@ 0x68
   8a698:	edc41b18 	vstr	d17, [r4, #96]	@ 0x60
   8a69c:	e5843078 	str	r3, [r4, #120]	@ 0x78
   8a6a0:	e5c43084 	strb	r3, [r4, #132]	@ 0x84
   8a6a4:	e590c000 	ldr	ip, [r0]
   8a6a8:	e1a01006 	mov	r1, r6
   8a6ac:	e1a03005 	mov	r3, r5
   8a6b0:	e5942058 	ldr	r2, [r4, #88]	@ 0x58
   8a6b4:	e59cc008 	ldr	ip, [ip, #8]
   8a6b8:	e12fff3c 	blx	ip
   8a6bc:	e5941088 	ldr	r1, [r4, #136]	@ 0x88
   8a6c0:	e5940008 	ldr	r0, [r4, #8]
   8a6c4:	e3a03000 	mov	r3, #0
   8a6c8:	e3510001 	cmp	r1, #1
   8a6cc:	e5c03051 	strb	r3, [r0, #81]	@ 0x51
   8a6d0:	0a0000a0 	beq	8a958 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x42c>
   8a6d4:	e3510002 	cmp	r1, #2
   8a6d8:	0a000076 	beq	8a8b8 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x38c>
   8a6dc:	e5d430b4 	ldrb	r3, [r4, #180]	@ 0xb4
   8a6e0:	e3530000 	cmp	r3, #0
   8a6e4:	1a00002b 	bne	8a798 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x26c>
   8a6e8:	e3550000 	cmp	r5, #0
   8a6ec:	d8bd85f8 	pople	{r3, r4, r5, r6, r7, r8, sl, pc}
   8a6f0:	e5940008 	ldr	r0, [r4, #8]
   8a6f4:	e3a03000 	mov	r3, #0
   8a6f8:	e5941040 	ldr	r1, [r4, #64]	@ 0x40
   8a6fc:	e3a08001 	mov	r8, #1
   8a700:	e5942058 	ldr	r2, [r4, #88]	@ 0x58
   8a704:	e1500001 	cmp	r0, r1
   8a708:	e59470ac 	ldr	r7, [r4, #172]	@ 0xac
   8a70c:	e594c0d4 	ldr	ip, [r4, #212]	@ 0xd4
   8a710:	0a000036 	beq	8a7f0 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x2c4>
   8a714:	edd40b28 	vldr	d16, [r4, #160]	@ 0xa0
   8a718:	edd61b00 	vldr	d17, [r6]
   8a71c:	e59410a8 	ldr	r1, [r4, #168]	@ 0xa8
   8a720:	f3411db0 	vmul.f32	d17, d17, d16
   8a724:	e0820183 	add	r0, r2, r3, lsl #3
   8a728:	e2833001 	add	r3, r3, #1
   8a72c:	e1510007 	cmp	r1, r7
   8a730:	edd02b00 	vldr	d18, [r0]
   8a734:	e2810001 	add	r0, r1, #1
   8a738:	f2410da2 	vadd.f32	d16, d17, d18
   8a73c:	ece60b02 	vstmia	r6!, {d16}
   8a740:	edd41b28 	vldr	d17, [r4, #160]	@ 0xa0
   8a744:	edd40b24 	vldr	d16, [r4, #144]	@ 0x90
   8a748:	f2410da0 	vadd.f32	d16, d17, d16
   8a74c:	edc40b28 	vstr	d16, [r4, #160]	@ 0xa0
   8a750:	2dd40b26 	vldrcs	d16, [r4, #152]	@ 0x98
   8a754:	25c480b4 	strbcs	r8, [r4, #180]	@ 0xb4
   8a758:	2dc40b28 	vstrcs	d16, [r4, #160]	@ 0xa0
   8a75c:	e59410d0 	ldr	r1, [r4, #208]	@ 0xd0
   8a760:	edd41b32 	vldr	d17, [r4, #200]	@ 0xc8
   8a764:	edd40b2e 	vldr	d16, [r4, #184]	@ 0xb8
   8a768:	e58400a8 	str	r0, [r4, #168]	@ 0xa8
   8a76c:	e151000c 	cmp	r1, ip
   8a770:	f2410da0 	vadd.f32	d16, d17, d16
   8a774:	e2811001 	add	r1, r1, #1
   8a778:	edc40b32 	vstr	d16, [r4, #200]	@ 0xc8
   8a77c:	2dd40b30 	vldrcs	d16, [r4, #192]	@ 0xc0
   8a780:	25c480dc 	strbcs	r8, [r4, #220]	@ 0xdc
   8a784:	2dc40b32 	vstrcs	d16, [r4, #200]	@ 0xc8
   8a788:	e1530005 	cmp	r3, r5
   8a78c:	e58410d0 	str	r1, [r4, #208]	@ 0xd0
   8a790:	1affffdf 	bne	8a714 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x1e8>
   8a794:	e8bd85f8 	pop	{r3, r4, r5, r6, r7, r8, sl, pc}
   8a798:	e5d430dc 	ldrb	r3, [r4, #220]	@ 0xdc
   8a79c:	e3530000 	cmp	r3, #0
   8a7a0:	0affffd0 	beq	8a6e8 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x1bc>
   8a7a4:	e5942008 	ldr	r2, [r4, #8]
   8a7a8:	edd42b28 	vldr	d18, [r4, #160]	@ 0xa0
   8a7ac:	e5943040 	ldr	r3, [r4, #64]	@ 0x40
   8a7b0:	e1520003 	cmp	r2, r3
   8a7b4:	0a000146 	beq	8acd4 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x7a8>
   8a7b8:	e3550000 	cmp	r5, #0
   8a7bc:	d8bd85f8 	pople	{r3, r4, r5, r6, r7, r8, sl, pc}
   8a7c0:	e5942058 	ldr	r2, [r4, #88]	@ 0x58
   8a7c4:	e3a03000 	mov	r3, #0
   8a7c8:	edd61b00 	vldr	d17, [r6]
   8a7cc:	f3411db2 	vmul.f32	d17, d17, d18
   8a7d0:	e0821183 	add	r1, r2, r3, lsl #3
   8a7d4:	e2833001 	add	r3, r3, #1
   8a7d8:	e1530005 	cmp	r3, r5
   8a7dc:	edd10b00 	vldr	d16, [r1]
   8a7e0:	f2410da0 	vadd.f32	d16, d17, d16
   8a7e4:	ece60b02 	vstmia	r6!, {d16}
   8a7e8:	1afffff6 	bne	8a7c8 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x29c>
   8a7ec:	e8bd85f8 	pop	{r3, r4, r5, r6, r7, r8, sl, pc}
   8a7f0:	edd40b28 	vldr	d16, [r4, #160]	@ 0xa0
   8a7f4:	edd41b32 	vldr	d17, [r4, #200]	@ 0xc8
   8a7f8:	f3400db1 	vmul.f32	d16, d16, d17
   8a7fc:	e59410a8 	ldr	r1, [r4, #168]	@ 0xa8
   8a800:	edd61b00 	vldr	d17, [r6]
   8a804:	e0820183 	add	r0, r2, r3, lsl #3
   8a808:	e1510007 	cmp	r1, r7
   8a80c:	edd02b00 	vldr	d18, [r0]
   8a810:	e2833001 	add	r3, r3, #1
   8a814:	e2810001 	add	r0, r1, #1
   8a818:	f3411db0 	vmul.f32	d17, d17, d16
   8a81c:	f2410da2 	vadd.f32	d16, d17, d18
   8a820:	ece60b02 	vstmia	r6!, {d16}
   8a824:	edd41b28 	vldr	d17, [r4, #160]	@ 0xa0
   8a828:	edd40b24 	vldr	d16, [r4, #144]	@ 0x90
   8a82c:	f2410da0 	vadd.f32	d16, d17, d16
   8a830:	edc40b28 	vstr	d16, [r4, #160]	@ 0xa0
   8a834:	2dd40b26 	vldrcs	d16, [r4, #152]	@ 0x98
   8a838:	25c480b4 	strbcs	r8, [r4, #180]	@ 0xb4
   8a83c:	2dc40b28 	vstrcs	d16, [r4, #160]	@ 0xa0
   8a840:	e59410d0 	ldr	r1, [r4, #208]	@ 0xd0
   8a844:	edd41b32 	vldr	d17, [r4, #200]	@ 0xc8
   8a848:	edd40b2e 	vldr	d16, [r4, #184]	@ 0xb8
   8a84c:	e58400a8 	str	r0, [r4, #168]	@ 0xa8
   8a850:	e151000c 	cmp	r1, ip
   8a854:	f2410da0 	vadd.f32	d16, d17, d16
   8a858:	e2811001 	add	r1, r1, #1
   8a85c:	edc40b32 	vstr	d16, [r4, #200]	@ 0xc8
   8a860:	2dd40b30 	vldrcs	d16, [r4, #192]	@ 0xc0
   8a864:	25c480dc 	strbcs	r8, [r4, #220]	@ 0xdc
   8a868:	2dc40b32 	vstrcs	d16, [r4, #200]	@ 0xc8
   8a86c:	e1530005 	cmp	r3, r5
   8a870:	e58410d0 	str	r1, [r4, #208]	@ 0xd0
   8a874:	1affffdd 	bne	8a7f0 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x2c4>
   8a878:	e8bd85f8 	pop	{r3, r4, r5, r6, r7, r8, sl, pc}
   8a87c:	e5940008 	ldr	r0, [r4, #8]
   8a880:	e3a02000 	mov	r2, #0
   8a884:	e3a01002 	mov	r1, #2
   8a888:	e5903000 	ldr	r3, [r0]
   8a88c:	e593300c 	ldr	r3, [r3, #12]
   8a890:	e12fff33 	blx	r3
   8a894:	e59420e0 	ldr	r2, [r4, #224]	@ 0xe0
   8a898:	e59430e4 	ldr	r3, [r4, #228]	@ 0xe4
   8a89c:	e1520003 	cmp	r2, r3
   8a8a0:	1affff4c 	bne	8a5d8 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0xac>
   8a8a4:	e5940008 	ldr	r0, [r4, #8]
   8a8a8:	e5d03051 	ldrb	r3, [r0, #81]	@ 0x51
   8a8ac:	e3530000 	cmp	r3, #0
   8a8b0:	0affff4e 	beq	8a5f0 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0xc4>
   8a8b4:	eaffff47 	b	8a5d8 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0xac>
   8a8b8:	e3550000 	cmp	r5, #0
   8a8bc:	da00001c 	ble	8a934 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x408>
   8a8c0:	e5942058 	ldr	r2, [r4, #88]	@ 0x58
   8a8c4:	e1a08006 	mov	r8, r6
   8a8c8:	e59f7084 	ldr	r7, [pc, #132]	@ 8a954 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x428>
   8a8cc:	e3a0a001 	mov	sl, #1
   8a8d0:	e594c07c 	ldr	ip, [r4, #124]	@ 0x7c
   8a8d4:	edd40b1c 	vldr	d16, [r4, #112]	@ 0x70
   8a8d8:	e5940078 	ldr	r0, [r4, #120]	@ 0x78
   8a8dc:	edd73b00 	vldr	d19, [r7]
   8a8e0:	f2633da0 	vsub.f32	d19, d19, d16
   8a8e4:	ecf82b02 	vldmia	r8!, {d18}
   8a8e8:	e0821183 	add	r1, r2, r3, lsl #3
   8a8ec:	edd11b00 	vldr	d17, [r1]
   8a8f0:	f3411db0 	vmul.f32	d17, d17, d16
   8a8f4:	e150000c 	cmp	r0, ip
   8a8f8:	e2833001 	add	r3, r3, #1
   8a8fc:	f3420db3 	vmul.f32	d16, d18, d19
   8a900:	e2800001 	add	r0, r0, #1
   8a904:	f2410da0 	vadd.f32	d16, d17, d16
   8a908:	edc10b00 	vstr	d16, [r1]
   8a90c:	edd41b1c 	vldr	d17, [r4, #112]	@ 0x70
   8a910:	edd40b18 	vldr	d16, [r4, #96]	@ 0x60
   8a914:	f2410da0 	vadd.f32	d16, d17, d16
   8a918:	edc40b1c 	vstr	d16, [r4, #112]	@ 0x70
   8a91c:	2dd40b1a 	vldrcs	d16, [r4, #104]	@ 0x68
   8a920:	25c4a084 	strbcs	sl, [r4, #132]	@ 0x84
   8a924:	2dc40b1c 	vstrcs	d16, [r4, #112]	@ 0x70
   8a928:	e1530005 	cmp	r3, r5
   8a92c:	e5840078 	str	r0, [r4, #120]	@ 0x78
   8a930:	1affffe9 	bne	8a8dc <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x3b0>
   8a934:	e5d43084 	ldrb	r3, [r4, #132]	@ 0x84
   8a938:	e3530000 	cmp	r3, #0
   8a93c:	13a03000 	movne	r3, #0
   8a940:	15843088 	strne	r3, [r4, #136]	@ 0x88
   8a944:	eaffff64 	b	8a6dc <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x1b0>
	...
   8a950:	34000000 	.word	0x34000000
   8a954:	0114a050 	.word	0x0114a050
   8a958:	e3550000 	cmp	r5, #0
   8a95c:	da00001c 	ble	8a9d4 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x4a8>
   8a960:	e5942058 	ldr	r2, [r4, #88]	@ 0x58
   8a964:	e1a08006 	mov	r8, r6
   8a968:	e51f701c 	ldr	r7, [pc, #-28]	@ 8a954 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x428>
   8a96c:	e1a0a001 	mov	sl, r1
   8a970:	e594c07c 	ldr	ip, [r4, #124]	@ 0x7c
   8a974:	edd40b1c 	vldr	d16, [r4, #112]	@ 0x70
   8a978:	e5940078 	ldr	r0, [r4, #120]	@ 0x78
   8a97c:	edd73b00 	vldr	d19, [r7]
   8a980:	f2633da0 	vsub.f32	d19, d19, d16
   8a984:	ecf82b02 	vldmia	r8!, {d18}
   8a988:	e0821183 	add	r1, r2, r3, lsl #3
   8a98c:	edd11b00 	vldr	d17, [r1]
   8a990:	f3411db0 	vmul.f32	d17, d17, d16
   8a994:	e150000c 	cmp	r0, ip
   8a998:	e2833001 	add	r3, r3, #1
   8a99c:	f3420db3 	vmul.f32	d16, d18, d19
   8a9a0:	e2800001 	add	r0, r0, #1
   8a9a4:	f2410da0 	vadd.f32	d16, d17, d16
   8a9a8:	edc10b00 	vstr	d16, [r1]
   8a9ac:	edd41b1c 	vldr	d17, [r4, #112]	@ 0x70
   8a9b0:	edd40b18 	vldr	d16, [r4, #96]	@ 0x60
   8a9b4:	f2410da0 	vadd.f32	d16, d17, d16
   8a9b8:	edc40b1c 	vstr	d16, [r4, #112]	@ 0x70
   8a9bc:	2dd40b1a 	vldrcs	d16, [r4, #104]	@ 0x68
   8a9c0:	25c4a084 	strbcs	sl, [r4, #132]	@ 0x84
   8a9c4:	2dc40b1c 	vstrcs	d16, [r4, #112]	@ 0x70
   8a9c8:	e1530005 	cmp	r3, r5
   8a9cc:	e5840078 	str	r0, [r4, #120]	@ 0x78
   8a9d0:	1affffe9 	bne	8a97c <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x450>
   8a9d4:	e5d43084 	ldrb	r3, [r4, #132]	@ 0x84
   8a9d8:	e3530000 	cmp	r3, #0
   8a9dc:	0affff3e 	beq	8a6dc <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x1b0>
   8a9e0:	e3a03000 	mov	r3, #0
   8a9e4:	e1a00004 	mov	r0, r4
   8a9e8:	e5c430ed 	strb	r3, [r4, #237]	@ 0xed
   8a9ec:	ebfffda2 	bl	8a07c <mixerengine::BeatEffectManager::switchNextBeatEffect()>
   8a9f0:	e894000c 	ldm	r4, {r2, r3}
   8a9f4:	e1520003 	cmp	r2, r3
   8a9f8:	0a000016 	beq	8aa58 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x52c>
   8a9fc:	e5940008 	ldr	r0, [r4, #8]
   8aa00:	e594201c 	ldr	r2, [r4, #28]
   8aa04:	e5843000 	str	r3, [r4]
   8aa08:	e1500002 	cmp	r0, r2
   8aa0c:	0a000002 	beq	8aa1c <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x4f0>
   8aa10:	e5903000 	ldr	r3, [r0]
   8aa14:	e5933024 	ldr	r3, [r3, #36]	@ 0x24
   8aa18:	e12fff33 	blx	r3
   8aa1c:	edd41b18 	vldr	d17, [r4, #96]	@ 0x60
   8aa20:	edd40b1c 	vldr	d16, [r4, #112]	@ 0x70
   8aa24:	f2401da1 	vadd.f32	d17, d16, d17
   8aa28:	e5943080 	ldr	r3, [r4, #128]	@ 0x80
   8aa2c:	f2c70f10 	vmov.f32	d16, #1	@ 0x3f800000
   8aa30:	edc40b1a 	vstr	d16, [r4, #104]	@ 0x68
   8aa34:	ee823b90 	vdup.32	d18, r3
   8aa38:	e3a03000 	mov	r3, #0
   8aa3c:	f2601da1 	vsub.f32	d17, d16, d17
   8aa40:	e5843078 	str	r3, [r4, #120]	@ 0x78
   8aa44:	e5c43084 	strb	r3, [r4, #132]	@ 0x84
   8aa48:	e3a03002 	mov	r3, #2
   8aa4c:	e5843088 	str	r3, [r4, #136]	@ 0x88
   8aa50:	f3410db2 	vmul.f32	d16, d17, d18
   8aa54:	edc40b18 	vstr	d16, [r4, #96]	@ 0x60
   8aa58:	e3a03001 	mov	r3, #1
   8aa5c:	e5c430ef 	strb	r3, [r4, #239]	@ 0xef
   8aa60:	eaffff1d 	b	8a6dc <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x1b0>
   8aa64:	e5903000 	ldr	r3, [r0]
   8aa68:	e3a01002 	mov	r1, #2
   8aa6c:	ee172a90 	vmov	r2, s15
   8aa70:	e593300c 	ldr	r3, [r3, #12]
   8aa74:	e12fff33 	blx	r3
   8aa78:	eafffed2 	b	8a5c8 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x9c>
   8aa7c:	e8940006 	ldm	r4, {r1, r2}
   8aa80:	e1510002 	cmp	r1, r2
   8aa84:	0a00006d 	beq	8ac40 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x714>
   8aa88:	e5903000 	ldr	r3, [r0]
   8aa8c:	e5933020 	ldr	r3, [r3, #32]
   8aa90:	e12fff33 	blx	r3
   8aa94:	edd44b24 	vldr	d20, [r4, #144]	@ 0x90
   8aa98:	edd42b18 	vldr	d18, [r4, #96]	@ 0x60
   8aa9c:	edd41b28 	vldr	d17, [r4, #160]	@ 0xa0
   8aaa0:	edd40b1c 	vldr	d16, [r4, #112]	@ 0x70
   8aaa4:	f2414da4 	vadd.f32	d20, d17, d20
   8aaa8:	f2402da2 	vadd.f32	d18, d16, d18
   8aaac:	e59430b0 	ldr	r3, [r4, #176]	@ 0xb0
   8aab0:	eddf0b8a 	vldr	d16, [pc, #552]	@ 8ace0 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x7b4>
   8aab4:	e5942080 	ldr	r2, [r4, #128]	@ 0x80
   8aab8:	f2c71f10 	vmov.f32	d17, #1	@ 0x3f800000
   8aabc:	edc40b26 	vstr	d16, [r4, #152]	@ 0x98
   8aac0:	f2604da4 	vsub.f32	d20, d16, d20
   8aac4:	ee833b90 	vdup.32	d19, r3
   8aac8:	f2602da2 	vsub.f32	d18, d16, d18
   8aacc:	ee852b90 	vdup.32	d21, r2
   8aad0:	e3a03000 	mov	r3, #0
   8aad4:	e3a02001 	mov	r2, #1
   8aad8:	e58430a8 	str	r3, [r4, #168]	@ 0xa8
   8aadc:	edc41b32 	vstr	d17, [r4, #200]	@ 0xc8
   8aae0:	f3443db3 	vmul.f32	d19, d20, d19
   8aae4:	e5842088 	str	r2, [r4, #136]	@ 0x88
   8aae8:	f3422db5 	vmul.f32	d18, d18, d21
   8aaec:	e5c430b4 	strb	r3, [r4, #180]	@ 0xb4
   8aaf0:	edc43b24 	vstr	d19, [r4, #144]	@ 0x90
   8aaf4:	edc41b30 	vstr	d17, [r4, #192]	@ 0xc0
   8aaf8:	edc40b2e 	vstr	d16, [r4, #184]	@ 0xb8
   8aafc:	edc40b1a 	vstr	d16, [r4, #104]	@ 0x68
   8ab00:	edc42b18 	vstr	d18, [r4, #96]	@ 0x60
   8ab04:	e5843078 	str	r3, [r4, #120]	@ 0x78
   8ab08:	e5c43084 	strb	r3, [r4, #132]	@ 0x84
   8ab0c:	e5940008 	ldr	r0, [r4, #8]
   8ab10:	eafffee3 	b	8a6a4 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x178>
   8ab14:	e3520000 	cmp	r2, #0
   8ab18:	13a03001 	movne	r3, #1
   8ab1c:	15843088 	strne	r3, [r4, #136]	@ 0x88
   8ab20:	1afffec3 	bne	8a634 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x108>
   8ab24:	e894000c 	ldm	r4, {r2, r3}
   8ab28:	e1520003 	cmp	r2, r3
   8ab2c:	1a000004 	bne	8ab44 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x618>
   8ab30:	e5d430ed 	ldrb	r3, [r4, #237]	@ 0xed
   8ab34:	e3530000 	cmp	r3, #0
   8ab38:	1a000001 	bne	8ab44 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x618>
   8ab3c:	e3570000 	cmp	r7, #0
   8ab40:	0afffed7 	beq	8a6a4 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x178>
   8ab44:	edd44b24 	vldr	d20, [r4, #144]	@ 0x90
   8ab48:	edd42b18 	vldr	d18, [r4, #96]	@ 0x60
   8ab4c:	edd40b28 	vldr	d16, [r4, #160]	@ 0xa0
   8ab50:	edd41b1c 	vldr	d17, [r4, #112]	@ 0x70
   8ab54:	f2404da4 	vadd.f32	d20, d16, d20
   8ab58:	e59420b0 	ldr	r2, [r4, #176]	@ 0xb0
   8ab5c:	f2412da2 	vadd.f32	d18, d17, d18
   8ab60:	eddf0b5e 	vldr	d16, [pc, #376]	@ 8ace0 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x7b4>
   8ab64:	e5943080 	ldr	r3, [r4, #128]	@ 0x80
   8ab68:	f2c71f10 	vmov.f32	d17, #1	@ 0x3f800000
   8ab6c:	ee832b90 	vdup.32	d19, r2
   8ab70:	edc40b26 	vstr	d16, [r4, #152]	@ 0x98
   8ab74:	f2604da4 	vsub.f32	d20, d16, d20
   8ab78:	e3a02001 	mov	r2, #1
   8ab7c:	f2602da2 	vsub.f32	d18, d16, d18
   8ab80:	ee853b90 	vdup.32	d21, r3
   8ab84:	e5842088 	str	r2, [r4, #136]	@ 0x88
   8ab88:	e3a03000 	mov	r3, #0
   8ab8c:	edc41b32 	vstr	d17, [r4, #200]	@ 0xc8
   8ab90:	e58430a8 	str	r3, [r4, #168]	@ 0xa8
   8ab94:	f3443db3 	vmul.f32	d19, d20, d19
   8ab98:	e5c430b4 	strb	r3, [r4, #180]	@ 0xb4
   8ab9c:	f3422db5 	vmul.f32	d18, d18, d21
   8aba0:	edc43b24 	vstr	d19, [r4, #144]	@ 0x90
   8aba4:	edc41b30 	vstr	d17, [r4, #192]	@ 0xc0
   8aba8:	edc40b2e 	vstr	d16, [r4, #184]	@ 0xb8
   8abac:	edc40b1a 	vstr	d16, [r4, #104]	@ 0x68
   8abb0:	edc42b18 	vstr	d18, [r4, #96]	@ 0x60
   8abb4:	e5843078 	str	r3, [r4, #120]	@ 0x78
   8abb8:	e5c43084 	strb	r3, [r4, #132]	@ 0x84
   8abbc:	eafffeb8 	b	8a6a4 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x178>
   8abc0:	e3570000 	cmp	r7, #0
   8abc4:	1afffe9a 	bne	8a634 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x108>
   8abc8:	e5903000 	ldr	r3, [r0]
   8abcc:	e593301c 	ldr	r3, [r3, #28]
   8abd0:	e12fff33 	blx	r3
   8abd4:	edd44b24 	vldr	d20, [r4, #144]	@ 0x90
   8abd8:	eddf1b40 	vldr	d17, [pc, #256]	@ 8ace0 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x7b4>
   8abdc:	edd40b28 	vldr	d16, [r4, #160]	@ 0xa0
   8abe0:	f2413da1 	vadd.f32	d19, d17, d17
   8abe4:	e59430b0 	ldr	r3, [r4, #176]	@ 0xb0
   8abe8:	f2404da4 	vadd.f32	d20, d16, d20
   8abec:	e58470a8 	str	r7, [r4, #168]	@ 0xa8
   8abf0:	f2c70f10 	vmov.f32	d16, #1	@ 0x3f800000
   8abf4:	e5c470b4 	strb	r7, [r4, #180]	@ 0xb4
   8abf8:	ee853b90 	vdup.32	d21, r3
   8abfc:	e59430d8 	ldr	r3, [r4, #216]	@ 0xd8
   8ac00:	f2603da3 	vsub.f32	d19, d16, d19
   8ac04:	edc40b26 	vstr	d16, [r4, #152]	@ 0x98
   8ac08:	f2604da4 	vsub.f32	d20, d16, d20
   8ac0c:	edc41b32 	vstr	d17, [r4, #200]	@ 0xc8
   8ac10:	ee823b90 	vdup.32	d18, r3
   8ac14:	edc40b30 	vstr	d16, [r4, #192]	@ 0xc0
   8ac18:	e3a03003 	mov	r3, #3
   8ac1c:	e58470d0 	str	r7, [r4, #208]	@ 0xd0
   8ac20:	f3432db2 	vmul.f32	d18, d19, d18
   8ac24:	e5c470dc 	strb	r7, [r4, #220]	@ 0xdc
   8ac28:	f3444db5 	vmul.f32	d20, d20, d21
   8ac2c:	edc42b2e 	vstr	d18, [r4, #184]	@ 0xb8
   8ac30:	edc44b24 	vstr	d20, [r4, #144]	@ 0x90
   8ac34:	e5843088 	str	r3, [r4, #136]	@ 0x88
   8ac38:	e5940008 	ldr	r0, [r4, #8]
   8ac3c:	eafffe98 	b	8a6a4 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x178>
   8ac40:	e3530003 	cmp	r3, #3
   8ac44:	1afffe96 	bne	8a6a4 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x178>
   8ac48:	e5903000 	ldr	r3, [r0]
   8ac4c:	e593302c 	ldr	r3, [r3, #44]	@ 0x2c
   8ac50:	e12fff33 	blx	r3
   8ac54:	e5940008 	ldr	r0, [r4, #8]
   8ac58:	e5903000 	ldr	r3, [r0]
   8ac5c:	e593301c 	ldr	r3, [r3, #28]
   8ac60:	e12fff33 	blx	r3
   8ac64:	e5940008 	ldr	r0, [r4, #8]
   8ac68:	e59430e0 	ldr	r3, [r4, #224]	@ 0xe0
   8ac6c:	e590204c 	ldr	r2, [r0, #76]	@ 0x4c
   8ac70:	e5901048 	ldr	r1, [r0, #72]	@ 0x48
   8ac74:	e1530002 	cmp	r3, r2
   8ac78:	b58420e4 	strlt	r2, [r4, #228]	@ 0xe4
   8ac7c:	ba000001 	blt	8ac88 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x75c>
   8ac80:	e1530001 	cmp	r3, r1
   8ac84:	c58410e4 	strgt	r1, [r4, #228]	@ 0xe4
   8ac88:	edd42b24 	vldr	d18, [r4, #144]	@ 0x90
   8ac8c:	edd40b28 	vldr	d16, [r4, #160]	@ 0xa0
   8ac90:	f2402da2 	vadd.f32	d18, d16, d18
   8ac94:	e59430b0 	ldr	r3, [r4, #176]	@ 0xb0
   8ac98:	eddf0b10 	vldr	d16, [pc, #64]	@ 8ace0 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x7b4>
   8ac9c:	f2c71f10 	vmov.f32	d17, #1	@ 0x3f800000
   8aca0:	edc40b26 	vstr	d16, [r4, #152]	@ 0x98
   8aca4:	edc40b2e 	vstr	d16, [r4, #184]	@ 0xb8
   8aca8:	ee833b90 	vdup.32	d19, r3
   8acac:	edc41b32 	vstr	d17, [r4, #200]	@ 0xc8
   8acb0:	f2602da2 	vsub.f32	d18, d16, d18
   8acb4:	e3a03000 	mov	r3, #0
   8acb8:	edc41b30 	vstr	d17, [r4, #192]	@ 0xc0
   8acbc:	e58430a8 	str	r3, [r4, #168]	@ 0xa8
   8acc0:	e5c430b4 	strb	r3, [r4, #180]	@ 0xb4
   8acc4:	e5843088 	str	r3, [r4, #136]	@ 0x88
   8acc8:	f3420db3 	vmul.f32	d16, d18, d19
   8accc:	edc40b24 	vstr	d16, [r4, #144]	@ 0x90
   8acd0:	eafffe73 	b	8a6a4 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x178>
   8acd4:	edd40b32 	vldr	d16, [r4, #200]	@ 0xc8
   8acd8:	f3422db0 	vmul.f32	d18, d18, d16
   8acdc:	eafffeb5 	b	8a7b8 <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)+0x28c>
	...

0008ace8 <mixerengine::BeatEffectManager::switchNextChannel()>:
   8ace8:	e890000c 	ldm	r0, {r2, r3}
   8acec:	e92d4010 	push	{r4, lr}
   8acf0:	e1520003 	cmp	r2, r3
   8acf4:	e1a04000 	mov	r4, r0
   8acf8:	08bd8010 	popeq	{r4, pc}
   8acfc:	e5900008 	ldr	r0, [r0, #8]
   8ad00:	e594201c 	ldr	r2, [r4, #28]
   8ad04:	e5843000 	str	r3, [r4]
   8ad08:	e1500002 	cmp	r0, r2
   8ad0c:	0a000002 	beq	8ad1c <mixerengine::BeatEffectManager::switchNextChannel()+0x34>
   8ad10:	e5903000 	ldr	r3, [r0]
   8ad14:	e5933024 	ldr	r3, [r3, #36]	@ 0x24
   8ad18:	e12fff33 	blx	r3
   8ad1c:	edd41b18 	vldr	d17, [r4, #96]	@ 0x60
   8ad20:	edd42b1c 	vldr	d18, [r4, #112]	@ 0x70
   8ad24:	f2421da1 	vadd.f32	d17, d18, d17
   8ad28:	e5943080 	ldr	r3, [r4, #128]	@ 0x80
   8ad2c:	f2c70f10 	vmov.f32	d16, #1	@ 0x3f800000
   8ad30:	edc40b1a 	vstr	d16, [r4, #104]	@ 0x68
   8ad34:	ee823b90 	vdup.32	d18, r3
   8ad38:	e3a03000 	mov	r3, #0
   8ad3c:	f2601da1 	vsub.f32	d17, d16, d17
   8ad40:	e5843078 	str	r3, [r4, #120]	@ 0x78
   8ad44:	e5c43084 	strb	r3, [r4, #132]	@ 0x84
   8ad48:	e3a03002 	mov	r3, #2
   8ad4c:	e5843088 	str	r3, [r4, #136]	@ 0x88
   8ad50:	f3410db2 	vmul.f32	d16, d17, d18
   8ad54:	edc40b18 	vstr	d16, [r4, #96]	@ 0x60
   8ad58:	e8bd8010 	pop	{r4, pc}

0008ad5c <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)>:
   8ad5c:	e92d4038 	push	{r3, r4, r5, lr}
   8ad60:	e1a04000 	mov	r4, r0
   8ad64:	e5903008 	ldr	r3, [r0, #8]
   8ad68:	e590e010 	ldr	lr, [r0, #16]
   8ad6c:	e153000e 	cmp	r3, lr
   8ad70:	0a000003 	beq	8ad84 <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x28>
   8ad74:	e5903088 	ldr	r3, [r0, #136]	@ 0x88
   8ad78:	e3530003 	cmp	r3, #3
   8ad7c:	03a03001 	moveq	r3, #1
   8ad80:	05c030ed 	strbeq	r3, [r0, #237]	@ 0xed
   8ad84:	e594c00c 	ldr	ip, [r4, #12]
   8ad88:	e2411001 	sub	r1, r1, #1
   8ad8c:	e59c5020 	ldr	r5, [ip, #32]
   8ad90:	e351000d 	cmp	r1, #13
   8ad94:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
   8ad98:	ea00000f 	b	8addc <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x80>
   8ad9c:	0008add4 	.word	0x0008add4
   8ada0:	0008aec0 	.word	0x0008aec0
   8ada4:	0008aecc 	.word	0x0008aecc
   8ada8:	0008aed8 	.word	0x0008aed8
   8adac:	0008aee4 	.word	0x0008aee4
   8adb0:	0008aef0 	.word	0x0008aef0
   8adb4:	0008aefc 	.word	0x0008aefc
   8adb8:	0008af08 	.word	0x0008af08
   8adbc:	0008af14 	.word	0x0008af14
   8adc0:	0008af20 	.word	0x0008af20
   8adc4:	0008af2c 	.word	0x0008af2c
   8adc8:	0008af38 	.word	0x0008af38
   8adcc:	0008af44 	.word	0x0008af44
   8add0:	0008aeb4 	.word	0x0008aeb4
   8add4:	e594c014 	ldr	ip, [r4, #20]
   8add8:	e584c00c 	str	ip, [r4, #12]
   8addc:	e59c1024 	ldr	r1, [ip, #36]	@ 0x24
   8ade0:	e1a0000e 	mov	r0, lr
   8ade4:	e5d420ec 	ldrb	r2, [r4, #236]	@ 0xec
   8ade8:	e59e3000 	ldr	r3, [lr]
   8adec:	e58e1024 	str	r1, [lr, #36]	@ 0x24
   8adf0:	e59c1028 	ldr	r1, [ip, #40]	@ 0x28
   8adf4:	e5933018 	ldr	r3, [r3, #24]
   8adf8:	e58e1028 	str	r1, [lr, #40]	@ 0x28
   8adfc:	e59c102c 	ldr	r1, [ip, #44]	@ 0x2c
   8ae00:	e58e102c 	str	r1, [lr, #44]	@ 0x2c
   8ae04:	e59c1030 	ldr	r1, [ip, #48]	@ 0x30
   8ae08:	e58e1030 	str	r1, [lr, #48]	@ 0x30
   8ae0c:	e59c1034 	ldr	r1, [ip, #52]	@ 0x34
   8ae10:	e58e1034 	str	r1, [lr, #52]	@ 0x34
   8ae14:	e59c1038 	ldr	r1, [ip, #56]	@ 0x38
   8ae18:	e58e1038 	str	r1, [lr, #56]	@ 0x38
   8ae1c:	e59c1048 	ldr	r1, [ip, #72]	@ 0x48
   8ae20:	e58e1048 	str	r1, [lr, #72]	@ 0x48
   8ae24:	e59c104c 	ldr	r1, [ip, #76]	@ 0x4c
   8ae28:	e58e104c 	str	r1, [lr, #76]	@ 0x4c
   8ae2c:	e59c1044 	ldr	r1, [ip, #68]	@ 0x44
   8ae30:	e12fff33 	blx	r3
   8ae34:	e594000c 	ldr	r0, [r4, #12]
   8ae38:	e5903000 	ldr	r3, [r0]
   8ae3c:	e5933028 	ldr	r3, [r3, #40]	@ 0x28
   8ae40:	e12fff33 	blx	r3
   8ae44:	e594000c 	ldr	r0, [r4, #12]
   8ae48:	e3a01002 	mov	r1, #2
   8ae4c:	e1a02005 	mov	r2, r5
   8ae50:	e5903000 	ldr	r3, [r0]
   8ae54:	e593300c 	ldr	r3, [r3, #12]
   8ae58:	e12fff33 	blx	r3
   8ae5c:	e5943010 	ldr	r3, [r4, #16]
   8ae60:	e594000c 	ldr	r0, [r4, #12]
   8ae64:	e5931044 	ldr	r1, [r3, #68]	@ 0x44
   8ae68:	e5902044 	ldr	r2, [r0, #68]	@ 0x44
   8ae6c:	e1510002 	cmp	r1, r2
   8ae70:	e58410e0 	str	r1, [r4, #224]	@ 0xe0
   8ae74:	e58410e4 	str	r1, [r4, #228]	@ 0xe4
   8ae78:	0a000005 	beq	8ae94 <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x138>
   8ae7c:	e5903000 	ldr	r3, [r0]
   8ae80:	e5d420ec 	ldrb	r2, [r4, #236]	@ 0xec
   8ae84:	e5933018 	ldr	r3, [r3, #24]
   8ae88:	e12fff33 	blx	r3
   8ae8c:	e5943010 	ldr	r3, [r4, #16]
   8ae90:	e59410e0 	ldr	r1, [r4, #224]	@ 0xe0
   8ae94:	e593204c 	ldr	r2, [r3, #76]	@ 0x4c
   8ae98:	e5933048 	ldr	r3, [r3, #72]	@ 0x48
   8ae9c:	e1510002 	cmp	r1, r2
   8aea0:	b58420e4 	strlt	r2, [r4, #228]	@ 0xe4
   8aea4:	b8bd8038 	poplt	{r3, r4, r5, pc}
   8aea8:	e1510003 	cmp	r1, r3
   8aeac:	c58430e4 	strgt	r3, [r4, #228]	@ 0xe4
   8aeb0:	e8bd8038 	pop	{r3, r4, r5, pc}
   8aeb4:	e594c040 	ldr	ip, [r4, #64]	@ 0x40
   8aeb8:	e584c00c 	str	ip, [r4, #12]
   8aebc:	eaffffc6 	b	8addc <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x80>
   8aec0:	e594c018 	ldr	ip, [r4, #24]
   8aec4:	e584c00c 	str	ip, [r4, #12]
   8aec8:	eaffffc3 	b	8addc <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x80>
   8aecc:	e594c01c 	ldr	ip, [r4, #28]
   8aed0:	e584c00c 	str	ip, [r4, #12]
   8aed4:	eaffffc0 	b	8addc <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x80>
   8aed8:	e594c020 	ldr	ip, [r4, #32]
   8aedc:	e584c00c 	str	ip, [r4, #12]
   8aee0:	eaffffbd 	b	8addc <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x80>
   8aee4:	e594c024 	ldr	ip, [r4, #36]	@ 0x24
   8aee8:	e584c00c 	str	ip, [r4, #12]
   8aeec:	eaffffba 	b	8addc <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x80>
   8aef0:	e594c028 	ldr	ip, [r4, #40]	@ 0x28
   8aef4:	e584c00c 	str	ip, [r4, #12]
   8aef8:	eaffffb7 	b	8addc <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x80>
   8aefc:	e594c02c 	ldr	ip, [r4, #44]	@ 0x2c
   8af00:	e584c00c 	str	ip, [r4, #12]
   8af04:	eaffffb4 	b	8addc <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x80>
   8af08:	e594c030 	ldr	ip, [r4, #48]	@ 0x30
   8af0c:	e584c00c 	str	ip, [r4, #12]
   8af10:	eaffffb1 	b	8addc <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x80>
   8af14:	e594c038 	ldr	ip, [r4, #56]	@ 0x38
   8af18:	e584c00c 	str	ip, [r4, #12]
   8af1c:	eaffffae 	b	8addc <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x80>
   8af20:	e594c03c 	ldr	ip, [r4, #60]	@ 0x3c
   8af24:	e584c00c 	str	ip, [r4, #12]
   8af28:	eaffffab 	b	8addc <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x80>
   8af2c:	e594c044 	ldr	ip, [r4, #68]	@ 0x44
   8af30:	e584c00c 	str	ip, [r4, #12]
   8af34:	eaffffa8 	b	8addc <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x80>
   8af38:	e594c048 	ldr	ip, [r4, #72]	@ 0x48
   8af3c:	e584c00c 	str	ip, [r4, #12]
   8af40:	eaffffa5 	b	8addc <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x80>
   8af44:	e594c034 	ldr	ip, [r4, #52]	@ 0x34
   8af48:	e584c00c 	str	ip, [r4, #12]
   8af4c:	eaffffa2 	b	8addc <mixerengine::BeatEffectManager::storeMaxMinValue(djengine::EnBeatEffectType)+0x80>

0008af50 <mixerengine::BeatEffectManager::copyMusicData(common::Float2 const*, int)>:
   8af50:	e92d4070 	push	{r4, r5, r6, lr}
   8af54:	e1a04000 	mov	r4, r0
   8af58:	e590001c 	ldr	r0, [r0, #28]
   8af5c:	e1a06001 	mov	r6, r1
   8af60:	e1a05002 	mov	r5, r2
   8af64:	e5903000 	ldr	r3, [r0]
   8af68:	e5933034 	ldr	r3, [r3, #52]	@ 0x34
   8af6c:	e12fff33 	blx	r3
   8af70:	e5940048 	ldr	r0, [r4, #72]	@ 0x48
   8af74:	e1a01006 	mov	r1, r6
   8af78:	e1a02005 	mov	r2, r5
   8af7c:	e5903000 	ldr	r3, [r0]
   8af80:	e5933034 	ldr	r3, [r3, #52]	@ 0x34
   8af84:	e12fff33 	blx	r3
   8af88:	e8bd8070 	pop	{r4, r5, r6, pc}
