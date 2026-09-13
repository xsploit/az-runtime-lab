
rx3-research/pi-runtime/rbp:	file format elf32-littlearm

Disassembly of section .text:

0005ad4c <_ZN11mixerengine9HeadPhone8setLevelEf>:
   5ad4c: eef67a00     	vmov.f32	s15, #5.000000e-01
   5ad50: ee071a10     	vmov	s14, r1
   5ad54: eddf6a16     	vldr	s13, [pc, #88]          @ 0x5adb4 <_ZN11mixerengine9HeadPhone8setLevelEf+0x68>
   5ad58: e5902038     	ldr	r2, [r0, #0x38]
   5ad5c: edd01b06     	vldr	d17, [r0, #24]
   5ad60: edd02b0a     	vldr	d18, [r0, #40]
   5ad64: f2421da1     	vadd.f32	d17, d18, d17
   5ad68: e30933b0     	movw	r3, #0x93b0
   5ad6c: ee822b90     	vdup.32	d18, r2
   5ad70: e3a02000     	mov	r2, #0
   5ad74: e5802030     	str	r2, [r0, #0x30]
   5ad78: e3403041     	movt	r3, #0x41
   5ad7c: e5c0203c     	strb	r2, [r0, #0x3c]
   5ad80: e5801014     	str	r1, [r0, #0x14]
   5ad84: ee477a26     	vmla.f32	s15, s14, s13
   5ad88: eefc7ae7     	vcvt.u32.f32	s15, s15
   5ad8c: ee172a90     	vmov	r2, s15
   5ad90: e6ff2072     	uxth	r2, r2
   5ad94: e0833102     	add	r3, r3, r2, lsl #2
   5ad98: e5933020     	ldr	r3, [r3, #0x20]
   5ad9c: ee803b90     	vdup.32	d16, r3
   5ada0: edc00b08     	vstr	d16, [r0, #32]
   5ada4: f2601da1     	vsub.f32	d17, d16, d17
   5ada8: f3410db2     	vmul.f32	d16, d17, d18
   5adac: edc00b06     	vstr	d16, [r0, #24]
   5adb0: e12fff1e     	bx	lr
   5adb4: 00 00 7f 43  	.word	0x437f0000

0005adb8 <_ZN11mixerengine9HeadPhone10setMixRateEf>:
   5adb8: eef67a00     	vmov.f32	s15, #5.000000e-01
   5adbc: ee071a10     	vmov	s14, r1
   5adc0: eddf6a25     	vldr	s13, [pc, #148]         @ 0x5ae5c <_ZN11mixerengine9HeadPhone10setMixRateEf+0xa4>
   5adc4: e5903068     	ldr	r3, [r0, #0x68]
   5adc8: e30923b0     	movw	r2, #0x93b0
   5adcc: e3402041     	movt	r2, #0x41
   5add0: e5901090     	ldr	r1, [r0, #0x90]
   5add4: edd03b12     	vldr	d19, [r0, #72]
   5add8: ee823b90     	vdup.32	d18, r3
   5addc: e3a03000     	mov	r3, #0
   5ade0: e5803060     	str	r3, [r0, #0x60]
   5ade4: edd04b1c     	vldr	d20, [r0, #112]
   5ade8: e5c0306c     	strb	r3, [r0, #0x6c]
   5adec: edd01b16     	vldr	d17, [r0, #88]
   5adf0: e5803088     	str	r3, [r0, #0x88]
   5adf4: edd00b20     	vldr	d16, [r0, #128]
   5adf8: e5c03094     	strb	r3, [r0, #0x94]
   5adfc: f2413da3     	vadd.f32	d19, d17, d19
   5ae00: f2404da4     	vadd.f32	d20, d16, d20
   5ae04: ee811b90     	vdup.32	d17, r1
   5ae08: ee477a26     	vmla.f32	s15, s14, s13
   5ae0c: ed807a10     	vstr	s14, [r0, #64]
   5ae10: eefc7ae7     	vcvt.u32.f32	s15, s15
   5ae14: ee173a90     	vmov	r3, s15
   5ae18: e6ff3073     	uxth	r3, r3
   5ae1c: e0822103     	add	r2, r2, r3, lsl #2
   5ae20: e2823e42     	add	r3, r2, #1056
   5ae24: e2822e82     	add	r2, r2, #2080
   5ae28: e5931000     	ldr	r1, [r3]
   5ae2c: e5923000     	ldr	r3, [r2]
   5ae30: ee851b90     	vdup.32	d21, r1
   5ae34: edc05b14     	vstr	d21, [r0, #80]
   5ae38: ee803b90     	vdup.32	d16, r3
   5ae3c: f2653da3     	vsub.f32	d19, d21, d19
   5ae40: f2604da4     	vsub.f32	d20, d16, d20
   5ae44: edc00b1e     	vstr	d16, [r0, #120]
   5ae48: f3432db2     	vmul.f32	d18, d19, d18
   5ae4c: edc02b12     	vstr	d18, [r0, #72]
   5ae50: f3441db1     	vmul.f32	d17, d20, d17
   5ae54: edc01b1c     	vstr	d17, [r0, #112]
   5ae58: e12fff1e     	bx	lr
   5ae5c: 00 00 7f 43  	.word	0x437f0000

0005ae60 <_ZN11mixerengine9HeadPhone15setMasterOutCueEb>:
   5ae60: e5d03098     	ldrb	r3, [r0, #0x98]
   5ae64: e1530001     	cmp	r3, r1
   5ae68: 012fff1e     	bxeq	lr
   5ae6c: eef77a00     	vmov.f32	s15, #1.000000e+00
   5ae70: e3510000     	cmp	r1, #0
   5ae74: ed9f7a0f     	vldr	s14, [pc, #60]          @ 0x5aeb8 <_ZN11mixerengine9HeadPhone15setMasterOutCueEb+0x58>
   5ae78: edd01b28     	vldr	d17, [r0, #160]
   5ae7c: edd02b2c     	vldr	d18, [r0, #176]
   5ae80: f2421da1     	vadd.f32	d17, d18, d17
   5ae84: e59030c0     	ldr	r3, [r0, #0xc0]
   5ae88: e5c01098     	strb	r1, [r0, #0x98]
   5ae8c: ee823b90     	vdup.32	d18, r3
   5ae90: e3a03000     	mov	r3, #0
   5ae94: e58030b8     	str	r3, [r0, #0xb8]
   5ae98: e5c030c4     	strb	r3, [r0, #0xc4]
   5ae9c: 0ef07a47     	vmoveq.f32	s15, s14
   5aea0: f3fc0c07     	vdup.32	d16, d7[1]
   5aea4: edc00b2a     	vstr	d16, [r0, #168]
   5aea8: f2601da1     	vsub.f32	d17, d16, d17
   5aeac: f3410db2     	vmul.f32	d16, d17, d18
   5aeb0: edc00b28     	vstr	d16, [r0, #160]
   5aeb4: e12fff1e     	bx	lr
   5aeb8: 00 00 00 00  	.word	0x00000000

0005aebc <_ZN11mixerengine9HeadPhone13setStereoTypeEN8djengine21EnHeadphoneStereoTypeE>:
   5aebc: e59030c8     	ldr	r3, [r0, #0xc8]
   5aec0: e1530001     	cmp	r3, r1
   5aec4: 012fff1e     	bxeq	lr
   5aec8: edd01b34     	vldr	d17, [r0, #208]
   5aecc: edd02b38     	vldr	d18, [r0, #224]
   5aed0: f2421da1     	vadd.f32	d17, d18, d17
   5aed4: eddf0b0d     	vldr	d16, [pc, #52]          @ 0x5af10 <_ZN11mixerengine9HeadPhone13setStereoTypeEN8djengine21EnHeadphoneStereoTypeE+0x54>
   5aed8: e59030f0     	ldr	r3, [r0, #0xf0]
   5aedc: edc00b36     	vstr	d16, [r0, #216]
   5aee0: e3a02001     	mov	r2, #1
   5aee4: e58010c8     	str	r1, [r0, #0xc8]
   5aee8: e58020f8     	str	r2, [r0, #0xf8]
   5aeec: f2601da1     	vsub.f32	d17, d16, d17
   5aef0: ee823b90     	vdup.32	d18, r3
   5aef4: e3a03000     	mov	r3, #0
   5aef8: e58030e8     	str	r3, [r0, #0xe8]
   5aefc: e5c030f4     	strb	r3, [r0, #0xf4]
   5af00: f3410db2     	vmul.f32	d16, d17, d18
   5af04: edc00b34     	vstr	d16, [r0, #208]
   5af08: e12fff1e     	bx	lr
   5af0c: e320f000     	nop
		...
