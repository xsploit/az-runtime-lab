
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1fcc360:      	b	0x1fcc328 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc4a0>
 1fcc364:      	udf	#0x0
 1fcc368:      	stp	x29, x30, [sp, #-0x20]!
 1fcc36c:      	mov	x29, sp
 1fcc370:      	stp	x19, x20, [sp, #0x10]
 1fcc374:      	mov	x19, x0
 1fcc378:      	add	x0, x0, #0xc0
 1fcc37c:      	bl	0xa4d178 <_ZSt20__throw_bad_weak_ptrv+0x142560>
 1fcc380:      	add	x20, x19, #0x10
 1fcc384:      	add	x0, x19, #0xb0
 1fcc388:      	bl	0xafaa20 <_ZSt20__throw_bad_weak_ptrv+0x1efe08>
 1fcc38c:      	mov	x0, x20
 1fcc390:      	ldp	x19, x20, [sp, #0x10]
 1fcc394:      	ldp	x29, x30, [sp], #0x20
 1fcc398:      	b	0x1fa0cd0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7a0e48>
 1fcc39c:      	udf	#0x0
 1fcc3a0:      	stp	x29, x30, [sp, #-0x20]!
 1fcc3a4:      	mov	x29, sp
 1fcc3a8:      	str	x19, [sp, #0x10]
 1fcc3ac:      	mov	x19, x0
 1fcc3b0:      	ldrb	w0, [x0, #0x1]
 1fcc3b4:      	cbnz	w0, 0x1fcc3f4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc56c>
 1fcc3b8:      	mov	x0, #0x0                // =0
 1fcc3bc:      	ldrb	w2, [x19]
 1fcc3c0:      	mov	x1, #0xb3               // =179
 1fcc3c4:      	movk	x1, #0x8900, lsl #48
 1fcc3c8:      	mov	x3, #0x68a2             // =26786
 1fcc3cc:      	add	x0, x2, x0
 1fcc3d0:      	movk	x3, #0x3f88, lsl #16
 1fcc3d4:      	movk	x3, #0x5d6e, lsl #32
 1fcc3d8:      	movk	x3, #0x1de, lsl #48
 1fcc3dc:      	umulh	x1, x0, x1
 1fcc3e0:      	ldr	x19, [sp, #0x10]
 1fcc3e4:      	lsr	x1, x1, #56
 1fcc3e8:      	ldp	x29, x30, [sp], #0x20
 1fcc3ec:      	msub	x0, x1, x3, x0
 1fcc3f0:      	ret
 1fcc3f4:      	add	x0, x19, #0x1
 1fcc3f8:      	bl	0x1fcc3a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc518>
 1fcc3fc:      	add	x1, x0, x0, lsl #4
 1fcc400:      	add	x0, x0, x1, lsl #3
 1fcc404:      	b	0x1fcc3bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc534>
 1fcc408:      	stp	x29, x30, [sp, #-0x20]!
 1fcc40c:      	cmp	w1, #0x2
 1fcc410:      	mov	x29, sp
 1fcc414:      	str	x19, [sp, #0x10]
 1fcc418:      	mov	x19, x8
 1fcc41c:      	b.eq	0x1fcc4c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc640>
 1fcc420:      	b.le	0x1fcc44c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc5c4>
 1fcc424:      	cmp	w1, #0x3
 1fcc428:      	b.eq	0x1fcc4dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc654>
 1fcc42c:      	mov	x1, #0x0                // =0
 1fcc430:      	mov	w0, #0x0                // =0
 1fcc434:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1fcc438:      	stp	xzr, xzr, [x19]
 1fcc43c:      	mov	x0, x19
 1fcc440:      	ldr	x19, [sp, #0x10]
 1fcc444:      	ldp	x29, x30, [sp], #0x20
 1fcc448:      	ret
 1fcc44c:      	cbz	w1, 0x1fcc4b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc62c>
 1fcc450:      	cmp	w1, #0x1
 1fcc454:      	b.ne	0x1fcc42c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc5a4>
 1fcc458:      	ldr	x1, [x0, #0x18]
 1fcc45c:      	ldr	x0, [x0, #0x10]
 1fcc460:      	stp	x0, x1, [x8]
 1fcc464:      	cbz	x1, 0x1fcc43c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc5b4>
 1fcc468:      	adrp	x0, 0x2df0000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x82d1a8>
 1fcc46c:      	ldr	x0, [x0, #0xd90]
 1fcc470:      	cbz	x0, 0x1fcc498 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc610>
 1fcc474:      	add	x1, x1, #0x8
 1fcc478:      	ldaxr	w0, [x1]
 1fcc47c:      	add	w0, w0, #0x1
 1fcc480:      	stlxr	w2, w0, [x1]
 1fcc484:      	cbnz	w2, 0x1fcc478 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc5f0>
 1fcc488:      	mov	x0, x19
 1fcc48c:      	ldr	x19, [sp, #0x10]
 1fcc490:      	ldp	x29, x30, [sp], #0x20
 1fcc494:      	ret
 1fcc498:      	ldr	w0, [x1, #0x8]
 1fcc49c:      	add	w0, w0, #0x1
 1fcc4a0:      	str	w0, [x1, #0x8]
 1fcc4a4:      	mov	x0, x19
 1fcc4a8:      	ldr	x19, [sp, #0x10]
 1fcc4ac:      	ldp	x29, x30, [sp], #0x20
 1fcc4b0:      	ret
 1fcc4b4:      	ldr	x1, [x0, #0x8]
 1fcc4b8:      	ldr	x0, [x0]
 1fcc4bc:      	stp	x0, x1, [x8]
 1fcc4c0:      	cbnz	x1, 0x1fcc468 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc5e0>
 1fcc4c4:      	b	0x1fcc43c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc5b4>
 1fcc4c8:      	ldr	x1, [x0, #0x28]
 1fcc4cc:      	ldr	x0, [x0, #0x20]
 1fcc4d0:      	stp	x0, x1, [x8]
 1fcc4d4:      	cbnz	x1, 0x1fcc468 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc5e0>
 1fcc4d8:      	b	0x1fcc43c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc5b4>
 1fcc4dc:      	ldr	x1, [x0, #0x38]
 1fcc4e0:      	ldr	x0, [x0, #0x30]
 1fcc4e4:      	stp	x0, x1, [x8]
 1fcc4e8:      	cbnz	x1, 0x1fcc468 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc5e0>
 1fcc4ec:      	b	0x1fcc43c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc5b4>
 1fcc4f0:      	stp	x29, x30, [sp, #-0x20]!
 1fcc4f4:      	mov	x29, sp
 1fcc4f8:      	stp	x19, x20, [sp, #0x10]
 1fcc4fc:      	mov	x19, x0
 1fcc500:      	add	x20, x0, #0x40
 1fcc504:      	ldr	x0, [x19], #0x10
 1fcc508:      	bl	0x1fc9b70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7c9ce8>
 1fcc50c:      	cmp	x19, x20
 1fcc510:      	b.ne	0x1fcc504 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc67c>
 1fcc514:      	ldp	x19, x20, [sp, #0x10]
 1fcc518:      	ldp	x29, x30, [sp], #0x20
 1fcc51c:      	ret
 1fcc520:      	stp	x29, x30, [sp, #-0x100]!
 1fcc524:      	mov	x29, sp
 1fcc528:      	stp	x19, x20, [sp, #0x10]
 1fcc52c:      	mov	x20, x0
 1fcc530:      	add	x0, x0, #0x40
 1fcc534:      	stp	x21, x22, [sp, #0x20]
 1fcc538:      	mov	x22, x1
 1fcc53c:      	stp	x23, x24, [sp, #0x30]
 1fcc540:      	mov	x23, x3
 1fcc544:      	stp	x25, x26, [sp, #0x40]
 1fcc548:      	mov	x26, x2
 1fcc54c:      	mov	x25, x4
 1fcc550:      	stp	x27, x28, [sp, #0x50]
 1fcc554:      	str	d8, [sp, #0x60]
 1fcc558:      	stp	xzr, xzr, [x20]
 1fcc55c:      	stp	xzr, xzr, [x20, #0x10]
 1fcc560:      	stp	xzr, xzr, [x20, #0x20]
 1fcc564:      	stp	xzr, xzr, [x20, #0x30]
 1fcc568:      	stp	xzr, xzr, [x20, #0x40]
 1fcc56c:      	str	xzr, [x20, #0x50]
 1fcc570:      	str	x0, [sp, #0xa0]
 1fcc574:      	mov	x0, #0x80               // =128
 1fcc578:      	bl	0x424d40 <_Znwm@plt>
 1fcc57c:      	movi	v0.2s, #0x1
 1fcc580:      	mov	x21, x0
 1fcc584:      	mov	x19, x0
 1fcc588:      	adrp	x0, 0x2def000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x82c1a8>
 1fcc58c:      	add	x0, x0, #0xe30
 1fcc590:      	str	d0, [x21, #0x8]
 1fcc594:      	str	x0, [x19], #0x10
 1fcc598:      	mov	x0, x19
 1fcc59c:      	bl	0x1f4f150 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x74f2c8>
 1fcc5a0:      	stp	x19, x21, [x20, #0x50]
 1fcc5a4:      	mov	w1, #0x0                // =0
 1fcc5a8:      	mov	x0, x26
 1fcc5ac:      	bl	0x1e13138 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6132b0>
 1fcc5b0:      	mov	x27, x0
 1fcc5b4:      	mov	x0, #0x1180             // =4480
 1fcc5b8:      	bl	0x424d40 <_Znwm@plt>
 1fcc5bc:      	movi	v0.2s, #0x1
 1fcc5c0:      	mov	x21, x0
 1fcc5c4:      	adrp	x19, 0x2def000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x82c1a8>
 1fcc5c8:      	add	x19, x19, #0xe68
 1fcc5cc:      	mov	x24, x0
 1fcc5d0:      	mov	x2, x27
 1fcc5d4:      	mov	w5, #0x0                // =0
 1fcc5d8:      	mov	x4, x25
 1fcc5dc:      	str	d0, [x0, #0x8]
 1fcc5e0:      	mov	x3, x23
 1fcc5e4:      	str	x19, [x21], #0x10
 1fcc5e8:      	mov	x1, x22
 1fcc5ec:      	mov	x0, x21
 1fcc5f0:      	bl	0x1fc9bf8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7c9d70>
 1fcc5f4:      	ldr	x0, [x20, #0x8]
 1fcc5f8:      	stp	x21, x24, [x20]
 1fcc5fc:      	cbz	x0, 0x1fcc604 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc77c>
