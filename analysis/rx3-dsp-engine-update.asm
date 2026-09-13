
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000581d4 <mixerengine::MixerEngine::update(int)>:
   581d4:	e5903058 	ldr	r3, [r0, #88]	@ 0x58
   581d8:	e3a02000 	mov	r2, #0
   581dc:	e92d4070 	push	{r4, r5, r6, lr}
   581e0:	e1a04000 	mov	r4, r0
   581e4:	e5906000 	ldr	r6, [r0]
   581e8:	e1a05001 	mov	r5, r1
   581ec:	e5c320ef 	strb	r2, [r3, #239]	@ 0xef
   581f0:	ea000003 	b	58204 <mixerengine::MixerEngine::update(int)+0x30>
   581f4:	e4960004 	ldr	r0, [r6], #4
   581f8:	e5903000 	ldr	r3, [r0]
   581fc:	e5933008 	ldr	r3, [r3, #8]
   58200:	e12fff33 	blx	r3
   58204:	e5943004 	ldr	r3, [r4, #4]
   58208:	e1a01005 	mov	r1, r5
   5820c:	e1530006 	cmp	r3, r6
   58210:	1afffff7 	bne	581f4 <mixerengine::MixerEngine::update(int)+0x20>
   58214:	e5946024 	ldr	r6, [r4, #36]	@ 0x24
   58218:	ea000003 	b	5822c <mixerengine::MixerEngine::update(int)+0x58>
   5821c:	e4960004 	ldr	r0, [r6], #4
   58220:	e5903000 	ldr	r3, [r0]
   58224:	e5933008 	ldr	r3, [r3, #8]
   58228:	e12fff33 	blx	r3
   5822c:	e5943028 	ldr	r3, [r4, #40]	@ 0x28
   58230:	e1a01005 	mov	r1, r5
   58234:	e1530006 	cmp	r3, r6
   58238:	1afffff7 	bne	5821c <mixerengine::MixerEngine::update(int)+0x48>
   5823c:	e5946038 	ldr	r6, [r4, #56]	@ 0x38
   58240:	ea000003 	b	58254 <mixerengine::MixerEngine::update(int)+0x80>
   58244:	e4960004 	ldr	r0, [r6], #4
   58248:	e5903000 	ldr	r3, [r0]
   5824c:	e5933008 	ldr	r3, [r3, #8]
   58250:	e12fff33 	blx	r3
   58254:	e594303c 	ldr	r3, [r4, #60]	@ 0x3c
   58258:	e1a01005 	mov	r1, r5
   5825c:	e1530006 	cmp	r3, r6
   58260:	1afffff7 	bne	58244 <mixerengine::MixerEngine::update(int)+0x70>
   58264:	e1a00004 	mov	r0, r4
   58268:	e8bd4070 	pop	{r4, r5, r6, lr}
   5826c:	eaffff4f 	b	57fb0 <mixerengine::MixerEngine::updateOnAir()>
