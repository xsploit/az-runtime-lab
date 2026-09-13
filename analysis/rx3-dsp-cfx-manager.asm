
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000bbc68 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)>:
   bbc68:	e92d45f8 	push	{r3, r4, r5, r6, r7, r8, sl, lr}
   bbc6c:	ed2d8b02 	vpush	{d8}
   bbc70:	e1a04000 	mov	r4, r0
   bbc74:	e590302c 	ldr	r3, [r0, #44]	@ 0x2c
   bbc78:	e1a06001 	mov	r6, r1
   bbc7c:	e1a05002 	mov	r5, r2
   bbc80:	e3530000 	cmp	r3, #0
   bbc84:	0a00008c 	beq	bbebc <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x254>
   bbc88:	e5900010 	ldr	r0, [r0, #16]
   bbc8c:	e5903000 	ldr	r3, [r0]
   bbc90:	e5933014 	ldr	r3, [r3, #20]
   bbc94:	e12fff33 	blx	r3
   bbc98:	e5943080 	ldr	r3, [r4, #128]	@ 0x80
   bbc9c:	e3530005 	cmp	r3, #5
   bbca0:	13530000 	cmpne	r3, #0
   bbca4:	1a000030 	bne	bbd6c <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x104>
   bbca8:	e5942020 	ldr	r2, [r4, #32]
   bbcac:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
   bbcb0:	e1520003 	cmp	r2, r3
   bbcb4:	0a00002c 	beq	bbd6c <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x104>
   bbcb8:	e3530000 	cmp	r3, #0
   bbcbc:	e3a01001 	mov	r1, #1
   bbcc0:	ed948b1a 	vldr	d8, [r4, #104]	@ 0x68
   bbcc4:	e5841080 	str	r1, [r4, #128]	@ 0x80
   bbcc8:	0a00012b 	beq	bc17c <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x514>
   bbccc:	e1520001 	cmp	r2, r1
   bbcd0:	0a0001ae 	beq	bc390 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x728>
   bbcd4:	e3520003 	cmp	r2, #3
   bbcd8:	15940000 	ldrne	r0, [r4]
   bbcdc:	0a0001af 	beq	bc3a0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x738>
   bbce0:	e3520007 	cmp	r2, #7
   bbce4:	0a000160 	beq	bc26c <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x604>
   bbce8:	ee183b10 	vmov.32	r3, d8[0]
   bbcec:	ee073a90 	vmov	s15, r3
   bbcf0:	eeb07ae7 	vabs.f32	s14, s15
   bbcf4:	eddf7ac8 	vldr	s15, [pc, #800]	@ bc01c <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x3b4>
   bbcf8:	eeb47ae7 	vcmpe.f32	s14, s15
   bbcfc:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bbd00:	da000128 	ble	bc1a8 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x540>
   bbd04:	edd41b16 	vldr	d17, [r4, #88]	@ 0x58
   bbd08:	f2481d21 	vadd.f32	d17, d8, d17
   bbd0c:	eddf0bbf 	vldr	d16, [pc, #764]	@ bc010 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x3a8>
   bbd10:	e5943078 	ldr	r3, [r4, #120]	@ 0x78
   bbd14:	f2601da1 	vsub.f32	d17, d16, d17
   bbd18:	edc40b18 	vstr	d16, [r4, #96]	@ 0x60
   bbd1c:	ee823b90 	vdup.32	d18, r3
   bbd20:	e3a03000 	mov	r3, #0
   bbd24:	e5843070 	str	r3, [r4, #112]	@ 0x70
   bbd28:	f3410db2 	vmul.f32	d16, d17, d18
   bbd2c:	e5c4307c 	strb	r3, [r4, #124]	@ 0x7c
   bbd30:	edc40b16 	vstr	d16, [r4, #88]	@ 0x58
   bbd34:	ea00011b 	b	bc1a8 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x540>
   bbd38:	e5903000 	ldr	r3, [r0]
   bbd3c:	e5933024 	ldr	r3, [r3, #36]	@ 0x24
   bbd40:	e12fff33 	blx	r3
   bbd44:	e3500000 	cmp	r0, #0
   bbd48:	05940000 	ldreq	r0, [r4]
   bbd4c:	0a00010e 	beq	bc18c <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x524>
   bbd50:	e5942020 	ldr	r2, [r4, #32]
   bbd54:	e3a03007 	mov	r3, #7
   bbd58:	e5843024 	str	r3, [r4, #36]	@ 0x24
   bbd5c:	e5843020 	str	r3, [r4, #32]
   bbd60:	e3a03005 	mov	r3, #5
   bbd64:	e5842028 	str	r2, [r4, #40]	@ 0x28
   bbd68:	e5843080 	str	r3, [r4, #128]	@ 0x80
   bbd6c:	e5940000 	ldr	r0, [r4]
   bbd70:	e590c000 	ldr	ip, [r0]
   bbd74:	e1a03005 	mov	r3, r5
   bbd78:	e1a01006 	mov	r1, r6
   bbd7c:	e594202c 	ldr	r2, [r4, #44]	@ 0x2c
   bbd80:	e59cc008 	ldr	ip, [ip, #8]
   bbd84:	e12fff3c 	blx	ip
   bbd88:	e5943080 	ldr	r3, [r4, #128]	@ 0x80
   bbd8c:	e2433001 	sub	r3, r3, #1
   bbd90:	e3530003 	cmp	r3, #3
   bbd94:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
   bbd98:	ea000025 	b	bbe34 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x1cc>
   bbd9c:	000bbf3c 	.word	0x000bbf3c
   bbda0:	000bc020 	.word	0x000bc020
   bbda4:	000bc0dc 	.word	0x000bc0dc
   bbda8:	000bbec4 	.word	0x000bbec4
   bbdac:	e594701c 	ldr	r7, [r4, #28]
   bbdb0:	e5973000 	ldr	r3, [r7]
   bbdb4:	e1a00007 	mov	r0, r7
   bbdb8:	e3a01007 	mov	r1, #7
   bbdbc:	e593300c 	ldr	r3, [r3, #12]
   bbdc0:	e12fff33 	blx	r3
   bbdc4:	e5973000 	ldr	r3, [r7]
   bbdc8:	e1a02008 	mov	r2, r8
   bbdcc:	e1a00007 	mov	r0, r7
   bbdd0:	e3a01008 	mov	r1, #8
   bbdd4:	e593300c 	ldr	r3, [r3, #12]
   bbdd8:	e12fff33 	blx	r3
   bbddc:	e5973000 	ldr	r3, [r7]
   bbde0:	e1a00007 	mov	r0, r7
   bbde4:	e5933010 	ldr	r3, [r3, #16]
   bbde8:	e12fff33 	blx	r3
   bbdec:	edd41b0c 	vldr	d17, [r4, #48]	@ 0x30
   bbdf0:	edd40b10 	vldr	d16, [r4, #64]	@ 0x40
   bbdf4:	f2401da1 	vadd.f32	d17, d16, d17
   bbdf8:	f2c70f10 	vmov.f32	d16, #1	@ 0x3f800000
   bbdfc:	e5943050 	ldr	r3, [r4, #80]	@ 0x50
   bbe00:	e5942024 	ldr	r2, [r4, #36]	@ 0x24
   bbe04:	edc40b0e 	vstr	d16, [r4, #56]	@ 0x38
   bbe08:	e5847000 	str	r7, [r4]
   bbe0c:	f2601da1 	vsub.f32	d17, d16, d17
   bbe10:	ee823b90 	vdup.32	d18, r3
   bbe14:	e5842020 	str	r2, [r4, #32]
   bbe18:	e3a03000 	mov	r3, #0
   bbe1c:	e5843048 	str	r3, [r4, #72]	@ 0x48
   bbe20:	e5c43054 	strb	r3, [r4, #84]	@ 0x54
   bbe24:	f3410db2 	vmul.f32	d16, d17, d18
   bbe28:	edc40b0c 	vstr	d16, [r4, #48]	@ 0x30
   bbe2c:	e3a03003 	mov	r3, #3
   bbe30:	e5843080 	str	r3, [r4, #128]	@ 0x80
   bbe34:	e3550000 	cmp	r5, #0
   bbe38:	c594102c 	ldrgt	r1, [r4, #44]	@ 0x2c
   bbe3c:	da00001e 	ble	bbebc <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x254>
   bbe40:	e3a03000 	mov	r3, #0
   bbe44:	e3a0c001 	mov	ip, #1
   bbe48:	ea000001 	b	bbe54 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x1ec>
   bbe4c:	e1530005 	cmp	r3, r5
   bbe50:	0a000019 	beq	bbebc <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x254>
   bbe54:	edd61b00 	vldr	d17, [r6]
   bbe58:	edd40b1a 	vldr	d16, [r4, #104]	@ 0x68
   bbe5c:	f3410db0 	vmul.f32	d16, d17, d16
   bbe60:	e0812183 	add	r2, r1, r3, lsl #3
   bbe64:	ece60b02 	vstmia	r6!, {d16}
   bbe68:	edd21b00 	vldr	d17, [r2]
   bbe6c:	e2833001 	add	r3, r3, #1
   bbe70:	f2400da1 	vadd.f32	d16, d16, d17
   bbe74:	ed460b02 	vstr	d16, [r6, #-8]
   bbe78:	e5d4207c 	ldrb	r2, [r4, #124]	@ 0x7c
   bbe7c:	e3520000 	cmp	r2, #0
   bbe80:	1afffff1 	bne	bbe4c <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x1e4>
   bbe84:	e5942070 	ldr	r2, [r4, #112]	@ 0x70
   bbe88:	edd41b1a 	vldr	d17, [r4, #104]	@ 0x68
   bbe8c:	e5940074 	ldr	r0, [r4, #116]	@ 0x74
   bbe90:	edd40b16 	vldr	d16, [r4, #88]	@ 0x58
   bbe94:	f2410da0 	vadd.f32	d16, d17, d16
   bbe98:	edc40b1a 	vstr	d16, [r4, #104]	@ 0x68
   bbe9c:	e1520000 	cmp	r2, r0
   bbea0:	e2822001 	add	r2, r2, #1
   bbea4:	2dd40b18 	vldrcs	d16, [r4, #96]	@ 0x60
   bbea8:	25c4c07c 	strbcs	ip, [r4, #124]	@ 0x7c
   bbeac:	2dc40b1a 	vstrcs	d16, [r4, #104]	@ 0x68
   bbeb0:	e1530005 	cmp	r3, r5
   bbeb4:	e5842070 	str	r2, [r4, #112]	@ 0x70
   bbeb8:	1affffe5 	bne	bbe54 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x1ec>
   bbebc:	ecbd8b02 	vpop	{d8}
   bbec0:	e8bd85f8 	pop	{r3, r4, r5, r6, r7, r8, sl, pc}
   bbec4:	e3550000 	cmp	r5, #0
   bbec8:	da000016 	ble	bbf28 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x2c0>
   bbecc:	e594102c 	ldr	r1, [r4, #44]	@ 0x2c
   bbed0:	e3a02000 	mov	r2, #0
   bbed4:	e594304c 	ldr	r3, [r4, #76]	@ 0x4c
   bbed8:	e3a07001 	mov	r7, #1
   bbedc:	e5940048 	ldr	r0, [r4, #72]	@ 0x48
   bbee0:	edd40b10 	vldr	d16, [r4, #64]	@ 0x40
   bbee4:	e1500003 	cmp	r0, r3
   bbee8:	e081c182 	add	ip, r1, r2, lsl #3
   bbeec:	e2822001 	add	r2, r2, #1
   bbef0:	eddc1b00 	vldr	d17, [ip]
   bbef4:	f3410db0 	vmul.f32	d16, d17, d16
   bbef8:	edcc0b00 	vstr	d16, [ip]
   bbefc:	edd41b10 	vldr	d17, [r4, #64]	@ 0x40
   bbf00:	edd40b0c 	vldr	d16, [r4, #48]	@ 0x30
   bbf04:	f2410da0 	vadd.f32	d16, d17, d16
   bbf08:	edc40b10 	vstr	d16, [r4, #64]	@ 0x40
   bbf0c:	2dd40b0e 	vldrcs	d16, [r4, #56]	@ 0x38
   bbf10:	25c47054 	strbcs	r7, [r4, #84]	@ 0x54
   bbf14:	2dc40b10 	vstrcs	d16, [r4, #64]	@ 0x40
   bbf18:	e1520005 	cmp	r2, r5
   bbf1c:	e2800001 	add	r0, r0, #1
   bbf20:	e5840048 	str	r0, [r4, #72]	@ 0x48
   bbf24:	1affffee 	bne	bbee4 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x27c>
   bbf28:	e5d43054 	ldrb	r3, [r4, #84]	@ 0x54
   bbf2c:	e3530000 	cmp	r3, #0
   bbf30:	13a03000 	movne	r3, #0
   bbf34:	15843080 	strne	r3, [r4, #128]	@ 0x80
   bbf38:	eaffffbd 	b	bbe34 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x1cc>
   bbf3c:	e3550000 	cmp	r5, #0
   bbf40:	da00001d 	ble	bbfbc <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x354>
   bbf44:	e594102c 	ldr	r1, [r4, #44]	@ 0x2c
   bbf48:	e1a08006 	mov	r8, r6
   bbf4c:	e59f70c4 	ldr	r7, [pc, #196]	@ bc018 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x3b0>
   bbf50:	e3a02000 	mov	r2, #0
   bbf54:	e594304c 	ldr	r3, [r4, #76]	@ 0x4c
   bbf58:	e3a0a001 	mov	sl, #1
   bbf5c:	e594c048 	ldr	ip, [r4, #72]	@ 0x48
   bbf60:	edd40b10 	vldr	d16, [r4, #64]	@ 0x40
   bbf64:	edd73b00 	vldr	d19, [r7]
   bbf68:	f2633da0 	vsub.f32	d19, d19, d16
   bbf6c:	ecf82b02 	vldmia	r8!, {d18}
   bbf70:	e0810182 	add	r0, r1, r2, lsl #3
   bbf74:	edd01b00 	vldr	d17, [r0]
   bbf78:	f3411db0 	vmul.f32	d17, d17, d16
   bbf7c:	e15c0003 	cmp	ip, r3
   bbf80:	e2822001 	add	r2, r2, #1
   bbf84:	f3420db3 	vmul.f32	d16, d18, d19
   bbf88:	e28cc001 	add	ip, ip, #1
   bbf8c:	f2410da0 	vadd.f32	d16, d17, d16
   bbf90:	edc00b00 	vstr	d16, [r0]
   bbf94:	edd41b10 	vldr	d17, [r4, #64]	@ 0x40
   bbf98:	edd40b0c 	vldr	d16, [r4, #48]	@ 0x30
   bbf9c:	f2410da0 	vadd.f32	d16, d17, d16
   bbfa0:	edc40b10 	vstr	d16, [r4, #64]	@ 0x40
   bbfa4:	2dd40b0e 	vldrcs	d16, [r4, #56]	@ 0x38
   bbfa8:	25c4a054 	strbcs	sl, [r4, #84]	@ 0x54
   bbfac:	2dc40b10 	vstrcs	d16, [r4, #64]	@ 0x40
   bbfb0:	e1520005 	cmp	r2, r5
   bbfb4:	e584c048 	str	ip, [r4, #72]	@ 0x48
   bbfb8:	1affffe9 	bne	bbf64 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x2fc>
   bbfbc:	e5d43054 	ldrb	r3, [r4, #84]	@ 0x54
   bbfc0:	e3530000 	cmp	r3, #0
   bbfc4:	0affff9a 	beq	bbe34 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x1cc>
   bbfc8:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
   bbfcc:	e5942020 	ldr	r2, [r4, #32]
   bbfd0:	e1520003 	cmp	r2, r3
   bbfd4:	0affff94 	beq	bbe2c <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x1c4>
   bbfd8:	e5941000 	ldr	r1, [r4]
   bbfdc:	e591201c 	ldr	r2, [r1, #28]
   bbfe0:	e5918020 	ldr	r8, [r1, #32]
   bbfe4:	e3530006 	cmp	r3, #6
   bbfe8:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
   bbfec:	ea0000e1 	b	bc378 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x710>
   bbff0:	000bc388 	.word	0x000bc388
   bbff4:	000bc370 	.word	0x000bc370
   bbff8:	000bc368 	.word	0x000bc368
   bbffc:	000bc360 	.word	0x000bc360
   bc000:	000bc358 	.word	0x000bc358
   bc004:	000bc350 	.word	0x000bc350
   bc008:	000bbdac 	.word	0x000bbdac
   bc00c:	e320f000 	.word	0xe320f000
	...
   bc018:	0114b3e8 	.word	0x0114b3e8
   bc01c:	34000000 	.word	0x34000000
   bc020:	e3550000 	cmp	r5, #0
   bc024:	da000016 	ble	bc084 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x41c>
   bc028:	e594102c 	ldr	r1, [r4, #44]	@ 0x2c
   bc02c:	e3a02000 	mov	r2, #0
   bc030:	e594304c 	ldr	r3, [r4, #76]	@ 0x4c
   bc034:	e3a07001 	mov	r7, #1
   bc038:	e5940048 	ldr	r0, [r4, #72]	@ 0x48
   bc03c:	edd40b10 	vldr	d16, [r4, #64]	@ 0x40
   bc040:	e1500003 	cmp	r0, r3
   bc044:	e081c182 	add	ip, r1, r2, lsl #3
   bc048:	e2822001 	add	r2, r2, #1
   bc04c:	eddc1b00 	vldr	d17, [ip]
   bc050:	f3410db0 	vmul.f32	d16, d17, d16
   bc054:	edcc0b00 	vstr	d16, [ip]
   bc058:	edd41b10 	vldr	d17, [r4, #64]	@ 0x40
   bc05c:	edd40b0c 	vldr	d16, [r4, #48]	@ 0x30
   bc060:	f2410da0 	vadd.f32	d16, d17, d16
   bc064:	edc40b10 	vstr	d16, [r4, #64]	@ 0x40
   bc068:	2dd40b0e 	vldrcs	d16, [r4, #56]	@ 0x38
   bc06c:	25c47054 	strbcs	r7, [r4, #84]	@ 0x54
   bc070:	2dc40b10 	vstrcs	d16, [r4, #64]	@ 0x40
   bc074:	e1520005 	cmp	r2, r5
   bc078:	e2800001 	add	r0, r0, #1
   bc07c:	e5840048 	str	r0, [r4, #72]	@ 0x48
   bc080:	1affffee 	bne	bc040 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x3d8>
   bc084:	e5d43054 	ldrb	r3, [r4, #84]	@ 0x54
   bc088:	e3530000 	cmp	r3, #0
   bc08c:	0affff68 	beq	bbe34 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x1cc>
   bc090:	e5942020 	ldr	r2, [r4, #32]
   bc094:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
   bc098:	e3520001 	cmp	r2, #1
   bc09c:	0a0000ce 	beq	bc3dc <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x774>
   bc0a0:	e1520003 	cmp	r2, r3
   bc0a4:	0a00006d 	beq	bc260 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x5f8>
   bc0a8:	e5941000 	ldr	r1, [r4]
   bc0ac:	e591201c 	ldr	r2, [r1, #28]
   bc0b0:	e5918020 	ldr	r8, [r1, #32]
   bc0b4:	e3530006 	cmp	r3, #6
   bc0b8:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
   bc0bc:	ea000093 	b	bc310 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x6a8>
   bc0c0:	000bc308 	.word	0x000bc308
   bc0c4:	000bc300 	.word	0x000bc300
   bc0c8:	000bc2f8 	.word	0x000bc2f8
   bc0cc:	000bc2f0 	.word	0x000bc2f0
   bc0d0:	000bc2e8 	.word	0x000bc2e8
   bc0d4:	000bc2e0 	.word	0x000bc2e0
   bc0d8:	000bc1e0 	.word	0x000bc1e0
   bc0dc:	e5943020 	ldr	r3, [r4, #32]
   bc0e0:	e3530002 	cmp	r3, #2
   bc0e4:	0a0000c6 	beq	bc404 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x79c>
   bc0e8:	e3550000 	cmp	r5, #0
   bc0ec:	daffff8d 	ble	bbf28 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x2c0>
   bc0f0:	e594102c 	ldr	r1, [r4, #44]	@ 0x2c
   bc0f4:	e1a08006 	mov	r8, r6
   bc0f8:	e51f70e8 	ldr	r7, [pc, #-232]	@ bc018 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x3b0>
   bc0fc:	e3a02000 	mov	r2, #0
   bc100:	e594304c 	ldr	r3, [r4, #76]	@ 0x4c
   bc104:	e3a0a001 	mov	sl, #1
   bc108:	e594c048 	ldr	ip, [r4, #72]	@ 0x48
   bc10c:	edd40b10 	vldr	d16, [r4, #64]	@ 0x40
   bc110:	edd73b00 	vldr	d19, [r7]
   bc114:	f2633da0 	vsub.f32	d19, d19, d16
   bc118:	ecf82b02 	vldmia	r8!, {d18}
   bc11c:	e0810182 	add	r0, r1, r2, lsl #3
   bc120:	edd01b00 	vldr	d17, [r0]
   bc124:	f3411db0 	vmul.f32	d17, d17, d16
   bc128:	e15c0003 	cmp	ip, r3
   bc12c:	e2822001 	add	r2, r2, #1
   bc130:	f3420db3 	vmul.f32	d16, d18, d19
   bc134:	e28cc001 	add	ip, ip, #1
   bc138:	f2410da0 	vadd.f32	d16, d17, d16
   bc13c:	edc00b00 	vstr	d16, [r0]
   bc140:	edd41b10 	vldr	d17, [r4, #64]	@ 0x40
   bc144:	edd40b0c 	vldr	d16, [r4, #48]	@ 0x30
   bc148:	f2410da0 	vadd.f32	d16, d17, d16
   bc14c:	edc40b10 	vstr	d16, [r4, #64]	@ 0x40
   bc150:	2dd40b0e 	vldrcs	d16, [r4, #56]	@ 0x38
   bc154:	25c4a054 	strbcs	sl, [r4, #84]	@ 0x54
   bc158:	2dc40b10 	vstrcs	d16, [r4, #64]	@ 0x40
   bc15c:	e1520005 	cmp	r2, r5
   bc160:	e584c048 	str	ip, [r4, #72]	@ 0x48
   bc164:	1affffe9 	bne	bc110 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x4a8>
   bc168:	e5d43054 	ldrb	r3, [r4, #84]	@ 0x54
   bc16c:	e3530000 	cmp	r3, #0
   bc170:	13a03000 	movne	r3, #0
   bc174:	15843080 	strne	r3, [r4, #128]	@ 0x80
   bc178:	eaffff2d 	b	bbe34 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x1cc>
   bc17c:	e5940000 	ldr	r0, [r4]
   bc180:	e5903018 	ldr	r3, [r0, #24]
   bc184:	e3530002 	cmp	r3, #2
   bc188:	0afffeea 	beq	bbd38 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0xd0>
   bc18c:	ee183b10 	vmov.32	r3, d8[0]
   bc190:	ee073a90 	vmov	s15, r3
   bc194:	eeb07ae7 	vabs.f32	s14, s15
   bc198:	ed5f7a61 	vldr	s15, [pc, #-388]	@ bc01c <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x3b4>
   bc19c:	eeb47ae7 	vcmpe.f32	s14, s15
   bc1a0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bc1a4:	ca0000be 	bgt	bc4a4 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x83c>
   bc1a8:	edd41b0c 	vldr	d17, [r4, #48]	@ 0x30
   bc1ac:	edd40b10 	vldr	d16, [r4, #64]	@ 0x40
   bc1b0:	f2401da1 	vadd.f32	d17, d16, d17
   bc1b4:	e5943050 	ldr	r3, [r4, #80]	@ 0x50
   bc1b8:	eddf0bbe 	vldr	d16, [pc, #760]	@ bc4b8 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x850>
   bc1bc:	edc40b0e 	vstr	d16, [r4, #56]	@ 0x38
   bc1c0:	ee823b90 	vdup.32	d18, r3
   bc1c4:	e3a03000 	mov	r3, #0
   bc1c8:	f2601da1 	vsub.f32	d17, d16, d17
   bc1cc:	e5843048 	str	r3, [r4, #72]	@ 0x48
   bc1d0:	e5c43054 	strb	r3, [r4, #84]	@ 0x54
   bc1d4:	f3410db2 	vmul.f32	d16, d17, d18
   bc1d8:	edc40b0c 	vstr	d16, [r4, #48]	@ 0x30
   bc1dc:	eafffee3 	b	bbd70 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x108>
   bc1e0:	e594701c 	ldr	r7, [r4, #28]
   bc1e4:	e5973000 	ldr	r3, [r7]
   bc1e8:	e1a00007 	mov	r0, r7
   bc1ec:	e3a01007 	mov	r1, #7
   bc1f0:	e593300c 	ldr	r3, [r3, #12]
   bc1f4:	e12fff33 	blx	r3
   bc1f8:	e5973000 	ldr	r3, [r7]
   bc1fc:	e1a02008 	mov	r2, r8
   bc200:	e1a00007 	mov	r0, r7
   bc204:	e3a01008 	mov	r1, #8
   bc208:	e593300c 	ldr	r3, [r3, #12]
   bc20c:	e12fff33 	blx	r3
   bc210:	e5973000 	ldr	r3, [r7]
   bc214:	e1a00007 	mov	r0, r7
   bc218:	e5933010 	ldr	r3, [r3, #16]
   bc21c:	e12fff33 	blx	r3
   bc220:	edd41b0c 	vldr	d17, [r4, #48]	@ 0x30
   bc224:	edd40b10 	vldr	d16, [r4, #64]	@ 0x40
   bc228:	f2401da1 	vadd.f32	d17, d16, d17
   bc22c:	f2c70f10 	vmov.f32	d16, #1	@ 0x3f800000
   bc230:	e5943050 	ldr	r3, [r4, #80]	@ 0x50
   bc234:	e5942024 	ldr	r2, [r4, #36]	@ 0x24
   bc238:	edc40b0e 	vstr	d16, [r4, #56]	@ 0x38
   bc23c:	e5847000 	str	r7, [r4]
   bc240:	f2601da1 	vsub.f32	d17, d16, d17
   bc244:	ee823b90 	vdup.32	d18, r3
   bc248:	e5842020 	str	r2, [r4, #32]
   bc24c:	e3a03000 	mov	r3, #0
   bc250:	e5843048 	str	r3, [r4, #72]	@ 0x48
   bc254:	e5c43054 	strb	r3, [r4, #84]	@ 0x54
   bc258:	f3410db2 	vmul.f32	d16, d17, d18
   bc25c:	edc40b0c 	vstr	d16, [r4, #48]	@ 0x30
   bc260:	e3a03004 	mov	r3, #4
   bc264:	e5843080 	str	r3, [r4, #128]	@ 0x80
   bc268:	eafffef1 	b	bbe34 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x1cc>
   bc26c:	e3530006 	cmp	r3, #6
   bc270:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
   bc274:	ea000006 	b	bc294 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x62c>
   bc278:	000bc294 	.word	0x000bc294
   bc27c:	000bc340 	.word	0x000bc340
   bc280:	000bc338 	.word	0x000bc338
   bc284:	000bc330 	.word	0x000bc330
   bc288:	000bc328 	.word	0x000bc328
   bc28c:	000bc320 	.word	0x000bc320
   bc290:	000bc348 	.word	0x000bc348
   bc294:	e5942004 	ldr	r2, [r4, #4]
   bc298:	e5922018 	ldr	r2, [r2, #24]
   bc29c:	e3520002 	cmp	r2, #2
   bc2a0:	1afffe90 	bne	bbce8 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x80>
   bc2a4:	e5942028 	ldr	r2, [r4, #40]	@ 0x28
   bc2a8:	e1530002 	cmp	r3, r2
   bc2ac:	1afffe8d 	bne	bbce8 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x80>
   bc2b0:	e5902018 	ldr	r2, [r0, #24]
   bc2b4:	e3520002 	cmp	r2, #2
   bc2b8:	1a000004 	bne	bc2d0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x668>
   bc2bc:	e5903000 	ldr	r3, [r0]
   bc2c0:	e5933020 	ldr	r3, [r3, #32]
   bc2c4:	e12fff33 	blx	r3
   bc2c8:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
   bc2cc:	e5940000 	ldr	r0, [r4]
   bc2d0:	e5843020 	str	r3, [r4, #32]
   bc2d4:	e3a03000 	mov	r3, #0
   bc2d8:	e5843080 	str	r3, [r4, #128]	@ 0x80
   bc2dc:	eafffea3 	b	bbd70 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x108>
   bc2e0:	e5947018 	ldr	r7, [r4, #24]
   bc2e4:	eaffffbe 	b	bc1e4 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x57c>
   bc2e8:	e5947014 	ldr	r7, [r4, #20]
   bc2ec:	eaffffbc 	b	bc1e4 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x57c>
   bc2f0:	e5947010 	ldr	r7, [r4, #16]
   bc2f4:	eaffffba 	b	bc1e4 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x57c>
   bc2f8:	e594700c 	ldr	r7, [r4, #12]
   bc2fc:	eaffffb8 	b	bc1e4 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x57c>
   bc300:	e5947008 	ldr	r7, [r4, #8]
   bc304:	eaffffb6 	b	bc1e4 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x57c>
   bc308:	e5947004 	ldr	r7, [r4, #4]
   bc30c:	eaffffb4 	b	bc1e4 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x57c>
   bc310:	e3a03000 	mov	r3, #0
   bc314:	e5947004 	ldr	r7, [r4, #4]
   bc318:	e5843024 	str	r3, [r4, #36]	@ 0x24
   bc31c:	eaffffb0 	b	bc1e4 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x57c>
   bc320:	e5942018 	ldr	r2, [r4, #24]
   bc324:	eaffffdb 	b	bc298 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x630>
   bc328:	e5942014 	ldr	r2, [r4, #20]
   bc32c:	eaffffd9 	b	bc298 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x630>
   bc330:	e5942010 	ldr	r2, [r4, #16]
   bc334:	eaffffd7 	b	bc298 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x630>
   bc338:	e594200c 	ldr	r2, [r4, #12]
   bc33c:	eaffffd5 	b	bc298 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x630>
   bc340:	e5942008 	ldr	r2, [r4, #8]
   bc344:	eaffffd3 	b	bc298 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x630>
   bc348:	e594201c 	ldr	r2, [r4, #28]
   bc34c:	eaffffd1 	b	bc298 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x630>
   bc350:	e5947018 	ldr	r7, [r4, #24]
   bc354:	eafffe95 	b	bbdb0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x148>
   bc358:	e5947014 	ldr	r7, [r4, #20]
   bc35c:	eafffe93 	b	bbdb0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x148>
   bc360:	e5947010 	ldr	r7, [r4, #16]
   bc364:	eafffe91 	b	bbdb0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x148>
   bc368:	e594700c 	ldr	r7, [r4, #12]
   bc36c:	eafffe8f 	b	bbdb0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x148>
   bc370:	e5947008 	ldr	r7, [r4, #8]
   bc374:	eafffe8d 	b	bbdb0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x148>
   bc378:	e3a03000 	mov	r3, #0
   bc37c:	e5947004 	ldr	r7, [r4, #4]
   bc380:	e5843024 	str	r3, [r4, #36]	@ 0x24
   bc384:	eafffe89 	b	bbdb0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x148>
   bc388:	e5947004 	ldr	r7, [r4, #4]
   bc38c:	eafffe87 	b	bbdb0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x148>
   bc390:	e3530003 	cmp	r3, #3
   bc394:	0a000003 	beq	bc3a8 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x740>
   bc398:	e5940000 	ldr	r0, [r4]
   bc39c:	eafffe51 	b	bbce8 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x80>
   bc3a0:	e3530001 	cmp	r3, #1
   bc3a4:	1afffffb 	bne	bc398 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x730>
   bc3a8:	e5940000 	ldr	r0, [r4]
   bc3ac:	ed9f7a43 	vldr	s14, [pc, #268]	@ bc4c0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x858>
   bc3b0:	edd07a07 	vldr	s15, [r0, #28]
   bc3b4:	eef47ac7 	vcmpe.f32	s15, s14
   bc3b8:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bc3bc:	4a000003 	bmi	bc3d0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x768>
   bc3c0:	ed9f7a3f 	vldr	s14, [pc, #252]	@ bc4c4 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x85c>
   bc3c4:	eef47ac7 	vcmpe.f32	s15, s14
   bc3c8:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bc3cc:	dafffe43 	ble	bbce0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x78>
   bc3d0:	e3a01002 	mov	r1, #2
   bc3d4:	e5841080 	str	r1, [r4, #128]	@ 0x80
   bc3d8:	eafffe40 	b	bbce0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x78>
   bc3dc:	e3530003 	cmp	r3, #3
   bc3e0:	1affff2e 	bne	bc0a0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x438>
   bc3e4:	e5943084 	ldr	r3, [r4, #132]	@ 0x84
   bc3e8:	e59301ac 	ldr	r0, [r3, #428]	@ 0x1ac
   bc3ec:	e5903000 	ldr	r3, [r0]
   bc3f0:	e5933014 	ldr	r3, [r3, #20]
   bc3f4:	e12fff33 	blx	r3
   bc3f8:	e5942020 	ldr	r2, [r4, #32]
   bc3fc:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
   bc400:	eaffff26 	b	bc0a0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x438>
   bc404:	e3550000 	cmp	r5, #0
   bc408:	dafffeab 	ble	bbebc <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x254>
   bc40c:	ed9f7a2d 	vldr	s14, [pc, #180]	@ bc4c8 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x860>
   bc410:	e1a00006 	mov	r0, r6
   bc414:	e3a03000 	mov	r3, #0
   bc418:	eef07a47 	vmov.f32	s15, s14
   bc41c:	e594102c 	ldr	r1, [r4, #44]	@ 0x2c
   bc420:	e59f70a8 	ldr	r7, [pc, #168]	@ bc4d0 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x868>
   bc424:	eef76a00 	vmov.f32	s13, #112	@ 0x3f800000  1.0
   bc428:	ea000004 	b	bc440 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x7d8>
   bc42c:	ee777a87 	vadd.f32	s15, s15, s14
   bc430:	eef47ae6 	vcmpe.f32	s15, s13
   bc434:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bc438:	cef77a00 	vmovgt.f32	s15, #112	@ 0x3f800000  1.0
   bc43c:	cd9f7a22 	vldrgt	s14, [pc, #136]	@ bc4cc <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x864>
   bc440:	f3fc0c07 	vdup.32	d16, d7[1]
   bc444:	edd73b00 	vldr	d19, [r7]
   bc448:	f2633da0 	vsub.f32	d19, d19, d16
   bc44c:	e0812183 	add	r2, r1, r3, lsl #3
   bc450:	ecf02b02 	vldmia	r0!, {d18}
   bc454:	edd21b00 	vldr	d17, [r2]
   bc458:	f3411db0 	vmul.f32	d17, d17, d16
   bc45c:	e2833001 	add	r3, r3, #1
   bc460:	e1530005 	cmp	r3, r5
   bc464:	f3420db3 	vmul.f32	d16, d18, d19
   bc468:	f2410da0 	vadd.f32	d16, d17, d16
   bc46c:	edc20b00 	vstr	d16, [r2]
   bc470:	1affffed 	bne	bc42c <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x7c4>
   bc474:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   bc478:	eef47ac7 	vcmpe.f32	s15, s14
   bc47c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bc480:	bafffe6e 	blt	bbe40 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x1d8>
   bc484:	f2c70f10 	vmov.f32	d16, #1	@ 0x3f800000
   bc488:	e3a03000 	mov	r3, #0
   bc48c:	edc40b10 	vstr	d16, [r4, #64]	@ 0x40
   bc490:	edc40b0e 	vstr	d16, [r4, #56]	@ 0x38
   bc494:	e5843080 	str	r3, [r4, #128]	@ 0x80
   bc498:	eddf0b06 	vldr	d16, [pc, #24]	@ bc4b8 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x850>
   bc49c:	edc40b0c 	vstr	d16, [r4, #48]	@ 0x30
   bc4a0:	eafffe66 	b	bbe40 <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0x1d8>
   bc4a4:	edd41b16 	vldr	d17, [r4, #88]	@ 0x58
   bc4a8:	edd40b1a 	vldr	d16, [r4, #104]	@ 0x68
   bc4ac:	f2401da1 	vadd.f32	d17, d16, d17
   bc4b0:	eafffe15 	b	bbd0c <mixerengine::SoundColorFxManager::operate(common::Float2*, int)+0xa4>
   bc4b4:	e320f000 	nop	{0}
	...
   bc4c0:	3ed60000 	.word	0x3ed60000
   bc4c4:	3f140000 	.word	0x3f140000
   bc4c8:	3cba2e8c 	.word	0x3cba2e8c
   bc4cc:	00000000 	.word	0x00000000
   bc4d0:	0114b3e8 	.word	0x0114b3e8

000bc4d4 <mixerengine::SoundColorFxManager::init(unsigned long, int)>:
   bc4d4:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
   bc4d8:	ed2d8b02 	vpush	{d8}
   bc4dc:	e1a04000 	mov	r4, r0
   bc4e0:	e590002c 	ldr	r0, [r0, #44]	@ 0x2c
   bc4e4:	e1a05001 	mov	r5, r1
   bc4e8:	e1a06002 	mov	r6, r2
   bc4ec:	e3500000 	cmp	r0, #0
   bc4f0:	0a000000 	beq	bc4f8 <mixerengine::SoundColorFxManager::init(unsigned long, int)+0x24>
   bc4f4:	ebfd4adc 	bl	f06c <operator delete[](void*)@plt>
   bc4f8:	e1a00186 	lsl	r0, r6, #3
   bc4fc:	ebfd4969 	bl	eaa8 <operator new[](unsigned int)@plt>
   bc500:	e2563001 	subs	r3, r6, #1
   bc504:	3a000005 	bcc	bc520 <mixerengine::SoundColorFxManager::init(unsigned long, int)+0x4c>
   bc508:	e1a02000 	mov	r2, r0
   bc50c:	eddf0b7b 	vldr	d16, [pc, #492]	@ bc700 <mixerengine::SoundColorFxManager::init(unsigned long, int)+0x22c>
   bc510:	e2433001 	sub	r3, r3, #1
   bc514:	ece20b02 	vstmia	r2!, {d16}
   bc518:	e3730001 	cmn	r3, #1
   bc51c:	1afffffb 	bne	bc510 <mixerengine::SoundColorFxManager::init(unsigned long, int)+0x3c>
   bc520:	e5942004 	ldr	r2, [r4, #4]
   bc524:	e30a3c44 	movw	r3, #44100	@ 0xac44
   bc528:	e1550003 	cmp	r5, r3
   bc52c:	e584002c 	str	r0, [r4, #44]	@ 0x2c
   bc530:	030377c6 	movweq	r7, #14278	@ 0x37c6
   bc534:	e5825004 	str	r5, [r2, #4]
   bc538:	e5826010 	str	r6, [r2, #16]
   bc53c:	034377be 	movteq	r7, #14270	@ 0x37be
   bc540:	e5923000 	ldr	r3, [r2]
   bc544:	0a000002 	beq	bc554 <mixerengine::SoundColorFxManager::init(unsigned long, int)+0x80>
   bc548:	e3550000 	cmp	r5, #0
   bc54c:	03a07000 	moveq	r7, #0
   bc550:	1a000034 	bne	bc628 <mixerengine::SoundColorFxManager::init(unsigned long, int)+0x154>
   bc554:	e1a00002 	mov	r0, r2
   bc558:	e582700c 	str	r7, [r2, #12]
   bc55c:	e5933010 	ldr	r3, [r3, #16]
   bc560:	e12fff33 	blx	r3
   bc564:	e5943008 	ldr	r3, [r4, #8]
   bc568:	e5932000 	ldr	r2, [r3]
   bc56c:	e1a00003 	mov	r0, r3
   bc570:	e583700c 	str	r7, [r3, #12]
   bc574:	e5835004 	str	r5, [r3, #4]
   bc578:	e5836010 	str	r6, [r3, #16]
   bc57c:	e5923010 	ldr	r3, [r2, #16]
   bc580:	e12fff33 	blx	r3
   bc584:	e594300c 	ldr	r3, [r4, #12]
   bc588:	e5932000 	ldr	r2, [r3]
   bc58c:	e1a00003 	mov	r0, r3
   bc590:	e583700c 	str	r7, [r3, #12]
   bc594:	e5835004 	str	r5, [r3, #4]
   bc598:	e5836010 	str	r6, [r3, #16]
   bc59c:	e5923010 	ldr	r3, [r2, #16]
   bc5a0:	e12fff33 	blx	r3
   bc5a4:	e5943010 	ldr	r3, [r4, #16]
   bc5a8:	e5932000 	ldr	r2, [r3]
   bc5ac:	e1a00003 	mov	r0, r3
   bc5b0:	e583700c 	str	r7, [r3, #12]
   bc5b4:	e5835004 	str	r5, [r3, #4]
   bc5b8:	e5836010 	str	r6, [r3, #16]
   bc5bc:	e5923010 	ldr	r3, [r2, #16]
   bc5c0:	e12fff33 	blx	r3
   bc5c4:	e5943014 	ldr	r3, [r4, #20]
   bc5c8:	e5932000 	ldr	r2, [r3]
   bc5cc:	e1a00003 	mov	r0, r3
   bc5d0:	e583700c 	str	r7, [r3, #12]
   bc5d4:	e5835004 	str	r5, [r3, #4]
   bc5d8:	e5836010 	str	r6, [r3, #16]
   bc5dc:	e5923010 	ldr	r3, [r2, #16]
   bc5e0:	e12fff33 	blx	r3
   bc5e4:	e5943018 	ldr	r3, [r4, #24]
   bc5e8:	e5932000 	ldr	r2, [r3]
   bc5ec:	e1a00003 	mov	r0, r3
   bc5f0:	e583700c 	str	r7, [r3, #12]
   bc5f4:	e5835004 	str	r5, [r3, #4]
   bc5f8:	e5836010 	str	r6, [r3, #16]
   bc5fc:	e5923010 	ldr	r3, [r2, #16]
   bc600:	e12fff33 	blx	r3
   bc604:	e594001c 	ldr	r0, [r4, #28]
   bc608:	e580700c 	str	r7, [r0, #12]
   bc60c:	e5805004 	str	r5, [r0, #4]
   bc610:	e5806010 	str	r6, [r0, #16]
   bc614:	e5903000 	ldr	r3, [r0]
   bc618:	e5933010 	ldr	r3, [r3, #16]
   bc61c:	e12fff33 	blx	r3
   bc620:	ecbd8b02 	vpop	{d8}
   bc624:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
   bc628:	ee075a10 	vmov	s14, r5
   bc62c:	eef87a47 	vcvt.f32.u32	s15, s14
   bc630:	e1a00002 	mov	r0, r2
   bc634:	e5933010 	ldr	r3, [r3, #16]
   bc638:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   bc63c:	ee878a27 	vdiv.f32	s16, s14, s15
   bc640:	ed828a03 	vstr	s16, [r2, #12]
   bc644:	e12fff33 	blx	r3
   bc648:	e5943008 	ldr	r3, [r4, #8]
   bc64c:	ed838a03 	vstr	s16, [r3, #12]
   bc650:	e5932000 	ldr	r2, [r3]
   bc654:	e1a00003 	mov	r0, r3
   bc658:	e5835004 	str	r5, [r3, #4]
   bc65c:	e5836010 	str	r6, [r3, #16]
   bc660:	e5923010 	ldr	r3, [r2, #16]
   bc664:	e12fff33 	blx	r3
   bc668:	e594300c 	ldr	r3, [r4, #12]
   bc66c:	ed838a03 	vstr	s16, [r3, #12]
   bc670:	e5932000 	ldr	r2, [r3]
   bc674:	e1a00003 	mov	r0, r3
   bc678:	e5835004 	str	r5, [r3, #4]
   bc67c:	e5836010 	str	r6, [r3, #16]
   bc680:	e5923010 	ldr	r3, [r2, #16]
   bc684:	e12fff33 	blx	r3
   bc688:	e5943010 	ldr	r3, [r4, #16]
   bc68c:	ed838a03 	vstr	s16, [r3, #12]
   bc690:	e5932000 	ldr	r2, [r3]
   bc694:	e1a00003 	mov	r0, r3
   bc698:	e5835004 	str	r5, [r3, #4]
   bc69c:	e5836010 	str	r6, [r3, #16]
   bc6a0:	e5923010 	ldr	r3, [r2, #16]
   bc6a4:	e12fff33 	blx	r3
   bc6a8:	e5943014 	ldr	r3, [r4, #20]
   bc6ac:	ed838a03 	vstr	s16, [r3, #12]
   bc6b0:	e5932000 	ldr	r2, [r3]
   bc6b4:	e1a00003 	mov	r0, r3
   bc6b8:	e5835004 	str	r5, [r3, #4]
   bc6bc:	e5836010 	str	r6, [r3, #16]
   bc6c0:	e5923010 	ldr	r3, [r2, #16]
   bc6c4:	e12fff33 	blx	r3
   bc6c8:	e5943018 	ldr	r3, [r4, #24]
   bc6cc:	ed838a03 	vstr	s16, [r3, #12]
   bc6d0:	e5932000 	ldr	r2, [r3]
   bc6d4:	e1a00003 	mov	r0, r3
   bc6d8:	e5835004 	str	r5, [r3, #4]
   bc6dc:	e5836010 	str	r6, [r3, #16]
   bc6e0:	e5923010 	ldr	r3, [r2, #16]
   bc6e4:	e12fff33 	blx	r3
   bc6e8:	e594001c 	ldr	r0, [r4, #28]
   bc6ec:	ed808a03 	vstr	s16, [r0, #12]
   bc6f0:	e5805004 	str	r5, [r0, #4]
   bc6f4:	e5806010 	str	r6, [r0, #16]
   bc6f8:	eaffffc5 	b	bc614 <mixerengine::SoundColorFxManager::init(unsigned long, int)+0x140>
   bc6fc:	e320f000 	nop	{0}
	...

000bc708 <mixerengine::SoundColorFxManager::setType(djengine::EnSoundColorFxType)>:
   bc708:	e5903080 	ldr	r3, [r0, #128]	@ 0x80
   bc70c:	e3530000 	cmp	r3, #0
   bc710:	13530005 	cmpne	r3, #5
   bc714:	05801024 	streq	r1, [r0, #36]	@ 0x24
   bc718:	e12fff1e 	bx	lr

000bc71c <mixerengine::SoundColorFxManager::setColor(float)>:
   bc71c:	e5900000 	ldr	r0, [r0]
   bc720:	e1a02001 	mov	r2, r1
   bc724:	e92d4008 	push	{r3, lr}
   bc728:	e3500000 	cmp	r0, #0
   bc72c:	08bd8008 	popeq	{r3, pc}
   bc730:	e5903000 	ldr	r3, [r0]
   bc734:	e3a01007 	mov	r1, #7
   bc738:	e593300c 	ldr	r3, [r3, #12]
   bc73c:	e12fff33 	blx	r3
   bc740:	e8bd8008 	pop	{r3, pc}

000bc744 <mixerengine::SoundColorFxManager::getColor() const>:
   bc744:	e5903000 	ldr	r3, [r0]
   bc748:	e3530000 	cmp	r3, #0
   bc74c:	1593001c 	ldrne	r0, [r3, #28]
   bc750:	03a00000 	moveq	r0, #0
   bc754:	e12fff1e 	bx	lr

000bc758 <mixerengine::SoundColorFxManager::setParameter(float)>:
   bc758:	e5900000 	ldr	r0, [r0]
   bc75c:	e1a02001 	mov	r2, r1
   bc760:	e92d4008 	push	{r3, lr}
   bc764:	e3500000 	cmp	r0, #0
   bc768:	08bd8008 	popeq	{r3, pc}
   bc76c:	e5903000 	ldr	r3, [r0]
   bc770:	e3a01008 	mov	r1, #8
   bc774:	e593300c 	ldr	r3, [r3, #12]
   bc778:	e12fff33 	blx	r3
   bc77c:	e8bd8008 	pop	{r3, pc}

000bc780 <mixerengine::SoundColorFxManager::getEffectPosition() const>:
   bc780:	e5900000 	ldr	r0, [r0]
   bc784:	e3500000 	cmp	r0, #0
   bc788:	15900018 	ldrne	r0, [r0, #24]
   bc78c:	e12fff1e 	bx	lr
