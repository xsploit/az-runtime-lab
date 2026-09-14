
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002375420 <_ZNSt8functionIFvvEEC2ERKS1_>:
 241e620:      	madd	w7, w1, w7, w8
 241e624:      	lsr	w1, w5, #8
 241e628:      	sturb	w1, [x21, #-0x4]
 241e62c:      	ubfx	x1, x2, #8, #8
 241e630:      	ubfx	x0, x0, #8, #8
 241e634:      	sturb	w1, [x21, #-0x2]
 241e638:      	ubfx	x7, x7, #8, #8
 241e63c:      	sturb	w7, [x21, #-0x3]
 241e640:      	sturb	w0, [x21, #-0x1]
 241e644:      	sub	w20, w20, #0x1
 241e648:      	cmp	w20, #0x0
 241e64c:      	b.le	0x241e728 <_ZNSt8functionIFvvEEC2ERKS1_+0xa9308>
 241e650:      	ldp	w2, w0, [x3, #0x8]
 241e654:      	ldr	w10, [x3, #0x10]
 241e658:      	ldp	w5, w1, [x4, #0x8]
 241e65c:      	ldr	w9, [x4, #0x10]
 241e660:      	ldr	w7, [x19, #0x18]
 241e664:      	ldr	w8, [x19, #0x2c]
 241e668:      	add	w1, w1, w9
 241e66c:      	add	w5, w7, w5
 241e670:      	str	w5, [x4]
 241e674:      	cmp	w1, #0x0
 241e678:      	str	w1, [x4, #0xc]
 241e67c:      	b.le	0x241e694 <_ZNSt8functionIFvvEEC2ERKS1_+0xa9274>
 241e680:      	ldr	w9, [x4, #0x4]
 241e684:      	add	w5, w5, #0x1
 241e688:      	str	w5, [x4]
 241e68c:      	sub	w1, w1, w9
 241e690:      	str	w1, [x4, #0xc]
 241e694:      	add	w0, w0, w10
 241e698:      	add	w1, w8, w2
 241e69c:      	str	w1, [x3]
 241e6a0:      	cmp	w0, #0x0
 241e6a4:      	str	w0, [x3, #0xc]
 241e6a8:      	b.le	0x241e6c0 <_ZNSt8functionIFvvEEC2ERKS1_+0xa92a0>
 241e6ac:      	ldr	w2, [x3, #0x4]
 241e6b0:      	add	w1, w1, #0x1
 241e6b4:      	str	w1, [x3]
 241e6b8:      	sub	w0, w0, w2
 241e6bc:      	str	w0, [x3, #0xc]
 241e6c0:      	ldp	w11, w9, [x19, #0x5c]
 241e6c4:      	add	x21, x21, #0x4
 241e6c8:      	ldr	x5, [x19, #0x50]
 241e6cc:      	asr	w0, w7, #8
 241e6d0:      	asr	w1, w8, #8
 241e6d4:      	ldr	w2, [x19, #0x64]
 241e6d8:      	ldr	x10, [x5]
 241e6dc:      	cbnz	w11, 0x241e594 <_ZNSt8functionIFvvEEC2ERKS1_+0xa9174>
 241e6e0:      	ldr	w7, [x5, #0xc]
 241e6e4:      	cmp	w0, #0x0
 241e6e8:      	ldr	w5, [x5, #0x10]
 241e6ec:      	csel	w0, w0, wzr, ge
 241e6f0:      	cmp	w1, #0x0
 241e6f4:      	csel	w1, w1, wzr, ge
 241e6f8:      	cmp	w0, w9
 241e6fc:      	csel	w0, w0, w9, le
 241e700:      	cmp	w1, w2
 241e704:      	csel	w1, w1, w2, le
 241e708:      	sub	w20, w20, #0x1
 241e70c:      	cmp	w20, #0x0
 241e710:      	mul	w0, w0, w5
 241e714:      	mul	w1, w1, w7
 241e718:      	add	x0, x10, w0, sxtw
 241e71c:      	ldr	w0, [x0, w1, sxtw]
 241e720:      	stur	w0, [x21, #-0x4]
 241e724:      	b.gt	0x241e650 <_ZNSt8functionIFvvEEC2ERKS1_+0xa9230>
 241e728:      	ldp	x19, x20, [sp, #0x10]
 241e72c:      	ldr	x21, [sp, #0x20]
 241e730:      	ldp	x29, x30, [sp], #0x40
 241e734:      	ret
 241e738:      	cmp	w1, w2
 241e73c:      	ldr	w7, [x5, #0xc]
 241e740:      	b.hs	0x241e6e4 <_ZNSt8functionIFvvEEC2ERKS1_+0xa92c4>
 241e744:      	mul	w2, w1, w7
 241e748:      	and	w8, w8, #0xff
 241e74c:      	sub	w11, w6, w8
 241e750:      	sxtw	x1, w7
 241e754:      	sxtw	x12, w2
 241e758:      	tbnz	w0, #0x1f, 0x241e950 <_ZNSt8functionIFvvEEC2ERKS1_+0xa9530>
 241e75c:      	ldr	w0, [x5, #0x10]
 241e760:      	mul	w9, w9, w0
 241e764:      	add	x9, x12, w9, sxtw
 241e768:      	add	x2, x10, x9
 241e76c:      	add	x0, x2, x1
 241e770:      	ldrb	w13, [x10, x9]
 241e774:      	ldrb	w12, [x2, #0x3]
 241e778:      	ldrb	w9, [x2, #0x1]
 241e77c:      	ldrb	w10, [x2, #0x2]
 241e780:      	mul	w13, w13, w11
 241e784:      	ldrb	w1, [x0, #0x3]
 241e788:      	mul	w12, w12, w11
 241e78c:      	ldrb	w7, [x2, w7, sxtw]
 241e790:      	ldrb	w5, [x0, #0x2]
 241e794:      	add	w13, w13, #0x80
 241e798:      	mul	w10, w10, w11
 241e79c:      	ldrb	w2, [x0, #0x1]
 241e7a0:      	mul	w11, w9, w11
 241e7a4:      	add	w0, w12, #0x80
 241e7a8:      	add	w9, w10, #0x80
 241e7ac:      	madd	w7, w7, w8, w13
 241e7b0:      	add	w11, w11, #0x80
 241e7b4:      	madd	w0, w1, w8, w0
 241e7b8:      	madd	w1, w5, w8, w9
 241e7bc:      	madd	w8, w2, w8, w11
 241e7c0:      	lsr	w2, w7, #8
 241e7c4:      	ubfx	x0, x0, #8, #8
 241e7c8:      	sturb	w2, [x21, #-0x4]
 241e7cc:      	ubfx	x1, x1, #8, #8
 241e7d0:      	sturb	w1, [x21, #-0x2]
 241e7d4:      	ubfx	x8, x8, #8, #8
 241e7d8:      	sturb	w8, [x21, #-0x3]
 241e7dc:      	sturb	w0, [x21, #-0x1]
 241e7e0:      	b	0x241e644 <_ZNSt8functionIFvvEEC2ERKS1_+0xa9224>
 241e7e4:      	ldr	w16, [x5, #0xc]
 241e7e8:      	and	w7, w7, #0xff
 241e7ec:      	and	w8, w8, #0xff
 241e7f0:      	sub	w2, w6, w7
 241e7f4:      	sub	w0, w6, w8
 241e7f8:      	mul	w1, w1, w16
 241e7fc:      	mul	w15, w7, w8
 241e800:      	mul	w7, w7, w0
 241e804:      	add	x1, x12, w1, sxtw
 241e808:      	mul	w0, w2, w0
 241e80c:      	add	x5, x10, x1
 241e810:      	mul	w8, w8, w2
 241e814:      	add	x13, x5, x9
 241e818:      	add	x12, x13, w16, sxtw
 241e81c:      	ldrb	w2, [x10, x1]
 241e820:      	ldrb	w17, [x5, w11, sxtw]
 241e824:      	sub	x14, x12, x9
 241e828:      	ldrb	w30, [x13, w16, sxtw]
 241e82c:      	ldrb	w11, [x12, #0x2]
 241e830:      	ldrb	w9, [x12, #0x1]
 241e834:      	ldrb	w18, [x12, #0x3]
 241e838:      	ldrb	w10, [x13, #0x2]
 241e83c:      	mul	w30, w30, w15
 241e840:      	ldrb	w1, [x13, #0x1]
 241e844:      	madd	w17, w17, w7, w30
 241e848:      	ldrb	w16, [x13, #0x3]
 241e84c:      	mul	w13, w11, w15
 241e850:      	ldrb	w12, [x5, #0x3]
 241e854:      	mul	w18, w18, w15
 241e858:      	ldrb	w11, [x5, #0x2]
 241e85c:      	mul	w15, w9, w15
 241e860:      	ldrb	w9, [x5, #0x1]
 241e864:      	madd	w13, w10, w7, w13
 241e868:      	madd	w15, w1, w7, w15
 241e86c:      	ldrb	w10, [x14]
 241e870:      	madd	w16, w16, w7, w18
 241e874:      	ldrb	w1, [x14, #0x3]
 241e878:      	madd	w7, w2, w0, w17
 241e87c:      	ldrb	w5, [x14, #0x2]
 241e880:      	madd	w11, w11, w0, w13
 241e884:      	ldrb	w2, [x14, #0x1]
 241e888:      	madd	w9, w9, w0, w15
 241e88c:      	add	w7, w7, #0x8, lsl #12   // =0x8000
 241e890:      	madd	w12, w12, w0, w16
 241e894:      	add	w11, w11, #0x8, lsl #12 // =0x8000
 241e898:      	add	w9, w9, #0x8, lsl #12   // =0x8000
 241e89c:      	add	w0, w12, #0x8, lsl #12  // =0x8000
 241e8a0:      	madd	w7, w10, w8, w7
 241e8a4:      	madd	w0, w1, w8, w0
 241e8a8:      	madd	w1, w5, w8, w11
 241e8ac:      	madd	w8, w2, w8, w9
 241e8b0:      	lsr	w2, w7, #16
 241e8b4:      	ubfx	x0, x0, #16, #8
 241e8b8:      	sturb	w2, [x21, #-0x4]
 241e8bc:      	ubfx	x1, x1, #16, #8
 241e8c0:      	sturb	w1, [x21, #-0x2]
 241e8c4:      	ubfx	x8, x8, #16, #8
 241e8c8:      	sturb	w8, [x21, #-0x3]
 241e8cc:      	sturb	w0, [x21, #-0x1]
