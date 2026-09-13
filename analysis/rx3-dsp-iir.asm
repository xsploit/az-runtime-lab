
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

0009abd8 <dsp::secondOrder_IIRFilter::setCoefficients(common::Float2 const*)>:
   9abd8:	edd10b00 	vldr	d16, [r1]
   9abdc:	e5903020 	ldr	r3, [r0, #32]
   9abe0:	edc30b00 	vstr	d16, [r3]
   9abe4:	edd10b02 	vldr	d16, [r1, #8]
   9abe8:	edc30b02 	vstr	d16, [r3, #8]
   9abec:	edd10b04 	vldr	d16, [r1, #16]
   9abf0:	edc30b04 	vstr	d16, [r3, #16]
   9abf4:	edd10b06 	vldr	d16, [r1, #24]
   9abf8:	edc30b06 	vstr	d16, [r3, #24]
   9abfc:	edd10b08 	vldr	d16, [r1, #32]
   9ac00:	edc30b08 	vstr	d16, [r3, #32]
   9ac04:	e12fff1e 	bx	lr

0009ac08 <dsp::firstOrder_IIRFilter::setCoefficients(common::Float2 const*)>:
   9ac08:	edd10b00 	vldr	d16, [r1]
   9ac0c:	e5903020 	ldr	r3, [r0, #32]
   9ac10:	edc30b00 	vstr	d16, [r3]
   9ac14:	edd10b02 	vldr	d16, [r1, #8]
   9ac18:	edc30b02 	vstr	d16, [r3, #8]
   9ac1c:	edd10b04 	vldr	d16, [r1, #16]
   9ac20:	edc30b04 	vstr	d16, [r3, #16]
   9ac24:	e12fff1e 	bx	lr

0009ac28 <dsp::firstOrder_IIRFilter::setCoefficients(float const*)>:
   9ac28:	e590201c 	ldr	r2, [r0, #28]
   9ac2c:	e591c000 	ldr	ip, [r1]
   9ac30:	e5903020 	ldr	r3, [r0, #32]
   9ac34:	e582c000 	str	ip, [r2]
   9ac38:	e591c000 	ldr	ip, [r1]
   9ac3c:	e5910004 	ldr	r0, [r1, #4]
   9ac40:	ee80cb90 	vdup.32	d16, ip
   9ac44:	edc30b00 	vstr	d16, [r3]
   9ac48:	e5820004 	str	r0, [r2, #4]
   9ac4c:	e591c004 	ldr	ip, [r1, #4]
   9ac50:	e5910008 	ldr	r0, [r1, #8]
   9ac54:	ee80cb90 	vdup.32	d16, ip
   9ac58:	edc30b02 	vstr	d16, [r3, #8]
   9ac5c:	e5820008 	str	r0, [r2, #8]
   9ac60:	e5912008 	ldr	r2, [r1, #8]
   9ac64:	ee802b90 	vdup.32	d16, r2
   9ac68:	edc30b04 	vstr	d16, [r3, #16]
   9ac6c:	e12fff1e 	bx	lr

0009ac70 <dsp::secondOrder_IIRFilter::setCoefficients(float const*)>:
   9ac70:	e590201c 	ldr	r2, [r0, #28]
   9ac74:	e591c000 	ldr	ip, [r1]
   9ac78:	e5903020 	ldr	r3, [r0, #32]
   9ac7c:	e582c000 	str	ip, [r2]
   9ac80:	e591c000 	ldr	ip, [r1]
   9ac84:	e5910004 	ldr	r0, [r1, #4]
   9ac88:	ee80cb90 	vdup.32	d16, ip
   9ac8c:	edc30b00 	vstr	d16, [r3]
   9ac90:	e5820004 	str	r0, [r2, #4]
   9ac94:	e591c004 	ldr	ip, [r1, #4]
   9ac98:	e5910008 	ldr	r0, [r1, #8]
   9ac9c:	ee80cb90 	vdup.32	d16, ip
   9aca0:	edc30b02 	vstr	d16, [r3, #8]
   9aca4:	e5820008 	str	r0, [r2, #8]
   9aca8:	e591c008 	ldr	ip, [r1, #8]
   9acac:	e591000c 	ldr	r0, [r1, #12]
   9acb0:	ee80cb90 	vdup.32	d16, ip
   9acb4:	edc30b04 	vstr	d16, [r3, #16]
   9acb8:	e582000c 	str	r0, [r2, #12]
   9acbc:	e591c00c 	ldr	ip, [r1, #12]
   9acc0:	e5910010 	ldr	r0, [r1, #16]
   9acc4:	ee80cb90 	vdup.32	d16, ip
   9acc8:	edc30b06 	vstr	d16, [r3, #24]
   9accc:	e5820010 	str	r0, [r2, #16]
   9acd0:	e5912010 	ldr	r2, [r1, #16]
   9acd4:	ee802b90 	vdup.32	d16, r2
   9acd8:	edc30b08 	vstr	d16, [r3, #32]
   9acdc:	e12fff1e 	bx	lr

0009ace0 <dsp::firstOrder_IIRFilter::clearDelayBuffer()>:
   9ace0:	e5902024 	ldr	r2, [r0, #36]	@ 0x24
   9ace4:	e3a03000 	mov	r3, #0
   9ace8:	e5901028 	ldr	r1, [r0, #40]	@ 0x28
   9acec:	ee803b90 	vdup.32	d16, r3
   9acf0:	e5823000 	str	r3, [r2]
   9acf4:	e590202c 	ldr	r2, [r0, #44]	@ 0x2c
   9acf8:	e5813000 	str	r3, [r1]
   9acfc:	e5901030 	ldr	r1, [r0, #48]	@ 0x30
   9ad00:	edc20b00 	vstr	d16, [r2]
   9ad04:	e5902040 	ldr	r2, [r0, #64]	@ 0x40
   9ad08:	edc10b00 	vstr	d16, [r1]
   9ad0c:	eea03b90 	vdup.32	q8, r3
   9ad10:	e5903044 	ldr	r3, [r0, #68]	@ 0x44
   9ad14:	ecc20b04 	vstmia	r2, {d16-d17}
   9ad18:	ecc30b04 	vstmia	r3, {d16-d17}
   9ad1c:	e12fff1e 	bx	lr

0009ad20 <dsp::secondOrder_IIRFilter::clearDelayBuffer()>:
   9ad20:	e5902024 	ldr	r2, [r0, #36]	@ 0x24
   9ad24:	e3a03000 	mov	r3, #0
   9ad28:	ee823b90 	vdup.32	d18, r3
   9ad2c:	eea03b90 	vdup.32	q8, r3
   9ad30:	e5823000 	str	r3, [r2]
   9ad34:	e5823004 	str	r3, [r2, #4]
   9ad38:	e5902028 	ldr	r2, [r0, #40]	@ 0x28
   9ad3c:	e5823000 	str	r3, [r2]
   9ad40:	e5823004 	str	r3, [r2, #4]
   9ad44:	e590302c 	ldr	r3, [r0, #44]	@ 0x2c
   9ad48:	edc32b00 	vstr	d18, [r3]
   9ad4c:	e5902040 	ldr	r2, [r0, #64]	@ 0x40
   9ad50:	edc32b02 	vstr	d18, [r3, #8]
   9ad54:	e5903030 	ldr	r3, [r0, #48]	@ 0x30
   9ad58:	edc32b00 	vstr	d18, [r3]
   9ad5c:	edc32b02 	vstr	d18, [r3, #8]
   9ad60:	e5903044 	ldr	r3, [r0, #68]	@ 0x44
   9ad64:	ecc20b04 	vstmia	r2, {d16-d17}
   9ad68:	edc20b04 	vstr	d16, [r2, #16]
   9ad6c:	edc21b06 	vstr	d17, [r2, #24]
   9ad70:	ecc30b04 	vstmia	r3, {d16-d17}
   9ad74:	edc30b04 	vstr	d16, [r3, #16]
   9ad78:	edc31b06 	vstr	d17, [r3, #24]
   9ad7c:	e12fff1e 	bx	lr

0009ad80 <dsp::firstOrder_IIRFilter::~firstOrder_IIRFilter()>:
   9ad80:	e92d4010 	push	{r4, lr}
   9ad84:	e1a04000 	mov	r4, r0
   9ad88:	e590001c 	ldr	r0, [r0, #28]
   9ad8c:	e59f309c 	ldr	r3, [pc, #156]	@ 9ae30 <dsp::firstOrder_IIRFilter::~firstOrder_IIRFilter()+0xb0>
   9ad90:	e3500000 	cmp	r0, #0
   9ad94:	e5843000 	str	r3, [r4]
   9ad98:	0a000000 	beq	9ada0 <dsp::firstOrder_IIRFilter::~firstOrder_IIRFilter()+0x20>
   9ad9c:	ebfdd0b2 	bl	f06c <operator delete[](void*)@plt>
   9ada0:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   9ada4:	e3500000 	cmp	r0, #0
   9ada8:	0a000000 	beq	9adb0 <dsp::firstOrder_IIRFilter::~firstOrder_IIRFilter()+0x30>
   9adac:	ebfdd0ae 	bl	f06c <operator delete[](void*)@plt>
   9adb0:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   9adb4:	e3500000 	cmp	r0, #0
   9adb8:	0a000000 	beq	9adc0 <dsp::firstOrder_IIRFilter::~firstOrder_IIRFilter()+0x40>
   9adbc:	ebfdd0aa 	bl	f06c <operator delete[](void*)@plt>
   9adc0:	e5940020 	ldr	r0, [r4, #32]
   9adc4:	e3500000 	cmp	r0, #0
   9adc8:	0a000000 	beq	9add0 <dsp::firstOrder_IIRFilter::~firstOrder_IIRFilter()+0x50>
   9adcc:	ebfdd0a6 	bl	f06c <operator delete[](void*)@plt>
   9add0:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   9add4:	e3500000 	cmp	r0, #0
   9add8:	0a000000 	beq	9ade0 <dsp::firstOrder_IIRFilter::~firstOrder_IIRFilter()+0x60>
   9addc:	ebfdd0a2 	bl	f06c <operator delete[](void*)@plt>
   9ade0:	e5940030 	ldr	r0, [r4, #48]	@ 0x30
   9ade4:	e3500000 	cmp	r0, #0
   9ade8:	0a000000 	beq	9adf0 <dsp::firstOrder_IIRFilter::~firstOrder_IIRFilter()+0x70>
   9adec:	ebfdd09e 	bl	f06c <operator delete[](void*)@plt>
   9adf0:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   9adf4:	e3500000 	cmp	r0, #0
   9adf8:	0a000000 	beq	9ae00 <dsp::firstOrder_IIRFilter::~firstOrder_IIRFilter()+0x80>
   9adfc:	ebfdd09a 	bl	f06c <operator delete[](void*)@plt>
   9ae00:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   9ae04:	e3500000 	cmp	r0, #0
   9ae08:	0a000000 	beq	9ae10 <dsp::firstOrder_IIRFilter::~firstOrder_IIRFilter()+0x90>
   9ae0c:	ebfdd096 	bl	f06c <operator delete[](void*)@plt>
   9ae10:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   9ae14:	e3500000 	cmp	r0, #0
   9ae18:	0a000000 	beq	9ae20 <dsp::firstOrder_IIRFilter::~firstOrder_IIRFilter()+0xa0>
   9ae1c:	ebfdd092 	bl	f06c <operator delete[](void*)@plt>
   9ae20:	e59f300c 	ldr	r3, [pc, #12]	@ 9ae34 <dsp::firstOrder_IIRFilter::~firstOrder_IIRFilter()+0xb4>
   9ae24:	e1a00004 	mov	r0, r4
   9ae28:	e5843000 	str	r3, [r4]
   9ae2c:	e8bd8010 	pop	{r4, pc}
   9ae30:	00420168 	.word	0x00420168
   9ae34:	00420118 	.word	0x00420118

0009ae38 <dsp::firstOrder_IIRFilter::~firstOrder_IIRFilter()>:
   9ae38:	e92d4010 	push	{r4, lr}
   9ae3c:	e1a04000 	mov	r4, r0
   9ae40:	ebffffce 	bl	9ad80 <dsp::firstOrder_IIRFilter::~firstOrder_IIRFilter()>
   9ae44:	e1a00004 	mov	r0, r4
   9ae48:	ebfdcfa0 	bl	ecd0 <operator delete(void*)@plt>
   9ae4c:	e1a00004 	mov	r0, r4
   9ae50:	e8bd8010 	pop	{r4, pc}

0009ae54 <dsp::secondOrder_IIRFilter::~secondOrder_IIRFilter()>:
   9ae54:	e92d4010 	push	{r4, lr}
   9ae58:	e1a04000 	mov	r4, r0
   9ae5c:	e590001c 	ldr	r0, [r0, #28]
   9ae60:	e59f309c 	ldr	r3, [pc, #156]	@ 9af04 <dsp::secondOrder_IIRFilter::~secondOrder_IIRFilter()+0xb0>
   9ae64:	e3500000 	cmp	r0, #0
   9ae68:	e5843000 	str	r3, [r4]
   9ae6c:	0a000000 	beq	9ae74 <dsp::secondOrder_IIRFilter::~secondOrder_IIRFilter()+0x20>
   9ae70:	ebfdd07d 	bl	f06c <operator delete[](void*)@plt>
   9ae74:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   9ae78:	e3500000 	cmp	r0, #0
   9ae7c:	0a000000 	beq	9ae84 <dsp::secondOrder_IIRFilter::~secondOrder_IIRFilter()+0x30>
   9ae80:	ebfdd079 	bl	f06c <operator delete[](void*)@plt>
   9ae84:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   9ae88:	e3500000 	cmp	r0, #0
   9ae8c:	0a000000 	beq	9ae94 <dsp::secondOrder_IIRFilter::~secondOrder_IIRFilter()+0x40>
   9ae90:	ebfdd075 	bl	f06c <operator delete[](void*)@plt>
   9ae94:	e5940020 	ldr	r0, [r4, #32]
   9ae98:	e3500000 	cmp	r0, #0
   9ae9c:	0a000000 	beq	9aea4 <dsp::secondOrder_IIRFilter::~secondOrder_IIRFilter()+0x50>
   9aea0:	ebfdd071 	bl	f06c <operator delete[](void*)@plt>
   9aea4:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   9aea8:	e3500000 	cmp	r0, #0
   9aeac:	0a000000 	beq	9aeb4 <dsp::secondOrder_IIRFilter::~secondOrder_IIRFilter()+0x60>
   9aeb0:	ebfdd06d 	bl	f06c <operator delete[](void*)@plt>
   9aeb4:	e5940030 	ldr	r0, [r4, #48]	@ 0x30
   9aeb8:	e3500000 	cmp	r0, #0
   9aebc:	0a000000 	beq	9aec4 <dsp::secondOrder_IIRFilter::~secondOrder_IIRFilter()+0x70>
   9aec0:	ebfdd069 	bl	f06c <operator delete[](void*)@plt>
   9aec4:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   9aec8:	e3500000 	cmp	r0, #0
   9aecc:	0a000000 	beq	9aed4 <dsp::secondOrder_IIRFilter::~secondOrder_IIRFilter()+0x80>
   9aed0:	ebfdd065 	bl	f06c <operator delete[](void*)@plt>
   9aed4:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   9aed8:	e3500000 	cmp	r0, #0
   9aedc:	0a000000 	beq	9aee4 <dsp::secondOrder_IIRFilter::~secondOrder_IIRFilter()+0x90>
   9aee0:	ebfdd061 	bl	f06c <operator delete[](void*)@plt>
   9aee4:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   9aee8:	e3500000 	cmp	r0, #0
   9aeec:	0a000000 	beq	9aef4 <dsp::secondOrder_IIRFilter::~secondOrder_IIRFilter()+0xa0>
   9aef0:	ebfdd05d 	bl	f06c <operator delete[](void*)@plt>
   9aef4:	e59f300c 	ldr	r3, [pc, #12]	@ 9af08 <dsp::secondOrder_IIRFilter::~secondOrder_IIRFilter()+0xb4>
   9aef8:	e1a00004 	mov	r0, r4
   9aefc:	e5843000 	str	r3, [r4]
   9af00:	e8bd8010 	pop	{r4, pc}
   9af04:	00420190 	.word	0x00420190
   9af08:	00420118 	.word	0x00420118

0009af0c <dsp::secondOrder_IIRFilter::~secondOrder_IIRFilter()>:
   9af0c:	e92d4010 	push	{r4, lr}
   9af10:	e1a04000 	mov	r4, r0
   9af14:	ebffffce 	bl	9ae54 <dsp::secondOrder_IIRFilter::~secondOrder_IIRFilter()>
   9af18:	e1a00004 	mov	r0, r4
   9af1c:	ebfdcf6b 	bl	ecd0 <operator delete(void*)@plt>
   9af20:	e1a00004 	mov	r0, r4
   9af24:	e8bd8010 	pop	{r4, pc}

0009af28 <dsp::secondOrder_IIRFilter::operate(common::Float4 const*, common::Float4*, unsigned long)>:
   9af28:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
   9af2c:	e24dd00c 	sub	sp, sp, #12
   9af30:	e1a0c000 	mov	ip, r0
   9af34:	e58d3004 	str	r3, [sp, #4]
   9af38:	e590e03c 	ldr	lr, [r0, #60]	@ 0x3c
   9af3c:	e1a00001 	mov	r0, r1
   9af40:	e59c3040 	ldr	r3, [ip, #64]	@ 0x40
   9af44:	e1a01002 	mov	r1, r2
   9af48:	e59cc044 	ldr	ip, [ip, #68]	@ 0x44
   9af4c:	e1a0200e 	mov	r2, lr
   9af50:	e58dc000 	str	ip, [sp]
   9af54:	eb006a76 	bl	b5934 <secondOrder_IIRFilter_operate4(common::Float4 const*, common::Float4*, common::Float4 const*, common::Float4*, common::Float4*, unsigned long)>
   9af58:	e28dd00c 	add	sp, sp, #12
   9af5c:	e8bd8000 	ldmfd	sp!, {pc}

0009af60 <dsp::secondOrder_IIRFilter::operate(common::Float2 const*, common::Float2*, unsigned long)>:
   9af60:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
   9af64:	e24dd00c 	sub	sp, sp, #12
   9af68:	e1a0c000 	mov	ip, r0
   9af6c:	e58d3004 	str	r3, [sp, #4]
   9af70:	e590e020 	ldr	lr, [r0, #32]
   9af74:	e1a00001 	mov	r0, r1
   9af78:	e59c302c 	ldr	r3, [ip, #44]	@ 0x2c
   9af7c:	e1a01002 	mov	r1, r2
   9af80:	e59cc030 	ldr	ip, [ip, #48]	@ 0x30
   9af84:	e1a0200e 	mov	r2, lr
   9af88:	e58dc000 	str	ip, [sp]
   9af8c:	eb0069fd 	bl	b5788 <secondOrder_IIRFilter_operate(common::Float2 const*, common::Float2*, common::Float2 const*, common::Float2*, common::Float2*, unsigned long)>
   9af90:	e28dd00c 	add	sp, sp, #12
   9af94:	e8bd8000 	ldmfd	sp!, {pc}

0009af98 <dsp::secondOrder_IIRFilter::operate(float const*, float*, unsigned long)>:
   9af98:	e3530000 	cmp	r3, #0
   9af9c:	e92d0ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp}
   9afa0:	e24dd008 	sub	sp, sp, #8
   9afa4:	0a000055 	beq	9b100 <dsp::secondOrder_IIRFilter::operate(float const*, float*, unsigned long)+0x168>
   9afa8:	e3530001 	cmp	r3, #1
   9afac:	0a000056 	beq	9b10c <dsp::secondOrder_IIRFilter::operate(float const*, float*, unsigned long)+0x174>
   9afb0:	e590c01c 	ldr	ip, [r0, #28]
   9afb4:	ed9c7a01 	vldr	s14, [ip, #4]
   9afb8:	e5904024 	ldr	r4, [r0, #36]	@ 0x24
   9afbc:	edd47a01 	vldr	s15, [r4, #4]
   9afc0:	ee677a27 	vmul.f32	s15, s14, s15
   9afc4:	eddc3a00 	vldr	s7, [ip]
   9afc8:	ed914a00 	vldr	s8, [r1]
   9afcc:	eddc4a02 	vldr	s9, [ip, #8]
   9afd0:	ed945a00 	vldr	s10, [r4]
   9afd4:	e590b028 	ldr	fp, [r0, #40]	@ 0x28
   9afd8:	eddc5a03 	vldr	s11, [ip, #12]
   9afdc:	ed9b6a01 	vldr	s12, [fp, #4]
   9afe0:	eddc6a04 	vldr	s13, [ip, #16]
   9afe4:	ed9b7a00 	vldr	s14, [fp]
   9afe8:	e3530002 	cmp	r3, #2
   9afec:	e58d4004 	str	r4, [sp, #4]
   9aff0:	ee437a84 	vmla.f32	s15, s7, s8
   9aff4:	ee447a85 	vmla.f32	s15, s9, s10
   9aff8:	ee457ac6 	vmls.f32	s15, s11, s12
   9affc:	ee467ac7 	vmls.f32	s15, s13, s14
   9b000:	edc27a00 	vstr	s15, [r2]
   9b004:	eddc6a01 	vldr	s13, [ip, #4]
   9b008:	ed917a00 	vldr	s14, [r1]
   9b00c:	ee267a87 	vmul.f32	s14, s13, s14
   9b010:	eddc3a00 	vldr	s7, [ip]
   9b014:	ed914a01 	vldr	s8, [r1, #4]
   9b018:	eddc4a02 	vldr	s9, [ip, #8]
   9b01c:	ed945a01 	vldr	s10, [r4, #4]
   9b020:	eddc5a03 	vldr	s11, [ip, #12]
   9b024:	ed9c6a04 	vldr	s12, [ip, #16]
   9b028:	eddb6a01 	vldr	s13, [fp, #4]
   9b02c:	ee037a84 	vmla.f32	s14, s7, s8
   9b030:	ee047a85 	vmla.f32	s14, s9, s10
   9b034:	ee077ae5 	vmls.f32	s14, s15, s11
   9b038:	ee067a66 	vmls.f32	s14, s12, s13
   9b03c:	ed827a01 	vstr	s14, [r2, #4]
   9b040:	9a00001d 	bls	9b0bc <dsp::secondOrder_IIRFilter::operate(float const*, float*, unsigned long)+0x124>
   9b044:	e281a004 	add	sl, r1, #4
   9b048:	e2828004 	add	r8, r2, #4
   9b04c:	e1a07001 	mov	r7, r1
   9b050:	e1a06002 	mov	r6, r2
   9b054:	e1a05002 	mov	r5, r2
   9b058:	e1a04001 	mov	r4, r1
   9b05c:	e3a00002 	mov	r0, #2
   9b060:	ed9c7a01 	vldr	s14, [ip, #4]
   9b064:	e2877004 	add	r7, r7, #4
   9b068:	edd77a00 	vldr	s15, [r7]
   9b06c:	ee677a27 	vmul.f32	s15, s14, s15
   9b070:	eddc3a00 	vldr	s7, [ip]
   9b074:	e28aa004 	add	sl, sl, #4
   9b078:	ed9a4a00 	vldr	s8, [sl]
   9b07c:	ecf44a01 	vldmia	r4!, {s9}
   9b080:	ed9c5a02 	vldr	s10, [ip, #8]
   9b084:	eddc5a03 	vldr	s11, [ip, #12]
   9b088:	e2855004 	add	r5, r5, #4
   9b08c:	ed956a00 	vldr	s12, [r5]
   9b090:	ecf66a01 	vldmia	r6!, {s13}
   9b094:	ed9c7a04 	vldr	s14, [ip, #16]
   9b098:	e2800001 	add	r0, r0, #1
   9b09c:	e1500003 	cmp	r0, r3
   9b0a0:	ee437a84 	vmla.f32	s15, s7, s8
   9b0a4:	ee447a85 	vmla.f32	s15, s9, s10
   9b0a8:	ee457ac6 	vmls.f32	s15, s11, s12
   9b0ac:	ee467ac7 	vmls.f32	s15, s13, s14
   9b0b0:	ee179a90 	vmov	r9, s15
   9b0b4:	e5a89004 	str	r9, [r8, #4]!
   9b0b8:	1affffe8 	bne	9b060 <dsp::secondOrder_IIRFilter::operate(float const*, float*, unsigned long)+0xc8>
   9b0bc:	e2430002 	sub	r0, r3, #2
   9b0c0:	e2433001 	sub	r3, r3, #1
   9b0c4:	e59d4004 	ldr	r4, [sp, #4]
   9b0c8:	e1a00100 	lsl	r0, r0, #2
   9b0cc:	e1a03103 	lsl	r3, r3, #2
   9b0d0:	e081c000 	add	ip, r1, r0
   9b0d4:	e0811003 	add	r1, r1, r3
   9b0d8:	e0820000 	add	r0, r2, r0
   9b0dc:	e0823003 	add	r3, r2, r3
   9b0e0:	e59cc000 	ldr	ip, [ip]
   9b0e4:	e584c000 	str	ip, [r4]
   9b0e8:	e5912000 	ldr	r2, [r1]
   9b0ec:	e5842004 	str	r2, [r4, #4]
   9b0f0:	e5902000 	ldr	r2, [r0]
   9b0f4:	e58b2000 	str	r2, [fp]
   9b0f8:	e5933000 	ldr	r3, [r3]
   9b0fc:	e58b3004 	str	r3, [fp, #4]
   9b100:	e28dd008 	add	sp, sp, #8
   9b104:	e8bd0ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp}
   9b108:	e12fff1e 	bx	lr
   9b10c:	e590401c 	ldr	r4, [r0, #28]
   9b110:	ed947a01 	vldr	s14, [r4, #4]
   9b114:	e590c024 	ldr	ip, [r0, #36]	@ 0x24
   9b118:	eddc7a01 	vldr	s15, [ip, #4]
   9b11c:	ee677a27 	vmul.f32	s15, s14, s15
   9b120:	ed914a00 	vldr	s8, [r1]
   9b124:	edd43a00 	vldr	s7, [r4]
   9b128:	edd44a02 	vldr	s9, [r4, #8]
   9b12c:	ed9c5a00 	vldr	s10, [ip]
   9b130:	e5903028 	ldr	r3, [r0, #40]	@ 0x28
   9b134:	edd45a03 	vldr	s11, [r4, #12]
   9b138:	ed936a01 	vldr	s12, [r3, #4]
   9b13c:	edd46a04 	vldr	s13, [r4, #16]
   9b140:	ed937a00 	vldr	s14, [r3]
   9b144:	ee437a84 	vmla.f32	s15, s7, s8
   9b148:	ee447a85 	vmla.f32	s15, s9, s10
   9b14c:	ee457ac6 	vmls.f32	s15, s11, s12
   9b150:	ee467ac7 	vmls.f32	s15, s13, s14
   9b154:	edc27a00 	vstr	s15, [r2]
   9b158:	e59c0004 	ldr	r0, [ip, #4]
   9b15c:	e58c0000 	str	r0, [ip]
   9b160:	e5911000 	ldr	r1, [r1]
   9b164:	e58c1004 	str	r1, [ip, #4]
   9b168:	e5931004 	ldr	r1, [r3, #4]
   9b16c:	e5831000 	str	r1, [r3]
   9b170:	e5922000 	ldr	r2, [r2]
   9b174:	e5832004 	str	r2, [r3, #4]
   9b178:	eaffffe0 	b	9b100 <dsp::secondOrder_IIRFilter::operate(float const*, float*, unsigned long)+0x168>

0009b17c <dsp::firstOrder_IIRFilter::operate(float const*, float*, unsigned long)>:
   9b17c:	e3530000 	cmp	r3, #0
   9b180:	e92d01f0 	push	{r4, r5, r6, r7, r8}
   9b184:	0a000029 	beq	9b230 <dsp::firstOrder_IIRFilter::operate(float const*, float*, unsigned long)+0xb4>
   9b188:	e3530001 	cmp	r3, #1
   9b18c:	0a000029 	beq	9b238 <dsp::firstOrder_IIRFilter::operate(float const*, float*, unsigned long)+0xbc>
   9b190:	e590c01c 	ldr	ip, [r0, #28]
   9b194:	ed9c7a01 	vldr	s14, [ip, #4]
   9b198:	e5907024 	ldr	r7, [r0, #36]	@ 0x24
   9b19c:	edd77a00 	vldr	s15, [r7]
   9b1a0:	ee677a27 	vmul.f32	s15, s14, s15
   9b1a4:	eddc5a00 	vldr	s11, [ip]
   9b1a8:	ed916a00 	vldr	s12, [r1]
   9b1ac:	e5906028 	ldr	r6, [r0, #40]	@ 0x28
   9b1b0:	eddc6a02 	vldr	s13, [ip, #8]
   9b1b4:	ed967a00 	vldr	s14, [r6]
   9b1b8:	ee457a86 	vmla.f32	s15, s11, s12
   9b1bc:	ee467ac7 	vmls.f32	s15, s13, s14
   9b1c0:	edc27a00 	vstr	s15, [r2]
   9b1c4:	9a000011 	bls	9b210 <dsp::firstOrder_IIRFilter::operate(float const*, float*, unsigned long)+0x94>
   9b1c8:	e1a05001 	mov	r5, r1
   9b1cc:	e1a04002 	mov	r4, r2
   9b1d0:	e3a00001 	mov	r0, #1
   9b1d4:	ed9c7a01 	vldr	s14, [ip, #4]
   9b1d8:	e2855004 	add	r5, r5, #4
   9b1dc:	ed557a01 	vldr	s15, [r5, #-4]
   9b1e0:	ee677a27 	vmul.f32	s15, s14, s15
   9b1e4:	ed956a00 	vldr	s12, [r5]
   9b1e8:	eddc5a00 	vldr	s11, [ip]
   9b1ec:	edd46a00 	vldr	s13, [r4]
   9b1f0:	ed9c7a02 	vldr	s14, [ip, #8]
   9b1f4:	e2800001 	add	r0, r0, #1
   9b1f8:	e1500003 	cmp	r0, r3
   9b1fc:	ee457a86 	vmla.f32	s15, s11, s12
   9b200:	ee467ac7 	vmls.f32	s15, s13, s14
   9b204:	ee178a90 	vmov	r8, s15
   9b208:	e5a48004 	str	r8, [r4, #4]!
   9b20c:	1afffff0 	bne	9b1d4 <dsp::firstOrder_IIRFilter::operate(float const*, float*, unsigned long)+0x58>
   9b210:	e2433001 	sub	r3, r3, #1
   9b214:	e1a03103 	lsl	r3, r3, #2
   9b218:	e0811003 	add	r1, r1, r3
   9b21c:	e0823003 	add	r3, r2, r3
   9b220:	e5912000 	ldr	r2, [r1]
   9b224:	e5872000 	str	r2, [r7]
   9b228:	e5933000 	ldr	r3, [r3]
   9b22c:	e5863000 	str	r3, [r6]
   9b230:	e8bd01f0 	pop	{r4, r5, r6, r7, r8}
   9b234:	e12fff1e 	bx	lr
   9b238:	e590301c 	ldr	r3, [r0, #28]
   9b23c:	ed937a01 	vldr	s14, [r3, #4]
   9b240:	e590c024 	ldr	ip, [r0, #36]	@ 0x24
   9b244:	eddc7a00 	vldr	s15, [ip]
   9b248:	ee677a27 	vmul.f32	s15, s14, s15
   9b24c:	edd35a00 	vldr	s11, [r3]
   9b250:	ed916a00 	vldr	s12, [r1]
   9b254:	edd36a02 	vldr	s13, [r3, #8]
   9b258:	e5900028 	ldr	r0, [r0, #40]	@ 0x28
   9b25c:	ed907a00 	vldr	s14, [r0]
   9b260:	ee457a86 	vmla.f32	s15, s11, s12
   9b264:	ee467ac7 	vmls.f32	s15, s13, s14
   9b268:	edc27a00 	vstr	s15, [r2]
   9b26c:	e5913000 	ldr	r3, [r1]
   9b270:	e58c3000 	str	r3, [ip]
   9b274:	e5923000 	ldr	r3, [r2]
   9b278:	e5803000 	str	r3, [r0]
   9b27c:	eaffffeb 	b	9b230 <dsp::firstOrder_IIRFilter::operate(float const*, float*, unsigned long)+0xb4>

0009b280 <dsp::firstOrder_IIRFilter::operate(common::Float2 const*, common::Float2*, unsigned long)>:
   9b280:	e3530000 	cmp	r3, #0
   9b284:	e92d05f0 	push	{r4, r5, r6, r7, r8, sl}
   9b288:	0a00002d 	beq	9b344 <dsp::firstOrder_IIRFilter::operate(common::Float2 const*, common::Float2*, unsigned long)+0xc4>
   9b28c:	e3530001 	cmp	r3, #1
   9b290:	0a00002d 	beq	9b34c <dsp::firstOrder_IIRFilter::operate(common::Float2 const*, common::Float2*, unsigned long)+0xcc>
   9b294:	e590c020 	ldr	ip, [r0, #32]
   9b298:	edd13b00 	vldr	d19, [r1]
   9b29c:	eddc4b00 	vldr	d20, [ip]
   9b2a0:	eddc2b02 	vldr	d18, [ip, #8]
   9b2a4:	e590a02c 	ldr	sl, [r0, #44]	@ 0x2c
   9b2a8:	f3443db3 	vmul.f32	d19, d20, d19
   9b2ac:	edda1b00 	vldr	d17, [sl]
   9b2b0:	f3421db1 	vmul.f32	d17, d18, d17
   9b2b4:	eddc4b04 	vldr	d20, [ip, #16]
   9b2b8:	e5908030 	ldr	r8, [r0, #48]	@ 0x30
   9b2bc:	edd82b00 	vldr	d18, [r8]
   9b2c0:	f3442db2 	vmul.f32	d18, d20, d18
   9b2c4:	f2431da1 	vadd.f32	d17, d19, d17
   9b2c8:	f2610da2 	vsub.f32	d16, d17, d18
   9b2cc:	edc20b00 	vstr	d16, [r2]
   9b2d0:	9a000013 	bls	9b324 <dsp::firstOrder_IIRFilter::operate(common::Float2 const*, common::Float2*, unsigned long)+0xa4>
   9b2d4:	e2817008 	add	r7, r1, #8
   9b2d8:	e2826008 	add	r6, r2, #8
   9b2dc:	e1a05002 	mov	r5, r2
   9b2e0:	e1a04001 	mov	r4, r1
   9b2e4:	e3a00001 	mov	r0, #1
   9b2e8:	eddc2b00 	vldr	d18, [ip]
   9b2ec:	eddc4b02 	vldr	d20, [ip, #8]
   9b2f0:	ecf73b02 	vldmia	r7!, {d19}
   9b2f4:	ecf45b02 	vldmia	r4!, {d21}
   9b2f8:	f3423db3 	vmul.f32	d19, d18, d19
   9b2fc:	ecf52b02 	vldmia	r5!, {d18}
   9b300:	f3441db5 	vmul.f32	d17, d20, d21
   9b304:	eddc4b04 	vldr	d20, [ip, #16]
   9b308:	f3442db2 	vmul.f32	d18, d20, d18
   9b30c:	e2800001 	add	r0, r0, #1
   9b310:	e1500003 	cmp	r0, r3
   9b314:	f2431da1 	vadd.f32	d17, d19, d17
   9b318:	f2610da2 	vsub.f32	d16, d17, d18
   9b31c:	ece60b02 	vstmia	r6!, {d16}
   9b320:	1afffff0 	bne	9b2e8 <dsp::firstOrder_IIRFilter::operate(common::Float2 const*, common::Float2*, unsigned long)+0x68>
   9b324:	e2433001 	sub	r3, r3, #1
   9b328:	e1a03183 	lsl	r3, r3, #3
   9b32c:	e0811003 	add	r1, r1, r3
   9b330:	e0823003 	add	r3, r2, r3
   9b334:	edd10b00 	vldr	d16, [r1]
   9b338:	edca0b00 	vstr	d16, [sl]
   9b33c:	edd30b00 	vldr	d16, [r3]
   9b340:	edc80b00 	vstr	d16, [r8]
   9b344:	e8bd05f0 	pop	{r4, r5, r6, r7, r8, sl}
   9b348:	e12fff1e 	bx	lr
   9b34c:	e5903020 	ldr	r3, [r0, #32]
   9b350:	edd13b00 	vldr	d19, [r1]
   9b354:	edd32b00 	vldr	d18, [r3]
   9b358:	edd30b02 	vldr	d16, [r3, #8]
   9b35c:	e590c02c 	ldr	ip, [r0, #44]	@ 0x2c
   9b360:	f3423db3 	vmul.f32	d19, d18, d19
   9b364:	eddc1b00 	vldr	d17, [ip]
   9b368:	f3401db1 	vmul.f32	d17, d16, d17
   9b36c:	edd34b04 	vldr	d20, [r3, #16]
   9b370:	e5903030 	ldr	r3, [r0, #48]	@ 0x30
   9b374:	edd32b00 	vldr	d18, [r3]
   9b378:	f3442db2 	vmul.f32	d18, d20, d18
   9b37c:	f2431da1 	vadd.f32	d17, d19, d17
   9b380:	f2610da2 	vsub.f32	d16, d17, d18
   9b384:	edc20b00 	vstr	d16, [r2]
   9b388:	edd10b00 	vldr	d16, [r1]
   9b38c:	edcc0b00 	vstr	d16, [ip]
   9b390:	edd20b00 	vldr	d16, [r2]
   9b394:	edc30b00 	vstr	d16, [r3]
   9b398:	eaffffe9 	b	9b344 <dsp::firstOrder_IIRFilter::operate(common::Float2 const*, common::Float2*, unsigned long)+0xc4>

0009b39c <dsp::firstOrder_IIRFilter::operate(common::Float4 const*, common::Float4*, unsigned long)>:
   9b39c:	e3530000 	cmp	r3, #0
   9b3a0:	e92d05f0 	push	{r4, r5, r6, r7, r8, sl}
   9b3a4:	0a000031 	beq	9b470 <dsp::firstOrder_IIRFilter::operate(common::Float4 const*, common::Float4*, unsigned long)+0xd4>
   9b3a8:	e3530001 	cmp	r3, #1
   9b3ac:	0a000031 	beq	9b478 <dsp::firstOrder_IIRFilter::operate(common::Float4 const*, common::Float4*, unsigned long)+0xdc>
   9b3b0:	e590c03c 	ldr	ip, [r0, #60]	@ 0x3c
   9b3b4:	ecd14b04 	vldmia	r1, {d20-d21}
   9b3b8:	ecdc0b04 	vldmia	ip, {d16-d17}
   9b3bc:	eddc6b04 	vldr	d22, [ip, #16]
   9b3c0:	eddc7b06 	vldr	d23, [ip, #24]
   9b3c4:	e590a040 	ldr	sl, [r0, #64]	@ 0x40
   9b3c8:	f3404df4 	vmul.f32	q10, q8, q10
   9b3cc:	ecda0b04 	vldmia	sl, {d16-d17}
   9b3d0:	eddc2b08 	vldr	d18, [ip, #32]
   9b3d4:	eddc3b0a 	vldr	d19, [ip, #40]	@ 0x28
   9b3d8:	f3460df0 	vmul.f32	q8, q11, q8
   9b3dc:	e5908044 	ldr	r8, [r0, #68]	@ 0x44
   9b3e0:	ecd86b04 	vldmia	r8, {d22-d23}
   9b3e4:	f3422df6 	vmul.f32	q9, q9, q11
   9b3e8:	f2440de0 	vadd.f32	q8, q10, q8
   9b3ec:	f2600de2 	vsub.f32	q8, q8, q9
   9b3f0:	ecc20b04 	vstmia	r2, {d16-d17}
   9b3f4:	9a000015 	bls	9b450 <dsp::firstOrder_IIRFilter::operate(common::Float4 const*, common::Float4*, unsigned long)+0xb4>
   9b3f8:	e2817010 	add	r7, r1, #16
   9b3fc:	e2826010 	add	r6, r2, #16
   9b400:	e1a05002 	mov	r5, r2
   9b404:	e1a04001 	mov	r4, r1
   9b408:	e3a00001 	mov	r0, #1
   9b40c:	ecf72b04 	vldmia	r7!, {d18-d19}
   9b410:	ecdc0b04 	vldmia	ip, {d16-d17}
   9b414:	ecf46b04 	vldmia	r4!, {d22-d23}
   9b418:	eddc4b04 	vldr	d20, [ip, #16]
   9b41c:	eddc5b06 	vldr	d21, [ip, #24]
   9b420:	f3400df2 	vmul.f32	q8, q8, q9
   9b424:	eddc8b08 	vldr	d24, [ip, #32]
   9b428:	eddc9b0a 	vldr	d25, [ip, #40]	@ 0x28
   9b42c:	ecf52b04 	vldmia	r5!, {d18-d19}
   9b430:	e2800001 	add	r0, r0, #1
   9b434:	f3444df6 	vmul.f32	q10, q10, q11
   9b438:	e1500003 	cmp	r0, r3
   9b43c:	f3482df2 	vmul.f32	q9, q12, q9
   9b440:	f2400de4 	vadd.f32	q8, q8, q10
   9b444:	f2600de2 	vsub.f32	q8, q8, q9
   9b448:	ece60b04 	vstmia	r6!, {d16-d17}
   9b44c:	1affffee 	bne	9b40c <dsp::firstOrder_IIRFilter::operate(common::Float4 const*, common::Float4*, unsigned long)+0x70>
   9b450:	e2433001 	sub	r3, r3, #1
   9b454:	e1a03203 	lsl	r3, r3, #4
   9b458:	e0811003 	add	r1, r1, r3
   9b45c:	e0823003 	add	r3, r2, r3
   9b460:	ecd10b04 	vldmia	r1, {d16-d17}
   9b464:	ecca0b04 	vstmia	sl, {d16-d17}
   9b468:	ecd30b04 	vldmia	r3, {d16-d17}
   9b46c:	ecc80b04 	vstmia	r8, {d16-d17}
   9b470:	e8bd05f0 	pop	{r4, r5, r6, r7, r8, sl}
   9b474:	e12fff1e 	bx	lr
   9b478:	e590303c 	ldr	r3, [r0, #60]	@ 0x3c
   9b47c:	ecd14b04 	vldmia	r1, {d20-d21}
   9b480:	ecd30b04 	vldmia	r3, {d16-d17}
   9b484:	edd36b04 	vldr	d22, [r3, #16]
   9b488:	edd37b06 	vldr	d23, [r3, #24]
   9b48c:	e590c040 	ldr	ip, [r0, #64]	@ 0x40
   9b490:	f3404df4 	vmul.f32	q10, q8, q10
   9b494:	ecdc0b04 	vldmia	ip, {d16-d17}
   9b498:	edd32b08 	vldr	d18, [r3, #32]
   9b49c:	edd33b0a 	vldr	d19, [r3, #40]	@ 0x28
   9b4a0:	f3460df0 	vmul.f32	q8, q11, q8
   9b4a4:	e5903044 	ldr	r3, [r0, #68]	@ 0x44
   9b4a8:	ecd36b04 	vldmia	r3, {d22-d23}
   9b4ac:	f3422df6 	vmul.f32	q9, q9, q11
   9b4b0:	f2440de0 	vadd.f32	q8, q10, q8
   9b4b4:	f2600de2 	vsub.f32	q8, q8, q9
   9b4b8:	ecc20b04 	vstmia	r2, {d16-d17}
   9b4bc:	ecd10b04 	vldmia	r1, {d16-d17}
   9b4c0:	eccc0b04 	vstmia	ip, {d16-d17}
   9b4c4:	ecd20b04 	vldmia	r2, {d16-d17}
   9b4c8:	ecc30b04 	vstmia	r3, {d16-d17}
   9b4cc:	eaffffe7 	b	9b470 <dsp::firstOrder_IIRFilter::operate(common::Float4 const*, common::Float4*, unsigned long)+0xd4>

0009b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>:
   9b4d0:	e92d4010 	push	{r4, lr}
   9b4d4:	e3a02000 	mov	r2, #0
   9b4d8:	e5802008 	str	r2, [r0, #8]
   9b4dc:	e1a04000 	mov	r4, r0
   9b4e0:	e580200c 	str	r2, [r0, #12]
   9b4e4:	e3a03000 	mov	r3, #0
   9b4e8:	e5802010 	str	r2, [r0, #16]
   9b4ec:	e5802014 	str	r2, [r0, #20]
   9b4f0:	e5802018 	str	r2, [r0, #24]
   9b4f4:	e59f2194 	ldr	r2, [pc, #404]	@ 9b690 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()+0x1c0>
   9b4f8:	e59f1194 	ldr	r1, [pc, #404]	@ 9b694 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()+0x1c4>
   9b4fc:	e584301c 	str	r3, [r4, #28]
   9b500:	e5922000 	ldr	r2, [r2]
   9b504:	e5801000 	str	r1, [r0]
   9b508:	e5843034 	str	r3, [r4, #52]	@ 0x34
   9b50c:	e5802004 	str	r2, [r0, #4]
   9b510:	e3a00014 	mov	r0, #20
   9b514:	e5843038 	str	r3, [r4, #56]	@ 0x38
   9b518:	ebfdcd62 	bl	eaa8 <operator new[](unsigned int)@plt>
   9b51c:	e584001c 	str	r0, [r4, #28]
   9b520:	e3a00008 	mov	r0, #8
   9b524:	ebfdcd5f 	bl	eaa8 <operator new[](unsigned int)@plt>
   9b528:	e5840024 	str	r0, [r4, #36]	@ 0x24
   9b52c:	e3a00008 	mov	r0, #8
   9b530:	ebfdcd5c 	bl	eaa8 <operator new[](unsigned int)@plt>
   9b534:	e5840028 	str	r0, [r4, #40]	@ 0x28
   9b538:	e3a00028 	mov	r0, #40	@ 0x28
   9b53c:	ebfdcd59 	bl	eaa8 <operator new[](unsigned int)@plt>
   9b540:	e1a03000 	mov	r3, r0
   9b544:	eddf0b4b 	vldr	d16, [pc, #300]	@ 9b678 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()+0x1a8>
   9b548:	e3a00010 	mov	r0, #16
   9b54c:	edc30b00 	vstr	d16, [r3]
   9b550:	edc30b02 	vstr	d16, [r3, #8]
   9b554:	edc30b04 	vstr	d16, [r3, #16]
   9b558:	edc30b06 	vstr	d16, [r3, #24]
   9b55c:	edc30b08 	vstr	d16, [r3, #32]
   9b560:	e5843020 	str	r3, [r4, #32]
   9b564:	ebfdcd4f 	bl	eaa8 <operator new[](unsigned int)@plt>
   9b568:	e1a03000 	mov	r3, r0
   9b56c:	eddf0b41 	vldr	d16, [pc, #260]	@ 9b678 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()+0x1a8>
   9b570:	e3a00010 	mov	r0, #16
   9b574:	edc30b00 	vstr	d16, [r3]
   9b578:	edc30b02 	vstr	d16, [r3, #8]
   9b57c:	e584302c 	str	r3, [r4, #44]	@ 0x2c
   9b580:	ebfdcd48 	bl	eaa8 <operator new[](unsigned int)@plt>
   9b584:	e1a03000 	mov	r3, r0
   9b588:	eddf0b3a 	vldr	d16, [pc, #232]	@ 9b678 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()+0x1a8>
   9b58c:	e3a00050 	mov	r0, #80	@ 0x50
   9b590:	edc30b00 	vstr	d16, [r3]
   9b594:	edc30b02 	vstr	d16, [r3, #8]
   9b598:	e5843030 	str	r3, [r4, #48]	@ 0x30
   9b59c:	ebfdcd41 	bl	eaa8 <operator new[](unsigned int)@plt>
   9b5a0:	e1a03000 	mov	r3, r0
   9b5a4:	eddf0b35 	vldr	d16, [pc, #212]	@ 9b680 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()+0x1b0>
   9b5a8:	eddf1b36 	vldr	d17, [pc, #216]	@ 9b688 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()+0x1b8>
   9b5ac:	e3a00020 	mov	r0, #32
   9b5b0:	ecc30b04 	vstmia	r3, {d16-d17}
   9b5b4:	edc30b04 	vstr	d16, [r3, #16]
   9b5b8:	edc31b06 	vstr	d17, [r3, #24]
   9b5bc:	edc30b08 	vstr	d16, [r3, #32]
   9b5c0:	edc31b0a 	vstr	d17, [r3, #40]	@ 0x28
   9b5c4:	edc30b0c 	vstr	d16, [r3, #48]	@ 0x30
   9b5c8:	edc31b0e 	vstr	d17, [r3, #56]	@ 0x38
   9b5cc:	edc30b10 	vstr	d16, [r3, #64]	@ 0x40
   9b5d0:	edc31b12 	vstr	d17, [r3, #72]	@ 0x48
   9b5d4:	e584303c 	str	r3, [r4, #60]	@ 0x3c
   9b5d8:	ebfdcd32 	bl	eaa8 <operator new[](unsigned int)@plt>
   9b5dc:	e1a03000 	mov	r3, r0
   9b5e0:	eddf0b26 	vldr	d16, [pc, #152]	@ 9b680 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()+0x1b0>
   9b5e4:	eddf1b27 	vldr	d17, [pc, #156]	@ 9b688 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()+0x1b8>
   9b5e8:	e3a00020 	mov	r0, #32
   9b5ec:	ecc30b04 	vstmia	r3, {d16-d17}
   9b5f0:	edc30b04 	vstr	d16, [r3, #16]
   9b5f4:	edc31b06 	vstr	d17, [r3, #24]
   9b5f8:	e5843040 	str	r3, [r4, #64]	@ 0x40
   9b5fc:	ebfdcd29 	bl	eaa8 <operator new[](unsigned int)@plt>
   9b600:	e5941028 	ldr	r1, [r4, #40]	@ 0x28
   9b604:	e1a03000 	mov	r3, r0
   9b608:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   9b60c:	e3a02000 	mov	r2, #0
   9b610:	e5843044 	str	r3, [r4, #68]	@ 0x44
   9b614:	eddf0b19 	vldr	d16, [pc, #100]	@ 9b680 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()+0x1b0>
   9b618:	eddf1b1a 	vldr	d17, [pc, #104]	@ 9b688 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()+0x1b8>
   9b61c:	eddf2b15 	vldr	d18, [pc, #84]	@ 9b678 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()+0x1a8>
   9b620:	e5802000 	str	r2, [r0]
   9b624:	e5802004 	str	r2, [r0, #4]
   9b628:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   9b62c:	e5812000 	str	r2, [r1]
   9b630:	e5812004 	str	r2, [r1, #4]
   9b634:	e5941030 	ldr	r1, [r4, #48]	@ 0x30
   9b638:	e5942040 	ldr	r2, [r4, #64]	@ 0x40
   9b63c:	edc02b00 	vstr	d18, [r0]
   9b640:	edc02b02 	vstr	d18, [r0, #8]
   9b644:	edc12b00 	vstr	d18, [r1]
   9b648:	edc12b02 	vstr	d18, [r1, #8]
   9b64c:	e1a00004 	mov	r0, r4
   9b650:	ecc20b04 	vstmia	r2, {d16-d17}
   9b654:	edc20b04 	vstr	d16, [r2, #16]
   9b658:	edc21b06 	vstr	d17, [r2, #24]
   9b65c:	ecc30b04 	vstmia	r3, {d16-d17}
   9b660:	edc30b04 	vstr	d16, [r3, #16]
   9b664:	edc31b06 	vstr	d17, [r3, #24]
   9b668:	e8bd8010 	pop	{r4, pc}
   9b66c:	e59f3024 	ldr	r3, [pc, #36]	@ 9b698 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()+0x1c8>
   9b670:	e5843000 	str	r3, [r4]
   9b674:	ebfdce10 	bl	eebc <__cxa_end_cleanup@plt>
	...
   9b690:	004172c0 	.word	0x004172c0
   9b694:	00420190 	.word	0x00420190
   9b698:	00420118 	.word	0x00420118

0009b69c <dsp::secondOrder_IIRFilter::setCoefficients(common::Float4 const*)>:
   9b69c:	ecd10b04 	vldmia	r1, {d16-d17}
   9b6a0:	e590303c 	ldr	r3, [r0, #60]	@ 0x3c
   9b6a4:	ecc30b04 	vstmia	r3, {d16-d17}
   9b6a8:	edd10b04 	vldr	d16, [r1, #16]
   9b6ac:	edd11b06 	vldr	d17, [r1, #24]
   9b6b0:	edc30b04 	vstr	d16, [r3, #16]
   9b6b4:	edc31b06 	vstr	d17, [r3, #24]
   9b6b8:	edd10b08 	vldr	d16, [r1, #32]
   9b6bc:	edd11b0a 	vldr	d17, [r1, #40]	@ 0x28
   9b6c0:	edc30b08 	vstr	d16, [r3, #32]
   9b6c4:	edc31b0a 	vstr	d17, [r3, #40]	@ 0x28
   9b6c8:	edd10b0c 	vldr	d16, [r1, #48]	@ 0x30
   9b6cc:	edd11b0e 	vldr	d17, [r1, #56]	@ 0x38
   9b6d0:	edc30b0c 	vstr	d16, [r3, #48]	@ 0x30
   9b6d4:	edc31b0e 	vstr	d17, [r3, #56]	@ 0x38
   9b6d8:	edd10b10 	vldr	d16, [r1, #64]	@ 0x40
   9b6dc:	edd11b12 	vldr	d17, [r1, #72]	@ 0x48
   9b6e0:	edc30b10 	vstr	d16, [r3, #64]	@ 0x40
   9b6e4:	edc31b12 	vstr	d17, [r3, #72]	@ 0x48
   9b6e8:	e12fff1e 	bx	lr

0009b6ec <dsp::firstOrder_IIRFilter::firstOrder_IIRFilter()>:
   9b6ec:	e92d4010 	push	{r4, lr}
   9b6f0:	e3a02000 	mov	r2, #0
   9b6f4:	e5802008 	str	r2, [r0, #8]
   9b6f8:	e1a04000 	mov	r4, r0
   9b6fc:	e580200c 	str	r2, [r0, #12]
   9b700:	e3a03000 	mov	r3, #0
   9b704:	e5802010 	str	r2, [r0, #16]
   9b708:	e5802014 	str	r2, [r0, #20]
   9b70c:	e5802018 	str	r2, [r0, #24]
   9b710:	e59f2150 	ldr	r2, [pc, #336]	@ 9b868 <dsp::firstOrder_IIRFilter::firstOrder_IIRFilter()+0x17c>
   9b714:	e59f1150 	ldr	r1, [pc, #336]	@ 9b86c <dsp::firstOrder_IIRFilter::firstOrder_IIRFilter()+0x180>
