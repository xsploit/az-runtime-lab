
rx3-research/pi-runtime/rbp:	file format elf32-littlearm

Disassembly of section .text:

000b6160 <_ZNK11mixerengine15BeatEffectDelay18getBufferSampleNumEv>:
   b6160:      	ldr	r0, [r0, #0x78]
   b6164:      	bx	lr

000b6168 <_ZN11mixerengine15BeatEffectDelay10initializeEv>:
   b6168:      	ldr	r3, [r0, #0x4]
   b616c:      	mov	r2, #0
   b6170:      	str	r2, [r0, #0x7c]
   b6174:      	lsl	r3, r3, #3
   b6178:      	str	r3, [r0, #0x78]
   b617c:      	bx	lr

000b6180 <_ZN11mixerengine15BeatEffectDelay15changeTimeValueEv>:
   b6180:      	mov	r3, #1
   b6184:      	strb	r3, [r0, #0x88]
   b6188:      	bx	lr

000b618c <_ZN11mixerengine15BeatEffectDelay22changeEffectStatusToOnEv>:
   b618c:      	ldr	r2, [r0, #0x8c]
   b6190:      	mov	r3, #0
   b6194:      	vdup.32	d16, r3
   b6198:      	ldr	r12, [r0, #0x90]
   b619c:      	vadd.f32	d19, d16, d16
   b61a0:      	ldr	r1, [r2, #0x20]
   b61a4:      	push	{r4, lr}
   b61a8:      	mov	lr, #0
   b61ac:      	ldr	r4, [r0]
   b61b0:      	vdup.32	d18, r1
   b61b4:      	ldr	r1, [r0, #0x94]
   b61b8:      	vstr	d16, [r2, #16]
   b61bc:      	str	lr, [r2, #0x18]
   b61c0:      	strb	lr, [r2, #0x24]
   b61c4:      	mov	lr, #1065353216
   b61c8:      	vdup.32	d17, lr
   b61cc:      	ldr	r3, [r4, #0x38]
   b61d0:      	vsub.f32	d19, d17, d19
   b61d4:      	vstr	d17, [r2, #8]
   b61d8:      	vmul.f32	d18, d19, d18
   b61dc:      	vstr	d18, [r2]
   b61e0:      	vstr	d17, [r12, #16]
   b61e4:      	vstr	d17, [r12, #8]
   b61e8:      	vstr	d16, [r12]
   b61ec:      	vstr	d16, [r1, #16]
   b61f0:      	vstr	d16, [r1, #8]
   b61f4:      	vstr	d16, [r1]
   b61f8:      	blx	r3
   b61fc:      	pop	{r4, pc}

000b6200 <_ZN11mixerengine15BeatEffectDelay23changeEffectStatusToOffEv>:
   b6200:      	ldr	r1, [r0, #0x8c]
   b6204:      	mov	r3, #0
   b6208:      	ldr	r2, [r0, #0x90]
   b620c:      	vldr	d19, [r1]
   b6210:      	vldr	d16, [r1, #16]
   b6214:      	vadd.f32	d19, d16, d19
   b6218:      	vdup.32	d16, r3
   b621c:      	ldr	r3, [r1, #0x20]
   b6220:      	vstr	d16, [r1, #8]
   b6224:      	vdup.32	d18, r3
   b6228:      	ldr	r3, [r2, #0x20]
   b622c:      	vsub.f32	d19, d16, d19
   b6230:      	vdup.32	d17, r3
   b6234:      	ldr	r3, [r0, #0x94]
   b6238:      	mov	r0, #0
   b623c:      	str	r0, [r1, #0x18]
   b6240:      	vmul.f32	d18, d19, d18
   b6244:      	strb	r0, [r1, #0x24]
   b6248:      	ldr	r12, [r3, #0x20]
   b624c:      	vstr	d18, [r1]
   b6250:      	vldr	d20, [r2]
   b6254:      	vldr	d18, [r2, #16]
   b6258:      	vadd.f32	d20, d18, d20
   b625c:      	mov	r1, #1065353216
   b6260:      	vdup.32	d19, r1
   b6264:      	vstr	d19, [r2, #8]
   b6268:      	str	r0, [r2, #0x18]
   b626c:      	vdup.32	d18, r12
   b6270:      	strb	r0, [r2, #0x24]
   b6274:      	vsub.f32	d19, d19, d20
   b6278:      	vmul.f32	d17, d19, d17
   b627c:      	vstr	d17, [r2]
   b6280:      	vldr	d17, [r3]
   b6284:      	vldr	d19, [r3, #16]
   b6288:      	vadd.f32	d17, d19, d17
   b628c:      	vstr	d16, [r3, #8]
   b6290:      	str	r0, [r3, #0x18]
   b6294:      	strb	r0, [r3, #0x24]
   b6298:      	vsub.f32	d16, d16, d17
   b629c:      	vmul.f32	d18, d16, d18
   b62a0:      	vstr	d18, [r3]
   b62a4:      	bx	lr

000b62a8 <_ZN11mixerengine15BeatEffectDelay21changeLevelDepthValueEv>:
   b62a8:      	vldr	s14, [pc, #216]         @ 0xb6388 <_ZN11mixerengine15BeatEffectDelay21changeLevelDepthValueEv+0xe0>
   b62ac:      	vldr	s15, [r0, #32]
   b62b0:      	vcmpe.f32	s15, s14
   b62b4:      	vmrs	APSR_nzcv, fpscr
   b62b8:      	bmi	0xb62e0 <_ZN11mixerengine15BeatEffectDelay21changeLevelDepthValueEv+0x38> @ imm = #0x20
   b62bc:      	vmov.f32	s13, #7.500000e-01
   b62c0:      	vcmpe.f32	s15, s13
   b62c4:      	vmrs	APSR_nzcv, fpscr
   b62c8:      	bpl	0xb6358 <_ZN11mixerengine15BeatEffectDelay21changeLevelDepthValueEv+0xb0> @ imm = #0x88
   b62cc:      	vsub.f32	s15, s15, s14
   b62d0:      	vldr	s12, [pc, #180]         @ 0xb638c <_ZN11mixerengine15BeatEffectDelay21changeLevelDepthValueEv+0xe4>
   b62d4:      	vmov.f32	s13, #1.000000e+00
   b62d8:      	vmul.f32	s14, s15, s12
   b62dc:      	b	0xb62e8 <_ZN11mixerengine15BeatEffectDelay21changeLevelDepthValueEv+0x40> @ imm = #0x4
   b62e0:      	vmov.f32	s13, #1.000000e+00
   b62e4:      	vldr	s14, [pc, #164]         @ 0xb6390 <_ZN11mixerengine15BeatEffectDelay21changeLevelDepthValueEv+0xe8>
   b62e8:      	ldr	r2, [r0, #0x90]
   b62ec:      	vldr	d19, [r2]
   b62f0:      	vldr	d16, [r2, #16]
   b62f4:      	vadd.f32	d19, d16, d19
   b62f8:      	vdup.32	d17, d6[1]
   b62fc:      	ldr	r3, [r2, #0x20]
   b6300:      	vdup.32	d16, d7[0]
   b6304:      	vsub.f32	d19, d17, d19
   b6308:      	vdup.32	d20, r3
   b630c:      	ldr	r3, [r0, #0x94]
   b6310:      	vstr	d17, [r2, #8]
   b6314:      	ldr	r1, [r3, #0x20]
   b6318:      	vmul.f32	d17, d19, d20
   b631c:      	vstr	d17, [r2]
   b6320:      	vldr	d17, [r3]
   b6324:      	vldr	d19, [r3, #16]
   b6328:      	vadd.f32	d17, d19, d17
   b632c:      	vdup.32	d18, r1
   b6330:      	mov	r1, #0
   b6334:      	str	r1, [r2, #0x18]
   b6338:      	strb	r1, [r2, #0x24]
   b633c:      	vstr	d16, [r3, #8]
   b6340:      	vsub.f32	d17, d16, d17
   b6344:      	str	r1, [r3, #0x18]
   b6348:      	strb	r1, [r3, #0x24]
   b634c:      	vmul.f32	d16, d17, d18
   b6350:      	vstr	d16, [r3]
   b6354:      	bx	lr
   b6358:      	vldr	s14, [pc, #52]          @ 0xb6394 <_ZN11mixerengine15BeatEffectDelay21changeLevelDepthValueEv+0xec>
   b635c:      	vcmpe.f32	s15, s14
   b6360:      	vmrs	APSR_nzcv, fpscr
   b6364:      	bpl	0xb637c <_ZN11mixerengine15BeatEffectDelay21changeLevelDepthValueEv+0xd4> @ imm = #0x10
   b6368:      	vsub.f32	s15, s14, s15
   b636c:      	vldr	s13, [pc, #36]          @ 0xb6398 <_ZN11mixerengine15BeatEffectDelay21changeLevelDepthValueEv+0xf0>
   b6370:      	vmov.f32	s14, #1.000000e+00
   b6374:      	vmul.f32	s13, s15, s13
   b6378:      	b	0xb62e8 <_ZN11mixerengine15BeatEffectDelay21changeLevelDepthValueEv+0x40> @ imm = #-0x98
   b637c:      	vmov.f32	s14, #1.000000e+00
   b6380:      	vldr	s13, [pc, #8]           @ 0xb6390 <_ZN11mixerengine15BeatEffectDelay21changeLevelDepthValueEv+0xe8>
   b6384:      	b	0xb62e8 <_ZN11mixerengine15BeatEffectDelay21changeLevelDepthValueEv+0x40> @ imm = #-0xa4
   b6388: 00 00 20 3c  	.word	0x3c200000
   b638c: 10 eb ac 3f  	.word	0x3faceb10
   b6390: 00 00 00 00  	.word	0x00000000
   b6394: 00 80 7d 3f  	.word	0x3f7d8000
   b6398: 08 34 85 40  	.word	0x40853408
