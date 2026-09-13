
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000b5e94 <mixerengine::BeatEffect::getPlayEngine()>:
   b5e94:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
   b5e98:	e59f409c 	ldr	r4, [pc, #156]	@ b5f3c <mixerengine::BeatEffect::getPlayEngine()+0xa8>
   b5e9c:	e5940004 	ldr	r0, [r4, #4]
   b5ea0:	e3500000 	cmp	r0, #0
   b5ea4:	18bd80f8 	popne	{r3, r4, r5, r6, r7, pc}
   b5ea8:	e59f5090 	ldr	r5, [pc, #144]	@ b5f40 <mixerengine::BeatEffect::getPlayEngine()+0xac>
   b5eac:	e5950000 	ldr	r0, [r5]
   b5eb0:	e3500000 	cmp	r0, #0
   b5eb4:	0a000001 	beq	b5ec0 <mixerengine::BeatEffect::getPlayEngine()+0x2c>
   b5eb8:	e5840004 	str	r0, [r4, #4]
   b5ebc:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
   b5ec0:	e59f007c 	ldr	r0, [pc, #124]	@ b5f44 <mixerengine::BeatEffect::getPlayEngine()+0xb0>
   b5ec4:	eb0c29b8 	bl	3c05ac <juce::CriticalSection::enter() const>
   b5ec8:	e5953000 	ldr	r3, [r5]
   b5ecc:	e3530000 	cmp	r3, #0
   b5ed0:	0a000003 	beq	b5ee4 <mixerengine::BeatEffect::getPlayEngine()+0x50>
   b5ed4:	e59f0068 	ldr	r0, [pc, #104]	@ b5f44 <mixerengine::BeatEffect::getPlayEngine()+0xb0>
   b5ed8:	eb0c29b9 	bl	3c05c4 <juce::CriticalSection::exit() const>
   b5edc:	e5950000 	ldr	r0, [r5]
   b5ee0:	eafffff4 	b	b5eb8 <mixerengine::BeatEffect::getPlayEngine()+0x24>
   b5ee4:	e59f605c 	ldr	r6, [pc, #92]	@ b5f48 <mixerengine::BeatEffect::getPlayEngine()+0xb4>
   b5ee8:	e5d63000 	ldrb	r3, [r6]
   b5eec:	e3530000 	cmp	r3, #0
   b5ef0:	1afffff7 	bne	b5ed4 <mixerengine::BeatEffect::getPlayEngine()+0x40>
   b5ef4:	e59f2050 	ldr	r2, [pc, #80]	@ b5f4c <mixerengine::BeatEffect::getPlayEngine()+0xb8>
   b5ef8:	e3a03001 	mov	r3, #1
   b5efc:	e3a00070 	mov	r0, #112	@ 0x70
   b5f00:	e5c63000 	strb	r3, [r6]
   b5f04:	e5c23000 	strb	r3, [r2]
   b5f08:	ebfd6106 	bl	e328 <operator new(unsigned int)@plt>
   b5f0c:	e1a07000 	mov	r7, r0
   b5f10:	ebfeaaec 	bl	60ac8 <playengine::PlayEngine::PlayEngine()>
   b5f14:	e3a03000 	mov	r3, #0
   b5f18:	e5857000 	str	r7, [r5]
   b5f1c:	e5c63000 	strb	r3, [r6]
   b5f20:	eaffffeb 	b	b5ed4 <mixerengine::BeatEffect::getPlayEngine()+0x40>
   b5f24:	e59f0018 	ldr	r0, [pc, #24]	@ b5f44 <mixerengine::BeatEffect::getPlayEngine()+0xb0>
   b5f28:	eb0c29a5 	bl	3c05c4 <juce::CriticalSection::exit() const>
   b5f2c:	ebfd63e2 	bl	eebc <__cxa_end_cleanup@plt>
   b5f30:	e1a00007 	mov	r0, r7
   b5f34:	ebfd6365 	bl	ecd0 <operator delete(void*)@plt>
   b5f38:	eafffff9 	b	b5f24 <mixerengine::BeatEffect::getPlayEngine()+0x90>
   b5f3c:	0114b12c 	.word	0x0114b12c
   b5f40:	011497d0 	.word	0x011497d0
   b5f44:	01149840 	.word	0x01149840
   b5f48:	0053dda0 	.word	0x0053dda0
   b5f4c:	0053dda1 	.word	0x0053dda1

000b5f50 <mixerengine::BeatEffect::getMixerEngine()>:
   b5f50:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
   b5f54:	e59f409c 	ldr	r4, [pc, #156]	@ b5ff8 <mixerengine::BeatEffect::getMixerEngine()+0xa8>
   b5f58:	e5940008 	ldr	r0, [r4, #8]
   b5f5c:	e3500000 	cmp	r0, #0
   b5f60:	18bd80f8 	popne	{r3, r4, r5, r6, r7, pc}
   b5f64:	e59f5090 	ldr	r5, [pc, #144]	@ b5ffc <mixerengine::BeatEffect::getMixerEngine()+0xac>
   b5f68:	e5950000 	ldr	r0, [r5]
   b5f6c:	e3500000 	cmp	r0, #0
   b5f70:	0a000001 	beq	b5f7c <mixerengine::BeatEffect::getMixerEngine()+0x2c>
   b5f74:	e5840008 	str	r0, [r4, #8]
   b5f78:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
   b5f7c:	e59f007c 	ldr	r0, [pc, #124]	@ b6000 <mixerengine::BeatEffect::getMixerEngine()+0xb0>
   b5f80:	eb0c2989 	bl	3c05ac <juce::CriticalSection::enter() const>
   b5f84:	e5953000 	ldr	r3, [r5]
   b5f88:	e3530000 	cmp	r3, #0
   b5f8c:	0a000003 	beq	b5fa0 <mixerengine::BeatEffect::getMixerEngine()+0x50>
   b5f90:	e59f0068 	ldr	r0, [pc, #104]	@ b6000 <mixerengine::BeatEffect::getMixerEngine()+0xb0>
   b5f94:	eb0c298a 	bl	3c05c4 <juce::CriticalSection::exit() const>
   b5f98:	e5950000 	ldr	r0, [r5]
   b5f9c:	eafffff4 	b	b5f74 <mixerengine::BeatEffect::getMixerEngine()+0x24>
   b5fa0:	e59f605c 	ldr	r6, [pc, #92]	@ b6004 <mixerengine::BeatEffect::getMixerEngine()+0xb4>
   b5fa4:	e5d63000 	ldrb	r3, [r6]
   b5fa8:	e3530000 	cmp	r3, #0
   b5fac:	1afffff7 	bne	b5f90 <mixerengine::BeatEffect::getMixerEngine()+0x40>
   b5fb0:	e59f2050 	ldr	r2, [pc, #80]	@ b6008 <mixerengine::BeatEffect::getMixerEngine()+0xb8>
   b5fb4:	e3a03001 	mov	r3, #1
   b5fb8:	e3a00078 	mov	r0, #120	@ 0x78
   b5fbc:	e5c63000 	strb	r3, [r6]
   b5fc0:	e5c23000 	strb	r3, [r2]
   b5fc4:	ebfd60d7 	bl	e328 <operator new(unsigned int)@plt>
   b5fc8:	e1a07000 	mov	r7, r0
   b5fcc:	ebfe88bc 	bl	582c4 <mixerengine::MixerEngine::MixerEngine()>
   b5fd0:	e3a03000 	mov	r3, #0
   b5fd4:	e5857000 	str	r7, [r5]
   b5fd8:	e5c63000 	strb	r3, [r6]
   b5fdc:	eaffffeb 	b	b5f90 <mixerengine::BeatEffect::getMixerEngine()+0x40>
   b5fe0:	e59f0018 	ldr	r0, [pc, #24]	@ b6000 <mixerengine::BeatEffect::getMixerEngine()+0xb0>
   b5fe4:	eb0c2976 	bl	3c05c4 <juce::CriticalSection::exit() const>
   b5fe8:	ebfd63b3 	bl	eebc <__cxa_end_cleanup@plt>
   b5fec:	e1a00007 	mov	r0, r7
   b5ff0:	ebfd6336 	bl	ecd0 <operator delete(void*)@plt>
   b5ff4:	eafffff9 	b	b5fe0 <mixerengine::BeatEffect::getMixerEngine()+0x90>
   b5ff8:	0114b12c 	.word	0x0114b12c
   b5ffc:	011493c0 	.word	0x011493c0
   b6000:	01149434 	.word	0x01149434
   b6004:	01149370 	.word	0x01149370
   b6008:	01149371 	.word	0x01149371

000b600c <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)>:
   b600c:	e92d45f8 	push	{r3, r4, r5, r6, r7, r8, sl, lr}
   b6010:	e1a06000 	mov	r6, r0
   b6014:	e59f50f8 	ldr	r5, [pc, #248]	@ b6114 <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)+0x108>
   b6018:	e5950000 	ldr	r0, [r5]
   b601c:	e3500000 	cmp	r0, #0
   b6020:	0a00000f 	beq	b6064 <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)+0x58>
   b6024:	e5904008 	ldr	r4, [r0, #8]
   b6028:	e3540000 	cmp	r4, #0
   b602c:	b3a00000 	movlt	r0, #0
   b6030:	b8bd85f8 	poplt	{r3, r4, r5, r6, r7, r8, sl, pc}
   b6034:	e5950004 	ldr	r0, [r5, #4]
   b6038:	e3500000 	cmp	r0, #0
   b603c:	0a00000f 	beq	b6080 <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)+0x74>
   b6040:	e1a01004 	mov	r1, r4
   b6044:	ebfe9cd9 	bl	5d3b0 <playengine::PlayEngine::isLoaded(djengine::EnPlayerChannel) const>
   b6048:	e3500000 	cmp	r0, #0
   b604c:	08bd85f8 	popeq	{r3, r4, r5, r6, r7, r8, sl, pc}
   b6050:	e3560000 	cmp	r6, #0
   b6054:	15864000 	strne	r4, [r6]
   b6058:	13a00001 	movne	r0, #1
   b605c:	03a00001 	moveq	r0, #1
   b6060:	e8bd85f8 	pop	{r3, r4, r5, r6, r7, r8, sl, pc}
   b6064:	ebfe6d92 	bl	516b4 <dsp::BpmManager::getInstance()>
   b6068:	e5904008 	ldr	r4, [r0, #8]
   b606c:	e5850000 	str	r0, [r5]
   b6070:	e3540000 	cmp	r4, #0
   b6074:	b3a00000 	movlt	r0, #0
   b6078:	aaffffed 	bge	b6034 <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)+0x28>
   b607c:	e8bd85f8 	pop	{r3, r4, r5, r6, r7, r8, sl, pc}
   b6080:	e59f7090 	ldr	r7, [pc, #144]	@ b6118 <mixerengine::BeatEffect::checkPlayerChannel(djengine::EnPlayerChannel*)+0x10c>
   b6084:	e5970000 	ldr	r0, [r7]
   b6088:	e3500000 	cmp	r0, #0
   b608c:	15850004 	strne	r0, [r5, #4]
