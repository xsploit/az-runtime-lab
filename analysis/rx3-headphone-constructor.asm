
rx3-research/pi-runtime/rbp:	file format elf32-littlearm

Disassembly of section .text:

0005aa28 <_ZN11mixerengine9HeadPhoneC2Ev>:
   5aa28: e92d4030     	push	{r4, r5, lr}
   5aa2c: ed2d8b02     	vpush	{d8}
   5aa30: e1a04000     	mov	r4, r0
   5aa34: e24dd024     	sub	sp, sp, #36
   5aa38: e3a01001     	mov	r1, #1
   5aa3c: ebfffd1f     	bl	0x59ec0 <_ZN11mixerengine20AbstractOutputDeviceC2EN8djengine14EnOutputDeviceE> @ imm = #-0xb84
   5aa40: e3a03000     	mov	r3, #0
   5aa44: e5843010     	str	r3, [r4, #0x10]
   5aa48: e28d000c     	add	r0, sp, #12
   5aa4c: e59f32dc     	ldr	r3, [pc, #0x2dc]        @ 0x5ad30 <_ZN11mixerengine9HeadPhoneC2Ev+0x308>
   5aa50: e59f12dc     	ldr	r1, [pc, #0x2dc]        @ 0x5ad34 <_ZN11mixerengine9HeadPhoneC2Ev+0x30c>
   5aa54: e5843000     	str	r3, [r4]
   5aa58: e3a03000     	mov	r3, #0
   5aa5c: e5843014     	str	r3, [r4, #0x14]
   5aa60: eb0d59c8     	bl	0x3b1188 <_ZN4juce6StringC2EPKc> @ imm = #0x356720
   5aa64: e3a01000     	mov	r1, #0
   5aa68: e5841030     	str	r1, [r4, #0x30]
   5aa6c: e59f12c4     	ldr	r1, [pc, #0x2c4]        @ 0x5ad38 <_ZN11mixerengine9HeadPhoneC2Ev+0x310>
   5aa70: eddf7aaa     	vldr	s15, [pc, #680]         @ 0x5ad20 <_ZN11mixerengine9HeadPhoneC2Ev+0x2f8>
   5aa74: e5942014     	ldr	r2, [r4, #0x14]
   5aa78: eddf0ba6     	vldr	d16, [pc, #664]         @ 0x5ad18 <_ZN11mixerengine9HeadPhoneC2Ev+0x2f0>
   5aa7c: e3a03001     	mov	r3, #1
   5aa80: edc40b06     	vstr	d16, [r4, #24]
   5aa84: e5911000     	ldr	r1, [r1]
   5aa88: ee061a10     	vmov	s12, r1
   5aa8c: eeb88a46     	vcvt.f32.u32	s16, s12
   5aa90: edc40b08     	vstr	d16, [r4, #32]
   5aa94: edc40b0a     	vstr	d16, [r4, #40]
   5aa98: e5c4303c     	strb	r3, [r4, #0x3c]
   5aa9c: ee802b90     	vdup.32	d16, r2
   5aaa0: e28d000c     	add	r0, sp, #12
   5aaa4: edc40b0a     	vstr	d16, [r4, #40]
   5aaa8: edc40b08     	vstr	d16, [r4, #32]
   5aaac: eddf0b99     	vldr	d16, [pc, #612]         @ 0x5ad18 <_ZN11mixerengine9HeadPhoneC2Ev+0x2f0>
   5aab0: edc40b06     	vstr	d16, [r4, #24]
   5aab4: ee287a27     	vmul.f32	s14, s16, s15
   5aab8: eddf7a99     	vldr	s15, [pc, #612]         @ 0x5ad24 <_ZN11mixerengine9HeadPhoneC2Ev+0x2fc>
   5aabc: eec77a27     	vdiv.f32	s15, s14, s15
   5aac0: eefc7ae7     	vcvt.u32.f32	s15, s15
   5aac4: ee175a90     	vmov	r5, s15
   5aac8: e3550000     	cmp	r5, #0
   5aacc: edc47a0d     	vstr	s15, [r4, #52]
   5aad0: 05843034     	streq	r3, [r4, #0x34]
   5aad4: 1eb77a00     	vmovne.f32	s14, #1.000000e+00
   5aad8: 1ef87a67     	vcvtne.f32.u32	s15, s15
   5aadc: 1ec77a27     	vdivne.f32	s15, s14, s15
   5aae0: 0ef77a00     	vmoveq.f32	s15, #1.000000e+00
   5aae4: edc47a0e     	vstr	s15, [r4, #56]
   5aae8: eb0d58a0     	bl	0x3b0d70 <_ZN4juce6StringD2Ev> @ imm = #0x356280
   5aaec: e3a03000     	mov	r3, #0
   5aaf0: e28d0010     	add	r0, sp, #16
   5aaf4: e5843040     	str	r3, [r4, #0x40]
   5aaf8: e59f123c     	ldr	r1, [pc, #0x23c]        @ 0x5ad3c <_ZN11mixerengine9HeadPhoneC2Ev+0x314>
   5aafc: eb0d59a1     	bl	0x3b1188 <_ZN4juce6StringC2EPKc> @ imm = #0x356684
   5ab00: e3550000     	cmp	r5, #0
   5ab04: 1e075a10     	vmovne	s14, r5
   5ab08: e5942040     	ldr	r2, [r4, #0x40]
   5ab0c: eddf0b81     	vldr	d16, [pc, #516]         @ 0x5ad18 <_ZN11mixerengine9HeadPhoneC2Ev+0x2f0>
   5ab10: 1ef87a47     	vcvtne.f32.u32	s15, s14
   5ab14: e3a03001     	mov	r3, #1
   5ab18: edc40b12     	vstr	d16, [r4, #72]
   5ab1c: edc40b14     	vstr	d16, [r4, #80]
   5ab20: edc40b16     	vstr	d16, [r4, #88]
   5ab24: e3a01000     	mov	r1, #0
   5ab28: ee802b90     	vdup.32	d16, r2
   5ab2c: e5841060     	str	r1, [r4, #0x60]
   5ab30: e5845064     	str	r5, [r4, #0x64]
   5ab34: edc40b16     	vstr	d16, [r4, #88]
   5ab38: edc40b14     	vstr	d16, [r4, #80]
   5ab3c: e5c4306c     	strb	r3, [r4, #0x6c]
   5ab40: eddf0b74     	vldr	d16, [pc, #464]         @ 0x5ad18 <_ZN11mixerengine9HeadPhoneC2Ev+0x2f0>
   5ab44: 05843064     	streq	r3, [r4, #0x64]
   5ab48: 1eb77a00     	vmovne.f32	s14, #1.000000e+00
   5ab4c: e28d0010     	add	r0, sp, #16
   5ab50: edc40b12     	vstr	d16, [r4, #72]
   5ab54: 1ec77a27     	vdivne.f32	s15, s14, s15
   5ab58: 0ef77a00     	vmoveq.f32	s15, #1.000000e+00
   5ab5c: edc47a1a     	vstr	s15, [r4, #104]
   5ab60: eb0d5882     	bl	0x3b0d70 <_ZN4juce6StringD2Ev> @ imm = #0x356208
   5ab64: e28d0014     	add	r0, sp, #20
   5ab68: e59f11d0     	ldr	r1, [pc, #0x1d0]        @ 0x5ad40 <_ZN11mixerengine9HeadPhoneC2Ev+0x318>
   5ab6c: eb0d5985     	bl	0x3b1188 <_ZN4juce6StringC2EPKc> @ imm = #0x356614
   5ab70: e3550000     	cmp	r5, #0
   5ab74: 1e065a10     	vmovne	s12, r5
   5ab78: e5942040     	ldr	r2, [r4, #0x40]
   5ab7c: eddf0b65     	vldr	d16, [pc, #404]         @ 0x5ad18 <_ZN11mixerengine9HeadPhoneC2Ev+0x2f0>
   5ab80: 1eb77a00     	vmovne.f32	s14, #1.000000e+00
   5ab84: e3a03001     	mov	r3, #1
   5ab88: edc40b1c     	vstr	d16, [r4, #112]
   5ab8c: edc40b1e     	vstr	d16, [r4, #120]
   5ab90: edc40b20     	vstr	d16, [r4, #128]
   5ab94: e3a01000     	mov	r1, #0
   5ab98: ee802b90     	vdup.32	d16, r2
   5ab9c: e5841088     	str	r1, [r4, #0x88]
   5aba0: e5c43094     	strb	r3, [r4, #0x94]
   5aba4: edc40b20     	vstr	d16, [r4, #128]
   5aba8: e584508c     	str	r5, [r4, #0x8c]
   5abac: edc40b1e     	vstr	d16, [r4, #120]
   5abb0: 0584308c     	streq	r3, [r4, #0x8c]
   5abb4: eddf0b57     	vldr	d16, [pc, #348]         @ 0x5ad18 <_ZN11mixerengine9HeadPhoneC2Ev+0x2f0>
   5abb8: e28d0014     	add	r0, sp, #20
   5abbc: edc40b1c     	vstr	d16, [r4, #112]
   5abc0: 1ef87a46     	vcvtne.f32.u32	s15, s12
   5abc4: 1ec77a27     	vdivne.f32	s15, s14, s15
   5abc8: 0ef77a00     	vmoveq.f32	s15, #1.000000e+00
   5abcc: edc47a24     	vstr	s15, [r4, #144]
   5abd0: eb0d5866     	bl	0x3b0d70 <_ZN4juce6StringD2Ev> @ imm = #0x356198
   5abd4: e3a03000     	mov	r3, #0
   5abd8: e28d0018     	add	r0, sp, #24
   5abdc: e5c43098     	strb	r3, [r4, #0x98]
   5abe0: e59f115c     	ldr	r1, [pc, #0x15c]        @ 0x5ad44 <_ZN11mixerengine9HeadPhoneC2Ev+0x31c>
   5abe4: eb0d5967     	bl	0x3b1188 <_ZN4juce6StringC2EPKc> @ imm = #0x35659c
   5abe8: eef77a00     	vmov.f32	s15, #1.000000e+00
   5abec: e5d43098     	ldrb	r3, [r4, #0x98]
   5abf0: e3a02000     	mov	r2, #0
   5abf4: ed9f7a4b     	vldr	s14, [pc, #300]         @ 0x5ad28 <_ZN11mixerengine9HeadPhoneC2Ev+0x300>
   5abf8: e3530000     	cmp	r3, #0
   5abfc: eddf0b45     	vldr	d16, [pc, #276]         @ 0x5ad18 <_ZN11mixerengine9HeadPhoneC2Ev+0x2f0>
   5ac00: e3a03001     	mov	r3, #1
   5ac04: edc40b28     	vstr	d16, [r4, #160]
   5ac08: edc40b2a     	vstr	d16, [r4, #168]
   5ac0c: edc40b2c     	vstr	d16, [r4, #176]
   5ac10: e5c430c4     	strb	r3, [r4, #0xc4]
   5ac14: e28d0018     	add	r0, sp, #24
   5ac18: e58450bc     	str	r5, [r4, #0xbc]
   5ac1c: e58420b8     	str	r2, [r4, #0xb8]
   5ac20: 1eb07a67     	vmovne.f32	s14, s15
   5ac24: e1550002     	cmp	r5, r2
   5ac28: 1e065a10     	vmovne	s12, r5
   5ac2c: 058430bc     	streq	r3, [r4, #0xbc]
   5ac30: 1ef86a46     	vcvtne.f32.u32	s13, s12
   5ac34: f3f40c07     	vdup.32	d16, d7[0]
   5ac38: edc40b2c     	vstr	d16, [r4, #176]
   5ac3c: edc40b2a     	vstr	d16, [r4, #168]
   5ac40: eddf0b34     	vldr	d16, [pc, #208]         @ 0x5ad18 <_ZN11mixerengine9HeadPhoneC2Ev+0x2f0>
   5ac44: edc40b28     	vstr	d16, [r4, #160]
   5ac48: 1ec77aa6     	vdivne.f32	s15, s15, s13
   5ac4c: edc47a30     	vstr	s15, [r4, #192]
   5ac50: eb0d5846     	bl	0x3b0d70 <_ZN4juce6StringD2Ev> @ imm = #0x356118
   5ac54: e3a03001     	mov	r3, #1
   5ac58: e28d001c     	add	r0, sp, #28
   5ac5c: e58430c8     	str	r3, [r4, #0xc8]
   5ac60: e58430cc     	str	r3, [r4, #0xcc]
   5ac64: e59f10dc     	ldr	r1, [pc, #0xdc]         @ 0x5ad48 <_ZN11mixerengine9HeadPhoneC2Ev+0x320>
   5ac68: eb0d5946     	bl	0x3b1188 <_ZN4juce6StringC2EPKc> @ imm = #0x356518
   5ac6c: eddf7a2e     	vldr	s15, [pc, #184]         @ 0x5ad2c <_ZN11mixerengine9HeadPhoneC2Ev+0x304>
   5ac70: ee287a27     	vmul.f32	s14, s16, s15
   5ac74: eddf7a2a     	vldr	s15, [pc, #168]         @ 0x5ad24 <_ZN11mixerengine9HeadPhoneC2Ev+0x2fc>
   5ac78: e3a03000     	mov	r3, #0
   5ac7c: e58430e8     	str	r3, [r4, #0xe8]
   5ac80: eddf0b24     	vldr	d16, [pc, #144]         @ 0x5ad18 <_ZN11mixerengine9HeadPhoneC2Ev+0x2f0>
   5ac84: e3a02001     	mov	r2, #1
   5ac88: edc40b34     	vstr	d16, [r4, #208]
   5ac8c: edc40b36     	vstr	d16, [r4, #216]
   5ac90: edc40b38     	vstr	d16, [r4, #224]
   5ac94: e5c420f4     	strb	r2, [r4, #0xf4]
   5ac98: f2c70f10     	vmov.f32	d16, #1.000000e+00
   5ac9c: e28d001c     	add	r0, sp, #28
   5aca0: edc40b38     	vstr	d16, [r4, #224]
   5aca4: edc40b36     	vstr	d16, [r4, #216]
   5aca8: eddf0b1a     	vldr	d16, [pc, #104]         @ 0x5ad18 <_ZN11mixerengine9HeadPhoneC2Ev+0x2f0>
   5acac: edc40b34     	vstr	d16, [r4, #208]
   5acb0: eec77a27     	vdiv.f32	s15, s14, s15
   5acb4: eefc7ae7     	vcvt.u32.f32	s15, s15
   5acb8: ee173a90     	vmov	r3, s15
   5acbc: e3530000     	cmp	r3, #0
   5acc0: edc47a3b     	vstr	s15, [r4, #236]
   5acc4: 058420ec     	streq	r2, [r4, #0xec]
   5acc8: 1eb77a00     	vmovne.f32	s14, #1.000000e+00
   5accc: 1ef87a67     	vcvtne.f32.u32	s15, s15
   5acd0: 1ec77a27     	vdivne.f32	s15, s14, s15
   5acd4: 0ef77a00     	vmoveq.f32	s15, #1.000000e+00
   5acd8: edc47a3c     	vstr	s15, [r4, #240]
   5acdc: eb0d5823     	bl	0x3b0d70 <_ZN4juce6StringD2Ev> @ imm = #0x35608c
   5ace0: e3a03000     	mov	r3, #0
   5ace4: e1a00004     	mov	r0, r4
   5ace8: e58430f8     	str	r3, [r4, #0xf8]
   5acec: e28dd024     	add	sp, sp, #36
   5acf0: ecbd8b02     	vpop	{d8}
   5acf4: e8bd8030     	pop	{r4, r5, pc}
   5acf8: e1a00004     	mov	r0, r4
   5acfc: ebfffc53     	bl	0x59e50 <_ZN11mixerengine20AbstractOutputDeviceD2Ev> @ imm = #-0xeb4
   5ad00: ebfed06d     	bl	0xeebc <__cxa_end_cleanup@plt> @ imm = #-0x4be4c
   5ad04: eafffffb     	b	0x5acf8 <_ZN11mixerengine9HeadPhoneC2Ev+0x2d0> @ imm = #-0x14
   5ad08: eafffffa     	b	0x5acf8 <_ZN11mixerengine9HeadPhoneC2Ev+0x2d0> @ imm = #-0x18
   5ad0c: eafffff9     	b	0x5acf8 <_ZN11mixerengine9HeadPhoneC2Ev+0x2d0> @ imm = #-0x1c
   5ad10: eafffff8     	b	0x5acf8 <_ZN11mixerengine9HeadPhoneC2Ev+0x2d0> @ imm = #-0x20
   5ad14: e320f000     	nop
		...
   5ad20: 33 33 53 40  	.word	0x40533333
   5ad24: 00 00 7a 44  	.word	0x447a0000
   5ad28: 00 00 00 00  	.word	0x00000000
   5ad2c: 29 8a 22 41  	.word	0x41228a29
   5ad30: b8 93 41 00  	.word	0x004193b8
   5ad34: 08 a0 41 00  	.word	0x0041a008
   5ad38: c0 72 41 00  	.word	0x004172c0
   5ad3c: 18 a0 41 00  	.word	0x0041a018
   5ad40: 30 a0 41 00  	.word	0x0041a030
   5ad44: 4c a0 41 00  	.word	0x0041a04c
   5ad48: 64 a0 41 00  	.word	0x0041a064
