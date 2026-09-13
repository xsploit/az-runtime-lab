
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000bec78 <mixerengine::SoundColorFxSweep::changeColorValue()+0x18>:
   bec78:	e5803100 	str	r3, [r0, #256]	@ 0x100
   bec7c:	e12fff1e 	bx	lr
   bec80:	447fc000 	.word	0x447fc000

000bec84 <mixerengine::SoundColorFxSweep::changeColorParameter()>:
   bec84:	e3a03001 	mov	r3, #1
   bec88:	e5c03104 	strb	r3, [r0, #260]	@ 0x104
   bec8c:	e12fff1e 	bx	lr

000bec90 <mixerengine::SoundColorFxSweep::changeCfxStatus_On()>:
   bec90:	e3a00001 	mov	r0, #1
   bec94:	e12fff1e 	bx	lr

000bec98 <mixerengine::SoundColorFxSweep::changeCfxStatus_Off()>:
   bec98:	e3a00001 	mov	r0, #1
   bec9c:	e12fff1e 	bx	lr

000beca0 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()>:
   beca0:	e92d4010 	push	{r4, lr}
   beca4:	e1a04000 	mov	r4, r0
   beca8:	e5900024 	ldr	r0, [r0, #36]	@ 0x24
   becac:	e59f3180 	ldr	r3, [pc, #384]	@ bee34 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x194>
   becb0:	e3500000 	cmp	r0, #0
   becb4:	e5843000 	str	r3, [r4]
   becb8:	0a000002 	beq	becc8 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x28>
   becbc:	e5903000 	ldr	r3, [r0]
   becc0:	e5933004 	ldr	r3, [r3, #4]
   becc4:	e12fff33 	blx	r3
   becc8:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   beccc:	e3500000 	cmp	r0, #0
   becd0:	0a000002 	beq	bece0 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x40>
   becd4:	e5903000 	ldr	r3, [r0]
   becd8:	e5933004 	ldr	r3, [r3, #4]
   becdc:	e12fff33 	blx	r3
   bece0:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   bece4:	e3500000 	cmp	r0, #0
   bece8:	0a000002 	beq	becf8 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x58>
   becec:	e5903000 	ldr	r3, [r0]
   becf0:	e5933004 	ldr	r3, [r3, #4]
   becf4:	e12fff33 	blx	r3
   becf8:	e5940030 	ldr	r0, [r4, #48]	@ 0x30
   becfc:	e3500000 	cmp	r0, #0
   bed00:	0a000002 	beq	bed10 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x70>
   bed04:	e5903000 	ldr	r3, [r0]
   bed08:	e5933004 	ldr	r3, [r3, #4]
   bed0c:	e12fff33 	blx	r3
   bed10:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   bed14:	e3500000 	cmp	r0, #0
   bed18:	0a000002 	beq	bed28 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x88>
   bed1c:	e5903000 	ldr	r3, [r0]
   bed20:	e5933004 	ldr	r3, [r3, #4]
   bed24:	e12fff33 	blx	r3
   bed28:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   bed2c:	e3500000 	cmp	r0, #0
   bed30:	0a000002 	beq	bed40 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0xa0>
   bed34:	e5903000 	ldr	r3, [r0]
   bed38:	e5933004 	ldr	r3, [r3, #4]
   bed3c:	e12fff33 	blx	r3
   bed40:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   bed44:	e3500000 	cmp	r0, #0
   bed48:	0a000002 	beq	bed58 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0xb8>
   bed4c:	e5903000 	ldr	r3, [r0]
   bed50:	e5933004 	ldr	r3, [r3, #4]
   bed54:	e12fff33 	blx	r3
   bed58:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   bed5c:	e3500000 	cmp	r0, #0
   bed60:	0a000002 	beq	bed70 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0xd0>
   bed64:	e5903000 	ldr	r3, [r0]
   bed68:	e5933004 	ldr	r3, [r3, #4]
   bed6c:	e12fff33 	blx	r3
   bed70:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   bed74:	e3500000 	cmp	r0, #0
   bed78:	0a000002 	beq	bed88 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0xe8>
   bed7c:	e5903000 	ldr	r3, [r0]
   bed80:	e5933004 	ldr	r3, [r3, #4]
   bed84:	e12fff33 	blx	r3
   bed88:	e5940048 	ldr	r0, [r4, #72]	@ 0x48
   bed8c:	e3500000 	cmp	r0, #0
   bed90:	0a000000 	beq	bed98 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0xf8>
   bed94:	ebfd40b4 	bl	f06c <operator delete[](void*)@plt>
   bed98:	e5940050 	ldr	r0, [r4, #80]	@ 0x50
   bed9c:	e3500000 	cmp	r0, #0
   beda0:	0a000000 	beq	beda8 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x108>
   beda4:	ebfd40b0 	bl	f06c <operator delete[](void*)@plt>
   beda8:	e594005c 	ldr	r0, [r4, #92]	@ 0x5c
   bedac:	e3500000 	cmp	r0, #0
   bedb0:	0a000000 	beq	bedb8 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x118>
   bedb4:	ebfd40ac 	bl	f06c <operator delete[](void*)@plt>
   bedb8:	e5940064 	ldr	r0, [r4, #100]	@ 0x64
   bedbc:	e3500000 	cmp	r0, #0
   bedc0:	0a000000 	beq	bedc8 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x128>
   bedc4:	ebfd40a8 	bl	f06c <operator delete[](void*)@plt>
   bedc8:	e594004c 	ldr	r0, [r4, #76]	@ 0x4c
   bedcc:	e3500000 	cmp	r0, #0
   bedd0:	0a000000 	beq	bedd8 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x138>
   bedd4:	ebfd40a4 	bl	f06c <operator delete[](void*)@plt>
   bedd8:	e5940054 	ldr	r0, [r4, #84]	@ 0x54
   beddc:	e3500000 	cmp	r0, #0
   bede0:	0a000000 	beq	bede8 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x148>
   bede4:	ebfd40a0 	bl	f06c <operator delete[](void*)@plt>
   bede8:	e5940060 	ldr	r0, [r4, #96]	@ 0x60
   bedec:	e3500000 	cmp	r0, #0
   bedf0:	0a000000 	beq	bedf8 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x158>
   bedf4:	ebfd409c 	bl	f06c <operator delete[](void*)@plt>
   bedf8:	e5940068 	ldr	r0, [r4, #104]	@ 0x68
   bedfc:	e3500000 	cmp	r0, #0
   bee00:	0a000000 	beq	bee08 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x168>
   bee04:	ebfd4098 	bl	f06c <operator delete[](void*)@plt>
   bee08:	e5940058 	ldr	r0, [r4, #88]	@ 0x58
   bee0c:	e3500000 	cmp	r0, #0
   bee10:	0a000000 	beq	bee18 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x178>
   bee14:	ebfd4094 	bl	f06c <operator delete[](void*)@plt>
   bee18:	e59f3018 	ldr	r3, [pc, #24]	@ bee38 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x198>
   bee1c:	e1a00004 	mov	r0, r4
   bee20:	e5843000 	str	r3, [r4]
   bee24:	e8bd8010 	pop	{r4, pc}
   bee28:	e59f3008 	ldr	r3, [pc, #8]	@ bee38 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()+0x198>
   bee2c:	e5843000 	str	r3, [r4]
   bee30:	ebfd4021 	bl	eebc <__cxa_end_cleanup@plt>
   bee34:	0042d2c8 	.word	0x0042d2c8
   bee38:	0041db60 	.word	0x0041db60

000bee3c <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()>:
   bee3c:	e92d4010 	push	{r4, lr}
   bee40:	e1a04000 	mov	r4, r0
   bee44:	ebffff95 	bl	beca0 <mixerengine::SoundColorFxSweep::~SoundColorFxSweep()>
   bee48:	e1a00004 	mov	r0, r4
   bee4c:	ebfd3f9f 	bl	ecd0 <operator delete(void*)@plt>
   bee50:	e1a00004 	mov	r0, r4
   bee54:	e8bd8010 	pop	{r4, pc}

000bee58 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()>:
   bee58:	e92d4038 	push	{r3, r4, r5, lr}
   bee5c:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   bee60:	e59f326c 	ldr	r3, [pc, #620]	@ bf0d4 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x27c>
   bee64:	f2c00010 	vmov.i32	d16, #0	@ 0x00000000
   bee68:	e1a04000 	mov	r4, r0
   bee6c:	e284c010 	add	ip, r4, #16
   bee70:	e3a02000 	mov	r2, #0
   bee74:	e3a0007f 	mov	r0, #127	@ 0x7f
   bee78:	e5931000 	ldr	r1, [r3]
   bee7c:	ee061a90 	vmov	s13, r1
   bee80:	f44c078f 	vst1.32	{d16}, [ip]
   bee84:	f2c60f10 	vmov.f32	d16, #0.5	@ 0x3f000000
   bee88:	e3a0c5f2 	mov	ip, #1015021568	@ 0x3c800000
   bee8c:	e584c070 	str	ip, [r4, #112]	@ 0x70
   bee90:	e284c01c 	add	ip, r4, #28
   bee94:	e3a03000 	mov	r3, #0
   bee98:	e5841004 	str	r1, [r4, #4]
   bee9c:	e5841008 	str	r1, [r4, #8]
   beea0:	eeb87a66 	vcvt.f32.u32	s14, s13
   beea4:	e58420e8 	str	r2, [r4, #232]	@ 0xe8
   beea8:	e5843018 	str	r3, [r4, #24]
   beeac:	e58420c8 	str	r2, [r4, #200]	@ 0xc8
   beeb0:	f44c078f 	vst1.32	{d16}, [ip]
   beeb4:	edc47a1b 	vstr	s15, [r4, #108]	@ 0x6c
   beeb8:	e59fc218 	ldr	ip, [pc, #536]	@ bf0d8 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x280>
   beebc:	e58400fc 	str	r0, [r4, #252]	@ 0xfc
   beec0:	e5840100 	str	r0, [r4, #256]	@ 0x100
   beec4:	e3a000f0 	mov	r0, #240	@ 0xf0
   beec8:	eec77a87 	vdiv.f32	s15, s15, s14
   beecc:	e58420d0 	str	r2, [r4, #208]	@ 0xd0
   beed0:	e584c000 	str	ip, [r4]
   beed4:	e5843058 	str	r3, [r4, #88]	@ 0x58
   beed8:	e58420d8 	str	r2, [r4, #216]	@ 0xd8
   beedc:	e5c43104 	strb	r3, [r4, #260]	@ 0x104
   beee0:	e5c43105 	strb	r3, [r4, #261]	@ 0x105
   beee4:	e5843108 	str	r3, [r4, #264]	@ 0x108
   beee8:	e58430ec 	str	r3, [r4, #236]	@ 0xec
   beeec:	e58430f4 	str	r3, [r4, #244]	@ 0xf4
   beef0:	e5843048 	str	r3, [r4, #72]	@ 0x48
   beef4:	e5843050 	str	r3, [r4, #80]	@ 0x50
   beef8:	e584305c 	str	r3, [r4, #92]	@ 0x5c
   beefc:	edc47a03 	vstr	s15, [r4, #12]
   bef00:	ebfd3ee8 	bl	eaa8 <operator new[](unsigned int)@plt>
   bef04:	e3a03000 	mov	r3, #0
   bef08:	e3a02000 	mov	r2, #0
   bef0c:	e5840064 	str	r0, [r4, #100]	@ 0x64
   bef10:	e3a000f0 	mov	r0, #240	@ 0xf0
   bef14:	e58420cc 	str	r2, [r4, #204]	@ 0xcc
   bef18:	e58420d4 	str	r2, [r4, #212]	@ 0xd4
   bef1c:	e58420dc 	str	r2, [r4, #220]	@ 0xdc
   bef20:	e58430f0 	str	r3, [r4, #240]	@ 0xf0
   bef24:	e58430f8 	str	r3, [r4, #248]	@ 0xf8
   bef28:	e584304c 	str	r3, [r4, #76]	@ 0x4c
   bef2c:	e5843054 	str	r3, [r4, #84]	@ 0x54
   bef30:	e5843060 	str	r3, [r4, #96]	@ 0x60
   bef34:	ebfd3edb 	bl	eaa8 <operator new[](unsigned int)@plt>
   bef38:	e5840068 	str	r0, [r4, #104]	@ 0x68
   bef3c:	e3a00048 	mov	r0, #72	@ 0x48
   bef40:	ebfd3cf8 	bl	e328 <operator new(unsigned int)@plt>
   bef44:	e1a05000 	mov	r5, r0
   bef48:	ebff7160 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   bef4c:	e5845024 	str	r5, [r4, #36]	@ 0x24
   bef50:	e3a00048 	mov	r0, #72	@ 0x48
   bef54:	ebfd3cf3 	bl	e328 <operator new(unsigned int)@plt>
   bef58:	e1a05000 	mov	r5, r0
   bef5c:	ebff715b 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   bef60:	e5845028 	str	r5, [r4, #40]	@ 0x28
   bef64:	e3a00048 	mov	r0, #72	@ 0x48
   bef68:	ebfd3cee 	bl	e328 <operator new(unsigned int)@plt>
   bef6c:	e1a05000 	mov	r5, r0
   bef70:	ebff7156 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   bef74:	e584502c 	str	r5, [r4, #44]	@ 0x2c
   bef78:	e3a00048 	mov	r0, #72	@ 0x48
   bef7c:	ebfd3ce9 	bl	e328 <operator new(unsigned int)@plt>
   bef80:	e1a05000 	mov	r5, r0
   bef84:	ebff7151 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   bef88:	e5845030 	str	r5, [r4, #48]	@ 0x30
   bef8c:	e3a00048 	mov	r0, #72	@ 0x48
   bef90:	ebfd3ce4 	bl	e328 <operator new(unsigned int)@plt>
   bef94:	e1a05000 	mov	r5, r0
   bef98:	ebff714c 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   bef9c:	e5845034 	str	r5, [r4, #52]	@ 0x34
   befa0:	e3a00048 	mov	r0, #72	@ 0x48
   befa4:	ebfd3cdf 	bl	e328 <operator new(unsigned int)@plt>
   befa8:	e1a05000 	mov	r5, r0
   befac:	ebff7147 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   befb0:	e5845038 	str	r5, [r4, #56]	@ 0x38
   befb4:	e3a00048 	mov	r0, #72	@ 0x48
   befb8:	ebfd3cda 	bl	e328 <operator new(unsigned int)@plt>
   befbc:	e1a05000 	mov	r5, r0
   befc0:	ebff7142 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   befc4:	e584503c 	str	r5, [r4, #60]	@ 0x3c
   befc8:	e3a00048 	mov	r0, #72	@ 0x48
   befcc:	ebfd3cd5 	bl	e328 <operator new(unsigned int)@plt>
   befd0:	e1a05000 	mov	r5, r0
   befd4:	ebff713d 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   befd8:	e5845040 	str	r5, [r4, #64]	@ 0x40
   befdc:	e3a00048 	mov	r0, #72	@ 0x48
   befe0:	ebfd3cd0 	bl	e328 <operator new(unsigned int)@plt>
   befe4:	e1a05000 	mov	r5, r0
   befe8:	ebff7138 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   befec:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   beff0:	e5845044 	str	r5, [r4, #68]	@ 0x44
   beff4:	e59f10e0 	ldr	r1, [pc, #224]	@ bf0dc <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x284>
   beff8:	e5903000 	ldr	r3, [r0]
   beffc:	e5933008 	ldr	r3, [r3, #8]
   bf000:	e12fff33 	blx	r3
   bf004:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   bf008:	e59f10cc 	ldr	r1, [pc, #204]	@ bf0dc <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x284>
   bf00c:	e5903000 	ldr	r3, [r0]
   bf010:	e5933008 	ldr	r3, [r3, #8]
   bf014:	e12fff33 	blx	r3
   bf018:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   bf01c:	e59f10bc 	ldr	r1, [pc, #188]	@ bf0e0 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x288>
   bf020:	e5903000 	ldr	r3, [r0]
   bf024:	e5933008 	ldr	r3, [r3, #8]
   bf028:	e12fff33 	blx	r3
   bf02c:	e5940030 	ldr	r0, [r4, #48]	@ 0x30
   bf030:	e59f10a8 	ldr	r1, [pc, #168]	@ bf0e0 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x288>
   bf034:	e5903000 	ldr	r3, [r0]
   bf038:	e5933008 	ldr	r3, [r3, #8]
   bf03c:	e12fff33 	blx	r3
   bf040:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   bf044:	e59f1090 	ldr	r1, [pc, #144]	@ bf0dc <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x284>
   bf048:	e5903000 	ldr	r3, [r0]
   bf04c:	e5933008 	ldr	r3, [r3, #8]
   bf050:	e12fff33 	blx	r3
   bf054:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   bf058:	e5903000 	ldr	r3, [r0]
   bf05c:	e5933018 	ldr	r3, [r3, #24]
   bf060:	e12fff33 	blx	r3
   bf064:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   bf068:	e5903000 	ldr	r3, [r0]
   bf06c:	e5933018 	ldr	r3, [r3, #24]
   bf070:	e12fff33 	blx	r3
   bf074:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   bf078:	e5903000 	ldr	r3, [r0]
   bf07c:	e5933018 	ldr	r3, [r3, #24]
   bf080:	e12fff33 	blx	r3
   bf084:	e5940030 	ldr	r0, [r4, #48]	@ 0x30
   bf088:	e5903000 	ldr	r3, [r0]
   bf08c:	e5933018 	ldr	r3, [r3, #24]
   bf090:	e12fff33 	blx	r3
   bf094:	e1a00004 	mov	r0, r4
   bf098:	e8bd8038 	pop	{r3, r4, r5, pc}
   bf09c:	e59f3040 	ldr	r3, [pc, #64]	@ bf0e4 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x28c>
   bf0a0:	e5843000 	str	r3, [r4]
   bf0a4:	ebfd3f84 	bl	eebc <__cxa_end_cleanup@plt>
   bf0a8:	e1a00005 	mov	r0, r5
   bf0ac:	ebfd3f07 	bl	ecd0 <operator delete(void*)@plt>
   bf0b0:	eafffff9 	b	bf09c <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x244>
   bf0b4:	eafffffb 	b	bf0a8 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x250>
   bf0b8:	eafffffa 	b	bf0a8 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x250>
   bf0bc:	eafffff9 	b	bf0a8 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x250>
   bf0c0:	eafffff8 	b	bf0a8 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x250>
   bf0c4:	eafffff7 	b	bf0a8 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x250>
   bf0c8:	eafffff6 	b	bf0a8 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x250>
   bf0cc:	eafffff5 	b	bf0a8 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x250>
   bf0d0:	eafffff4 	b	bf0a8 <mixerengine::SoundColorFxSweep::SoundColorFxSweep()+0x250>
   bf0d4:	004172c0 	.word	0x004172c0
   bf0d8:	0042d2c8 	.word	0x0042d2c8
   bf0dc:	0042d2f0 	.word	0x0042d2f0
   bf0e0:	0042d308 	.word	0x0042d308
   bf0e4:	0041db60 	.word	0x0041db60

000bf0e8 <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)>:
   bf0e8:	e3a0c000 	mov	ip, #0
   bf0ec:	e280308c 	add	r3, r0, #140	@ 0x8c
   bf0f0:	e2801094 	add	r1, r0, #148	@ 0x94
   bf0f4:	eddf4a62 	vldr	s9, [pc, #392]	@ bf284 <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x19c>
   bf0f8:	e92d00f0 	push	{r4, r5, r6, r7}
   bf0fc:	eddf3a61 	vldr	s7, [pc, #388]	@ bf288 <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x1a0>
   bf100:	e1a04000 	mov	r4, r0
   bf104:	eddf2a60 	vldr	s5, [pc, #384]	@ bf28c <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x1a4>
   bf108:	e1a0700c 	mov	r7, ip
   bf10c:	ed9f3a5f 	vldr	s6, [pc, #380]	@ bf290 <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x1a8>
   bf110:	ed9f2a5f 	vldr	s4, [pc, #380]	@ bf294 <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x1ac>
   bf114:	ed9f4a5f 	vldr	s8, [pc, #380]	@ bf298 <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x1b0>
   bf118:	eddf5a5f 	vldr	s11, [pc, #380]	@ bf29c <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x1b4>
   bf11c:	ed9f5a5f 	vldr	s10, [pc, #380]	@ bf2a0 <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x1b8>
   bf120:	ed947a21 	vldr	s14, [r4, #132]	@ 0x84
   bf124:	edd37a00 	vldr	s15, [r3]
   bf128:	ee777a67 	vsub.f32	s15, s14, s15
   bf12c:	eef47ae4 	vcmpe.f32	s15, s9
   bf130:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf134:	5a000005 	bpl	bf150 <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x68>
   bf138:	eef47ac4 	vcmpe.f32	s15, s8
   bf13c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf140:	c580709c 	strgt	r7, [r0, #156]	@ 0x9c
   bf144:	cdc15a00 	vstrgt	s11, [r1]
   bf148:	cd837a00 	vstrgt	s14, [r3]
   bf14c:	ca000004 	bgt	bf164 <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x7c>
   bf150:	e590509c 	ldr	r5, [r0, #156]	@ 0x9c
   bf154:	e3550000 	cmp	r5, #0
   bf158:	10855002 	addne	r5, r5, r2
   bf15c:	1580509c 	strne	r5, [r0, #156]	@ 0x9c
   bf160:	0a000035 	beq	bf23c <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x154>
   bf164:	e3520000 	cmp	r2, #0
   bf168:	edd47a1d 	vldr	s15, [r4, #116]	@ 0x74
   bf16c:	ed947a1f 	vldr	s14, [r4, #124]	@ 0x7c
   bf170:	da000021 	ble	bf1fc <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x114>
   bf174:	e3a05000 	mov	r5, #0
   bf178:	ed936a00 	vldr	s12, [r3]
   bf17c:	edd16a00 	vldr	s13, [r1]
   bf180:	ee766a26 	vadd.f32	s13, s12, s13
   bf184:	edc36a00 	vstr	s13, [r3]
   bf188:	e594605c 	ldr	r6, [r4, #92]	@ 0x5c
   bf18c:	ed946a28 	vldr	s12, [r4, #160]	@ 0xa0
   bf190:	ee266a86 	vmul.f32	s12, s13, s12
   bf194:	e0866105 	add	r6, r6, r5, lsl #2
   bf198:	edd66a00 	vldr	s13, [r6]
   bf19c:	e5946048 	ldr	r6, [r4, #72]	@ 0x48
   bf1a0:	e0866185 	add	r6, r6, r5, lsl #3
   bf1a4:	e2855001 	add	r5, r5, #1
   bf1a8:	edd60b00 	vldr	d16, [r6]
   bf1ac:	eef47ae6 	vcmpe.f32	s15, s13
   bf1b0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf1b4:	4e766ae7 	vsubmi.f32	s13, s13, s15
   bf1b8:	4dd41a2a 	vldrmi	s3, [r4, #168]	@ 0xa8
   bf1bc:	5dd46a2c 	vldrpl	s13, [r4, #176]	@ 0xb0
   bf1c0:	4e467aa1 	vmlami.f32	s15, s13, s3
   bf1c4:	5e677aa6 	vmulpl.f32	s15, s15, s13
   bf1c8:	eef47ac6 	vcmpe.f32	s15, s12
   bf1cc:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf1d0:	cdd46a2e 	vldrgt	s13, [r4, #184]	@ 0xb8
   bf1d4:	ce366a87 	vaddgt.f32	s12, s13, s14
   bf1d8:	ddd46a30 	vldrle	s13, [r4, #192]	@ 0xc0
   bf1dc:	ce076a66 	vmlsgt.f32	s12, s14, s13
   bf1e0:	de277a26 	vmulle.f32	s14, s14, s13
   bf1e4:	ceb07a46 	vmovgt.f32	s14, s12
   bf1e8:	e1550002 	cmp	r5, r2
   bf1ec:	f3f41c07 	vdup.32	d17, d7[0]
   bf1f0:	f3410db0 	vmul.f32	d16, d17, d16
   bf1f4:	edc60b00 	vstr	d16, [r6]
   bf1f8:	1affffde 	bne	bf178 <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x90>
   bf1fc:	eef47a45 	vcmp.f32	s15, s10
   bf200:	e28cc001 	add	ip, ip, #1
   bf204:	e2833004 	add	r3, r3, #4
   bf208:	e2811004 	add	r1, r1, #4
   bf20c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf210:	eeb47a45 	vcmp.f32	s14, s10
   bf214:	4ef07a65 	vmovmi.f32	s15, s11
   bf218:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf21c:	4eb07a65 	vmovmi.f32	s14, s11
   bf220:	e35c0002 	cmp	ip, #2
   bf224:	edc47a1d 	vstr	s15, [r4, #116]	@ 0x74
   bf228:	ed847a1f 	vstr	s14, [r4, #124]	@ 0x7c
   bf22c:	e2844004 	add	r4, r4, #4
   bf230:	1affffba 	bne	bf120 <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x38>
   bf234:	e8bd00f0 	pop	{r4, r5, r6, r7}
   bf238:	e12fff1e 	bx	lr
   bf23c:	eef47ae3 	vcmpe.f32	s15, s7
   bf240:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf244:	5a000002 	bpl	bf254 <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x16c>
   bf248:	eef47ac2 	vcmpe.f32	s15, s4
   bf24c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf250:	ca000005 	bgt	bf26c <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x184>
   bf254:	ee677aa2 	vmul.f32	s15, s15, s5
   bf258:	ee077ac3 	vmls.f32	s14, s15, s6
   bf25c:	ed837a00 	vstr	s14, [r3]
   bf260:	edc17a00 	vstr	s15, [r1]
   bf264:	e580209c 	str	r2, [r0, #156]	@ 0x9c
   bf268:	eaffffbd 	b	bf164 <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x7c>
   bf26c:	edd06a1c 	vldr	s13, [r0, #112]	@ 0x70
   bf270:	ee677aa6 	vmul.f32	s15, s15, s13
   bf274:	ee062a10 	vmov	s12, r2
   bf278:	eef86ac6 	vcvt.f32.s32	s13, s12
   bf27c:	ee077ae6 	vmls.f32	s14, s15, s13
   bf280:	eafffff5 	b	bf25c <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)+0x174>
   bf284:	37800000 	.word	0x37800000
   bf288:	3c800000 	.word	0x3c800000
   bf28c:	3c000000 	.word	0x3c000000
   bf290:	43000000 	.word	0x43000000
   bf294:	bc800000 	.word	0xbc800000
   bf298:	b7800000 	.word	0xb7800000
   bf29c:	00000000 	.word	0x00000000
   bf2a0:	34000000 	.word	0x34000000

000bf2a4 <mixerengine::SoundColorFxSweep::sweepProcess(common::Float2 const*, int)>:
   bf2a4:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
   bf2a8:	e2423001 	sub	r3, r2, #1
   bf2ac:	e1a05002 	mov	r5, r2
   bf2b0:	e1a02182 	lsl	r2, r2, #3
   bf2b4:	e2822008 	add	r2, r2, #8
   bf2b8:	e28db014 	add	fp, sp, #20
   bf2bc:	e3730001 	cmn	r3, #1
   bf2c0:	e04dd002 	sub	sp, sp, r2
   bf2c4:	e1a04000 	mov	r4, r0
   bf2c8:	e1a02001 	mov	r2, r1
   bf2cc:	e1a0600d 	mov	r6, sp
   bf2d0:	0a000005 	beq	bf2ec <mixerengine::SoundColorFxSweep::sweepProcess(common::Float2 const*, int)+0x48>
   bf2d4:	e1a0000d 	mov	r0, sp
   bf2d8:	eddf0b3c 	vldr	d16, [pc, #240]	@ bf3d0 <mixerengine::SoundColorFxSweep::sweepProcess(common::Float2 const*, int)+0x12c>
   bf2dc:	e2433001 	sub	r3, r3, #1
   bf2e0:	ece00b02 	vstmia	r0!, {d16}
   bf2e4:	e3730001 	cmn	r3, #1
   bf2e8:	1afffffb 	bne	bf2dc <mixerengine::SoundColorFxSweep::sweepProcess(common::Float2 const*, int)+0x38>
   bf2ec:	e3550000 	cmp	r5, #0
   bf2f0:	d5941058 	ldrle	r1, [r4, #88]	@ 0x58
   bf2f4:	da000017 	ble	bf358 <mixerengine::SoundColorFxSweep::sweepProcess(common::Float2 const*, int)+0xb4>
   bf2f8:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   bf2fc:	e5941058 	ldr	r1, [r4, #88]	@ 0x58
   bf300:	e3a03000 	mov	r3, #0
   bf304:	eddf6a33 	vldr	s13, [pc, #204]	@ bf3d8 <mixerengine::SoundColorFxSweep::sweepProcess(common::Float2 const*, int)+0x134>
   bf308:	eeb05a08 	vmov.f32	s10, #8	@ 0x40400000  3.0
   bf30c:	edd47a3a 	vldr	s15, [r4, #232]	@ 0xe8
   bf310:	ee777aa6 	vadd.f32	s15, s15, s13
   bf314:	e0810183 	add	r0, r1, r3, lsl #3
   bf318:	e2833001 	add	r3, r3, #1
   bf31c:	ecf21b02 	vldmia	r2!, {d17}
   bf320:	eef47ac7 	vcmpe.f32	s15, s14
   bf324:	edc47a3a 	vstr	s15, [r4, #232]	@ 0xe8
   bf328:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf32c:	de775aa7 	vaddle.f32	s11, s15, s15
   bf330:	cd847a3a 	vstrgt	s14, [r4, #232]	@ 0xe8
   bf334:	de276aa7 	vmulle.f32	s12, s15, s15
   bf338:	de757a65 	vsuble.f32	s15, s10, s11
   bf33c:	de667a27 	vmulle.f32	s15, s12, s15
   bf340:	cef77a00 	vmovgt.f32	s15, #112	@ 0x3f800000  1.0
   bf344:	e1530005 	cmp	r3, r5
   bf348:	f3fc0c07 	vdup.32	d16, d7[1]
   bf34c:	f3400db1 	vmul.f32	d16, d16, d17
   bf350:	edc00b00 	vstr	d16, [r0]
   bf354:	1affffec 	bne	bf30c <mixerengine::SoundColorFxSweep::sweepProcess(common::Float2 const*, int)+0x68>
   bf358:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   bf35c:	e1a02006 	mov	r2, r6
   bf360:	e1a03005 	mov	r3, r5
   bf364:	e590c000 	ldr	ip, [r0]
   bf368:	e59cc014 	ldr	ip, [ip, #20]
   bf36c:	e12fff3c 	blx	ip
   bf370:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   bf374:	e1a01006 	mov	r1, r6
   bf378:	e5942058 	ldr	r2, [r4, #88]	@ 0x58
   bf37c:	e1a03005 	mov	r3, r5
   bf380:	e590c000 	ldr	ip, [r0]
   bf384:	e59cc014 	ldr	ip, [ip, #20]
   bf388:	e12fff3c 	blx	ip
   bf38c:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   bf390:	e1a02006 	mov	r2, r6
   bf394:	e5941058 	ldr	r1, [r4, #88]	@ 0x58
   bf398:	e1a03005 	mov	r3, r5
   bf39c:	e590c000 	ldr	ip, [r0]
   bf3a0:	e59cc014 	ldr	ip, [ip, #20]
   bf3a4:	e12fff3c 	blx	ip
   bf3a8:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   bf3ac:	e1a01006 	mov	r1, r6
   bf3b0:	e5942058 	ldr	r2, [r4, #88]	@ 0x58
   bf3b4:	e1a03005 	mov	r3, r5
   bf3b8:	e590c000 	ldr	ip, [r0]
   bf3bc:	e59cc014 	ldr	ip, [ip, #20]
   bf3c0:	e12fff3c 	blx	ip
   bf3c4:	e24bd014 	sub	sp, fp, #20
   bf3c8:	e8bd8878 	pop	{r3, r4, r5, r6, fp, pc}
   bf3cc:	ebfd3eba 	bl	eebc <__cxa_end_cleanup@plt>
	...
   bf3d8:	3c000000 	.word	0x3c000000

000bf3dc <mixerengine::SoundColorFxSweep::markLevelMemory(float const*, float*, int)>:
   bf3dc:	e3530000 	cmp	r3, #0
   bf3e0:	d12fff1e 	bxle	lr
   bf3e4:	e2811004 	add	r1, r1, #4
   bf3e8:	e3a00000 	mov	r0, #0
   bf3ec:	ed117a01 	vldr	s14, [r1, #-4]
   bf3f0:	eeb57ac0 	vcmpe.f32	s14, #0.0
   bf3f4:	e1a0c001 	mov	ip, r1
   bf3f8:	eddc7a00 	vldr	s15, [ip]
   bf3fc:	e2800001 	add	r0, r0, #1
   bf400:	e2811008 	add	r1, r1, #8
   bf404:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf408:	eeb16a47 	vneg.f32	s12, s14
   bf40c:	eef57ac0 	vcmpe.f32	s15, #0.0
   bf410:	eef16a67 	vneg.f32	s13, s15
   bf414:	4eb07a46 	vmovmi.f32	s14, s12
   bf418:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf41c:	4ef07a66 	vmovmi.f32	s15, s13
   bf420:	eeb47ae7 	vcmpe.f32	s14, s15
   bf424:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf428:	4eb07a67 	vmovmi.f32	s14, s15
   bf42c:	e1500003 	cmp	r0, r3
   bf430:	eca27a01 	vstmia	r2!, {s14}
   bf434:	1affffec 	bne	bf3ec <mixerengine::SoundColorFxSweep::markLevelMemory(float const*, float*, int)+0x10>
   bf438:	e12fff1e 	bx	lr

000bf43c <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)>:
   bf43c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   bf440:	e28db020 	add	fp, sp, #32
   bf444:	e24dd00c 	sub	sp, sp, #12
   bf448:	e1a05000 	mov	r5, r0
   bf44c:	e1a03202 	lsl	r3, r2, #4
   bf450:	e2833008 	add	r3, r3, #8
   bf454:	e1a08002 	mov	r8, r2
   bf458:	e5900024 	ldr	r0, [r0, #36]	@ 0x24
   bf45c:	e04dd003 	sub	sp, sp, r3
   bf460:	e5952050 	ldr	r2, [r5, #80]	@ 0x50
   bf464:	e1a03008 	mov	r3, r8
   bf468:	e1a06001 	mov	r6, r1
   bf46c:	e1a0400d 	mov	r4, sp
   bf470:	e590c000 	ldr	ip, [r0]
   bf474:	e59cc014 	ldr	ip, [ip, #20]
   bf478:	e12fff3c 	blx	ip
   bf47c:	e5950028 	ldr	r0, [r5, #40]	@ 0x28
   bf480:	e1a03008 	mov	r3, r8
   bf484:	e5951050 	ldr	r1, [r5, #80]	@ 0x50
   bf488:	e5952048 	ldr	r2, [r5, #72]	@ 0x48
   bf48c:	e590c000 	ldr	ip, [r0]
   bf490:	e59cc014 	ldr	ip, [ip, #20]
   bf494:	e12fff3c 	blx	ip
   bf498:	e595002c 	ldr	r0, [r5, #44]	@ 0x2c
   bf49c:	e1a01006 	mov	r1, r6
   bf4a0:	e5952054 	ldr	r2, [r5, #84]	@ 0x54
   bf4a4:	e1a03008 	mov	r3, r8
   bf4a8:	e590c000 	ldr	ip, [r0]
   bf4ac:	e59cc014 	ldr	ip, [ip, #20]
   bf4b0:	e12fff3c 	blx	ip
   bf4b4:	e5950030 	ldr	r0, [r5, #48]	@ 0x30
   bf4b8:	e1a03008 	mov	r3, r8
   bf4bc:	e5951054 	ldr	r1, [r5, #84]	@ 0x54
   bf4c0:	e595204c 	ldr	r2, [r5, #76]	@ 0x4c
   bf4c4:	e590c000 	ldr	ip, [r0]
   bf4c8:	e59cc014 	ldr	ip, [ip, #20]
   bf4cc:	e12fff3c 	blx	ip
   bf4d0:	e1a09188 	lsl	r9, r8, #3
   bf4d4:	e1a06088 	lsl	r6, r8, #1
   bf4d8:	e1a07005 	mov	r7, r5
   bf4dc:	e1a00005 	mov	r0, r5
   bf4e0:	e1a09129 	lsr	r9, r9, #2
   bf4e4:	e3a0e000 	mov	lr, #0
   bf4e8:	e3580000 	cmp	r8, #0
   bf4ec:	c3a03000 	movgt	r3, #0
   bf4f0:	c00c0e99 	mulgt	ip, r9, lr
   bf4f4:	da000008 	ble	bf51c <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)+0xe0>
   bf4f8:	e5901048 	ldr	r1, [r0, #72]	@ 0x48
   bf4fc:	e08c2003 	add	r2, ip, r3
   bf500:	e0811103 	add	r1, r1, r3, lsl #2
   bf504:	e2833002 	add	r3, r3, #2
   bf508:	e0842102 	add	r2, r4, r2, lsl #2
   bf50c:	e1530006 	cmp	r3, r6
   bf510:	edd10b00 	vldr	d16, [r1]
   bf514:	f442078f 	vst1.32	{d16}, [r2]
   bf518:	1afffff6 	bne	bf4f8 <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)+0xbc>
   bf51c:	e28ee001 	add	lr, lr, #1
   bf520:	e2800004 	add	r0, r0, #4
   bf524:	e35e0002 	cmp	lr, #2
   bf528:	1affffee 	bne	bf4e8 <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)+0xac>
   bf52c:	e595205c 	ldr	r2, [r5, #92]	@ 0x5c
   bf530:	e1a00005 	mov	r0, r5
   bf534:	e1a01004 	mov	r1, r4
   bf538:	e1a03008 	mov	r3, r8
   bf53c:	ebffffa6 	bl	bf3dc <mixerengine::SoundColorFxSweep::markLevelMemory(float const*, float*, int)>
   bf540:	e1a00005 	mov	r0, r5
   bf544:	e0841109 	add	r1, r4, r9, lsl #2
   bf548:	e5952060 	ldr	r2, [r5, #96]	@ 0x60
   bf54c:	e1a03008 	mov	r3, r8
   bf550:	ebffffa1 	bl	bf3dc <mixerengine::SoundColorFxSweep::markLevelMemory(float const*, float*, int)>
   bf554:	eeb65a08 	vmov.f32	s10, #104	@ 0x3f400000  0.750
   bf558:	ed9f6a7b 	vldr	s12, [pc, #492]	@ bf74c <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)+0x310>
   bf55c:	e28500d0 	add	r0, r5, #208	@ 0xd0
   bf560:	e28510c8 	add	r1, r5, #200	@ 0xc8
   bf564:	e28550d8 	add	r5, r5, #216	@ 0xd8
   bf568:	e3a0c000 	mov	ip, #0
   bf56c:	e50b4028 	str	r4, [fp, #-40]	@ 0xffffffd8
   bf570:	eef06a46 	vmov.f32	s13, s12
   bf574:	e3560000 	cmp	r6, #0
   bf578:	da000011 	ble	bf5c4 <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)+0x188>
   bf57c:	e0020c99 	mul	r2, r9, ip
   bf580:	e51b4028 	ldr	r4, [fp, #-40]	@ 0xffffffd8
   bf584:	e3a03000 	mov	r3, #0
   bf588:	e2422001 	sub	r2, r2, #1
   bf58c:	e0842102 	add	r2, r4, r2, lsl #2
   bf590:	e2822004 	add	r2, r2, #4
   bf594:	edd27a00 	vldr	s15, [r2]
   bf598:	eef47ae6 	vcmpe.f32	s15, s13
   bf59c:	e1a04002 	mov	r4, r2
   bf5a0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf5a4:	cef06a67 	vmovgt.f32	s13, s15
   bf5a8:	ca000002 	bgt	bf5b8 <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)+0x17c>
   bf5ac:	eef47a46 	vcmp.f32	s15, s12
   bf5b0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf5b4:	4eb06a67 	vmovmi.f32	s12, s15
   bf5b8:	e2833001 	add	r3, r3, #1
   bf5bc:	e1530006 	cmp	r3, r6
   bf5c0:	1afffff2 	bne	bf590 <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)+0x154>
   bf5c4:	ee767a86 	vadd.f32	s15, s13, s12
   bf5c8:	e30025bf 	movw	r2, #1471	@ 0x5bf
   bf5cc:	eef57ac0 	vcmpe.f32	s15, #0.0
   bf5d0:	edd07a00 	vldr	s15, [r0]
   bf5d4:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf5d8:	4ef16a46 	vnegmi.f32	s13, s12
   bf5dc:	eef47ae6 	vcmpe.f32	s15, s13
   bf5e0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf5e4:	4dc06a00 	vstrmi	s13, [r0]
   bf5e8:	e59730ec 	ldr	r3, [r7, #236]	@ 0xec
   bf5ec:	e0883003 	add	r3, r8, r3
   bf5f0:	e58730ec 	str	r3, [r7, #236]	@ 0xec
   bf5f4:	e1530002 	cmp	r3, r2
   bf5f8:	da000038 	ble	bf6e0 <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)+0x2a4>
   bf5fc:	e3a03000 	mov	r3, #0
   bf600:	e3a02000 	mov	r2, #0
   bf604:	e58730ec 	str	r3, [r7, #236]	@ 0xec
   bf608:	e5852000 	str	r2, [r5]
   bf60c:	e5812000 	str	r2, [r1]
   bf610:	e1a02003 	mov	r2, r3
   bf614:	e5974064 	ldr	r4, [r7, #100]	@ 0x64
   bf618:	e28430f0 	add	r3, r4, #240	@ 0xf0
   bf61c:	e1a0a004 	mov	sl, r4
   bf620:	e5134008 	ldr	r4, [r3, #-8]
   bf624:	e2822001 	add	r2, r2, #1
   bf628:	e5234004 	str	r4, [r3, #-4]!
   bf62c:	ed537a01 	vldr	s15, [r3, #-4]
   bf630:	ed957a00 	vldr	s14, [r5]
   bf634:	eeb47ae7 	vcmpe.f32	s14, s15
   bf638:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf63c:	4dc57a00 	vstrmi	s15, [r5]
   bf640:	e3520024 	cmp	r2, #36	@ 0x24
   bf644:	1afffff5 	bne	bf620 <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)+0x1e4>
   bf648:	e1a0400a 	mov	r4, sl
   bf64c:	e28a3060 	add	r3, sl, #96	@ 0x60
   bf650:	e3a02017 	mov	r2, #23
   bf654:	e1a0a005 	mov	sl, r5
   bf658:	e5135008 	ldr	r5, [r3, #-8]
   bf65c:	e5235004 	str	r5, [r3, #-4]!
   bf660:	ed537a01 	vldr	s15, [r3, #-4]
   bf664:	ed917a00 	vldr	s14, [r1]
   bf668:	eeb47ae7 	vcmpe.f32	s14, s15
   bf66c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf670:	4dc17a00 	vstrmi	s15, [r1]
   bf674:	e2522001 	subs	r2, r2, #1
   bf678:	1afffff6 	bne	bf658 <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)+0x21c>
   bf67c:	e5903000 	ldr	r3, [r0]
   bf680:	e1a0500a 	mov	r5, sl
   bf684:	e5843000 	str	r3, [r4]
   bf688:	edd17a00 	vldr	s15, [r1]
   bf68c:	ed907a00 	vldr	s14, [r0]
   bf690:	eeb47ae7 	vcmpe.f32	s14, s15
   bf694:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf698:	cef07a47 	vmovgt.f32	s15, s14
   bf69c:	cd817a00 	vstrgt	s14, [r1]
   bf6a0:	ed9a7a00 	vldr	s14, [sl]
   bf6a4:	eeb47ae7 	vcmpe.f32	s14, s15
   bf6a8:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf6ac:	4dca7a00 	vstrmi	s15, [sl]
   bf6b0:	edd75a21 	vldr	s11, [r7, #132]	@ 0x84
   bf6b4:	eef45ae7 	vcmpe.f32	s11, s15
   bf6b8:	4eb07a67 	vmovmi.f32	s14, s15
   bf6bc:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf6c0:	5a00000f 	bpl	bf704 <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)+0x2c8>
   bf6c4:	edc77a21 	vstr	s15, [r7, #132]	@ 0x84
   bf6c8:	e3a04000 	mov	r4, #0
   bf6cc:	e3a02000 	mov	r2, #0
   bf6d0:	e58740f4 	str	r4, [r7, #244]	@ 0xf4
   bf6d4:	e5812000 	str	r2, [r1]
   bf6d8:	e3a02000 	mov	r2, #0
   bf6dc:	e5802000 	str	r2, [r0]
   bf6e0:	e28cc001 	add	ip, ip, #1
   bf6e4:	e2877004 	add	r7, r7, #4
   bf6e8:	e35c0002 	cmp	ip, #2
   bf6ec:	e2800004 	add	r0, r0, #4
   bf6f0:	e2811004 	add	r1, r1, #4
   bf6f4:	e2855004 	add	r5, r5, #4
   bf6f8:	1affff9d 	bne	bf574 <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)+0x138>
   bf6fc:	e24bd020 	sub	sp, fp, #32
   bf700:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
   bf704:	ee655a85 	vmul.f32	s11, s11, s10
   bf708:	eef45ae7 	vcmpe.f32	s11, s15
   bf70c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf710:	d3a03000 	movle	r3, #0
   bf714:	d58730f4 	strle	r3, [r7, #244]	@ 0xf4
   bf718:	daffffee 	ble	bf6d8 <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)+0x29c>
   bf71c:	e59730f4 	ldr	r3, [r7, #244]	@ 0xf4
   bf720:	e353003b 	cmp	r3, #59	@ 0x3b
   bf724:	cd877a21 	vstrgt	s14, [r7, #132]	@ 0x84
   bf728:	d2833001 	addle	r3, r3, #1
   bf72c:	d58730f4 	strle	r3, [r7, #244]	@ 0xf4
   bf730:	c3a03000 	movgt	r3, #0
   bf734:	c3a02000 	movgt	r2, #0
   bf738:	c58730f4 	strgt	r3, [r7, #244]	@ 0xf4
   bf73c:	ce072a90 	vmovgt	s15, r2
   bf740:	cdc17a00 	vstrgt	s15, [r1]
   bf744:	eaffffe3 	b	bf6d8 <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)+0x29c>
   bf748:	ebfd3ddb 	bl	eebc <__cxa_end_cleanup@plt>
   bf74c:	00000000 	.word	0x00000000

000bf750 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)>:
   bf750:	eef66a00 	vmov.f32	s13, #96	@ 0x3f000000  0.5
   bf754:	ed907a08 	vldr	s14, [r0, #32]
   bf758:	eddf5a56 	vldr	s11, [pc, #344]	@ bf8b8 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x168>
   bf75c:	eddf7a56 	vldr	s15, [pc, #344]	@ bf8bc <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x16c>
   bf760:	ee061a10 	vmov	s12, r1
   bf764:	ee477a25 	vmla.f32	s15, s14, s11
   bf768:	eeb47ae6 	vcmpe.f32	s14, s13
   bf76c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf770:	ae377a66 	vsubge.f32	s14, s14, s13
   bf774:	aef05a08 	vmovge.f32	s11, #8	@ 0x40400000  3.0
   bf778:	aef76a00 	vmovge.f32	s13, #112	@ 0x3f800000  1.0
   bf77c:	ae476a25 	vmlage.f32	s13, s14, s11
   bf780:	ed9f7a4e 	vldr	s14, [pc, #312]	@ bf8c0 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x170>
   bf784:	eeb46ac7 	vcmpe.f32	s12, s14
   bf788:	bef06a67 	vmovlt.f32	s13, s15
   bf78c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf790:	ca00002a 	bgt	bf840 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0xf0>
   bf794:	ed9f7a4a 	vldr	s14, [pc, #296]	@ bf8c4 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x174>
   bf798:	ee665a07 	vmul.f32	s11, s12, s14
   bf79c:	eddf1b39 	vldr	d17, [pc, #228]	@ bf888 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x138>
   bf7a0:	ed9f4a48 	vldr	s8, [pc, #288]	@ bf8c8 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x178>
   bf7a4:	eddf0b39 	vldr	d16, [pc, #228]	@ bf890 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x140>
   bf7a8:	ed9f5a47 	vldr	s10, [pc, #284]	@ bf8cc <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x17c>
   bf7ac:	ed9f6a47 	vldr	s12, [pc, #284]	@ bf8d0 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x180>
   bf7b0:	e30f3427 	movw	r3, #62503	@ 0xf427
   bf7b4:	e3433f7f 	movt	r3, #16255	@ 0x3f7f
   bf7b8:	e58030b0 	str	r3, [r0, #176]	@ 0xb0
   bf7bc:	e58030b4 	str	r3, [r0, #180]	@ 0xb4
   bf7c0:	e304327b 	movw	r3, #17019	@ 0x427b
   bf7c4:	e3433aae 	movt	r3, #15022	@ 0x3aae
   bf7c8:	e58030b8 	str	r3, [r0, #184]	@ 0xb8
   bf7cc:	e3a03001 	mov	r3, #1
   bf7d0:	e5c03105 	strb	r3, [r0, #261]	@ 0x105
   bf7d4:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   bf7d8:	eef04a47 	vmov.f32	s9, s14
   bf7dc:	ed807a2a 	vstr	s14, [r0, #168]	@ 0xa8
   bf7e0:	ed807a2b 	vstr	s14, [r0, #172]	@ 0xac
   bf7e4:	ed807a2f 	vstr	s14, [r0, #188]	@ 0xbc
   bf7e8:	ee454ae5 	vmls.f32	s9, s11, s11
   bf7ec:	ee377a65 	vsub.f32	s14, s14, s11
   bf7f0:	eddf5a37 	vldr	s11, [pc, #220]	@ bf8d4 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x184>
   bf7f4:	eef72ae4 	vcvt.f64.f32	d18, s9
   bf7f8:	ee277a07 	vmul.f32	s14, s14, s14
   bf7fc:	ee622ba1 	vmul.f64	d18, d18, d17
   bf800:	ee644aa5 	vmul.f32	s9, s9, s11
   bf804:	eddf5a33 	vldr	s11, [pc, #204]	@ bf8d8 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x188>
   bf808:	eef71ae7 	vcvt.f64.f32	d17, s15
   bf80c:	ee675a25 	vmul.f32	s11, s14, s11
   bf810:	ee420ba1 	vmla.f64	d16, d18, d17
   bf814:	ee277a04 	vmul.f32	s14, s14, s8
   bf818:	ee046aa7 	vmla.f32	s12, s9, s15
   bf81c:	eef07a45 	vmov.f32	s15, s10
   bf820:	ed806a28 	vstr	s12, [r0, #160]	@ 0xa0
   bf824:	ee457ae6 	vmls.f32	s15, s11, s13
   bf828:	ee075a66 	vmls.f32	s10, s14, s13
   bf82c:	edc07a30 	vstr	s15, [r0, #192]	@ 0xc0
   bf830:	eef77be0 	vcvt.f32.f64	s15, d16
   bf834:	ed805a31 	vstr	s10, [r0, #196]	@ 0xc4
   bf838:	edc07a29 	vstr	s15, [r0, #164]	@ 0xa4
   bf83c:	e12fff1e 	bx	lr
   bf840:	e3a03000 	mov	r3, #0
   bf844:	e5c03105 	strb	r3, [r0, #261]	@ 0x105
   bf848:	e28030a0 	add	r3, r0, #160	@ 0xa0
   bf84c:	eddf0b11 	vldr	d16, [pc, #68]	@ bf898 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x148>
   bf850:	f443078f 	vst1.32	{d16}, [r3]
   bf854:	f2c70f10 	vmov.f32	d16, #1	@ 0x3f800000
   bf858:	e28030a8 	add	r3, r0, #168	@ 0xa8
   bf85c:	f443078f 	vst1.32	{d16}, [r3]
   bf860:	e28030b0 	add	r3, r0, #176	@ 0xb0
   bf864:	eddf0b0d 	vldr	d16, [pc, #52]	@ bf8a0 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x150>
   bf868:	f443078f 	vst1.32	{d16}, [r3]
   bf86c:	e28030b8 	add	r3, r0, #184	@ 0xb8
   bf870:	e28000c0 	add	r0, r0, #192	@ 0xc0
   bf874:	eddf0b0b 	vldr	d16, [pc, #44]	@ bf8a8 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x158>
   bf878:	f443078f 	vst1.32	{d16}, [r3]
   bf87c:	eddf0b0b 	vldr	d16, [pc, #44]	@ bf8b0 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)+0x160>
   bf880:	f440078f 	vst1.32	{d16}, [r0]
   bf884:	e12fff1e 	bx	lr
   bf888:	5c28f5c3 	.word	0x5c28f5c3
   bf88c:	3fcdc28f 	.word	0x3fcdc28f
   bf890:	60000000 	.word	0x60000000
   bf894:	3fd51eb8 	.word	0x3fd51eb8
   bf898:	3e75c28f 	.word	0x3e75c28f
   bf89c:	3ea8f5c3 	.word	0x3ea8f5c3
   bf8a0:	3f7ff427 	.word	0x3f7ff427
   bf8a4:	3f7ff427 	.word	0x3f7ff427
   bf8a8:	3aae427b 	.word	0x3aae427b
   bf8ac:	3f800000 	.word	0x3f800000
   bf8b0:	3f7ffa13 	.word	0x3f7ffa13
   bf8b4:	3f7ffa13 	.word	0x3f7ffa13
   bf8b8:	3fb851ec 	.word	0x3fb851ec
   bf8bc:	3e8f5c29 	.word	0x3e8f5c29
   bf8c0:	42d60000 	.word	0x42d60000
   bf8c4:	3c191f1a 	.word	0x3c191f1a
   bf8c8:	39bb3836 	.word	0x39bb3836
   bf8cc:	3f7ffa13 	.word	0x3f7ffa13
   bf8d0:	3e75c28f 	.word	0x3e75c28f
   bf8d4:	3eb851ec 	.word	0x3eb851ec
   bf8d8:	3ac18174 	.word	0x3ac18174

000bf8dc <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)>:
   bf8dc:	ee071a90 	vmov	s15, r1
   bf8e0:	ed9f7acd 	vldr	s14, [pc, #820]	@ bfc1c <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x340>
   bf8e4:	eef47ac7 	vcmpe.f32	s15, s14
   bf8e8:	ed906a08 	vldr	s12, [r0, #32]
   bf8ec:	e92d4010 	push	{r4, lr}
   bf8f0:	ed2d8b08 	vpush	{d8-d11}
   bf8f4:	e1a04000 	mov	r4, r0
   bf8f8:	e24dd018 	sub	sp, sp, #24
   bf8fc:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf900:	8a000010 	bhi	bf948 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x6c>
   bf904:	ed9f8ac5 	vldr	s16, [pc, #788]	@ bfc20 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x344>
   bf908:	edd07a38 	vldr	s15, [r0, #224]	@ 0xe0
   bf90c:	eef47a48 	vcmp.f32	s15, s16
   bf910:	e3a03000 	mov	r3, #0
   bf914:	e5c03105 	strb	r3, [r0, #261]	@ 0x105
   bf918:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf91c:	1a0000ad 	bne	bfbd8 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x2fc>
   bf920:	eeb38a04 	vmov.f32	s16, #52	@ 0x41a00000  20.0
   bf924:	edd47a39 	vldr	s15, [r4, #228]	@ 0xe4
   bf928:	eef47a48 	vcmp.f32	s15, s16
   bf92c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf930:	1a00009c 	bne	bfba8 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x2cc>
   bf934:	e3a03000 	mov	r3, #0
   bf938:	e5843108 	str	r3, [r4, #264]	@ 0x108
   bf93c:	e28dd018 	add	sp, sp, #24
   bf940:	ecbd8b08 	vpop	{d8-d11}
   bf944:	e8bd8010 	pop	{r4, pc}
   bf948:	eef65a00 	vmov.f32	s11, #96	@ 0x3f000000  0.5
   bf94c:	ee374ac7 	vsub.f32	s8, s15, s14
   bf950:	ed9f7ab3 	vldr	s14, [pc, #716]	@ bfc24 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x348>
   bf954:	eef76a00 	vmov.f32	s13, #112	@ 0x3f800000  1.0
   bf958:	eeb46ae5 	vcmpe.f32	s12, s11
   bf95c:	ee446a47 	vmls.f32	s13, s8, s14
   bf960:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bf964:	4d9f7aaf 	vldrmi	s14, [pc, #700]	@ bfc28 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x34c>
   bf968:	4ddf5aaf 	vldrmi	s11, [pc, #700]	@ bfc2c <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x350>
   bf96c:	4e266a07 	vmulmi.f32	s12, s12, s14
   bf970:	5e366a65 	vsubpl.f32	s12, s12, s11
   bf974:	5ddf5aad 	vldrpl	s11, [pc, #692]	@ bfc30 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x354>
   bf978:	5eb17a00 	vmovpl.f32	s14, #16	@ 0x40800000  4.0
   bf97c:	5e266a07 	vmulpl.f32	s12, s12, s14
   bf980:	4e366a06 	vaddmi.f32	s12, s12, s12
   bf984:	eefd3ac6 	vcvt.s32.f32	s7, s12
   bf988:	eeb87ae3 	vcvt.f32.s32	s14, s7
   bf98c:	ee131a90 	vmov	r1, s7
   bf990:	ee366a47 	vsub.f32	s12, s12, s14
   bf994:	4eb05a65 	vmovmi.f32	s10, s11
   bf998:	5eb05a65 	vmovpl.f32	s10, s11
   bf99c:	e3510000 	cmp	r1, #0
   bf9a0:	ee263a06 	vmul.f32	s6, s12, s12
   bf9a4:	da000008 	ble	bf9cc <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0xf0>
   bf9a8:	e3a03000 	mov	r3, #0
   bf9ac:	e3a02001 	mov	r2, #1
   bf9b0:	e2833001 	add	r3, r3, #1
   bf9b4:	e1a02082 	lsl	r2, r2, #1
   bf9b8:	e1530001 	cmp	r3, r1
   bf9bc:	1afffffb 	bne	bf9b0 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0xd4>
   bf9c0:	ee042a90 	vmov	s9, r2
   bf9c4:	eeb87ae4 	vcvt.f32.s32	s14, s9
   bf9c8:	ee655a07 	vmul.f32	s11, s10, s14
   bf9cc:	eeb35a00 	vmov.f32	s10, #48	@ 0x41800000  16.0
   bf9d0:	ed9f7a97 	vldr	s14, [pc, #604]	@ bfc34 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x358>
   bf9d4:	eddf4a97 	vldr	s9, [pc, #604]	@ bfc38 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x35c>
   bf9d8:	ee663a85 	vmul.f32	s7, s13, s10
   bf9dc:	eeb75a00 	vmov.f32	s10, #112	@ 0x3f800000  1.0
   bf9e0:	ee037aa6 	vmla.f32	s14, s7, s13
   bf9e4:	eddf6a94 	vldr	s13, [pc, #592]	@ bfc3c <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x360>
   bf9e8:	eef03a45 	vmov.f32	s7, s10
   bf9ec:	ee463a26 	vmla.f32	s7, s12, s13
   bf9f0:	ee856a07 	vdiv.f32	s12, s10, s14
   bf9f4:	eef06a63 	vmov.f32	s13, s7
   bf9f8:	eddf3a90 	vldr	s7, [pc, #576]	@ bfc40 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x364>
   bf9fc:	ee436a23 	vmla.f32	s13, s6, s7
   bfa00:	ee666aa5 	vmul.f32	s13, s13, s11
   bfa04:	eef47ae4 	vcmpe.f32	s15, s9
   bfa08:	ee268a87 	vmul.f32	s16, s13, s14
   bfa0c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bfa10:	ee668a86 	vmul.f32	s17, s13, s12
   bfa14:	4a000010 	bmi	bfa5c <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x180>
   bfa18:	e5943108 	ldr	r3, [r4, #264]	@ 0x108
   bfa1c:	ed9f7a88 	vldr	s14, [pc, #544]	@ bfc44 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x368>
   bfa20:	e3530001 	cmp	r3, #1
   bfa24:	0a00001f 	beq	bfaa8 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x1cc>
   bfa28:	edd47a38 	vldr	s15, [r4, #224]	@ 0xe0
   bfa2c:	eef47a48 	vcmp.f32	s15, s16
   bfa30:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bfa34:	1a0000c3 	bne	bfd48 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x46c>
   bfa38:	edd47a39 	vldr	s15, [r4, #228]	@ 0xe4
   bfa3c:	eef47a68 	vcmp.f32	s15, s17
   bfa40:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bfa44:	1a000086 	bne	bfc64 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x388>
   bfa48:	e3a03000 	mov	r3, #0
   bfa4c:	e5843108 	str	r3, [r4, #264]	@ 0x108
   bfa50:	e3a03001 	mov	r3, #1
   bfa54:	e5c43105 	strb	r3, [r4, #261]	@ 0x105
   bfa58:	eaffffb7 	b	bf93c <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x60>
   bfa5c:	ed9f6a79 	vldr	s12, [pc, #484]	@ bfc48 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x36c>
   bfa60:	ee646a06 	vmul.f32	s13, s8, s12
   bfa64:	eddf5a6d 	vldr	s11, [pc, #436]	@ bfc20 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x344>
   bfa68:	e5943108 	ldr	r3, [r4, #264]	@ 0x108
   bfa6c:	ed9f7a74 	vldr	s14, [pc, #464]	@ bfc44 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x368>
   bfa70:	e3530001 	cmp	r3, #1
   bfa74:	ee355a66 	vsub.f32	s10, s10, s13
   bfa78:	ee254a25 	vmul.f32	s8, s10, s11
   bfa7c:	eef35a04 	vmov.f32	s11, #52	@ 0x41a00000  20.0
   bfa80:	ee655a25 	vmul.f32	s11, s10, s11
   bfa84:	ed9f5a70 	vldr	s10, [pc, #448]	@ bfc4c <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x370>
   bfa88:	ee747ae7 	vsub.f32	s15, s9, s15
   bfa8c:	ee064a88 	vmla.f32	s8, s13, s16
   bfa90:	ee465aa8 	vmla.f32	s11, s13, s17
   bfa94:	ee677a85 	vmul.f32	s15, s15, s10
   bfa98:	eeb08a44 	vmov.f32	s16, s8
   bfa9c:	eef08a65 	vmov.f32	s17, s11
   bfaa0:	ee077a86 	vmla.f32	s14, s15, s12
   bfaa4:	1affffdf 	bne	bfa28 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x14c>
   bfaa8:	edd47a39 	vldr	s15, [r4, #228]	@ 0xe4
   bfaac:	eef47a68 	vcmp.f32	s15, s17
   bfab0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bfab4:	1a0000db 	bne	bfe28 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x54c>
   bfab8:	edd47a38 	vldr	s15, [r4, #224]	@ 0xe0
   bfabc:	eef47a48 	vcmp.f32	s15, s16
   bfac0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bfac4:	0affffdf 	beq	bfa48 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x16c>
   bfac8:	ee377a07 	vadd.f32	s14, s14, s14
   bfacc:	eddf9a61 	vldr	s19, [pc, #388]	@ bfc58 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x37c>
   bfad0:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   bfad4:	e28d1004 	add	r1, sp, #4
   bfad8:	e5903000 	ldr	r3, [r0]
   bfadc:	e5933008 	ldr	r3, [r3, #8]
   bfae0:	ee687a07 	vmul.f32	s15, s16, s14
   bfae4:	ed9f7a5c 	vldr	s14, [pc, #368]	@ bfc5c <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x380>
   bfae8:	ee686a08 	vmul.f32	s13, s16, s16
   bfaec:	ee677aa9 	vmul.f32	s15, s15, s19
   bfaf0:	ee668a87 	vmul.f32	s17, s13, s14
   bfaf4:	eeb19a00 	vmov.f32	s18, #16	@ 0x40800000  4.0
   bfaf8:	ee377aa8 	vadd.f32	s14, s15, s17
   bfafc:	eeb7aa00 	vmov.f32	s20, #112	@ 0x3f800000  1.0
   bfb00:	ee377a09 	vadd.f32	s14, s14, s18
   bfb04:	ee8a7a07 	vdiv.f32	s14, s20, s14
   bfb08:	ee386ae7 	vsub.f32	s12, s17, s15
   bfb0c:	ee78aac9 	vsub.f32	s21, s17, s18
   bfb10:	ee687a87 	vmul.f32	s15, s17, s14
   bfb14:	ee366a09 	vadd.f32	s12, s12, s18
   bfb18:	edcd7a01 	vstr	s15, [sp, #4]
   bfb1c:	edcd7a03 	vstr	s15, [sp, #12]
   bfb20:	ee7aaaaa 	vadd.f32	s21, s21, s21
   bfb24:	ee676a2a 	vmul.f32	s13, s14, s21
   bfb28:	ee277a06 	vmul.f32	s14, s14, s12
   bfb2c:	edcd6a04 	vstr	s13, [sp, #16]
   bfb30:	ee777aa7 	vadd.f32	s15, s15, s15
   bfb34:	ed8d7a05 	vstr	s14, [sp, #20]
   bfb38:	edcd7a02 	vstr	s15, [sp, #8]
   bfb3c:	e12fff33 	blx	r3
   bfb40:	eddf7a46 	vldr	s15, [pc, #280]	@ bfc60 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x384>
   bfb44:	ee687a27 	vmul.f32	s15, s16, s15
   bfb48:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   bfb4c:	e28d1004 	add	r1, sp, #4
   bfb50:	e5903000 	ldr	r3, [r0]
   bfb54:	e5933008 	ldr	r3, [r3, #8]
   bfb58:	ee677aa9 	vmul.f32	s15, s15, s19
   bfb5c:	ee387aa7 	vadd.f32	s14, s17, s15
   bfb60:	ee377a09 	vadd.f32	s14, s14, s18
   bfb64:	ee8a7a07 	vdiv.f32	s14, s20, s14
   bfb68:	ee786ae7 	vsub.f32	s13, s17, s15
   bfb6c:	ee687a87 	vmul.f32	s15, s17, s14
   bfb70:	ee369a89 	vadd.f32	s18, s13, s18
   bfb74:	edcd7a01 	vstr	s15, [sp, #4]
   bfb78:	edcd7a03 	vstr	s15, [sp, #12]
   bfb7c:	ee6a6a87 	vmul.f32	s13, s21, s14
   bfb80:	ee277a09 	vmul.f32	s14, s14, s18
   bfb84:	edcd6a04 	vstr	s13, [sp, #16]
   bfb88:	ee777aa7 	vadd.f32	s15, s15, s15
   bfb8c:	ed8d7a05 	vstr	s14, [sp, #20]
   bfb90:	edcd7a02 	vstr	s15, [sp, #8]
   bfb94:	e12fff33 	blx	r3
   bfb98:	e3a03000 	mov	r3, #0
   bfb9c:	ed848a38 	vstr	s16, [r4, #224]	@ 0xe0
   bfba0:	e5843108 	str	r3, [r4, #264]	@ 0x108
   bfba4:	eaffffa9 	b	bfa50 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x174>
   bfba8:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   bfbac:	e59f109c 	ldr	r1, [pc, #156]	@ bfc50 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x374>
   bfbb0:	e5903000 	ldr	r3, [r0]
   bfbb4:	e5933008 	ldr	r3, [r3, #8]
   bfbb8:	e12fff33 	blx	r3
   bfbbc:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   bfbc0:	e59f1088 	ldr	r1, [pc, #136]	@ bfc50 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x374>
   bfbc4:	e5903000 	ldr	r3, [r0]
   bfbc8:	e5933008 	ldr	r3, [r3, #8]
   bfbcc:	e12fff33 	blx	r3
   bfbd0:	ed848a39 	vstr	s16, [r4, #228]	@ 0xe4
   bfbd4:	eaffff56 	b	bf934 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x58>
   bfbd8:	e5900038 	ldr	r0, [r0, #56]	@ 0x38
   bfbdc:	e59f1070 	ldr	r1, [pc, #112]	@ bfc54 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x378>
   bfbe0:	e5903000 	ldr	r3, [r0]
   bfbe4:	e5933008 	ldr	r3, [r3, #8]
   bfbe8:	e12fff33 	blx	r3
   bfbec:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   bfbf0:	e59f105c 	ldr	r1, [pc, #92]	@ bfc54 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x378>
   bfbf4:	e5903000 	ldr	r3, [r0]
   bfbf8:	e5933008 	ldr	r3, [r3, #8]
   bfbfc:	e12fff33 	blx	r3
   bfc00:	ed848a38 	vstr	s16, [r4, #224]	@ 0xe0
   bfc04:	eeb38a04 	vmov.f32	s16, #52	@ 0x41a00000  20.0
   bfc08:	edd47a39 	vldr	s15, [r4, #228]	@ 0xe4
   bfc0c:	eef47a48 	vcmp.f32	s15, s16
   bfc10:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bfc14:	0affff46 	beq	bf934 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x58>
   bfc18:	eaffffe2 	b	bfba8 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x2cc>
   bfc1c:	43020000 	.word	0x43020000
   bfc20:	469c4000 	.word	0x469c4000
   bfc24:	3c031203 	.word	0x3c031203
   bfc28:	40549a78 	.word	0x40549a78
   bfc2c:	43480000 	.word	0x43480000
   bfc30:	44fa0000 	.word	0x44fa0000
   bfc34:	3fb33333 	.word	0x3fb33333
   bfc38:	43220000 	.word	0x43220000
   bfc3c:	3f282799 	.word	0x3f282799
   bfc40:	3eafb0ce 	.word	0x3eafb0ce
   bfc44:	3f353bef 	.word	0x3f353bef
   bfc48:	3d000000 	.word	0x3d000000
   bfc4c:	3e99999a 	.word	0x3e99999a
   bfc50:	0042d338 	.word	0x0042d338
   bfc54:	0042d320 	.word	0x0042d320
   bfc58:	39155ff9 	.word	0x39155ff9
   bfc5c:	32ae5ec9 	.word	0x32ae5ec9
   bfc60:	400f9e4d 	.word	0x400f9e4d
   bfc64:	ee377a07 	vadd.f32	s14, s14, s14
   bfc68:	ed5f9a06 	vldr	s19, [pc, #-24]	@ bfc58 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x37c>
   bfc6c:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   bfc70:	e28d1004 	add	r1, sp, #4
   bfc74:	e5903000 	ldr	r3, [r0]
   bfc78:	e5933008 	ldr	r3, [r3, #8]
   bfc7c:	ee687a87 	vmul.f32	s15, s17, s14
   bfc80:	ee686aa8 	vmul.f32	s13, s17, s17
   bfc84:	ee277aa9 	vmul.f32	s14, s15, s19
   bfc88:	ed5f7a0d 	vldr	s15, [pc, #-52]	@ bfc5c <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x380>
   bfc8c:	ee268aa7 	vmul.f32	s16, s13, s15
   bfc90:	eeb19a00 	vmov.f32	s18, #16	@ 0x40800000  4.0
   bfc94:	ee777a08 	vadd.f32	s15, s14, s16
   bfc98:	eeb7aa00 	vmov.f32	s20, #112	@ 0x3f800000  1.0
   bfc9c:	ee777a89 	vadd.f32	s15, s15, s18
   bfca0:	eeca7a27 	vdiv.f32	s15, s20, s15
   bfca4:	ee786a47 	vsub.f32	s13, s16, s14
   bfca8:	ee38ba49 	vsub.f32	s22, s16, s18
   bfcac:	ee277a89 	vmul.f32	s14, s15, s18
   bfcb0:	ee766a89 	vadd.f32	s13, s13, s18
   bfcb4:	ed8d7a01 	vstr	s14, [sp, #4]
   bfcb8:	ed8d7a03 	vstr	s14, [sp, #12]
   bfcbc:	ee3bba0b 	vadd.f32	s22, s22, s22
   bfcc0:	eef8aa00 	vmov.f32	s21, #128	@ 0xc0000000 -2.0
   bfcc4:	ee276a2a 	vmul.f32	s12, s14, s21
   bfcc8:	ee277a8b 	vmul.f32	s14, s15, s22
   bfccc:	ed8d6a02 	vstr	s12, [sp, #8]
   bfcd0:	ee677aa6 	vmul.f32	s15, s15, s13
   bfcd4:	ed8d7a04 	vstr	s14, [sp, #16]
   bfcd8:	edcd7a05 	vstr	s15, [sp, #20]
   bfcdc:	e12fff33 	blx	r3
   bfce0:	ed5f7a22 	vldr	s15, [pc, #-136]	@ bfc60 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x384>
   bfce4:	ee687aa7 	vmul.f32	s15, s17, s15
   bfce8:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   bfcec:	e28d1004 	add	r1, sp, #4
   bfcf0:	e5903000 	ldr	r3, [r0]
   bfcf4:	e5933008 	ldr	r3, [r3, #8]
   bfcf8:	ee277aa9 	vmul.f32	s14, s15, s19
   bfcfc:	ee787a07 	vadd.f32	s15, s16, s14
   bfd00:	ee777a89 	vadd.f32	s15, s15, s18
   bfd04:	eeca7a27 	vdiv.f32	s15, s20, s15
   bfd08:	ee388a47 	vsub.f32	s16, s16, s14
   bfd0c:	ee277a89 	vmul.f32	s14, s15, s18
   bfd10:	ee389a09 	vadd.f32	s18, s16, s18
   bfd14:	ed8d7a01 	vstr	s14, [sp, #4]
   bfd18:	ed8d7a03 	vstr	s14, [sp, #12]
   bfd1c:	ee676a2a 	vmul.f32	s13, s14, s21
   bfd20:	ee2b7a27 	vmul.f32	s14, s22, s15
   bfd24:	edcd6a02 	vstr	s13, [sp, #8]
   bfd28:	ee677a89 	vmul.f32	s15, s15, s18
   bfd2c:	ed8d7a04 	vstr	s14, [sp, #16]
   bfd30:	edcd7a05 	vstr	s15, [sp, #20]
   bfd34:	e12fff33 	blx	r3
   bfd38:	e3a03000 	mov	r3, #0
   bfd3c:	edc48a39 	vstr	s17, [r4, #228]	@ 0xe4
   bfd40:	e5843108 	str	r3, [r4, #264]	@ 0x108
   bfd44:	eaffff41 	b	bfa50 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x174>
   bfd48:	ee377a07 	vadd.f32	s14, s14, s14
   bfd4c:	ed5f9a3f 	vldr	s19, [pc, #-252]	@ bfc58 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x37c>
   bfd50:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   bfd54:	e28d1004 	add	r1, sp, #4
   bfd58:	e5903000 	ldr	r3, [r0]
   bfd5c:	e5933008 	ldr	r3, [r3, #8]
   bfd60:	ee687a07 	vmul.f32	s15, s16, s14
   bfd64:	ed1f7a44 	vldr	s14, [pc, #-272]	@ bfc5c <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x380>
   bfd68:	ee686a08 	vmul.f32	s13, s16, s16
   bfd6c:	ee677aa9 	vmul.f32	s15, s15, s19
   bfd70:	ee668a87 	vmul.f32	s17, s13, s14
   bfd74:	eeb19a00 	vmov.f32	s18, #16	@ 0x40800000  4.0
   bfd78:	ee377aa8 	vadd.f32	s14, s15, s17
   bfd7c:	eeb7aa00 	vmov.f32	s20, #112	@ 0x3f800000  1.0
   bfd80:	ee377a09 	vadd.f32	s14, s14, s18
   bfd84:	ee8a7a07 	vdiv.f32	s14, s20, s14
   bfd88:	ee386ae7 	vsub.f32	s12, s17, s15
   bfd8c:	ee78aac9 	vsub.f32	s21, s17, s18
   bfd90:	ee687a87 	vmul.f32	s15, s17, s14
   bfd94:	ee366a09 	vadd.f32	s12, s12, s18
   bfd98:	edcd7a01 	vstr	s15, [sp, #4]
   bfd9c:	edcd7a03 	vstr	s15, [sp, #12]
   bfda0:	ee7aaaaa 	vadd.f32	s21, s21, s21
   bfda4:	ee676a2a 	vmul.f32	s13, s14, s21
   bfda8:	ee277a06 	vmul.f32	s14, s14, s12
   bfdac:	edcd6a04 	vstr	s13, [sp, #16]
   bfdb0:	ee777aa7 	vadd.f32	s15, s15, s15
   bfdb4:	ed8d7a05 	vstr	s14, [sp, #20]
   bfdb8:	edcd7a02 	vstr	s15, [sp, #8]
   bfdbc:	e12fff33 	blx	r3
   bfdc0:	ed5f7a5a 	vldr	s15, [pc, #-360]	@ bfc60 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x384>
   bfdc4:	ee687a27 	vmul.f32	s15, s16, s15
   bfdc8:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   bfdcc:	e28d1004 	add	r1, sp, #4
   bfdd0:	e5903000 	ldr	r3, [r0]
   bfdd4:	e5933008 	ldr	r3, [r3, #8]
   bfdd8:	ee677aa9 	vmul.f32	s15, s15, s19
   bfddc:	ee387aa7 	vadd.f32	s14, s17, s15
   bfde0:	ee377a09 	vadd.f32	s14, s14, s18
   bfde4:	ee8a7a07 	vdiv.f32	s14, s20, s14
   bfde8:	ee786ae7 	vsub.f32	s13, s17, s15
   bfdec:	ee687a87 	vmul.f32	s15, s17, s14
   bfdf0:	ee369a89 	vadd.f32	s18, s13, s18
   bfdf4:	edcd7a01 	vstr	s15, [sp, #4]
   bfdf8:	edcd7a03 	vstr	s15, [sp, #12]
   bfdfc:	ee6a6a87 	vmul.f32	s13, s21, s14
   bfe00:	ee277a09 	vmul.f32	s14, s14, s18
   bfe04:	edcd6a04 	vstr	s13, [sp, #16]
   bfe08:	ee777aa7 	vadd.f32	s15, s15, s15
   bfe0c:	ed8d7a05 	vstr	s14, [sp, #20]
   bfe10:	edcd7a02 	vstr	s15, [sp, #8]
   bfe14:	e12fff33 	blx	r3
   bfe18:	e3a03001 	mov	r3, #1
   bfe1c:	ed848a38 	vstr	s16, [r4, #224]	@ 0xe0
   bfe20:	e5843108 	str	r3, [r4, #264]	@ 0x108
   bfe24:	eaffff09 	b	bfa50 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x174>
   bfe28:	ee377a07 	vadd.f32	s14, s14, s14
   bfe2c:	ed1faa77 	vldr	s20, [pc, #-476]	@ bfc58 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x37c>
   bfe30:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   bfe34:	e28d1004 	add	r1, sp, #4
   bfe38:	e5903000 	ldr	r3, [r0]
   bfe3c:	e5933008 	ldr	r3, [r3, #8]
   bfe40:	ee687a87 	vmul.f32	s15, s17, s14
   bfe44:	ee686aa8 	vmul.f32	s13, s17, s17
   bfe48:	ee277a8a 	vmul.f32	s14, s15, s20
   bfe4c:	ed5f7a7e 	vldr	s15, [pc, #-504]	@ bfc5c <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x380>
   bfe50:	ee269aa7 	vmul.f32	s18, s13, s15
   bfe54:	eef19a00 	vmov.f32	s19, #16	@ 0x40800000  4.0
   bfe58:	ee777a09 	vadd.f32	s15, s14, s18
   bfe5c:	eef7aa00 	vmov.f32	s21, #112	@ 0x3f800000  1.0
   bfe60:	ee777aa9 	vadd.f32	s15, s15, s19
   bfe64:	eeca7aa7 	vdiv.f32	s15, s21, s15
   bfe68:	ee796a47 	vsub.f32	s13, s18, s14
   bfe6c:	ee79ba69 	vsub.f32	s23, s18, s19
   bfe70:	ee277aa9 	vmul.f32	s14, s15, s19
   bfe74:	ee766aa9 	vadd.f32	s13, s13, s19
   bfe78:	ed8d7a01 	vstr	s14, [sp, #4]
   bfe7c:	ed8d7a03 	vstr	s14, [sp, #12]
   bfe80:	ee7bbaab 	vadd.f32	s23, s23, s23
   bfe84:	eeb8ba00 	vmov.f32	s22, #128	@ 0xc0000000 -2.0
   bfe88:	ee276a0b 	vmul.f32	s12, s14, s22
   bfe8c:	ee277aab 	vmul.f32	s14, s15, s23
   bfe90:	ed8d6a02 	vstr	s12, [sp, #8]
   bfe94:	ee677aa6 	vmul.f32	s15, s15, s13
   bfe98:	ed8d7a04 	vstr	s14, [sp, #16]
   bfe9c:	edcd7a05 	vstr	s15, [sp, #20]
   bfea0:	e12fff33 	blx	r3
   bfea4:	ed5f7a93 	vldr	s15, [pc, #-588]	@ bfc60 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x384>
   bfea8:	ee687aa7 	vmul.f32	s15, s17, s15
   bfeac:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   bfeb0:	e28d1004 	add	r1, sp, #4
   bfeb4:	e5903000 	ldr	r3, [r0]
   bfeb8:	e5933008 	ldr	r3, [r3, #8]
   bfebc:	ee277a8a 	vmul.f32	s14, s15, s20
   bfec0:	ee797a07 	vadd.f32	s15, s18, s14
   bfec4:	ee777aa9 	vadd.f32	s15, s15, s19
   bfec8:	eeca7aa7 	vdiv.f32	s15, s21, s15
   bfecc:	ee399a47 	vsub.f32	s18, s18, s14
   bfed0:	ee277aa9 	vmul.f32	s14, s15, s19
   bfed4:	ee799a29 	vadd.f32	s19, s18, s19
   bfed8:	ed8d7a01 	vstr	s14, [sp, #4]
   bfedc:	ed8d7a03 	vstr	s14, [sp, #12]
   bfee0:	ee676a0b 	vmul.f32	s13, s14, s22
   bfee4:	ee2b7aa7 	vmul.f32	s14, s23, s15
   bfee8:	edcd6a02 	vstr	s13, [sp, #8]
   bfeec:	ee677aa9 	vmul.f32	s15, s15, s19
   bfef0:	ed8d7a04 	vstr	s14, [sp, #16]
   bfef4:	edcd7a05 	vstr	s15, [sp, #20]
   bfef8:	e12fff33 	blx	r3
   bfefc:	edd47a38 	vldr	s15, [r4, #224]	@ 0xe0
   bff00:	eef47a48 	vcmp.f32	s15, s16
   bff04:	edc48a39 	vstr	s17, [r4, #228]	@ 0xe4
   bff08:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bff0c:	13a03002 	movne	r3, #2
   bff10:	15843108 	strne	r3, [r4, #264]	@ 0x108
   bff14:	1afffecd 	bne	bfa50 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x174>
   bff18:	eafffeca 	b	bfa48 <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)+0x16c>

000bff1c <mixerengine::SoundColorFxSweep::calcParameter()>:
   bff1c:	e59030fc 	ldr	r3, [r0, #252]	@ 0xfc
   bff20:	e5902100 	ldr	r2, [r0, #256]	@ 0x100
   bff24:	e92d4010 	push	{r4, lr}
   bff28:	e1530002 	cmp	r3, r2
   bff2c:	b2833001 	addlt	r3, r3, #1
   bff30:	e1a04000 	mov	r4, r0
   bff34:	b58030fc 	strlt	r3, [r0, #252]	@ 0xfc
   bff38:	ba000001 	blt	bff44 <mixerengine::SoundColorFxSweep::calcParameter()+0x28>
   bff3c:	c2433001 	subgt	r3, r3, #1
   bff40:	c58030fc 	strgt	r3, [r0, #252]	@ 0xfc
   bff44:	ee073a10 	vmov	s14, r3
   bff48:	eef87ac7 	vcvt.f32.s32	s15, s14
   bff4c:	ed9f7a0c 	vldr	s14, [pc, #48]	@ bff84 <mixerengine::SoundColorFxSweep::calcParameter()+0x68>
   bff50:	e1a00004 	mov	r0, r4
   bff54:	eef47ac7 	vcmpe.f32	s15, s14
   bff58:	ee171a90 	vmov	r1, s15
   bff5c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bff60:	9a000003 	bls	bff74 <mixerengine::SoundColorFxSweep::calcParameter()+0x58>
   bff64:	ebfffe5c 	bl	bf8dc <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)>
   bff68:	e3a03000 	mov	r3, #0
   bff6c:	e5c43104 	strb	r3, [r4, #260]	@ 0x104
   bff70:	e8bd8010 	pop	{r4, pc}
   bff74:	ebfffdf5 	bl	bf750 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)>
   bff78:	e3a03000 	mov	r3, #0
   bff7c:	e5c43104 	strb	r3, [r4, #260]	@ 0x104
   bff80:	e8bd8010 	pop	{r4, pc}
   bff84:	42fe0000 	.word	0x42fe0000

000bff88 <mixerengine::SoundColorFxSweep::initialize()>:
   bff88:	e92d45f8 	push	{r3, r4, r5, r6, r7, r8, sl, lr}
   bff8c:	ed2d8b02 	vpush	{d8}
   bff90:	e1a04000 	mov	r4, r0
   bff94:	e5903010 	ldr	r3, [r0, #16]
   bff98:	e5902014 	ldr	r2, [r0, #20]
   bff9c:	e1530002 	cmp	r3, r2
   bffa0:	0a000043 	beq	c00b4 <mixerengine::SoundColorFxSweep::initialize()+0x12c>
   bffa4:	ee073a10 	vmov	s14, r3
   bffa8:	eef87ac7 	vcvt.f32.s32	s15, s14
   bffac:	e1a08183 	lsl	r8, r3, #3
   bffb0:	e2435001 	sub	r5, r3, #1
   bffb4:	e1a0a103 	lsl	sl, r3, #2
   bffb8:	e1a06000 	mov	r6, r0
   bffbc:	e3a07002 	mov	r7, #2
   bffc0:	ed9f8b8c 	vldr	d8, [pc, #560]	@ c01f8 <mixerengine::SoundColorFxSweep::initialize()+0x270>
   bffc4:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   bffc8:	eec77a27 	vdiv.f32	s15, s14, s15
   bffcc:	edc07a1c 	vstr	s15, [r0, #112]	@ 0x70
   bffd0:	e5960048 	ldr	r0, [r6, #72]	@ 0x48
   bffd4:	e3500000 	cmp	r0, #0
   bffd8:	0a000000 	beq	bffe0 <mixerengine::SoundColorFxSweep::initialize()+0x58>
   bffdc:	ebfd3c22 	bl	f06c <operator delete[](void*)@plt>
   bffe0:	e1a00008 	mov	r0, r8
   bffe4:	ebfd3aaf 	bl	eaa8 <operator new[](unsigned int)@plt>
   bffe8:	e3750001 	cmn	r5, #1
   bffec:	0a000005 	beq	c0008 <mixerengine::SoundColorFxSweep::initialize()+0x80>
   bfff0:	e1a02000 	mov	r2, r0
   bfff4:	e1a03005 	mov	r3, r5
   bfff8:	e2433001 	sub	r3, r3, #1
   bfffc:	eca28b02 	vstmia	r2!, {d8}
   c0000:	e3730001 	cmn	r3, #1
   c0004:	1afffffb 	bne	bfff8 <mixerengine::SoundColorFxSweep::initialize()+0x70>
   c0008:	e5963050 	ldr	r3, [r6, #80]	@ 0x50
   c000c:	e5860048 	str	r0, [r6, #72]	@ 0x48
   c0010:	e3530000 	cmp	r3, #0
   c0014:	0a000001 	beq	c0020 <mixerengine::SoundColorFxSweep::initialize()+0x98>
   c0018:	e1a00003 	mov	r0, r3
   c001c:	ebfd3c12 	bl	f06c <operator delete[](void*)@plt>
   c0020:	e1a00008 	mov	r0, r8
   c0024:	ebfd3a9f 	bl	eaa8 <operator new[](unsigned int)@plt>
   c0028:	e3750001 	cmn	r5, #1
   c002c:	0a000005 	beq	c0048 <mixerengine::SoundColorFxSweep::initialize()+0xc0>
   c0030:	e1a02000 	mov	r2, r0
   c0034:	e1a03005 	mov	r3, r5
   c0038:	e2433001 	sub	r3, r3, #1
   c003c:	eca28b02 	vstmia	r2!, {d8}
   c0040:	e3730001 	cmn	r3, #1
   c0044:	1afffffb 	bne	c0038 <mixerengine::SoundColorFxSweep::initialize()+0xb0>
   c0048:	e596305c 	ldr	r3, [r6, #92]	@ 0x5c
   c004c:	e5860050 	str	r0, [r6, #80]	@ 0x50
   c0050:	e3530000 	cmp	r3, #0
   c0054:	0a000001 	beq	c0060 <mixerengine::SoundColorFxSweep::initialize()+0xd8>
   c0058:	e1a00003 	mov	r0, r3
   c005c:	ebfd3c02 	bl	f06c <operator delete[](void*)@plt>
   c0060:	e1a0000a 	mov	r0, sl
   c0064:	ebfd3a8f 	bl	eaa8 <operator new[](unsigned int)@plt>
   c0068:	e2577001 	subs	r7, r7, #1
   c006c:	e586005c 	str	r0, [r6, #92]	@ 0x5c
   c0070:	e2866004 	add	r6, r6, #4
   c0074:	1affffd5 	bne	bffd0 <mixerengine::SoundColorFxSweep::initialize()+0x48>
   c0078:	e5940058 	ldr	r0, [r4, #88]	@ 0x58
   c007c:	e3500000 	cmp	r0, #0
   c0080:	0a000000 	beq	c0088 <mixerengine::SoundColorFxSweep::initialize()+0x100>
   c0084:	ebfd3bf8 	bl	f06c <operator delete[](void*)@plt>
   c0088:	e1a00008 	mov	r0, r8
   c008c:	ebfd3a85 	bl	eaa8 <operator new[](unsigned int)@plt>
   c0090:	e3750001 	cmn	r5, #1
   c0094:	0a000005 	beq	c00b0 <mixerengine::SoundColorFxSweep::initialize()+0x128>
   c0098:	e1a03000 	mov	r3, r0
   c009c:	eddf0b55 	vldr	d16, [pc, #340]	@ c01f8 <mixerengine::SoundColorFxSweep::initialize()+0x270>
   c00a0:	e2455001 	sub	r5, r5, #1
   c00a4:	ece30b02 	vstmia	r3!, {d16}
   c00a8:	e3750001 	cmn	r5, #1
   c00ac:	1afffffb 	bne	c00a0 <mixerengine::SoundColorFxSweep::initialize()+0x118>
   c00b0:	e5840058 	str	r0, [r4, #88]	@ 0x58
   c00b4:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   c00b8:	e5903000 	ldr	r3, [r0]
   c00bc:	e5933018 	ldr	r3, [r3, #24]
   c00c0:	e12fff33 	blx	r3
   c00c4:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   c00c8:	e59f1138 	ldr	r1, [pc, #312]	@ c0208 <mixerengine::SoundColorFxSweep::initialize()+0x280>
   c00cc:	e5903000 	ldr	r3, [r0]
   c00d0:	e5933008 	ldr	r3, [r3, #8]
   c00d4:	e12fff33 	blx	r3
   c00d8:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   c00dc:	e59f1124 	ldr	r1, [pc, #292]	@ c0208 <mixerengine::SoundColorFxSweep::initialize()+0x280>
   c00e0:	e5903000 	ldr	r3, [r0]
   c00e4:	e5933008 	ldr	r3, [r3, #8]
   c00e8:	e12fff33 	blx	r3
   c00ec:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   c00f0:	e59f1114 	ldr	r1, [pc, #276]	@ c020c <mixerengine::SoundColorFxSweep::initialize()+0x284>
   c00f4:	e5903000 	ldr	r3, [r0]
   c00f8:	e5933008 	ldr	r3, [r3, #8]
   c00fc:	e12fff33 	blx	r3
   c0100:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   c0104:	e59f1100 	ldr	r1, [pc, #256]	@ c020c <mixerengine::SoundColorFxSweep::initialize()+0x284>
   c0108:	e5903000 	ldr	r3, [r0]
   c010c:	e5933008 	ldr	r3, [r3, #8]
   c0110:	e12fff33 	blx	r3
   c0114:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   c0118:	e3a03901 	mov	r3, #16384	@ 0x4000
   c011c:	e344369c 	movt	r3, #18076	@ 0x469c
   c0120:	e58430e0 	str	r3, [r4, #224]	@ 0xe0
   c0124:	e3a02000 	mov	r2, #0
   c0128:	e5903000 	ldr	r3, [r0]
   c012c:	e34421a0 	movt	r2, #16800	@ 0x41a0
   c0130:	e5933018 	ldr	r3, [r3, #24]
   c0134:	e58420e4 	str	r2, [r4, #228]	@ 0xe4
   c0138:	e12fff33 	blx	r3
   c013c:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   c0140:	e5903000 	ldr	r3, [r0]
   c0144:	e5933018 	ldr	r3, [r3, #24]
   c0148:	e12fff33 	blx	r3
   c014c:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   c0150:	e5903000 	ldr	r3, [r0]
   c0154:	e5933018 	ldr	r3, [r3, #24]
   c0158:	e12fff33 	blx	r3
   c015c:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   c0160:	e5903000 	ldr	r3, [r0]
   c0164:	e5933018 	ldr	r3, [r3, #24]
   c0168:	e12fff33 	blx	r3
   c016c:	ed947a07 	vldr	s14, [r4, #28]
   c0170:	eddf7a22 	vldr	s15, [pc, #136]	@ c0200 <mixerengine::SoundColorFxSweep::initialize()+0x278>
   c0174:	ee677a27 	vmul.f32	s15, s14, s15
   c0178:	e3a03000 	mov	r3, #0
   c017c:	e58430e8 	str	r3, [r4, #232]	@ 0xe8
   c0180:	e1a00004 	mov	r0, r4
   c0184:	eefd7ae7 	vcvt.s32.f32	s15, s15
   c0188:	ee173a90 	vmov	r3, s15
   c018c:	e1a03143 	asr	r3, r3, #2
   c0190:	ee073a10 	vmov	s14, r3
   c0194:	eef87ac7 	vcvt.f32.s32	s15, s14
   c0198:	ed9f7a19 	vldr	s14, [pc, #100]	@ c0204 <mixerengine::SoundColorFxSweep::initialize()+0x27c>
   c019c:	e5843100 	str	r3, [r4, #256]	@ 0x100
   c01a0:	e58430fc 	str	r3, [r4, #252]	@ 0xfc
   c01a4:	e3a035fe 	mov	r3, #1065353216	@ 0x3f800000
   c01a8:	e584306c 	str	r3, [r4, #108]	@ 0x6c
   c01ac:	eef47ac7 	vcmpe.f32	s15, s14
   c01b0:	ee171a90 	vmov	r1, s15
   c01b4:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   c01b8:	9a00000b 	bls	c01ec <mixerengine::SoundColorFxSweep::initialize()+0x264>
   c01bc:	ebfffdc6 	bl	bf8dc <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)>
   c01c0:	e5d43105 	ldrb	r3, [r4, #261]	@ 0x105
   c01c4:	e3a02000 	mov	r2, #0
   c01c8:	e5c42104 	strb	r2, [r4, #260]	@ 0x104
   c01cc:	e1530002 	cmp	r3, r2
   c01d0:	0a000003 	beq	c01e4 <mixerengine::SoundColorFxSweep::initialize()+0x25c>
   c01d4:	e59430fc 	ldr	r3, [r4, #252]	@ 0xfc
   c01d8:	e353007e 	cmp	r3, #126	@ 0x7e
   c01dc:	c3a03000 	movgt	r3, #0
   c01e0:	c584306c 	strgt	r3, [r4, #108]	@ 0x6c
   c01e4:	ecbd8b02 	vpop	{d8}
   c01e8:	e8bd85f8 	pop	{r3, r4, r5, r6, r7, r8, sl, pc}
   c01ec:	ebfffd57 	bl	bf750 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)>
   c01f0:	eafffff2 	b	c01c0 <mixerengine::SoundColorFxSweep::initialize()+0x238>
   c01f4:	e320f000 	nop	{0}
	...
   c0200:	447fc000 	.word	0x447fc000
   c0204:	42fe0000 	.word	0x42fe0000
   c0208:	0042d320 	.word	0x0042d320
   c020c:	0042d338 	.word	0x0042d338

000c0210 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)>:
   c0210:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   c0214:	eddf0b89 	vldr	d16, [pc, #548]	@ c0440 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x230>
   c0218:	e1a0a001 	mov	sl, r1
   c021c:	ed2d8b02 	vpush	{d8}
   c0220:	e590c0fc 	ldr	ip, [r0, #252]	@ 0xfc
   c0224:	e24dd00c 	sub	sp, sp, #12
   c0228:	e5901100 	ldr	r1, [r0, #256]	@ 0x100
   c022c:	ee07ca10 	vmov	s14, ip
   c0230:	e1a04000 	mov	r4, r0
   c0234:	e1a08002 	mov	r8, r2
   c0238:	e15c0001 	cmp	ip, r1
   c023c:	e1a0b003 	mov	fp, r3
   c0240:	edcd0b00 	vstr	d16, [sp]
   c0244:	eeb88ac7 	vcvt.f32.s32	s16, s14
   c0248:	0a000063 	beq	c03dc <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x1cc>
   c024c:	aa000074 	bge	c0424 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x214>
   c0250:	e28cc001 	add	ip, ip, #1
   c0254:	ee07ca10 	vmov	s14, ip
   c0258:	eef87ac7 	vcvt.f32.s32	s15, s14
   c025c:	e580c0fc 	str	ip, [r0, #252]	@ 0xfc
   c0260:	ed9f7a78 	vldr	s14, [pc, #480]	@ c0448 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x238>
   c0264:	eef47ac7 	vcmpe.f32	s15, s14
   c0268:	e1a00004 	mov	r0, r4
   c026c:	ee171a90 	vmov	r1, s15
   c0270:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   c0274:	9a000062 	bls	c0404 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x1f4>
   c0278:	ebfffd97 	bl	bf8dc <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)>
   c027c:	e3a03000 	mov	r3, #0
   c0280:	e5c43104 	strb	r3, [r4, #260]	@ 0x104
   c0284:	eddf7a6f 	vldr	s15, [pc, #444]	@ c0448 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x238>
   c0288:	eeb48ae7 	vcmpe.f32	s16, s15
   c028c:	e1a00004 	mov	r0, r4
   c0290:	e1a0100a 	mov	r1, sl
   c0294:	e1a0200b 	mov	r2, fp
   c0298:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   c029c:	5a00004b 	bpl	c03d0 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x1c0>
   c02a0:	e3a09001 	mov	r9, #1
   c02a4:	ebfffb8f 	bl	bf0e8 <mixerengine::SoundColorFxSweep::gateProcess(common::Float2 const*, int)>
   c02a8:	e35b0000 	cmp	fp, #0
   c02ac:	da000044 	ble	c03c4 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x1b4>
   c02b0:	e3a05000 	mov	r5, #0
   c02b4:	e59f7198 	ldr	r7, [pc, #408]	@ c0454 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x244>
   c02b8:	e1a06005 	mov	r6, r5
   c02bc:	ed9f8a62 	vldr	s16, [pc, #392]	@ c044c <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x23c>
   c02c0:	ea00001b 	b	c0334 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x124>
   c02c4:	ee777ac8 	vsub.f32	s15, s15, s16
   c02c8:	eef57ac0 	vcmpe.f32	s15, #0.0
   c02cc:	edc47a1b 	vstr	s15, [r4, #108]	@ 0x6c
   c02d0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   c02d4:	5a000005 	bpl	c02f0 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0xe0>
   c02d8:	e3590000 	cmp	r9, #0
   c02dc:	e3a03000 	mov	r3, #0
   c02e0:	ee073a90 	vmov	s15, r3
   c02e4:	e584306c 	str	r3, [r4, #108]	@ 0x6c
   c02e8:	1dc47a3a 	vstrne	s15, [r4, #232]	@ 0xe8
   c02ec:	0ddf7a57 	vldreq	s15, [pc, #348]	@ c0450 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x240>
   c02f0:	ee377aa7 	vadd.f32	s14, s15, s15
   c02f4:	edd72b00 	vldr	d18, [r7]
   c02f8:	ecfa1b02 	vldmia	sl!, {d17}
   c02fc:	e2866001 	add	r6, r6, #1
   c0300:	e156000b 	cmp	r6, fp
   c0304:	e2855008 	add	r5, r5, #8
   c0308:	eef06a08 	vmov.f32	s13, #8	@ 0x40400000  3.0
   c030c:	ee677aa7 	vmul.f32	s15, s15, s15
   c0310:	ee367ac7 	vsub.f32	s14, s13, s14
   c0314:	ee677a27 	vmul.f32	s15, s14, s15
   c0318:	f3fc0c07 	vdup.32	d16, d7[1]
   c031c:	f2622da0 	vsub.f32	d18, d18, d16
   c0320:	f3411db0 	vmul.f32	d17, d17, d16
   c0324:	f3430db2 	vmul.f32	d16, d19, d18
   c0328:	f2410da0 	vadd.f32	d16, d17, d16
   c032c:	ece80b02 	vstmia	r8!, {d16}
   c0330:	0a000023 	beq	c03c4 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x1b4>
   c0334:	e3590000 	cmp	r9, #0
   c0338:	1a000013 	bne	c038c <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x17c>
   c033c:	e5943058 	ldr	r3, [r4, #88]	@ 0x58
   c0340:	e0833005 	add	r3, r3, r5
   c0344:	edd33b00 	vldr	d19, [r3]
   c0348:	e5d43105 	ldrb	r3, [r4, #261]	@ 0x105
   c034c:	edd47a1b 	vldr	s15, [r4, #108]	@ 0x6c
   c0350:	e3530000 	cmp	r3, #0
   c0354:	1affffda 	bne	c02c4 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0xb4>
   c0358:	ee777a88 	vadd.f32	s15, s15, s16
   c035c:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   c0360:	edc47a1b 	vstr	s15, [r4, #108]	@ 0x6c
   c0364:	eef47ac7 	vcmpe.f32	s15, s14
   c0368:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   c036c:	daffffdf 	ble	c02f0 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0xe0>
   c0370:	e3590000 	cmp	r9, #0
   c0374:	ed847a1b 	vstr	s14, [r4, #108]	@ 0x6c
   c0378:	0ef07a47 	vmoveq.f32	s15, s14
   c037c:	13a03000 	movne	r3, #0
   c0380:	1ef07a47 	vmovne.f32	s15, s14
   c0384:	158430e8 	strne	r3, [r4, #232]	@ 0xe8
   c0388:	eaffffd8 	b	c02f0 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0xe0>
   c038c:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   c0390:	e3a03001 	mov	r3, #1
   c0394:	e5941048 	ldr	r1, [r4, #72]	@ 0x48
   c0398:	e1a0200d 	mov	r2, sp
   c039c:	e590c000 	ldr	ip, [r0]
   c03a0:	e0811005 	add	r1, r1, r5
   c03a4:	e59cc014 	ldr	ip, [ip, #20]
   c03a8:	e12fff3c 	blx	ip
   c03ac:	e594304c 	ldr	r3, [r4, #76]	@ 0x4c
   c03b0:	eddd1b00 	vldr	d17, [sp]
   c03b4:	e0833005 	add	r3, r3, r5
   c03b8:	edd33b00 	vldr	d19, [r3]
   c03bc:	f2413da3 	vadd.f32	d19, d17, d19
   c03c0:	eaffffe0 	b	c0348 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x138>
   c03c4:	e28dd00c 	add	sp, sp, #12
   c03c8:	ecbd8b02 	vpop	{d8}
   c03cc:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
   c03d0:	e3a09000 	mov	r9, #0
   c03d4:	ebfffbb2 	bl	bf2a4 <mixerengine::SoundColorFxSweep::sweepProcess(common::Float2 const*, int)>
   c03d8:	eaffffb2 	b	c02a8 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x98>
   c03dc:	e5d03104 	ldrb	r3, [r0, #260]	@ 0x104
   c03e0:	e3530000 	cmp	r3, #0
   c03e4:	0a000008 	beq	c040c <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x1fc>
   c03e8:	eef07a48 	vmov.f32	s15, s16
   c03ec:	ed9f7a15 	vldr	s14, [pc, #84]	@ c0448 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x238>
   c03f0:	e1a00004 	mov	r0, r4
   c03f4:	eef47ac7 	vcmpe.f32	s15, s14
   c03f8:	ee171a90 	vmov	r1, s15
   c03fc:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   c0400:	8affff9c 	bhi	c0278 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x68>
   c0404:	ebfffcd1 	bl	bf750 <mixerengine::SoundColorFxSweep::updateParamaterGate(float)>
   c0408:	eaffff9b 	b	c027c <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x6c>
   c040c:	e5903108 	ldr	r3, [r0, #264]	@ 0x108
   c0410:	e3530000 	cmp	r3, #0
   c0414:	0affff9a 	beq	c0284 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x74>
   c0418:	ee181a10 	vmov	r1, s16
   c041c:	ebfffd2e 	bl	bf8dc <mixerengine::SoundColorFxSweep::updateParamaterSweep(float)>
   c0420:	eaffff97 	b	c0284 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x74>
   c0424:	daffffef 	ble	c03e8 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x1d8>
   c0428:	e24cc001 	sub	ip, ip, #1
   c042c:	ee07ca10 	vmov	s14, ip
   c0430:	e580c0fc 	str	ip, [r0, #252]	@ 0xfc
   c0434:	eef87ac7 	vcvt.f32.s32	s15, s14
   c0438:	eaffff88 	b	c0260 <mixerengine::SoundColorFxSweep::execute(common::Float2 const*, common::Float2*, int)+0x50>
   c043c:	e320f000 	nop	{0}
	...
   c0448:	42fe0000 	.word	0x42fe0000
   c044c:	3b800000 	.word	0x3b800000
   c0450:	00000000 	.word	0x00000000
   c0454:	0114bda8 	.word	0x0114bda8

000c0458 <mixerengine::SoundColorFxSweep::preparetGainChase(float, int, int)>:
   c0458:	ee071a90 	vmov	s15, r1
   c045c:	ed9f7a1d 	vldr	s14, [pc, #116]	@ c04d8 <mixerengine::SoundColorFxSweep::preparetGainChase(float, int, int)+0x80>
   c0460:	eef47ac7 	vcmpe.f32	s15, s14
   c0464:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   c0468:	5a000003 	bpl	c047c <mixerengine::SoundColorFxSweep::preparetGainChase(float, int, int)+0x24>
   c046c:	ed9f7a1a 	vldr	s14, [pc, #104]	@ c04dc <mixerengine::SoundColorFxSweep::preparetGainChase(float, int, int)+0x84>
   c0470:	eef47ac7 	vcmpe.f32	s15, s14
   c0474:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   c0478:	ca00000a 	bgt	c04a8 <mixerengine::SoundColorFxSweep::preparetGainChase(float, int, int)+0x50>
   c047c:	ed9f7a17 	vldr	s14, [pc, #92]	@ c04e0 <mixerengine::SoundColorFxSweep::preparetGainChase(float, int, int)+0x88>
   c0480:	ee277a87 	vmul.f32	s14, s15, s14
   c0484:	e0801102 	add	r1, r0, r2, lsl #2
   c0488:	eddf6a15 	vldr	s13, [pc, #84]	@ c04e4 <mixerengine::SoundColorFxSweep::preparetGainChase(float, int, int)+0x8c>
   c048c:	edd17a21 	vldr	s15, [r1, #132]	@ 0x84
   c0490:	e580309c 	str	r3, [r0, #156]	@ 0x9c
   c0494:	e0801102 	add	r1, r0, r2, lsl #2
   c0498:	ee477a66 	vmls.f32	s15, s14, s13
   c049c:	ed817a25 	vstr	s14, [r1, #148]	@ 0x94
   c04a0:	edc17a23 	vstr	s15, [r1, #140]	@ 0x8c
   c04a4:	e12fff1e 	bx	lr
   c04a8:	ed907a1c 	vldr	s14, [r0, #112]	@ 0x70
   c04ac:	ee277a87 	vmul.f32	s14, s15, s14
   c04b0:	ee063a10 	vmov	s12, r3
   c04b4:	e0801102 	add	r1, r0, r2, lsl #2
   c04b8:	edd17a21 	vldr	s15, [r1, #132]	@ 0x84
   c04bc:	e580309c 	str	r3, [r0, #156]	@ 0x9c
   c04c0:	e0801102 	add	r1, r0, r2, lsl #2
   c04c4:	eef86ac6 	vcvt.f32.s32	s13, s12
   c04c8:	ed817a25 	vstr	s14, [r1, #148]	@ 0x94
   c04cc:	ee477a66 	vmls.f32	s15, s14, s13
   c04d0:	edc17a23 	vstr	s15, [r1, #140]	@ 0x8c
   c04d4:	e12fff1e 	bx	lr
   c04d8:	3c800000 	.word	0x3c800000
   c04dc:	bc800000 	.word	0xbc800000
   c04e0:	3c000000 	.word	0x3c000000
   c04e4:	43000000 	.word	0x43000000

000c04e8 <mixerengine::SoundColorFxSweep::detect(common::Float2 const*, int)>:
   c04e8:	eafffbd3 	b	bf43c <mixerengine::SoundColorFxSweep::peakLevelDetect(common::Float2 const*, int)>
