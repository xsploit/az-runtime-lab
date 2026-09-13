
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

00091244 <mixerengine::BeatEffectTrans::execute(common::Float2 const*, common::Float2*, int)+0x190>:
   91244:	0a000003 	beq	91258 <mixerengine::BeatEffectTrans::execute(common::Float2 const*, common::Float2*, int)+0x1a4>
   91248:	e5943000 	ldr	r3, [r4]
   9124c:	e1a00004 	mov	r0, r4
   91250:	e5933048 	ldr	r3, [r3, #72]	@ 0x48
   91254:	e12fff33 	blx	r3
   91258:	e28dd01c 	add	sp, sp, #28
   9125c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000944f8 <mixerengine::BeatEffectFilter::execute(common::Float2 const*, common::Float2*, int)+0x49c>:
   944f8:	0a000003 	beq	9450c <mixerengine::BeatEffectFilter::execute(common::Float2 const*, common::Float2*, int)+0x4b0>
   944fc:	e5943000 	ldr	r3, [r4]
   94500:	e1a00004 	mov	r0, r4
   94504:	e5933048 	ldr	r3, [r3, #72]	@ 0x48
   94508:	e12fff33 	blx	r3
   9450c:	e28dd044 	add	sp, sp, #68	@ 0x44
   94510:	ecbd8b08 	vpop	{d8-d11}

rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000967f0 <mixerengine::BeatEffectVinylBrake::execute(common::Float2 const*, common::Float2*, int)+0x23c>:
   967f0:	0a000003 	beq	96804 <mixerengine::BeatEffectVinylBrake::execute(common::Float2 const*, common::Float2*, int)+0x250>
   967f4:	e5943000 	ldr	r3, [r4]
   967f8:	e1a00004 	mov	r0, r4
   967fc:	e5933048 	ldr	r3, [r3, #72]	@ 0x48
   96800:	e12fff33 	blx	r3
   96804:	ecbd8b04 	vpop	{d8-d9}
   96808:	e8bd85f8 	pop	{r3, r4, r5, r6, r7, r8, sl, pc}

rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

00097954 <mixerengine::BeatEffectPhaser::execute(common::Float2 const*, common::Float2*, int)+0x32c>:
   97954:	0a000003 	beq	97968 <mixerengine::BeatEffectPhaser::execute(common::Float2 const*, common::Float2*, int)+0x340>
   97958:	e5943000 	ldr	r3, [r4]
   9795c:	e1a00004 	mov	r0, r4
   97960:	e5933048 	ldr	r3, [r3, #72]	@ 0x48
   97964:	e12fff33 	blx	r3
   97968:	ecbd8b08 	vpop	{d8-d11}
   9796c:	e8bd85f8 	pop	{r3, r4, r5, r6, r7, r8, sl, pc}

rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000b86c8 <mixerengine::BeatEffectFlanger::execute(common::Float2 const*, common::Float2*, int)+0x374>:
   b86c8:	0a000003 	beq	b86dc <mixerengine::BeatEffectFlanger::execute(common::Float2 const*, common::Float2*, int)+0x388>
   b86cc:	e5943000 	ldr	r3, [r4]
   b86d0:	e1a00004 	mov	r0, r4
   b86d4:	e5933048 	ldr	r3, [r3, #72]	@ 0x48
   b86d8:	e12fff33 	blx	r3
   b86dc:	e28dd010 	add	sp, sp, #16
   b86e0:	ecbd8b08 	vpop	{d8-d11}
