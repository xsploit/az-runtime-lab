
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
 23fb850:      	blr	x1
 23fb854:      	nop
 23fb858:      	mov	x0, x19
 23fb85c:      	mov	x1, #0x30               // =48
 23fb860:      	bl	0x426660 <_ZdlPvm@plt>
 23fb864:      	ldr	w1, [x20, #0x10]
 23fb868:      	ldr	x0, [x20]
 23fb86c:      	cmp	w1, #0x0
 23fb870:      	b.le	0x23fb8c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x864a0>
 23fb874:      	sub	w3, w1, #0x1
 23fb878:      	ldr	x19, [x0, w3, sxtw #3]
 23fb87c:      	str	w3, [x20, #0x10]
 23fb880:      	cbnz	x19, 0x23fb820 <_ZNSt8functionIFvvEEC2ERKS1_+0x86400>
 23fb884:      	sxtw	x2, w1
 23fb888:      	sub	w1, w1, #0x2
 23fb88c:      	sub	x2, x2, #0x2
 23fb890:      	add	x4, x0, #0x8
 23fb894:      	sub	x2, x2, w3, uxtw
 23fb898:      	sxtw	x1, w1
 23fb89c:      	cmp	x1, x2
 23fb8a0:      	b.eq	0x23fb8c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x864a0>
 23fb8a4:      	str	w1, [x20, #0x10]
 23fb8a8:      	sub	x1, x1, #0x1
 23fb8ac:      	ldr	x19, [x4, x1, lsl #3]
 23fb8b0:      	cbnz	x19, 0x23fb820 <_ZNSt8functionIFvvEEC2ERKS1_+0x86400>
 23fb8b4:      	cmp	x1, x2
 23fb8b8:      	b.ne	0x23fb8a4 <_ZNSt8functionIFvvEEC2ERKS1_+0x86484>
 23fb8bc:      	nop
 23fb8c0:      	bl	0x424af0 <free@plt>
 23fb8c4:      	mov	x0, x20
 23fb8c8:      	mov	x1, #0x38               // =56
 23fb8cc:      	bl	0x426660 <_ZdlPvm@plt>
 23fb8d0:      	ldr	w0, [x21, #0x10]
 23fb8d4:      	cmp	w0, #0x0
 23fb8d8:      	b.gt	0x23fb800 <_ZNSt8functionIFvvEEC2ERKS1_+0x863e0>
 23fb8dc:      	ldp	x19, x20, [sp, #0x10]
 23fb8e0:      	ldr	x21, [sp, #0x20]
 23fb8e4:      	ldp	x29, x30, [sp], #0x30
 23fb8e8:      	ret
 23fb8ec:      	sub	x1, x1, #0x8
 23fb8f0:      	cbz	w0, 0x23fb8dc <_ZNSt8functionIFvvEEC2ERKS1_+0x864bc>
 23fb8f4:      	ldr	x20, [x3, x1]
 23fb8f8:      	sub	w0, w0, #0x1
 23fb8fc:      	str	w0, [x21, #0x10]
 23fb900:      	sub	x1, x1, #0x8
 23fb904:      	cbnz	x20, 0x23fb864 <_ZNSt8functionIFvvEEC2ERKS1_+0x86444>
 23fb908:      	b	0x23fb8f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x864d0>
 23fb90c:      	udf	#0x0
 23fb910:      	stp	x29, x30, [sp, #-0x20]!
 23fb914:      	mov	x29, sp
 23fb918:      	stp	x19, x20, [sp, #0x10]
 23fb91c:      	mov	x20, x0
 23fb920:      	b	0x23fb964 <_ZNSt8functionIFvvEEC2ERKS1_+0x86544>
 23fb924:      	ldr	x0, [x19, #0x8]
 23fb928:      	cbz	x0, 0x23fb950 <_ZNSt8functionIFvvEEC2ERKS1_+0x86530>
 23fb92c:      	add	x1, x0, #0x8
 23fb930:      	ldaxr	w2, [x1]
 23fb934:      	sub	w2, w2, #0x1
 23fb938:      	stlxr	w3, w2, [x1]
 23fb93c:      	cbnz	w3, 0x23fb930 <_ZNSt8functionIFvvEEC2ERKS1_+0x86510>
 23fb940:      	cbnz	w2, 0x23fb950 <_ZNSt8functionIFvvEEC2ERKS1_+0x86530>
 23fb944:      	ldr	x1, [x0]
 23fb948:      	ldr	x1, [x1, #0x8]
 23fb94c:      	blr	x1
 23fb950:      	mov	x0, x19
 23fb954:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 23fb958:      	mov	x0, x19
 23fb95c:      	mov	x1, #0x30               // =48
 23fb960:      	bl	0x426660 <_ZdlPvm@plt>
 23fb964:      	ldr	w0, [x20, #0x10]
 23fb968:      	cmp	w0, #0x0
 23fb96c:      	b.le	0x23fb9ac <_ZNSt8functionIFvvEEC2ERKS1_+0x8658c>
 23fb970:      	sub	w0, w0, #0x1
 23fb974:      	ldr	x3, [x20]
 23fb978:      	sxtw	x2, w0
 23fb97c:      	lsl	x1, x2, #3
 23fb980:      	ldr	x19, [x3, x2, lsl #3]
 23fb984:      	str	w0, [x20, #0x10]
 23fb988:      	cbnz	x19, 0x23fb924 <_ZNSt8functionIFvvEEC2ERKS1_+0x86504>
 23fb98c:      	sub	x1, x1, #0x8
 23fb990:      	cbz	w0, 0x23fb9ac <_ZNSt8functionIFvvEEC2ERKS1_+0x8658c>
 23fb994:      	ldr	x19, [x3, x1]
 23fb998:      	sub	w0, w0, #0x1
 23fb99c:      	str	w0, [x20, #0x10]
 23fb9a0:      	sub	x1, x1, #0x8
 23fb9a4:      	cbnz	x19, 0x23fb924 <_ZNSt8functionIFvvEEC2ERKS1_+0x86504>
 23fb9a8:      	cbnz	w0, 0x23fb994 <_ZNSt8functionIFvvEEC2ERKS1_+0x86574>
 23fb9ac:      	ldp	x19, x20, [sp, #0x10]
 23fb9b0:      	ldp	x29, x30, [sp], #0x20
 23fb9b4:      	ret
		...
 23fb9c0:      	stp	x29, x30, [sp, #-0x20]!
 23fb9c4:      	mov	x29, sp
 23fb9c8:      	stp	x19, x20, [sp, #0x10]
 23fb9cc:      	mov	x20, x0
 23fb9d0:      	b	0x23fb9f8 <_ZNSt8functionIFvvEEC2ERKS1_+0x865d8>
 23fb9d4:      	add	x0, x19, #0x10
 23fb9d8:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 23fb9dc:      	add	x0, x19, #0x8
 23fb9e0:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 23fb9e4:      	mov	x0, x19
 23fb9e8:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 23fb9ec:      	mov	x0, x19
 23fb9f0:      	mov	x1, #0x20               // =32
 23fb9f4:      	bl	0x426660 <_ZdlPvm@plt>
 23fb9f8:      	ldr	w0, [x20, #0x10]
 23fb9fc:      	cmp	w0, #0x0
