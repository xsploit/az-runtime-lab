
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000cbd38 <mixerengine::SoundColorFxCrush::changeColorValue()>:
   cbd38:	ed907a07 	vldr	s14, [r0, #28]
   cbd3c:	eddf7a09 	vldr	s15, [pc, #36]	@ cbd68 <mixerengine::SoundColorFxCrush::changeColorValue()+0x30>
   cbd40:	ee677a27 	vmul.f32	s15, s14, s15
   cbd44:	eefd7ae7 	vcvt.s32.f32	s15, s15
   cbd48:	ee173a90 	vmov	r3, s15
   cbd4c:	e3530000 	cmp	r3, #0
   cbd50:	b3a03000 	movlt	r3, #0
   cbd54:	ba000001 	blt	cbd60 <mixerengine::SoundColorFxCrush::changeColorValue()+0x28>
   cbd58:	e35300ff 	cmp	r3, #255	@ 0xff
   cbd5c:	a3a030ff 	movge	r3, #255	@ 0xff
   cbd60:	e5803030 	str	r3, [r0, #48]	@ 0x30
   cbd64:	e12fff1e 	bx	lr
   cbd68:	437fe666 	.word	0x437fe666

000cbd6c <mixerengine::SoundColorFxCrush::changeColorParameter()>:
   cbd6c:	ed907a08 	vldr	s14, [r0, #32]
   cbd70:	eddf7a2a 	vldr	s15, [pc, #168]	@ cbe20 <mixerengine::SoundColorFxCrush::changeColorParameter()+0xb4>
   cbd74:	ee677a27 	vmul.f32	s15, s14, s15
   cbd78:	eefd7ae7 	vcvt.s32.f32	s15, s15
   cbd7c:	ee173a90 	vmov	r3, s15
   cbd80:	e3530000 	cmp	r3, #0
   cbd84:	ba000006 	blt	cbda4 <mixerengine::SoundColorFxCrush::changeColorParameter()+0x38>
   cbd88:	e35300ff 	cmp	r3, #255	@ 0xff
   cbd8c:	da000009 	ble	cbdb8 <mixerengine::SoundColorFxCrush::changeColorParameter()+0x4c>
   cbd90:	e3a030ff 	mov	r3, #255	@ 0xff
   cbd94:	eddf7a22 	vldr	s15, [pc, #136]	@ cbe24 <mixerengine::SoundColorFxCrush::changeColorParameter()+0xb8>
   cbd98:	e5803034 	str	r3, [r0, #52]	@ 0x34
   cbd9c:	edc07a0e 	vstr	s15, [r0, #56]	@ 0x38
   cbda0:	e12fff1e 	bx	lr
   cbda4:	eddf7a1f 	vldr	s15, [pc, #124]	@ cbe28 <mixerengine::SoundColorFxCrush::changeColorParameter()+0xbc>
   cbda8:	e3a03000 	mov	r3, #0
   cbdac:	edc07a0e 	vstr	s15, [r0, #56]	@ 0x38
   cbdb0:	e5803034 	str	r3, [r0, #52]	@ 0x34
   cbdb4:	e12fff1e 	bx	lr
   cbdb8:	e353007f 	cmp	r3, #127	@ 0x7f
   cbdbc:	ca000008 	bgt	cbde4 <mixerengine::SoundColorFxCrush::changeColorParameter()+0x78>
   cbdc0:	eef86ae7 	vcvt.f32.s32	s13, s15
   cbdc4:	ed9f7a18 	vldr	s14, [pc, #96]	@ cbe2c <mixerengine::SoundColorFxCrush::changeColorParameter()+0xc0>
   cbdc8:	eddf7a16 	vldr	s15, [pc, #88]	@ cbe28 <mixerengine::SoundColorFxCrush::changeColorParameter()+0xbc>
   cbdcc:	e5803034 	str	r3, [r0, #52]	@ 0x34
   cbdd0:	ee666a87 	vmul.f32	s13, s13, s14
   cbdd4:	ed9f7a15 	vldr	s14, [pc, #84]	@ cbe30 <mixerengine::SoundColorFxCrush::changeColorParameter()+0xc4>
   cbdd8:	ee467a87 	vmla.f32	s15, s13, s14
   cbddc:	edc07a0e 	vstr	s15, [r0, #56]	@ 0x38
   cbde0:	e12fff1e 	bx	lr
   cbde4:	e2432080 	sub	r2, r3, #128	@ 0x80
   cbde8:	ee072a10 	vmov	s14, r2
   cbdec:	eef86ac7 	vcvt.f32.s32	s13, s14
   cbdf0:	ed9f7a0d 	vldr	s14, [pc, #52]	@ cbe2c <mixerengine::SoundColorFxCrush::changeColorParameter()+0xc0>
   cbdf4:	eddf7a0d 	vldr	s15, [pc, #52]	@ cbe30 <mixerengine::SoundColorFxCrush::changeColorParameter()+0xc4>
   cbdf8:	e5803034 	str	r3, [r0, #52]	@ 0x34
   cbdfc:	ee666a87 	vmul.f32	s13, s13, s14
   cbe00:	eeb67a00 	vmov.f32	s14, #96	@ 0x3f000000  0.5
   cbe04:	ee666a87 	vmul.f32	s13, s13, s14
   cbe08:	ed9f7a09 	vldr	s14, [pc, #36]	@ cbe34 <mixerengine::SoundColorFxCrush::changeColorParameter()+0xc8>
   cbe0c:	ee467a87 	vmla.f32	s15, s13, s14
   cbe10:	ed9f7a04 	vldr	s14, [pc, #16]	@ cbe28 <mixerengine::SoundColorFxCrush::changeColorParameter()+0xbc>
   cbe14:	ee777a87 	vadd.f32	s15, s15, s14
   cbe18:	edc07a0e 	vstr	s15, [r0, #56]	@ 0x38
   cbe1c:	e12fff1e 	bx	lr
   cbe20:	437fe666 	.word	0x437fe666
   cbe24:	4203f499 	.word	0x4203f499
   cbe28:	40930000 	.word	0x40930000
   cbe2c:	3c000000 	.word	0x3c000000
   cbe30:	418ba666 	.word	0x418ba666
   cbe34:	41b06666 	.word	0x41b06666

000cbe38 <mixerengine::SoundColorFxCrush::changeCfxStatus_On()>:
   cbe38:	e3a00001 	mov	r0, #1
   cbe3c:	e12fff1e 	bx	lr

000cbe40 <mixerengine::SoundColorFxCrush::changeCfxStatus_Off()>:
   cbe40:	e3a00001 	mov	r0, #1
   cbe44:	e12fff1e 	bx	lr

000cbe48 <mixerengine::SoundColorFxCrush::~SoundColorFxCrush()>:
   cbe48:	e59f3014 	ldr	r3, [pc, #20]	@ cbe64 <mixerengine::SoundColorFxCrush::~SoundColorFxCrush()+0x1c>
   cbe4c:	e92d4010 	push	{r4, lr}
   cbe50:	e1a04000 	mov	r4, r0
   cbe54:	e5803000 	str	r3, [r0]
   cbe58:	ebfd0b9c 	bl	ecd0 <operator delete(void*)@plt>
   cbe5c:	e1a00004 	mov	r0, r4
   cbe60:	e8bd8010 	pop	{r4, pc}
   cbe64:	0041db60 	.word	0x0041db60

000cbe68 <mixerengine::SoundColorFxCrush::SoundColorFxCrush()>:
   cbe68:	e30732c0 	movw	r3, #29376	@ 0x72c0
   cbe6c:	e3403041 	movt	r3, #65	@ 0x41
   cbe70:	e3a0c000 	mov	ip, #0
   cbe74:	f2c01010 	vmov.i32	d17, #0	@ 0x00000000
   cbe78:	e5932000 	ldr	r2, [r3]
   cbe7c:	ee072a10 	vmov	s14, r2
   cbe80:	eef87a47 	vcvt.f32.u32	s15, s14
   cbe84:	edc01b04 	vstr	d17, [r0, #16]
   cbe88:	f2c61f10 	vmov.f32	d17, #0.5	@ 0x3f000000
   cbe8c:	ee80cb90 	vdup.32	d16, ip
   cbe90:	e280c01c 	add	ip, r0, #28
   cbe94:	e3a01001 	mov	r1, #1
   cbe98:	e5802004 	str	r2, [r0, #4]
   cbe9c:	edc00b12 	vstr	d16, [r0, #72]	@ 0x48
   cbea0:	e5802008 	str	r2, [r0, #8]
   cbea4:	e5801018 	str	r1, [r0, #24]
   cbea8:	f44c178f 	vst1.32	{d17}, [ip]
   cbeac:	edc00b1c 	vstr	d16, [r0, #112]	@ 0x70
   cbeb0:	e59fc020 	ldr	ip, [pc, #32]	@ cbed8 <mixerengine::SoundColorFxCrush::SoundColorFxCrush()+0x70>
   cbeb4:	edc00b1e 	vstr	d16, [r0, #120]	@ 0x78
   cbeb8:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   cbebc:	e5c01024 	strb	r1, [r0, #36]	@ 0x24
   cbec0:	edc00b20 	vstr	d16, [r0, #128]	@ 0x80
   cbec4:	edc00b22 	vstr	d16, [r0, #136]	@ 0x88
   cbec8:	e580c000 	str	ip, [r0]
   cbecc:	eec77a27 	vdiv.f32	s15, s14, s15
   cbed0:	edc07a03 	vstr	s15, [r0, #12]
   cbed4:	e12fff1e 	bx	lr
   cbed8:	0042d858 	.word	0x0042d858

000cbedc <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)>:
   cbedc:	e3510000 	cmp	r1, #0
   cbee0:	eddf0b86 	vldr	d16, [pc, #536]	@ cc100 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x224>
   cbee4:	e92d4010 	push	{r4, lr}
   cbee8:	eddf1b86 	vldr	d17, [pc, #536]	@ cc108 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x22c>
   cbeec:	e24dd020 	sub	sp, sp, #32
   cbef0:	edc00b16 	vstr	d16, [r0, #88]	@ 0x58
   cbef4:	e1a04000 	mov	r4, r0
   cbef8:	edc01b14 	vstr	d17, [r0, #80]	@ 0x50
   cbefc:	edc00b18 	vstr	d16, [r0, #96]	@ 0x60
   cbf00:	edc00b1a 	vstr	d16, [r0, #104]	@ 0x68
   cbf04:	ba000033 	blt	cbfd8 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0xfc>
   cbf08:	e35100ff 	cmp	r1, #255	@ 0xff
   cbf0c:	c3a0107b 	movgt	r1, #123	@ 0x7b
   cbf10:	da000069 	ble	cc0bc <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x1e0>
   cbf14:	ee071a90 	vmov	s15, r1
   cbf18:	eef87ae7 	vcvt.f32.s32	s15, s15
   cbf1c:	e3080801 	movw	r0, #34817	@ 0x8801
   cbf20:	e3430f84 	movt	r0, #16260	@ 0x3f84
   cbf24:	ee171a90 	vmov	r1, s15
   cbf28:	ebfd0cee 	bl	f2e8 <powf@plt>
   cbf2c:	ed9f7a77 	vldr	s14, [pc, #476]	@ cc110 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x234>
   cbf30:	ed9f6a77 	vldr	s12, [pc, #476]	@ cc114 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x238>
   cbf34:	eef17a00 	vmov.f32	s15, #16	@ 0x40800000  4.0
   cbf38:	eeb05a00 	vmov.f32	s10, #0	@ 0x40000000  2.0
   cbf3c:	eef75a00 	vmov.f32	s11, #112	@ 0x3f800000  1.0
   cbf40:	ee040a90 	vmov	s9, r0
   cbf44:	ee646a87 	vmul.f32	s13, s9, s14
   cbf48:	ed9f7a72 	vldr	s14, [pc, #456]	@ cc118 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x23c>
   cbf4c:	ee267a87 	vmul.f32	s14, s13, s14
   cbf50:	eddf6a71 	vldr	s13, [pc, #452]	@ cc11c <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x240>
   cbf54:	ee674a07 	vmul.f32	s9, s14, s14
   cbf58:	ee676a26 	vmul.f32	s13, s14, s13
   cbf5c:	ee264a86 	vmul.f32	s8, s13, s12
   cbf60:	eddf6a6e 	vldr	s13, [pc, #440]	@ cc120 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x244>
   cbf64:	ee646aa6 	vmul.f32	s13, s9, s13
   cbf68:	ee276a06 	vmul.f32	s12, s14, s12
   cbf6c:	ee764a84 	vadd.f32	s9, s13, s8
   cbf70:	ee347aa7 	vadd.f32	s14, s9, s15
   cbf74:	ee764a05 	vadd.f32	s9, s12, s10
   cbf78:	ee857a87 	vdiv.f32	s14, s11, s14
   cbf7c:	eec55aa4 	vdiv.f32	s11, s11, s9
   cbf80:	ee364ac4 	vsub.f32	s8, s13, s8
   cbf84:	ee764ae7 	vsub.f32	s9, s13, s15
   cbf88:	ee365a45 	vsub.f32	s10, s12, s10
   cbf8c:	ee676a27 	vmul.f32	s13, s14, s15
   cbf90:	ee266a25 	vmul.f32	s12, s12, s11
   cbf94:	edc46a14 	vstr	s13, [r4, #80]	@ 0x50
   cbf98:	edc46a16 	vstr	s13, [r4, #88]	@ 0x58
   cbf9c:	ee747a27 	vadd.f32	s15, s8, s15
   cbfa0:	ed846a19 	vstr	s12, [r4, #100]	@ 0x64
   cbfa4:	ed846a1a 	vstr	s12, [r4, #104]	@ 0x68
   cbfa8:	ee744aa4 	vadd.f32	s9, s9, s9
   cbfac:	eeb84a00 	vmov.f32	s8, #128	@ 0xc0000000 -2.0
   cbfb0:	ee246a87 	vmul.f32	s12, s9, s14
   cbfb4:	ee666a84 	vmul.f32	s13, s13, s8
   cbfb8:	ed846a17 	vstr	s12, [r4, #92]	@ 0x5c
   cbfbc:	ee277a87 	vmul.f32	s14, s15, s14
   cbfc0:	edc46a15 	vstr	s13, [r4, #84]	@ 0x54
   cbfc4:	ee657a25 	vmul.f32	s15, s10, s11
   cbfc8:	ed847a18 	vstr	s14, [r4, #96]	@ 0x60
   cbfcc:	edc47a1b 	vstr	s15, [r4, #108]	@ 0x6c
   cbfd0:	e28dd020 	add	sp, sp, #32
   cbfd4:	e8bd8010 	pop	{r4, pc}
   cbfd8:	e3a01000 	mov	r1, #0
   cbfdc:	ee041a90 	vmov	s9, r1
   cbfe0:	eef84ae4 	vcvt.f32.s32	s9, s9
   cbfe4:	e30e0ad3 	movw	r0, #60115	@ 0xead3
   cbfe8:	e3430f87 	movt	r0, #16263	@ 0x3f87
   cbfec:	ee141a90 	vmov	r1, s9
   cbff0:	ebfd0cbc 	bl	f2e8 <powf@plt>
   cbff4:	eddf7a4a 	vldr	s15, [pc, #296]	@ cc124 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x248>
   cbff8:	ed9f6a45 	vldr	s12, [pc, #276]	@ cc114 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x238>
   cbffc:	eef15a00 	vmov.f32	s11, #16	@ 0x40800000  4.0
   cc000:	eeb05a00 	vmov.f32	s10, #0	@ 0x40000000  2.0
   cc004:	eef76a00 	vmov.f32	s13, #112	@ 0x3f800000  1.0
   cc008:	ee040a90 	vmov	s9, r0
   cc00c:	ee247aa7 	vmul.f32	s14, s9, s15
   cc010:	eddf7a40 	vldr	s15, [pc, #256]	@ cc118 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x23c>
   cc014:	ee277a27 	vmul.f32	s14, s14, s15
   cc018:	eddf7a3f 	vldr	s15, [pc, #252]	@ cc11c <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x240>
   cc01c:	ee674a07 	vmul.f32	s9, s14, s14
   cc020:	ee677a27 	vmul.f32	s15, s14, s15
   cc024:	ee274a86 	vmul.f32	s8, s15, s12
   cc028:	eddf7a3c 	vldr	s15, [pc, #240]	@ cc120 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x244>
   cc02c:	ee647aa7 	vmul.f32	s15, s9, s15
   cc030:	ee674a06 	vmul.f32	s9, s14, s12
   cc034:	ee346a27 	vadd.f32	s12, s8, s15
   cc038:	ee366a25 	vadd.f32	s12, s12, s11
   cc03c:	ee347a85 	vadd.f32	s14, s9, s10
   cc040:	ee866a86 	vdiv.f32	s12, s13, s12
   cc044:	eec66a87 	vdiv.f32	s13, s13, s14
   cc048:	ee374ac4 	vsub.f32	s8, s15, s8
   cc04c:	ee377ae5 	vsub.f32	s14, s15, s11
   cc050:	ee743ac5 	vsub.f32	s7, s9, s10
   cc054:	ee677a86 	vmul.f32	s15, s15, s12
   cc058:	ee373a07 	vadd.f32	s6, s14, s14
   cc05c:	ee745a25 	vadd.f32	s11, s8, s11
   cc060:	ee367aa6 	vadd.f32	s14, s13, s13
   cc064:	ee666aa3 	vmul.f32	s13, s13, s7
   cc068:	ee774aa7 	vadd.f32	s9, s15, s15
   cc06c:	ee265a03 	vmul.f32	s10, s12, s6
   cc070:	ee665a25 	vmul.f32	s11, s12, s11
   cc074:	eeb16a47 	vneg.f32	s12, s14
   cc078:	edcd7a06 	vstr	s15, [sp, #24]
   cc07c:	edcd4a07 	vstr	s9, [sp, #28]
   cc080:	edcd7a04 	vstr	s15, [sp, #16]
   cc084:	ed8d5a05 	vstr	s10, [sp, #20]
   cc088:	eddd0b06 	vldr	d16, [sp, #24]
   cc08c:	edc40b14 	vstr	d16, [r4, #80]	@ 0x50
   cc090:	eddd0b04 	vldr	d16, [sp, #16]
   cc094:	edcd5a02 	vstr	s11, [sp, #8]
   cc098:	ed8d7a03 	vstr	s14, [sp, #12]
   cc09c:	edc40b16 	vstr	d16, [r4, #88]	@ 0x58
   cc0a0:	eddd0b02 	vldr	d16, [sp, #8]
   cc0a4:	ed8d6a00 	vstr	s12, [sp]
   cc0a8:	edcd6a01 	vstr	s13, [sp, #4]
   cc0ac:	edc40b18 	vstr	d16, [r4, #96]	@ 0x60
   cc0b0:	eddd0b00 	vldr	d16, [sp]
   cc0b4:	edc40b1a 	vstr	d16, [r4, #104]	@ 0x68
   cc0b8:	eaffffc4 	b	cbfd0 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0xf4>
   cc0bc:	e351007b 	cmp	r1, #123	@ 0x7b
   cc0c0:	ca000009 	bgt	cc0ec <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x210>
   cc0c4:	e3510073 	cmp	r1, #115	@ 0x73
   cc0c8:	daffffc3 	ble	cbfdc <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x100>
   cc0cc:	eddf6a15 	vldr	s13, [pc, #84]	@ cc128 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x24c>
   cc0d0:	ed9f6a15 	vldr	s12, [pc, #84]	@ cc12c <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x250>
   cc0d4:	ed9f7a15 	vldr	s14, [pc, #84]	@ cc130 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x254>
   cc0d8:	eddf5a15 	vldr	s11, [pc, #84]	@ cc134 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x258>
   cc0dc:	ed9f5a15 	vldr	s10, [pc, #84]	@ cc138 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x25c>
   cc0e0:	eddf4a15 	vldr	s9, [pc, #84]	@ cc13c <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x260>
   cc0e4:	eddf7a15 	vldr	s15, [pc, #84]	@ cc140 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x264>
   cc0e8:	eaffffe2 	b	cc078 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x19c>
   cc0ec:	e3510083 	cmp	r1, #131	@ 0x83
   cc0f0:	c2411084 	subgt	r1, r1, #132	@ 0x84
   cc0f4:	daffffb5 	ble	cbfd0 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0xf4>
   cc0f8:	eaffff85 	b	cbf14 <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)+0x38>
   cc0fc:	e320f000 	nop	{0}
	...
   cc108:	3f800000 	.word	0x3f800000
   cc10c:	00000000 	.word	0x00000000
   cc110:	42700000 	.word	0x42700000
   cc114:	37be37c6 	.word	0x37be37c6
   cc118:	40c90fdb 	.word	0x40c90fdb
   cc11c:	403504f3 	.word	0x403504f3
   cc120:	300d56d6 	.word	0x300d56d6
   cc124:	42c00000 	.word	0x42c00000
   cc128:	3f3e594d 	.word	0x3f3e594d
   cc12c:	be034d65 	.word	0xbe034d65
   cc130:	3e034d65 	.word	0x3e034d65
   cc134:	3f29638c 	.word	0x3f29638c
   cc138:	3fcbafbc 	.word	0x3fcbafbc
   cc13c:	3fd030c1 	.word	0x3fd030c1
   cc140:	3f5030c1 	.word	0x3f5030c1

000cc144 <mixerengine::SoundColorFxCrush::initialize()>:
   cc144:	e5903000 	ldr	r3, [r0]
   cc148:	e92d4010 	push	{r4, lr}
   cc14c:	e1a04000 	mov	r4, r0
   cc150:	e5933018 	ldr	r3, [r3, #24]
   cc154:	e12fff33 	blx	r3
   cc158:	e5943000 	ldr	r3, [r4]
   cc15c:	e1a00004 	mov	r0, r4
   cc160:	e593301c 	ldr	r3, [r3, #28]
   cc164:	e12fff33 	blx	r3
   cc168:	e5941030 	ldr	r1, [r4, #48]	@ 0x30
   cc16c:	e3a03000 	mov	r3, #0
   cc170:	e3a02001 	mov	r2, #1
   cc174:	e351007b 	cmp	r1, #123	@ 0x7b
   cc178:	e3a00000 	mov	r0, #0
   cc17c:	eddf0b29 	vldr	d16, [pc, #164]	@ cc228 <mixerengine::SoundColorFxCrush::initialize()+0xe4>
   cc180:	e5842040 	str	r2, [r4, #64]	@ 0x40
   cc184:	e584003c 	str	r0, [r4, #60]	@ 0x3c
   cc188:	edc40b12 	vstr	d16, [r4, #72]	@ 0x48
   cc18c:	e584302c 	str	r3, [r4, #44]	@ 0x2c
   cc190:	d5843028 	strle	r3, [r4, #40]	@ 0x28
   cc194:	da000021 	ble	cc220 <mixerengine::SoundColorFxCrush::initialize()+0xdc>
   cc198:	e3510083 	cmp	r1, #131	@ 0x83
   cc19c:	d5842028 	strle	r2, [r4, #40]	@ 0x28
   cc1a0:	da00001e 	ble	cc220 <mixerengine::SoundColorFxCrush::initialize()+0xdc>
   cc1a4:	e35100ff 	cmp	r1, #255	@ 0xff
   cc1a8:	c5840094 	strgt	r0, [r4, #148]	@ 0x94
   cc1ac:	ca00000f 	bgt	cc1f0 <mixerengine::SoundColorFxCrush::initialize()+0xac>
   cc1b0:	e2413084 	sub	r3, r1, #132	@ 0x84
   cc1b4:	ee073a90 	vmov	s15, r3
   cc1b8:	eeb87ae7 	vcvt.f32.s32	s14, s15
   cc1bc:	eddf7a1b 	vldr	s15, [pc, #108]	@ cc230 <mixerengine::SoundColorFxCrush::initialize()+0xec>
   cc1c0:	e5842028 	str	r2, [r4, #40]	@ 0x28
   cc1c4:	e5840094 	str	r0, [r4, #148]	@ 0x94
   cc1c8:	ee677a27 	vmul.f32	s15, s14, s15
   cc1cc:	eeb67a00 	vmov.f32	s14, #96	@ 0x3f000000  0.5
   cc1d0:	ee777aa7 	vadd.f32	s15, s15, s15
   cc1d4:	eef47ac7 	vcmpe.f32	s15, s14
   cc1d8:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cc1dc:	5a000003 	bpl	cc1f0 <mixerengine::SoundColorFxCrush::initialize()+0xac>
   cc1e0:	ee777aa7 	vadd.f32	s15, s15, s15
   cc1e4:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   cc1e8:	ee777a67 	vsub.f32	s15, s14, s15
   cc1ec:	edc47a25 	vstr	s15, [r4, #148]	@ 0x94
   cc1f0:	e1a00004 	mov	r0, r4
   cc1f4:	ebffff38 	bl	cbedc <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)>
   cc1f8:	eddf0b0a 	vldr	d16, [pc, #40]	@ cc228 <mixerengine::SoundColorFxCrush::initialize()+0xe4>
   cc1fc:	e3a03000 	mov	r3, #0
   cc200:	edc40b1c 	vstr	d16, [r4, #112]	@ 0x70
   cc204:	e5843090 	str	r3, [r4, #144]	@ 0x90
   cc208:	edc40b1e 	vstr	d16, [r4, #120]	@ 0x78
   cc20c:	e3a03000 	mov	r3, #0
   cc210:	edc40b20 	vstr	d16, [r4, #128]	@ 0x80
   cc214:	edc40b22 	vstr	d16, [r4, #136]	@ 0x88
   cc218:	e5c43024 	strb	r3, [r4, #36]	@ 0x24
   cc21c:	e8bd8010 	pop	{r4, pc}
   cc220:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   cc224:	eafffff0 	b	cc1ec <mixerengine::SoundColorFxCrush::initialize()+0xa8>
	...
   cc230:	3b853408 	.word	0x3b853408

000cc234 <mixerengine::SoundColorFxCrush::iir_filter21_fb11(common::Float2*, common::Float2*, int)>:
   cc234:	e92d0ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp}
   cc238:	edd03b1c 	vldr	d19, [r0, #112]	@ 0x70
   cc23c:	e2539000 	subs	r9, r3, #0
   cc240:	edd09b1e 	vldr	d25, [r0, #120]	@ 0x78
   cc244:	e1a0b001 	mov	fp, r1
   cc248:	e590a050 	ldr	sl, [r0, #80]	@ 0x50
   cc24c:	e5908054 	ldr	r8, [r0, #84]	@ 0x54
   cc250:	edd07b20 	vldr	d23, [r0, #128]	@ 0x80
   cc254:	e5907058 	ldr	r7, [r0, #88]	@ 0x58
   cc258:	edd01b22 	vldr	d17, [r0, #136]	@ 0x88
   cc25c:	e590605c 	ldr	r6, [r0, #92]	@ 0x5c
   cc260:	ee85ab10 	vdup.32	d5, sl
   cc264:	e5905060 	ldr	r5, [r0, #96]	@ 0x60
   cc268:	ee868b10 	vdup.32	d6, r8
   cc26c:	e5904064 	ldr	r4, [r0, #100]	@ 0x64
   cc270:	ee877b10 	vdup.32	d7, r7
   cc274:	e590c068 	ldr	ip, [r0, #104]	@ 0x68
   cc278:	ee8f6b90 	vdup.32	d31, r6
   cc27c:	e590106c 	ldr	r1, [r0, #108]	@ 0x6c
   cc280:	ee8e5b90 	vdup.32	d30, r5
   cc284:	e5903090 	ldr	r3, [r0, #144]	@ 0x90
   cc288:	ee8d4b90 	vdup.32	d29, r4
   cc28c:	ee8ccb90 	vdup.32	d28, ip
   cc290:	ee8b1b90 	vdup.32	d27, r1
   cc294:	ee8a3b90 	vdup.32	d26, r3
   cc298:	da000015 	ble	cc2f4 <mixerengine::SoundColorFxCrush::iir_filter21_fb11(common::Float2*, common::Float2*, int)+0xc0>
   cc29c:	e3a03000 	mov	r3, #0
   cc2a0:	f34a0db1 	vmul.f32	d16, d26, d17
   cc2a4:	ecfb1b02 	vldmia	fp!, {d17}
   cc2a8:	e2833001 	add	r3, r3, #1
   cc2ac:	e1530009 	cmp	r3, r9
   cc2b0:	f2410da0 	vadd.f32	d16, d17, d16
   cc2b4:	f3451d30 	vmul.f32	d17, d5, d16
   cc2b8:	f3465d30 	vmul.f32	d21, d6, d16
   cc2bc:	f3478d30 	vmul.f32	d24, d7, d16
   cc2c0:	f2410da3 	vadd.f32	d16, d17, d19
   cc2c4:	ece20b02 	vstmia	r2!, {d16}
   cc2c8:	f34d1db0 	vmul.f32	d17, d29, d16
   cc2cc:	f34f2db0 	vmul.f32	d18, d31, d16
   cc2d0:	f34e6db0 	vmul.f32	d22, d30, d16
   cc2d4:	f34c4db0 	vmul.f32	d20, d28, d16
   cc2d8:	f2411da7 	vadd.f32	d17, d17, d23
   cc2dc:	f2650da2 	vsub.f32	d16, d21, d18
   cc2e0:	f34b2db1 	vmul.f32	d18, d27, d17
   cc2e4:	f2403da9 	vadd.f32	d19, d16, d25
   cc2e8:	f2689da6 	vsub.f32	d25, d24, d22
   cc2ec:	f2647da2 	vsub.f32	d23, d20, d18
   cc2f0:	1affffea 	bne	cc2a0 <mixerengine::SoundColorFxCrush::iir_filter21_fb11(common::Float2*, common::Float2*, int)+0x6c>
   cc2f4:	edc03b1c 	vstr	d19, [r0, #112]	@ 0x70
   cc2f8:	edc09b1e 	vstr	d25, [r0, #120]	@ 0x78
   cc2fc:	edc07b20 	vstr	d23, [r0, #128]	@ 0x80
   cc300:	edc01b22 	vstr	d17, [r0, #136]	@ 0x88
   cc304:	e8bd0ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp}
   cc308:	e12fff1e 	bx	lr

000cc30c <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)>:
   cc30c:	e5d0c024 	ldrb	ip, [r0, #36]	@ 0x24
   cc310:	eddf0bee 	vldr	d16, [pc, #952]	@ cc6d0 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3c4>
   cc314:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
   cc318:	ed2d8b06 	vpush	{d8-d10}
   cc31c:	e35c0000 	cmp	ip, #0
   cc320:	e24dd008 	sub	sp, sp, #8
   cc324:	e1a05000 	mov	r5, r0
   cc328:	e1a08001 	mov	r8, r1
   cc32c:	e1a07002 	mov	r7, r2
   cc330:	e1a06003 	mov	r6, r3
   cc334:	edcd0b00 	vstr	d16, [sp]
   cc338:	1a000112 	bne	cc788 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x47c>
   cc33c:	e5953028 	ldr	r3, [r5, #40]	@ 0x28
   cc340:	edd5aa0e 	vldr	s21, [r5, #56]	@ 0x38
   cc344:	e595a030 	ldr	sl, [r5, #48]	@ 0x30
   cc348:	edd58a0f 	vldr	s17, [r5, #60]	@ 0x3c
   cc34c:	e3530000 	cmp	r3, #0
   cc350:	e5954040 	ldr	r4, [r5, #64]	@ 0x40
   cc354:	e5953034 	ldr	r3, [r5, #52]	@ 0x34
   cc358:	ed959b12 	vldr	d9, [r5, #72]	@ 0x48
   cc35c:	ed958a25 	vldr	s16, [r5, #148]	@ 0x94
   cc360:	1a000043 	bne	cc474 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x168>
   cc364:	e35a007c 	cmp	sl, #124	@ 0x7c
   cc368:	dddf7ae0 	vldrle	s15, [pc, #896]	@ cc6f0 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3e4>
   cc36c:	d26aa07c 	rsble	sl, sl, #124	@ 0x7c
   cc370:	de06aa10 	vmovle	s12, sl
   cc374:	deb87ac6 	vcvtle.f32.s32	s14, s12
   cc378:	c3a02001 	movgt	r2, #1
   cc37c:	cddf7ad9 	vldrgt	s15, [pc, #868]	@ cc6e8 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3dc>
   cc380:	d595102c 	ldrle	r1, [r5, #44]	@ 0x2c
   cc384:	c1a01002 	movgt	r1, r2
   cc388:	c585202c 	strgt	r2, [r5, #44]	@ 0x2c
   cc38c:	de677a27 	vmulle.f32	s15, s14, s15
   cc390:	e3530090 	cmp	r3, #144	@ 0x90
   cc394:	ee2a7aa7 	vmul.f32	s14, s21, s15
   cc398:	ca0000ed 	bgt	cc754 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x448>
   cc39c:	e3530007 	cmp	r3, #7
   cc3a0:	de073a90 	vmovle	s15, r3
   cc3a4:	e3e02000 	mvn	r2, #0
   cc3a8:	def86ae7 	vcvtle.f32.s32	s13, s15
   cc3ac:	def47a00 	vmovle.f32	s15, #64	@ 0x3e000000  0.125
   cc3b0:	de667aa7 	vmulle.f32	s15, s13, s15
   cc3b4:	de277a27 	vmulle.f32	s14, s14, s15
   cc3b8:	e3560000 	cmp	r6, #0
   cc3bc:	da000022 	ble	cc44c <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x140>
   cc3c0:	eef76a00 	vmov.f32	s13, #112	@ 0x3f800000  1.0
   cc3c4:	e3a03000 	mov	r3, #0
   cc3c8:	ee812b90 	vdup.32	d17, r2
   cc3cc:	ee064a10 	vmov	s12, r4
   cc3d0:	eef87ac6 	vcvt.f32.s32	s15, s12
   cc3d4:	ecf80b02 	vldmia	r8!, {d16}
   cc3d8:	f24001b1 	vand	d16, d16, d17
   cc3dc:	edcd0b00 	vstr	d16, [sp]
   cc3e0:	eef47ac7 	vcmpe.f32	s15, s14
   cc3e4:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cc3e8:	83a02000 	movhi	r2, #0
   cc3ec:	93a02001 	movls	r2, #1
   cc3f0:	e3540001 	cmp	r4, #1
   cc3f4:	03a02000 	moveq	r2, #0
   cc3f8:	12022001 	andne	r2, r2, #1
   cc3fc:	e3520000 	cmp	r2, #0
   cc400:	12844001 	addne	r4, r4, #1
   cc404:	1a00000c 	bne	cc43c <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x130>
   cc408:	eeb47ae7 	vcmpe.f32	s14, s15
   cc40c:	e2844001 	add	r4, r4, #1
   cc410:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cc414:	5a0000c8 	bpl	cc73c <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x430>
   cc418:	ee376a26 	vadd.f32	s12, s14, s13
   cc41c:	e3a04002 	mov	r4, #2
   cc420:	ee767a67 	vsub.f32	s15, s12, s15
   cc424:	ee788aa7 	vadd.f32	s17, s17, s15
   cc428:	eef48ae6 	vcmpe.f32	s17, s13
   cc42c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cc430:	ae788ae6 	vsubge.f32	s17, s17, s13
   cc434:	a3a04001 	movge	r4, #1
   cc438:	ba0000bf 	blt	cc73c <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x430>
   cc43c:	e2833001 	add	r3, r3, #1
   cc440:	eca79b02 	vstmia	r7!, {d9}
   cc444:	e1530006 	cmp	r3, r6
   cc448:	1affffdf 	bne	cc3cc <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0xc0>
   cc44c:	e3510001 	cmp	r1, #1
   cc450:	0a00008f 	beq	cc694 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x388>
   cc454:	edc5aa0e 	vstr	s21, [r5, #56]	@ 0x38
   cc458:	edc58a0f 	vstr	s17, [r5, #60]	@ 0x3c
   cc45c:	e5854040 	str	r4, [r5, #64]	@ 0x40
   cc460:	ed859b12 	vstr	d9, [r5, #72]	@ 0x48
   cc464:	ed858a25 	vstr	s16, [r5, #148]	@ 0x94
   cc468:	e28dd008 	add	sp, sp, #8
   cc46c:	ecbd8b06 	vpop	{d8-d10}
   cc470:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
   cc474:	e24a207c 	sub	r2, sl, #124	@ 0x7c
   cc478:	e3520006 	cmp	r2, #6
   cc47c:	8a00009c 	bhi	cc6f4 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3e8>
   cc480:	e3e09000 	mvn	r9, #0
   cc484:	e3a0a083 	mov	sl, #131	@ 0x83
   cc488:	eddf7a96 	vldr	s15, [pc, #600]	@ cc6e8 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3dc>
   cc48c:	e3530090 	cmp	r3, #144	@ 0x90
   cc490:	ee2a7aa7 	vmul.f32	s14, s21, s15
   cc494:	da0000a0 	ble	cc71c <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x410>
   cc498:	eddf7a93 	vldr	s15, [pc, #588]	@ cc6ec <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3e0>
   cc49c:	eeb47ae7 	vcmpe.f32	s14, s15
   cc4a0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cc4a4:	d3e01000 	mvnle	r1, #0
   cc4a8:	ca0000ba 	bgt	cc798 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x48c>
   cc4ac:	e3560000 	cmp	r6, #0
   cc4b0:	da00002f 	ble	cc574 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x268>
   cc4b4:	ee811b90 	vdup.32	d17, r1
   cc4b8:	e59f2224 	ldr	r2, [pc, #548]	@ cc6e4 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3d8>
   cc4bc:	eef76a00 	vmov.f32	s13, #112	@ 0x3f800000  1.0
   cc4c0:	e1a01007 	mov	r1, r7
   cc4c4:	e3a03000 	mov	r3, #0
   cc4c8:	ea000007 	b	cc4ec <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x1e0>
   cc4cc:	e2844001 	add	r4, r4, #1
   cc4d0:	ed8d9b00 	vstr	d9, [sp]
   cc4d4:	e0820183 	add	r0, r2, r3, lsl #3
   cc4d8:	e2833001 	add	r3, r3, #1
   cc4dc:	e1530006 	cmp	r3, r6
   cc4e0:	eca19b02 	vstmia	r1!, {d9}
   cc4e4:	ed809b00 	vstr	d9, [r0]
   cc4e8:	0a000021 	beq	cc574 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x268>
   cc4ec:	ee064a10 	vmov	s12, r4
   cc4f0:	eef87ac6 	vcvt.f32.s32	s15, s12
   cc4f4:	ecf80b02 	vldmia	r8!, {d16}
   cc4f8:	f24001b1 	vand	d16, d16, d17
   cc4fc:	edcd0b00 	vstr	d16, [sp]
   cc500:	eef47ac7 	vcmpe.f32	s15, s14
   cc504:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cc508:	83a00000 	movhi	r0, #0
   cc50c:	93a00001 	movls	r0, #1
   cc510:	e3540001 	cmp	r4, #1
   cc514:	03a00000 	moveq	r0, #0
   cc518:	12000001 	andne	r0, r0, #1
   cc51c:	e3500000 	cmp	r0, #0
   cc520:	1affffe9 	bne	cc4cc <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x1c0>
   cc524:	eeb47ae7 	vcmpe.f32	s14, s15
   cc528:	e2844001 	add	r4, r4, #1
   cc52c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cc530:	5a000092 	bpl	cc780 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x474>
   cc534:	ee376a26 	vadd.f32	s12, s14, s13
   cc538:	e3a04002 	mov	r4, #2
   cc53c:	ee767a67 	vsub.f32	s15, s12, s15
   cc540:	ee788aa7 	vadd.f32	s17, s17, s15
   cc544:	eef48ae6 	vcmpe.f32	s17, s13
   cc548:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cc54c:	ba00008b 	blt	cc780 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x474>
   cc550:	e0820183 	add	r0, r2, r3, lsl #3
   cc554:	e2833001 	add	r3, r3, #1
   cc558:	e1530006 	cmp	r3, r6
   cc55c:	eca19b02 	vstmia	r1!, {d9}
   cc560:	ee788ae6 	vsub.f32	s17, s17, s13
   cc564:	e3a04001 	mov	r4, #1
   cc568:	ed8d9b00 	vstr	d9, [sp]
   cc56c:	ed809b00 	vstr	d9, [r0]
   cc570:	1affffdd 	bne	cc4ec <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x1e0>
   cc574:	e1a00005 	mov	r0, r5
   cc578:	e1a0100a 	mov	r1, sl
   cc57c:	ebfffe56 	bl	cbedc <mixerengine::SoundColorFxCrush::make_cfx_crush_coef(int)>
   cc580:	e35a0083 	cmp	sl, #131	@ 0x83
   cc584:	03a03000 	moveq	r3, #0
   cc588:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   cc58c:	05853090 	streq	r3, [r5, #144]	@ 0x90
   cc590:	0a000017 	beq	cc5f4 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x2e8>
   cc594:	ee079a90 	vmov	s15, r9
   cc598:	eeb87ae7 	vcvt.f32.s32	s14, s15
   cc59c:	eddf7a4d 	vldr	s15, [pc, #308]	@ cc6d8 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3cc>
   cc5a0:	ee676a27 	vmul.f32	s13, s14, s15
   cc5a4:	eeb76a00 	vmov.f32	s12, #112	@ 0x3f800000  1.0
   cc5a8:	ee767aa6 	vadd.f32	s15, s13, s13
   cc5ac:	ee767a67 	vsub.f32	s15, s12, s15
   cc5b0:	ee677aa7 	vmul.f32	s15, s15, s15
   cc5b4:	ee677aa7 	vmul.f32	s15, s15, s15
   cc5b8:	eeb67a00 	vmov.f32	s14, #96	@ 0x3f000000  0.5
   cc5bc:	ee677aa7 	vmul.f32	s15, s15, s15
   cc5c0:	ee766a87 	vadd.f32	s13, s13, s14
   cc5c4:	eef05a46 	vmov.f32	s11, s12
   cc5c8:	ee766ac7 	vsub.f32	s13, s13, s14
   cc5cc:	ee475ae7 	vmls.f32	s11, s15, s15
   cc5d0:	eddf7a41 	vldr	s15, [pc, #260]	@ cc6dc <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3d0>
   cc5d4:	ee766aa6 	vadd.f32	s13, s13, s13
   cc5d8:	eef46ac7 	vcmpe.f32	s13, s14
   cc5dc:	ee657aa7 	vmul.f32	s15, s11, s15
   cc5e0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cc5e4:	4e766aa6 	vaddmi.f32	s13, s13, s13
   cc5e8:	edc57a24 	vstr	s15, [r5, #144]	@ 0x90
   cc5ec:	5ddf7a3d 	vldrpl	s15, [pc, #244]	@ cc6e8 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3dc>
   cc5f0:	4e767a66 	vsubmi.f32	s15, s12, s13
   cc5f4:	ee777ac8 	vsub.f32	s15, s15, s16
   cc5f8:	e1a00005 	mov	r0, r5
   cc5fc:	e1a01007 	mov	r1, r7
   cc600:	e1a02007 	mov	r2, r7
   cc604:	e1a03006 	mov	r3, r6
   cc608:	ed9f7a34 	vldr	s14, [pc, #208]	@ cc6e0 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3d4>
   cc60c:	ee27aa87 	vmul.f32	s20, s15, s14
   cc610:	ebffff07 	bl	cc234 <mixerengine::SoundColorFxCrush::iir_filter21_fb11(common::Float2*, common::Float2*, int)>
   cc614:	e3560000 	cmp	r6, #0
   cc618:	da000010 	ble	cc660 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x354>
   cc61c:	e59f20c0 	ldr	r2, [pc, #192]	@ cc6e4 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3d8>
   cc620:	f2c74f10 	vmov.f32	d20, #1	@ 0x3f800000
   cc624:	e3a03000 	mov	r3, #0
   cc628:	ee388a0a 	vadd.f32	s16, s16, s20
   cc62c:	edd73b00 	vldr	d19, [r7]
   cc630:	e0821183 	add	r1, r2, r3, lsl #3
   cc634:	edd12b00 	vldr	d18, [r1]
   cc638:	e2833001 	add	r3, r3, #1
   cc63c:	e1530006 	cmp	r3, r6
   cc640:	ee687a08 	vmul.f32	s15, s16, s16
   cc644:	f3fc0c07 	vdup.32	d16, d7[1]
   cc648:	f2641da0 	vsub.f32	d17, d20, d16
   cc64c:	f3420db0 	vmul.f32	d16, d18, d16
   cc650:	f3431db1 	vmul.f32	d17, d19, d17
   cc654:	f2410da0 	vadd.f32	d16, d17, d16
   cc658:	ece70b02 	vstmia	r7!, {d16}
   cc65c:	1afffff1 	bne	cc628 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x31c>
   cc660:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   cc664:	eddf6a1f 	vldr	s13, [pc, #124]	@ cc6e8 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3dc>
   cc668:	e595102c 	ldr	r1, [r5, #44]	@ 0x2c
   cc66c:	eeb0aaca 	vabs.f32	s20, s20
   cc670:	ee377aca 	vsub.f32	s14, s15, s20
   cc674:	eeb4aa48 	vcmp.f32	s20, s16
   cc678:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cc67c:	ceb08a66 	vmovgt.f32	s16, s13
   cc680:	eeb47ac8 	vcmpe.f32	s14, s16
   cc684:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cc688:	4eb08a67 	vmovmi.f32	s16, s15
   cc68c:	e3510001 	cmp	r1, #1
   cc690:	1affff6f 	bne	cc454 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x148>
   cc694:	e5953028 	ldr	r3, [r5, #40]	@ 0x28
   cc698:	ed9f9b0c 	vldr	d9, [pc, #48]	@ cc6d0 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3c4>
   cc69c:	e1a04001 	mov	r4, r1
   cc6a0:	ed859b1c 	vstr	d9, [r5, #112]	@ 0x70
   cc6a4:	e2733001 	rsbs	r3, r3, #1
   cc6a8:	ed859b1e 	vstr	d9, [r5, #120]	@ 0x78
   cc6ac:	ed859b20 	vstr	d9, [r5, #128]	@ 0x80
   cc6b0:	ed859b22 	vstr	d9, [r5, #136]	@ 0x88
   cc6b4:	33a03000 	movcc	r3, #0
   cc6b8:	eddf8a0a 	vldr	s17, [pc, #40]	@ cc6e8 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3dc>
   cc6bc:	e5853028 	str	r3, [r5, #40]	@ 0x28
   cc6c0:	e3a03000 	mov	r3, #0
   cc6c4:	e585302c 	str	r3, [r5, #44]	@ 0x2c
   cc6c8:	eaffff61 	b	cc454 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x148>
   cc6cc:	e320f000 	nop	{0}
	...
   cc6d8:	3b853408 	.word	0x3b853408
   cc6dc:	3fa660cc 	.word	0x3fa660cc
   cc6e0:	3c800000 	.word	0x3c800000
   cc6e4:	0114bf78 	.word	0x0114bf78
   cc6e8:	00000000 	.word	0x00000000
   cc6ec:	40930000 	.word	0x40930000
   cc6f0:	3c042108 	.word	0x3c042108
   cc6f4:	e35a007b 	cmp	sl, #123	@ 0x7b
   cc6f8:	ca00002c 	bgt	cc7b0 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x4a4>
   cc6fc:	e3530090 	cmp	r3, #144	@ 0x90
   cc700:	e3a02001 	mov	r2, #1
   cc704:	ed5f7a09 	vldr	s15, [pc, #-36]	@ cc6e8 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3dc>
   cc708:	e3e09000 	mvn	r9, #0
   cc70c:	e585202c 	str	r2, [r5, #44]	@ 0x2c
   cc710:	e3a0a083 	mov	sl, #131	@ 0x83
   cc714:	ee2a7aa7 	vmul.f32	s14, s21, s15
   cc718:	caffff5e 	bgt	cc498 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x18c>
   cc71c:	e3530007 	cmp	r3, #7
   cc720:	de063a10 	vmovle	s12, r3
   cc724:	e3e01000 	mvn	r1, #0
   cc728:	def47a00 	vmovle.f32	s15, #64	@ 0x3e000000  0.125
   cc72c:	def86ac6 	vcvtle.f32.s32	s13, s12
   cc730:	de667aa7 	vmulle.f32	s15, s13, s15
   cc734:	de277a27 	vmulle.f32	s14, s14, s15
   cc738:	eaffff5b 	b	cc4ac <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x1a0>
   cc73c:	e2833001 	add	r3, r3, #1
   cc740:	ed9d9b00 	vldr	d9, [sp]
   cc744:	e1530006 	cmp	r3, r6
   cc748:	eca79b02 	vstmia	r7!, {d9}
   cc74c:	1affff1e 	bne	cc3cc <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0xc0>
   cc750:	eaffff3d 	b	cc44c <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x140>
   cc754:	ed5f7a1c 	vldr	s15, [pc, #-112]	@ cc6ec <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3e0>
   cc758:	eeb47ae7 	vcmpe.f32	s14, s15
   cc75c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   cc760:	d3e02000 	mvnle	r2, #0
   cc764:	daffff13 	ble	cc3b8 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0xac>
   cc768:	e2433080 	sub	r3, r3, #128	@ 0x80
   cc76c:	e3e02000 	mvn	r2, #0
   cc770:	e7f83253 	ubfx	r3, r3, #4, #25
   cc774:	e2833010 	add	r3, r3, #16
   cc778:	e1a02312 	lsl	r2, r2, r3
   cc77c:	eaffff0d 	b	cc3b8 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0xac>
   cc780:	ed9d9b00 	vldr	d9, [sp]
   cc784:	eaffff52 	b	cc4d4 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x1c8>
   cc788:	e5903000 	ldr	r3, [r0]
   cc78c:	e5933010 	ldr	r3, [r3, #16]
   cc790:	e12fff33 	blx	r3
   cc794:	eafffee8 	b	cc33c <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x30>
   cc798:	e2433080 	sub	r3, r3, #128	@ 0x80
   cc79c:	e3e01000 	mvn	r1, #0
   cc7a0:	e7f83253 	ubfx	r3, r3, #4, #25
   cc7a4:	e2833010 	add	r3, r3, #16
   cc7a8:	e1a01311 	lsl	r1, r1, r3
   cc7ac:	eaffff3e 	b	cc4ac <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x1a0>
   cc7b0:	e24a2083 	sub	r2, sl, #131	@ 0x83
   cc7b4:	ee072a90 	vmov	s15, r2
   cc7b8:	eeb87ae7 	vcvt.f32.s32	s14, s15
   cc7bc:	e24a9084 	sub	r9, sl, #132	@ 0x84
   cc7c0:	ed5f7a36 	vldr	s15, [pc, #-216]	@ cc6f0 <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x3e4>
   cc7c4:	ee677a27 	vmul.f32	s15, s14, s15
   cc7c8:	eaffff2f 	b	cc48c <mixerengine::SoundColorFxCrush::execute(common::Float2 const*, common::Float2*, int)+0x180>
   cc7cc:	e320f000 	nop	{0}
