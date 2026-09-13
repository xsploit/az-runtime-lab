
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

00059078 <mixerengine::HeadphoneChannel::update(int)>:
   59078:	e92d01f0 	push	{r4, r5, r6, r7, r8}
   5907c:	e5906044 	ldr	r6, [r0, #68]	@ 0x44
   59080:	e3560000 	cmp	r6, #0
   59084:	0a00001a 	beq	590f4 <mixerengine::HeadphoneChannel::update(int)+0x7c>
   59088:	e3510000 	cmp	r1, #0
   5908c:	da000016 	ble	590ec <mixerengine::HeadphoneChannel::update(int)+0x74>
   59090:	e5906044 	ldr	r6, [r0, #68]	@ 0x44
   59094:	e3a07000 	mov	r7, #0
   59098:	e5908020 	ldr	r8, [r0, #32]
   5909c:	eddf2b31 	vldr	d18, [pc, #196]	@ 59168 <mixerengine::HeadphoneChannel::update(int)+0xf0>
   590a0:	e3560000 	cmp	r6, #0
   590a4:	e1a05187 	lsl	r5, r7, #3
   590a8:	e0882005 	add	r2, r8, r5
   590ac:	edc22b00 	vstr	d18, [r2]
   590b0:	0a00000a 	beq	590e0 <mixerengine::HeadphoneChannel::update(int)+0x68>
   590b4:	e280c024 	add	ip, r0, #36	@ 0x24
   590b8:	e3a03000 	mov	r3, #0
   590bc:	e2833001 	add	r3, r3, #1
   590c0:	e5bc4004 	ldr	r4, [ip, #4]!
   590c4:	e1560003 	cmp	r6, r3
   590c8:	edd21b00 	vldr	d17, [r2]
   590cc:	e0844005 	add	r4, r4, r5
   590d0:	edd40b00 	vldr	d16, [r4]
   590d4:	f2410da0 	vadd.f32	d16, d17, d16
   590d8:	edc20b00 	vstr	d16, [r2]
   590dc:	8afffff6 	bhi	590bc <mixerengine::HeadphoneChannel::update(int)+0x44>
   590e0:	e2877001 	add	r7, r7, #1
   590e4:	e1570001 	cmp	r7, r1
   590e8:	1affffec 	bne	590a0 <mixerengine::HeadphoneChannel::update(int)+0x28>
   590ec:	e8bd01f0 	pop	{r4, r5, r6, r7, r8}
   590f0:	e12fff1e 	bx	lr
   590f4:	e5906014 	ldr	r6, [r0, #20]
   590f8:	e2804024 	add	r4, r0, #36	@ 0x24
   590fc:	e5905018 	ldr	r5, [r0, #24]
   59100:	e1a03006 	mov	r3, r6
   59104:	ea000009 	b	59130 <mixerengine::HeadphoneChannel::update(int)+0xb8>
   59108:	e3520001 	cmp	r2, #1
   5910c:	0a00000d 	beq	59148 <mixerengine::HeadphoneChannel::update(int)+0xd0>
   59110:	e3520002 	cmp	r2, #2
   59114:	0a00000b 	beq	59148 <mixerengine::HeadphoneChannel::update(int)+0xd0>
   59118:	e3520006 	cmp	r2, #6
   5911c:	13a02000 	movne	r2, #0
   59120:	03a02001 	moveq	r2, #1
   59124:	e2822006 	add	r2, r2, #6
   59128:	e79c2102 	ldr	r2, [ip, r2, lsl #2]
   5912c:	e5a42004 	str	r2, [r4, #4]!
   59130:	e1530005 	cmp	r3, r5
   59134:	0a000005 	beq	59150 <mixerengine::HeadphoneChannel::update(int)+0xd8>
   59138:	e493c004 	ldr	ip, [r3], #4
   5913c:	e59c2014 	ldr	r2, [ip, #20]
   59140:	e3520000 	cmp	r2, #0
   59144:	1affffef 	bne	59108 <mixerengine::HeadphoneChannel::update(int)+0x90>
   59148:	e3a02003 	mov	r2, #3
   5914c:	eafffff4 	b	59124 <mixerengine::HeadphoneChannel::update(int)+0xac>
   59150:	e0663003 	rsb	r3, r6, r3
   59154:	e1a03123 	lsr	r3, r3, #2
   59158:	e5803044 	str	r3, [r0, #68]	@ 0x44
   5915c:	e3530000 	cmp	r3, #0
   59160:	1affffc8 	bne	59088 <mixerengine::HeadphoneChannel::update(int)+0x10>
   59164:	eaffffe0 	b	590ec <mixerengine::HeadphoneChannel::update(int)+0x74>
	...

00059170 <mixerengine::HeadphoneChannel::HeadphoneChannel()>:
   59170:	e92d4010 	push	{r4, lr}
   59174:	e3a01001 	mov	r1, #1
   59178:	e1a04000 	mov	r4, r0
   5917c:	eb00024d 	bl	59ab8 <mixerengine::OutputChannel::OutputChannel(djengine::EnMixerOutput)>
   59180:	e59f202c 	ldr	r2, [pc, #44]	@ 591b4 <mixerengine::HeadphoneChannel::HeadphoneChannel()+0x44>
   59184:	e3a03000 	mov	r3, #0
   59188:	e1a00004 	mov	r0, r4
   5918c:	e5843044 	str	r3, [r4, #68]	@ 0x44
   59190:	e5843028 	str	r3, [r4, #40]	@ 0x28
   59194:	e5842000 	str	r2, [r4]
   59198:	e584302c 	str	r3, [r4, #44]	@ 0x2c
   5919c:	e5843030 	str	r3, [r4, #48]	@ 0x30
   591a0:	e5843034 	str	r3, [r4, #52]	@ 0x34
   591a4:	e5843038 	str	r3, [r4, #56]	@ 0x38
   591a8:	e584303c 	str	r3, [r4, #60]	@ 0x3c
   591ac:	e5843040 	str	r3, [r4, #64]	@ 0x40
   591b0:	e8bd8010 	pop	{r4, pc}
   591b4:	00418190 	.word	0x00418190

000591b8 <mixerengine::HeadphoneChannel::initSourcePointers()>:
   591b8:	e92d0030 	push	{r4, r5}
   591bc:	e280c024 	add	ip, r0, #36	@ 0x24
   591c0:	e5905014 	ldr	r5, [r0, #20]
   591c4:	e5904018 	ldr	r4, [r0, #24]
   591c8:	e1a03005 	mov	r3, r5
   591cc:	ea000009 	b	591f8 <mixerengine::HeadphoneChannel::initSourcePointers()+0x40>
   591d0:	e3520001 	cmp	r2, #1
   591d4:	0a00000d 	beq	59210 <mixerengine::HeadphoneChannel::initSourcePointers()+0x58>
   591d8:	e3520002 	cmp	r2, #2
   591dc:	0a00000b 	beq	59210 <mixerengine::HeadphoneChannel::initSourcePointers()+0x58>
   591e0:	e3520006 	cmp	r2, #6
   591e4:	13a02000 	movne	r2, #0
   591e8:	03a02001 	moveq	r2, #1
   591ec:	e2822006 	add	r2, r2, #6
   591f0:	e7912102 	ldr	r2, [r1, r2, lsl #2]
   591f4:	e5ac2004 	str	r2, [ip, #4]!
   591f8:	e1530004 	cmp	r3, r4
   591fc:	0a000005 	beq	59218 <mixerengine::HeadphoneChannel::initSourcePointers()+0x60>
   59200:	e4931004 	ldr	r1, [r3], #4
   59204:	e5912014 	ldr	r2, [r1, #20]
   59208:	e3520000 	cmp	r2, #0
   5920c:	1affffef 	bne	591d0 <mixerengine::HeadphoneChannel::initSourcePointers()+0x18>
   59210:	e3a02003 	mov	r2, #3
   59214:	eafffff4 	b	591ec <mixerengine::HeadphoneChannel::initSourcePointers()+0x34>
   59218:	e0653003 	rsb	r3, r5, r3
   5921c:	e1a03123 	lsr	r3, r3, #2
   59220:	e5803044 	str	r3, [r0, #68]	@ 0x44
   59224:	e8bd0030 	pop	{r4, r5}
   59228:	e12fff1e 	bx	lr
   5922c:	e320f000 	nop	{0}

00059230 <mixerengine::HeadphoneChannel::~HeadphoneChannel()>:
   59230:	e59f3014 	ldr	r3, [pc, #20]	@ 5924c <mixerengine::HeadphoneChannel::~HeadphoneChannel()+0x1c>
   59234:	e92d4010 	push	{r4, lr}
   59238:	e1a04000 	mov	r4, r0
   5923c:	e5803000 	str	r3, [r0]
   59240:	eb0001b4 	bl	59918 <mixerengine::OutputChannel::~OutputChannel()>
   59244:	e1a00004 	mov	r0, r4
   59248:	e8bd8010 	pop	{r4, pc}
   5924c:	00418190 	.word	0x00418190

00059250 <mixerengine::HeadphoneChannel::~HeadphoneChannel()>:
   59250:	e59f301c 	ldr	r3, [pc, #28]	@ 59274 <mixerengine::HeadphoneChannel::~HeadphoneChannel()+0x24>
   59254:	e92d4010 	push	{r4, lr}
   59258:	e1a04000 	mov	r4, r0
   5925c:	e5803000 	str	r3, [r0]
   59260:	eb0001ac 	bl	59918 <mixerengine::OutputChannel::~OutputChannel()>
   59264:	e1a00004 	mov	r0, r4
   59268:	ebfed698 	bl	ecd0 <operator delete(void*)@plt>
   5926c:	e1a00004 	mov	r0, r4
   59270:	e8bd8010 	pop	{r4, pc}
   59274:	00418190 	.word	0x00418190

00059278 <mixerengine::MasterOutChannel::finResources()>:
   59278:	e92d4010 	push	{r4, lr}
   5927c:	e1a04000 	mov	r4, r0
   59280:	eb00017a 	bl	59870 <mixerengine::OutputChannel::finResources()>
   59284:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   59288:	e3500000 	cmp	r0, #0
   5928c:	0a000002 	beq	5929c <mixerengine::MasterOutChannel::finResources()+0x24>
   59290:	ebfed775 	bl	f06c <operator delete[](void*)@plt>
   59294:	e3a03000 	mov	r3, #0
   59298:	e5843040 	str	r3, [r4, #64]	@ 0x40
   5929c:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   592a0:	e3500000 	cmp	r0, #0
   592a4:	08bd8010 	popeq	{r4, pc}
   592a8:	ebfed76f 	bl	f06c <operator delete[](void*)@plt>
   592ac:	e3a03000 	mov	r3, #0
   592b0:	e584303c 	str	r3, [r4, #60]	@ 0x3c
   592b4:	e8bd8010 	pop	{r4, pc}

000592b8 <mixerengine::MasterOutChannel::initResources(int)>:
   592b8:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
   592bc:	e1a06181 	lsl	r6, r1, #3
   592c0:	e1a04001 	mov	r4, r1
   592c4:	e1a05000 	mov	r5, r0
   592c8:	e2447001 	sub	r7, r4, #1
   592cc:	eb000170 	bl	59894 <mixerengine::OutputChannel::initResources(int)>
   592d0:	e1a00006 	mov	r0, r6
   592d4:	ebfed5f3 	bl	eaa8 <operator new[](unsigned int)@plt>
   592d8:	e3770001 	cmn	r7, #1
   592dc:	0a000006 	beq	592fc <mixerengine::MasterOutChannel::initResources(int)+0x44>
   592e0:	e1a02000 	mov	r2, r0
   592e4:	e1a03007 	mov	r3, r7
   592e8:	eddf0b2a 	vldr	d16, [pc, #168]	@ 59398 <mixerengine::MasterOutChannel::initResources(int)+0xe0>
   592ec:	e2433001 	sub	r3, r3, #1
   592f0:	ece20b02 	vstmia	r2!, {d16}
   592f4:	e3730001 	cmn	r3, #1
   592f8:	1afffffb 	bne	592ec <mixerengine::MasterOutChannel::initResources(int)+0x34>
   592fc:	e3540000 	cmp	r4, #0
   59300:	e5850040 	str	r0, [r5, #64]	@ 0x40
   59304:	da000008 	ble	5932c <mixerengine::MasterOutChannel::initResources(int)+0x74>
   59308:	e3a03000 	mov	r3, #0
   5930c:	eddf0b21 	vldr	d16, [pc, #132]	@ 59398 <mixerengine::MasterOutChannel::initResources(int)+0xe0>
   59310:	ea000000 	b	59318 <mixerengine::MasterOutChannel::initResources(int)+0x60>
   59314:	e5950040 	ldr	r0, [r5, #64]	@ 0x40
   59318:	e0800183 	add	r0, r0, r3, lsl #3
   5931c:	e2833001 	add	r3, r3, #1
   59320:	e1530004 	cmp	r3, r4
   59324:	edc00b00 	vstr	d16, [r0]
   59328:	1afffff9 	bne	59314 <mixerengine::MasterOutChannel::initResources(int)+0x5c>
   5932c:	e1a00006 	mov	r0, r6
   59330:	ebfed5dc 	bl	eaa8 <operator new[](unsigned int)@plt>
   59334:	e3770001 	cmn	r7, #1
   59338:	0a000005 	beq	59354 <mixerengine::MasterOutChannel::initResources(int)+0x9c>
   5933c:	e1a03000 	mov	r3, r0
   59340:	eddf0b14 	vldr	d16, [pc, #80]	@ 59398 <mixerengine::MasterOutChannel::initResources(int)+0xe0>
   59344:	e2477001 	sub	r7, r7, #1
   59348:	ece30b02 	vstmia	r3!, {d16}
   5934c:	e3770001 	cmn	r7, #1
   59350:	1afffffb 	bne	59344 <mixerengine::MasterOutChannel::initResources(int)+0x8c>
   59354:	e3540000 	cmp	r4, #0
   59358:	e585003c 	str	r0, [r5, #60]	@ 0x3c
   5935c:	d8bd80f8 	pople	{r3, r4, r5, r6, r7, pc}
   59360:	e3a03000 	mov	r3, #0
   59364:	eddf0b0b 	vldr	d16, [pc, #44]	@ 59398 <mixerengine::MasterOutChannel::initResources(int)+0xe0>
   59368:	e0800183 	add	r0, r0, r3, lsl #3
   5936c:	e2833001 	add	r3, r3, #1
   59370:	e1530004 	cmp	r3, r4
   59374:	edc00b00 	vstr	d16, [r0]
   59378:	08bd80f8 	popeq	{r3, r4, r5, r6, r7, pc}
   5937c:	e595003c 	ldr	r0, [r5, #60]	@ 0x3c
   59380:	e0800183 	add	r0, r0, r3, lsl #3
   59384:	e2833001 	add	r3, r3, #1
   59388:	e1530004 	cmp	r3, r4
   5938c:	edc00b00 	vstr	d16, [r0]
   59390:	1afffff9 	bne	5937c <mixerengine::MasterOutChannel::initResources(int)+0xc4>
   59394:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
	...

000593a0 <non-virtual thunk to mixerengine::MasterOutChannel::~MasterOutChannel()>:
   593a0:	e2400028 	sub	r0, r0, #40	@ 0x28
   593a4:	eaffffff 	b	593a8 <mixerengine::MasterOutChannel::~MasterOutChannel()>

000593a8 <mixerengine::MasterOutChannel::~MasterOutChannel()>:
   593a8:	e92d4010 	push	{r4, lr}
   593ac:	e1a04000 	mov	r4, r0
   593b0:	e5900084 	ldr	r0, [r0, #132]	@ 0x84
   593b4:	e59f3054 	ldr	r3, [pc, #84]	@ 59410 <mixerengine::MasterOutChannel::~MasterOutChannel()+0x68>
   593b8:	e3500000 	cmp	r0, #0
   593bc:	e2832020 	add	r2, r3, #32
   593c0:	e5842028 	str	r2, [r4, #40]	@ 0x28
   593c4:	e5843000 	str	r3, [r4]
   593c8:	0a000002 	beq	593d8 <mixerengine::MasterOutChannel::~MasterOutChannel()+0x30>
   593cc:	e5903000 	ldr	r3, [r0]
   593d0:	e5933004 	ldr	r3, [r3, #4]
   593d4:	e12fff33 	blx	r3
   593d8:	e3a03000 	mov	r3, #0
   593dc:	e2840028 	add	r0, r4, #40	@ 0x28
   593e0:	e5843084 	str	r3, [r4, #132]	@ 0x84
   593e4:	eb0d90d3 	bl	3bd738 <juce::Timer::~Timer()>
   593e8:	e1a00004 	mov	r0, r4
   593ec:	eb000149 	bl	59918 <mixerengine::OutputChannel::~OutputChannel()>
   593f0:	e1a00004 	mov	r0, r4
   593f4:	e8bd8010 	pop	{r4, pc}
   593f8:	e2840028 	add	r0, r4, #40	@ 0x28
   593fc:	eb0d90cd 	bl	3bd738 <juce::Timer::~Timer()>
   59400:	e1a00004 	mov	r0, r4
   59404:	eb000143 	bl	59918 <mixerengine::OutputChannel::~OutputChannel()>
   59408:	ebfed6ab 	bl	eebc <__cxa_end_cleanup@plt>
   5940c:	eafffffb 	b	59400 <mixerengine::MasterOutChannel::~MasterOutChannel()+0x58>
   59410:	004181e0 	.word	0x004181e0

00059414 <non-virtual thunk to mixerengine::MasterOutChannel::~MasterOutChannel()>:
   59414:	e2400028 	sub	r0, r0, #40	@ 0x28
   59418:	eaffffff 	b	5941c <mixerengine::MasterOutChannel::~MasterOutChannel()>

0005941c <mixerengine::MasterOutChannel::~MasterOutChannel()>:
   5941c:	e92d4010 	push	{r4, lr}
   59420:	e1a04000 	mov	r4, r0
   59424:	e5900084 	ldr	r0, [r0, #132]	@ 0x84
   59428:	e59f305c 	ldr	r3, [pc, #92]	@ 5948c <mixerengine::MasterOutChannel::~MasterOutChannel()+0x70>
   5942c:	e3500000 	cmp	r0, #0
   59430:	e2832020 	add	r2, r3, #32
   59434:	e5842028 	str	r2, [r4, #40]	@ 0x28
   59438:	e5843000 	str	r3, [r4]
   5943c:	0a000002 	beq	5944c <mixerengine::MasterOutChannel::~MasterOutChannel()+0x30>
   59440:	e5903000 	ldr	r3, [r0]
   59444:	e5933004 	ldr	r3, [r3, #4]
   59448:	e12fff33 	blx	r3
   5944c:	e3a03000 	mov	r3, #0
   59450:	e2840028 	add	r0, r4, #40	@ 0x28
   59454:	e5843084 	str	r3, [r4, #132]	@ 0x84
   59458:	eb0d90b6 	bl	3bd738 <juce::Timer::~Timer()>
   5945c:	e1a00004 	mov	r0, r4
   59460:	eb00012c 	bl	59918 <mixerengine::OutputChannel::~OutputChannel()>
   59464:	e1a00004 	mov	r0, r4
   59468:	ebfed618 	bl	ecd0 <operator delete(void*)@plt>
   5946c:	e1a00004 	mov	r0, r4
   59470:	e8bd8010 	pop	{r4, pc}
   59474:	e2840028 	add	r0, r4, #40	@ 0x28
   59478:	eb0d90ae 	bl	3bd738 <juce::Timer::~Timer()>
   5947c:	e1a00004 	mov	r0, r4
   59480:	eb000124 	bl	59918 <mixerengine::OutputChannel::~OutputChannel()>
   59484:	ebfed68c 	bl	eebc <__cxa_end_cleanup@plt>
   59488:	eafffffb 	b	5947c <mixerengine::MasterOutChannel::~MasterOutChannel()+0x60>
   5948c:	004181e0 	.word	0x004181e0

00059490 <mixerengine::MasterOutChannel::update(int)>:
   59490:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
   59494:	e1a04000 	mov	r4, r0
   59498:	e5903070 	ldr	r3, [r0, #112]	@ 0x70
   5949c:	e1a05001 	mov	r5, r1
   594a0:	e3530000 	cmp	r3, #0
   594a4:	0a00004b 	beq	595d8 <mixerengine::MasterOutChannel::update(int)+0x148>
   594a8:	e3550000 	cmp	r5, #0
   594ac:	d5941040 	ldrle	r1, [r4, #64]	@ 0x40
   594b0:	da000016 	ble	59510 <mixerengine::MasterOutChannel::update(int)+0x80>
   594b4:	e5943070 	ldr	r3, [r4, #112]	@ 0x70
   594b8:	e3a07000 	mov	r7, #0
   594bc:	e5941040 	ldr	r1, [r4, #64]	@ 0x40
   594c0:	eddf2b6a 	vldr	d18, [pc, #424]	@ 59670 <mixerengine::MasterOutChannel::update(int)+0x1e0>
   594c4:	e3530000 	cmp	r3, #0
   594c8:	e1a06187 	lsl	r6, r7, #3
   594cc:	e0810006 	add	r0, r1, r6
   594d0:	edc02b00 	vstr	d18, [r0]
   594d4:	0a00000a 	beq	59504 <mixerengine::MasterOutChannel::update(int)+0x74>
   594d8:	e284c050 	add	ip, r4, #80	@ 0x50
   594dc:	e3a02000 	mov	r2, #0
   594e0:	e2822001 	add	r2, r2, #1
   594e4:	e5bce004 	ldr	lr, [ip, #4]!
   594e8:	e1530002 	cmp	r3, r2
   594ec:	edd01b00 	vldr	d17, [r0]
   594f0:	e08ee006 	add	lr, lr, r6
   594f4:	edde0b00 	vldr	d16, [lr]
   594f8:	f2410da0 	vadd.f32	d16, d17, d16
   594fc:	edc00b00 	vstr	d16, [r0]
   59500:	8afffff6 	bhi	594e0 <mixerengine::MasterOutChannel::update(int)+0x50>
   59504:	e2877001 	add	r7, r7, #1
   59508:	e1570005 	cmp	r7, r5
   5950c:	1affffec 	bne	594c4 <mixerengine::MasterOutChannel::update(int)+0x34>
   59510:	e3a03000 	mov	r3, #0
   59514:	e1a00004 	mov	r0, r4
   59518:	e1a02005 	mov	r2, r5
   5951c:	eb00b12d 	bl	859d8 <dsp::BpmWaveDataProvider::copyDataForBpmWaveDetect(common::Float2 const*, int, unsigned long)>
   59520:	e594007c 	ldr	r0, [r4, #124]	@ 0x7c
   59524:	eb00c0f6 	bl	89904 <mixerengine::BeatEffectManager::getBeatEffectSelectChannel() const>
   59528:	e5943078 	ldr	r3, [r4, #120]	@ 0x78
   5952c:	e1500003 	cmp	r0, r3
   59530:	0a00003e 	beq	59630 <mixerengine::MasterOutChannel::update(int)+0x1a0>
   59534:	e594007c 	ldr	r0, [r4, #124]	@ 0x7c
   59538:	eb00c0f1 	bl	89904 <mixerengine::BeatEffectManager::getBeatEffectSelectChannel() const>
   5953c:	e5943078 	ldr	r3, [r4, #120]	@ 0x78
   59540:	e1500003 	cmp	r0, r3
   59544:	0a000042 	beq	59654 <mixerengine::MasterOutChannel::update(int)+0x1c4>
   59548:	e5940080 	ldr	r0, [r4, #128]	@ 0x80
   5954c:	e1a03005 	mov	r3, r5
   59550:	e594103c 	ldr	r1, [r4, #60]	@ 0x3c
   59554:	e5942040 	ldr	r2, [r4, #64]	@ 0x40
   59558:	eb010c7c 	bl	9c750 <mixerengine::MicTalkOver::attenuate(common::Float2*, common::Float2 const*, int)>
   5955c:	e3550000 	cmp	r5, #0
   59560:	da00000e 	ble	595a0 <mixerengine::MasterOutChannel::update(int)+0x110>
   59564:	e594603c 	ldr	r6, [r4, #60]	@ 0x3c
   59568:	e3a03000 	mov	r3, #0
   5956c:	e594e020 	ldr	lr, [r4, #32]
   59570:	e594c050 	ldr	ip, [r4, #80]	@ 0x50
   59574:	e1a02183 	lsl	r2, r3, #3
   59578:	e2833001 	add	r3, r3, #1
   5957c:	e1530005 	cmp	r3, r5
   59580:	e08e1002 	add	r1, lr, r2
   59584:	e0860002 	add	r0, r6, r2
   59588:	e08c2002 	add	r2, ip, r2
   5958c:	edd01b00 	vldr	d17, [r0]
   59590:	edd20b00 	vldr	d16, [r2]
   59594:	f2410da0 	vadd.f32	d16, d17, d16
   59598:	edc10b00 	vstr	d16, [r1]
   5959c:	1afffff4 	bne	59574 <mixerengine::MasterOutChannel::update(int)+0xe4>
   595a0:	e5940084 	ldr	r0, [r4, #132]	@ 0x84
   595a4:	e1a02005 	mov	r2, r5
   595a8:	e5941044 	ldr	r1, [r4, #68]	@ 0x44
   595ac:	eb000965 	bl	5bb48 <mixerengine::WavWriter::copyBuffer(common::Float2 const*, int)>
   595b0:	e3500000 	cmp	r0, #0
   595b4:	18bd80f8 	popne	{r3, r4, r5, r6, r7, pc}
   595b8:	e5d43088 	ldrb	r3, [r4, #136]	@ 0x88
   595bc:	e3530000 	cmp	r3, #0
   595c0:	1a000015 	bne	5961c <mixerengine::MasterOutChannel::update(int)+0x18c>
   595c4:	e5943040 	ldr	r3, [r4, #64]	@ 0x40
   595c8:	e5942044 	ldr	r2, [r4, #68]	@ 0x44
   595cc:	e1520003 	cmp	r2, r3
   595d0:	15843044 	strne	r3, [r4, #68]	@ 0x44
   595d4:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
   595d8:	e5906018 	ldr	r6, [r0, #24]
   595dc:	e5902014 	ldr	r2, [r0, #20]
   595e0:	ea000006 	b	59600 <mixerengine::MasterOutChannel::update(int)+0x170>
   595e4:	e4921004 	ldr	r1, [r2], #4
   595e8:	e5910014 	ldr	r0, [r1, #20]
   595ec:	e5911020 	ldr	r1, [r1, #32]
   595f0:	e3500003 	cmp	r0, #3
   595f4:	12833001 	addne	r3, r3, #1
   595f8:	05841050 	streq	r1, [r4, #80]	@ 0x50
   595fc:	158c1054 	strne	r1, [ip, #84]	@ 0x54
   59600:	e1520006 	cmp	r2, r6
   59604:	e084c103 	add	ip, r4, r3, lsl #2
   59608:	1afffff5 	bne	595e4 <mixerengine::MasterOutChannel::update(int)+0x154>
   5960c:	e3530000 	cmp	r3, #0
   59610:	e5843070 	str	r3, [r4, #112]	@ 0x70
   59614:	1affffa3 	bne	594a8 <mixerengine::MasterOutChannel::update(int)+0x18>
   59618:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
   5961c:	e5943020 	ldr	r3, [r4, #32]
   59620:	e5942044 	ldr	r2, [r4, #68]	@ 0x44
   59624:	e1520003 	cmp	r2, r3
   59628:	15843044 	strne	r3, [r4, #68]	@ 0x44
   5962c:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
   59630:	e594007c 	ldr	r0, [r4, #124]	@ 0x7c
   59634:	e1a02005 	mov	r2, r5
   59638:	e5941040 	ldr	r1, [r4, #64]	@ 0x40
   5963c:	eb00c643 	bl	8af50 <mixerengine::BeatEffectManager::copyMusicData(common::Float2 const*, int)>
   59640:	e594007c 	ldr	r0, [r4, #124]	@ 0x7c
   59644:	eb00c0ae 	bl	89904 <mixerengine::BeatEffectManager::getBeatEffectSelectChannel() const>
   59648:	e5943078 	ldr	r3, [r4, #120]	@ 0x78
   5964c:	e1500003 	cmp	r0, r3
   59650:	1affffbc 	bne	59548 <mixerengine::MasterOutChannel::update(int)+0xb8>
   59654:	e594007c 	ldr	r0, [r4, #124]	@ 0x7c
   59658:	e1a02005 	mov	r2, r5
   5965c:	e5941040 	ldr	r1, [r4, #64]	@ 0x40
   59660:	e3a03000 	mov	r3, #0
   59664:	eb00c3b0 	bl	8a52c <mixerengine::BeatEffectManager::operateBeatEffect(common::Float2*, int, bool)>
   59668:	eaffffb6 	b	59548 <mixerengine::MasterOutChannel::update(int)+0xb8>
   5966c:	e320f000 	nop	{0}
	...
