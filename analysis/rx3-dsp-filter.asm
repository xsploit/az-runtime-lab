
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000cdf70 <mixerengine::SoundColorFxFilter::~SoundColorFxFilter()>:
   cdf70:	e92d4010 	push	{r4, lr}
   cdf74:	e1a04000 	mov	r4, r0
   cdf78:	e5900024 	ldr	r0, [r0, #36]	@ 0x24
   cdf7c:	e59f3048 	ldr	r3, [pc, #72]	@ cdfcc <mixerengine::SoundColorFxFilter::~SoundColorFxFilter()+0x5c>
   cdf80:	e3500000 	cmp	r0, #0
   cdf84:	e5843000 	str	r3, [r4]
   cdf88:	0a000002 	beq	cdf98 <mixerengine::SoundColorFxFilter::~SoundColorFxFilter()+0x28>
   cdf8c:	e5903000 	ldr	r3, [r0]
   cdf90:	e5933004 	ldr	r3, [r3, #4]
   cdf94:	e12fff33 	blx	r3
   cdf98:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   cdf9c:	e3500000 	cmp	r0, #0
   cdfa0:	0a000002 	beq	cdfb0 <mixerengine::SoundColorFxFilter::~SoundColorFxFilter()+0x40>
   cdfa4:	e5903000 	ldr	r3, [r0]
   cdfa8:	e5933004 	ldr	r3, [r3, #4]
   cdfac:	e12fff33 	blx	r3
   cdfb0:	e59f3018 	ldr	r3, [pc, #24]	@ cdfd0 <mixerengine::SoundColorFxFilter::~SoundColorFxFilter()+0x60>
   cdfb4:	e1a00004 	mov	r0, r4
   cdfb8:	e5843000 	str	r3, [r4]
   cdfbc:	e8bd8010 	pop	{r4, pc}
   cdfc0:	e59f3008 	ldr	r3, [pc, #8]	@ cdfd0 <mixerengine::SoundColorFxFilter::~SoundColorFxFilter()+0x60>
   cdfc4:	e5843000 	str	r3, [r4]
   cdfc8:	ebfd03bb 	bl	eebc <__cxa_end_cleanup@plt>
   cdfcc:	0042d9c0 	.word	0x0042d9c0
   cdfd0:	0041db60 	.word	0x0041db60

000cdfd4 <mixerengine::SoundColorFxFilter::changeColorValue()>:
   cdfd4:	ed907a07 	vldr	s14, [r0, #28]
   cdfd8:	eddf7a05 	vldr	s15, [pc, #20]	@ cdff4 <mixerengine::SoundColorFxFilter::changeColorValue()+0x20>
   cdfdc:	ee677a27 	vmul.f32	s15, s14, s15
   cdfe0:	eefd7ae7 	vcvt.s32.f32	s15, s15
   cdfe4:	ee173a90 	vmov	r3, s15
   cdfe8:	e1a03143 	asr	r3, r3, #2
   cdfec:	e5803054 	str	r3, [r0, #84]	@ 0x54
   cdff0:	e12fff1e 	bx	lr
   cdff4:	447fc000 	.word	0x447fc000

000cdff8 <mixerengine::SoundColorFxFilter::changeColorParameter()>:
   cdff8:	e3a03001 	mov	r3, #1
   cdffc:	e5c0304d 	strb	r3, [r0, #77]	@ 0x4d
   ce000:	e12fff1e 	bx	lr

000ce004 <mixerengine::SoundColorFxFilter::changeCfxStatus_On()>:
   ce004:	e3a00001 	mov	r0, #1
   ce008:	e12fff1e 	bx	lr

000ce00c <mixerengine::SoundColorFxFilter::changeCfxStatus_Off()>:
   ce00c:	e3a00001 	mov	r0, #1
   ce010:	e12fff1e 	bx	lr

000ce014 <mixerengine::SoundColorFxFilter::~SoundColorFxFilter()>:
   ce014:	e92d4010 	push	{r4, lr}
   ce018:	e1a04000 	mov	r4, r0
   ce01c:	e5900024 	ldr	r0, [r0, #36]	@ 0x24
   ce020:	e59f3050 	ldr	r3, [pc, #80]	@ ce078 <mixerengine::SoundColorFxFilter::~SoundColorFxFilter()+0x64>
   ce024:	e3500000 	cmp	r0, #0
   ce028:	e5843000 	str	r3, [r4]
   ce02c:	0a000002 	beq	ce03c <mixerengine::SoundColorFxFilter::~SoundColorFxFilter()+0x28>
   ce030:	e5903000 	ldr	r3, [r0]
   ce034:	e5933004 	ldr	r3, [r3, #4]
   ce038:	e12fff33 	blx	r3
   ce03c:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   ce040:	e3500000 	cmp	r0, #0
   ce044:	0a000002 	beq	ce054 <mixerengine::SoundColorFxFilter::~SoundColorFxFilter()+0x40>
   ce048:	e5903000 	ldr	r3, [r0]
   ce04c:	e5933004 	ldr	r3, [r3, #4]
   ce050:	e12fff33 	blx	r3
   ce054:	e59f3020 	ldr	r3, [pc, #32]	@ ce07c <mixerengine::SoundColorFxFilter::~SoundColorFxFilter()+0x68>
   ce058:	e1a00004 	mov	r0, r4
   ce05c:	e5843000 	str	r3, [r4]
   ce060:	ebfd031a 	bl	ecd0 <operator delete(void*)@plt>
   ce064:	e1a00004 	mov	r0, r4
   ce068:	e8bd8010 	pop	{r4, pc}
   ce06c:	e59f3008 	ldr	r3, [pc, #8]	@ ce07c <mixerengine::SoundColorFxFilter::~SoundColorFxFilter()+0x68>
   ce070:	e5843000 	str	r3, [r4]
   ce074:	ebfd0390 	bl	eebc <__cxa_end_cleanup@plt>
   ce078:	0042d9c0 	.word	0x0042d9c0
   ce07c:	0041db60 	.word	0x0041db60

000ce080 <mixerengine::SoundColorFxFilter::SoundColorFxFilter()>:
   ce080:	e92d4038 	push	{r3, r4, r5, lr}
   ce084:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   ce088:	e59f30b8 	ldr	r3, [pc, #184]	@ ce148 <mixerengine::SoundColorFxFilter::SoundColorFxFilter()+0xc8>
   ce08c:	f2c00010 	vmov.i32	d16, #0	@ 0x00000000
   ce090:	e1a04000 	mov	r4, r0
   ce094:	e2800010 	add	r0, r0, #16
   ce098:	e284c01c 	add	ip, r4, #28
   ce09c:	e3a01001 	mov	r1, #1
   ce0a0:	e5932000 	ldr	r2, [r3]
   ce0a4:	ee062a90 	vmov	s13, r2
   ce0a8:	f440078f 	vst1.32	{d16}, [r0]
   ce0ac:	f2c60f10 	vmov.f32	d16, #0.5	@ 0x3f000000
   ce0b0:	e3a00000 	mov	r0, #0
   ce0b4:	e5841018 	str	r1, [r4, #24]
   ce0b8:	e5840040 	str	r0, [r4, #64]	@ 0x40
   ce0bc:	e3a03000 	mov	r3, #0
   ce0c0:	e5842004 	str	r2, [r4, #4]
   ce0c4:	e3a00048 	mov	r0, #72	@ 0x48
   ce0c8:	e5842008 	str	r2, [r4, #8]
   ce0cc:	eeb87a66 	vcvt.f32.u32	s14, s13
   ce0d0:	f44c078f 	vst1.32	{d16}, [ip]
   ce0d4:	edc47a0d 	vstr	s15, [r4, #52]	@ 0x34
   ce0d8:	edc47a0e 	vstr	s15, [r4, #56]	@ 0x38
   ce0dc:	edc47a0f 	vstr	s15, [r4, #60]	@ 0x3c
   ce0e0:	e59fc064 	ldr	ip, [pc, #100]	@ ce14c <mixerengine::SoundColorFxFilter::SoundColorFxFilter()+0xcc>
   ce0e4:	e5c4104c 	strb	r1, [r4, #76]	@ 0x4c
   ce0e8:	e5c4304d 	strb	r3, [r4, #77]	@ 0x4d
   ce0ec:	e584c000 	str	ip, [r4]
   ce0f0:	eec77a87 	vdiv.f32	s15, s15, s14
   ce0f4:	e5843050 	str	r3, [r4, #80]	@ 0x50
   ce0f8:	e5843054 	str	r3, [r4, #84]	@ 0x54
   ce0fc:	edc47a03 	vstr	s15, [r4, #12]
   ce100:	ebfd0088 	bl	e328 <operator new(unsigned int)@plt>
   ce104:	e1a05000 	mov	r5, r0
   ce108:	ebff34f0 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   ce10c:	e5845024 	str	r5, [r4, #36]	@ 0x24
   ce110:	e3a00048 	mov	r0, #72	@ 0x48
   ce114:	ebfd0083 	bl	e328 <operator new(unsigned int)@plt>
   ce118:	e1a05000 	mov	r5, r0
   ce11c:	ebff34eb 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   ce120:	e5845028 	str	r5, [r4, #40]	@ 0x28
   ce124:	e1a00004 	mov	r0, r4
   ce128:	e8bd8038 	pop	{r3, r4, r5, pc}
   ce12c:	e59f301c 	ldr	r3, [pc, #28]	@ ce150 <mixerengine::SoundColorFxFilter::SoundColorFxFilter()+0xd0>
   ce130:	e5843000 	str	r3, [r4]
   ce134:	ebfd0360 	bl	eebc <__cxa_end_cleanup@plt>
   ce138:	e1a00005 	mov	r0, r5
   ce13c:	ebfd02e3 	bl	ecd0 <operator delete(void*)@plt>
   ce140:	eafffff9 	b	ce12c <mixerengine::SoundColorFxFilter::SoundColorFxFilter()+0xac>
   ce144:	eafffffb 	b	ce138 <mixerengine::SoundColorFxFilter::SoundColorFxFilter()+0xb8>
   ce148:	004172c0 	.word	0x004172c0
   ce14c:	0042d9c0 	.word	0x0042d9c0
   ce150:	0041db60 	.word	0x0041db60

000ce154 <mixerengine::SoundColorFxFilter::calcParameter()>:
   ce154:	e5903050 	ldr	r3, [r0, #80]	@ 0x50
   ce158:	e5902054 	ldr	r2, [r0, #84]	@ 0x54
   ce15c:	e92d4030 	push	{r4, r5, lr}
   ce160:	ed2d8b06 	vpush	{d8-d10}
   ce164:	e1530002 	cmp	r3, r2
   ce168:	e24dd01c 	sub	sp, sp, #28
   ce16c:	e1a04000 	mov	r4, r0
   ce170:	aa00001b 	bge	ce1e4 <mixerengine::SoundColorFxFilter::calcParameter()+0x90>
   ce174:	e2831001 	add	r1, r3, #1
   ce178:	e1520001 	cmp	r2, r1
   ce17c:	d5801050 	strle	r1, [r0, #80]	@ 0x50
   ce180:	c2833002 	addgt	r3, r3, #2
   ce184:	c5803050 	strgt	r3, [r0, #80]	@ 0x50
   ce188:	d1a03001 	movle	r3, r1
   ce18c:	ee073a10 	vmov	s14, r3
   ce190:	eef87ac7 	vcvt.f32.s32	s15, s14
   ce194:	ed9f7abf 	vldr	s14, [pc, #764]	@ ce498 <mixerengine::SoundColorFxFilter::calcParameter()+0x344>
   ce198:	edd46a08 	vldr	s13, [r4, #32]
   ce19c:	eef47ac7 	vcmpe.f32	s15, s14
   ce1a0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce1a4:	5a00001c 	bpl	ce21c <mixerengine::SoundColorFxFilter::calcParameter()+0xc8>
   ce1a8:	ed9f7abb 	vldr	s14, [pc, #748]	@ ce49c <mixerengine::SoundColorFxFilter::calcParameter()+0x348>
   ce1ac:	ee277a87 	vmul.f32	s14, s15, s14
   ce1b0:	ed9f6aba 	vldr	s12, [pc, #744]	@ ce4a0 <mixerengine::SoundColorFxFilter::calcParameter()+0x34c>
   ce1b4:	ed9f8aba 	vldr	s16, [pc, #744]	@ ce4a4 <mixerengine::SoundColorFxFilter::calcParameter()+0x350>
   ce1b8:	ee675a07 	vmul.f32	s11, s14, s14
   ce1bc:	ee655a87 	vmul.f32	s11, s11, s14
   ce1c0:	ed9f7ab8 	vldr	s14, [pc, #736]	@ ce4a8 <mixerengine::SoundColorFxFilter::calcParameter()+0x354>
   ce1c4:	eef47ac6 	vcmpe.f32	s15, s12
   ce1c8:	ee058a87 	vmla.f32	s16, s11, s14
   ce1cc:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce1d0:	5a0000aa 	bpl	ce480 <mixerengine::SoundColorFxFilter::calcParameter()+0x32c>
   ce1d4:	ed9f7ac3 	vldr	s14, [pc, #780]	@ ce4e8 <mixerengine::SoundColorFxFilter::calcParameter()+0x394>
   ce1d8:	eef38a04 	vmov.f32	s17, #52	@ 0x41a00000  20.0
   ce1dc:	eeb09a47 	vmov.f32	s18, s14
   ce1e0:	ea000015 	b	ce23c <mixerengine::SoundColorFxFilter::calcParameter()+0xe8>
   ce1e4:	daffffe8 	ble	ce18c <mixerengine::SoundColorFxFilter::calcParameter()+0x38>
   ce1e8:	e2431001 	sub	r1, r3, #1
   ce1ec:	e1520001 	cmp	r2, r1
   ce1f0:	a5801050 	strge	r1, [r0, #80]	@ 0x50
   ce1f4:	b2433002 	sublt	r3, r3, #2
   ce1f8:	b5803050 	strlt	r3, [r0, #80]	@ 0x50
   ce1fc:	a1a03001 	movge	r3, r1
   ce200:	ee073a10 	vmov	s14, r3
   ce204:	eef87ac7 	vcvt.f32.s32	s15, s14
   ce208:	ed9f7aa2 	vldr	s14, [pc, #648]	@ ce498 <mixerengine::SoundColorFxFilter::calcParameter()+0x344>
   ce20c:	edd46a08 	vldr	s13, [r4, #32]
   ce210:	eef47ac7 	vcmpe.f32	s15, s14
   ce214:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce218:	4affffe2 	bmi	ce1a8 <mixerengine::SoundColorFxFilter::calcParameter()+0x54>
   ce21c:	ed9f7aa2 	vldr	s14, [pc, #648]	@ ce4ac <mixerengine::SoundColorFxFilter::calcParameter()+0x358>
   ce220:	eef47ac7 	vcmpe.f32	s15, s14
   ce224:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce228:	ca00007d 	bgt	ce424 <mixerengine::SoundColorFxFilter::calcParameter()+0x2d0>
   ce22c:	eef38a04 	vmov.f32	s17, #52	@ 0x41a00000  20.0
   ce230:	ed9f7aac 	vldr	s14, [pc, #688]	@ ce4e8 <mixerengine::SoundColorFxFilter::calcParameter()+0x394>
   ce234:	ed9f8aaa 	vldr	s16, [pc, #680]	@ ce4e4 <mixerengine::SoundColorFxFilter::calcParameter()+0x390>
   ce238:	eeb79a00 	vmov.f32	s18, #112	@ 0x3f800000  1.0
   ce23c:	eef69a00 	vmov.f32	s19, #96	@ 0x3f000000  0.5
   ce240:	eef46ae9 	vcmpe.f32	s13, s19
   ce244:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce248:	4e766aa6 	vaddmi.f32	s13, s13, s13
   ce24c:	4eb76a00 	vmovmi.f32	s12, #112	@ 0x3f800000  1.0
   ce250:	4e766a66 	vsubmi.f32	s13, s12, s13
   ce254:	4e066ae6 	vmlsmi.f32	s12, s13, s13
   ce258:	5e766ae9 	vsubpl.f32	s13, s13, s19
   ce25c:	4ef19a00 	vmovmi.f32	s19, #16	@ 0x40800000  4.0
   ce260:	4ef06a0c 	vmovmi.f32	s13, #12	@ 0x40600000  3.5
   ce264:	5e766aa6 	vaddpl.f32	s13, s13, s13
   ce268:	5eb56a0e 	vmovpl.f32	s12, #94	@ 0x3ef00000  0.4687500
   ce26c:	ee469ac6 	vmls.f32	s19, s13, s12
   ce270:	eef49a47 	vcmp.f32	s19, s14
   ce274:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce278:	4ef09a47 	vmovmi.f32	s19, s14
   ce27c:	eeb67a00 	vmov.f32	s14, #96	@ 0x3f000000  0.5
   ce280:	eef49ac7 	vcmpe.f32	s19, s14
   ce284:	ed9f7a89 	vldr	s14, [pc, #548]	@ ce4b0 <mixerengine::SoundColorFxFilter::calcParameter()+0x35c>
   ce288:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce28c:	4e799aa9 	vaddmi.f32	s19, s19, s19
   ce290:	eef47ac7 	vcmpe.f32	s15, s14
   ce294:	4ef0aa69 	vmovmi.f32	s21, s19
   ce298:	5ef7aa00 	vmovpl.f32	s21, #112	@ 0x3f800000  1.0
   ce29c:	5e799aa9 	vaddpl.f32	s19, s19, s19
   ce2a0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce2a4:	8a000090 	bhi	ce4ec <mixerengine::SoundColorFxFilter::calcParameter()+0x398>
   ce2a8:	ed9f7a81 	vldr	s14, [pc, #516]	@ ce4b4 <mixerengine::SoundColorFxFilter::calcParameter()+0x360>
   ce2ac:	eef47ac7 	vcmpe.f32	s15, s14
   ce2b0:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   ce2b4:	e28d5004 	add	r5, sp, #4
   ce2b8:	e1a01005 	mov	r1, r5
   ce2bc:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce2c0:	eeb6aa00 	vmov.f32	s20, #96	@ 0x3f000000  0.5
   ce2c4:	e5903000 	ldr	r3, [r0]
   ce2c8:	e5933008 	ldr	r3, [r3, #8]
   ce2cc:	4e777a67 	vsubmi.f32	s15, s14, s15
   ce2d0:	5e777ac7 	vsubpl.f32	s15, s15, s14
   ce2d4:	ee277a8a 	vmul.f32	s14, s15, s20
   ce2d8:	eddf7a7b 	vldr	s15, [pc, #492]	@ ce4cc <mixerengine::SoundColorFxFilter::calcParameter()+0x378>
   ce2dc:	ee686a29 	vmul.f32	s13, s16, s19
   ce2e0:	ee07aa27 	vmla.f32	s20, s14, s15
   ce2e4:	eddf7a79 	vldr	s15, [pc, #484]	@ ce4d0 <mixerengine::SoundColorFxFilter::calcParameter()+0x37c>
   ce2e8:	ee287a08 	vmul.f32	s14, s16, s16
   ce2ec:	ee665aa7 	vmul.f32	s11, s13, s15
   ce2f0:	eddf7a77 	vldr	s15, [pc, #476]	@ ce4d4 <mixerengine::SoundColorFxFilter::calcParameter()+0x380>
   ce2f4:	ee677a27 	vmul.f32	s15, s14, s15
   ce2f8:	eef16a00 	vmov.f32	s13, #16	@ 0x40800000  4.0
   ce2fc:	ee357aa7 	vadd.f32	s14, s11, s15
   ce300:	eeb76a00 	vmov.f32	s12, #112	@ 0x3f800000  1.0
   ce304:	ee377a26 	vadd.f32	s14, s14, s13
   ce308:	ee867a07 	vdiv.f32	s14, s12, s14
   ce30c:	ee775ae5 	vsub.f32	s11, s15, s11
   ce310:	ee376ae6 	vsub.f32	s12, s15, s13
   ce314:	ee677a87 	vmul.f32	s15, s15, s14
   ce318:	ee756aa6 	vadd.f32	s13, s11, s13
   ce31c:	edcd7a01 	vstr	s15, [sp, #4]
   ce320:	edcd7a03 	vstr	s15, [sp, #12]
   ce324:	ee366a06 	vadd.f32	s12, s12, s12
   ce328:	ee276a06 	vmul.f32	s12, s14, s12
   ce32c:	ee277a26 	vmul.f32	s14, s14, s13
   ce330:	ed8d6a04 	vstr	s12, [sp, #16]
   ce334:	ee777aa7 	vadd.f32	s15, s15, s15
   ce338:	ed8d7a05 	vstr	s14, [sp, #20]
   ce33c:	edcd7a02 	vstr	s15, [sp, #8]
   ce340:	e12fff33 	blx	r3
   ce344:	edd47a12 	vldr	s15, [r4, #72]	@ 0x48
   ce348:	eef47a68 	vcmp.f32	s15, s17
   ce34c:	ed848a11 	vstr	s16, [r4, #68]	@ 0x44
   ce350:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce354:	1a000002 	bne	ce364 <mixerengine::SoundColorFxFilter::calcParameter()+0x210>
   ce358:	e5d4304d 	ldrb	r3, [r4, #77]	@ 0x4d
   ce35c:	e3530000 	cmp	r3, #0
   ce360:	0a00001e 	beq	ce3e0 <mixerengine::SoundColorFxFilter::calcParameter()+0x28c>
   ce364:	ee686aa9 	vmul.f32	s13, s17, s19
   ce368:	eddf7a58 	vldr	s15, [pc, #352]	@ ce4d0 <mixerengine::SoundColorFxFilter::calcParameter()+0x37c>
   ce36c:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   ce370:	e1a01005 	mov	r1, r5
   ce374:	e5903000 	ldr	r3, [r0]
   ce378:	e5933008 	ldr	r3, [r3, #8]
   ce37c:	ee287aa8 	vmul.f32	s14, s17, s17
   ce380:	ee665aa7 	vmul.f32	s11, s13, s15
   ce384:	eddf7a52 	vldr	s15, [pc, #328]	@ ce4d4 <mixerengine::SoundColorFxFilter::calcParameter()+0x380>
   ce388:	ee676a27 	vmul.f32	s13, s14, s15
   ce38c:	eef17a00 	vmov.f32	s15, #16	@ 0x40800000  4.0
   ce390:	ee357aa6 	vadd.f32	s14, s11, s13
   ce394:	eeb76a00 	vmov.f32	s12, #112	@ 0x3f800000  1.0
   ce398:	ee377a27 	vadd.f32	s14, s14, s15
   ce39c:	ee867a07 	vdiv.f32	s14, s12, s14
   ce3a0:	ee366ae7 	vsub.f32	s12, s13, s15
   ce3a4:	ee765ae5 	vsub.f32	s11, s13, s11
   ce3a8:	ee366a06 	vadd.f32	s12, s12, s12
   ce3ac:	ee676a27 	vmul.f32	s13, s14, s15
   ce3b0:	ee757aa7 	vadd.f32	s15, s11, s15
   ce3b4:	edcd6a01 	vstr	s13, [sp, #4]
   ce3b8:	edcd6a03 	vstr	s13, [sp, #12]
   ce3bc:	ee675a06 	vmul.f32	s11, s14, s12
   ce3c0:	eeb86a00 	vmov.f32	s12, #128	@ 0xc0000000 -2.0
   ce3c4:	edcd5a04 	vstr	s11, [sp, #16]
   ce3c8:	ee266a86 	vmul.f32	s12, s13, s12
   ce3cc:	ee677a27 	vmul.f32	s15, s14, s15
   ce3d0:	ed8d6a02 	vstr	s12, [sp, #8]
   ce3d4:	edcd7a05 	vstr	s15, [sp, #20]
   ce3d8:	e12fff33 	blx	r3
   ce3dc:	edc48a12 	vstr	s17, [r4, #72]	@ 0x48
   ce3e0:	e3a03001 	mov	r3, #1
   ce3e4:	e5c4304c 	strb	r3, [r4, #76]	@ 0x4c
   ce3e8:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   ce3ec:	ed947a0f 	vldr	s14, [r4, #60]	@ 0x3c
   ce3f0:	ed849a0e 	vstr	s18, [r4, #56]	@ 0x38
   ce3f4:	e3a03000 	mov	r3, #0
   ce3f8:	e5c4304d 	strb	r3, [r4, #77]	@ 0x4d
   ce3fc:	ee777aca 	vsub.f32	s15, s15, s20
   ce400:	ee399a47 	vsub.f32	s18, s18, s14
   ce404:	ed9f7a2b 	vldr	s14, [pc, #172]	@ ce4b8 <mixerengine::SoundColorFxFilter::calcParameter()+0x364>
   ce408:	ee4a7a2a 	vmla.f32	s15, s20, s21
   ce40c:	ee297a07 	vmul.f32	s14, s18, s14
   ce410:	edc47a0b 	vstr	s15, [r4, #44]	@ 0x2c
   ce414:	ed847a10 	vstr	s14, [r4, #64]	@ 0x40
   ce418:	e28dd01c 	add	sp, sp, #28
   ce41c:	ecbd8b06 	vpop	{d8-d10}
   ce420:	e8bd8030 	pop	{r4, r5, pc}
   ce424:	ee377ac7 	vsub.f32	s14, s15, s14
   ce428:	ed9f6a1b 	vldr	s12, [pc, #108]	@ ce49c <mixerengine::SoundColorFxFilter::calcParameter()+0x348>
   ce42c:	ee277a06 	vmul.f32	s14, s14, s12
   ce430:	ee276a07 	vmul.f32	s12, s14, s14
   ce434:	ee665a07 	vmul.f32	s11, s12, s14
   ce438:	ed9f6a1f 	vldr	s12, [pc, #124]	@ ce4bc <mixerengine::SoundColorFxFilter::calcParameter()+0x368>
   ce43c:	eeb37a04 	vmov.f32	s14, #52	@ 0x41a00000  20.0
   ce440:	eef08a47 	vmov.f32	s17, s14
   ce444:	ee458a86 	vmla.f32	s17, s11, s12
   ce448:	ed9f6a1c 	vldr	s12, [pc, #112]	@ ce4c0 <mixerengine::SoundColorFxFilter::calcParameter()+0x36c>
   ce44c:	eef48ac6 	vcmpe.f32	s17, s12
   ce450:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce454:	4a000075 	bmi	ce630 <mixerengine::SoundColorFxFilter::calcParameter()+0x4dc>
   ce458:	ed9f6a20 	vldr	s12, [pc, #128]	@ ce4e0 <mixerengine::SoundColorFxFilter::calcParameter()+0x38c>
   ce45c:	eef47ac6 	vcmpe.f32	s15, s12
   ce460:	ed9f7a20 	vldr	s14, [pc, #128]	@ ce4e8 <mixerengine::SoundColorFxFilter::calcParameter()+0x394>
   ce464:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce468:	ca000081 	bgt	ce674 <mixerengine::SoundColorFxFilter::calcParameter()+0x520>
   ce46c:	ee366a67 	vsub.f32	s12, s12, s15
   ce470:	eddf5a13 	vldr	s11, [pc, #76]	@ ce4c4 <mixerengine::SoundColorFxFilter::calcParameter()+0x370>
   ce474:	ed9f8a1a 	vldr	s16, [pc, #104]	@ ce4e4 <mixerengine::SoundColorFxFilter::calcParameter()+0x390>
   ce478:	ee269a25 	vmul.f32	s18, s12, s11
   ce47c:	eaffff6e 	b	ce23c <mixerengine::SoundColorFxFilter::calcParameter()+0xe8>
   ce480:	ee376ac6 	vsub.f32	s12, s15, s12
   ce484:	eddf5a0e 	vldr	s11, [pc, #56]	@ ce4c4 <mixerengine::SoundColorFxFilter::calcParameter()+0x370>
   ce488:	ed9f7a16 	vldr	s14, [pc, #88]	@ ce4e8 <mixerengine::SoundColorFxFilter::calcParameter()+0x394>
   ce48c:	ee269a25 	vmul.f32	s18, s12, s11
   ce490:	eef38a04 	vmov.f32	s17, #52	@ 0x41a00000  20.0
   ce494:	eaffff68 	b	ce23c <mixerengine::SoundColorFxFilter::calcParameter()+0xe8>
   ce498:	42fc0000 	.word	0x42fc0000
   ce49c:	3c020821 	.word	0x3c020821
   ce4a0:	42dc0000 	.word	0x42dc0000
   ce4a4:	42c80000 	.word	0x42c80000
   ce4a8:	46a41000 	.word	0x46a41000
   ce4ac:	43020000 	.word	0x43020000
   ce4b0:	42fe0000 	.word	0x42fe0000
   ce4b4:	42800000 	.word	0x42800000
   ce4b8:	3b149b93 	.word	0x3b149b93
   ce4bc:	46002000 	.word	0x46002000
   ce4c0:	43790000 	.word	0x43790000
   ce4c4:	3d800000 	.word	0x3d800000
   ce4c8:	43400000 	.word	0x43400000
   ce4cc:	3c800000 	.word	0x3c800000
   ce4d0:	39155ff9 	.word	0x39155ff9
   ce4d4:	32ae5ec9 	.word	0x32ae5ec9
   ce4d8:	3b8e7835 	.word	0x3b8e7835
   ce4dc:	3cf5c28f 	.word	0x3cf5c28f
   ce4e0:	43120000 	.word	0x43120000
   ce4e4:	46a4d800 	.word	0x46a4d800
   ce4e8:	00000000 	.word	0x00000000
   ce4ec:	ed1f7a0b 	vldr	s14, [pc, #-44]	@ ce4c8 <mixerengine::SoundColorFxFilter::calcParameter()+0x374>
   ce4f0:	eef47ac7 	vcmpe.f32	s15, s14
   ce4f4:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   ce4f8:	e28d5004 	add	r5, sp, #4
   ce4fc:	e1a01005 	mov	r1, r5
   ce500:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce504:	eeb6aa00 	vmov.f32	s20, #96	@ 0x3f000000  0.5
   ce508:	e5903000 	ldr	r3, [r0]
   ce50c:	e5933008 	ldr	r3, [r3, #8]
   ce510:	4e777a67 	vsubmi.f32	s15, s14, s15
   ce514:	5e777ac7 	vsubpl.f32	s15, s15, s14
   ce518:	ee277a8a 	vmul.f32	s14, s15, s20
   ce51c:	ed5f7a16 	vldr	s15, [pc, #-88]	@ ce4cc <mixerengine::SoundColorFxFilter::calcParameter()+0x378>
   ce520:	ee686aa9 	vmul.f32	s13, s17, s19
   ce524:	ee07aa27 	vmla.f32	s20, s14, s15
   ce528:	ed5f7a18 	vldr	s15, [pc, #-96]	@ ce4d0 <mixerengine::SoundColorFxFilter::calcParameter()+0x37c>
   ce52c:	ee287aa8 	vmul.f32	s14, s17, s17
   ce530:	ee665aa7 	vmul.f32	s11, s13, s15
   ce534:	ed5f7a1a 	vldr	s15, [pc, #-104]	@ ce4d4 <mixerengine::SoundColorFxFilter::calcParameter()+0x380>
   ce538:	ee676a27 	vmul.f32	s13, s14, s15
   ce53c:	eef17a00 	vmov.f32	s15, #16	@ 0x40800000  4.0
   ce540:	ee357aa6 	vadd.f32	s14, s11, s13
   ce544:	eeb76a00 	vmov.f32	s12, #112	@ 0x3f800000  1.0
   ce548:	ee377a27 	vadd.f32	s14, s14, s15
   ce54c:	ee867a07 	vdiv.f32	s14, s12, s14
   ce550:	ee366ae7 	vsub.f32	s12, s13, s15
   ce554:	ee765ae5 	vsub.f32	s11, s13, s11
   ce558:	ee366a06 	vadd.f32	s12, s12, s12
   ce55c:	ee676a27 	vmul.f32	s13, s14, s15
   ce560:	ee757aa7 	vadd.f32	s15, s11, s15
   ce564:	edcd6a01 	vstr	s13, [sp, #4]
   ce568:	edcd6a03 	vstr	s13, [sp, #12]
   ce56c:	ee675a06 	vmul.f32	s11, s14, s12
   ce570:	eeb86a00 	vmov.f32	s12, #128	@ 0xc0000000 -2.0
   ce574:	edcd5a04 	vstr	s11, [sp, #16]
   ce578:	ee677a27 	vmul.f32	s15, s14, s15
   ce57c:	ee266a86 	vmul.f32	s12, s13, s12
   ce580:	edcd7a05 	vstr	s15, [sp, #20]
   ce584:	ed8d6a02 	vstr	s12, [sp, #8]
   ce588:	e12fff33 	blx	r3
   ce58c:	edd47a11 	vldr	s15, [r4, #68]	@ 0x44
   ce590:	eef47a48 	vcmp.f32	s15, s16
   ce594:	edc48a12 	vstr	s17, [r4, #72]	@ 0x48
   ce598:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce59c:	1a000002 	bne	ce5ac <mixerengine::SoundColorFxFilter::calcParameter()+0x458>
   ce5a0:	e5d4304d 	ldrb	r3, [r4, #77]	@ 0x4d
   ce5a4:	e3530000 	cmp	r3, #0
   ce5a8:	0a00001d 	beq	ce624 <mixerengine::SoundColorFxFilter::calcParameter()+0x4d0>
   ce5ac:	ee686a29 	vmul.f32	s13, s16, s19
   ce5b0:	ed5f7a3a 	vldr	s15, [pc, #-232]	@ ce4d0 <mixerengine::SoundColorFxFilter::calcParameter()+0x37c>
   ce5b4:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   ce5b8:	e1a01005 	mov	r1, r5
   ce5bc:	e5903000 	ldr	r3, [r0]
   ce5c0:	e5933008 	ldr	r3, [r3, #8]
   ce5c4:	ee287a08 	vmul.f32	s14, s16, s16
   ce5c8:	ee665aa7 	vmul.f32	s11, s13, s15
   ce5cc:	ed5f7a40 	vldr	s15, [pc, #-256]	@ ce4d4 <mixerengine::SoundColorFxFilter::calcParameter()+0x380>
   ce5d0:	ee677a27 	vmul.f32	s15, s14, s15
   ce5d4:	eef16a00 	vmov.f32	s13, #16	@ 0x40800000  4.0
   ce5d8:	ee357aa7 	vadd.f32	s14, s11, s15
   ce5dc:	eeb76a00 	vmov.f32	s12, #112	@ 0x3f800000  1.0
   ce5e0:	ee377a26 	vadd.f32	s14, s14, s13
   ce5e4:	ee867a07 	vdiv.f32	s14, s12, s14
   ce5e8:	ee775ae5 	vsub.f32	s11, s15, s11
   ce5ec:	ee376ae6 	vsub.f32	s12, s15, s13
   ce5f0:	ee677a87 	vmul.f32	s15, s15, s14
   ce5f4:	ee756aa6 	vadd.f32	s13, s11, s13
   ce5f8:	edcd7a01 	vstr	s15, [sp, #4]
   ce5fc:	edcd7a03 	vstr	s15, [sp, #12]
   ce600:	ee366a06 	vadd.f32	s12, s12, s12
   ce604:	ee276a06 	vmul.f32	s12, s14, s12
   ce608:	ee277a26 	vmul.f32	s14, s14, s13
   ce60c:	ed8d6a04 	vstr	s12, [sp, #16]
   ce610:	ee777aa7 	vadd.f32	s15, s15, s15
   ce614:	ed8d7a05 	vstr	s14, [sp, #20]
   ce618:	edcd7a02 	vstr	s15, [sp, #8]
   ce61c:	e12fff33 	blx	r3
   ce620:	ed848a11 	vstr	s16, [r4, #68]	@ 0x44
   ce624:	e3a03000 	mov	r3, #0
   ce628:	e5c4304c 	strb	r3, [r4, #76]	@ 0x4c
   ce62c:	eaffff6d 	b	ce3e8 <mixerengine::SoundColorFxFilter::calcParameter()+0x294>
   ce630:	ee385ac7 	vsub.f32	s10, s17, s14
   ce634:	ed5f5a59 	vldr	s11, [pc, #-356]	@ ce4d8 <mixerengine::SoundColorFxFilter::calcParameter()+0x384>
   ce638:	ed1f7a59 	vldr	s14, [pc, #-356]	@ ce4dc <mixerengine::SoundColorFxFilter::calcParameter()+0x388>
   ce63c:	eeb76a00 	vmov.f32	s12, #112	@ 0x3f800000  1.0
   ce640:	ee056a65 	vmls.f32	s12, s10, s11
   ce644:	eef15a00 	vmov.f32	s11, #16	@ 0x40800000  4.0
   ce648:	ee665a25 	vmul.f32	s11, s12, s11
   ce64c:	ee655a86 	vmul.f32	s11, s11, s12
   ce650:	ee057a86 	vmla.f32	s14, s11, s12
   ce654:	eeb06a00 	vmov.f32	s12, #0	@ 0x40000000  2.0
   ce658:	eeb47a46 	vcmp.f32	s14, s12
   ce65c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce660:	ceb07a46 	vmovgt.f32	s14, s12
   ce664:	ed1f6a63 	vldr	s12, [pc, #-396]	@ ce4e0 <mixerengine::SoundColorFxFilter::calcParameter()+0x38c>
   ce668:	eef47ac6 	vcmpe.f32	s15, s12
   ce66c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce670:	daffff7d 	ble	ce46c <mixerengine::SoundColorFxFilter::calcParameter()+0x318>
   ce674:	ed1f8a66 	vldr	s16, [pc, #-408]	@ ce4e4 <mixerengine::SoundColorFxFilter::calcParameter()+0x390>
   ce678:	ed1f9a66 	vldr	s18, [pc, #-408]	@ ce4e8 <mixerengine::SoundColorFxFilter::calcParameter()+0x394>
   ce67c:	eafffeee 	b	ce23c <mixerengine::SoundColorFxFilter::calcParameter()+0xe8>

000ce680 <mixerengine::SoundColorFxFilter::initialize()>:
   ce680:	e92d4010 	push	{r4, lr}
   ce684:	ed2d8b02 	vpush	{d8}
   ce688:	e1a04000 	mov	r4, r0
   ce68c:	ed9f8a21 	vldr	s16, [pc, #132]	@ ce718 <mixerengine::SoundColorFxFilter::initialize()+0x98>
   ce690:	e5900024 	ldr	r0, [r0, #36]	@ 0x24
   ce694:	e5903000 	ldr	r3, [r0]
   ce698:	e5933018 	ldr	r3, [r3, #24]
   ce69c:	e12fff33 	blx	r3
   ce6a0:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   ce6a4:	e5903000 	ldr	r3, [r0]
   ce6a8:	e5933018 	ldr	r3, [r3, #24]
   ce6ac:	e12fff33 	blx	r3
   ce6b0:	ed947a07 	vldr	s14, [r4, #28]
   ce6b4:	eddf7a18 	vldr	s15, [pc, #96]	@ ce71c <mixerengine::SoundColorFxFilter::initialize()+0x9c>
   ce6b8:	ee677a27 	vmul.f32	s15, s14, s15
   ce6bc:	ed848a11 	vstr	s16, [r4, #68]	@ 0x44
   ce6c0:	ed848a12 	vstr	s16, [r4, #72]	@ 0x48
   ce6c4:	ed848a0c 	vstr	s16, [r4, #48]	@ 0x30
   ce6c8:	ed848a10 	vstr	s16, [r4, #64]	@ 0x40
   ce6cc:	e1a00004 	mov	r0, r4
   ce6d0:	eefd7ae7 	vcvt.s32.f32	s15, s15
   ce6d4:	ee173a90 	vmov	r3, s15
   ce6d8:	e1a03143 	asr	r3, r3, #2
   ce6dc:	e5843054 	str	r3, [r4, #84]	@ 0x54
   ce6e0:	e5843050 	str	r3, [r4, #80]	@ 0x50
   ce6e4:	ebfffe9a 	bl	ce154 <mixerengine::SoundColorFxFilter::calcParameter()>
   ce6e8:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   ce6ec:	e5d4204c 	ldrb	r2, [r4, #76]	@ 0x4c
   ce6f0:	ed848a10 	vstr	s16, [r4, #64]	@ 0x40
   ce6f4:	e5943038 	ldr	r3, [r4, #56]	@ 0x38
   ce6f8:	e3a01001 	mov	r1, #1
   ce6fc:	e3520000 	cmp	r2, #0
   ce700:	e5c4104d 	strb	r1, [r4, #77]	@ 0x4d
   ce704:	e584303c 	str	r3, [r4, #60]	@ 0x3c
   ce708:	1eb08a67 	vmovne.f32	s16, s15
   ce70c:	ed848a0d 	vstr	s16, [r4, #52]	@ 0x34
   ce710:	ecbd8b02 	vpop	{d8}
   ce714:	e8bd8010 	pop	{r4, pc}
   ce718:	00000000 	.word	0x00000000
   ce71c:	447fc000 	.word	0x447fc000

000ce720 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)>:
   ce720:	e92d4df0 	push	{r4, r5, r6, r7, r8, sl, fp, lr}
   ce724:	ed2d8b02 	vpush	{d8}
   ce728:	e243c001 	sub	ip, r3, #1
   ce72c:	e1a05003 	mov	r5, r3
   ce730:	e1a03183 	lsl	r3, r3, #3
   ce734:	e283300e 	add	r3, r3, #14
   ce738:	e1a04000 	mov	r4, r0
   ce73c:	e3c30007 	bic	r0, r3, #7
   ce740:	e28db024 	add	fp, sp, #36	@ 0x24
   ce744:	e04dd000 	sub	sp, sp, r0
   ce748:	e37c0001 	cmn	ip, #1
   ce74c:	e1a08001 	mov	r8, r1
   ce750:	e1a0a002 	mov	sl, r2
   ce754:	e1a0600d 	mov	r6, sp
   ce758:	004dd000 	subeq	sp, sp, r0
   ce75c:	01a0700d 	moveq	r7, sp
   ce760:	0a00000f 	beq	ce7a4 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x84>
   ce764:	e1a01006 	mov	r1, r6
   ce768:	e1a0200c 	mov	r2, ip
   ce76c:	eddf0b81 	vldr	d16, [pc, #516]	@ ce978 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x258>
   ce770:	e2422001 	sub	r2, r2, #1
   ce774:	ece10b02 	vstmia	r1!, {d16}
   ce778:	e3720001 	cmn	r2, #1
   ce77c:	1afffffb 	bne	ce770 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x50>
   ce780:	e3c33007 	bic	r3, r3, #7
   ce784:	eddf0b7b 	vldr	d16, [pc, #492]	@ ce978 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x258>
   ce788:	e04dd003 	sub	sp, sp, r3
   ce78c:	e1a0700d 	mov	r7, sp
   ce790:	e1a0300d 	mov	r3, sp
   ce794:	e24cc001 	sub	ip, ip, #1
   ce798:	ece30b02 	vstmia	r3!, {d16}
   ce79c:	e37c0001 	cmn	ip, #1
   ce7a0:	1afffffb 	bne	ce794 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x74>
   ce7a4:	e5942050 	ldr	r2, [r4, #80]	@ 0x50
   ce7a8:	e5943054 	ldr	r3, [r4, #84]	@ 0x54
   ce7ac:	e1520003 	cmp	r2, r3
   ce7b0:	0a00006a 	beq	ce960 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x240>
   ce7b4:	e1a00004 	mov	r0, r4
   ce7b8:	ebfffe65 	bl	ce154 <mixerengine::SoundColorFxFilter::calcParameter()>
   ce7bc:	edd47a0c 	vldr	s15, [r4, #48]	@ 0x30
   ce7c0:	ed947a0b 	vldr	s14, [r4, #44]	@ 0x2c
   ce7c4:	ee377a67 	vsub.f32	s14, s14, s15
   ce7c8:	eddf7a6c 	vldr	s15, [pc, #432]	@ ce980 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x260>
   ce7cc:	ee678a27 	vmul.f32	s17, s14, s15
   ce7d0:	e5d4304c 	ldrb	r3, [r4, #76]	@ 0x4c
   ce7d4:	e3530000 	cmp	r3, #0
   ce7d8:	0a000053 	beq	ce92c <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x20c>
   ce7dc:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   ce7e0:	ed947a0d 	vldr	s14, [r4, #52]	@ 0x34
   ce7e4:	eeb47ae7 	vcmpe.f32	s14, s15
   ce7e8:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce7ec:	ba000059 	blt	ce958 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x238>
   ce7f0:	edc47a0d 	vstr	s15, [r4, #52]	@ 0x34
   ce7f4:	ed9f8a62 	vldr	s16, [pc, #392]	@ ce984 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x264>
   ce7f8:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   ce7fc:	e1a01008 	mov	r1, r8
   ce800:	e1a02006 	mov	r2, r6
   ce804:	e1a03005 	mov	r3, r5
   ce808:	e590c000 	ldr	ip, [r0]
   ce80c:	e59cc014 	ldr	ip, [ip, #20]
   ce810:	e12fff3c 	blx	ip
   ce814:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   ce818:	e1a01008 	mov	r1, r8
   ce81c:	e1a02007 	mov	r2, r7
   ce820:	e1a03005 	mov	r3, r5
   ce824:	e590c000 	ldr	ip, [r0]
   ce828:	e59cc014 	ldr	ip, [ip, #20]
   ce82c:	e12fff3c 	blx	ip
   ce830:	e3550000 	cmp	r5, #0
   ce834:	da000044 	ble	ce94c <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x22c>
   ce838:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   ce83c:	e59f114c 	ldr	r1, [pc, #332]	@ ce990 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x270>
   ce840:	e3a03000 	mov	r3, #0
   ce844:	edd47a0c 	vldr	s15, [r4, #48]	@ 0x30
   ce848:	edd46a0e 	vldr	s13, [r4, #56]	@ 0x38
   ce84c:	e3a00000 	mov	r0, #0
   ce850:	ea00001a 	b	ce8c0 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x1a0>
   ce854:	eeb76a00 	vmov.f32	s12, #112	@ 0x3f800000  1.0
   ce858:	ed847a0d 	vstr	s14, [r4, #52]	@ 0x34
   ce85c:	ed9f8a48 	vldr	s16, [pc, #288]	@ ce984 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x264>
   ce860:	f3f45c06 	vdup.32	d21, d6[0]
   ce864:	edd10b00 	vldr	d16, [r1]
   ce868:	f2602da5 	vsub.f32	d18, d16, d21
   ce86c:	e1a02183 	lsl	r2, r3, #3
   ce870:	e086c002 	add	ip, r6, r2
   ce874:	e0872002 	add	r2, r7, r2
   ce878:	eddc1b00 	vldr	d17, [ip]
   ce87c:	edd23b00 	vldr	d19, [r2]
   ce880:	f3455db1 	vmul.f32	d21, d21, d17
   ce884:	e594203c 	ldr	r2, [r4, #60]	@ 0x3c
   ce888:	f3421db3 	vmul.f32	d17, d18, d19
   ce88c:	f3fc4c07 	vdup.32	d20, d7[1]
   ce890:	ecf83b02 	vldmia	r8!, {d19}
   ce894:	e2833001 	add	r3, r3, #1
   ce898:	ee822b90 	vdup.32	d18, r2
   ce89c:	e1530005 	cmp	r3, r5
   ce8a0:	f2600da2 	vsub.f32	d16, d16, d18
   ce8a4:	f2451da1 	vadd.f32	d17, d21, d17
   ce8a8:	f3432db2 	vmul.f32	d18, d19, d18
   ce8ac:	f3444db1 	vmul.f32	d20, d20, d17
   ce8b0:	f3440db0 	vmul.f32	d16, d20, d16
   ce8b4:	f2422da0 	vadd.f32	d18, d18, d16
   ce8b8:	ecea2b02 	vstmia	sl!, {d18}
   ce8bc:	0a000022 	beq	ce94c <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x22c>
   ce8c0:	ee777aa8 	vadd.f32	s15, s15, s17
   ce8c4:	ed946a10 	vldr	s12, [r4, #64]	@ 0x40
   ce8c8:	eeb56a40 	vcmp.f32	s12, #0.0
   ce8cc:	edc47a0c 	vstr	s15, [r4, #48]	@ 0x30
   ce8d0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce8d4:	0a000008 	beq	ce8fc <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x1dc>
   ce8d8:	edd45a0f 	vldr	s11, [r4, #60]	@ 0x3c
   ce8dc:	ee765a25 	vadd.f32	s11, s12, s11
   ce8e0:	ee365ae5 	vsub.f32	s10, s13, s11
   ce8e4:	edc45a0f 	vstr	s11, [r4, #60]	@ 0x3c
   ce8e8:	ee266a05 	vmul.f32	s12, s12, s10
   ce8ec:	eeb56ac0 	vcmpe.f32	s12, #0.0
   ce8f0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce8f4:	9dc46a0f 	vstrls	s13, [r4, #60]	@ 0x3c
   ce8f8:	95840040 	strls	r0, [r4, #64]	@ 0x40
   ce8fc:	ed946a0d 	vldr	s12, [r4, #52]	@ 0x34
   ce900:	ee386a06 	vadd.f32	s12, s16, s12
   ce904:	eeb46ac7 	vcmpe.f32	s12, s14
   ce908:	ed846a0d 	vstr	s12, [r4, #52]	@ 0x34
   ce90c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce910:	aaffffcf 	bge	ce854 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x134>
   ce914:	eeb56ac0 	vcmpe.f32	s12, #0.0
   ce918:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce91c:	9d9f8a18 	vldrls	s16, [pc, #96]	@ ce984 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x264>
   ce920:	95840034 	strls	r0, [r4, #52]	@ 0x34
   ce924:	9eb06a48 	vmovls.f32	s12, s16
   ce928:	eaffffcc 	b	ce860 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x140>
   ce92c:	edd47a0d 	vldr	s15, [r4, #52]	@ 0x34
   ce930:	eef57ac0 	vcmpe.f32	s15, #0.0
   ce934:	e3a03000 	mov	r3, #0
   ce938:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce93c:	95843034 	strls	r3, [r4, #52]	@ 0x34
   ce940:	9e083a10 	vmovls	s16, r3
   ce944:	8d9f8a0f 	vldrhi	s16, [pc, #60]	@ ce988 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x268>
   ce948:	eaffffaa 	b	ce7f8 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0xd8>
   ce94c:	e24bd024 	sub	sp, fp, #36	@ 0x24
   ce950:	ecbd8b02 	vpop	{d8}
   ce954:	e8bd8df0 	pop	{r4, r5, r6, r7, r8, sl, fp, pc}
   ce958:	ed9f8a0b 	vldr	s16, [pc, #44]	@ ce98c <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x26c>
   ce95c:	eaffffa5 	b	ce7f8 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0xd8>
   ce960:	e5d4304d 	ldrb	r3, [r4, #77]	@ 0x4d
   ce964:	e3530000 	cmp	r3, #0
   ce968:	1affff91 	bne	ce7b4 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x94>
   ce96c:	eddf8a04 	vldr	s17, [pc, #16]	@ ce984 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0x264>
   ce970:	eaffff96 	b	ce7d0 <mixerengine::SoundColorFxFilter::execute(common::Float2 const*, common::Float2*, int)+0xb0>
   ce974:	ebfd0150 	bl	eebc <__cxa_end_cleanup@plt>
	...
   ce980:	3c800000 	.word	0x3c800000
   ce984:	00000000 	.word	0x00000000
   ce988:	bb149b93 	.word	0xbb149b93
   ce98c:	3b149b93 	.word	0x3b149b93
   ce990:	0114c258 	.word	0x0114c258

000ce994 <mixerengine::SoundColorFxFilter::parameterChaser(float*, float, float*)>:
   ce994:	edd17a00 	vldr	s15, [r1]
   ce998:	eef57a40 	vcmp.f32	s15, #0.0
   ce99c:	ee072a10 	vmov	s14, r2
   ce9a0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce9a4:	012fff1e 	bxeq	lr
   ce9a8:	edd36a00 	vldr	s13, [r3]
   ce9ac:	ee777aa6 	vadd.f32	s15, s15, s13
   ce9b0:	ee776a67 	vsub.f32	s13, s14, s15
   ce9b4:	edc37a00 	vstr	s15, [r3]
   ce9b8:	edd17a00 	vldr	s15, [r1]
   ce9bc:	ee667aa7 	vmul.f32	s15, s13, s15
   ce9c0:	eef57ac0 	vcmpe.f32	s15, #0.0
   ce9c4:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   ce9c8:	9d837a00 	vstrls	s14, [r3]
   ce9cc:	93a03000 	movls	r3, #0
   ce9d0:	95813000 	strls	r3, [r1]
   ce9d4:	e12fff1e 	bx	lr
