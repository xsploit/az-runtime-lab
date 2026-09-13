
rx3-research/pi-runtime/rbp:	file format elf32-littlearm

Disassembly of section .text:

00011ae0 <_GLOBAL__sub_I__ZN11mixerengine9HeadPhone20LEVEL_SMOOTHING_TIMEE>:
   11ae0: e92d40f0     	push	{r4, r5, r6, r7, lr}
   11ae4: e3094680     	movw	r4, #0x9680
   11ae8: e3404114     	movt	r4, #0x114
   11aec: e24dd014     	sub	sp, sp, #20
   11af0: e2845008     	add	r5, r4, #8
   11af4: e3a07101     	mov	r7, #1073741824
   11af8: e30a6aab     	movw	r6, #0xaaab
   11afc: e3436e2a     	movt	r6, #0x3e2a
   11b00: e1a00005     	mov	r0, r5
   11b04: ebfff621     	bl	0xf390 <_ZNSt8ios_base4InitC1Ev@plt> @ imm = #-0x277c
   11b08: e1a00005     	mov	r0, r5
   11b0c: e30f1858     	movw	r1, #0xf858
   11b10: e3032a2c     	movw	r2, #0x3a2c
   11b14: e3401000     	movt	r1, #0x0
   11b18: e3402051     	movt	r2, #0x51
   11b1c: ebfff23a     	bl	0xe40c <__aeabi_atexit@plt> @ imm = #-0x3718
   11b20: e3a025fe     	mov	r2, #1065353216
   11b24: e58d2008     	str	r2, [sp, #0x8]
   11b28: e3a00001     	mov	r0, #1
   11b2c: e58d200c     	str	r2, [sp, #0xc]
   11b30: e28d2008     	add	r2, sp, #8
   11b34: e3e01000     	mvn	r1, #0
   11b38: e3a03000     	mov	r3, #0
   11b3c: f462078f     	vld1.32	{d16}, [r2]
   11b40: e3a02000     	mov	r2, #0
   11b44: e58d7008     	str	r7, [sp, #0x8]
   11b48: edc40b04     	vstr	d16, [r4, #16]
   11b4c: e58d700c     	str	r7, [sp, #0xc]
   11b50: e28d7008     	add	r7, sp, #8
   11b54: e3442040     	movt	r2, #0x4040
   11b58: e30d570a     	movw	r5, #0xd70a
   11b5c: f467078f     	vld1.32	{d16}, [r7]
   11b60: e3a07000     	mov	r7, #0
   11b64: e58d2008     	str	r2, [sp, #0x8]
   11b68: edc40b06     	vstr	d16, [r4, #24]
   11b6c: e58d200c     	str	r2, [sp, #0xc]
   11b70: e28d2008     	add	r2, sp, #8
   11b74: e3447080     	movt	r7, #0x4080
   11b78: e3435c23     	movt	r5, #0x3c23
   11b7c: f462078f     	vld1.32	{d16}, [r2]
   11b80: e3a02000     	mov	r2, #0
   11b84: e58d7008     	str	r7, [sp, #0x8]
   11b88: edc40b08     	vstr	d16, [r4, #32]
   11b8c: e58d700c     	str	r7, [sp, #0xc]
   11b90: e28d7008     	add	r7, sp, #8
   11b94: e3442180     	movt	r2, #0x4180
   11b98: e303c7c6     	movw	r12, #0x37c6
   11b9c: f467078f     	vld1.32	{d16}, [r7]
   11ba0: e3a0743f     	mov	r7, #1056964608
   11ba4: e58d2008     	str	r2, [sp, #0x8]
   11ba8: edc40b0a     	vstr	d16, [r4, #40]
   11bac: e58d200c     	str	r2, [sp, #0xc]
   11bb0: e28d2008     	add	r2, sp, #8
   11bb4: e343c73e     	movt	r12, #0x373e
   11bb8: f462078f     	vld1.32	{d16}, [r2]
   11bbc: e3a02000     	mov	r2, #0
   11bc0: e58d7008     	str	r7, [sp, #0x8]
   11bc4: edc40b0c     	vstr	d16, [r4, #48]
   11bc8: e58d700c     	str	r7, [sp, #0xc]
   11bcc: e28d7008     	add	r7, sp, #8
   11bd0: e34b2f80     	movt	r2, #0xbf80
   11bd4: f467078f     	vld1.32	{d16}, [r7]
   11bd8: edc40b00     	vstr	d16, [r4]
   11bdc: e58d6008     	str	r6, [sp, #0x8]
   11be0: e58d600c     	str	r6, [sp, #0xc]
   11be4: f467078f     	vld1.32	{d16}, [r7]
   11be8: edc40b0e     	vstr	d16, [r4, #56]
   11bec: e58d5008     	str	r5, [sp, #0x8]
   11bf0: e58d500c     	str	r5, [sp, #0xc]
   11bf4: f467078f     	vld1.32	{d16}, [r7]
   11bf8: edc40b10     	vstr	d16, [r4, #64]
   11bfc: e58dc008     	str	r12, [sp, #0x8]
   11c00: e58dc00c     	str	r12, [sp, #0xc]
   11c04: e58d0000     	str	r0, [sp]
   11c08: e58d0004     	str	r0, [sp, #0x4]
   11c0c: f467078f     	vld1.32	{d16}, [r7]
   11c10: edc40b12     	vstr	d16, [r4, #72]
   11c14: e58d2008     	str	r2, [sp, #0x8]
   11c18: f46d078f     	vld1.32	{d16}, [sp]
   11c1c: edc40b16     	vstr	d16, [r4, #88]
   11c20: e58d1000     	str	r1, [sp]
   11c24: e58d1004     	str	r1, [sp, #0x4]
   11c28: e58d200c     	str	r2, [sp, #0xc]
   11c2c: f46d078f     	vld1.32	{d16}, [sp]
   11c30: edc40b18     	vstr	d16, [r4, #96]
   11c34: e58d3000     	str	r3, [sp]
   11c38: f467078f     	vld1.32	{d16}, [r7]
   11c3c: edc40b14     	vstr	d16, [r4, #80]
   11c40: e58d3004     	str	r3, [sp, #0x4]
   11c44: f46d078f     	vld1.32	{d16}, [sp]
   11c48: edc40b1a     	vstr	d16, [r4, #104]
   11c4c: e28dd014     	add	sp, sp, #20
   11c50: e8bd80f0     	pop	{r4, r5, r6, r7, pc}
