
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002375420 <_ZNSt8functionIFvvEEC2ERKS1_>:
 23fb5b0:      	ldr	x0, [x0, #0x8]
 23fb5b4:      	ldr	x3, [x0]
 23fb5b8:      	cbz	x3, 0x23fb5c4 <_ZNSt8functionIFvvEEC2ERKS1_+0x861a4>
 23fb5bc:      	ldrb	w3, [x0, #0x33]
 23fb5c0:      	cbnz	w3, 0x23fb5c8 <_ZNSt8functionIFvvEEC2ERKS1_+0x861a8>
 23fb5c4:      	ret
 23fb5c8:      	mov	x3, #0x0                // =0
 23fb5cc:      	b	0x23fad60 <_ZNSt8functionIFvvEEC2ERKS1_+0x85940>
 23fb5d0:      	stp	x29, x30, [sp, #-0x30]!
 23fb5d4:      	mov	x29, sp
 23fb5d8:      	stp	x19, x20, [sp, #0x10]
 23fb5dc:      	mov	x20, x0
 23fb5e0:      	str	x21, [sp, #0x20]
 23fb5e4:      	b	0x23fb678 <_ZNSt8functionIFvvEEC2ERKS1_+0x86258>
 23fb5e8:      	ldr	x0, [x19, #0x50]
 23fb5ec:      	cbz	x0, 0x23fb618 <_ZNSt8functionIFvvEEC2ERKS1_+0x861f8>
 23fb5f0:      	add	x1, x0, #0x8
 23fb5f4:      	ldaxr	w2, [x1]
 23fb5f8:      	sub	w2, w2, #0x1
 23fb5fc:      	stlxr	w3, w2, [x1]
 23fb600:      	cbnz	w3, 0x23fb5f4 <_ZNSt8functionIFvvEEC2ERKS1_+0x861d4>
 23fb604:      	cbnz	w2, 0x23fb618 <_ZNSt8functionIFvvEEC2ERKS1_+0x861f8>
 23fb608:      	ldr	x1, [x0]
 23fb60c:      	ldr	x1, [x1, #0x8]
 23fb610:      	blr	x1
 23fb614:      	nop
 23fb618:      	ldr	x0, [x19, #0x30]
 23fb61c:      	cbz	x0, 0x23fb648 <_ZNSt8functionIFvvEEC2ERKS1_+0x86228>
 23fb620:      	add	x1, x0, #0x8
 23fb624:      	ldaxr	w2, [x1]
 23fb628:      	sub	w2, w2, #0x1
 23fb62c:      	stlxr	w3, w2, [x1]
 23fb630:      	cbnz	w3, 0x23fb624 <_ZNSt8functionIFvvEEC2ERKS1_+0x86204>
 23fb634:      	cbnz	w2, 0x23fb648 <_ZNSt8functionIFvvEEC2ERKS1_+0x86228>
 23fb638:      	ldr	x1, [x0]
 23fb63c:      	ldr	x1, [x1, #0x8]
 23fb640:      	blr	x1
 23fb644:      	nop
 23fb648:      	ldr	x21, [x19, #0x28]
 23fb64c:      	cbz	x21, 0x23fb664 <_ZNSt8functionIFvvEEC2ERKS1_+0x86244>
 23fb650:      	ldr	x0, [x21, #0x18]
 23fb654:      	bl	0x424af0 <free@plt>
 23fb658:      	mov	x0, x21
 23fb65c:      	mov	x1, #0x30               // =48
 23fb660:      	bl	0x426660 <_ZdlPvm@plt>
 23fb664:      	ldr	x0, [x19]
 23fb668:      	bl	0x424af0 <free@plt>
 23fb66c:      	mov	x0, x19
 23fb670:      	mov	x1, #0x58               // =88
 23fb674:      	bl	0x426660 <_ZdlPvm@plt>
 23fb678:      	ldr	w0, [x20, #0x10]
 23fb67c:      	cmp	w0, #0x0
 23fb680:      	b.le	0x23fb6c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x862a0>
 23fb684:      	sub	w0, w0, #0x1
 23fb688:      	ldr	x3, [x20]
 23fb68c:      	sxtw	x2, w0
 23fb690:      	lsl	x1, x2, #3
 23fb694:      	ldr	x19, [x3, x2, lsl #3]
 23fb698:      	str	w0, [x20, #0x10]
 23fb69c:      	cbnz	x19, 0x23fb5e8 <_ZNSt8functionIFvvEEC2ERKS1_+0x861c8>
 23fb6a0:      	sub	x1, x1, #0x8
 23fb6a4:      	cbz	w0, 0x23fb6c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x862a0>
 23fb6a8:      	ldr	x19, [x3, x1]
 23fb6ac:      	sub	w0, w0, #0x1
 23fb6b0:      	str	w0, [x20, #0x10]
 23fb6b4:      	sub	x1, x1, #0x8
 23fb6b8:      	cbnz	x19, 0x23fb5e8 <_ZNSt8functionIFvvEEC2ERKS1_+0x861c8>
 23fb6bc:      	cbnz	w0, 0x23fb6a8 <_ZNSt8functionIFvvEEC2ERKS1_+0x86288>
 23fb6c0:      	ldp	x19, x20, [sp, #0x10]
 23fb6c4:      	ldr	x21, [sp, #0x20]
 23fb6c8:      	ldp	x29, x30, [sp], #0x30
 23fb6cc:      	ret
 23fb6d0:      	stp	x29, x30, [sp, #-0x20]!
 23fb6d4:      	mov	x29, sp
 23fb6d8:      	stp	x19, x20, [sp, #0x10]
 23fb6dc:      	mov	x20, x0
 23fb6e0:      	b	0x23fb700 <_ZNSt8functionIFvvEEC2ERKS1_+0x862e0>
 23fb6e4:      	ldr	x0, [x19, #0x40]
 23fb6e8:      	bl	0x424af0 <free@plt>
 23fb6ec:      	ldr	x0, [x19, #0x8]
 23fb6f0:      	bl	0x424af0 <free@plt>
 23fb6f4:      	mov	x0, x19
 23fb6f8:      	mov	x1, #0x58               // =88
 23fb6fc:      	bl	0x426660 <_ZdlPvm@plt>
 23fb700:      	ldr	w0, [x20, #0x10]
 23fb704:      	cmp	w0, #0x0
 23fb708:      	b.le	0x23fb748 <_ZNSt8functionIFvvEEC2ERKS1_+0x86328>
 23fb70c:      	sub	w0, w0, #0x1
 23fb710:      	ldr	x3, [x20]
 23fb714:      	sxtw	x2, w0
 23fb718:      	lsl	x1, x2, #3
 23fb71c:      	ldr	x19, [x3, x2, lsl #3]
 23fb720:      	str	w0, [x20, #0x10]
 23fb724:      	cbnz	x19, 0x23fb6e4 <_ZNSt8functionIFvvEEC2ERKS1_+0x862c4>
 23fb728:      	sub	x1, x1, #0x8
 23fb72c:      	cbz	w0, 0x23fb748 <_ZNSt8functionIFvvEEC2ERKS1_+0x86328>
 23fb730:      	ldr	x19, [x3, x1]
 23fb734:      	sub	w0, w0, #0x1
 23fb738:      	str	w0, [x20, #0x10]
 23fb73c:      	sub	x1, x1, #0x8
 23fb740:      	cbnz	x19, 0x23fb6e4 <_ZNSt8functionIFvvEEC2ERKS1_+0x862c4>
 23fb744:      	cbnz	w0, 0x23fb730 <_ZNSt8functionIFvvEEC2ERKS1_+0x86310>
 23fb748:      	ldp	x19, x20, [sp, #0x10]
 23fb74c:      	ldp	x29, x30, [sp], #0x20
 23fb750:      	ret
		...
 23fb760:      	ldr	w2, [x0, #0x10]
 23fb764:      	cmp	w2, #0x0
 23fb768:      	b.le	0x23fb7d4 <_ZNSt8functionIFvvEEC2ERKS1_+0x863b4>
 23fb76c:      	stp	x29, x30, [sp, #-0x20]!
 23fb770:      	mov	x29, sp
 23fb774:      	stp	x19, x20, [sp, #0x10]
 23fb778:      	mov	x20, x0
 23fb77c:      	mov	x19, #0x0               // =0
 23fb780:      	ldr	x1, [x20]
 23fb784:      	lsl	x0, x19, #5
 23fb788:      	ldr	x1, [x1, x0]
 23fb78c:      	add	x0, x1, #0x8
 23fb790:      	cbz	x1, 0x23fb7bc <_ZNSt8functionIFvvEEC2ERKS1_+0x8639c>
 23fb794:      	ldaxr	w2, [x0]
 23fb798:      	sub	w2, w2, #0x1
 23fb79c:      	stlxr	w3, w2, [x0]
 23fb7a0:      	cbnz	w3, 0x23fb794 <_ZNSt8functionIFvvEEC2ERKS1_+0x86374>
 23fb7a4:      	mov	x0, x1
 23fb7a8:      	cbnz	w2, 0x23fb7b8 <_ZNSt8functionIFvvEEC2ERKS1_+0x86398>
 23fb7ac:      	ldr	x1, [x1]
 23fb7b0:      	ldr	x1, [x1, #0x8]
 23fb7b4:      	blr	x1
 23fb7b8:      	ldr	w2, [x20, #0x10]
 23fb7bc:      	add	x19, x19, #0x1
 23fb7c0:      	cmp	w2, w19
 23fb7c4:      	b.gt	0x23fb780 <_ZNSt8functionIFvvEEC2ERKS1_+0x86360>
 23fb7c8:      	ldp	x19, x20, [sp, #0x10]
 23fb7cc:      	ldp	x29, x30, [sp], #0x20
 23fb7d0:      	ret
 23fb7d4:      	ret
		...
 23fb7e0:      	stp	x29, x30, [sp, #-0x30]!
 23fb7e4:      	mov	x29, sp
 23fb7e8:      	str	x21, [sp, #0x20]
 23fb7ec:      	mov	x21, x0
 23fb7f0:      	stp	x19, x20, [sp, #0x10]
 23fb7f4:      	ldr	w0, [x21, #0x10]
 23fb7f8:      	cmp	w0, #0x0
 23fb7fc:      	b.le	0x23fb8dc <_ZNSt8functionIFvvEEC2ERKS1_+0x864bc>
 23fb800:      	sub	w0, w0, #0x1
 23fb804:      	ldr	x3, [x21]
 23fb808:      	sxtw	x2, w0
 23fb80c:      	lsl	x1, x2, #3
 23fb810:      	ldr	x20, [x3, x2, lsl #3]
 23fb814:      	str	w0, [x21, #0x10]
 23fb818:      	cbnz	x20, 0x23fb864 <_ZNSt8functionIFvvEEC2ERKS1_+0x86444>
 23fb81c:      	b	0x23fb8ec <_ZNSt8functionIFvvEEC2ERKS1_+0x864cc>
 23fb820:      	ldr	x0, [x19, #0x10]
 23fb824:      	bl	0x424af0 <free@plt>
 23fb828:      	ldr	x0, [x19]
 23fb82c:      	cbz	x0, 0x23fb858 <_ZNSt8functionIFvvEEC2ERKS1_+0x86438>
 23fb830:      	add	x1, x0, #0x8
 23fb834:      	ldaxr	w2, [x1]
 23fb838:      	sub	w2, w2, #0x1
 23fb83c:      	stlxr	w3, w2, [x1]
 23fb840:      	cbnz	w3, 0x23fb834 <_ZNSt8functionIFvvEEC2ERKS1_+0x86414>
 23fb844:      	cbnz	w2, 0x23fb858 <_ZNSt8functionIFvvEEC2ERKS1_+0x86438>
 23fb848:      	ldr	x1, [x0]
 23fb84c:      	ldr	x1, [x1, #0x8]
