 1f5d868: a9b97bfd     	stp	x29, x30, [sp, #-0x70]!
 1f5d86c: 910003fd     	mov	x29, sp
 1f5d870: a90153f3     	stp	x19, x20, [sp, #0x10]
 1f5d874: aa0803f4     	mov	x20, x8
 1f5d878: 910083e8     	add	x8, sp, #0x20
 1f5d87c: 94003517     	bl	0x1f6acd8
 1f5d880: d2802700     	mov	x0, #0x138              // =312
 1f5d884: 97931f7b     	bl	0x425670
 1f5d888: aa0003f3     	mov	x19, x0
 1f5d88c: 910083e1     	add	x1, sp, #0x20
 1f5d890: 940047b0     	bl	0x1f6f750
 1f5d894: 9100e3e0     	add	x0, sp, #0x38
 1f5d898: 94001236     	bl	0x1f62170
 1f5d89c: aa1303e0     	mov	x0, x19
 1f5d8a0: 97fffbd4     	bl	0x1f5c7f0
 1f5d8a4: f9000293     	str	x19, [x20]
 1f5d8a8: aa1403e0     	mov	x0, x20
 1f5d8ac: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1f5d8b0: a8c77bfd     	ldp	x29, x30, [sp], #0x70
 1f5d8b4: d65f03c0     	ret
 1f5d8b8: aa0003f4     	mov	x20, x0
 1f5d8bc: 1400000c     	b	0x1f5d8ec
 1f5d8c0: f9400261     	ldr	x1, [x19]
 1f5d8c4: aa0003f4     	mov	x20, x0
 1f5d8c8: aa1303e0     	mov	x0, x19
 1f5d8cc: f9400421     	ldr	x1, [x1, #0x8]
 1f5d8d0: d63f0020     	blr	x1
 1f5d8d4: aa1403e0     	mov	x0, x20
 1f5d8d8: 97931f56     	bl	0x425630
 1f5d8dc: aa0003f4     	mov	x20, x0
 1f5d8e0: d2802701     	mov	x1, #0x138              // =312
 1f5d8e4: aa1303e0     	mov	x0, x19
 1f5d8e8: 979325e2     	bl	0x427070
 1f5d8ec: 9100e3e0     	add	x0, sp, #0x38
 1f5d8f0: 94001220     	bl	0x1f62170
 1f5d8f4: aa1403e0     	mov	x0, x20
 1f5d8f8: 97931f4e     	bl	0x425630
 1f5d8fc: d503201f     	nop
 1f5d900: a9b87bfd     	stp	x29, x30, [sp, #-0x80]!
 1f5d904: 910003fd     	mov	x29, sp
 1f5d908: f90013f5     	str	x21, [sp, #0x20]
 1f5d90c: aa0803f5     	mov	x21, x8
 1f5d910: 9100c3e8     	add	x8, sp, #0x30
 1f5d914: 940034f1     	bl	0x1f6acd8
 1f5d918: d2802900     	mov	x0, #0x148              // =328
 1f5d91c: 97931f55     	bl	0x425670
 1f5d920: 0f000420     	movi	v0.2s, #0x1
 1f5d924: a90153f3     	stp	x19, x20, [sp, #0x10]
 1f5d928: aa0003f4     	mov	x20, x0
 1f5d92c: aa0003f3     	mov	x19, x0
 1f5d930: b0008260     	adrp	x0, 0x2faa000
 1f5d934: 9123c000     	add	x0, x0, #0x8f0
 1f5d938: 9100c3e1     	add	x1, sp, #0x30
 1f5d93c: fd000680     	str	d0, [x20, #0x8]
 1f5d940: f8010660     	str	x0, [x19], #0x10
 1f5d944: aa1303e0     	mov	x0, x19
 1f5d948: 94004782     	bl	0x1f6f750
 1f5d94c: 910123e0     	add	x0, sp, #0x48
 1f5d950: 94001208     	bl	0x1f62170
 1f5d954: aa1303e0     	mov	x0, x19
 1f5d958: 97fffba6     	bl	0x1f5c7f0
 1f5d95c: a90052b3     	stp	x19, x20, [x21]
 1f5d960: aa1503e0     	mov	x0, x21
 1f5d964: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1f5d968: f94013f5     	ldr	x21, [sp, #0x20]
 1f5d96c: a8c87bfd     	ldp	x29, x30, [sp], #0x80
