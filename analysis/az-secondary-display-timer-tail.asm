
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002375420 <_ZNSt8functionIFvvEEC2ERKS1_>:
 24fb440:      	bl	0x426570 <XUnlockDisplay@plt>
 24fb444:      	ldr	w0, [x19, #0x54]
 24fb448:      	ldr	x21, [sp, #0x20]
 24fb44c:      	cbz	w0, 0x24fb374 <_ZNSt8functionIFvvEEC2ERKS1_+0x185f54>
 24fb450:      	adrp	x1, 0x315e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xb9b1a8>
 24fb454:      	adrp	x0, 0x315e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xb9b1a8>
 24fb458:      	add	x1, x1, #0xd28
 24fb45c:      	add	x0, x0, #0xce0
 24fb460:      	bl	0x2539000 <_ZNSt8functionIFvvEEC2ERKS1_+0x1c3be0>
 24fb464:      	ldp	x19, x20, [sp, #0x10]
 24fb468:      	ldp	x29, x30, [sp], #0xf0
 24fb46c:      	ret
 24fb470:      	mov	w1, w0
 24fb474:      	mov	x0, x19
 24fb478:      	bl	0x239cda0 <_ZNSt8functionIFvvEEC2ERKS1_+0x27980>
 24fb47c:      	ldp	x19, x20, [sp, #0x10]
 24fb480:      	ldp	x29, x30, [sp], #0xf0
 24fb484:      	ret
 24fb488:      	mov	x0, x19
 24fb48c:      	bl	0x2398ab0 <_ZNSt8functionIFvvEEC2ERKS1_+0x23690>
 24fb490:      	mov	x0, x19
 24fb494:      	bl	0x24fa6f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x1852d0>
 24fb498:      	ldp	x19, x20, [sp, #0x10]
 24fb49c:      	ldp	x29, x30, [sp], #0xf0
 24fb4a0:      	ret
 24fb4a4:      	mov	x0, x19
 24fb4a8:      	bl	0x2398ab0 <_ZNSt8functionIFvvEEC2ERKS1_+0x23690>
 24fb4ac:      	add	x0, sp, #0x30
 24fb4b0:      	bl	0x23b12b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3be90>
 24fb4b4:      	add	x1, sp, #0x30
 24fb4b8:      	add	x0, x19, #0x20
 24fb4bc:      	bl	0x23b14d0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c0b0>
 24fb4c0:      	add	x0, sp, #0x30
 24fb4c4:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 24fb4c8:      	b	0x24fb390 <_ZNSt8functionIFvvEEC2ERKS1_+0x185f70>
 24fb4cc:      	ldr	w0, [x19, #0x54]
 24fb4d0:      	cbnz	w0, 0x24fb450 <_ZNSt8functionIFvvEEC2ERKS1_+0x186030>
 24fb4d4:      	b	0x24fb374 <_ZNSt8functionIFvvEEC2ERKS1_+0x185f54>
 24fb4d8:      	mov	x19, x0
 24fb4dc:      	cbz	x20, 0x24fb4e8 <_ZNSt8functionIFvvEEC2ERKS1_+0x1860c8>
 24fb4e0:      	mov	x0, x20
 24fb4e4:      	bl	0x426570 <XUnlockDisplay@plt>
 24fb4e8:      	mov	x0, x19
 24fb4ec:      	bl	0x424d10 <_Unwind_Resume@plt>
 24fb4f0:      	ldr	w3, [x0, #0xe0]
 24fb4f4:      	cmp	w3, #0x0
 24fb4f8:      	b.gt	0x24fb500 <_ZNSt8functionIFvvEEC2ERKS1_+0x1860e0>
 24fb4fc:      	ret
 24fb500:      	stp	x29, x30, [sp, #-0x20]!
 24fb504:      	mov	x29, sp
 24fb508:      	stp	x19, x20, [sp, #0x10]
 24fb50c:      	mov	x19, x0
 24fb510:      	mov	x20, x1
 24fb514:      	bl	0x246e1a0 <_ZNSt8functionIFvvEEC2ERKS1_+0xf8d80>
 24fb518:      	mov	x2, x0
 24fb51c:      	mov	x1, x20
 24fb520:      	ldrb	w3, [x19, #0xe4]
 24fb524:      	ldr	w4, [x19, #0x28]
 24fb528:      	add	x0, x0, #0x80
 24fb52c:      	ldr	x6, [x2, #0x80]
 24fb530:      	add	x2, x19, #0x8
 24fb534:      	ldr	w5, [x19, #0xe0]
 24fb538:      	ldp	x19, x20, [sp, #0x10]
 24fb53c:      	ldp	x29, x30, [sp], #0x20
 24fb540:      	ldr	x6, [x6, #0x10]
 24fb544:      	br	x6
		...
 24fb550:      	ldr	x3, [x0, #0x110]
 24fb554:      	cbz	x3, 0x24fb55c <_ZNSt8functionIFvvEEC2ERKS1_+0x18613c>
 24fb558:      	ret
 24fb55c:      	sub	sp, sp, #0xb0
 24fb560:      	stp	x29, x30, [sp, #0x20]
 24fb564:      	add	x29, sp, #0x20
 24fb568:      	stp	x19, x20, [sp, #0x30]
 24fb56c:      	mov	x19, x0
 24fb570:      	mov	x20, x1
 24fb574:      	stp	x21, x22, [sp, #0x40]
 24fb578:      	add	x22, x19, #0xc8
 24fb57c:      	stp	x23, x24, [sp, #0x50]
 24fb580:      	stp	x25, x26, [sp, #0x60]
 24fb584:      	stp	x27, x28, [sp, #0x70]
 24fb588:      	bl	0x246e1a0 <_ZNSt8functionIFvvEEC2ERKS1_+0xf8d80>
 24fb58c:      	add	x25, x0, #0x40
 24fb590:      	ldr	d0, [x19, #0x28]
 24fb594:      	ldr	x0, [x0, #0x40]
 24fb598:      	str	xzr, [sp, #0xa0]
 24fb59c:      	ldr	x1, [x19, #0xd8]
 24fb5a0:      	str	d0, [sp, #0xa8]
 24fb5a4:      	ldrb	w26, [x19, #0x10e]
 24fb5a8:      	ldrb	w27, [x19, #0x10c]
 24fb5ac:      	ldrb	w28, [x19, #0x118]
 24fb5b0:      	ldrb	w6, [x19, #0x10d]
 24fb5b4:      	ldr	x24, [x0, #0x18]
 24fb5b8:      	cbz	x1, 0x24fb688 <_ZNSt8functionIFvvEEC2ERKS1_+0x186268>
 24fb5bc:      	ldr	w0, [x22, #0x8]
 24fb5c0:      	mov	w23, #0x1               // =1
 24fb5c4:      	cbz	w0, 0x24fb600 <_ZNSt8functionIFvvEEC2ERKS1_+0x1861e0>
 24fb5c8:      	ldr	x0, [x1]
 24fb5cc:      	ldrsw	x7, [x1, #0x10]
 24fb5d0:      	add	x7, x0, x7, lsl #3
 24fb5d4:      	cmp	x0, x7
 24fb5d8:      	b.eq	0x24fb688 <_ZNSt8functionIFvvEEC2ERKS1_+0x186268>
 24fb5dc:      	mov	w1, #0x0                // =0
 24fb5e0:      	ldr	x2, [x0], #0x8
 24fb5e4:      	ldrb	w2, [x2, #0x46]
 24fb5e8:      	cmp	w2, #0x0
 24fb5ec:      	cinc	w1, w1, eq
 24fb5f0:      	cmp	x7, x0
 24fb5f4:      	b.ne	0x24fb5e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x1861c0>
 24fb5f8:      	cmp	w1, #0x0
 24fb5fc:      	cset	w23, ne
 24fb600:      	add	x2, x19, #0x100
 24fb604:      	add	x21, x19, #0x108
 24fb608:      	add	x0, sp, #0x98
 24fb60c:      	str	x2, [sp, #0x80]
 24fb610:      	str	w6, [sp, #0x8c]
 24fb614:      	ldr	x19, [x19, #0xe0]
 24fb618:      	bl	0x23a5000 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbe0>
 24fb61c:      	add	x1, sp, #0x98
 24fb620:      	mov	x0, x21
 24fb624:      	bl	0x23a5050 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc30>
 24fb628:      	tst	w0, #0xff
 24fb62c:      	csel	x21, x21, xzr, ne
 24fb630:      	add	x0, sp, #0x98
 24fb634:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 24fb638:      	stp	x19, x21, [sp, #0x10]
 24fb63c:      	ldr	w6, [sp, #0x8c]
 24fb640:      	ldr	x2, [sp, #0x80]
 24fb644:      	stp	x22, x2, [sp]
 24fb648:      	mov	w7, w23
 24fb64c:      	mov	w5, w28
 24fb650:      	mov	w4, w27
 24fb654:      	mov	w3, w26
 24fb658:      	mov	x1, x20
 24fb65c:      	mov	x0, x25
 24fb660:      	add	x2, sp, #0xa0
 24fb664:      	blr	x24
 24fb668:      	ldp	x29, x30, [sp, #0x20]
 24fb66c:      	ldp	x19, x20, [sp, #0x30]
 24fb670:      	ldp	x21, x22, [sp, #0x40]
 24fb674:      	ldp	x23, x24, [sp, #0x50]
 24fb678:      	ldp	x25, x26, [sp, #0x60]
 24fb67c:      	ldp	x27, x28, [sp, #0x70]
 24fb680:      	add	sp, sp, #0xb0
 24fb684:      	ret
 24fb688:      	mov	w23, #0x0               // =0
 24fb68c:      	b	0x24fb600 <_ZNSt8functionIFvvEEC2ERKS1_+0x1861e0>
 24fb690:      	stp	x29, x30, [sp, #-0x30]!
 24fb694:      	mov	x29, sp
 24fb698:      	stp	x19, x20, [sp, #0x10]
 24fb69c:      	mov	x19, x1
 24fb6a0:      	mov	x20, x2
 24fb6a4:      	str	x21, [sp, #0x20]
 24fb6a8:      	mov	x21, x0
 24fb6ac:      	bl	0x246e1a0 <_ZNSt8functionIFvvEEC2ERKS1_+0xf8d80>
 24fb6b0:      	mov	x2, x0
 24fb6b4:      	add	x1, x21, #0x8
 24fb6b8:      	mov	x5, x20
 24fb6bc:      	mov	x4, x19
