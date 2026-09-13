
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1b8f380:      	adrp	x22, 0x19a8000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1a8178>
 1b8f384:      	add	x22, x22, #0x330
 1b8f388:      	mov	w24, w0
 1b8f38c:      	ldr	x23, [x20, #0x1898]
 1b8f390:      	ldr	x1, [x1, #0x60]
 1b8f394:      	cmp	x1, x22
 1b8f398:      	b.eq	0x1b8f108 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f280>
 1b8f39c:      	mov	x0, x19
 1b8f3a0:      	blr	x1
 1b8f3a4:      	mov	w1, w0
 1b8f3a8:      	b	0x1b8f10c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f284>
 1b8f3ac:      	mov	x0, x19
 1b8f3b0:      	blr	x1
 1b8f3b4:      	mov	w1, w0
 1b8f3b8:      	b	0x1b8f13c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f2b4>
 1b8f3bc:      	ldr	x0, [x1, #0x1050]
 1b8f3c0:      	bl	0x1f9a898 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x79aa10>
 1b8f3c4:      	ldr	x1, [x19]
 1b8f3c8:      	cbnz	w0, 0x1b8f404 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f57c>
 1b8f3cc:      	ldr	x1, [x1, #0x68]
 1b8f3d0:      	cmp	x1, x23
 1b8f3d4:      	b.eq	0x1b8f2e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f45c>
 1b8f3d8:      	mov	x0, x19
 1b8f3dc:      	blr	x1
 1b8f3e0:      	mov	w24, w0
 1b8f3e4:      	b	0x1b8f190 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f308>
 1b8f3e8:      	ldr	x0, [x20, #0x17e8]
 1b8f3ec:      	bl	0x1b98df8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x398f70>
 1b8f3f0:      	fmov	s8, s0
 1b8f3f4:      	ldr	x0, [sp, #0x78]
 1b8f3f8:      	cbz	x0, 0x1b8f2fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f474>
 1b8f3fc:      	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 1b8f400:      	b	0x1b8f2fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f474>
 1b8f404:      	ldr	x1, [x1, #0x60]
 1b8f408:      	cmp	x1, x22
 1b8f40c:      	b.ne	0x1b8f3d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f550>
 1b8f410:      	ldr	w24, [x19, #0xf0]
 1b8f414:      	b	0x1b8f190 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f308>
 1b8f418:      	ldr	x0, [sp, #0x50]
 1b8f41c:      	ldr	x0, [x0, #0x1050]
 1b8f420:      	bl	0x1f9a478 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x79a5f0>
 1b8f424:      	tst	w0, #0xff
 1b8f428:      	b.ne	0x1b8f190 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f308>
 1b8f42c:      	b	0x1b8f2d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f44c>
 1b8f430:      	mov	w0, #0xcccd             // =52429
 1b8f434:      	movk	w0, #0x3e4c, lsl #16
 1b8f438:      	fmov	s0, w0
 1b8f43c:      	fcmp	s8, s0
 1b8f440:      	fcsel	s8, s8, s0, pl
 1b8f444:      	b	0x1b8f290 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f408>
 1b8f448:      	adrp	x0, 0x260f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4c1a8>
 1b8f44c:      	ldr	d0, [x0, #0xbd8]
 1b8f450:      	fcmpe	d4, d0
 1b8f454:      	b.pl	0x1b8f280 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f3f8>
 1b8f458:      	fmov	s8, #5.00000000
 1b8f45c:      	b	0x1b8f290 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f408>
 1b8f460:      	mov	x19, x0
 1b8f464:      	str	d8, [sp, #0x48]
 1b8f468:      	cbz	x21, 0x1b8f474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f5ec>
 1b8f46c:      	mov	x0, x21
 1b8f470:      	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 1b8f474:      	mov	x0, x19
 1b8f478:      	bl	0x424d10 <_Unwind_Resume@plt>
 1b8f47c:      	mov	x19, x0
 1b8f480:      	ldr	x0, [sp, #0x68]
 1b8f484:      	cbz	x0, 0x1b8f48c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f604>
 1b8f488:      	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 1b8f48c:      	ldr	x0, [sp, #0x58]
 1b8f490:      	cbz	x0, 0x1b8f468 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f5e0>
 1b8f494:      	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 1b8f498:      	cbnz	x21, 0x1b8f46c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f5e4>
 1b8f49c:      	b	0x1b8f474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f5ec>
 1b8f4a0:      	mov	x19, x0
 1b8f4a4:      	b	0x1b8f48c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f604>
 1b8f4a8:      	ldr	x1, [sp, #0x78]
 1b8f4ac:      	mov	x19, x0
 1b8f4b0:      	cbz	x1, 0x1b8f480 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f5f8>
 1b8f4b4:      	mov	x0, x1
 1b8f4b8:      	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 1b8f4bc:      	b	0x1b8f480 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f5f8>
 1b8f4c0:      	sub	x0, x0, #0x38
 1b8f4c4:      	b	0x1b8f088 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f200>
 1b8f4c8:      	stp	x29, x30, [sp, #-0xd0]!
 1b8f4cc:      	mov	x29, sp
 1b8f4d0:      	stp	x19, x20, [sp, #0x10]
 1b8f4d4:      	add	x19, x0, #0x18, lsl #12 // =0x18000
 1b8f4d8:      	mov	x20, x0
 1b8f4dc:      	stp	x21, x22, [sp, #0x20]
 1b8f4e0:      	add	x22, x0, #0x19, lsl #12 // =0x19000
 1b8f4e4:      	add	x22, x22, #0x6c8
 1b8f4e8:      	ldr	x0, [x19, #0x17f8]
 1b8f4ec:      	str	x23, [sp, #0x30]
 1b8f4f0:      	add	x23, x22, #0x30
 1b8f4f4:      	bl	0x1f9a898 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x79aa10>
 1b8f4f8:      	cmp	w0, #0x1
 1b8f4fc:      	b.eq	0x1b8f730 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f8a8>
 1b8f500:      	adrp	x21, 0x3bd7000 <stdout+0x95f40>
 1b8f504:      	add	x21, x21, #0x950
 1b8f508:      	mov	x1, x21
 1b8f50c:      	mov	x0, x23
 1b8f510:      	bl	0x23a5050 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc30>
 1b8f514:      	tst	w0, #0xff
 1b8f518:      	b.ne	0x1b8f638 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f7b0>
 1b8f51c:      	ldr	x0, [x19, #0x17f8]
 1b8f520:      	bl	0x1f9a898 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x79aa10>
 1b8f524:      	cbnz	w0, 0x1b8f668 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f7e0>
 1b8f528:      	add	x0, x20, #0x19, lsl #12 // =0x19000
 1b8f52c:      	ldr	x1, [x20]
 1b8f530:      	ldrb	w3, [x0, #0x8c1]
 1b8f534:      	ldur	x2, [x1, #-0x18]
 1b8f538:      	add	x0, x20, x2
 1b8f53c:      	cbnz	w3, 0x1b8f620 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f798>
 1b8f540:      	ldrb	w0, [x0, #0xc0]
 1b8f544:      	tbnz	w0, #0x1, 0x1b8f8cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38fa44>
 1b8f548:      	ldr	x1, [x1, #0x48]
 1b8f54c:      	mov	x0, x20
 1b8f550:      	ldr	x20, [x19, #0x18b8]
 1b8f554:      	blr	x1
 1b8f558:      	mov	x0, x20
 1b8f55c:      	bl	0x1b71e80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x371ff8>
 1b8f560:      	ldr	x0, [x19, #0x1898]
 1b8f564:      	ldr	x20, [x0, #0x48]
 1b8f568:      	ldr	x0, [x0, #0x40]
 1b8f56c:      	cbz	x20, 0x1b8f590 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f708>
 1b8f570:      	adrp	x1, 0x2b6f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5ac1a8>
 1b8f574:      	ldr	x1, [x1, #0xca0]
 1b8f578:      	cbz	x1, 0x1b8f84c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f9c4>
 1b8f57c:      	add	x1, x20, #0x8
 1b8f580:      	ldaxr	w2, [x1]
 1b8f584:      	add	w2, w2, #0x1
 1b8f588:      	stlxr	w3, w2, [x1]
 1b8f58c:      	cbnz	w3, 0x1b8f580 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f6f8>
 1b8f590:      	ldr	w1, [x19, #0x17f0]
 1b8f594:      	ldr	x2, [x0]
 1b8f598:      	tst	w1, #0xfffffffd
 1b8f59c:      	b.ne	0x1b8f714 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f88c>
 1b8f5a0:      	ldr	x3, [x2, #0x60]
 1b8f5a4:      	adrp	x2, 0x19a8000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1a8178>
 1b8f5a8:      	add	x2, x2, #0x330
 1b8f5ac:      	cmp	x3, x2
 1b8f5b0:      	b.ne	0x1b8f8c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38fa38>
 1b8f5b4:      	ldr	w0, [x0, #0xf0]
 1b8f5b8:      	ldr	x2, [x19, #0x18b8]
 1b8f5bc:      	cmp	w0, w1
 1b8f5c0:      	cset	w1, eq
 1b8f5c4:      	ldr	x0, [x2]
 1b8f5c8:      	ldur	x3, [x0, #-0x18]
 1b8f5cc:      	add	x0, x2, x3
 1b8f5d0:      	ldr	x2, [x2, x3]
 1b8f5d4:      	ldr	x2, [x2, #0x60]
 1b8f5d8:      	blr	x2
 1b8f5dc:      	ldr	x0, [x19, #0x18a8]
 1b8f5e0:      	bl	0x1b91fc8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x392140>
 1b8f5e4:      	ldr	x0, [x19, #0x18b0]
 1b8f5e8:      	bl	0x1b91fc8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x392140>
 1b8f5ec:      	ldr	x1, [x19, #0x18b8]
 1b8f5f0:      	mov	x0, x1
 1b8f5f4:      	ldr	x1, [x1]
 1b8f5f8:      	ldr	x1, [x1, #0x28]
 1b8f5fc:      	blr	x1
 1b8f600:      	cbz	x20, 0x1b8f60c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f784>
 1b8f604:      	mov	x0, x20
 1b8f608:      	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 1b8f60c:      	ldp	x19, x20, [sp, #0x10]
 1b8f610:      	ldp	x21, x22, [sp, #0x20]
 1b8f614:      	ldr	x23, [sp, #0x30]
 1b8f618:      	ldp	x29, x30, [sp], #0xd0
 1b8f61c:      	ret
 1b8f620:      	ldr	x2, [x20, x2]
 1b8f624:      	mov	w1, #0x0                // =0
 1b8f628:      	ldr	x2, [x2, #0x60]
 1b8f62c:      	blr	x2
 1b8f630:      	ldr	x1, [x20]
 1b8f634:      	b	0x1b8f548 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f6c0>
 1b8f638:      	mov	x1, x21
 1b8f63c:      	mov	x0, x23
 1b8f640:      	bl	0x23a5020 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc00>
 1b8f644:      	add	x0, x20, #0x19, lsl #12 // =0x19000
 1b8f648:      	add	x0, x0, #0x6c8
 1b8f64c:      	ldr	x0, [x0]
 1b8f650:      	ldur	x0, [x0, #-0x18]
 1b8f654:      	add	x0, x22, x0
 1b8f658:      	bl	0x2488570 <_ZNSt8functionIFvvEEC2ERKS1_+0x113150>
 1b8f65c:      	ldr	x0, [x19, #0x17f8]
 1b8f660:      	bl	0x1f9a898 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x79aa10>
 1b8f664:      	cbz	w0, 0x1b8f528 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f6a0>
 1b8f668:      	mov	x1, #0x7fffffffffffffff // =9223372036854775807
 1b8f66c:      	mov	w2, #0xb                // =11
 1b8f670:      	stp	xzr, xzr, [sp, #0x50]
 1b8f674:      	add	x0, sp, #0xbd
 1b8f678:      	stp	xzr, xzr, [sp, #0xa0]
 1b8f67c:      	stp	xzr, xzr, [sp, #0xb0]
 1b8f680:      	stp	xzr, xzr, [sp, #0x40]
 1b8f684:      	str	w2, [sp, #0x54]
 1b8f688:      	stp	xzr, xzr, [sp, #0x60]
 1b8f68c:      	stp	xzr, x1, [sp, #0x70]
 1b8f690:      	stp	xzr, xzr, [sp, #0x80]
 1b8f694:      	stp	xzr, xzr, [sp, #0x90]
 1b8f698:      	str	x1, [sp, #0xa0]
 1b8f69c:      	str	x1, [sp, #0xb0]
 1b8f6a0:      	stp	xzr, xzr, [sp, #0xc0]
 1b8f6a4:      	bl	0x23a5000 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbe0>
 1b8f6a8:      	add	x0, sp, #0xc8
 1b8f6ac:      	bl	0x230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1873f8>
 1b8f6b0:      	ldr	x1, [x19, #0x1848]
 1b8f6b4:      	ldr	w0, [x1, #0xbc]
 1b8f6b8:      	cmp	w0, #0xb
 1b8f6bc:      	b.eq	0x1b8f808 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f980>
 1b8f6c0:      	ldrb	w0, [x1, #0xc0]
 1b8f6c4:      	cbz	w0, 0x1b8f808 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f980>
 1b8f6c8:      	ldr	x0, [x19, #0x1808]
 1b8f6cc:      	ldr	x3, [x1, #0xc8]
 1b8f6d0:      	ldr	x2, [x0, #0xb8]
 1b8f6d4:      	cmp	x3, x2
 1b8f6d8:      	b.eq	0x1b8f8e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38fa5c>
 1b8f6dc:      	add	x1, sp, #0x40
 1b8f6e0:      	mov	x0, x20
 1b8f6e4:      	bl	0x1b942e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x394460>
 1b8f6e8:      	ldr	x0, [x20]
 1b8f6ec:      	mov	w1, #0x1                // =1
 1b8f6f0:      	ldur	x2, [x0, #-0x18]
 1b8f6f4:      	add	x0, x20, x2
 1b8f6f8:      	ldr	x2, [x20, x2]
 1b8f6fc:      	ldr	x2, [x2, #0x60]
 1b8f700:      	blr	x2
 1b8f704:      	add	x0, sp, #0x48
 1b8f708:      	bl	0x1b7bc40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x37bdb8>
 1b8f70c:      	ldr	x1, [x20]
 1b8f710:      	b	0x1b8f548 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f6c0>
 1b8f714:      	ldr	x3, [x2, #0x68]
 1b8f718:      	adrp	x2, 0x19a8000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1a8178>
 1b8f71c:      	add	x2, x2, #0x340
 1b8f720:      	cmp	x3, x2
 1b8f724:      	b.ne	0x1b8f8c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38fa38>
 1b8f728:      	ldr	w0, [x0, #0xf4]
 1b8f72c:      	b	0x1b8f5b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f730>
 1b8f730:      	ldr	x0, [x19, #0x1828]
 1b8f734:      	mov	w1, #0x9                // =9
 1b8f738:      	bl	0x1f6b3e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x76b558>
 1b8f73c:      	ldr	w1, [x0, #0xc]
 1b8f740:      	cmp	w1, #0xb
 1b8f744:      	b.eq	0x1b8f75c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f8d4>
 1b8f748:      	ldrb	w0, [x0, #0x10]
 1b8f74c:      	cbz	w0, 0x1b8f75c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f8d4>
 1b8f750:      	ldr	x0, [x19, #0x1858]
 1b8f754:      	ldrb	w0, [x0, #0x150]
 1b8f758:      	cbnz	w0, 0x1b8f884 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f9fc>
 1b8f75c:      	ldr	x0, [x19, #0x1818]
 1b8f760:      	adrp	x21, 0x3bd7000 <stdout+0x95f40>
 1b8f764:      	add	x21, x21, #0xd40
 1b8f768:      	ldrb	w0, [x0, #0xac]
 1b8f76c:      	cbnz	w0, 0x1b8f78c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f904>
 1b8f770:      	ldr	x0, [x19, #0x1868]
 1b8f774:      	ldrb	w1, [x0, #0xa9]
 1b8f778:      	cbnz	w1, 0x1b8f784 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f8fc>
 1b8f77c:      	ldrb	w0, [x0, #0xa8]
 1b8f780:      	cbz	w0, 0x1b8f90c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38fa84>
 1b8f784:      	adrp	x21, 0x3bd7000 <stdout+0x95f40>
 1b8f788:      	add	x21, x21, #0xe00
 1b8f78c:      	mov	x1, x21
 1b8f790:      	mov	x0, x23
 1b8f794:      	bl	0x23a5050 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc30>
 1b8f798:      	tst	w0, #0xff
 1b8f79c:      	b.ne	0x1b8f85c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f9d4>
 1b8f7a0:      	ldr	w1, [x19, #0x17f0]
 1b8f7a4:      	add	x8, sp, #0x40
 1b8f7a8:      	ldr	x0, [x19, #0x1898]
 1b8f7ac:      	bl	0x1fcc408 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc580>
 1b8f7b0:      	ldp	x1, x0, [sp, #0x40]
 1b8f7b4:      	ldr	x1, [x1, #0x1160]
 1b8f7b8:      	ldrb	w21, [x1, #0xc1]
 1b8f7bc:      	cbz	x0, 0x1b8f7c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f93c>
 1b8f7c0:      	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 1b8f7c4:      	cbz	w21, 0x1b8f7fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f974>
 1b8f7c8:      	ldr	x0, [x19, #0x1808]
 1b8f7cc:      	mov	x1, #-0xdd03            // =-56579
 1b8f7d0:      	movk	x1, #0xff92, lsl #16
 1b8f7d4:      	movk	x1, #0x7fff, lsl #48
 1b8f7d8:      	ldr	x0, [x0, #0xe8]
 1b8f7dc:      	sub	x0, x0, #0x6dd, lsl #12 // =0x6dd000
 1b8f7e0:      	sub	x0, x0, #0xd01
 1b8f7e4:      	cmp	x0, x1
 1b8f7e8:      	b.hi	0x1b8f7fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f974>
 1b8f7ec:      	add	x0, x20, #0x19, lsl #12 // =0x19000
 1b8f7f0:      	mov	w1, #0x1                // =1
 1b8f7f4:      	strb	w1, [x0, #0x7cd]
 1b8f7f8:      	b	0x1b8f51c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f694>
 1b8f7fc:      	add	x0, x20, #0x19, lsl #12 // =0x19000
 1b8f800:      	strb	wzr, [x0, #0x7cd]
 1b8f804:      	b	0x1b8f51c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f694>
 1b8f808:      	ldrb	w0, [x1, #0x139]
 1b8f80c:      	cbz	w0, 0x1b8f6dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38f854>
 1b8f810:      	ldr	x0, [x19, #0x1808]
 1b8f814:      	ldr	x2, [x1, #0x158]
 1b8f818:      	ldr	x3, [x0, #0xb8]
 1b8f81c:      	cmp	x3, x2
