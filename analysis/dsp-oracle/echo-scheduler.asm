
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

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
   99100:	ee767aa7 	vadd.f32	s15, s13, s15
   99104:	ee677a27 	vmul.f32	s15, s14, s15
   99108:	eefd7ae7 	vcvt.s32.f32	s15, s15
   9910c:	ee173a90 	vmov	r3, s15
   99110:	e1540003 	cmp	r4, r3
   99114:	c0634004 	rsbgt	r4, r3, r4
   99118:	ee074a90 	vmov	s15, r4
   9911c:	eef81be7 	vcvt.f64.s32	d17, s15
   99120:	ee610ba0 	vmul.f64	d16, d17, d16
   99124:	eef50bc0 	vcmpe.f64	d16, #0.0
   99128:	ec510b30 	vmov	r0, r1, d16
   9912c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   99130:	ba000004 	blt	99148 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int)+0xa4>
   99134:	ebfdd6fd 	bl	ed30 <ceil@plt>
   99138:	ec410b30 	vmov	d16, r0, r1
   9913c:	eefd6be0 	vcvt.s32.f64	s13, d16
   99140:	ee160a90 	vmov	r0, s13
   99144:	eaffffdd 	b	990c0 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int)+0x1c>
   99148:	ebfdd9c8 	bl	f870 <floor@plt>
   9914c:	ec410b30 	vmov	d16, r0, r1
   99150:	eefd6be0 	vcvt.s32.f64	s13, d16
   99154:	ee160a90 	vmov	r0, s13
   99158:	eaffffd8 	b	990c0 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int)+0x1c>
   9915c:	e320f000 	nop	{0}
   99160:	f2a605ce 	.word	0xf2a605ce
   99164:	3f97384e 	.word	0x3f97384e

00099168 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)>:
   99168:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
   9916c:	e24dd008 	sub	sp, sp, #8
   99170:	e1a05000 	mov	r5, r0
   99174:	e28d0004 	add	r0, sp, #4
   99178:	e1a04001 	mov	r4, r1
   9917c:	e1a06002 	mov	r6, r2
   99180:	eb0073a1 	bl	b600c <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)>
   99184:	e3500000 	cmp	r0, #0
   99188:	0a00005e 	beq	99308 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x1a0>
   9918c:	eb007340 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   99190:	e59d1004 	ldr	r1, [sp, #4]
   99194:	ebff1908 	bl	5f5bc <playengine::PlayEngine::getBeatPosInfo(djengine::EnPlayerChannel) const>
   99198:	e3500000 	cmp	r0, #0
   9919c:	0a000059 	beq	99308 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x1a0>
   991a0:	e5903024 	ldr	r3, [r0, #36]	@ 0x24
   991a4:	e3530000 	cmp	r3, #0
   991a8:	0a00001c 	beq	99220 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0xb8>
   991ac:	e5908028 	ldr	r8, [r0, #40]	@ 0x28
   991b0:	e0548008 	subs	r8, r4, r8
   991b4:	4a000080 	bmi	993bc <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x254>
   991b8:	e590a034 	ldr	sl, [r0, #52]	@ 0x34
   991bc:	e5909038 	ldr	r9, [r0, #56]	@ 0x38
   991c0:	e5808030 	str	r8, [r0, #48]	@ 0x30
   991c4:	e06a7009 	rsb	r7, sl, r9
   991c8:	e1a0c00a 	mov	ip, sl
   991cc:	e1a071c7 	asr	r7, r7, #3
   991d0:	e3570000 	cmp	r7, #0
   991d4:	da000032 	ble	992a4 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x13c>
   991d8:	e1a030c7 	asr	r3, r7, #1
   991dc:	e08c1183 	add	r1, ip, r3, lsl #3
   991e0:	e5912004 	ldr	r2, [r1, #4]
   991e4:	e1520008 	cmp	r2, r8
   991e8:	2a000001 	bcs	991f4 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x8c>
   991ec:	ea00006c 	b	993a4 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x23c>
   991f0:	e1a03002 	mov	r3, r2
   991f4:	e1a020c3 	asr	r2, r3, #1
   991f8:	e3530000 	cmp	r3, #0
   991fc:	e08c1182 	add	r1, ip, r2, lsl #3
   99200:	0a000027 	beq	992a4 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x13c>
   99204:	e5917004 	ldr	r7, [r1, #4]
   99208:	e1580007 	cmp	r8, r7
   9920c:	9afffff7 	bls	991f0 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x88>
   99210:	e0623003 	rsb	r3, r2, r3
   99214:	e281c008 	add	ip, r1, #8
   99218:	e2437001 	sub	r7, r3, #1
   9921c:	eaffffeb 	b	991d0 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x68>
   99220:	e590c038 	ldr	ip, [r0, #56]	@ 0x38
   99224:	e590a034 	ldr	sl, [r0, #52]	@ 0x34
   99228:	e15c000a 	cmp	ip, sl
   9922c:	e3a03000 	mov	r3, #0
   99230:	e5c5305c 	strb	r3, [r5, #92]	@ 0x5c
   99234:	0a000022 	beq	992c4 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x15c>
   99238:	e5903038 	ldr	r3, [r0, #56]	@ 0x38
   9923c:	e28c2008 	add	r2, ip, #8
   99240:	e1520003 	cmp	r2, r3
   99244:	0a000031 	beq	99310 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x1a8>
   99248:	e5901024 	ldr	r1, [r0, #36]	@ 0x24
   9924c:	e3510000 	cmp	r1, #0
   99250:	15903028 	ldrne	r3, [r0, #40]	@ 0x28
   99254:	01a02001 	moveq	r2, r1
   99258:	151c2004 	ldrne	r2, [ip, #-4]
   9925c:	159c1004 	ldrne	r1, [ip, #4]
   99260:	10822003 	addne	r2, r2, r3
   99264:	10811003 	addne	r1, r1, r3
   99268:	e0623001 	rsb	r3, r2, r1
   9926c:	e0833fa3 	add	r3, r3, r3, lsr #31
   99270:	e08230c3 	add	r3, r2, r3, asr #1
   99274:	e1530004 	cmp	r3, r4
   99278:	0a00001a 	beq	992e8 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x180>
   9927c:	e1540003 	cmp	r4, r3
   99280:	aa000014 	bge	992d8 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x170>
   99284:	e0622004 	rsb	r2, r2, r4
   99288:	e0643003 	rsb	r3, r4, r3
   9928c:	e1520003 	cmp	r2, r3
   99290:	e24c0008 	sub	r0, ip, #8
   99294:	ca000038 	bgt	9937c <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x214>
   99298:	e3a03000 	mov	r3, #0
   9929c:	e5c5305f 	strb	r3, [r5, #95]	@ 0x5f
   992a0:	ea000013 	b	992f4 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x18c>
   992a4:	e15a000c 	cmp	sl, ip
   992a8:	0affffde 	beq	99228 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0xc0>
   992ac:	e159000c 	cmp	r9, ip
   992b0:	e3a03000 	mov	r3, #0
   992b4:	024cc008 	subeq	ip, ip, #8
   992b8:	e5c5305c 	strb	r3, [r5, #92]	@ 0x5c
   992bc:	e15c000a 	cmp	ip, sl
   992c0:	1affffdc 	bne	99238 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0xd0>
   992c4:	e3a02001 	mov	r2, #1
   992c8:	e5c5305f 	strb	r3, [r5, #95]	@ 0x5f
   992cc:	e5c5205c 	strb	r2, [r5, #92]	@ 0x5c
   992d0:	e1a0000c 	mov	r0, ip
   992d4:	ea000006 	b	992f4 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x18c>
   992d8:	e0633004 	rsb	r3, r3, r4
   992dc:	e0641001 	rsb	r1, r4, r1
   992e0:	e1530001 	cmp	r3, r1
   992e4:	ca000027 	bgt	99388 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x220>
   992e8:	e24c0008 	sub	r0, ip, #8
   992ec:	e3a03001 	mov	r3, #1
   992f0:	e5c5305f 	strb	r3, [r5, #95]	@ 0x5f
   992f4:	e3560000 	cmp	r6, #0
   992f8:	15c53060 	strbne	r3, [r5, #96]	@ 0x60
   992fc:	15c5305d 	strbne	r3, [r5, #93]	@ 0x5d
   99300:	e28dd008 	add	sp, sp, #8
   99304:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
   99308:	e3a00000 	mov	r0, #0
   9930c:	eafffffb 	b	99300 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x198>
   99310:	e5903024 	ldr	r3, [r0, #36]	@ 0x24
   99314:	e3530000 	cmp	r3, #0
   99318:	15902028 	ldrne	r2, [r0, #40]	@ 0x28
   9931c:	01a02003 	moveq	r2, r3
   99320:	159c1004 	ldrne	r1, [ip, #4]
   99324:	10812002 	addne	r2, r1, r2
   99328:	e1540002 	cmp	r4, r2
   9932c:	a3a03000 	movge	r3, #0
   99330:	a1a0000c 	movge	r0, ip
   99334:	a5c5305f 	strbge	r3, [r5, #95]	@ 0x5f
   99338:	aaffffed 	bge	992f4 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x18c>
   9933c:	e3530000 	cmp	r3, #0
   99340:	15903028 	ldrne	r3, [r0, #40]	@ 0x28
   99344:	151c1004 	ldrne	r1, [ip, #-4]
   99348:	10813003 	addne	r3, r1, r3
   9934c:	e0631002 	rsb	r1, r3, r2
   99350:	e0811fa1 	add	r1, r1, r1, lsr #31
   99354:	e08310c1 	add	r1, r3, r1, asr #1
   99358:	e1510004 	cmp	r1, r4
   9935c:	0affffe1 	beq	992e8 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x180>
   99360:	e1540001 	cmp	r4, r1
   99364:	aa000017 	bge	993c8 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x260>
   99368:	e0633004 	rsb	r3, r3, r4
   9936c:	e0641001 	rsb	r1, r4, r1
   99370:	e1530001 	cmp	r3, r1
   99374:	e24c0008 	sub	r0, ip, #8
   99378:	daffffc6 	ble	99298 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x130>
   9937c:	e3a03001 	mov	r3, #1
   99380:	e5c5305f 	strb	r3, [r5, #95]	@ 0x5f
   99384:	eaffffda 	b	992f4 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x18c>
   99388:	e3a02000 	mov	r2, #0
   9938c:	e1a0000c 	mov	r0, ip
   99390:	e1a03002 	mov	r3, r2
   99394:	e5c5205f 	strb	r2, [r5, #95]	@ 0x5f
   99398:	e3a02001 	mov	r2, #1
   9939c:	e5c5205c 	strb	r2, [r5, #92]	@ 0x5c
   993a0:	eaffffd3 	b	992f4 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x18c>
   993a4:	e1a02003 	mov	r2, r3
   993a8:	e1a03007 	mov	r3, r7
   993ac:	e0623003 	rsb	r3, r2, r3
   993b0:	e281c008 	add	ip, r1, #8
   993b4:	e2437001 	sub	r7, r3, #1
   993b8:	eaffff84 	b	991d0 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x68>
   993bc:	e590c034 	ldr	ip, [r0, #52]	@ 0x34
   993c0:	e1a0a00c 	mov	sl, ip
   993c4:	eaffff97 	b	99228 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0xc0>
   993c8:	e0611004 	rsb	r1, r1, r4
   993cc:	e0642002 	rsb	r2, r4, r2
   993d0:	e1510002 	cmp	r1, r2
   993d4:	daffffc3 	ble	992e8 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x180>
   993d8:	e3a03000 	mov	r3, #0
   993dc:	e3a02001 	mov	r2, #1
   993e0:	e5c5305f 	strb	r3, [r5, #95]	@ 0x5f
   993e4:	e1a0000c 	mov	r0, ip
   993e8:	e5c5205c 	strb	r2, [r5, #92]	@ 0x5c
   993ec:	eaffffc0 	b	992f4 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)+0x18c>

000993f0 <mixerengine::QuantizedBeatEffect::updateQuantizedTime(bool, int)>:
   993f0:	e92d4070 	push	{r4, r5, r6, lr}
   993f4:	e3a03000 	mov	r3, #0
   993f8:	e24dd008 	sub	sp, sp, #8
   993fc:	e5803064 	str	r3, [r0, #100]	@ 0x64
   99400:	e1a06001 	mov	r6, r1
   99404:	e1a01002 	mov	r1, r2
   99408:	e1a04000 	mov	r4, r0
   9940c:	ebffff24 	bl	990a4 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int)>
   99410:	e1a02006 	mov	r2, r6
   99414:	e1a05000 	mov	r5, r0
   99418:	e1a00004 	mov	r0, r4
   9941c:	e1a01005 	mov	r1, r5
   99420:	ebffff50 	bl	99168 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)>
   99424:	e28d2008 	add	r2, sp, #8
   99428:	e1a01005 	mov	r1, r5
   9942c:	e5220004 	str	r0, [r2, #-4]!
   99430:	e1a00004 	mov	r0, r4
   99434:	ebfffe4d 	bl	98d70 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]>
   99438:	e2502000 	subs	r2, r0, #0
   9943c:	0a000007 	beq	99460 <mixerengine::QuantizedBeatEffect::updateQuantizedTime(bool, int)+0x70>
   99440:	ee072a90 	vmov	s15, r2
   99444:	eef87ae7 	vcvt.f32.s32	s15, s15
   99448:	e5943000 	ldr	r3, [r4]
   9944c:	e1a00004 	mov	r0, r4
   99450:	e3a01003 	mov	r1, #3
   99454:	e593300c 	ldr	r3, [r3, #12]
   99458:	ee172a90 	vmov	r2, s15
   9945c:	e12fff33 	blx	r3
   99460:	e28dd008 	add	sp, sp, #8
   99464:	e8bd8070 	pop	{r4, r5, r6, pc}

00099468 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)>:
   99468:	e351000b 	cmp	r1, #11
   9946c:	e92d40f0 	push	{r4, r5, r6, r7, lr}
   99470:	e1a04000 	mov	r4, r0
   99474:	e24dd00c 	sub	sp, sp, #12
   99478:	9a000001 	bls	99484 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x1c>
   9947c:	e28dd00c 	add	sp, sp, #12
   99480:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
   99484:	eb0071fd 	bl	b5c80 <mixerengine::BeatEffect::checkBeatButtonRange(djengine::EnBeatButtonType, bool)>
   99488:	e1a0000d 	mov	r0, sp
   9948c:	eb0072de 	bl	b600c <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)>
   99490:	e3500000 	cmp	r0, #0
   99494:	0a00006f 	beq	99658 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x1f0>
   99498:	eb00727d 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   9949c:	e59d1000 	ldr	r1, [sp]
   994a0:	ebff1845 	bl	5f5bc <playengine::PlayEngine::getBeatPosInfo(djengine::EnPlayerChannel) const>
   994a4:	e1a05000 	mov	r5, r0
   994a8:	eb0072a8 	bl	b5f50 <mixerengine::BeatEffect::getMixerEngine()>
   994ac:	ebfef79a 	bl	5731c <mixerengine::MixerEngine::isBeatEffectQuantizeOn() const>
   994b0:	e3550000 	cmp	r5, #0
   994b4:	e5c40061 	strb	r0, [r4, #97]	@ 0x61
   994b8:	0a000001 	beq	994c4 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x5c>
   994bc:	e3500000 	cmp	r0, #0
   994c0:	1a000009 	bne	994ec <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x84>
   994c4:	eb0072a1 	bl	b5f50 <mixerengine::BeatEffect::getMixerEngine()>
   994c8:	ebfef793 	bl	5731c <mixerengine::MixerEngine::isBeatEffectQuantizeOn() const>
   994cc:	e3a03000 	mov	r3, #0
   994d0:	e5c43060 	strb	r3, [r4, #96]	@ 0x60
   994d4:	e5c4305d 	strb	r3, [r4, #93]	@ 0x5d
   994d8:	e5843058 	str	r3, [r4, #88]	@ 0x58
   994dc:	e3a03001 	mov	r3, #1
   994e0:	e5c4305e 	strb	r3, [r4, #94]	@ 0x5e
   994e4:	e5c40061 	strb	r0, [r4, #97]	@ 0x61
   994e8:	eaffffe3 	b	9947c <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x14>
   994ec:	e3a03000 	mov	r3, #0
   994f0:	e5843064 	str	r3, [r4, #100]	@ 0x64
   994f4:	ebfffdd7 	bl	98c58 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int) [clone .constprop.21]>
   994f8:	e3a02001 	mov	r2, #1
   994fc:	e1a05000 	mov	r5, r0
   99500:	e1a00004 	mov	r0, r4
   99504:	e1a01005 	mov	r1, r5
   99508:	ebffff16 	bl	99168 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)>
   9950c:	e28d2008 	add	r2, sp, #8
   99510:	e1a01005 	mov	r1, r5
   99514:	e5220004 	str	r0, [r2, #-4]!
   99518:	e1a00004 	mov	r0, r4
   9951c:	ebfffe13 	bl	98d70 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]>
   99520:	e2502000 	subs	r2, r0, #0
   99524:	0a000007 	beq	99548 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0xe0>
   99528:	ee072a90 	vmov	s15, r2
   9952c:	eef87ae7 	vcvt.f32.s32	s15, s15
   99530:	e5943000 	ldr	r3, [r4]
   99534:	e1a00004 	mov	r0, r4
   99538:	e3a01003 	mov	r1, #3
   9953c:	e593300c 	ldr	r3, [r3, #12]
   99540:	ee172a90 	vmov	r2, s15
   99544:	e12fff33 	blx	r3
   99548:	e5d43060 	ldrb	r3, [r4, #96]	@ 0x60
   9954c:	e5942044 	ldr	r2, [r4, #68]	@ 0x44
   99550:	e3530000 	cmp	r3, #0
   99554:	e59f3148 	ldr	r3, [pc, #328]	@ 996a4 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x23c>
   99558:	e0833102 	add	r3, r3, r2, lsl #2
   9955c:	e5932058 	ldr	r2, [r3, #88]	@ 0x58
   99560:	e5933088 	ldr	r3, [r3, #136]	@ 0x88
   99564:	1a00003f 	bne	99668 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x200>
   99568:	e3120001 	tst	r2, #1
   9956c:	0a000044 	beq	99684 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x21c>
   99570:	e5843058 	str	r3, [r4, #88]	@ 0x58
   99574:	e5d4205c 	ldrb	r2, [r4, #92]	@ 0x5c
   99578:	e1a0000d 	mov	r0, sp
   9957c:	e3520000 	cmp	r2, #0
   99580:	12833001 	addne	r3, r3, #1
   99584:	15843058 	strne	r3, [r4, #88]	@ 0x58
   99588:	eb00729f 	bl	b600c <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)>
   9958c:	e3500000 	cmp	r0, #0
   99590:	0affffb9 	beq	9947c <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x14>
   99594:	eb00723e 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   99598:	e59d1000 	ldr	r1, [sp]
   9959c:	ebff1806 	bl	5f5bc <playengine::PlayEngine::getBeatPosInfo(djengine::EnPlayerChannel) const>
   995a0:	e2505000 	subs	r5, r0, #0
   995a4:	0affffb4 	beq	9947c <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x14>
   995a8:	e59d6000 	ldr	r6, [sp]
   995ac:	eb007238 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   995b0:	e1a01006 	mov	r1, r6
   995b4:	ebff1104 	bl	5d9cc <playengine::PlayEngine::getPlayingTime(djengine::EnPlayerChannel) const>
   995b8:	e5953024 	ldr	r3, [r5, #36]	@ 0x24
   995bc:	e3530000 	cmp	r3, #0
   995c0:	05955038 	ldreq	r5, [r5, #56]	@ 0x38
   995c4:	0a000021 	beq	99650 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x1e8>
   995c8:	e5953028 	ldr	r3, [r5, #40]	@ 0x28
   995cc:	e0500003 	subs	r0, r0, r3
   995d0:	45955034 	ldrmi	r5, [r5, #52]	@ 0x34
   995d4:	4a00001d 	bmi	99650 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x1e8>
   995d8:	e5956034 	ldr	r6, [r5, #52]	@ 0x34
   995dc:	e5957038 	ldr	r7, [r5, #56]	@ 0x38
   995e0:	e5850030 	str	r0, [r5, #48]	@ 0x30
   995e4:	e066c007 	rsb	ip, r6, r7
   995e8:	e1a05006 	mov	r5, r6
   995ec:	e1a0c1cc 	asr	ip, ip, #3
   995f0:	e35c0000 	cmp	ip, #0
   995f4:	da000011 	ble	99640 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x1d8>
   995f8:	e1a030cc 	asr	r3, ip, #1
   995fc:	e0851183 	add	r1, r5, r3, lsl #3
   99600:	e5912004 	ldr	r2, [r1, #4]
   99604:	e1500002 	cmp	r0, r2
   99608:	9a000001 	bls	99614 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x1ac>
   9960c:	ea000021 	b	99698 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x230>
   99610:	e1a03002 	mov	r3, r2
   99614:	e1a020c3 	asr	r2, r3, #1
   99618:	e3530000 	cmp	r3, #0
   9961c:	e0851182 	add	r1, r5, r2, lsl #3
   99620:	0a000006 	beq	99640 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x1d8>
   99624:	e591c004 	ldr	ip, [r1, #4]
   99628:	e150000c 	cmp	r0, ip
   9962c:	9afffff7 	bls	99610 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x1a8>
   99630:	e0623003 	rsb	r3, r2, r3
   99634:	e2815008 	add	r5, r1, #8
   99638:	e243c001 	sub	ip, r3, #1
   9963c:	eaffffeb 	b	995f0 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x188>
   99640:	e1560005 	cmp	r6, r5
   99644:	0a000001 	beq	99650 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x1e8>
   99648:	e1570005 	cmp	r7, r5
   9964c:	02455008 	subeq	r5, r5, #8
   99650:	e5845054 	str	r5, [r4, #84]	@ 0x54
   99654:	eaffff88 	b	9947c <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x14>
   99658:	eb00723c 	bl	b5f50 <mixerengine::BeatEffect::getMixerEngine()>
   9965c:	ebfef72e 	bl	5731c <mixerengine::MixerEngine::isBeatEffectQuantizeOn() const>
   99660:	e5c40061 	strb	r0, [r4, #97]	@ 0x61
   99664:	eaffff96 	b	994c4 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x5c>
   99668:	e2122001 	ands	r2, r2, #1
   9966c:	1affffbf 	bne	99570 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x108>
   99670:	e1a030a3 	lsr	r3, r3, #1
   99674:	e5c4205d 	strb	r2, [r4, #93]	@ 0x5d
   99678:	e2833001 	add	r3, r3, #1
   9967c:	e5843058 	str	r3, [r4, #88]	@ 0x58
   99680:	eaffffbb 	b	99574 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x10c>
   99684:	e3a02001 	mov	r2, #1
   99688:	e1a03233 	lsr	r3, r3, r2
   9968c:	e5c4205d 	strb	r2, [r4, #93]	@ 0x5d
   99690:	e5843058 	str	r3, [r4, #88]	@ 0x58
   99694:	eaffffb6 	b	99574 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x10c>
   99698:	e1a02003 	mov	r2, r3
   9969c:	e1a0300c 	mov	r3, ip
   996a0:	eaffffe2 	b	99630 <mixerengine::QuantizedBeatEffect::setBeatButton(djengine::EnBeatButtonType, bool)+0x1c8>
   996a4:	0041ff88 	.word	0x0041ff88

000996a8 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()>:
   996a8:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
   996ac:	e24dd008 	sub	sp, sp, #8
   996b0:	e1a04000 	mov	r4, r0
   996b4:	e1a0000d 	mov	r0, sp
   996b8:	eb007253 	bl	b600c <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)>
   996bc:	e3500000 	cmp	r0, #0
   996c0:	0a00000b 	beq	996f4 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x4c>
   996c4:	eb0071f2 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   996c8:	e59d1000 	ldr	r1, [sp]
   996cc:	ebff17ba 	bl	5f5bc <playengine::PlayEngine::getBeatPosInfo(djengine::EnPlayerChannel) const>
   996d0:	e2505000 	subs	r5, r0, #0
   996d4:	0a000006 	beq	996f4 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x4c>
   996d8:	e59d6000 	ldr	r6, [sp]
   996dc:	eb0071ec 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   996e0:	e1a01006 	mov	r1, r6
   996e4:	e1a07000 	mov	r7, r0
   996e8:	ebff1253 	bl	5e03c <playengine::PlayEngine::isReversing(djengine::EnPlayerChannel) const>
   996ec:	e3500000 	cmp	r0, #0
   996f0:	0a000001 	beq	996fc <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x54>
   996f4:	e28dd008 	add	sp, sp, #8
   996f8:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
   996fc:	e1a00007 	mov	r0, r7
   99700:	e1a01006 	mov	r1, r6
   99704:	ebff1330 	bl	5e3cc <playengine::PlayEngine::isJogScratching(djengine::EnPlayerChannel) const>
   99708:	e3500000 	cmp	r0, #0
   9970c:	1afffff8 	bne	996f4 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x4c>
   99710:	e1a00007 	mov	r0, r7
   99714:	e1a01006 	mov	r1, r6
   99718:	ebff133a 	bl	5e408 <playengine::PlayEngine::isJogSpinning(djengine::EnPlayerChannel) const>
   9971c:	e3500000 	cmp	r0, #0
   99720:	1afffff3 	bne	996f4 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x4c>
   99724:	e1a00007 	mov	r0, r7
   99728:	e1a01006 	mov	r1, r6
   9972c:	ebff1276 	bl	5e10c <playengine::PlayEngine::isScanning(djengine::EnPlayerChannel) const>
   99730:	e3500000 	cmp	r0, #0
   99734:	1affffee 	bne	996f4 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x4c>
   99738:	e1a00007 	mov	r0, r7
   9973c:	e1a01006 	mov	r1, r6
   99740:	ebff10a1 	bl	5d9cc <playengine::PlayEngine::getPlayingTime(djengine::EnPlayerChannel) const>
   99744:	e595a024 	ldr	sl, [r5, #36]	@ 0x24
   99748:	e35a0000 	cmp	sl, #0
   9974c:	0595c038 	ldreq	ip, [r5, #56]	@ 0x38
   99750:	0a00001c 	beq	997c8 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x120>
   99754:	e5957028 	ldr	r7, [r5, #40]	@ 0x28
   99758:	e0507007 	subs	r7, r0, r7
   9975c:	4a000060 	bmi	998e4 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x23c>
   99760:	e5958034 	ldr	r8, [r5, #52]	@ 0x34
   99764:	e5959038 	ldr	r9, [r5, #56]	@ 0x38
   99768:	e5857030 	str	r7, [r5, #48]	@ 0x30
   9976c:	e0686009 	rsb	r6, r8, r9
   99770:	e1a0c008 	mov	ip, r8
   99774:	e1a061c6 	asr	r6, r6, #3
   99778:	e3560000 	cmp	r6, #0
   9977c:	da000049 	ble	998a8 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x200>
   99780:	e1a030c6 	asr	r3, r6, #1
   99784:	e08c1183 	add	r1, ip, r3, lsl #3
   99788:	e5912004 	ldr	r2, [r1, #4]
   9978c:	e1520007 	cmp	r2, r7
   99790:	2a000001 	bcs	9979c <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0xf4>
   99794:	ea00004f 	b	998d8 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x230>
   99798:	e1a03002 	mov	r3, r2
   9979c:	e1a020c3 	asr	r2, r3, #1
   997a0:	e3530000 	cmp	r3, #0
   997a4:	e08c1182 	add	r1, ip, r2, lsl #3
   997a8:	0a00003e 	beq	998a8 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x200>
   997ac:	e5916004 	ldr	r6, [r1, #4]
   997b0:	e1570006 	cmp	r7, r6
   997b4:	9afffff7 	bls	99798 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0xf0>
   997b8:	e0623003 	rsb	r3, r2, r3
   997bc:	e281c008 	add	ip, r1, #8
   997c0:	e2436001 	sub	r6, r3, #1
   997c4:	eaffffeb 	b	99778 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0xd0>
   997c8:	e1a0200a 	mov	r2, sl
   997cc:	e150000a 	cmp	r0, sl
   997d0:	ba000032 	blt	998a0 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x1f8>
   997d4:	e5953038 	ldr	r3, [r5, #56]	@ 0x38
   997d8:	e28c1008 	add	r1, ip, #8
   997dc:	e1510003 	cmp	r1, r3
   997e0:	0a00002c 	beq	99898 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x1f0>
   997e4:	e5943054 	ldr	r3, [r4, #84]	@ 0x54
   997e8:	e153000c 	cmp	r3, ip
   997ec:	e5943058 	ldr	r3, [r4, #88]	@ 0x58
   997f0:	0a000003 	beq	99804 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x15c>
   997f4:	e3530000 	cmp	r3, #0
   997f8:	e584c054 	str	ip, [r4, #84]	@ 0x54
   997fc:	12433001 	subne	r3, r3, #1
   99800:	15843058 	strne	r3, [r4, #88]	@ 0x58
   99804:	e3530000 	cmp	r3, #0
   99808:	1affffb9 	bne	996f4 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x4c>
   9980c:	e5d4105d 	ldrb	r1, [r4, #93]	@ 0x5d
   99810:	e3510000 	cmp	r1, #0
   99814:	0a000035 	beq	998f0 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x248>
   99818:	e5951024 	ldr	r1, [r5, #36]	@ 0x24
   9981c:	e3510000 	cmp	r1, #0
   99820:	15953028 	ldrne	r3, [r5, #40]	@ 0x28
   99824:	151c1004 	ldrne	r1, [ip, #-4]
   99828:	10813003 	addne	r3, r1, r3
   9982c:	e0632002 	rsb	r2, r3, r2
   99830:	e0822fa2 	add	r2, r2, r2, lsr #31
   99834:	e08330c2 	add	r3, r3, r2, asr #1
   99838:	e1500003 	cmp	r0, r3
   9983c:	baffffac 	blt	996f4 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x4c>
   99840:	e5d4605e 	ldrb	r6, [r4, #94]	@ 0x5e
   99844:	e3560000 	cmp	r6, #0
   99848:	13a03000 	movne	r3, #0
   9984c:	15c4305e 	strbne	r3, [r4, #94]	@ 0x5e
   99850:	0a000054 	beq	999a8 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x300>
   99854:	e5942044 	ldr	r2, [r4, #68]	@ 0x44
   99858:	e59f31a4 	ldr	r3, [pc, #420]	@ 99a04 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x35c>
   9985c:	e0832102 	add	r2, r3, r2, lsl #2
   99860:	e5923058 	ldr	r3, [r2, #88]	@ 0x58
   99864:	e2133001 	ands	r3, r3, #1
   99868:	05c4305d 	strbeq	r3, [r4, #93]	@ 0x5d
   9986c:	05922088 	ldreq	r2, [r2, #136]	@ 0x88
   99870:	15923088 	ldrne	r3, [r2, #136]	@ 0x88
   99874:	01a030a2 	lsreq	r3, r2, #1
   99878:	e5d4205c 	ldrb	r2, [r4, #92]	@ 0x5c
   9987c:	02833001 	addeq	r3, r3, #1
   99880:	e5843058 	str	r3, [r4, #88]	@ 0x58
   99884:	e3520000 	cmp	r2, #0
   99888:	0affff99 	beq	996f4 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x4c>
   9988c:	e2833001 	add	r3, r3, #1
   99890:	e5843058 	str	r3, [r4, #88]	@ 0x58
   99894:	eaffff96 	b	996f4 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x4c>
   99898:	e1500002 	cmp	r0, r2
   9989c:	baffffd0 	blt	997e4 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x13c>
   998a0:	e584c054 	str	ip, [r4, #84]	@ 0x54
   998a4:	eaffff92 	b	996f4 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x4c>
   998a8:	e158000c 	cmp	r8, ip
   998ac:	0a000001 	beq	998b8 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x210>
   998b0:	e159000c 	cmp	r9, ip
   998b4:	024cc008 	subeq	ip, ip, #8
   998b8:	e35a0000 	cmp	sl, #0
   998bc:	0affffc1 	beq	997c8 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x120>
   998c0:	e5953028 	ldr	r3, [r5, #40]	@ 0x28
   998c4:	e598a004 	ldr	sl, [r8, #4]
   998c8:	e59c2004 	ldr	r2, [ip, #4]
   998cc:	e083a00a 	add	sl, r3, sl
   998d0:	e0832002 	add	r2, r3, r2
   998d4:	eaffffbc 	b	997cc <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x124>
   998d8:	e1a02003 	mov	r2, r3
   998dc:	e1a03006 	mov	r3, r6
   998e0:	eaffffb4 	b	997b8 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x110>
   998e4:	e595c034 	ldr	ip, [r5, #52]	@ 0x34
   998e8:	e1a0800c 	mov	r8, ip
   998ec:	eafffff1 	b	998b8 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x210>
   998f0:	e5843064 	str	r3, [r4, #100]	@ 0x64
   998f4:	e5d4605e 	ldrb	r6, [r4, #94]	@ 0x5e
   998f8:	ebfffcd6 	bl	98c58 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int) [clone .constprop.21]>
   998fc:	e1a02006 	mov	r2, r6
   99900:	e1a05000 	mov	r5, r0
   99904:	e1a00004 	mov	r0, r4
   99908:	e1a01005 	mov	r1, r5
   9990c:	ebfffe15 	bl	99168 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)>
   99910:	e28d2008 	add	r2, sp, #8
   99914:	e1a01005 	mov	r1, r5
   99918:	e5220004 	str	r0, [r2, #-4]!
   9991c:	e1a00004 	mov	r0, r4
   99920:	ebfffd12 	bl	98d70 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]>
   99924:	e2502000 	subs	r2, r0, #0
   99928:	0a000007 	beq	9994c <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x2a4>
   9992c:	ee072a90 	vmov	s15, r2
   99930:	eef87ae7 	vcvt.f32.s32	s15, s15
   99934:	e5943000 	ldr	r3, [r4]
   99938:	e1a00004 	mov	r0, r4
   9993c:	e3a01003 	mov	r1, #3
   99940:	e593300c 	ldr	r3, [r3, #12]
   99944:	ee172a90 	vmov	r2, s15
   99948:	e12fff33 	blx	r3
   9994c:	e5942044 	ldr	r2, [r4, #68]	@ 0x44
   99950:	e59f30ac 	ldr	r3, [pc, #172]	@ 99a04 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x35c>
   99954:	e0833102 	add	r3, r3, r2, lsl #2
   99958:	e5932058 	ldr	r2, [r3, #88]	@ 0x58
   9995c:	e3120001 	tst	r2, #1
   99960:	1a00000d 	bne	9999c <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x2f4>
   99964:	e5d42060 	ldrb	r2, [r4, #96]	@ 0x60
   99968:	e5933088 	ldr	r3, [r3, #136]	@ 0x88
   9996c:	e3520000 	cmp	r2, #0
   99970:	e3a02001 	mov	r2, #1
   99974:	e5c4205d 	strb	r2, [r4, #93]	@ 0x5d
   99978:	e1a03233 	lsr	r3, r3, r2
   9997c:	e5843058 	str	r3, [r4, #88]	@ 0x58
   99980:	1a000001 	bne	9998c <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x2e4>
   99984:	e3a02000 	mov	r2, #0
   99988:	e5c4205e 	strb	r2, [r4, #94]	@ 0x5e
   9998c:	e5d4205c 	ldrb	r2, [r4, #92]	@ 0x5c
   99990:	e3520000 	cmp	r2, #0
   99994:	0affff56 	beq	996f4 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x4c>
   99998:	eaffffbb 	b	9988c <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x1e4>
   9999c:	e5933088 	ldr	r3, [r3, #136]	@ 0x88
   999a0:	e5843058 	str	r3, [r4, #88]	@ 0x58
   999a4:	eafffff6 	b	99984 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x2dc>
   999a8:	e5846064 	str	r6, [r4, #100]	@ 0x64
   999ac:	ebfffca9 	bl	98c58 <mixerengine::QuantizedBeatEffect::calcPlayingTime(int) [clone .constprop.21]>
   999b0:	e1a02006 	mov	r2, r6
   999b4:	e1a05000 	mov	r5, r0
   999b8:	e1a00004 	mov	r0, r4
   999bc:	e1a01005 	mov	r1, r5
   999c0:	ebfffde8 	bl	99168 <mixerengine::QuantizedBeatEffect::searchNearestBeat(long, bool)>
   999c4:	e28d2008 	add	r2, sp, #8
   999c8:	e1a01005 	mov	r1, r5
   999cc:	e5220004 	str	r0, [r2, #-4]!
   999d0:	e1a00004 	mov	r0, r4
   999d4:	ebfffce5 	bl	98d70 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&) [clone .constprop.22]>
   999d8:	e2502000 	subs	r2, r0, #0
   999dc:	0affff9c 	beq	99854 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x1ac>
   999e0:	ee072a90 	vmov	s15, r2
   999e4:	eef87ae7 	vcvt.f32.s32	s15, s15
   999e8:	e5943000 	ldr	r3, [r4]
   999ec:	e1a00004 	mov	r0, r4
   999f0:	e3a01003 	mov	r1, #3
   999f4:	e593300c 	ldr	r3, [r3, #12]
   999f8:	ee172a90 	vmov	r2, s15
   999fc:	e12fff33 	blx	r3
   99a00:	eaffff93 	b	99854 <mixerengine::QuantizedBeatEffect::checkQuantizeBeat()+0x1ac>
   99a04:	0041ff88 	.word	0x0041ff88

00099a08 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)>:
   99a08:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   99a0c:	e24dd008 	sub	sp, sp, #8
   99a10:	e1a05000 	mov	r5, r0
   99a14:	e1a07001 	mov	r7, r1
   99a18:	e1a0000d 	mov	r0, sp
   99a1c:	e1a06002 	mov	r6, r2
   99a20:	eb007179 	bl	b600c <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)>
   99a24:	e2504000 	subs	r4, r0, #0
   99a28:	0a000036 	beq	99b08 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x100>
   99a2c:	eb007118 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   99a30:	e59d1000 	ldr	r1, [sp]
   99a34:	ebff16e0 	bl	5f5bc <playengine::PlayEngine::getBeatPosInfo(djengine::EnPlayerChannel) const>
   99a38:	e2504000 	subs	r4, r0, #0
   99a3c:	0a000031 	beq	99b08 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x100>
   99a40:	e5962000 	ldr	r2, [r6]
   99a44:	e5943038 	ldr	r3, [r4, #56]	@ 0x38
   99a48:	e2822008 	add	r2, r2, #8
   99a4c:	e59d8000 	ldr	r8, [sp]
   99a50:	e1520003 	cmp	r2, r3
   99a54:	0a00002a 	beq	99b04 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0xfc>
   99a58:	eb00710d 	bl	b5e94 <mixerengine::BeatEffect::getPlayEngine()>
   99a5c:	e3a02001 	mov	r2, #1
   99a60:	e1a01008 	mov	r1, r8
   99a64:	ebff10ae 	bl	5dd24 <playengine::PlayEngine::getTempo(djengine::EnPlayerChannel, bool) const>
   99a68:	e5963000 	ldr	r3, [r6]
   99a6c:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   99a70:	e1d320b2 	ldrh	r2, [r3, #2]
   99a74:	ee062a10 	vmov	s12, r2
   99a78:	eef87a46 	vcvt.f32.u32	s15, s12
   99a7c:	eefc7ae7 	vcvt.u32.f32	s15, s15
   99a80:	eef86a67 	vcvt.f32.u32	s13, s15
   99a84:	ee060a10 	vmov	s12, r0
   99a88:	ee367a07 	vadd.f32	s14, s12, s14
   99a8c:	ee266a87 	vmul.f32	s12, s13, s14
   99a90:	eebc6ac6 	vcvt.u32.f32	s12, s12
   99a94:	ee162a10 	vmov	r2, s12
   99a98:	e3520efa 	cmp	r2, #4000	@ 0xfa0
   99a9c:	2a000005 	bcs	99ab8 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0xb0>
   99aa0:	ee172a90 	vmov	r2, s15
   99aa4:	e3520000 	cmp	r2, #0
   99aa8:	0e174a90 	vmoveq	r4, s15
   99aac:	0a000015 	beq	99b08 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x100>
   99ab0:	eddf7a60 	vldr	s15, [pc, #384]	@ 99c38 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x230>
   99ab4:	ee877aa6 	vdiv.f32	s14, s15, s13
   99ab8:	e5951044 	ldr	r1, [r5, #68]	@ 0x44
   99abc:	e59f2178 	ldr	r2, [pc, #376]	@ 99c3c <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x234>
   99ac0:	e0821101 	add	r1, r2, r1, lsl #2
   99ac4:	e5916058 	ldr	r6, [r1, #88]	@ 0x58
   99ac8:	e2162001 	ands	r2, r6, #1
   99acc:	0a000010 	beq	99b14 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x10c>
   99ad0:	e5911088 	ldr	r1, [r1, #136]	@ 0x88
   99ad4:	e5856068 	str	r6, [r5, #104]	@ 0x68
   99ad8:	e3510000 	cmp	r1, #0
   99adc:	0a00001a 	beq	99b4c <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x144>
   99ae0:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   99ae4:	e3a02000 	mov	r2, #0
   99ae8:	ea000001 	b	99af4 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0xec>
   99aec:	e1520001 	cmp	r2, r1
   99af0:	0a000015 	beq	99b4c <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x144>
   99af4:	e2833008 	add	r3, r3, #8
   99af8:	e2822001 	add	r2, r2, #1
   99afc:	e1530000 	cmp	r3, r0
   99b00:	1afffff9 	bne	99aec <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0xe4>
   99b04:	e3a04000 	mov	r4, #0
   99b08:	e1a00004 	mov	r0, r4
   99b0c:	e28dd008 	add	sp, sp, #8
   99b10:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
   99b14:	e5910088 	ldr	r0, [r1, #136]	@ 0x88
   99b18:	e1a060a6 	lsr	r6, r6, #1
   99b1c:	e5941038 	ldr	r1, [r4, #56]	@ 0x38
   99b20:	e5856068 	str	r6, [r5, #104]	@ 0x68
   99b24:	e1b000a0 	lsrs	r0, r0, #1
   99b28:	1a000002 	bne	99b38 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x130>
   99b2c:	ea000029 	b	99bd8 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x1d0>
   99b30:	e1520000 	cmp	r2, r0
   99b34:	0a000027 	beq	99bd8 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x1d0>
   99b38:	e2833008 	add	r3, r3, #8
   99b3c:	e2822001 	add	r2, r2, #1
   99b40:	e1530001 	cmp	r3, r1
   99b44:	1afffff9 	bne	99b30 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x128>
   99b48:	eaffffed 	b	99b04 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0xfc>
   99b4c:	e5941024 	ldr	r1, [r4, #36]	@ 0x24
   99b50:	e3510000 	cmp	r1, #0
   99b54:	1593000c 	ldrne	r0, [r3, #12]
   99b58:	01a02001 	moveq	r2, r1
   99b5c:	15942028 	ldrne	r2, [r4, #40]	@ 0x28
   99b60:	15931004 	ldrne	r1, [r3, #4]
   99b64:	10811002 	addne	r1, r1, r2
   99b68:	10802002 	addne	r2, r0, r2
   99b6c:	e5d50060 	ldrb	r0, [r5, #96]	@ 0x60
   99b70:	e3500000 	cmp	r0, #0
   99b74:	01a03001 	moveq	r3, r1
   99b78:	0a000006 	beq	99b98 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x190>
   99b7c:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   99b80:	e2833008 	add	r3, r3, #8
   99b84:	e1530000 	cmp	r3, r0
   99b88:	0affffdd 	beq	99b04 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0xfc>
   99b8c:	e0612002 	rsb	r2, r1, r2
   99b90:	e0822fa2 	add	r2, r2, r2, lsr #31
   99b94:	e08130c2 	add	r3, r1, r2, asr #1
   99b98:	e1530007 	cmp	r3, r7
   99b9c:	daffffd8 	ble	99b04 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0xfc>
   99ba0:	e0673003 	rsb	r3, r7, r3
   99ba4:	ee063a10 	vmov	s12, r3
   99ba8:	eef87ac6 	vcvt.f32.s32	s15, s12
   99bac:	e1a01006 	mov	r1, r6
   99bb0:	eec77a87 	vdiv.f32	s15, s15, s14
   99bb4:	eefd7ae7 	vcvt.s32.f32	s15, s15
   99bb8:	ee170a90 	vmov	r0, s15
   99bbc:	ebfdd5a2 	bl	f24c <__aeabi_uidiv@plt>
   99bc0:	e1a01006 	mov	r1, r6
   99bc4:	e1a04000 	mov	r4, r0
   99bc8:	ebfdd2b1 	bl	e694 <__aeabi_uidivmod@plt>
   99bcc:	e3510000 	cmp	r1, #0
   99bd0:	12844001 	addne	r4, r4, #1
   99bd4:	eaffffcb 	b	99b08 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x100>
   99bd8:	e5942024 	ldr	r2, [r4, #36]	@ 0x24
   99bdc:	e3520000 	cmp	r2, #0
   99be0:	15942028 	ldrne	r2, [r4, #40]	@ 0x28
   99be4:	01a00002 	moveq	r0, r2
   99be8:	15930004 	ldrne	r0, [r3, #4]
   99bec:	01a02000 	moveq	r2, r0
   99bf0:	1593c00c 	ldrne	ip, [r3, #12]
   99bf4:	e2833008 	add	r3, r3, #8
   99bf8:	e5d5405f 	ldrb	r4, [r5, #95]	@ 0x5f
   99bfc:	10800002 	addne	r0, r0, r2
   99c00:	108c2002 	addne	r2, ip, r2
   99c04:	e3540000 	cmp	r4, #0
   99c08:	1a000005 	bne	99c24 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x21c>
   99c0c:	e1530001 	cmp	r3, r1
   99c10:	0affffbc 	beq	99b08 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x100>
   99c14:	e0602002 	rsb	r2, r0, r2
   99c18:	e0822fa2 	add	r2, r2, r2, lsr #31
   99c1c:	e08030c2 	add	r3, r0, r2, asr #1
   99c20:	eaffffdc 	b	99b98 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x190>
   99c24:	e1530001 	cmp	r3, r1
   99c28:	11a03002 	movne	r3, r2
   99c2c:	1affffd9 	bne	99b98 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x190>
   99c30:	e3a04000 	mov	r4, #0
   99c34:	eaffffb3 	b	99b08 <mixerengine::QuantizedBeatEffect::calcQuantizedTime(long, __gnu_cxx::__normal_iterator<common::myBeat*, std::vector<common::myBeat, std::allocator<common::myBeat> > > const&)+0x100>
   99c38:	457a0000 	.word	0x457a0000
   99c3c:	0041ff88 	.word	0x0041ff88
