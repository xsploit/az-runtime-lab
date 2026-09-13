
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000bc7c0 <mixerengine::SoundColorFx::adjustParameter(mixerengine::EnEffectParameter, float)>:
   bc7c0:	e3510007 	cmp	r1, #7
   bc7c4:	ee072a90 	vmov	s15, r2
   bc7c8:	e92d4008 	push	{r3, lr}
   bc7cc:	0a00000f 	beq	bc810 <mixerengine::SoundColorFx::adjustParameter(mixerengine::EnEffectParameter, float)+0x50>
   bc7d0:	e3510008 	cmp	r1, #8
   bc7d4:	18bd8008 	popne	{r3, pc}
   bc7d8:	eef57ac0 	vcmpe.f32	s15, #0.0
   bc7dc:	e5802020 	str	r2, [r0, #32]
   bc7e0:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bc7e4:	43a03000 	movmi	r3, #0
   bc7e8:	45803020 	strmi	r3, [r0, #32]
   bc7ec:	4a000003 	bmi	bc800 <mixerengine::SoundColorFx::adjustParameter(mixerengine::EnEffectParameter, float)+0x40>
   bc7f0:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   bc7f4:	eef47ac7 	vcmpe.f32	s15, s14
   bc7f8:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bc7fc:	cd807a08 	vstrgt	s14, [r0, #32]
   bc800:	e5903000 	ldr	r3, [r0]
   bc804:	e593301c 	ldr	r3, [r3, #28]
   bc808:	e12fff33 	blx	r3
   bc80c:	e8bd8008 	pop	{r3, pc}
   bc810:	eef57ac0 	vcmpe.f32	s15, #0.0
   bc814:	e580201c 	str	r2, [r0, #28]
   bc818:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bc81c:	43a03000 	movmi	r3, #0
   bc820:	4580301c 	strmi	r3, [r0, #28]
   bc824:	4a000003 	bmi	bc838 <mixerengine::SoundColorFx::adjustParameter(mixerengine::EnEffectParameter, float)+0x78>
   bc828:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   bc82c:	eef47ac7 	vcmpe.f32	s15, s14
   bc830:	eef1fa10 	vmrs	APSR_nzcv, fpscr
   bc834:	cd807a07 	vstrgt	s14, [r0, #28]
   bc838:	e5903000 	ldr	r3, [r0]
   bc83c:	e5933018 	ldr	r3, [r3, #24]
   bc840:	e12fff33 	blx	r3
   bc844:	e8bd8008 	pop	{r3, pc}
