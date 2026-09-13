
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002375420 <_ZNSt8functionIFvvEEC2ERKS1_>:
 24fa6f0:      	sub	sp, sp, #0x1c0
 24fa6f4:      	stp	x29, x30, [sp, #0x20]
 24fa6f8:      	add	x29, sp, #0x20
 24fa6fc:      	stp	x21, x22, [sp, #0x40]
 24fa700:      	mov	x22, x0
 24fa704:      	ldr	w0, [x0, #0x54]
 24fa708:      	str	d8, [sp, #0x80]
 24fa70c:      	cbnz	w0, 0x24fac34 <_ZNSt8functionIFvvEEC2ERKS1_+0x185814>
 24fa710:      	stp	x19, x20, [sp, #0x30]
 24fa714:      	ldr	w19, [x22, #0x40]
 24fa718:      	str	xzr, [sp, #0x110]
 24fa71c:      	str	wzr, [sp, #0x118]
 24fa720:      	cmp	w19, #0x0
 24fa724:      	str	w19, [sp, #0x120]
 24fa728:      	b.eq	0x24fa77c <_ZNSt8functionIFvvEEC2ERKS1_+0x18535c>
 24fa72c:      	b.le	0x24fb228 <_ZNSt8functionIFvvEEC2ERKS1_+0x185e08>
 24fa730:      	sbfiz	x0, x19, #4, #32
 24fa734:      	bl	0x424fd0 <malloc@plt>
 24fa738:      	ldr	x2, [x22, #0x30]
 24fa73c:      	str	x0, [sp, #0x110]
 24fa740:      	str	w19, [sp, #0x118]
 24fa744:      	add	x1, x0, #0x10
 24fa748:      	add	x3, x2, #0x10
 24fa74c:      	sub	w19, w19, #0x1
 24fa750:      	cmp	x0, x3
 24fa754:      	ccmp	x1, x2, #0x0, lo
 24fa758:      	b.hi	0x24fb010 <_ZNSt8functionIFvvEEC2ERKS1_+0x185bf0>
 24fa75c:      	add	x19, x19, #0x1
 24fa760:      	mov	x1, #0x0                // =0
 24fa764:      	lsl	x19, x19, #4
 24fa768:      	ldr	q0, [x2, x1]
 24fa76c:      	str	q0, [x0, x1]
 24fa770:      	add	x1, x1, #0x10
 24fa774:      	cmp	x19, x1
 24fa778:      	b.ne	0x24fa768 <_ZNSt8functionIFvvEEC2ERKS1_+0x185348>
 24fa77c:      	str	wzr, [x22, #0x40]
 24fa780:      	add	x8, sp, #0x100
 24fa784:      	add	x0, sp, #0x110
 24fa788:      	bl	0x24f0dd0 <_ZNSt8functionIFvvEEC2ERKS1_+0x17b9b0>
 24fa78c:      	ldr	w1, [sp, #0x108]
 24fa790:      	cmp	w1, #0x0
 24fa794:      	b.le	0x24fac00 <_ZNSt8functionIFvvEEC2ERKS1_+0x1857e0>
 24fa798:      	ldr	w2, [sp, #0x10c]
 24fa79c:      	cmp	w2, #0x0
 24fa7a0:      	b.le	0x24fac00 <_ZNSt8functionIFvvEEC2ERKS1_+0x1857e0>
 24fa7a4:      	ldr	x0, [x22, #0x20]
 24fa7a8:      	stp	x23, x24, [sp, #0x50]
 24fa7ac:      	add	x20, x22, #0x20
 24fa7b0:      	stp	x25, x26, [sp, #0x60]
 24fa7b4:      	stp	x27, x28, [sp, #0x70]
 24fa7b8:      	cbz	x0, 0x24fa7d4 <_ZNSt8functionIFvvEEC2ERKS1_+0x1853b4>
 24fa7bc:      	mov	x0, x20
 24fa7c0:      	bl	0x23b1510 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c0f0>
 24fa7c4:      	ldr	w1, [sp, #0x108]
 24fa7c8:      	cmp	w0, w1
 24fa7cc:      	b.ge	0x24fb070 <_ZNSt8functionIFvvEEC2ERKS1_+0x185c50>
 24fa7d0:      	ldr	w2, [sp, #0x10c]
 24fa7d4:      	add	w1, w1, #0x1f
 24fa7d8:      	add	w2, w2, #0x1f
 24fa7dc:      	and	w21, w1, #0xffffffe0
 24fa7e0:      	and	w23, w2, #0xffffffe0
 24fa7e4:      	mov	x0, #0xb0               // =176
 24fa7e8:      	bl	0x424d40 <_Znwm@plt>
 24fa7ec:      	ldrb	w1, [x22, #0x50]
 24fa7f0:      	mov	x19, x0
 24fa7f4:      	ldr	x4, [x22, #0x18]
 24fa7f8:      	cmp	w1, #0x0
 24fa7fc:      	cset	w27, ne
 24fa800:      	mov	w3, w23
 24fa804:      	add	w27, w27, #0x1
 24fa808:      	mov	w2, w21
 24fa80c:      	mov	w1, w27
 24fa810:      	ldr	w26, [x4, #0xa0]
 24fa814:      	ldr	x24, [x22, #0x48]
 24fa818:      	ldr	x25, [x4, #0x98]
 24fa81c:      	bl	0x23b1040 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bc20>
 24fa820:      	cmp	w27, #0x1
 24fa824:      	adrp	x1, 0x315e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xb9b1a8>
 24fa828:      	add	x1, x1, #0x518
 24fa82c:      	cset	w0, ne
 24fa830:      	add	w0, w0, #0x3
 24fa834:      	str	x1, [x19]
 24fa838:      	str	xzr, [x19, #0x48]
 24fa83c:      	str	w26, [x19, #0x50]
 24fa840:      	mul	w1, w21, w0
 24fa844:      	stp	xzr, xzr, [x19, #0x58]
 24fa848:      	str	w0, [x19, #0x68]
 24fa84c:      	str	w1, [x19, #0x6c]
 24fa850:      	stp	xzr, xzr, [x19, #0x70]
 24fa854:      	str	x24, [x19, #0x80]
 24fa858:      	cbz	x24, 0x24fa868 <_ZNSt8functionIFvvEEC2ERKS1_+0x185448>
 24fa85c:      	mov	x0, x24
 24fa860:      	bl	0x425a30 <XLockDisplay@plt>
 24fa864:      	ldr	w26, [x19, #0x50]
 24fa868:      	strb	wzr, [x19, #0xa8]
 24fa86c:      	cmp	w26, #0x10
 24fa870:      	b.hi	0x24fac68 <_ZNSt8functionIFvvEEC2ERKS1_+0x185848>
 24fa874:      	ldr	w26, [x19, #0x6c]
 24fa878:      	ldr	x0, [x19, #0x58]
 24fa87c:      	mul	w26, w23, w26
 24fa880:      	bl	0x424af0 <free@plt>
 24fa884:      	sxtw	x26, w26
 24fa888:      	mov	x0, x26
 24fa88c:      	bl	0x424fd0 <malloc@plt>
 24fa890:      	mov	x26, x0
 24fa894:      	str	x26, [x19, #0x58]
 24fa898:      	str	x26, [x19, #0x70]
 24fa89c:      	mov	x1, #0x88               // =136
 24fa8a0:      	mov	x0, #0x1                // =1
 24fa8a4:      	bl	0x424390 <calloc@plt>
 24fa8a8:      	ldr	x2, [x19, #0x80]
 24fa8ac:      	mov	x1, #0x200000000        // =8589934592
 24fa8b0:      	str	x1, [x0, #0x8]
 24fa8b4:      	mov	w6, #0x20               // =32
 24fa8b8:      	mov	x5, #0xff0000           // =16711680
 24fa8bc:      	mov	x4, #0xff00             // =65280
 24fa8c0:      	ldp	w9, w8, [x2, #0x50]
 24fa8c4:      	mov	x3, #0xff               // =255
 24fa8c8:      	ldr	w7, [x2, #0x5c]
 24fa8cc:      	ldp	w1, w2, [x19, #0x68]
 24fa8d0:      	stp	w21, w23, [x0]
 24fa8d4:      	str	x26, [x0, #0x10]
 24fa8d8:      	ldr	w26, [x19, #0x50]
 24fa8dc:      	lsl	w1, w1, #3
 24fa8e0:      	stp	w9, w8, [x0, #0x18]
 24fa8e4:      	stp	w7, w6, [x0, #0x20]
 24fa8e8:      	cmp	w26, #0x10
 24fa8ec:      	stp	w1, w2, [x0, #0x28]
 24fa8f0:      	str	w1, [x0, #0x30]
 24fa8f4:      	stp	x5, x4, [x0, #0x38]
 24fa8f8:      	str	x3, [x0, #0x48]
 24fa8fc:      	str	x0, [x19, #0x48]
 24fa900:      	b.eq	0x24fb14c <_ZNSt8functionIFvvEEC2ERKS1_+0x185d2c>
 24fa904:      	bl	0x426ce0 <XInitImage@plt>
 24fa908:      	cbz	w0, 0x24fb08c <_ZNSt8functionIFvvEEC2ERKS1_+0x185c6c>
 24fa90c:      	cbz	x24, 0x24fa918 <_ZNSt8functionIFvvEEC2ERKS1_+0x1854f8>
 24fa910:      	mov	x0, x24
 24fa914:      	bl	0x426570 <XUnlockDisplay@plt>
 24fa918:      	add	x0, sp, #0x140
 24fa91c:      	mov	x1, x19
 24fa920:      	mov	x19, x0
 24fa924:      	bl	0x23b12c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bea0>
 24fa928:      	mov	x1, x19
 24fa92c:      	mov	x0, x20
 24fa930:      	bl	0x23b14d0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c0b0>
 24fa934:      	mov	x0, x19
 24fa938:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 24fa93c:      	ldr	w19, [sp, #0x120]
