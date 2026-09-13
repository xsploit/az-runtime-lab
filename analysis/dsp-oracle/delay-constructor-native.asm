
rx3-research/pi-runtime/rbp:	file format elf32-littlearm

Disassembly of section .text:

000b6928 <_ZN11mixerengine15BeatEffectDelayC2Ev>:
   b6928:      	ldr	r3, [pc, #0x374]        @ 0xb6ca4 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x37c>
   b692c:      	vmov.f32	s15, #1.000000e+00
   b6930:      	push	{r4, r5, lr}
   b6934:      	vpush	{d8}
   b6938:      	vmov.i32	d16, #0x0
   b693c:      	ldr	r1, [r3]
   b6940:      	vmov	s14, r1
   b6944:      	mov	r4, r0
   b6948:      	add	r0, r0, #16
   b694c:      	sub	sp, sp, #20
   b6950:      	mov	r3, #0
   b6954:      	vst1.32	{d16}, [r0]
   b6958:      	mov	r2, #1
   b695c:      	str	r1, [r4, #0x4]
   b6960:      	mov	r0, #0
   b6964:      	str	r1, [r4, #0x8]
   b6968:      	mov	r1, #4000
   b696c:      	str	r1, [r4, #0x28]
   b6970:      	mov	r1, #50
   b6974:      	vcvt.f32.u32	s16, s14
   b6978:      	str	r1, [r4, #0x30]
   b697c:      	mov	r1, #100
   b6980:      	str	r1, [r4, #0x34]
   b6984:      	mvn	r1, #99
   b6988:      	str	r1, [r4, #0x38]
   b698c:      	mov	r1, #2
   b6990:      	str	r1, [r4, #0x40]
   b6994:      	mov	r1, #5
   b6998:      	str	r1, [r4, #0x44]
   b699c:      	mov	r1, #11
   b69a0:      	str	r1, [r4, #0x48]
   b69a4:      	ldr	r1, [pc, #0x2fc]        @ 0xb6ca8 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x380>
   b69a8:      	vdiv.f32	s15, s15, s16
   b69ac:      	str	r0, [r4, #0x20]
   b69b0:      	str	r3, [r4, #0x18]
   b69b4:      	mov	r0, #500
   b69b8:      	str	r3, [r4, #0x1c]
   b69bc:      	str	r0, [r4, #0x24]
   b69c0:      	mov	r0, sp
   b69c4:      	str	r2, [r4, #0x2c]
   b69c8:      	strb	r3, [r4, #0x3c]
   b69cc:      	str	r3, [r4, #0x4c]
   b69d0:      	strb	r3, [r4, #0x50]
   b69d4:      	strb	r3, [r4, #0x51]
   b69d8:      	str	r3, [r4, #0x54]
   b69dc:      	str	r3, [r4, #0x58]
   b69e0:      	strb	r3, [r4, #0x5c]
   b69e4:      	strb	r3, [r4, #0x5d]
   b69e8:      	strb	r2, [r4, #0x5e]
   b69ec:      	strb	r3, [r4, #0x5f]
   b69f0:      	strb	r3, [r4, #0x60]
   b69f4:      	strb	r3, [r4, #0x61]
   b69f8:      	str	r3, [r4, #0x64]
   b69fc:      	str	r3, [r4, #0x68]
   b6a00:      	str	r3, [r4, #0x6c]
   b6a04:      	str	r1, [r4]
   b6a08:      	ldr	r1, [pc, #0x29c]        @ 0xb6cac <_ZN11mixerengine15BeatEffectDelayC2Ev+0x384>
   b6a0c:      	str	r2, [r4, #0x70]
   b6a10:      	str	r3, [r4, #0x74]
   b6a14:      	str	r3, [r4, #0x78]
   b6a18:      	str	r3, [r4, #0x7c]
   b6a1c:      	str	r2, [r4, #0x80]
   b6a20:      	strb	r3, [r4, #0x88]
   b6a24:      	vstr	s15, [r4, #12]
   b6a28:      	bl	0x3b1188 <_ZN4juce6StringC2EPKc> @ imm = #0x2fa758
   b6a2c:      	mov	r0, #40
   b6a30:      	bl	0xe328 <_Znwj@plt>      @ imm = #-0xa8710
   b6a34:      	vldr	s15, [pc, #604]         @ 0xb6c98 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x370>
   b6a38:      	vmul.f32	s14, s16, s15
   b6a3c:      	vldr	s15, [pc, #600]         @ 0xb6c9c <_ZN11mixerengine15BeatEffectDelayC2Ev+0x374>
   b6a40:      	mov	r1, #0
   b6a44:      	mov	r3, r0
   b6a48:      	vldr	d16, [pc, #576]         @ 0xb6c90 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x368>
   b6a4c:      	vstr	d16, [r0]
   b6a50:      	vstr	d16, [r0, #8]
   b6a54:      	vstr	d16, [r0, #16]
   b6a58:      	str	r1, [r0, #0x18]
   b6a5c:      	vldr	d16, [pc, #556]         @ 0xb6c90 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x368>
   b6a60:      	mov	r2, #1
   b6a64:      	strb	r2, [r0, #0x24]
   b6a68:      	vdiv.f32	s15, s14, s15
   b6a6c:      	vcvt.u32.f32	s15, s15
   b6a70:      	vmov	r5, s15
   b6a74:      	cmp	r5, r1
   b6a78:      	vstr	s15, [r3, #28]
   b6a7c:      	streq	r2, [r0, #0x1c]
   b6a80:      	vmovne.f32	s14, #1.000000e+00
   b6a84:      	vstr	d16, [r0, #16]
   b6a88:      	vstr	d16, [r0, #8]
   b6a8c:      	vstr	d16, [r0]
   b6a90:      	vcvtne.f32.u32	s15, s15
   b6a94:      	vdivne.f32	s15, s14, s15
   b6a98:      	vmoveq.f32	s15, #1.000000e+00
   b6a9c:      	vstr	s15, [r0, #32]
   b6aa0:      	mov	r0, sp
   b6aa4:      	str	r3, [r4, #0x84]
   b6aa8:      	bl	0x3b0d70 <_ZN4juce6StringD2Ev> @ imm = #0x2fa2c0
   b6aac:      	add	r0, sp, #4
   b6ab0:      	ldr	r1, [pc, #0x1f8]        @ 0xb6cb0 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x388>
   b6ab4:      	bl	0x3b1188 <_ZN4juce6StringC2EPKc> @ imm = #0x2fa6cc
   b6ab8:      	mov	r0, #40
   b6abc:      	bl	0xe328 <_Znwj@plt>      @ imm = #-0xa879c
   b6ac0:      	vldr	s15, [pc, #472]         @ 0xb6ca0 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x378>
   b6ac4:      	vmul.f32	s14, s16, s15
   b6ac8:      	vldr	s15, [pc, #460]         @ 0xb6c9c <_ZN11mixerengine15BeatEffectDelayC2Ev+0x374>
   b6acc:      	mov	r2, #0
   b6ad0:      	str	r2, [r0, #0x18]
   b6ad4:      	mov	r3, r0
   b6ad8:      	vldr	d16, [pc, #432]         @ 0xb6c90 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x368>
   b6adc:      	vstr	d16, [r0]
   b6ae0:      	vstr	d16, [r0, #8]
   b6ae4:      	vstr	d16, [r0, #16]
   b6ae8:      	mov	r1, #1
   b6aec:      	vldr	d16, [pc, #412]         @ 0xb6c90 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x368>
   b6af0:      	strb	r1, [r0, #0x24]
   b6af4:      	vdiv.f32	s15, s14, s15
   b6af8:      	vcvt.u32.f32	s15, s15
   b6afc:      	vmov	r2, s15
   b6b00:      	cmp	r2, #0
   b6b04:      	vstr	s15, [r3, #28]
   b6b08:      	streq	r1, [r0, #0x1c]
   b6b0c:      	vmovne.f32	s14, #1.000000e+00
   b6b10:      	vstr	d16, [r0, #16]
   b6b14:      	vstr	d16, [r0, #8]
   b6b18:      	vstr	d16, [r0]
   b6b1c:      	vcvtne.f32.u32	s15, s15
   b6b20:      	vdivne.f32	s15, s14, s15
   b6b24:      	vmoveq.f32	s15, #1.000000e+00
   b6b28:      	vstr	s15, [r0, #32]
   b6b2c:      	add	r0, sp, #4
   b6b30:      	str	r3, [r4, #0x8c]
   b6b34:      	bl	0x3b0d70 <_ZN4juce6StringD2Ev> @ imm = #0x2fa234
   b6b38:      	add	r0, sp, #8
   b6b3c:      	ldr	r1, [pc, #0x170]        @ 0xb6cb4 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x38c>
   b6b40:      	bl	0x3b1188 <_ZN4juce6StringC2EPKc> @ imm = #0x2fa640
   b6b44:      	mov	r0, #40
   b6b48:      	bl	0xe328 <_Znwj@plt>      @ imm = #-0xa8828
   b6b4c:      	cmp	r5, #0
   b6b50:      	vmovne	s14, r5
   b6b54:      	vldr	d16, [pc, #308]         @ 0xb6c90 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x368>
   b6b58:      	str	r5, [r0, #0x1c]
   b6b5c:      	vcvtne.f32.u32	s15, s14
   b6b60:      	vstr	d16, [r0]
   b6b64:      	vstr	d16, [r0, #8]
   b6b68:      	vstr	d16, [r0, #16]
   b6b6c:      	mov	r3, r0
   b6b70:      	mov	r2, #1
   b6b74:      	mov	r1, #0
   b6b78:      	strb	r2, [r0, #0x24]
   b6b7c:      	str	r1, [r0, #0x18]
   b6b80:      	vmov.f32	d16, #1.000000e+00
   b6b84:      	streq	r2, [r0, #0x1c]
   b6b88:      	vstr	d16, [r0, #16]
   b6b8c:      	vstr	d16, [r0, #8]
   b6b90:      	vldr	d16, [pc, #248]         @ 0xb6c90 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x368>
   b6b94:      	vmovne.f32	s14, #1.000000e+00
   b6b98:      	vstr	d16, [r0]
   b6b9c:      	vdivne.f32	s15, s14, s15
   b6ba0:      	vmoveq.f32	s15, #1.000000e+00
   b6ba4:      	vstr	s15, [r0, #32]
   b6ba8:      	add	r0, sp, #8
   b6bac:      	str	r3, [r4, #0x90]
   b6bb0:      	bl	0x3b0d70 <_ZN4juce6StringD2Ev> @ imm = #0x2fa1b8
   b6bb4:      	add	r0, sp, #12
   b6bb8:      	ldr	r1, [pc, #0xf8]         @ 0xb6cb8 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x390>
   b6bbc:      	bl	0x3b1188 <_ZN4juce6StringC2EPKc> @ imm = #0x2fa5c4
   b6bc0:      	mov	r0, #40
   b6bc4:      	bl	0xe328 <_Znwj@plt>      @ imm = #-0xa88a4
   b6bc8:      	cmp	r5, #0
   b6bcc:      	vmovne	s14, r5
   b6bd0:      	str	r5, [r0, #0x1c]
   b6bd4:      	mov	r3, r0
   b6bd8:      	vcvtne.f32.u32	s15, s14
   b6bdc:      	vldr	d16, [pc, #172]         @ 0xb6c90 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x368>
   b6be0:      	mov	r2, #1
   b6be4:      	vstr	d16, [r0]
   b6be8:      	vstr	d16, [r0, #8]
   b6bec:      	vstr	d16, [r0, #16]
   b6bf0:      	streq	r2, [r0, #0x1c]
   b6bf4:      	vldr	d16, [pc, #148]         @ 0xb6c90 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x368>
   b6bf8:      	strb	r2, [r0, #0x24]
   b6bfc:      	vstr	d16, [r0, #16]
   b6c00:      	vstr	d16, [r0, #8]
   b6c04:      	vstr	d16, [r0]
   b6c08:      	mov	r1, #0
   b6c0c:      	str	r1, [r0, #0x18]
   b6c10:      	vmovne.f32	s14, #1.000000e+00
   b6c14:      	vdivne.f32	s15, s14, s15
   b6c18:      	vmoveq.f32	s15, #1.000000e+00
   b6c1c:      	vstr	s15, [r0, #32]
   b6c20:      	str	r3, [r4, #0x94]
   b6c24:      	add	r0, sp, #12
   b6c28:      	bl	0x3b0d70 <_ZN4juce6StringD2Ev> @ imm = #0x2fa140
   b6c2c:      	mov	r3, #0
   b6c30:      	mov	r2, #9
   b6c34:      	str	r3, [r4, #0x4c]
   b6c38:      	str	r2, [r4, #0x48]
   b6c3c:      	mov	r0, r4
   b6c40:      	strb	r3, [r4, #0x50]
   b6c44:      	add	sp, sp, #20
   b6c48:      	vpop	{d8}
   b6c4c:      	pop	{r4, r5, pc}
   b6c50:      	ldr	r3, [pc, #0x64]         @ 0xb6cbc <_ZN11mixerengine15BeatEffectDelayC2Ev+0x394>
   b6c54:      	str	r3, [r4]
   b6c58:      	bl	0xeebc <__cxa_end_cleanup@plt> @ imm = #-0xa7da4
   b6c5c:      	add	r0, sp, #12
   b6c60:      	bl	0x3b0d70 <_ZN4juce6StringD2Ev> @ imm = #0x2fa108
   b6c64:      	b	0xb6c50 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x328> @ imm = #-0x1c
   b6c68:      	add	r0, sp, #8
   b6c6c:      	bl	0x3b0d70 <_ZN4juce6StringD2Ev> @ imm = #0x2fa0fc
   b6c70:      	b	0xb6c50 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x328> @ imm = #-0x28
   b6c74:      	add	r0, sp, #4
   b6c78:      	bl	0x3b0d70 <_ZN4juce6StringD2Ev> @ imm = #0x2fa0f0
   b6c7c:      	b	0xb6c50 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x328> @ imm = #-0x34
   b6c80:      	mov	r0, sp
   b6c84:      	bl	0x3b0d70 <_ZN4juce6StringD2Ev> @ imm = #0x2fa0e4
   b6c88:      	b	0xb6c50 <_ZN11mixerengine15BeatEffectDelayC2Ev+0x328> @ imm = #-0x40
   b6c8c:      	nop
		...
   b6c98: 55 55 55 40  	.word	0x40555555
   b6c9c: 00 00 7a 44  	.word	0x447a0000
   b6ca0: 46 3f 8b 40  	.word	0x408b3f46
   b6ca4: c0 72 41 00  	.word	0x004172c0
   b6ca8: 48 53 42 00  	.word	0x00425348
   b6cac: e8 fe 41 00  	.word	0x0041fee8
   b6cb0: f4 fe 41 00  	.word	0x0041fef4
   b6cb4: 10 dd 41 00  	.word	0x0041dd10
   b6cb8: 24 dd 41 00  	.word	0x0041dd24
   b6cbc: 60 db 41 00  	.word	0x0041db60
