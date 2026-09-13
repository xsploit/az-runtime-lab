
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002375420 <_ZNSt8functionIFvvEEC2ERKS1_>:
 23b04e0:      	stp	x29, x30, [sp, #-0x40]!
 23b04e4:      	mov	x29, sp
 23b04e8:      	stp	x21, x22, [sp, #0x20]
 23b04ec:      	and	w22, w3, #0xff
 23b04f0:      	ldr	x3, [x1]
 23b04f4:      	cbz	x3, 0x23b05a0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b180>
 23b04f8:      	stp	x19, x20, [sp, #0x10]
 23b04fc:      	mov	x20, x1
 23b0500:      	mov	x19, x0
 23b0504:      	ldr	x1, [x0]
 23b0508:      	mov	x21, x2
 23b050c:      	mov	x0, x1
 23b0510:      	ldr	x1, [x1]
 23b0514:      	ldr	x1, [x1, #0x68]
 23b0518:      	blr	x1
 23b051c:      	tst	w0, #0xff
 23b0520:      	b.ne	0x23b05ac <_ZNSt8functionIFvvEEC2ERKS1_+0x3b18c>
 23b0524:      	ldr	x0, [x19]
 23b0528:      	ldr	x1, [x0]
 23b052c:      	cbz	w22, 0x23b05bc <_ZNSt8functionIFvvEEC2ERKS1_+0x3b19c>
 23b0530:      	ldr	x1, [x1, #0x70]
 23b0534:      	blr	x1
 23b0538:      	ldr	x3, [x19]
 23b053c:      	mov	x2, x21
 23b0540:      	mov	x1, x20
 23b0544:      	mov	x0, x3
 23b0548:      	ldr	x3, [x3]
 23b054c:      	ldr	x3, [x3, #0x50]
 23b0550:      	blr	x3
 23b0554:      	ldr	x1, [x19]
 23b0558:      	add	x8, sp, #0x30
 23b055c:      	mov	x0, x1
 23b0560:      	ldr	x1, [x1]
 23b0564:      	ldr	x1, [x1, #0x60]
 23b0568:      	blr	x1
 23b056c:      	ldr	x3, [x19]
 23b0570:      	add	x1, sp, #0x30
 23b0574:      	mov	w2, #0x0                // =0
 23b0578:      	mov	x0, x3
 23b057c:      	ldr	x3, [x3]
 23b0580:      	ldr	x3, [x3, #0xa8]
 23b0584:      	blr	x3
 23b0588:      	ldr	x1, [x19]
 23b058c:      	mov	x0, x1
 23b0590:      	ldr	x1, [x1]
 23b0594:      	ldr	x1, [x1, #0x78]
 23b0598:      	blr	x1
 23b059c:      	ldp	x19, x20, [sp, #0x10]
 23b05a0:      	ldp	x21, x22, [sp, #0x20]
 23b05a4:      	ldp	x29, x30, [sp], #0x40
 23b05a8:      	ret
 23b05ac:      	ldp	x19, x20, [sp, #0x10]
 23b05b0:      	ldp	x21, x22, [sp, #0x20]
 23b05b4:      	ldp	x29, x30, [sp], #0x40
 23b05b8:      	ret
 23b05bc:      	ldr	x3, [x1, #0xc8]
 23b05c0:      	mov	x2, x21
 23b05c4:      	mov	x1, x20
 23b05c8:      	blr	x3
 23b05cc:      	ldp	x19, x20, [sp, #0x10]
 23b05d0:      	ldp	x21, x22, [sp, #0x20]
 23b05d4:      	ldp	x29, x30, [sp], #0x40
 23b05d8:      	ret
 23b05dc:      	nop
 23b05e0:      	scvtf	s1, w2
 23b05e4:      	scvtf	s0, w3
 23b05e8:      	stp	x29, x30, [sp, #-0x30]!
 23b05ec:      	mov	x5, #0x3f800000         // =1065353216
 23b05f0:      	mov	w3, w4
 23b05f4:      	mov	x4, #0x3f80000000000000 // =4575657221408423936
 23b05f8:      	mov	x29, sp
 23b05fc:      	add	x2, sp, #0x18
 23b0600:      	str	x5, [sp, #0x18]
 23b0604:      	str	s1, [sp, #0x20]
 23b0608:      	stur	x4, [sp, #0x24]
 23b060c:      	str	s0, [sp, #0x2c]
 23b0610:      	bl	0x23b04e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b0c0>
 23b0614:      	ldp	x29, x30, [sp], #0x30
 23b0618:      	ret
 23b061c:      	nop
 23b0620:      	ldr	x7, [x1]
 23b0624:      	cbz	x7, 0x23b0678 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b258>
 23b0628:      	stp	x29, x30, [sp, #-0x40]!
 23b062c:      	mov	x6, x0
 23b0630:      	mov	x5, x1
 23b0634:      	mov	x29, sp
 23b0638:      	ldr	d0, [x7, #0x10]
 23b063c:      	and	w4, w4, #0xff
 23b0640:      	add	x8, sp, #0x28
 23b0644:      	mov	x0, x3
 23b0648:      	add	x1, sp, #0x18
 23b064c:      	scvtf	v0.2s, v0.2s
 23b0650:      	str	xzr, [sp, #0x18]
 23b0654:      	str	d0, [sp, #0x20]
 23b0658:      	bl	0x23aea70 <_ZNSt8functionIFvvEEC2ERKS1_+0x39650>
 23b065c:      	add	x2, sp, #0x28
 23b0660:      	mov	w3, w4
 23b0664:      	mov	x1, x5
 23b0668:      	mov	x0, x6
 23b066c:      	bl	0x23b04e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b0c0>
 23b0670:      	ldp	x29, x30, [sp], #0x40
 23b0674:      	ret
 23b0678:      	ret
 23b067c:      	nop
 23b0680:      	dup	v0.4s, w2
 23b0684:      	stp	x29, x30, [sp, #-0x60]!
 23b0688:      	mov	x29, sp
 23b068c:      	ldr	w2, [x6]
 23b0690:      	str	w2, [sp, #0x18]
 23b0694:      	mov	v0.s[1], w3
 23b0698:      	ldr	x2, [x1]
 23b069c:      	mov	v0.s[2], w4
 23b06a0:      	mov	v0.s[3], w5
 23b06a4:      	scvtf	v0.4s, v0.4s
 23b06a8:      	str	q0, [sp, #0x20]
 23b06ac:      	cbz	x2, 0x23b06f4 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b2d4>
 23b06b0:      	ldr	d0, [x2, #0x10]
 23b06b4:      	mov	x5, x0
 23b06b8:      	mov	x4, x1
 23b06bc:      	and	w7, w7, #0xff
