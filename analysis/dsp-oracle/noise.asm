
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000bc848 <mixerengine::SoundColorFxNoise::changeColorValue()>:
   bc848:	ed907a07 	vldr	s14, [r0, #28]
   bc84c:	eddf7a05 	vldr	s15, [pc, #20]	@ bc868 <mixerengine::SoundColorFxNoise::changeColorValue()+0x20>
   bc850:	ee677a27 	vmul.f32	s15, s14, s15
   bc854:	eefd7ae7 	vcvt.s32.f32	s15, s15
   bc858:	ee173a90 	vmov	r3, s15
   bc85c:	e1a03143 	asr	r3, r3, #2
   bc860:	e5803064 	str	r3, [r0, #100]	@ 0x64
   bc864:	e12fff1e 	bx	lr
   bc868:	447fc000 	.word	0x447fc000

000bc86c <mixerengine::SoundColorFxNoise::changeColorParameter()>:
   bc86c:	e12fff1e 	bx	lr

000bc870 <mixerengine::SoundColorFxNoise::changeCfxStatus_On()>:
   bc870:	e3a00001 	mov	r0, #1
   bc874:	e12fff1e 	bx	lr

000bc878 <mixerengine::SoundColorFxNoise::changeCfxStatus_Off()>:
   bc878:	e3a00001 	mov	r0, #1
   bc87c:	e12fff1e 	bx	lr

000bc880 <mixerengine::SoundColorFxNoise::~SoundColorFxNoise()>:
   bc880:	e92d4010 	push	{r4, lr}
   bc884:	e1a04000 	mov	r4, r0
   bc888:	e5900024 	ldr	r0, [r0, #36]	@ 0x24
   bc88c:	e59f3040 	ldr	r3, [pc, #64]	@ bc8d4 <mixerengine::SoundColorFxNoise::~SoundColorFxNoise()+0x54>
   bc890:	e3500000 	cmp	r0, #0
   bc894:	e5843000 	str	r3, [r4]
   bc898:	0a000002 	beq	bc8a8 <mixerengine::SoundColorFxNoise::~SoundColorFxNoise()+0x28>
   bc89c:	e5903000 	ldr	r3, [r0]
   bc8a0:	e5933004 	ldr	r3, [r3, #4]
   bc8a4:	e12fff33 	blx	r3
   bc8a8:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   bc8ac:	e3500000 	cmp	r0, #0
   bc8b0:	0a000000 	beq	bc8b8 <mixerengine::SoundColorFxNoise::~SoundColorFxNoise()+0x38>
   bc8b4:	ebfd49ec 	bl	f06c <operator delete[](void*)@plt>
   bc8b8:	e59f3018 	ldr	r3, [pc, #24]	@ bc8d8 <mixerengine::SoundColorFxNoise::~SoundColorFxNoise()+0x58>
   bc8bc:	e1a00004 	mov	r0, r4
   bc8c0:	e5843000 	str	r3, [r4]
   bc8c4:	e8bd8010 	pop	{r4, pc}
   bc8c8:	e59f3008 	ldr	r3, [pc, #8]	@ bc8d8 <mixerengine::SoundColorFxNoise::~SoundColorFxNoise()+0x58>
   bc8cc:	e5843000 	str	r3, [r4]
   bc8d0:	ebfd4979 	bl	eebc <__cxa_end_cleanup@plt>
   bc8d4:	0042d130 	.word	0x0042d130
   bc8d8:	0041db60 	.word	0x0041db60

000bc8dc <mixerengine::SoundColorFxNoise::~SoundColorFxNoise()>:
   bc8dc:	e92d4010 	push	{r4, lr}
   bc8e0:	e1a04000 	mov	r4, r0
   bc8e4:	e5900024 	ldr	r0, [r0, #36]	@ 0x24
   bc8e8:	e59f3048 	ldr	r3, [pc, #72]	@ bc938 <mixerengine::SoundColorFxNoise::~SoundColorFxNoise()+0x5c>
   bc8ec:	e3500000 	cmp	r0, #0
   bc8f0:	e5843000 	str	r3, [r4]
   bc8f4:	0a000002 	beq	bc904 <mixerengine::SoundColorFxNoise::~SoundColorFxNoise()+0x28>
   bc8f8:	e5903000 	ldr	r3, [r0]
   bc8fc:	e5933004 	ldr	r3, [r3, #4]
   bc900:	e12fff33 	blx	r3
   bc904:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   bc908:	e3500000 	cmp	r0, #0
   bc90c:	0a000000 	beq	bc914 <mixerengine::SoundColorFxNoise::~SoundColorFxNoise()+0x38>
   bc910:	ebfd49d5 	bl	f06c <operator delete[](void*)@plt>
   bc914:	e59f3020 	ldr	r3, [pc, #32]	@ bc93c <mixerengine::SoundColorFxNoise::~SoundColorFxNoise()+0x60>
   bc918:	e1a00004 	mov	r0, r4
   bc91c:	e5843000 	str	r3, [r4]
   bc920:	ebfd48ea 	bl	ecd0 <operator delete(void*)@plt>
   bc924:	e1a00004 	mov	r0, r4
   bc928:	e8bd8010 	pop	{r4, pc}
   bc92c:	e59f3008 	ldr	r3, [pc, #8]	@ bc93c <mixerengine::SoundColorFxNoise::~SoundColorFxNoise()+0x60>
   bc930:	e5843000 	str	r3, [r4]
   bc934:	ebfd4960 	bl	eebc <__cxa_end_cleanup@plt>
   bc938:	0042d130 	.word	0x0042d130
   bc93c:	0041db60 	.word	0x0041db60

000bc940 <mixerengine::SoundColorFxNoise::SoundColorFxNoise()>:
   bc940:	e59f2100 	ldr	r2, [pc, #256]	@ bca48 <mixerengine::SoundColorFxNoise::SoundColorFxNoise()+0x108>
   bc944:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   bc948:	e92d4038 	push	{r3, r4, r5, lr}
   bc94c:	e1a04000 	mov	r4, r0
   bc950:	e5922000 	ldr	r2, [r2]
   bc954:	ee062a90 	vmov	s13, r2
   bc958:	f2c00010 	vmov.i32	d16, #0	@ 0x00000000
   bc95c:	edc40b04 	vstr	d16, [r4, #16]
   bc960:	eddf0b32 	vldr	d16, [pc, #200]	@ bca30 <mixerengine::SoundColorFxNoise::SoundColorFxNoise()+0xf0>
   bc964:	edc40b0a 	vstr	d16, [r4, #40]	@ 0x28
   bc968:	e5842004 	str	r2, [r4, #4]
   bc96c:	eddf0b31 	vldr	d16, [pc, #196]	@ bca38 <mixerengine::SoundColorFxNoise::SoundColorFxNoise()+0xf8>
   bc970:	e5842008 	str	r2, [r4, #8]
   bc974:	edc40b0c 	vstr	d16, [r4, #48]	@ 0x30
   bc978:	e59f20cc 	ldr	r2, [pc, #204]	@ bca4c <mixerengine::SoundColorFxNoise::SoundColorFxNoise()+0x10c>
   bc97c:	f2c60f10 	vmov.f32	d16, #0.5	@ 0x3f000000
   bc980:	e3a0c000 	mov	ip, #0
   bc984:	e584c018 	str	ip, [r4, #24]
   bc988:	eeb87a66 	vcvt.f32.u32	s14, s13
   bc98c:	e3a03000 	mov	r3, #0
   bc990:	e5842000 	str	r2, [r4]
   bc994:	e284201c 	add	r2, r4, #28
   bc998:	e3a0107f 	mov	r1, #127	@ 0x7f
   bc99c:	e3030333 	movw	r0, #13107	@ 0x3333
   bc9a0:	f442078f 	vst1.32	{d16}, [r2]
   bc9a4:	edc47a10 	vstr	s15, [r4, #64]	@ 0x40
   bc9a8:	edc47a11 	vstr	s15, [r4, #68]	@ 0x44
   bc9ac:	e3430f33 	movt	r0, #16179	@ 0x3f33
   bc9b0:	e3a025f2 	mov	r2, #1015021568	@ 0x3c800000
   bc9b4:	e584004c 	str	r0, [r4, #76]	@ 0x4c
   bc9b8:	e5840050 	str	r0, [r4, #80]	@ 0x50
   bc9bc:	e3a00048 	mov	r0, #72	@ 0x48
   bc9c0:	eec77a87 	vdiv.f32	s15, s15, s14
   bc9c4:	e584303c 	str	r3, [r4, #60]	@ 0x3c
   bc9c8:	e584c038 	str	ip, [r4, #56]	@ 0x38
   bc9cc:	e5843048 	str	r3, [r4, #72]	@ 0x48
   bc9d0:	e5843054 	str	r3, [r4, #84]	@ 0x54
   bc9d4:	e5842058 	str	r2, [r4, #88]	@ 0x58
   bc9d8:	e584305c 	str	r3, [r4, #92]	@ 0x5c
   bc9dc:	e5841060 	str	r1, [r4, #96]	@ 0x60
   bc9e0:	e5841064 	str	r1, [r4, #100]	@ 0x64
   bc9e4:	edc47a03 	vstr	s15, [r4, #12]
   bc9e8:	ebfd464e 	bl	e328 <operator new(unsigned int)@plt>
   bc9ec:	e1a05000 	mov	r5, r0
   bc9f0:	ebff7ab6 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   bc9f4:	e5953000 	ldr	r3, [r5]
   bc9f8:	e1a00005 	mov	r0, r5
   bc9fc:	e5845024 	str	r5, [r4, #36]	@ 0x24
   bca00:	e5933018 	ldr	r3, [r3, #24]
   bca04:	e12fff33 	blx	r3
   bca08:	eddf0b0c 	vldr	d16, [pc, #48]	@ bca40 <mixerengine::SoundColorFxNoise::SoundColorFxNoise()+0x100>
   bca0c:	e1a00004 	mov	r0, r4
   bca10:	edc40b1a 	vstr	d16, [r4, #104]	@ 0x68
   bca14:	e8bd8038 	pop	{r3, r4, r5, pc}
   bca18:	e59f3030 	ldr	r3, [pc, #48]	@ bca50 <mixerengine::SoundColorFxNoise::SoundColorFxNoise()+0x110>
   bca1c:	e5843000 	str	r3, [r4]
   bca20:	ebfd4925 	bl	eebc <__cxa_end_cleanup@plt>
   bca24:	e1a00005 	mov	r0, r5
   bca28:	ebfd48a8 	bl	ecd0 <operator delete(void*)@plt>
   bca2c:	eafffff9 	b	bca18 <mixerengine::SoundColorFxNoise::SoundColorFxNoise()+0xd8>
	...
   bca38:	3f333333 	.word	0x3f333333
   bca3c:	3f333333 	.word	0x3f333333
   bca40:	67452301 	.word	0x67452301
   bca44:	efcdab89 	.word	0xefcdab89
   bca48:	004172c0 	.word	0x004172c0
   bca4c:	0042d130 	.word	0x0042d130
   bca50:	0041db60 	.word	0x0041db60

000bca54 <mixerengine::SoundColorFxNoise::parameterChaser(float*, float, float*)>:
   bca54:	edd17a00 	vldr	s15, [r1]
   bca58:	eef57a40 	vcmp.f32	s15, #0.0
   bca5c:	ee072a10 	vmov	s14, r2
   bca60:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bca64:	012fff1e 	bxeq	lr
   bca68:	edd36a00 	vldr	s13, [r3]
   bca6c:	ee777aa6 	vadd.f32	s15, s15, s13
   bca70:	ee776a67 	vsub.f32	s13, s14, s15
   bca74:	edc37a00 	vstr	s15, [r3]
   bca78:	edd17a00 	vldr	s15, [r1]
   bca7c:	ee667aa7 	vmul.f32	s15, s13, s15
   bca80:	eef57ac0 	vcmpe.f32	s15, #0.0
   bca84:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bca88:	9d837a00 	vstrls	s14, [r3]
   bca8c:	93a03000 	movls	r3, #0
   bca90:	95813000 	strls	r3, [r1]
   bca94:	e12fff1e 	bx	lr

000bca98 <mixerengine::SoundColorFxNoise::OscWhitenoise(long*, float*, int)>:
   bca98:	e3530000 	cmp	r3, #0
   bca9c:	e591c000 	ldr	ip, [r1]
   bcaa0:	e52d4004 	push	{r4}		@ (str r4, [sp, #-4]!)
   bcaa4:	e24dd00c 	sub	sp, sp, #12
   bcaa8:	e5910004 	ldr	r0, [r1, #4]
   bcaac:	da00000a 	ble	bcadc <mixerengine::SoundColorFxNoise::OscWhitenoise(long*, float*, int)+0x44>
   bcab0:	e3a04000 	mov	r4, #0
   bcab4:	ed9f7a0f 	vldr	s14, [pc, #60]	@ bcaf8 <mixerengine::SoundColorFxNoise::OscWhitenoise(long*, float*, int)+0x60>
   bcab8:	ee060a90 	vmov	s13, r0
   bcabc:	eef87ae6 	vcvt.f32.s32	s15, s13
   bcac0:	e2844001 	add	r4, r4, #1
   bcac4:	e02cc000 	eor	ip, ip, r0
   bcac8:	e1540003 	cmp	r4, r3
   bcacc:	e080000c 	add	r0, r0, ip
   bcad0:	ee677a87 	vmul.f32	s15, s15, s14
   bcad4:	ece27a01 	vstmia	r2!, {s15}
   bcad8:	1afffff6 	bne	bcab8 <mixerengine::SoundColorFxNoise::OscWhitenoise(long*, float*, int)+0x20>
   bcadc:	e58dc000 	str	ip, [sp]
   bcae0:	e58d0004 	str	r0, [sp, #4]
   bcae4:	eddd0b00 	vldr	d16, [sp]
   bcae8:	f441078f 	vst1.32	{d16}, [r1]
   bcaec:	e28dd00c 	add	sp, sp, #12
   bcaf0:	e8bd0010 	ldmfd	sp!, {r4}
   bcaf4:	e12fff1e 	bx	lr
   bcaf8:	30000000 	.word	0x30000000

000bcafc <mixerengine::SoundColorFxNoise::Whitenoise_Fil_Coef(int, float*)>:
   bcafc:	e92d4038 	push	{r3, r4, r5, lr}
   bcb00:	ed2d8b02 	vpush	{d8}
   bcb04:	e6ef4071 	uxtb	r4, r1
   bcb08:	e354007f 	cmp	r4, #127	@ 0x7f
   bcb0c:	e1a05002 	mov	r5, r2
   bcb10:	ca00002f 	bgt	bcbd4 <mixerengine::SoundColorFxNoise::Whitenoise_Fil_Coef(int, float*)+0xd8>
   bcb14:	ee064a90 	vmov	s13, r4
   bcb18:	eef86ae6 	vcvt.f32.s32	s13, s13
   bcb1c:	e3060ac0 	movw	r0, #27328	@ 0x6ac0
   bcb20:	e3430f85 	movt	r0, #16261	@ 0x3f85
   bcb24:	ee161a90 	vmov	r1, s13
   bcb28:	ebfd49ee 	bl	f2e8 <powf@plt>
   bcb2c:	e3540074 	cmp	r4, #116	@ 0x74
   bcb30:	eddf7a4b 	vldr	s15, [pc, #300]	@ bcc64 <mixerengine::SoundColorFxNoise::Whitenoise_Fil_Coef(int, float*)+0x168>
   bcb34:	ee070a10 	vmov	s14, r0
   bcb38:	ee278a27 	vmul.f32	s16, s14, s15
   bcb3c:	ca000041 	bgt	bcc48 <mixerengine::SoundColorFxNoise::Whitenoise_Fil_Coef(int, float*)+0x14c>
   bcb40:	eef76a00 	vmov.f32	s13, #112	@ 0x3f800000  1.0
   bcb44:	eebf6a08 	vmov.f32	s12, #248	@ 0xbfc00000 -1.5
   bcb48:	eeb87a04 	vmov.f32	s14, #132	@ 0xc0200000 -2.5
   bcb4c:	eef07a00 	vmov.f32	s15, #0	@ 0x40000000  2.0
   bcb50:	ee287a07 	vmul.f32	s14, s16, s14
   bcb54:	e3a03000 	mov	r3, #0
   bcb58:	e5853004 	str	r3, [r5, #4]
   bcb5c:	ee877a06 	vdiv.f32	s14, s14, s12
   bcb60:	ee378a48 	vsub.f32	s16, s14, s16
   bcb64:	ee287a27 	vmul.f32	s14, s16, s15
   bcb68:	eddf7a3e 	vldr	s15, [pc, #248]	@ bcc68 <mixerengine::SoundColorFxNoise::Whitenoise_Fil_Coef(int, float*)+0x16c>
   bcb6c:	ee677a27 	vmul.f32	s15, s14, s15
   bcb70:	ee277aa6 	vmul.f32	s14, s15, s13
   bcb74:	ee676aa7 	vmul.f32	s13, s15, s15
   bcb78:	eddf7a3b 	vldr	s15, [pc, #236]	@ bcc6c <mixerengine::SoundColorFxNoise::Whitenoise_Fil_Coef(int, float*)+0x170>
   bcb7c:	ee277a27 	vmul.f32	s14, s14, s15
   bcb80:	eddf7a3a 	vldr	s15, [pc, #232]	@ bcc70 <mixerengine::SoundColorFxNoise::Whitenoise_Fil_Coef(int, float*)+0x174>
   bcb84:	ee266aa7 	vmul.f32	s12, s13, s15
   bcb88:	eef16a00 	vmov.f32	s13, #16	@ 0x40800000  4.0
   bcb8c:	ee767a07 	vadd.f32	s15, s12, s14
   bcb90:	eef75a00 	vmov.f32	s11, #112	@ 0x3f800000  1.0
   bcb94:	ee777aa6 	vadd.f32	s15, s15, s13
   bcb98:	eec57aa7 	vdiv.f32	s15, s11, s15
   bcb9c:	ee765a66 	vsub.f32	s11, s12, s13
   bcba0:	ee366a47 	vsub.f32	s12, s12, s14
   bcba4:	ee755aa5 	vadd.f32	s11, s11, s11
   bcba8:	ee766a26 	vadd.f32	s13, s12, s13
   bcbac:	ee275a27 	vmul.f32	s10, s14, s15
   bcbb0:	ee276a67 	vnmul.f32	s12, s14, s15
   bcbb4:	ed855a00 	vstr	s10, [r5]
   bcbb8:	ee257aa7 	vmul.f32	s14, s11, s15
   bcbbc:	ed856a02 	vstr	s12, [r5, #8]
   bcbc0:	ee667aa7 	vmul.f32	s15, s13, s15
   bcbc4:	ed857a03 	vstr	s14, [r5, #12]
   bcbc8:	edc57a04 	vstr	s15, [r5, #16]
   bcbcc:	ecbd8b02 	vpop	{d8}
   bcbd0:	e8bd8038 	pop	{r3, r4, r5, pc}
   bcbd4:	e2441080 	sub	r1, r4, #128	@ 0x80
   bcbd8:	ee071a10 	vmov	s14, r1
   bcbdc:	eeb87ac7 	vcvt.f32.s32	s14, s14
   bcbe0:	e3060ac0 	movw	r0, #27328	@ 0x6ac0
   bcbe4:	e3430f85 	movt	r0, #16261	@ 0x3f85
   bcbe8:	ee171a10 	vmov	r1, s14
   bcbec:	ebfd49bd 	bl	f2e8 <powf@plt>
   bcbf0:	e35400f4 	cmp	r4, #244	@ 0xf4
   bcbf4:	eddf7a1a 	vldr	s15, [pc, #104]	@ bcc64 <mixerengine::SoundColorFxNoise::Whitenoise_Fil_Coef(int, float*)+0x168>
   bcbf8:	ee060a90 	vmov	s13, r0
   bcbfc:	ee268aa7 	vmul.f32	s16, s13, s15
   bcc00:	daffffce 	ble	bcb40 <mixerengine::SoundColorFxNoise::Whitenoise_Fil_Coef(int, float*)+0x44>
   bcc04:	e24410f4 	sub	r1, r4, #244	@ 0xf4
   bcc08:	ee071a10 	vmov	s14, r1
   bcc0c:	eeb87ac7 	vcvt.f32.s32	s14, s14
   bcc10:	e3050dc7 	movw	r0, #24007	@ 0x5dc7
   bcc14:	e3430f70 	movt	r0, #16240	@ 0x3f70
   bcc18:	ee171a10 	vmov	r1, s14
   bcc1c:	ebfd49b1 	bl	f2e8 <powf@plt>
   bcc20:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   bcc24:	eeb66a00 	vmov.f32	s12, #96	@ 0x3f000000  0.5
   bcc28:	ee060a90 	vmov	s13, r0
   bcc2c:	ee767aa6 	vadd.f32	s15, s13, s13
   bcc30:	eec76a27 	vdiv.f32	s13, s14, s15
   bcc34:	eebe7a00 	vmov.f32	s14, #224	@ 0xbf000000 -0.5
   bcc38:	ee366a67 	vsub.f32	s12, s12, s15
   bcc3c:	ee377a67 	vsub.f32	s14, s14, s15
   bcc40:	ee766aa6 	vadd.f32	s13, s13, s13
   bcc44:	eaffffc1 	b	bcb50 <mixerengine::SoundColorFxNoise::Whitenoise_Fil_Coef(int, float*)+0x54>
   bcc48:	e2441074 	sub	r1, r4, #116	@ 0x74
   bcc4c:	ee071a90 	vmov	s15, r1
   bcc50:	eef87ae7 	vcvt.f32.s32	s15, s15
   bcc54:	e3050dc7 	movw	r0, #24007	@ 0x5dc7
   bcc58:	e3430f70 	movt	r0, #16240	@ 0x3f70
   bcc5c:	ee171a90 	vmov	r1, s15
   bcc60:	eaffffed 	b	bcc1c <mixerengine::SoundColorFxNoise::Whitenoise_Fil_Coef(int, float*)+0x120>
   bcc64:	42960000 	.word	0x42960000
   bcc68:	40c90fdb 	.word	0x40c90fdb
   bcc6c:	37be37c6 	.word	0x37be37c6
   bcc70:	300d56d6 	.word	0x300d56d6

000bcc74 <mixerengine::SoundColorFxNoise::calcParameter()>:
   bcc74:	e5901060 	ldr	r1, [r0, #96]	@ 0x60
   bcc78:	e5903064 	ldr	r3, [r0, #100]	@ 0x64
   bcc7c:	e351007f 	cmp	r1, #127	@ 0x7f
   bcc80:	e92d40f0 	push	{r4, r5, r6, r7, lr}
   bcc84:	ed2d8b02 	vpush	{d8}
   bcc88:	c3a05000 	movgt	r5, #0
   bcc8c:	d3a05001 	movle	r5, #1
   bcc90:	e1510003 	cmp	r1, r3
   bcc94:	e24dd044 	sub	sp, sp, #68	@ 0x44
   bcc98:	e1a04000 	mov	r4, r0
   bcc9c:	aa000017 	bge	bcd00 <mixerengine::SoundColorFxNoise::calcParameter()+0x8c>
   bcca0:	e2812002 	add	r2, r1, #2
   bcca4:	e1530002 	cmp	r3, r2
   bcca8:	da000064 	ble	bce40 <mixerengine::SoundColorFxNoise::calcParameter()+0x1cc>
   bccac:	e2811003 	add	r1, r1, #3
   bccb0:	e5801060 	str	r1, [r0, #96]	@ 0x60
   bccb4:	e351007f 	cmp	r1, #127	@ 0x7f
   bccb8:	c3a07000 	movgt	r7, #0
   bccbc:	d3a07001 	movle	r7, #1
   bccc0:	ee071a10 	vmov	s14, r1
   bccc4:	eef87ac7 	vcvt.f32.s32	s15, s14
   bccc8:	ed9f7ace 	vldr	s14, [pc, #824]	@ bd008 <mixerengine::SoundColorFxNoise::calcParameter()+0x394>
   bcccc:	eef47ac7 	vcmpe.f32	s15, s14
   bccd0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bccd4:	8a000019 	bhi	bcd40 <mixerengine::SoundColorFxNoise::calcParameter()+0xcc>
   bccd8:	ed9f7acb 	vldr	s14, [pc, #812]	@ bd00c <mixerengine::SoundColorFxNoise::calcParameter()+0x398>
   bccdc:	eef47ac7 	vcmpe.f32	s15, s14
   bcce0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bcce4:	da00008a 	ble	bcf14 <mixerengine::SoundColorFxNoise::calcParameter()+0x2a0>
   bcce8:	ed9f7ac8 	vldr	s14, [pc, #800]	@ bd010 <mixerengine::SoundColorFxNoise::calcParameter()+0x39c>
   bccec:	e3a06000 	mov	r6, #0
   bccf0:	e3a01083 	mov	r1, #131	@ 0x83
   bccf4:	eef08a47 	vmov.f32	s17, s14
   bccf8:	eeb78a00 	vmov.f32	s16, #112	@ 0x3f800000  1.0
   bccfc:	ea000018 	b	bcd64 <mixerengine::SoundColorFxNoise::calcParameter()+0xf0>
   bcd00:	d1a07005 	movle	r7, r5
   bcd04:	daffffed 	ble	bccc0 <mixerengine::SoundColorFxNoise::calcParameter()+0x4c>
   bcd08:	e2412002 	sub	r2, r1, #2
   bcd0c:	e1530002 	cmp	r3, r2
   bcd10:	aa00004a 	bge	bce40 <mixerengine::SoundColorFxNoise::calcParameter()+0x1cc>
   bcd14:	e2411003 	sub	r1, r1, #3
   bcd18:	ee071a10 	vmov	s14, r1
   bcd1c:	eef87ac7 	vcvt.f32.s32	s15, s14
   bcd20:	ed9f7ab8 	vldr	s14, [pc, #736]	@ bd008 <mixerengine::SoundColorFxNoise::calcParameter()+0x394>
   bcd24:	e351007f 	cmp	r1, #127	@ 0x7f
   bcd28:	e5801060 	str	r1, [r0, #96]	@ 0x60
   bcd2c:	c3a07000 	movgt	r7, #0
   bcd30:	d3a07001 	movle	r7, #1
   bcd34:	eef47ac7 	vcmpe.f32	s15, s14
   bcd38:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bcd3c:	9affffe5 	bls	bccd8 <mixerengine::SoundColorFxNoise::calcParameter()+0x64>
   bcd40:	ed9f7ab3 	vldr	s14, [pc, #716]	@ bd014 <mixerengine::SoundColorFxNoise::calcParameter()+0x3a0>
   bcd44:	eef47ac7 	vcmpe.f32	s15, s14
   bcd48:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bcd4c:	8a000041 	bhi	bce58 <mixerengine::SoundColorFxNoise::calcParameter()+0x1e4>
   bcd50:	eeb78a00 	vmov.f32	s16, #112	@ 0x3f800000  1.0
   bcd54:	ed9f7aad 	vldr	s14, [pc, #692]	@ bd010 <mixerengine::SoundColorFxNoise::calcParameter()+0x39c>
   bcd58:	e3a06000 	mov	r6, #0
   bcd5c:	e3a01083 	mov	r1, #131	@ 0x83
   bcd60:	eef08a47 	vmov.f32	s17, s14
   bcd64:	e1a00004 	mov	r0, r4
   bcd68:	e28d202c 	add	r2, sp, #44	@ 0x2c
   bcd6c:	ed847a17 	vstr	s14, [r4, #92]	@ 0x5c
   bcd70:	ebffff61 	bl	bcafc <mixerengine::SoundColorFxNoise::Whitenoise_Fil_Coef(int, float*)>
   bcd74:	e59d202c 	ldr	r2, [sp, #44]	@ 0x2c
   bcd78:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
   bcd7c:	e1a0100d 	mov	r1, sp
   bcd80:	ee802b90 	vdup.32	d16, r2
   bcd84:	e59d2030 	ldr	r2, [sp, #48]	@ 0x30
   bcd88:	e1a00003 	mov	r0, r3
   bcd8c:	e5933000 	ldr	r3, [r3]
   bcd90:	edcd0b00 	vstr	d16, [sp]
   bcd94:	ee832b90 	vdup.32	d19, r2
   bcd98:	e59d2034 	ldr	r2, [sp, #52]	@ 0x34
   bcd9c:	e593300c 	ldr	r3, [r3, #12]
   bcda0:	edcd3b02 	vstr	d19, [sp, #8]
   bcda4:	ee822b90 	vdup.32	d18, r2
   bcda8:	e59d2038 	ldr	r2, [sp, #56]	@ 0x38
   bcdac:	edcd2b04 	vstr	d18, [sp, #16]
   bcdb0:	ee812b90 	vdup.32	d17, r2
   bcdb4:	e59d203c 	ldr	r2, [sp, #60]	@ 0x3c
   bcdb8:	edcd1b06 	vstr	d17, [sp, #24]
   bcdbc:	ee802b90 	vdup.32	d16, r2
   bcdc0:	edcd0b08 	vstr	d16, [sp, #32]
   bcdc4:	e12fff33 	blx	r3
   bcdc8:	e1550007 	cmp	r5, r7
   bcdcc:	0a000003 	beq	bcde0 <mixerengine::SoundColorFxNoise::calcParameter()+0x16c>
   bcdd0:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   bcdd4:	e5903000 	ldr	r3, [r0]
   bcdd8:	e5933018 	ldr	r3, [r3, #24]
   bcddc:	e12fff33 	blx	r3
   bcde0:	e3560000 	cmp	r6, #0
   bcde4:	0ddf7a8b 	vldreq	s15, [pc, #556]	@ bd018 <mixerengine::SoundColorFxNoise::calcParameter()+0x3a4>
   bcde8:	1ddf7a8a 	vldrne	s15, [pc, #552]	@ bd018 <mixerengine::SoundColorFxNoise::calcParameter()+0x3a4>
   bcdec:	ed946a11 	vldr	s12, [r4, #68]	@ 0x44
   bcdf0:	0e287aa8 	vmuleq.f32	s14, s17, s17
   bcdf4:	ed848a10 	vstr	s16, [r4, #64]	@ 0x40
   bcdf8:	0e277a07 	vmuleq.f32	s14, s14, s14
   bcdfc:	0e277a07 	vmuleq.f32	s14, s14, s14
   bce00:	0e676a07 	vmuleq.f32	s13, s14, s14
   bce04:	0d9f7a84 	vldreq	s14, [pc, #528]	@ bd01c <mixerengine::SoundColorFxNoise::calcParameter()+0x3a8>
   bce08:	0e467a87 	vmlaeq.f32	s15, s13, s14
   bce0c:	edd46a14 	vldr	s13, [r4, #80]	@ 0x50
   bce10:	ed947a16 	vldr	s14, [r4, #88]	@ 0x58
   bce14:	edc47a13 	vstr	s15, [r4, #76]	@ 0x4c
   bce18:	ee377a07 	vadd.f32	s14, s14, s14
   bce1c:	ee777ae6 	vsub.f32	s15, s15, s13
   bce20:	ee388a46 	vsub.f32	s16, s16, s12
   bce24:	ee677a27 	vmul.f32	s15, s14, s15
   bce28:	ee686a07 	vmul.f32	s13, s16, s14
   bce2c:	edc47a12 	vstr	s15, [r4, #72]	@ 0x48
   bce30:	edc46a0f 	vstr	s13, [r4, #60]	@ 0x3c
   bce34:	e28dd044 	add	sp, sp, #68	@ 0x44
   bce38:	ecbd8b02 	vpop	{d8}
   bce3c:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
   bce40:	e353007f 	cmp	r3, #127	@ 0x7f
   bce44:	e5843060 	str	r3, [r4, #96]	@ 0x60
   bce48:	e1a01003 	mov	r1, r3
   bce4c:	c3a07000 	movgt	r7, #0
   bce50:	d3a07001 	movle	r7, #1
   bce54:	eaffff99 	b	bccc0 <mixerengine::SoundColorFxNoise::calcParameter()+0x4c>
   bce58:	ee377ac7 	vsub.f32	s14, s15, s14
   bce5c:	eddf6a6f 	vldr	s13, [pc, #444]	@ bd020 <mixerengine::SoundColorFxNoise::calcParameter()+0x3ac>
   bce60:	ee678a26 	vmul.f32	s17, s14, s13
   bce64:	eeb57a00 	vmov.f32	s14, #80	@ 0x3e800000  0.250
   bce68:	ee788aa8 	vadd.f32	s17, s17, s17
   bce6c:	eef48ac7 	vcmpe.f32	s17, s14
   bce70:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bce74:	4eb17a00 	vmovmi.f32	s14, #16	@ 0x40800000  4.0
   bce78:	5d9f8a64 	vldrpl	s16, [pc, #400]	@ bd010 <mixerengine::SoundColorFxNoise::calcParameter()+0x39c>
   bce7c:	4eb78a00 	vmovmi.f32	s16, #112	@ 0x3f800000  1.0
   bce80:	4e088ac7 	vmlsmi.f32	s16, s17, s14
   bce84:	ed9f7a66 	vldr	s14, [pc, #408]	@ bd024 <mixerengine::SoundColorFxNoise::calcParameter()+0x3b0>
   bce88:	eef47ac7 	vcmpe.f32	s15, s14
   bce8c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bce90:	def76a00 	vmovle.f32	s13, #112	@ 0x3f800000  1.0
   bce94:	da00000a 	ble	bcec4 <mixerengine::SoundColorFxNoise::calcParameter()+0x250>
   bce98:	ee376ac7 	vsub.f32	s12, s15, s14
   bce9c:	eddf6a61 	vldr	s13, [pc, #388]	@ bd028 <mixerengine::SoundColorFxNoise::calcParameter()+0x3b4>
   bcea0:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   bcea4:	ee067a66 	vmls.f32	s14, s12, s13
   bcea8:	ee676a07 	vmul.f32	s13, s14, s14
   bceac:	ee666a87 	vmul.f32	s13, s13, s14
   bceb0:	ee666a87 	vmul.f32	s13, s13, s14
   bceb4:	ee666a87 	vmul.f32	s13, s13, s14
   bceb8:	ee666a87 	vmul.f32	s13, s13, s14
   bcebc:	ee666a87 	vmul.f32	s13, s13, s14
   bcec0:	ee666a87 	vmul.f32	s13, s13, s14
   bcec4:	ed9f7a58 	vldr	s14, [pc, #352]	@ bd02c <mixerengine::SoundColorFxNoise::calcParameter()+0x3b8>
   bcec8:	eef47ac7 	vcmpe.f32	s15, s14
   bcecc:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bced0:	da000029 	ble	bcf7c <mixerengine::SoundColorFxNoise::calcParameter()+0x308>
   bced4:	ed9f7a55 	vldr	s14, [pc, #340]	@ bd030 <mixerengine::SoundColorFxNoise::calcParameter()+0x3bc>
   bced8:	eef47ac7 	vcmpe.f32	s15, s14
   bcedc:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bcee0:	5a000025 	bpl	bcf7c <mixerengine::SoundColorFxNoise::calcParameter()+0x308>
   bcee4:	ee777a67 	vsub.f32	s15, s14, s15
   bcee8:	eddf6a4e 	vldr	s13, [pc, #312]	@ bd028 <mixerengine::SoundColorFxNoise::calcParameter()+0x3b4>
   bceec:	ed9f7a50 	vldr	s14, [pc, #320]	@ bd034 <mixerengine::SoundColorFxNoise::calcParameter()+0x3c0>
   bcef0:	ee677aa6 	vmul.f32	s15, s15, s13
   bcef4:	eddf6a4f 	vldr	s13, [pc, #316]	@ bd038 <mixerengine::SoundColorFxNoise::calcParameter()+0x3c4>
   bcef8:	ee676aa6 	vmul.f32	s13, s15, s13
   bcefc:	ee067ae7 	vmls.f32	s14, s13, s15
   bcf00:	eeb57a40 	vcmp.f32	s14, #0.0
   bcf04:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bcf08:	03a06000 	moveq	r6, #0
   bcf0c:	13a06001 	movne	r6, #1
   bcf10:	eaffff93 	b	bcd64 <mixerengine::SoundColorFxNoise::calcParameter()+0xf0>
   bcf14:	ed9f7a41 	vldr	s14, [pc, #260]	@ bd020 <mixerengine::SoundColorFxNoise::calcParameter()+0x3ac>
   bcf18:	ee678a87 	vmul.f32	s17, s15, s14
   bcf1c:	eeb78a00 	vmov.f32	s16, #112	@ 0x3f800000  1.0
   bcf20:	ee788aa8 	vadd.f32	s17, s17, s17
   bcf24:	eeb57a00 	vmov.f32	s14, #80	@ 0x3e800000  0.250
   bcf28:	ee788a68 	vsub.f32	s17, s16, s17
   bcf2c:	eef48ac7 	vcmpe.f32	s17, s14
   bcf30:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bcf34:	4eb17a00 	vmovmi.f32	s14, #16	@ 0x40800000  4.0
   bcf38:	5d9f8a34 	vldrpl	s16, [pc, #208]	@ bd010 <mixerengine::SoundColorFxNoise::calcParameter()+0x39c>
   bcf3c:	4e088ac7 	vmlsmi.f32	s16, s17, s14
   bcf40:	ed9f7a3d 	vldr	s14, [pc, #244]	@ bd03c <mixerengine::SoundColorFxNoise::calcParameter()+0x3c8>
   bcf44:	eef47ac7 	vcmpe.f32	s15, s14
   bcf48:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bcf4c:	def76a00 	vmovle.f32	s13, #112	@ 0x3f800000  1.0
   bcf50:	ca000018 	bgt	bcfb8 <mixerengine::SoundColorFxNoise::calcParameter()+0x344>
   bcf54:	ed9f7a39 	vldr	s14, [pc, #228]	@ bd040 <mixerengine::SoundColorFxNoise::calcParameter()+0x3cc>
   bcf58:	ee777a67 	vsub.f32	s15, s14, s15
   bcf5c:	ed9f7a38 	vldr	s14, [pc, #224]	@ bd044 <mixerengine::SoundColorFxNoise::calcParameter()+0x3d0>
   bcf60:	ee677a87 	vmul.f32	s15, s15, s14
   bcf64:	ee277aa6 	vmul.f32	s14, s15, s13
   bcf68:	eeb57a40 	vcmp.f32	s14, #0.0
   bcf6c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bcf70:	03a06000 	moveq	r6, #0
   bcf74:	13a06001 	movne	r6, #1
   bcf78:	eaffff79 	b	bcd64 <mixerengine::SoundColorFxNoise::calcParameter()+0xf0>
   bcf7c:	ed9f7a31 	vldr	s14, [pc, #196]	@ bd048 <mixerengine::SoundColorFxNoise::calcParameter()+0x3d4>
   bcf80:	eef47ac7 	vcmpe.f32	s15, s14
   bcf84:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bcf88:	5a000016 	bpl	bcfe8 <mixerengine::SoundColorFxNoise::calcParameter()+0x374>
   bcf8c:	ee777a67 	vsub.f32	s15, s14, s15
   bcf90:	eddf0b18 	vldr	d16, [pc, #96]	@ bcff8 <mixerengine::SoundColorFxNoise::calcParameter()+0x384>
   bcf94:	eddf1b19 	vldr	d17, [pc, #100]	@ bd000 <mixerengine::SoundColorFxNoise::calcParameter()+0x38c>
   bcf98:	eef72ae7 	vcvt.f64.f32	d18, s15
   bcf9c:	ee420ba1 	vmla.f64	d16, d18, d17
   bcfa0:	eeb77be0 	vcvt.f32.f64	s14, d16
   bcfa4:	eeb57a40 	vcmp.f32	s14, #0.0
   bcfa8:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bcfac:	03a06000 	moveq	r6, #0
   bcfb0:	13a06001 	movne	r6, #1
   bcfb4:	eaffff6a 	b	bcd64 <mixerengine::SoundColorFxNoise::calcParameter()+0xf0>
   bcfb8:	ee376ac7 	vsub.f32	s12, s15, s14
   bcfbc:	eddf6a22 	vldr	s13, [pc, #136]	@ bd04c <mixerengine::SoundColorFxNoise::calcParameter()+0x3d8>
   bcfc0:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   bcfc4:	ee067a66 	vmls.f32	s14, s12, s13
   bcfc8:	ee676a07 	vmul.f32	s13, s14, s14
   bcfcc:	ee666a87 	vmul.f32	s13, s13, s14
   bcfd0:	ee666a87 	vmul.f32	s13, s13, s14
   bcfd4:	ee666a87 	vmul.f32	s13, s13, s14
   bcfd8:	ee666a87 	vmul.f32	s13, s13, s14
   bcfdc:	ee666a87 	vmul.f32	s13, s13, s14
   bcfe0:	ee666a87 	vmul.f32	s13, s13, s14
   bcfe4:	eaffffda 	b	bcf54 <mixerengine::SoundColorFxNoise::calcParameter()+0x2e0>
   bcfe8:	ed9f7a0f 	vldr	s14, [pc, #60]	@ bd02c <mixerengine::SoundColorFxNoise::calcParameter()+0x3b8>
   bcfec:	ee777ac7 	vsub.f32	s15, s15, s14
   bcff0:	eaffffd9 	b	bcf5c <mixerengine::SoundColorFxNoise::calcParameter()+0x2e8>
   bcff4:	e320f000 	nop	{0}
   bcff8:	265d36e8 	.word	0x265d36e8
   bcffc:	3fe12bf5 	.word	0x3fe12bf5
   bd000:	8329f26b 	.word	0x8329f26b
   bd004:	3f859390 	.word	0x3f859390
   bd008:	42fe0000 	.word	0x42fe0000
   bd00c:	42f60000 	.word	0x42f60000
   bd010:	00000000 	.word	0x00000000
   bd014:	43040000 	.word	0x43040000
   bd018:	3f333333 	.word	0x3f333333
   bd01c:	3dcccccd 	.word	0x3dcccccd
   bd020:	3b853400 	.word	0x3b853400
   bd024:	43340000 	.word	0x43340000
   bd028:	3b83126f 	.word	0x3b83126f
   bd02c:	43030000 	.word	0x43030000
   bd030:	431d0000 	.word	0x431d0000
   bd034:	3f4ccccd 	.word	0x3f4ccccd
   bd038:	42a00000 	.word	0x42a00000
   bd03c:	42200000 	.word	0x42200000
   bd040:	42f80000 	.word	0x42f80000
   bd044:	3c37d4dd 	.word	0x3c37d4dd
   bd048:	43360000 	.word	0x43360000
   bd04c:	3ab78034 	.word	0x3ab78034

000bd050 <mixerengine::SoundColorFxNoise::initialize()>:
   bd050:	e92d4038 	push	{r3, r4, r5, lr}
   bd054:	eddf0b31 	vldr	d16, [pc, #196]	@ bd120 <mixerengine::SoundColorFxNoise::initialize()+0xd0>
   bd058:	e1a04000 	mov	r4, r0
   bd05c:	e5900038 	ldr	r0, [r0, #56]	@ 0x38
   bd060:	e3a03000 	mov	r3, #0
   bd064:	edc40b0a 	vstr	d16, [r4, #40]	@ 0x28
   bd068:	e5843054 	str	r3, [r4, #84]	@ 0x54
   bd06c:	e3500000 	cmp	r0, #0
   bd070:	e5945010 	ldr	r5, [r4, #16]
   bd074:	0a000003 	beq	bd088 <mixerengine::SoundColorFxNoise::initialize()+0x38>
   bd078:	e5943014 	ldr	r3, [r4, #20]
   bd07c:	e1550003 	cmp	r5, r3
   bd080:	0a000010 	beq	bd0c8 <mixerengine::SoundColorFxNoise::initialize()+0x78>
   bd084:	ebfd47f8 	bl	f06c <operator delete[](void*)@plt>
   bd088:	e1a00185 	lsl	r0, r5, #3
   bd08c:	ebfd4685 	bl	eaa8 <operator new[](unsigned int)@plt>
   bd090:	e2553001 	subs	r3, r5, #1
   bd094:	3a000005 	bcc	bd0b0 <mixerengine::SoundColorFxNoise::initialize()+0x60>
   bd098:	e1a02000 	mov	r2, r0
   bd09c:	eddf0b1f 	vldr	d16, [pc, #124]	@ bd120 <mixerengine::SoundColorFxNoise::initialize()+0xd0>
   bd0a0:	e2433001 	sub	r3, r3, #1
   bd0a4:	ece20b02 	vstmia	r2!, {d16}
   bd0a8:	e3730001 	cmn	r3, #1
   bd0ac:	1afffffb 	bne	bd0a0 <mixerengine::SoundColorFxNoise::initialize()+0x50>
   bd0b0:	ee075a10 	vmov	s14, r5
   bd0b4:	eef87ac7 	vcvt.f32.s32	s15, s14
   bd0b8:	e5840038 	str	r0, [r4, #56]	@ 0x38
   bd0bc:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   bd0c0:	eec77a27 	vdiv.f32	s15, s14, s15
   bd0c4:	edc47a16 	vstr	s15, [r4, #88]	@ 0x58
   bd0c8:	ed947a07 	vldr	s14, [r4, #28]
   bd0cc:	eddf7a15 	vldr	s15, [pc, #84]	@ bd128 <mixerengine::SoundColorFxNoise::initialize()+0xd8>
   bd0d0:	ee677a27 	vmul.f32	s15, s14, s15
   bd0d4:	e1a00004 	mov	r0, r4
   bd0d8:	eefd7ae7 	vcvt.s32.f32	s15, s15
   bd0dc:	ee173a90 	vmov	r3, s15
   bd0e0:	e1a03143 	asr	r3, r3, #2
   bd0e4:	e5843064 	str	r3, [r4, #100]	@ 0x64
   bd0e8:	e5843060 	str	r3, [r4, #96]	@ 0x60
   bd0ec:	ebfffee0 	bl	bcc74 <mixerengine::SoundColorFxNoise::calcParameter()>
   bd0f0:	e5943040 	ldr	r3, [r4, #64]	@ 0x40
   bd0f4:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   bd0f8:	e3a02000 	mov	r2, #0
   bd0fc:	e594104c 	ldr	r1, [r4, #76]	@ 0x4c
   bd100:	e5843044 	str	r3, [r4, #68]	@ 0x44
   bd104:	e5903000 	ldr	r3, [r0]
   bd108:	e5841050 	str	r1, [r4, #80]	@ 0x50
   bd10c:	e584203c 	str	r2, [r4, #60]	@ 0x3c
   bd110:	e5842048 	str	r2, [r4, #72]	@ 0x48
   bd114:	e5933018 	ldr	r3, [r3, #24]
   bd118:	e12fff33 	blx	r3
   bd11c:	e8bd8038 	pop	{r3, r4, r5, pc}
	...
   bd128:	447fc000 	.word	0x447fc000

000bd12c <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)>:
   bd12c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   bd130:	ed2d8b02 	vpush	{d8}
   bd134:	e28db028 	add	fp, sp, #40	@ 0x28
   bd138:	eddf0bc0 	vldr	d16, [pc, #768]	@ bd440 <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x314>
   bd13c:	e1a04000 	mov	r4, r0
   bd140:	e24dd034 	sub	sp, sp, #52	@ 0x34
   bd144:	e1a00183 	lsl	r0, r3, #3
   bd148:	e2800008 	add	r0, r0, #8
   bd14c:	e50b3054 	str	r3, [fp, #-84]	@ 0xffffffac
   bd150:	e1a03083 	lsl	r3, r3, #1
   bd154:	e04dd000 	sub	sp, sp, r0
   bd158:	e3530000 	cmp	r3, #0
   bd15c:	e50b1058 	str	r1, [fp, #-88]	@ 0xffffffa8
   bd160:	e1a09002 	mov	r9, r2
   bd164:	ed4b0b11 	vstr	d16, [fp, #-68]	@ 0xffffffbc
   bd168:	e1a0200d 	mov	r2, sp
   bd16c:	ed4b0b0f 	vstr	d16, [fp, #-60]	@ 0xffffffc4
   bd170:	e5940068 	ldr	r0, [r4, #104]	@ 0x68
   bd174:	e594106c 	ldr	r1, [r4, #108]	@ 0x6c
   bd178:	da00000b 	ble	bd1ac <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x80>
   bd17c:	e1a0500d 	mov	r5, sp
   bd180:	e3a0c000 	mov	ip, #0
   bd184:	ed9f7aaf 	vldr	s14, [pc, #700]	@ bd448 <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x31c>
   bd188:	ee061a90 	vmov	s13, r1
   bd18c:	eef87ae6 	vcvt.f32.s32	s15, s13
   bd190:	e28cc001 	add	ip, ip, #1
   bd194:	e0200001 	eor	r0, r0, r1
   bd198:	e15c0003 	cmp	ip, r3
   bd19c:	e0811000 	add	r1, r1, r0
   bd1a0:	ee677a87 	vmul.f32	s15, s15, s14
   bd1a4:	ece57a01 	vstmia	r5!, {s15}
   bd1a8:	1afffff6 	bne	bd188 <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x5c>
   bd1ac:	e51b3054 	ldr	r3, [fp, #-84]	@ 0xffffffac
   bd1b0:	e50b004c 	str	r0, [fp, #-76]	@ 0xffffffb4
   bd1b4:	e3530000 	cmp	r3, #0
   bd1b8:	e50b1048 	str	r1, [fp, #-72]	@ 0xffffffb8
   bd1bc:	ed5b0b13 	vldr	d16, [fp, #-76]	@ 0xffffffb4
   bd1c0:	edc40b1a 	vstr	d16, [r4, #104]	@ 0x68
   bd1c4:	da00000e 	ble	bd204 <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0xd8>
   bd1c8:	e5945038 	ldr	r5, [r4, #56]	@ 0x38
   bd1cc:	e2822004 	add	r2, r2, #4
   bd1d0:	e1a06003 	mov	r6, r3
   bd1d4:	e3a03000 	mov	r3, #0
   bd1d8:	e512c004 	ldr	ip, [r2, #-4]
   bd1dc:	e0851183 	add	r1, r5, r3, lsl #3
   bd1e0:	e4920008 	ldr	r0, [r2], #8
   bd1e4:	e2833001 	add	r3, r3, #1
   bd1e8:	e1530006 	cmp	r3, r6
   bd1ec:	e50bc034 	str	ip, [fp, #-52]	@ 0xffffffcc
   bd1f0:	e24bc034 	sub	ip, fp, #52	@ 0x34
   bd1f4:	e50b0030 	str	r0, [fp, #-48]	@ 0xffffffd0
   bd1f8:	f46c078f 	vld1.32	{d16}, [ip]
   bd1fc:	edc10b00 	vstr	d16, [r1]
   bd200:	1afffff4 	bne	bd1d8 <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0xac>
   bd204:	eeb17a00 	vmov.f32	s14, #16	@ 0x40800000  4.0
   bd208:	edd47a08 	vldr	s15, [r4, #32]
   bd20c:	eef66a00 	vmov.f32	s13, #96	@ 0x3f000000  0.5
   bd210:	ee277a87 	vmul.f32	s14, s15, s14
   bd214:	eef47ae6 	vcmpe.f32	s15, s13
   bd218:	ee277a87 	vmul.f32	s14, s15, s14
   bd21c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bd220:	ba000007 	blt	bd244 <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x118>
   bd224:	ee776ae6 	vsub.f32	s13, s15, s13
   bd228:	ed9f6a87 	vldr	s12, [pc, #540]	@ bd44c <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x320>
   bd22c:	ee266a86 	vmul.f32	s12, s13, s12
   bd230:	ee266a86 	vmul.f32	s12, s13, s12
   bd234:	ee666a86 	vmul.f32	s13, s13, s12
   bd238:	ee777aa7 	vadd.f32	s15, s15, s15
   bd23c:	ee476a87 	vmla.f32	s13, s15, s14
   bd240:	eeb07a66 	vmov.f32	s14, s13
   bd244:	eddf7a81 	vldr	s15, [pc, #516]	@ bd450 <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x324>
   bd248:	ee677a27 	vmul.f32	s15, s14, s15
   bd24c:	edd46a15 	vldr	s13, [r4, #84]	@ 0x54
   bd250:	ed947a16 	vldr	s14, [r4, #88]	@ 0x58
   bd254:	ee776ae6 	vsub.f32	s13, s15, s13
   bd258:	ee377a07 	vadd.f32	s14, s14, s14
   bd25c:	ee668a87 	vmul.f32	s17, s13, s14
   bd260:	ed9f7a7b 	vldr	s14, [pc, #492]	@ bd454 <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x328>
   bd264:	eef48ac7 	vcmpe.f32	s17, s14
   bd268:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bd26c:	5a000004 	bpl	bd284 <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x158>
   bd270:	ed9f7a78 	vldr	s14, [pc, #480]	@ bd458 <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x32c>
   bd274:	eef48a47 	vcmp.f32	s17, s14
   bd278:	ed9f7a77 	vldr	s14, [pc, #476]	@ bd45c <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x330>
   bd27c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bd280:	cef08a47 	vmovgt.f32	s17, s14
   bd284:	ed5b6a15 	vldr	s13, [fp, #-84]	@ 0xffffffac
   bd288:	eeb87ae6 	vcvt.f32.s32	s14, s13
   bd28c:	ee160a90 	vmov	r0, s13
   bd290:	e080afa0 	add	sl, r0, r0, lsr #31
   bd294:	e3a01000 	mov	r1, #0
   bd298:	e50b1050 	str	r1, [fp, #-80]	@ 0xffffffb0
   bd29c:	e1a0a0ca 	asr	sl, sl, #1
   bd2a0:	e1a08001 	mov	r8, r1
   bd2a4:	ee676a28 	vmul.f32	s13, s14, s17
   bd2a8:	eeb67a00 	vmov.f32	s14, #96	@ 0x3f000000  0.5
   bd2ac:	ee467ac7 	vmls.f32	s15, s13, s14
   bd2b0:	edc47a15 	vstr	s15, [r4, #84]	@ 0x54
   bd2b4:	e5942060 	ldr	r2, [r4, #96]	@ 0x60
   bd2b8:	e5943064 	ldr	r3, [r4, #100]	@ 0x64
   bd2bc:	e1520003 	cmp	r2, r3
   bd2c0:	0a000001 	beq	bd2cc <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x1a0>
   bd2c4:	e1a00004 	mov	r0, r4
   bd2c8:	ebfffe69 	bl	bcc74 <mixerengine::SoundColorFxNoise::calcParameter()>
   bd2cc:	e51b2050 	ldr	r2, [fp, #-80]	@ 0xffffffb0
   bd2d0:	e35a0000 	cmp	sl, #0
   bd2d4:	e0823fa2 	add	r3, r2, r2, lsr #31
   bd2d8:	e1a030c3 	asr	r3, r3, #1
   bd2dc:	da00004c 	ble	bd414 <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x2e8>
   bd2e0:	eeb78a00 	vmov.f32	s16, #112	@ 0x3f800000  1.0
   bd2e4:	e51bc058 	ldr	ip, [fp, #-88]	@ 0xffffffa8
   bd2e8:	e1a03183 	lsl	r3, r3, #3
   bd2ec:	e3a05000 	mov	r5, #0
   bd2f0:	e0896003 	add	r6, r9, r3
   bd2f4:	e08c7003 	add	r7, ip, r3
   bd2f8:	ed947a12 	vldr	s14, [r4, #72]	@ 0x48
   bd2fc:	eeb57a40 	vcmp.f32	s14, #0.0
   bd300:	edd46a13 	vldr	s13, [r4, #76]	@ 0x4c
   bd304:	edd47a14 	vldr	s15, [r4, #80]	@ 0x50
   bd308:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bd30c:	0a00000a 	beq	bd33c <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x210>
   bd310:	ee777a27 	vadd.f32	s15, s14, s15
   bd314:	ee366ae7 	vsub.f32	s12, s13, s15
   bd318:	edc47a14 	vstr	s15, [r4, #80]	@ 0x50
   bd31c:	ee277a06 	vmul.f32	s14, s14, s12
   bd320:	eeb57ac0 	vcmpe.f32	s14, #0.0
   bd324:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bd328:	93a00000 	movls	r0, #0
   bd32c:	9e070a90 	vmovls	s15, r0
   bd330:	9dc47a12 	vstrls	s15, [r4, #72]	@ 0x48
   bd334:	9ef07a66 	vmovls.f32	s15, s13
   bd338:	9dc46a14 	vstrls	s13, [r4, #80]	@ 0x50
   bd33c:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   bd340:	f3fc0c07 	vdup.32	d16, d7[1]
   bd344:	edd42b0a 	vldr	d18, [r4, #40]	@ 0x28
   bd348:	f3422db0 	vmul.f32	d18, d18, d16
   bd34c:	e5942038 	ldr	r2, [r4, #56]	@ 0x38
   bd350:	e0693006 	rsb	r3, r9, r6
   bd354:	e590c000 	ldr	ip, [r0]
   bd358:	edc40b0c 	vstr	d16, [r4, #48]	@ 0x30
   bd35c:	e0823003 	add	r3, r2, r3
   bd360:	e24b103c 	sub	r1, fp, #60	@ 0x3c
   bd364:	edd31b00 	vldr	d17, [r3]
   bd368:	e24b2044 	sub	r2, fp, #68	@ 0x44
   bd36c:	f2410da2 	vadd.f32	d16, d17, d18
   bd370:	e3a03001 	mov	r3, #1
   bd374:	e59cc014 	ldr	ip, [ip, #20]
   bd378:	ed4b0b0f 	vstr	d16, [fp, #-60]	@ 0xffffffc4
   bd37c:	e12fff3c 	blx	ip
   bd380:	edd47a0f 	vldr	s15, [r4, #60]	@ 0x3c
   bd384:	eef57a40 	vcmp.f32	s15, #0.0
   bd388:	ed5b0b11 	vldr	d16, [fp, #-68]	@ 0xffffffbc
   bd38c:	ed947a10 	vldr	s14, [r4, #64]	@ 0x40
   bd390:	edc40b0a 	vstr	d16, [r4, #40]	@ 0x28
   bd394:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bd398:	0a00000a 	beq	bd3c8 <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x29c>
   bd39c:	edd46a11 	vldr	s13, [r4, #68]	@ 0x44
   bd3a0:	ee776aa6 	vadd.f32	s13, s15, s13
   bd3a4:	ee376a66 	vsub.f32	s12, s14, s13
   bd3a8:	edc46a11 	vstr	s13, [r4, #68]	@ 0x44
   bd3ac:	ee677a86 	vmul.f32	s15, s15, s12
   bd3b0:	eef57ac0 	vcmpe.f32	s15, #0.0
   bd3b4:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bd3b8:	93a00000 	movls	r0, #0
   bd3bc:	9d847a11 	vstrls	s14, [r4, #68]	@ 0x44
   bd3c0:	9e060a90 	vmovls	s13, r0
   bd3c4:	9dc46a0f 	vstrls	s13, [r4, #60]	@ 0x3c
   bd3c8:	eeb06a48 	vmov.f32	s12, s16
   bd3cc:	edd47a11 	vldr	s15, [r4, #68]	@ 0x44
   bd3d0:	e3580000 	cmp	r8, #0
   bd3d4:	ed947a15 	vldr	s14, [r4, #84]	@ 0x54
   bd3d8:	edd46a17 	vldr	s13, [r4, #92]	@ 0x5c
   bd3dc:	e2855001 	add	r5, r5, #1
   bd3e0:	ecf71b02 	vldmia	r7!, {d17}
   bd3e4:	ee076ae7 	vmls.f32	s12, s15, s15
   bd3e8:	0e387a87 	vaddeq.f32	s14, s17, s14
   bd3ec:	ee666a26 	vmul.f32	s13, s12, s13
   bd3f0:	0d847a15 	vstreq	s14, [r4, #84]	@ 0x54
   bd3f4:	f3b47c07 	vdup.32	d7, d7[0]
   bd3f8:	e155000a 	cmp	r5, sl
   bd3fc:	f3007d97 	vmul.f32	d7, d16, d7
   bd400:	f3fc0c06 	vdup.32	d16, d6[1]
   bd404:	f3470d30 	vmul.f32	d16, d7, d16
   bd408:	f2410da0 	vadd.f32	d16, d17, d16
   bd40c:	ece60b02 	vstmia	r6!, {d16}
   bd410:	1affffb8 	bne	bd2f8 <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x1cc>
   bd414:	e2888001 	add	r8, r8, #1
   bd418:	e51b1050 	ldr	r1, [fp, #-80]	@ 0xffffffb0
   bd41c:	e51b2054 	ldr	r2, [fp, #-84]	@ 0xffffffac
   bd420:	e3580002 	cmp	r8, #2
   bd424:	e0811002 	add	r1, r1, r2
   bd428:	e50b1050 	str	r1, [fp, #-80]	@ 0xffffffb0
   bd42c:	1affffa0 	bne	bd2b4 <mixerengine::SoundColorFxNoise::execute(common::Float2 const*, common::Float2*, int)+0x188>
   bd430:	e24bd028 	sub	sp, fp, #40	@ 0x28
   bd434:	ecbd8b02 	vpop	{d8}
   bd438:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
   bd43c:	ebfd469e 	bl	eebc <__cxa_end_cleanup@plt>
	...
   bd448:	30000000 	.word	0x30000000
   bd44c:	42000000 	.word	0x42000000
   bd450:	3e19999a 	.word	0x3e19999a
   bd454:	34000000 	.word	0x34000000
   bd458:	b4000000 	.word	0xb4000000
   bd45c:	00000000 	.word	0x00000000
