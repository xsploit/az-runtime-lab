
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000b5788 <secondOrder_IIRFilter_operate(common::Float2 const*, common::Float2*, common::Float2 const*, common::Float2*, common::Float2*, unsigned long)>:
   b5788:	e92d0070 	push	{r4, r5, r6}
   b578c:	edd2ab00 	vldr	d26, [r2]
   b5790:	edd2cb02 	vldr	d28, [r2, #8]
   b5794:	edd2bb04 	vldr	d27, [r2, #16]
   b5798:	e59dc010 	ldr	ip, [sp, #16]
   b579c:	edd2eb06 	vldr	d30, [r2, #24]
   b57a0:	e59d600c 	ldr	r6, [sp, #12]
   b57a4:	edd2db08 	vldr	d29, [r2, #32]
   b57a8:	e35c0000 	cmp	ip, #0
   b57ac:	0a000047 	beq	b58d0 <secondOrder_IIRFilter_operate(common::Float2 const*, common::Float2*, common::Float2 const*, common::Float2*, common::Float2*, unsigned long)+0x148>
   b57b0:	e35c0001 	cmp	ip, #1
   b57b4:	edd00b00 	vldr	d16, [r0]
   b57b8:	0a000046 	beq	b58d8 <secondOrder_IIRFilter_operate(common::Float2 const*, common::Float2*, common::Float2 const*, common::Float2*, common::Float2*, unsigned long)+0x150>
   b57bc:	edd32b02 	vldr	d18, [r3, #8]
   b57c0:	f34a1db0 	vmul.f32	d17, d26, d16
   b57c4:	f34c0db2 	vmul.f32	d16, d28, d18
   b57c8:	edd33b00 	vldr	d19, [r3]
   b57cc:	f34b2db3 	vmul.f32	d18, d27, d19
   b57d0:	edd69b02 	vldr	d25, [r6, #8]
   b57d4:	f34e9db9 	vmul.f32	d25, d30, d25
   b57d8:	edd63b00 	vldr	d19, [r6]
   b57dc:	f34d3db3 	vmul.f32	d19, d29, d19
   b57e0:	e35c0002 	cmp	ip, #2
   b57e4:	f2410da0 	vadd.f32	d16, d17, d16
   b57e8:	f2400da2 	vadd.f32	d16, d16, d18
   b57ec:	f2600da9 	vsub.f32	d16, d16, d25
   b57f0:	f2609da3 	vsub.f32	d25, d16, d19
   b57f4:	edc19b00 	vstr	d25, [r1]
   b57f8:	edd00b02 	vldr	d16, [r0, #8]
   b57fc:	edd02b00 	vldr	d18, [r0]
   b5800:	f34a1db0 	vmul.f32	d17, d26, d16
   b5804:	edd33b02 	vldr	d19, [r3, #8]
   b5808:	f34c0db2 	vmul.f32	d16, d28, d18
   b580c:	edd64b02 	vldr	d20, [r6, #8]
   b5810:	f34b2db3 	vmul.f32	d18, d27, d19
   b5814:	f34e3db9 	vmul.f32	d19, d30, d25
   b5818:	f34d4db4 	vmul.f32	d20, d29, d20
   b581c:	f2410da0 	vadd.f32	d16, d17, d16
   b5820:	f2400da2 	vadd.f32	d16, d16, d18
   b5824:	f2600da3 	vsub.f32	d16, d16, d19
   b5828:	f2600da4 	vsub.f32	d16, d16, d20
   b582c:	edc10b02 	vstr	d16, [r1, #8]
   b5830:	edd02b02 	vldr	d18, [r0, #8]
   b5834:	edd07b00 	vldr	d23, [r0]
   b5838:	9a000014 	bls	b5890 <secondOrder_IIRFilter_operate(common::Float2 const*, common::Float2*, common::Float2 const*, common::Float2*, common::Float2*, unsigned long)+0x108>
   b583c:	e2805010 	add	r5, r0, #16
   b5840:	e2814010 	add	r4, r1, #16
   b5844:	e3a02002 	mov	r2, #2
   b5848:	ecf51b02 	vldmia	r5!, {d17}
   b584c:	f34c3db2 	vmul.f32	d19, d28, d18
   b5850:	f34a4db1 	vmul.f32	d20, d26, d17
   b5854:	e2822001 	add	r2, r2, #1
   b5858:	f34b5db7 	vmul.f32	d21, d27, d23
   b585c:	e152000c 	cmp	r2, ip
   b5860:	f34e6db0 	vmul.f32	d22, d30, d16
   b5864:	f34d8db9 	vmul.f32	d24, d29, d25
   b5868:	f2443da3 	vadd.f32	d19, d20, d19
   b586c:	f26091b0 	vorr	d25, d16, d16
   b5870:	f26271b2 	vorr	d23, d18, d18
   b5874:	f248fda6 	vadd.f32	d31, d24, d22
   b5878:	f2430da5 	vadd.f32	d16, d19, d21
   b587c:	f26121b1 	vorr	d18, d17, d17
   b5880:	f2600daf 	vsub.f32	d16, d16, d31
   b5884:	ecf51b02 	vldmia	r5!, {d17}
   b5888:	ece40b02 	vstmia	r4!, {d16}
   b588c:	1affffee 	bne	b584c <secondOrder_IIRFilter_operate(common::Float2 const*, common::Float2*, common::Float2 const*, common::Float2*, common::Float2*, unsigned long)+0xc4>
   b5890:	e24c2002 	sub	r2, ip, #2
   b5894:	e24cc001 	sub	ip, ip, #1
   b5898:	e1a02182 	lsl	r2, r2, #3
   b589c:	e1a0c18c 	lsl	ip, ip, #3
   b58a0:	e0804002 	add	r4, r0, r2
   b58a4:	e0812002 	add	r2, r1, r2
   b58a8:	edd40b00 	vldr	d16, [r4]
   b58ac:	e080000c 	add	r0, r0, ip
   b58b0:	edc30b00 	vstr	d16, [r3]
   b58b4:	e081100c 	add	r1, r1, ip
   b58b8:	edd00b00 	vldr	d16, [r0]
   b58bc:	edc30b02 	vstr	d16, [r3, #8]
   b58c0:	edd20b00 	vldr	d16, [r2]
   b58c4:	edc60b00 	vstr	d16, [r6]
   b58c8:	edd10b00 	vldr	d16, [r1]
   b58cc:	edc60b02 	vstr	d16, [r6, #8]
   b58d0:	e8bd0070 	pop	{r4, r5, r6}
   b58d4:	e12fff1e 	bx	lr
   b58d8:	edd31b02 	vldr	d17, [r3, #8]
   b58dc:	f34a0db0 	vmul.f32	d16, d26, d16
   b58e0:	f34ccdb1 	vmul.f32	d28, d28, d17
   b58e4:	edd32b00 	vldr	d18, [r3]
   b58e8:	f34bbdb2 	vmul.f32	d27, d27, d18
   b58ec:	edd63b02 	vldr	d19, [r6, #8]
   b58f0:	f34eedb3 	vmul.f32	d30, d30, d19
   b58f4:	edd61b00 	vldr	d17, [r6]
   b58f8:	f34dddb1 	vmul.f32	d29, d29, d17
   b58fc:	f2400dac 	vadd.f32	d16, d16, d28
   b5900:	f240bdab 	vadd.f32	d27, d16, d27
   b5904:	f26bedae 	vsub.f32	d30, d27, d30
   b5908:	f26eddad 	vsub.f32	d29, d30, d29
   b590c:	edc1db00 	vstr	d29, [r1]
   b5910:	edd30b02 	vldr	d16, [r3, #8]
   b5914:	edc30b00 	vstr	d16, [r3]
   b5918:	edd00b00 	vldr	d16, [r0]
   b591c:	edc30b02 	vstr	d16, [r3, #8]
   b5920:	edd60b02 	vldr	d16, [r6, #8]
   b5924:	edc60b00 	vstr	d16, [r6]
   b5928:	edd10b00 	vldr	d16, [r1]
   b592c:	edc60b02 	vstr	d16, [r6, #8]
   b5930:	eaffffe6 	b	b58d0 <secondOrder_IIRFilter_operate(common::Float2 const*, common::Float2*, common::Float2 const*, common::Float2*, common::Float2*, unsigned long)+0x148>
