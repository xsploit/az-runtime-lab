
rx3-research/pi-runtime/rbp:	file format elf32-littlearm

Disassembly of section .text:

0005a580 <_ZN11mixerengine9HeadPhone6updateEi>:
   5a580: e5903010     	ldr	r3, [r0, #0x10]
   5a584: e92d41f0     	push	{r4, r5, r6, r7, r8, lr}
   5a588: e3530000     	cmp	r3, #0
   5a58c: e24dd010     	sub	sp, sp, #16
   5a590: e1a04000     	mov	r4, r0
   5a594: e1a05001     	mov	r5, r1
   5a598: 0a000009     	beq	0x5a5c4 <_ZN11mixerengine9HeadPhone6updateEi+0x44> @ imm = #0x24
   5a59c: e5902004     	ldr	r2, [r0, #0x4]
   5a5a0: e3520000     	cmp	r2, #0
   5a5a4: 0a000006     	beq	0x5a5c4 <_ZN11mixerengine9HeadPhone6updateEi+0x44> @ imm = #0x18
   5a5a8: e5937020     	ldr	r7, [r3, #0x20]
   5a5ac: e5926020     	ldr	r6, [r2, #0x20]
   5a5b0: e3570000     	cmp	r7, #0
   5a5b4: 13560000     	cmpne	r6, #0
   5a5b8: 13a08000     	movne	r8, #0
   5a5bc: 03a08001     	moveq	r8, #1
   5a5c0: 1a000001     	bne	0x5a5cc <_ZN11mixerengine9HeadPhone6updateEi+0x4c> @ imm = #0x4
   5a5c4: e28dd010     	add	sp, sp, #16
   5a5c8: e8bd81f0     	pop	{r4, r5, r6, r7, r8, pc}
   5a5cc: e590000c     	ldr	r0, [r0, #0xc]
   5a5d0: eb00ac3c     	bl	0x856c8 <_ZN8djengine15DeviceRouteMngr26getOutputDeviceDataPointerEi> @ imm = #0x2b0f0
   5a5d4: e3500000     	cmp	r0, #0
   5a5d8: 0afffff9     	beq	0x5a5c4 <_ZN11mixerengine9HeadPhone6updateEi+0x44> @ imm = #-0x1c
   5a5dc: e59430cc     	ldr	r3, [r4, #0xcc]
   5a5e0: e3530000     	cmp	r3, #0
   5a5e4: 1a000088     	bne	0x5a80c <_ZN11mixerengine9HeadPhone6updateEi+0x28c> @ imm = #0x220
   5a5e8: e3550000     	cmp	r5, #0
   5a5ec: eddf6b8b     	vldr	d22, [pc, #556]         @ 0x5a820 <_ZN11mixerengine9HeadPhone6updateEi+0x2a0>
   5a5f0: da00007b     	ble	0x5a7e4 <_ZN11mixerengine9HeadPhone6updateEi+0x264> @ imm = #0x1ec
   5a5f4: e59f122c     	ldr	r1, [pc, #0x22c]        @ 0x5a828 <_ZN11mixerengine9HeadPhone6updateEi+0x2a8>
   5a5f8: e3a0c001     	mov	r12, #1
   5a5fc: ea00000e     	b	0x5a63c <_ZN11mixerengine9HeadPhone6updateEi+0xbc> @ imm = #0x38
   5a600: e5d4206c     	ldrb	r2, [r4, #0x6c]
   5a604: e3520000     	cmp	r2, #0
   5a608: 0a000039     	beq	0x5a6f4 <_ZN11mixerengine9HeadPhone6updateEi+0x174> @ imm = #0xe4
   5a60c: e5d420c4     	ldrb	r2, [r4, #0xc4]
   5a610: e3520000     	cmp	r2, #0
   5a614: 0a000045     	beq	0x5a730 <_ZN11mixerengine9HeadPhone6updateEi+0x1b0> @ imm = #0x114
   5a618: e5d4203c     	ldrb	r2, [r4, #0x3c]
   5a61c: e3520000     	cmp	r2, #0
   5a620: 0a000051     	beq	0x5a76c <_ZN11mixerengine9HeadPhone6updateEi+0x1ec> @ imm = #0x144
   5a624: e5d420f4     	ldrb	r2, [r4, #0xf4]
   5a628: e3520000     	cmp	r2, #0
   5a62c: 0a00005d     	beq	0x5a7a8 <_ZN11mixerengine9HeadPhone6updateEi+0x228> @ imm = #0x174
   5a630: e2833001     	add	r3, r3, #1
   5a634: e1530005     	cmp	r3, r5
   5a638: 0a000069     	beq	0x5a7e4 <_ZN11mixerengine9HeadPhone6updateEi+0x264> @ imm = #0x1a4
   5a63c: ecf60b02     	vldmia	r6!, {d16}
   5a640: edd42b16     	vldr	d18, [r4, #88]
   5a644: f3402db2     	vmul.f32	d18, d16, d18
   5a648: edd43b20     	vldr	d19, [r4, #128]
   5a64c: ecf70b02     	vldmia	r7!, {d16}
   5a650: f3403db3     	vmul.f32	d19, d16, d19
   5a654: edd44b2c     	vldr	d20, [r4, #176]
   5a658: e28d2008     	add	r2, sp, #8
   5a65c: edd40b0a     	vldr	d16, [r4, #40]
   5a660: edd41b38     	vldr	d17, [r4, #224]
   5a664: f3422db4     	vmul.f32	d18, d18, d20
   5a668: edd15b00     	vldr	d21, [r1]
   5a66c: f442378f     	vst1.32	{d19}, [r2]
   5a670: eddd7a03     	vldr	s15, [sp, #12]
   5a674: ed9d7a02     	vldr	s14, [sp, #8]
   5a678: ee377a27     	vadd.f32	s14, s14, s15
   5a67c: f442278f     	vst1.32	{d18}, [r2]
   5a680: eddd7a03     	vldr	s15, [sp, #12]
   5a684: eddd6a02     	vldr	s13, [sp, #8]
   5a688: ee767aa7     	vadd.f32	s15, s13, s15
   5a68c: ed8d7a00     	vstr	s14, [sp]
   5a690: edcd7a01     	vstr	s15, [sp, #4]
   5a694: f46d278f     	vld1.32	{d18}, [sp]
   5a698: f3425db5     	vmul.f32	d21, d18, d21
   5a69c: f3455db6     	vmul.f32	d21, d21, d22
   5a6a0: f3450db0     	vmul.f32	d16, d21, d16
   5a6a4: f3401db1     	vmul.f32	d17, d16, d17
   5a6a8: ece01b02     	vstmia	r0!, {d17}
   5a6ac: e5d42094     	ldrb	r2, [r4, #0x94]
   5a6b0: e3520000     	cmp	r2, #0
   5a6b4: 1affffd1     	bne	0x5a600 <_ZN11mixerengine9HeadPhone6updateEi+0x80> @ imm = #-0xbc
   5a6b8: e5942088     	ldr	r2, [r4, #0x88]
   5a6bc: edd41b20     	vldr	d17, [r4, #128]
   5a6c0: e594808c     	ldr	r8, [r4, #0x8c]
   5a6c4: edd40b1c     	vldr	d16, [r4, #112]
   5a6c8: f2410da0     	vadd.f32	d16, d17, d16
   5a6cc: edc40b20     	vstr	d16, [r4, #128]
   5a6d0: e1520008     	cmp	r2, r8
   5a6d4: 2dd40b1e     	vldrhs	d16, [r4, #120]
   5a6d8: 25c4c094     	strbhs	r12, [r4, #0x94]
   5a6dc: 2dc40b20     	vstrhs	d16, [r4, #128]
   5a6e0: e2822001     	add	r2, r2, #1
   5a6e4: e5842088     	str	r2, [r4, #0x88]
   5a6e8: e5d4206c     	ldrb	r2, [r4, #0x6c]
   5a6ec: e3520000     	cmp	r2, #0
   5a6f0: 1affffc5     	bne	0x5a60c <_ZN11mixerengine9HeadPhone6updateEi+0x8c> @ imm = #-0xec
   5a6f4: e5942060     	ldr	r2, [r4, #0x60]
   5a6f8: edd41b16     	vldr	d17, [r4, #88]
   5a6fc: e5948064     	ldr	r8, [r4, #0x64]
   5a700: edd40b12     	vldr	d16, [r4, #72]
   5a704: f2410da0     	vadd.f32	d16, d17, d16
   5a708: edc40b16     	vstr	d16, [r4, #88]
   5a70c: e1520008     	cmp	r2, r8
   5a710: 2dd40b14     	vldrhs	d16, [r4, #80]
   5a714: 25c4c06c     	strbhs	r12, [r4, #0x6c]
   5a718: 2dc40b16     	vstrhs	d16, [r4, #88]
   5a71c: e2822001     	add	r2, r2, #1
   5a720: e5842060     	str	r2, [r4, #0x60]
   5a724: e5d420c4     	ldrb	r2, [r4, #0xc4]
   5a728: e3520000     	cmp	r2, #0
   5a72c: 1affffb9     	bne	0x5a618 <_ZN11mixerengine9HeadPhone6updateEi+0x98> @ imm = #-0x11c
   5a730: e59420b8     	ldr	r2, [r4, #0xb8]
   5a734: edd41b2c     	vldr	d17, [r4, #176]
   5a738: e59480bc     	ldr	r8, [r4, #0xbc]
   5a73c: edd40b28     	vldr	d16, [r4, #160]
   5a740: f2410da0     	vadd.f32	d16, d17, d16
   5a744: edc40b2c     	vstr	d16, [r4, #176]
   5a748: e1520008     	cmp	r2, r8
   5a74c: 2dd40b2a     	vldrhs	d16, [r4, #168]
   5a750: 25c4c0c4     	strbhs	r12, [r4, #0xc4]
   5a754: 2dc40b2c     	vstrhs	d16, [r4, #176]
   5a758: e2822001     	add	r2, r2, #1
   5a75c: e58420b8     	str	r2, [r4, #0xb8]
   5a760: e5d4203c     	ldrb	r2, [r4, #0x3c]
   5a764: e3520000     	cmp	r2, #0
   5a768: 1affffad     	bne	0x5a624 <_ZN11mixerengine9HeadPhone6updateEi+0xa4> @ imm = #-0x14c
   5a76c: e5942030     	ldr	r2, [r4, #0x30]
   5a770: edd41b0a     	vldr	d17, [r4, #40]
   5a774: e5948034     	ldr	r8, [r4, #0x34]
   5a778: edd40b06     	vldr	d16, [r4, #24]
   5a77c: f2410da0     	vadd.f32	d16, d17, d16
   5a780: edc40b0a     	vstr	d16, [r4, #40]
   5a784: e1520008     	cmp	r2, r8
   5a788: 2dd40b08     	vldrhs	d16, [r4, #32]
   5a78c: 25c4c03c     	strbhs	r12, [r4, #0x3c]
   5a790: 2dc40b0a     	vstrhs	d16, [r4, #40]
   5a794: e2822001     	add	r2, r2, #1
   5a798: e5842030     	str	r2, [r4, #0x30]
   5a79c: e5d420f4     	ldrb	r2, [r4, #0xf4]
   5a7a0: e3520000     	cmp	r2, #0
   5a7a4: 1affffa1     	bne	0x5a630 <_ZN11mixerengine9HeadPhone6updateEi+0xb0> @ imm = #-0x17c
   5a7a8: e59420e8     	ldr	r2, [r4, #0xe8]
   5a7ac: edd41b38     	vldr	d17, [r4, #224]
   5a7b0: e59480ec     	ldr	r8, [r4, #0xec]
   5a7b4: edd40b34     	vldr	d16, [r4, #208]
   5a7b8: f2410da0     	vadd.f32	d16, d17, d16
   5a7bc: edc40b38     	vstr	d16, [r4, #224]
   5a7c0: e1520008     	cmp	r2, r8
   5a7c4: 2dd40b36     	vldrhs	d16, [r4, #216]
   5a7c8: 25c4c0f4     	strbhs	r12, [r4, #0xf4]
   5a7cc: 2dc40b38     	vstrhs	d16, [r4, #224]
   5a7d0: e2833001     	add	r3, r3, #1
   5a7d4: e2822001     	add	r2, r2, #1
   5a7d8: e1530005     	cmp	r3, r5
   5a7dc: e58420e8     	str	r2, [r4, #0xe8]
   5a7e0: 1affff95     	bne	0x5a63c <_ZN11mixerengine9HeadPhone6updateEi+0xbc> @ imm = #-0x1ac
   5a7e4: e59430f8     	ldr	r3, [r4, #0xf8]
   5a7e8: e3530001     	cmp	r3, #1
   5a7ec: 0a000078     	beq	0x5a9d4 <_ZN11mixerengine9HeadPhone6updateEi+0x454> @ imm = #0x1e0
   5a7f0: e3530002     	cmp	r3, #2
   5a7f4: 1affff72     	bne	0x5a5c4 <_ZN11mixerengine9HeadPhone6updateEi+0x44> @ imm = #-0x238
   5a7f8: e5d430f4     	ldrb	r3, [r4, #0xf4]
   5a7fc: e3530000     	cmp	r3, #0
   5a800: 13a03000     	movne	r3, #0
   5a804: 158430f8     	strne	r3, [r4, #0xf8]
   5a808: eaffff6d     	b	0x5a5c4 <_ZN11mixerengine9HeadPhone6updateEi+0x44> @ imm = #-0x24c
   5a80c: e3550000     	cmp	r5, #0
   5a810: eddf5b02     	vldr	d21, [pc, #8]           @ 0x5a820 <_ZN11mixerengine9HeadPhone6updateEi+0x2a0>
   5a814: dafffff2     	ble	0x5a7e4 <_ZN11mixerengine9HeadPhone6updateEi+0x264> @ imm = #-0x38
   5a818: e3a02001     	mov	r2, #1
   5a81c: ea000011     	b	0x5a868 <_ZN11mixerengine9HeadPhone6updateEi+0x2e8> @ imm = #0x44
   5a820: 55 f7 ef c0  	.word	0xc0eff755
   5a824: 55 f7 ef c0  	.word	0xc0eff755
   5a828: 80 96 14 01  	.word	0x01149680
   5a82c: e5d4306c     	ldrb	r3, [r4, #0x6c]
   5a830: e3530000     	cmp	r3, #0
   5a834: 0a00002c     	beq	0x5a8ec <_ZN11mixerengine9HeadPhone6updateEi+0x36c> @ imm = #0xb0
   5a838: e5d430c4     	ldrb	r3, [r4, #0xc4]
   5a83c: e3530000     	cmp	r3, #0
   5a840: 0a000038     	beq	0x5a928 <_ZN11mixerengine9HeadPhone6updateEi+0x3a8> @ imm = #0xe0
   5a844: e5d4303c     	ldrb	r3, [r4, #0x3c]
   5a848: e3530000     	cmp	r3, #0
   5a84c: 0a000044     	beq	0x5a964 <_ZN11mixerengine9HeadPhone6updateEi+0x3e4> @ imm = #0x110
   5a850: e5d430f4     	ldrb	r3, [r4, #0xf4]
   5a854: e3530000     	cmp	r3, #0
   5a858: 0a000050     	beq	0x5a9a0 <_ZN11mixerengine9HeadPhone6updateEi+0x420> @ imm = #0x140
   5a85c: e2888001     	add	r8, r8, #1
   5a860: e1580005     	cmp	r8, r5
   5a864: 0affffde     	beq	0x5a7e4 <_ZN11mixerengine9HeadPhone6updateEi+0x264> @ imm = #-0x88
   5a868: ecf60b02     	vldmia	r6!, {d16}
   5a86c: edd42b16     	vldr	d18, [r4, #88]
   5a870: f3402db2     	vmul.f32	d18, d16, d18
   5a874: edd44b20     	vldr	d20, [r4, #128]
   5a878: ecf70b02     	vldmia	r7!, {d16}
   5a87c: edd43b2c     	vldr	d19, [r4, #176]
   5a880: f3404db4     	vmul.f32	d20, d16, d20
   5a884: edd41b0a     	vldr	d17, [r4, #40]
   5a888: edd40b38     	vldr	d16, [r4, #224]
   5a88c: f3422db3     	vmul.f32	d18, d18, d19
   5a890: f2444da2     	vadd.f32	d20, d20, d18
   5a894: f3444db5     	vmul.f32	d20, d20, d21
   5a898: f3441db1     	vmul.f32	d17, d20, d17
   5a89c: f3410db0     	vmul.f32	d16, d17, d16
   5a8a0: ece00b02     	vstmia	r0!, {d16}
   5a8a4: e5d43094     	ldrb	r3, [r4, #0x94]
   5a8a8: e3530000     	cmp	r3, #0
   5a8ac: 1affffde     	bne	0x5a82c <_ZN11mixerengine9HeadPhone6updateEi+0x2ac> @ imm = #-0x88
   5a8b0: e5943088     	ldr	r3, [r4, #0x88]
   5a8b4: edd41b20     	vldr	d17, [r4, #128]
   5a8b8: e594108c     	ldr	r1, [r4, #0x8c]
   5a8bc: edd40b1c     	vldr	d16, [r4, #112]
   5a8c0: f2410da0     	vadd.f32	d16, d17, d16
   5a8c4: edc40b20     	vstr	d16, [r4, #128]
   5a8c8: e1530001     	cmp	r3, r1
   5a8cc: 2dd40b1e     	vldrhs	d16, [r4, #120]
   5a8d0: 25c42094     	strbhs	r2, [r4, #0x94]
   5a8d4: 2dc40b20     	vstrhs	d16, [r4, #128]
   5a8d8: e2833001     	add	r3, r3, #1
   5a8dc: e5843088     	str	r3, [r4, #0x88]
   5a8e0: e5d4306c     	ldrb	r3, [r4, #0x6c]
   5a8e4: e3530000     	cmp	r3, #0
   5a8e8: 1affffd2     	bne	0x5a838 <_ZN11mixerengine9HeadPhone6updateEi+0x2b8> @ imm = #-0xb8
   5a8ec: e5943060     	ldr	r3, [r4, #0x60]
   5a8f0: edd41b16     	vldr	d17, [r4, #88]
   5a8f4: e5941064     	ldr	r1, [r4, #0x64]
   5a8f8: edd40b12     	vldr	d16, [r4, #72]
   5a8fc: f2410da0     	vadd.f32	d16, d17, d16
   5a900: edc40b16     	vstr	d16, [r4, #88]
   5a904: e1530001     	cmp	r3, r1
   5a908: 2dd40b14     	vldrhs	d16, [r4, #80]
   5a90c: 25c4206c     	strbhs	r2, [r4, #0x6c]
   5a910: 2dc40b16     	vstrhs	d16, [r4, #88]
   5a914: e2833001     	add	r3, r3, #1
   5a918: e5843060     	str	r3, [r4, #0x60]
   5a91c: e5d430c4     	ldrb	r3, [r4, #0xc4]
   5a920: e3530000     	cmp	r3, #0
   5a924: 1affffc6     	bne	0x5a844 <_ZN11mixerengine9HeadPhone6updateEi+0x2c4> @ imm = #-0xe8
   5a928: e59430b8     	ldr	r3, [r4, #0xb8]
   5a92c: edd41b2c     	vldr	d17, [r4, #176]
   5a930: e59410bc     	ldr	r1, [r4, #0xbc]
   5a934: edd40b28     	vldr	d16, [r4, #160]
   5a938: f2410da0     	vadd.f32	d16, d17, d16
   5a93c: edc40b2c     	vstr	d16, [r4, #176]
   5a940: e1530001     	cmp	r3, r1
   5a944: 2dd40b2a     	vldrhs	d16, [r4, #168]
   5a948: 25c420c4     	strbhs	r2, [r4, #0xc4]
   5a94c: 2dc40b2c     	vstrhs	d16, [r4, #176]
   5a950: e2833001     	add	r3, r3, #1
   5a954: e58430b8     	str	r3, [r4, #0xb8]
   5a958: e5d4303c     	ldrb	r3, [r4, #0x3c]
   5a95c: e3530000     	cmp	r3, #0
   5a960: 1affffba     	bne	0x5a850 <_ZN11mixerengine9HeadPhone6updateEi+0x2d0> @ imm = #-0x118
   5a964: e5943030     	ldr	r3, [r4, #0x30]
   5a968: edd41b0a     	vldr	d17, [r4, #40]
   5a96c: e5941034     	ldr	r1, [r4, #0x34]
   5a970: edd40b06     	vldr	d16, [r4, #24]
   5a974: f2410da0     	vadd.f32	d16, d17, d16
   5a978: edc40b0a     	vstr	d16, [r4, #40]
   5a97c: e1530001     	cmp	r3, r1
   5a980: 2dd40b08     	vldrhs	d16, [r4, #32]
   5a984: 25c4203c     	strbhs	r2, [r4, #0x3c]
   5a988: 2dc40b0a     	vstrhs	d16, [r4, #40]
   5a98c: e2833001     	add	r3, r3, #1
   5a990: e5843030     	str	r3, [r4, #0x30]
   5a994: e5d430f4     	ldrb	r3, [r4, #0xf4]
   5a998: e3530000     	cmp	r3, #0
   5a99c: 1affffae     	bne	0x5a85c <_ZN11mixerengine9HeadPhone6updateEi+0x2dc> @ imm = #-0x148
   5a9a0: e59430e8     	ldr	r3, [r4, #0xe8]
   5a9a4: edd41b38     	vldr	d17, [r4, #224]
   5a9a8: e59410ec     	ldr	r1, [r4, #0xec]
   5a9ac: edd40b34     	vldr	d16, [r4, #208]
   5a9b0: f2410da0     	vadd.f32	d16, d17, d16
   5a9b4: edc40b38     	vstr	d16, [r4, #224]
   5a9b8: e1530001     	cmp	r3, r1
   5a9bc: 2dd40b36     	vldrhs	d16, [r4, #216]
   5a9c0: 25c420f4     	strbhs	r2, [r4, #0xf4]
   5a9c4: 2dc40b38     	vstrhs	d16, [r4, #224]
   5a9c8: e2833001     	add	r3, r3, #1
   5a9cc: e58430e8     	str	r3, [r4, #0xe8]
   5a9d0: eaffffa1     	b	0x5a85c <_ZN11mixerengine9HeadPhone6updateEi+0x2dc> @ imm = #-0x17c
   5a9d4: e5d430f4     	ldrb	r3, [r4, #0xf4]
   5a9d8: e3530000     	cmp	r3, #0
   5a9dc: 0afffef8     	beq	0x5a5c4 <_ZN11mixerengine9HeadPhone6updateEi+0x44> @ imm = #-0x420
   5a9e0: edd41b34     	vldr	d17, [r4, #208]
   5a9e4: edd40b38     	vldr	d16, [r4, #224]
   5a9e8: f2401da1     	vadd.f32	d17, d16, d17
   5a9ec: e59430f0     	ldr	r3, [r4, #0xf0]
   5a9f0: f2c70f10     	vmov.f32	d16, #1.000000e+00
   5a9f4: e59420c8     	ldr	r2, [r4, #0xc8]
   5a9f8: edc40b36     	vstr	d16, [r4, #216]
   5a9fc: ee823b90     	vdup.32	d18, r3
   5aa00: e3a03000     	mov	r3, #0
   5aa04: f2601da1     	vsub.f32	d17, d16, d17
   5aa08: e58420cc     	str	r2, [r4, #0xcc]
   5aa0c: e58430e8     	str	r3, [r4, #0xe8]
   5aa10: e3a02002     	mov	r2, #2
   5aa14: e5c430f4     	strb	r3, [r4, #0xf4]
   5aa18: e58420f8     	str	r2, [r4, #0xf8]
   5aa1c: f3410db2     	vmul.f32	d16, d17, d18
   5aa20: edc40b34     	vstr	d16, [r4, #208]
   5aa24: eafffee6     	b	0x5a5c4 <_ZN11mixerengine9HeadPhone6updateEi+0x44> @ imm = #-0x468
