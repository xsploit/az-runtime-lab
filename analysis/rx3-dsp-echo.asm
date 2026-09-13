
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000b6d38 <mixerengine::BeatEffectEcho::getBufferSampleNum() const>:
   b6d38:	e590007c 	ldr	r0, [r0, #124]	@ 0x7c
   b6d3c:	e12fff1e 	bx	lr

000b6d40 <mixerengine::BeatEffectEcho::initialize()>:
   b6d40:	e5903004 	ldr	r3, [r0, #4]
   b6d44:	e3a02000 	mov	r2, #0
   b6d48:	e5802080 	str	r2, [r0, #128]	@ 0x80
   b6d4c:	e1a03183 	lsl	r3, r3, #3
   b6d50:	e580307c 	str	r3, [r0, #124]	@ 0x7c
   b6d54:	e12fff1e 	bx	lr

000b6d58 <mixerengine::BeatEffectEcho::keepEffectInit()>:
   b6d58:	e3a03001 	mov	r3, #1
   b6d5c:	e5803080 	str	r3, [r0, #128]	@ 0x80
   b6d60:	e12fff1e 	bx	lr

000b6d64 <mixerengine::BeatEffectEcho::changeTimeValue()>:
   b6d64:	e3a03001 	mov	r3, #1
   b6d68:	e5c0308c 	strb	r3, [r0, #140]	@ 0x8c
   b6d6c:	e12fff1e 	bx	lr

000b6d70 <mixerengine::BeatEffectEcho::changeEffectStatusToOn()>:
   b6d70:	e5902090 	ldr	r2, [r0, #144]	@ 0x90
   b6d74:	e92d4008 	push	{r3, lr}
   b6d78:	e3a03000 	mov	r3, #0
   b6d7c:	e5901000 	ldr	r1, [r0]
   b6d80:	ee803b90 	vdup.32	d16, r3
   b6d84:	e5923020 	ldr	r3, [r2, #32]
   b6d88:	f2401da0 	vadd.f32	d17, d16, d16
   b6d8c:	edc20b04 	vstr	d16, [r2, #16]
   b6d90:	ee823b90 	vdup.32	d18, r3
   b6d94:	e3a03000 	mov	r3, #0
   b6d98:	e5823018 	str	r3, [r2, #24]
   b6d9c:	e5c23024 	strb	r3, [r2, #36]	@ 0x24
   b6da0:	e5913038 	ldr	r3, [r1, #56]	@ 0x38
   b6da4:	e3a015fe 	mov	r1, #1065353216	@ 0x3f800000
   b6da8:	ee801b90 	vdup.32	d16, r1
   b6dac:	edc20b02 	vstr	d16, [r2, #8]
   b6db0:	f2601da1 	vsub.f32	d17, d16, d17
   b6db4:	f3410db2 	vmul.f32	d16, d17, d18
   b6db8:	edc20b00 	vstr	d16, [r2]
   b6dbc:	e12fff33 	blx	r3
   b6dc0:	e8bd8008 	pop	{r3, pc}

000b6dc4 <mixerengine::BeatEffectEcho::changeEffectStatusToOff()>:
   b6dc4:	e5903090 	ldr	r3, [r0, #144]	@ 0x90
   b6dc8:	edd31b00 	vldr	d17, [r3]
   b6dcc:	edd32b04 	vldr	d18, [r3, #16]
   b6dd0:	f2421da1 	vadd.f32	d17, d18, d17
   b6dd4:	e3a02000 	mov	r2, #0
   b6dd8:	ee802b90 	vdup.32	d16, r2
   b6ddc:	e5932020 	ldr	r2, [r3, #32]
   b6de0:	edc30b02 	vstr	d16, [r3, #8]
   b6de4:	f2601da1 	vsub.f32	d17, d16, d17
   b6de8:	ee822b90 	vdup.32	d18, r2
   b6dec:	e3a02000 	mov	r2, #0
   b6df0:	e5832018 	str	r2, [r3, #24]
   b6df4:	e5c32024 	strb	r2, [r3, #36]	@ 0x24
   b6df8:	f3410db2 	vmul.f32	d16, d17, d18
   b6dfc:	edc30b00 	vstr	d16, [r3]
   b6e00:	e12fff1e 	bx	lr

000b6e04 <mixerengine::BeatEffectEcho::changeLevelDepthValue()>:
   b6e04:	ed9f7a36 	vldr	s14, [pc, #216]	@ b6ee4 <mixerengine::BeatEffectEcho::changeLevelDepthValue()+0xe0>
   b6e08:	edd07a08 	vldr	s15, [r0, #32]
   b6e0c:	eef47ac7 	vcmpe.f32	s15, s14
   b6e10:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   b6e14:	4a000008 	bmi	b6e3c <mixerengine::BeatEffectEcho::changeLevelDepthValue()+0x38>
   b6e18:	eef66a08 	vmov.f32	s13, #104	@ 0x3f400000  0.750
   b6e1c:	eef47ae6 	vcmpe.f32	s15, s13
   b6e20:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   b6e24:	5a000022 	bpl	b6eb4 <mixerengine::BeatEffectEcho::changeLevelDepthValue()+0xb0>
   b6e28:	ee777ac7 	vsub.f32	s15, s15, s14
   b6e2c:	ed9f6a2d 	vldr	s12, [pc, #180]	@ b6ee8 <mixerengine::BeatEffectEcho::changeLevelDepthValue()+0xe4>
   b6e30:	eef76a00 	vmov.f32	s13, #112	@ 0x3f800000  1.0
   b6e34:	ee277a86 	vmul.f32	s14, s15, s12
   b6e38:	ea000001 	b	b6e44 <mixerengine::BeatEffectEcho::changeLevelDepthValue()+0x40>
   b6e3c:	eef76a00 	vmov.f32	s13, #112	@ 0x3f800000  1.0
   b6e40:	ed9f7a29 	vldr	s14, [pc, #164]	@ b6eec <mixerengine::BeatEffectEcho::changeLevelDepthValue()+0xe8>
   b6e44:	e5902094 	ldr	r2, [r0, #148]	@ 0x94
   b6e48:	edd23b00 	vldr	d19, [r2]
   b6e4c:	edd20b04 	vldr	d16, [r2, #16]
   b6e50:	f2403da3 	vadd.f32	d19, d16, d19
   b6e54:	f3fc1c06 	vdup.32	d17, d6[1]
   b6e58:	e5923020 	ldr	r3, [r2, #32]
   b6e5c:	f3f40c07 	vdup.32	d16, d7[0]
   b6e60:	f2613da3 	vsub.f32	d19, d17, d19
   b6e64:	ee843b90 	vdup.32	d20, r3
   b6e68:	e5903098 	ldr	r3, [r0, #152]	@ 0x98
   b6e6c:	edc21b02 	vstr	d17, [r2, #8]
   b6e70:	e5931020 	ldr	r1, [r3, #32]
   b6e74:	f3431db4 	vmul.f32	d17, d19, d20
   b6e78:	edc21b00 	vstr	d17, [r2]
   b6e7c:	edd31b00 	vldr	d17, [r3]
   b6e80:	edd33b04 	vldr	d19, [r3, #16]
   b6e84:	f2431da1 	vadd.f32	d17, d19, d17
   b6e88:	ee821b90 	vdup.32	d18, r1
   b6e8c:	e3a01000 	mov	r1, #0
   b6e90:	e5821018 	str	r1, [r2, #24]
   b6e94:	e5c21024 	strb	r1, [r2, #36]	@ 0x24
   b6e98:	edc30b02 	vstr	d16, [r3, #8]
   b6e9c:	f2601da1 	vsub.f32	d17, d16, d17
   b6ea0:	e5831018 	str	r1, [r3, #24]
   b6ea4:	e5c31024 	strb	r1, [r3, #36]	@ 0x24
   b6ea8:	f3410db2 	vmul.f32	d16, d17, d18
   b6eac:	edc30b00 	vstr	d16, [r3]
   b6eb0:	e12fff1e 	bx	lr
   b6eb4:	ed9f7a0d 	vldr	s14, [pc, #52]	@ b6ef0 <mixerengine::BeatEffectEcho::changeLevelDepthValue()+0xec>
   b6eb8:	eef47ac7 	vcmpe.f32	s15, s14
   b6ebc:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   b6ec0:	5a000004 	bpl	b6ed8 <mixerengine::BeatEffectEcho::changeLevelDepthValue()+0xd4>
   b6ec4:	ee777a67 	vsub.f32	s15, s14, s15
   b6ec8:	eddf6a09 	vldr	s13, [pc, #36]	@ b6ef4 <mixerengine::BeatEffectEcho::changeLevelDepthValue()+0xf0>
   b6ecc:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   b6ed0:	ee676aa6 	vmul.f32	s13, s15, s13
   b6ed4:	eaffffda 	b	b6e44 <mixerengine::BeatEffectEcho::changeLevelDepthValue()+0x40>
   b6ed8:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   b6edc:	eddf6a02 	vldr	s13, [pc, #8]	@ b6eec <mixerengine::BeatEffectEcho::changeLevelDepthValue()+0xe8>
   b6ee0:	eaffffd7 	b	b6e44 <mixerengine::BeatEffectEcho::changeLevelDepthValue()+0x40>
   b6ee4:	3c200000 	.word	0x3c200000
   b6ee8:	3faceb10 	.word	0x3faceb10
   b6eec:	00000000 	.word	0x00000000
   b6ef0:	3f7d8000 	.word	0x3f7d8000
   b6ef4:	40853408 	.word	0x40853408

000b6ef8 <mixerengine::BeatEffectEcho::~BeatEffectEcho()>:
   b6ef8:	e59f3060 	ldr	r3, [pc, #96]	@ b6f60 <mixerengine::BeatEffectEcho::~BeatEffectEcho()+0x68>
   b6efc:	e92d4010 	push	{r4, lr}
   b6f00:	e1a04000 	mov	r4, r0
   b6f04:	e5843000 	str	r3, [r4]
   b6f08:	e5900070 	ldr	r0, [r0, #112]	@ 0x70
   b6f0c:	ebfd5f6f 	bl	ecd0 <operator delete(void*)@plt>
   b6f10:	e5940088 	ldr	r0, [r4, #136]	@ 0x88
   b6f14:	e3500000 	cmp	r0, #0
   b6f18:	0a000000 	beq	b6f20 <mixerengine::BeatEffectEcho::~BeatEffectEcho()+0x28>
   b6f1c:	ebfd5f6b 	bl	ecd0 <operator delete(void*)@plt>
   b6f20:	e5940090 	ldr	r0, [r4, #144]	@ 0x90
   b6f24:	e3500000 	cmp	r0, #0
   b6f28:	0a000000 	beq	b6f30 <mixerengine::BeatEffectEcho::~BeatEffectEcho()+0x38>
   b6f2c:	ebfd5f67 	bl	ecd0 <operator delete(void*)@plt>
   b6f30:	e5940094 	ldr	r0, [r4, #148]	@ 0x94
   b6f34:	e3500000 	cmp	r0, #0
   b6f38:	0a000000 	beq	b6f40 <mixerengine::BeatEffectEcho::~BeatEffectEcho()+0x48>
   b6f3c:	ebfd5f63 	bl	ecd0 <operator delete(void*)@plt>
   b6f40:	e5940098 	ldr	r0, [r4, #152]	@ 0x98
   b6f44:	e3500000 	cmp	r0, #0
   b6f48:	0a000000 	beq	b6f50 <mixerengine::BeatEffectEcho::~BeatEffectEcho()+0x58>
   b6f4c:	ebfd5f5f 	bl	ecd0 <operator delete(void*)@plt>
   b6f50:	e59f300c 	ldr	r3, [pc, #12]	@ b6f64 <mixerengine::BeatEffectEcho::~BeatEffectEcho()+0x6c>
   b6f54:	e1a00004 	mov	r0, r4
   b6f58:	e5843000 	str	r3, [r4]
   b6f5c:	e8bd8010 	pop	{r4, pc}
   b6f60:	004253f8 	.word	0x004253f8
   b6f64:	0041db60 	.word	0x0041db60

000b6f68 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)>:
   b6f68:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   b6f6c:	e24dd02c 	sub	sp, sp, #44	@ 0x2c
   b6f70:	e5905080 	ldr	r5, [r0, #128]	@ 0x80
   b6f74:	e1a04000 	mov	r4, r0
   b6f78:	e1a07001 	mov	r7, r1
   b6f7c:	e1a08002 	mov	r8, r2
   b6f80:	e3550000 	cmp	r5, #0
   b6f84:	e58d3010 	str	r3, [sp, #16]
   b6f88:	0a00010c 	beq	b73c0 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x458>
   b6f8c:	e594207c 	ldr	r2, [r4, #124]	@ 0x7c
   b6f90:	e1a030c5 	asr	r3, r5, #1
   b6f94:	e1530002 	cmp	r3, r2
   b6f98:	ba00001e 	blt	b7018 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0xb0>
   b6f9c:	e5943074 	ldr	r3, [r4, #116]	@ 0x74
   b6fa0:	e3a02000 	mov	r2, #0
   b6fa4:	e58d2014 	str	r2, [sp, #20]
   b6fa8:	e58d200c 	str	r2, [sp, #12]
   b6fac:	e58d3008 	str	r3, [sp, #8]
   b6fb0:	e5d4308c 	ldrb	r3, [r4, #140]	@ 0x8c
   b6fb4:	e3530000 	cmp	r3, #0
   b6fb8:	0a00002e 	beq	b7078 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x110>
   b6fbc:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
   b6fc0:	eddf0bee 	vldr	d16, [pc, #952]	@ b7380 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x418>
   b6fc4:	e1a03083 	lsl	r3, r3, #1
   b6fc8:	ee073a10 	vmov	s14, r3
   b6fcc:	eef81b47 	vcvt.f64.u32	d17, s14
   b6fd0:	ee610ba0 	vmul.f64	d16, d17, d16
   b6fd4:	eef50bc0 	vcmpe.f64	d16, #0.0
   b6fd8:	ec510b30 	vmov	r0, r1, d16
   b6fdc:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   b6fe0:	aa00011e 	bge	b7460 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x4f8>
   b6fe4:	ebfd5f51 	bl	ed30 <ceil@plt>
   b6fe8:	ec410b17 	vmov	d7, r0, r1
   b6fec:	eefc7bc7 	vcvt.u32.f64	s15, d7
   b6ff0:	ee173a90 	vmov	r3, s15
   b6ff4:	e2833001 	add	r3, r3, #1
   b6ff8:	e59d2008 	ldr	r2, [sp, #8]
   b6ffc:	e1a030a3 	lsr	r3, r3, #1
   b7000:	e1530002 	cmp	r3, r2
   b7004:	058d201c 	streq	r2, [sp, #28]
   b7008:	03a03000 	moveq	r3, #0
   b700c:	05c4308c 	strbeq	r3, [r4, #140]	@ 0x8c
   b7010:	158d301c 	strne	r3, [sp, #28]
   b7014:	ea000019 	b	b7080 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x118>
   b7018:	e5946074 	ldr	r6, [r4, #116]	@ 0x74
   b701c:	e1530006 	cmp	r3, r6
   b7020:	e58d6008 	str	r6, [sp, #8]
   b7024:	ca0000db 	bgt	b7398 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x430>
   b7028:	e3150001 	tst	r5, #1
   b702c:	0a000110 	beq	b7474 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x50c>
   b7030:	e28db020 	add	fp, sp, #32
   b7034:	e5941094 	ldr	r1, [r4, #148]	@ 0x94
   b7038:	edd10b02 	vldr	d16, [r1, #8]
   b703c:	f44b078f 	vst1.32	{d16}, [fp]
   b7040:	eddd7a09 	vldr	s15, [sp, #36]	@ 0x24
   b7044:	ed9d7a08 	vldr	s14, [sp, #32]
   b7048:	ee377a27 	vadd.f32	s14, s14, s15
   b704c:	eef67a00 	vmov.f32	s15, #96	@ 0x3f000000  0.5
   b7050:	ee277a27 	vmul.f32	s14, s14, s15
   b7054:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   b7058:	eeb47ae7 	vcmpe.f32	s14, s15
   b705c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   b7060:	4a000121 	bmi	b74ec <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x584>
   b7064:	e3a02001 	mov	r2, #1
   b7068:	e3a03000 	mov	r3, #0
   b706c:	e58d2014 	str	r2, [sp, #20]
   b7070:	e58d300c 	str	r3, [sp, #12]
   b7074:	eaffffcd 	b	b6fb0 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x48>
   b7078:	e59d3008 	ldr	r3, [sp, #8]
   b707c:	e58d301c 	str	r3, [sp, #28]
   b7080:	e59d6010 	ldr	r6, [sp, #16]
   b7084:	e3560000 	cmp	r6, #0
   b7088:	da0000b0 	ble	b7350 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x3e8>
   b708c:	eddf6bbf 	vldr	d22, [pc, #764]	@ b7390 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x428>
   b7090:	f2468da6 	vadd.f32	d24, d22, d22
   b7094:	e5946078 	ldr	r6, [r4, #120]	@ 0x78
   b7098:	f2c77f10 	vmov.f32	d23, #1	@ 0x3f800000
   b709c:	e594b070 	ldr	fp, [r4, #112]	@ 0x70
   b70a0:	e3a0e000 	mov	lr, #0
   b70a4:	e5d4a03c 	ldrb	sl, [r4, #60]	@ 0x3c
   b70a8:	e5945018 	ldr	r5, [r4, #24]
   b70ac:	f2678da8 	vsub.f32	d24, d23, d24
   b70b0:	e594c090 	ldr	ip, [r4, #144]	@ 0x90
   b70b4:	e1a03006 	mov	r3, r6
   b70b8:	e5942088 	ldr	r2, [r4, #136]	@ 0x88
   b70bc:	e5941094 	ldr	r1, [r4, #148]	@ 0x94
   b70c0:	e5940098 	ldr	r0, [r4, #152]	@ 0x98
   b70c4:	e594901c 	ldr	r9, [r4, #28]
   b70c8:	e58da018 	str	sl, [sp, #24]
   b70cc:	e58db004 	str	fp, [sp, #4]
   b70d0:	ea000018 	b	b7138 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x1d0>
   b70d4:	ed572b02 	vldr	d18, [r7, #-8]
   b70d8:	f3422db4 	vmul.f32	d18, d18, d20
   b70dc:	f3411db3 	vmul.f32	d17, d17, d19
   b70e0:	f3422db0 	vmul.f32	d18, d18, d16
   b70e4:	f2421da1 	vadd.f32	d17, d18, d17
   b70e8:	edc81b00 	vstr	d17, [r8]
   b70ec:	e5d13024 	ldrb	r3, [r1, #36]	@ 0x24
   b70f0:	e3530000 	cmp	r3, #0
   b70f4:	0a00004b 	beq	b7228 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x2c0>
   b70f8:	e5d03024 	ldrb	r3, [r0, #36]	@ 0x24
   b70fc:	e3530000 	cmp	r3, #0
   b7100:	0a000058 	beq	b7268 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x300>
   b7104:	e2863001 	add	r3, r6, #1
   b7108:	e0856186 	add	r6, r5, r6, lsl #3
   b710c:	edc65b00 	vstr	d21, [r6]
   b7110:	e59d6010 	ldr	r6, [sp, #16]
   b7114:	e1530009 	cmp	r3, r9
   b7118:	e28ee001 	add	lr, lr, #1
   b711c:	e5843078 	str	r3, [r4, #120]	@ 0x78
   b7120:	a0693003 	rsbge	r3, r9, r3
   b7124:	a5843078 	strge	r3, [r4, #120]	@ 0x78
   b7128:	e15e0006 	cmp	lr, r6
   b712c:	e2888008 	add	r8, r8, #8
   b7130:	0a000086 	beq	b7350 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x3e8>
   b7134:	e5946078 	ldr	r6, [r4, #120]	@ 0x78
   b7138:	e59db008 	ldr	fp, [sp, #8]
   b713c:	e053a00b 	subs	sl, r3, fp
   b7140:	e59db014 	ldr	fp, [sp, #20]
   b7144:	408aa009 	addmi	sl, sl, r9
   b7148:	e085a18a 	add	sl, r5, sl, lsl #3
   b714c:	edda1b00 	vldr	d17, [sl]
   b7150:	e594a084 	ldr	sl, [r4, #132]	@ 0x84
   b7154:	e053300a 	subs	r3, r3, sl
   b7158:	40833009 	addmi	r3, r3, r9
   b715c:	e35b0000 	cmp	fp, #0
   b7160:	e0853183 	add	r3, r5, r3, lsl #3
   b7164:	edd30b00 	vldr	d16, [r3]
   b7168:	0a00000a 	beq	b7198 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x230>
   b716c:	e59d300c 	ldr	r3, [sp, #12]
   b7170:	e3530000 	cmp	r3, #0
   b7174:	e5943080 	ldr	r3, [r4, #128]	@ 0x80
   b7178:	0a000004 	beq	b7190 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x228>
   b717c:	e59da008 	ldr	sl, [sp, #8]
   b7180:	e15a00c3 	cmp	sl, r3, asr #1
   b7184:	d3a0b000 	movle	fp, #0
   b7188:	d58db00c 	strle	fp, [sp, #12]
   b718c:	ca000077 	bgt	b7370 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x408>
   b7190:	e2833002 	add	r3, r3, #2
   b7194:	e5843080 	str	r3, [r4, #128]	@ 0x80
   b7198:	e5d23024 	ldrb	r3, [r2, #36]	@ 0x24
   b719c:	edd22b04 	vldr	d18, [r2, #16]
   b71a0:	e3530000 	cmp	r3, #0
   b71a4:	0a00004a 	beq	b72d4 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x36c>
   b71a8:	e5d4308c 	ldrb	r3, [r4, #140]	@ 0x8c
   b71ac:	e3530000 	cmp	r3, #0
   b71b0:	0a000002 	beq	b71c0 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x258>
   b71b4:	e59db00c 	ldr	fp, [sp, #12]
   b71b8:	e35b0000 	cmp	fp, #0
   b71bc:	0a000054 	beq	b7314 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x3ac>
   b71c0:	e59d3004 	ldr	r3, [sp, #4]
   b71c4:	eddc0b04 	vldr	d16, [ip, #16]
   b71c8:	edd33b00 	vldr	d19, [r3]
   b71cc:	ecf72b02 	vldmia	r7!, {d18}
   b71d0:	f3415db3 	vmul.f32	d21, d17, d19
   b71d4:	e5dc3024 	ldrb	r3, [ip, #36]	@ 0x24
   b71d8:	f3422db0 	vmul.f32	d18, d18, d16
   b71dc:	e3530000 	cmp	r3, #0
   b71e0:	f2425da5 	vadd.f32	d21, d18, d21
   b71e4:	0a00002d 	beq	b72a0 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x338>
   b71e8:	e59db018 	ldr	fp, [sp, #24]
   b71ec:	edd14b04 	vldr	d20, [r1, #16]
   b71f0:	edd03b04 	vldr	d19, [r0, #16]
   b71f4:	e35b0000 	cmp	fp, #0
   b71f8:	0affffb5 	beq	b70d4 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x16c>
   b71fc:	e5943080 	ldr	r3, [r4, #128]	@ 0x80
   b7200:	e3130001 	tst	r3, #1
   b7204:	1affffb2 	bne	b70d4 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x16c>
   b7208:	ed570b02 	vldr	d16, [r7, #-8]
   b720c:	f3411db3 	vmul.f32	d17, d17, d19
   b7210:	f3404db4 	vmul.f32	d20, d16, d20
   b7214:	f2441da1 	vadd.f32	d17, d20, d17
   b7218:	edc81b00 	vstr	d17, [r8]
   b721c:	e5d13024 	ldrb	r3, [r1, #36]	@ 0x24
   b7220:	e3530000 	cmp	r3, #0
   b7224:	1affffb3 	bne	b70f8 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x190>
   b7228:	e5913018 	ldr	r3, [r1, #24]
   b722c:	edd11b04 	vldr	d17, [r1, #16]
   b7230:	e591a01c 	ldr	sl, [r1, #28]
   b7234:	edd10b00 	vldr	d16, [r1]
   b7238:	f2410da0 	vadd.f32	d16, d17, d16
   b723c:	edc10b04 	vstr	d16, [r1, #16]
   b7240:	e153000a 	cmp	r3, sl
   b7244:	2dd10b02 	vldrcs	d16, [r1, #8]
   b7248:	23a0a001 	movcs	sl, #1
   b724c:	2dc10b04 	vstrcs	d16, [r1, #16]
   b7250:	25c1a024 	strbcs	sl, [r1, #36]	@ 0x24
   b7254:	e2833001 	add	r3, r3, #1
   b7258:	e5813018 	str	r3, [r1, #24]
   b725c:	e5d03024 	ldrb	r3, [r0, #36]	@ 0x24
   b7260:	e3530000 	cmp	r3, #0
   b7264:	1affffa6 	bne	b7104 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x19c>
   b7268:	e5903018 	ldr	r3, [r0, #24]
   b726c:	edd01b04 	vldr	d17, [r0, #16]
   b7270:	e590a01c 	ldr	sl, [r0, #28]
   b7274:	edd00b00 	vldr	d16, [r0]
   b7278:	f2410da0 	vadd.f32	d16, d17, d16
   b727c:	edc00b04 	vstr	d16, [r0, #16]
   b7280:	e153000a 	cmp	r3, sl
   b7284:	2dd00b02 	vldrcs	d16, [r0, #8]
   b7288:	23a0b001 	movcs	fp, #1
   b728c:	2dc00b04 	vstrcs	d16, [r0, #16]
   b7290:	25c0b024 	strbcs	fp, [r0, #36]	@ 0x24
   b7294:	e2833001 	add	r3, r3, #1
   b7298:	e5803018 	str	r3, [r0, #24]
   b729c:	eaffff98 	b	b7104 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x19c>
   b72a0:	e59c3018 	ldr	r3, [ip, #24]
   b72a4:	eddc2b00 	vldr	d18, [ip]
   b72a8:	e59ca01c 	ldr	sl, [ip, #28]
   b72ac:	f2402da2 	vadd.f32	d18, d16, d18
   b72b0:	edcc2b04 	vstr	d18, [ip, #16]
   b72b4:	e153000a 	cmp	r3, sl
   b72b8:	2ddc2b02 	vldrcs	d18, [ip, #8]
   b72bc:	23a0a001 	movcs	sl, #1
   b72c0:	2dcc2b04 	vstrcs	d18, [ip, #16]
   b72c4:	25cca024 	strbcs	sl, [ip, #36]	@ 0x24
   b72c8:	e2833001 	add	r3, r3, #1
   b72cc:	e58c3018 	str	r3, [ip, #24]
   b72d0:	eaffffc4 	b	b71e8 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x280>
   b72d4:	f2611da0 	vsub.f32	d17, d17, d16
   b72d8:	e5923018 	ldr	r3, [r2, #24]
   b72dc:	e592a01c 	ldr	sl, [r2, #28]
   b72e0:	edd23b00 	vldr	d19, [r2]
   b72e4:	f2423da3 	vadd.f32	d19, d18, d19
   b72e8:	edc23b04 	vstr	d19, [r2, #16]
   b72ec:	e153000a 	cmp	r3, sl
   b72f0:	f3411db2 	vmul.f32	d17, d17, d18
   b72f4:	f2401da1 	vadd.f32	d17, d16, d17
   b72f8:	2dd20b02 	vldrcs	d16, [r2, #8]
   b72fc:	23a0a001 	movcs	sl, #1
   b7300:	2dc20b04 	vstrcs	d16, [r2, #16]
   b7304:	25c2a024 	strbcs	sl, [r2, #36]	@ 0x24
   b7308:	e2833001 	add	r3, r3, #1
   b730c:	e5823018 	str	r3, [r2, #24]
   b7310:	eaffffaa 	b	b71c0 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x258>
   b7314:	e5923020 	ldr	r3, [r2, #32]
   b7318:	e59da01c 	ldr	sl, [sp, #28]
   b731c:	e5c4b08c 	strb	fp, [r4, #140]	@ 0x8c
   b7320:	edc26b04 	vstr	d22, [r2, #16]
   b7324:	ee803b90 	vdup.32	d16, r3
   b7328:	e59d3008 	ldr	r3, [sp, #8]
   b732c:	edc27b02 	vstr	d23, [r2, #8]
   b7330:	e582b018 	str	fp, [r2, #24]
   b7334:	e5c2b024 	strb	fp, [r2, #36]	@ 0x24
   b7338:	f3480db0 	vmul.f32	d16, d24, d16
   b733c:	e58da008 	str	sl, [sp, #8]
   b7340:	edc20b00 	vstr	d16, [r2]
   b7344:	e5843084 	str	r3, [r4, #132]	@ 0x84
   b7348:	e584a074 	str	sl, [r4, #116]	@ 0x74
   b734c:	eaffff9b 	b	b71c0 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x258>
   b7350:	e1a00004 	mov	r0, r4
   b7354:	ebff8711 	bl	98fa0 <mixerengine::QuantizedBeatEffect::checkQuantizeSetting()>
   b7358:	e3500000 	cmp	r0, #0
   b735c:	0a000001 	beq	b7368 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x400>
   b7360:	e1a00004 	mov	r0, r4
   b7364:	ebff859c 	bl	989dc <mixerengine::BpmQuantizeEffect::checkTimeUpdate()>
   b7368:	e28dd02c 	add	sp, sp, #44	@ 0x2c
   b736c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
   b7370:	eddf1b06 	vldr	d17, [pc, #24]	@ b7390 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x428>
   b7374:	f26101b1 	vorr	d16, d17, d17
   b7378:	eaffff84 	b	b7190 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x228>
   b737c:	e320f000 	nop	{0}
   b7380:	cccccccd 	.word	0xcccccccd
   b7384:	40460ccc 	.word	0x40460ccc
   b7388:	cccccccd 	.word	0xcccccccd
   b738c:	40460ccc 	.word	0x40460ccc
	...
   b7398:	e59db010 	ldr	fp, [sp, #16]
   b739c:	e1a0a006 	mov	sl, r6
   b73a0:	e086200b 	add	r2, r6, fp
   b73a4:	e1530002 	cmp	r3, r2
   b73a8:	da000044 	ble	b74c0 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x558>
   b73ac:	e3a0b001 	mov	fp, #1
   b73b0:	e3a02000 	mov	r2, #0
   b73b4:	e58db014 	str	fp, [sp, #20]
   b73b8:	e58d200c 	str	r2, [sp, #12]
   b73bc:	eafffefb 	b	b6fb0 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x48>
   b73c0:	ed5f0b0e 	vldr	d16, [pc, #-56]	@ b7390 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x428>
   b73c4:	f2403da0 	vadd.f32	d19, d16, d16
   b73c8:	e5903024 	ldr	r3, [r0, #36]	@ 0x24
   b73cc:	f2c71f10 	vmov.f32	d17, #1	@ 0x3f800000
   b73d0:	e590c090 	ldr	ip, [r0, #144]	@ 0x90
   b73d4:	e1a03083 	lsl	r3, r3, #1
   b73d8:	f2613da3 	vsub.f32	d19, d17, d19
   b73dc:	e59c2020 	ldr	r2, [ip, #32]
   b73e0:	ee073a10 	vmov	s14, r3
   b73e4:	eef82b47 	vcvt.f64.u32	d18, s14
   b73e8:	e5805078 	str	r5, [r0, #120]	@ 0x78
   b73ec:	e3a03001 	mov	r3, #1
   b73f0:	e5c0308c 	strb	r3, [r0, #140]	@ 0x8c
   b73f4:	ee842b90 	vdup.32	d20, r2
   b73f8:	edcc0b04 	vstr	d16, [ip, #16]
   b73fc:	f3430db4 	vmul.f32	d16, d19, d20
   b7400:	edcc0b00 	vstr	d16, [ip]
   b7404:	ed5f0b21 	vldr	d16, [pc, #-132]	@ b7388 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x420>
   b7408:	edcc1b02 	vstr	d17, [ip, #8]
   b740c:	e58c5018 	str	r5, [ip, #24]
   b7410:	e5cc5024 	strb	r5, [ip, #36]	@ 0x24
   b7414:	ee620ba0 	vmul.f64	d16, d18, d16
   b7418:	eef50bc0 	vcmpe.f64	d16, #0.0
   b741c:	ec510b30 	vmov	r0, r1, d16
   b7420:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   b7424:	aa000020 	bge	b74ac <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x544>
   b7428:	ebfd5e40 	bl	ed30 <ceil@plt>
   b742c:	ec410b17 	vmov	d7, r0, r1
   b7430:	eefc7bc7 	vcvt.u32.f64	s15, d7
   b7434:	ee173a90 	vmov	r3, s15
   b7438:	e2833001 	add	r3, r3, #1
   b743c:	e5942088 	ldr	r2, [r4, #136]	@ 0x88
   b7440:	ed5f0b2e 	vldr	d16, [pc, #-184]	@ b7390 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x428>
   b7444:	e1a030a3 	lsr	r3, r3, #1
   b7448:	e5843074 	str	r3, [r4, #116]	@ 0x74
   b744c:	e5843084 	str	r3, [r4, #132]	@ 0x84
   b7450:	edc20b04 	vstr	d16, [r2, #16]
   b7454:	edc20b02 	vstr	d16, [r2, #8]
   b7458:	edc20b00 	vstr	d16, [r2]
   b745c:	eafffeca 	b	b6f8c <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x24>
   b7460:	ebfd6102 	bl	f870 <floor@plt>
   b7464:	ec410b17 	vmov	d7, r0, r1
   b7468:	eefc7bc7 	vcvt.u32.f64	s15, d7
   b746c:	ee173a90 	vmov	r3, s15
   b7470:	eafffedf 	b	b6ff4 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x8c>
   b7474:	e5941094 	ldr	r1, [r4, #148]	@ 0x94
   b7478:	ed5f0b3c 	vldr	d16, [pc, #-240]	@ b7390 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x428>
   b747c:	e5940098 	ldr	r0, [r4, #152]	@ 0x98
   b7480:	e3a0a001 	mov	sl, #1
   b7484:	edc10b00 	vstr	d16, [r1]
   b7488:	f2c71f10 	vmov.f32	d17, #1	@ 0x3f800000
   b748c:	e58da014 	str	sl, [sp, #20]
   b7490:	edc11b04 	vstr	d17, [r1, #16]
   b7494:	edc11b02 	vstr	d17, [r1, #8]
   b7498:	e58da00c 	str	sl, [sp, #12]
   b749c:	edc00b04 	vstr	d16, [r0, #16]
   b74a0:	edc00b02 	vstr	d16, [r0, #8]
   b74a4:	edc00b00 	vstr	d16, [r0]
   b74a8:	eafffec0 	b	b6fb0 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x48>
   b74ac:	ebfd60ef 	bl	f870 <floor@plt>
   b74b0:	ec410b17 	vmov	d7, r0, r1
   b74b4:	eefc7bc7 	vcvt.u32.f64	s15, d7
   b74b8:	ee173a90 	vmov	r3, s15
   b74bc:	eaffffdd 	b	b7438 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x4d0>
   b74c0:	e5943000 	ldr	r3, [r4]
   b74c4:	e3a02001 	mov	r2, #1
   b74c8:	e1a00004 	mov	r0, r4
   b74cc:	e58d2014 	str	r2, [sp, #20]
   b74d0:	e3a06000 	mov	r6, #0
   b74d4:	e58d600c 	str	r6, [sp, #12]
   b74d8:	e5933038 	ldr	r3, [r3, #56]	@ 0x38
   b74dc:	e12fff33 	blx	r3
   b74e0:	e594a074 	ldr	sl, [r4, #116]	@ 0x74
   b74e4:	e58da008 	str	sl, [sp, #8]
   b74e8:	eafffeb0 	b	b6fb0 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x48>
   b74ec:	edd11b00 	vldr	d17, [r1]
   b74f0:	edd10b04 	vldr	d16, [r1, #16]
   b74f4:	f2401da1 	vadd.f32	d17, d16, d17
   b74f8:	e5912020 	ldr	r2, [r1, #32]
   b74fc:	f2c70f10 	vmov.f32	d16, #1	@ 0x3f800000
   b7500:	e3a03000 	mov	r3, #0
   b7504:	edc10b02 	vstr	d16, [r1, #8]
   b7508:	e3a06001 	mov	r6, #1
   b750c:	ee822b90 	vdup.32	d18, r2
   b7510:	e5813018 	str	r3, [r1, #24]
   b7514:	f2601da1 	vsub.f32	d17, d16, d17
   b7518:	e58d6014 	str	r6, [sp, #20]
   b751c:	e5c13024 	strb	r3, [r1, #36]	@ 0x24
   b7520:	e58d300c 	str	r3, [sp, #12]
   b7524:	f3410db2 	vmul.f32	d16, d17, d18
   b7528:	edc10b00 	vstr	d16, [r1]
   b752c:	eafffe9f 	b	b6fb0 <mixerengine::BeatEffectEcho::execute(common::Float2 const*, common::Float2*, int)+0x48>

000b7530 <mixerengine::BeatEffectEcho::~BeatEffectEcho()>:
   b7530:	e59f3068 	ldr	r3, [pc, #104]	@ b75a0 <mixerengine::BeatEffectEcho::~BeatEffectEcho()+0x70>
   b7534:	e92d4010 	push	{r4, lr}
   b7538:	e1a04000 	mov	r4, r0
   b753c:	e5843000 	str	r3, [r4]
   b7540:	e5900070 	ldr	r0, [r0, #112]	@ 0x70
   b7544:	ebfd5de1 	bl	ecd0 <operator delete(void*)@plt>
   b7548:	e5940088 	ldr	r0, [r4, #136]	@ 0x88
   b754c:	e3500000 	cmp	r0, #0
   b7550:	0a000000 	beq	b7558 <mixerengine::BeatEffectEcho::~BeatEffectEcho()+0x28>
   b7554:	ebfd5ddd 	bl	ecd0 <operator delete(void*)@plt>
   b7558:	e5940090 	ldr	r0, [r4, #144]	@ 0x90
   b755c:	e3500000 	cmp	r0, #0
   b7560:	0a000000 	beq	b7568 <mixerengine::BeatEffectEcho::~BeatEffectEcho()+0x38>
   b7564:	ebfd5dd9 	bl	ecd0 <operator delete(void*)@plt>
   b7568:	e5940094 	ldr	r0, [r4, #148]	@ 0x94
   b756c:	e3500000 	cmp	r0, #0
   b7570:	0a000000 	beq	b7578 <mixerengine::BeatEffectEcho::~BeatEffectEcho()+0x48>
   b7574:	ebfd5dd5 	bl	ecd0 <operator delete(void*)@plt>
   b7578:	e5940098 	ldr	r0, [r4, #152]	@ 0x98
   b757c:	e3500000 	cmp	r0, #0
   b7580:	0a000000 	beq	b7588 <mixerengine::BeatEffectEcho::~BeatEffectEcho()+0x58>
   b7584:	ebfd5dd1 	bl	ecd0 <operator delete(void*)@plt>
   b7588:	e59f3014 	ldr	r3, [pc, #20]	@ b75a4 <mixerengine::BeatEffectEcho::~BeatEffectEcho()+0x74>
   b758c:	e1a00004 	mov	r0, r4
   b7590:	e5843000 	str	r3, [r4]
   b7594:	ebfd5dcd 	bl	ecd0 <operator delete(void*)@plt>
   b7598:	e1a00004 	mov	r0, r4
   b759c:	e8bd8010 	pop	{r4, pc}
   b75a0:	004253f8 	.word	0x004253f8
   b75a4:	0041db60 	.word	0x0041db60

000b75a8 <mixerengine::BeatEffectEcho::BeatEffectEcho()>:
   b75a8:	e59f2394 	ldr	r2, [pc, #916]	@ b7944 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x39c>
   b75ac:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   b75b0:	e92d4030 	push	{r4, r5, lr}
   b75b4:	ed2d8b02 	vpush	{d8}
   b75b8:	f2c00010 	vmov.i32	d16, #0	@ 0x00000000
   b75bc:	e5921000 	ldr	r1, [r2]
   b75c0:	ee071a10 	vmov	s14, r1
   b75c4:	e1a04000 	mov	r4, r0
   b75c8:	e2800010 	add	r0, r0, #16
   b75cc:	e3a03000 	mov	r3, #0
   b75d0:	e3a02001 	mov	r2, #1
   b75d4:	f440078f 	vst1.32	{d16}, [r0]
   b75d8:	e24dd014 	sub	sp, sp, #20
   b75dc:	e5841004 	str	r1, [r4, #4]
   b75e0:	e3a00000 	mov	r0, #0
   b75e4:	e5841008 	str	r1, [r4, #8]
   b75e8:	e3a01efa 	mov	r1, #4000	@ 0xfa0
   b75ec:	e5841028 	str	r1, [r4, #40]	@ 0x28
   b75f0:	e3a01032 	mov	r1, #50	@ 0x32
   b75f4:	eeb88a47 	vcvt.f32.u32	s16, s14
   b75f8:	e5841030 	str	r1, [r4, #48]	@ 0x30
   b75fc:	e3a01064 	mov	r1, #100	@ 0x64
   b7600:	e5841034 	str	r1, [r4, #52]	@ 0x34
   b7604:	e3e01063 	mvn	r1, #99	@ 0x63
   b7608:	e5841038 	str	r1, [r4, #56]	@ 0x38
   b760c:	e3a01002 	mov	r1, #2
   b7610:	e5841040 	str	r1, [r4, #64]	@ 0x40
   b7614:	e3a01005 	mov	r1, #5
   b7618:	e5841044 	str	r1, [r4, #68]	@ 0x44
   b761c:	e3a0100b 	mov	r1, #11
   b7620:	e5841048 	str	r1, [r4, #72]	@ 0x48
   b7624:	e59f131c 	ldr	r1, [pc, #796]	@ b7948 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x3a0>
   b7628:	eec77a88 	vdiv.f32	s15, s15, s16
   b762c:	e5840020 	str	r0, [r4, #32]
   b7630:	e5843018 	str	r3, [r4, #24]
   b7634:	e3a00f7d 	mov	r0, #500	@ 0x1f4
   b7638:	e584301c 	str	r3, [r4, #28]
   b763c:	e5840024 	str	r0, [r4, #36]	@ 0x24
   b7640:	e3a00008 	mov	r0, #8
   b7644:	e584202c 	str	r2, [r4, #44]	@ 0x2c
   b7648:	e5c4303c 	strb	r3, [r4, #60]	@ 0x3c
   b764c:	e584304c 	str	r3, [r4, #76]	@ 0x4c
   b7650:	e5c43050 	strb	r3, [r4, #80]	@ 0x50
   b7654:	e5c43051 	strb	r3, [r4, #81]	@ 0x51
   b7658:	e5843054 	str	r3, [r4, #84]	@ 0x54
   b765c:	e5843058 	str	r3, [r4, #88]	@ 0x58
   b7660:	e5c4305c 	strb	r3, [r4, #92]	@ 0x5c
   b7664:	e5c4305d 	strb	r3, [r4, #93]	@ 0x5d
   b7668:	e5c4205e 	strb	r2, [r4, #94]	@ 0x5e
   b766c:	e5c4305f 	strb	r3, [r4, #95]	@ 0x5f
   b7670:	e5c43060 	strb	r3, [r4, #96]	@ 0x60
   b7674:	e5c43061 	strb	r3, [r4, #97]	@ 0x61
   b7678:	e5843064 	str	r3, [r4, #100]	@ 0x64
   b767c:	e5843068 	str	r3, [r4, #104]	@ 0x68
   b7680:	e584306c 	str	r3, [r4, #108]	@ 0x6c
   b7684:	e5841000 	str	r1, [r4]
   b7688:	e5842074 	str	r2, [r4, #116]	@ 0x74
   b768c:	e5843078 	str	r3, [r4, #120]	@ 0x78
   b7690:	e584307c 	str	r3, [r4, #124]	@ 0x7c
   b7694:	e5843080 	str	r3, [r4, #128]	@ 0x80
   b7698:	e5842084 	str	r2, [r4, #132]	@ 0x84
   b769c:	e5c4308c 	strb	r3, [r4, #140]	@ 0x8c
   b76a0:	edc47a03 	vstr	s15, [r4, #12]
   b76a4:	ebfd5b1f 	bl	e328 <operator new(unsigned int)@plt>
   b76a8:	e1a03000 	mov	r3, r0
   b76ac:	eddf0b9d 	vldr	d16, [pc, #628]	@ b7928 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x380>
   b76b0:	e59f1294 	ldr	r1, [pc, #660]	@ b794c <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x3a4>
   b76b4:	edc00b00 	vstr	d16, [r0]
   b76b8:	e1a0000d 	mov	r0, sp
   b76bc:	e5843070 	str	r3, [r4, #112]	@ 0x70
   b76c0:	eb0be6b0 	bl	3b1188 <juce::String::String(char const*)>
   b76c4:	e3a00028 	mov	r0, #40	@ 0x28
   b76c8:	ebfd5b16 	bl	e328 <operator new(unsigned int)@plt>
   b76cc:	eddf7a99 	vldr	s15, [pc, #612]	@ b7938 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x390>
   b76d0:	ee287a27 	vmul.f32	s14, s16, s15
   b76d4:	eddf7a98 	vldr	s15, [pc, #608]	@ b793c <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x394>
   b76d8:	e3a01000 	mov	r1, #0
   b76dc:	e1a03000 	mov	r3, r0
   b76e0:	eddf0b92 	vldr	d16, [pc, #584]	@ b7930 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x388>
   b76e4:	edc00b00 	vstr	d16, [r0]
   b76e8:	edc00b02 	vstr	d16, [r0, #8]
   b76ec:	edc00b04 	vstr	d16, [r0, #16]
   b76f0:	e5801018 	str	r1, [r0, #24]
   b76f4:	eddf0b8d 	vldr	d16, [pc, #564]	@ b7930 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x388>
   b76f8:	e3a02001 	mov	r2, #1
   b76fc:	e5c02024 	strb	r2, [r0, #36]	@ 0x24
   b7700:	eec77a27 	vdiv.f32	s15, s14, s15
   b7704:	eefc7ae7 	vcvt.u32.f32	s15, s15
   b7708:	ee175a90 	vmov	r5, s15
   b770c:	e1550001 	cmp	r5, r1
   b7710:	edc37a07 	vstr	s15, [r3, #28]
   b7714:	0580201c 	streq	r2, [r0, #28]
   b7718:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   b771c:	edc00b04 	vstr	d16, [r0, #16]
   b7720:	edc00b02 	vstr	d16, [r0, #8]
   b7724:	edc00b00 	vstr	d16, [r0]
   b7728:	1ef87a67 	vcvtne.f32.u32	s15, s15
   b772c:	1ec77a27 	vdivne.f32	s15, s14, s15
   b7730:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   b7734:	edc07a08 	vstr	s15, [r0, #32]
   b7738:	e1a0000d 	mov	r0, sp
   b773c:	e5843088 	str	r3, [r4, #136]	@ 0x88
   b7740:	eb0be58a 	bl	3b0d70 <juce::String::~String()>
   b7744:	e28d0004 	add	r0, sp, #4
   b7748:	e59f1200 	ldr	r1, [pc, #512]	@ b7950 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x3a8>
   b774c:	eb0be68d 	bl	3b1188 <juce::String::String(char const*)>
   b7750:	e3a00028 	mov	r0, #40	@ 0x28
   b7754:	ebfd5af3 	bl	e328 <operator new(unsigned int)@plt>
   b7758:	eddf7a78 	vldr	s15, [pc, #480]	@ b7940 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x398>
   b775c:	ee287a27 	vmul.f32	s14, s16, s15
   b7760:	eddf7a75 	vldr	s15, [pc, #468]	@ b793c <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x394>
   b7764:	e3a02000 	mov	r2, #0
   b7768:	e5802018 	str	r2, [r0, #24]
   b776c:	e1a03000 	mov	r3, r0
   b7770:	eddf0b6e 	vldr	d16, [pc, #440]	@ b7930 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x388>
   b7774:	edc00b00 	vstr	d16, [r0]
   b7778:	edc00b02 	vstr	d16, [r0, #8]
   b777c:	edc00b04 	vstr	d16, [r0, #16]
   b7780:	e3a01001 	mov	r1, #1
   b7784:	eddf0b69 	vldr	d16, [pc, #420]	@ b7930 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x388>
   b7788:	e5c01024 	strb	r1, [r0, #36]	@ 0x24
   b778c:	eec77a27 	vdiv.f32	s15, s14, s15
   b7790:	eefc7ae7 	vcvt.u32.f32	s15, s15
   b7794:	ee172a90 	vmov	r2, s15
   b7798:	e3520000 	cmp	r2, #0
   b779c:	edc37a07 	vstr	s15, [r3, #28]
   b77a0:	0580101c 	streq	r1, [r0, #28]
   b77a4:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   b77a8:	edc00b04 	vstr	d16, [r0, #16]
   b77ac:	edc00b02 	vstr	d16, [r0, #8]
   b77b0:	edc00b00 	vstr	d16, [r0]
   b77b4:	1ef87a67 	vcvtne.f32.u32	s15, s15
   b77b8:	1ec77a27 	vdivne.f32	s15, s14, s15
   b77bc:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   b77c0:	edc07a08 	vstr	s15, [r0, #32]
   b77c4:	e28d0004 	add	r0, sp, #4
   b77c8:	e5843090 	str	r3, [r4, #144]	@ 0x90
   b77cc:	eb0be567 	bl	3b0d70 <juce::String::~String()>
   b77d0:	e28d0008 	add	r0, sp, #8
   b77d4:	e59f1178 	ldr	r1, [pc, #376]	@ b7954 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x3ac>
   b77d8:	eb0be66a 	bl	3b1188 <juce::String::String(char const*)>
   b77dc:	e3a00028 	mov	r0, #40	@ 0x28
   b77e0:	ebfd5ad0 	bl	e328 <operator new(unsigned int)@plt>
   b77e4:	e3550000 	cmp	r5, #0
   b77e8:	1e075a10 	vmovne	s14, r5
   b77ec:	eddf0b4f 	vldr	d16, [pc, #316]	@ b7930 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x388>
   b77f0:	e580501c 	str	r5, [r0, #28]
   b77f4:	1ef87a47 	vcvtne.f32.u32	s15, s14
   b77f8:	edc00b00 	vstr	d16, [r0]
   b77fc:	edc00b02 	vstr	d16, [r0, #8]
   b7800:	edc00b04 	vstr	d16, [r0, #16]
   b7804:	e1a03000 	mov	r3, r0
   b7808:	e3a02001 	mov	r2, #1
   b780c:	e3a01000 	mov	r1, #0
   b7810:	e5c02024 	strb	r2, [r0, #36]	@ 0x24
   b7814:	e5801018 	str	r1, [r0, #24]
   b7818:	f2c70f10 	vmov.f32	d16, #1	@ 0x3f800000
   b781c:	0580201c 	streq	r2, [r0, #28]
   b7820:	edc00b04 	vstr	d16, [r0, #16]
   b7824:	edc00b02 	vstr	d16, [r0, #8]
   b7828:	eddf0b40 	vldr	d16, [pc, #256]	@ b7930 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x388>
   b782c:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   b7830:	edc00b00 	vstr	d16, [r0]
   b7834:	1ec77a27 	vdivne.f32	s15, s14, s15
   b7838:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   b783c:	edc07a08 	vstr	s15, [r0, #32]
   b7840:	e28d0008 	add	r0, sp, #8
   b7844:	e5843094 	str	r3, [r4, #148]	@ 0x94
   b7848:	eb0be548 	bl	3b0d70 <juce::String::~String()>
   b784c:	e28d000c 	add	r0, sp, #12
   b7850:	e59f1100 	ldr	r1, [pc, #256]	@ b7958 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x3b0>
   b7854:	eb0be64b 	bl	3b1188 <juce::String::String(char const*)>
   b7858:	e3a00028 	mov	r0, #40	@ 0x28
   b785c:	ebfd5ab1 	bl	e328 <operator new(unsigned int)@plt>
   b7860:	e3550000 	cmp	r5, #0
   b7864:	1e075a10 	vmovne	s14, r5
   b7868:	e580501c 	str	r5, [r0, #28]
   b786c:	e1a03000 	mov	r3, r0
   b7870:	1ef87a47 	vcvtne.f32.u32	s15, s14
   b7874:	eddf0b2d 	vldr	d16, [pc, #180]	@ b7930 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x388>
   b7878:	e3a02001 	mov	r2, #1
   b787c:	edc00b00 	vstr	d16, [r0]
   b7880:	edc00b02 	vstr	d16, [r0, #8]
   b7884:	edc00b04 	vstr	d16, [r0, #16]
   b7888:	e5c02024 	strb	r2, [r0, #36]	@ 0x24
   b788c:	eddf0b27 	vldr	d16, [pc, #156]	@ b7930 <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x388>
   b7890:	0580201c 	streq	r2, [r0, #28]
   b7894:	edc00b04 	vstr	d16, [r0, #16]
   b7898:	edc00b02 	vstr	d16, [r0, #8]
   b789c:	edc00b00 	vstr	d16, [r0]
   b78a0:	e3a01000 	mov	r1, #0
   b78a4:	e5801018 	str	r1, [r0, #24]
   b78a8:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   b78ac:	1ec77a27 	vdivne.f32	s15, s14, s15
   b78b0:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   b78b4:	edc07a08 	vstr	s15, [r0, #32]
   b78b8:	e5843098 	str	r3, [r4, #152]	@ 0x98
   b78bc:	e28d000c 	add	r0, sp, #12
   b78c0:	eb0be52a 	bl	3b0d70 <juce::String::~String()>
   b78c4:	e3a03009 	mov	r3, #9
   b78c8:	e1a00004 	mov	r0, r4
   b78cc:	e5843048 	str	r3, [r4, #72]	@ 0x48
   b78d0:	e3a03000 	mov	r3, #0
   b78d4:	e584304c 	str	r3, [r4, #76]	@ 0x4c
   b78d8:	e3a03001 	mov	r3, #1
   b78dc:	e5c43050 	strb	r3, [r4, #80]	@ 0x50
   b78e0:	e28dd014 	add	sp, sp, #20
   b78e4:	ecbd8b02 	vpop	{d8}
   b78e8:	e8bd8030 	pop	{r4, r5, pc}
   b78ec:	e59f3068 	ldr	r3, [pc, #104]	@ b795c <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x3b4>
   b78f0:	e5843000 	str	r3, [r4]
   b78f4:	ebfd5d70 	bl	eebc <__cxa_end_cleanup@plt>
   b78f8:	e28d000c 	add	r0, sp, #12
   b78fc:	eb0be51b 	bl	3b0d70 <juce::String::~String()>
   b7900:	eafffff9 	b	b78ec <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x344>
   b7904:	e28d0008 	add	r0, sp, #8
   b7908:	eb0be518 	bl	3b0d70 <juce::String::~String()>
   b790c:	eafffff6 	b	b78ec <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x344>
   b7910:	e28d0004 	add	r0, sp, #4
   b7914:	eb0be515 	bl	3b0d70 <juce::String::~String()>
   b7918:	eafffff3 	b	b78ec <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x344>
   b791c:	e1a0000d 	mov	r0, sp
   b7920:	eb0be512 	bl	3b0d70 <juce::String::~String()>
   b7924:	eafffff0 	b	b78ec <mixerengine::BeatEffectEcho::BeatEffectEcho()+0x344>
   b7928:	3f333333 	.word	0x3f333333
   b792c:	3f333333 	.word	0x3f333333
	...
   b7938:	40555555 	.word	0x40555555
   b793c:	447a0000 	.word	0x447a0000
   b7940:	408b3f46 	.word	0x408b3f46
   b7944:	004172c0 	.word	0x004172c0
   b7948:	004253f8 	.word	0x004253f8
   b794c:	0041fee8 	.word	0x0041fee8
   b7950:	0041fef4 	.word	0x0041fef4
   b7954:	0041dd10 	.word	0x0041dd10
   b7958:	0041dd24 	.word	0x0041dd24
   b795c:	0041db60 	.word	0x0041db60

000b7960 <mixerengine::BeatEffectEcho::getDelayData(common::Float2*, long)>:
   b7960:	e5903078 	ldr	r3, [r0, #120]	@ 0x78
   b7964:	e0533002 	subs	r3, r3, r2
   b7968:	4590201c 	ldrmi	r2, [r0, #28]
   b796c:	40833002 	addmi	r3, r3, r2
   b7970:	e5902018 	ldr	r2, [r0, #24]
   b7974:	e0823183 	add	r3, r2, r3, lsl #3
   b7978:	edd30b00 	vldr	d16, [r3]
   b797c:	edc10b00 	vstr	d16, [r1]
   b7980:	e12fff1e 	bx	lr

000b7984 <mixerengine::BeatEffectEcho::saveDelayData(common::Float2 const&)>:
   b7984:	e5902078 	ldr	r2, [r0, #120]	@ 0x78
   b7988:	edd10b00 	vldr	d16, [r1]
   b798c:	e590101c 	ldr	r1, [r0, #28]
   b7990:	e2823001 	add	r3, r2, #1
   b7994:	e590c018 	ldr	ip, [r0, #24]
   b7998:	e1530001 	cmp	r3, r1
   b799c:	e08c2182 	add	r2, ip, r2, lsl #3
   b79a0:	edc20b00 	vstr	d16, [r2]
   b79a4:	e5803078 	str	r3, [r0, #120]	@ 0x78
   b79a8:	a0613003 	rsbge	r3, r1, r3
   b79ac:	a5803078 	strge	r3, [r0, #120]	@ 0x78
   b79b0:	e12fff1e 	bx	lr
