
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1b857b0:      	stp	x29, x30, [sp, #-0x60]!
 1b857b4:      	mov	w4, #0x0                // =0
 1b857b8:      	mov	w3, #0x0                // =0
 1b857bc:      	mov	x29, sp
 1b857c0:      	stp	x19, x20, [sp, #0x10]
 1b857c4:      	mov	x19, x0
 1b857c8:      	mov	x20, x1
 1b857cc:      	str	x23, [sp, #0x30]
 1b857d0:      	add	x23, x0, #0x110
 1b857d4:      	mov	w2, #0x0                // =0
 1b857d8:      	stp	x21, x22, [sp, #0x20]
 1b857dc:      	add	x22, x0, #0x108
 1b857e0:      	mov	x0, x1
 1b857e4:      	mov	x1, x23
 1b857e8:      	bl	0x23b05e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b1c0>
 1b857ec:      	ldr	w3, [x19, #0x88]
 1b857f0:      	mov	x1, x22
 1b857f4:      	mov	x0, x20
 1b857f8:      	mov	w4, #0x0                // =0
 1b857fc:      	mov	w2, #0x0                // =0
 1b85800:      	bl	0x23b05e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b1c0>
 1b85804:      	ldr	w21, [x19, #0x8c]
 1b85808:      	mov	x0, x22
 1b8580c:      	bl	0x23b1530 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c110>
 1b85810:      	subs	w21, w21, w0
 1b85814:      	b.ne	0x1b85858 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3859d0>
 1b85818:      	add	x0, x19, #0x8, lsl #12  // =0x8000
 1b8581c:      	ldr	x0, [x0, #0x688]
 1b85820:      	ldrb	w1, [x0, #0xc1]
 1b85824:      	cbnz	w1, 0x1b858bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x385a34>
 1b85828:      	ldp	w5, w3, [x19, #0x88]
 1b8582c:      	mov	x1, x23
 1b85830:      	mov	x0, x20
 1b85834:      	mov	w4, #0x0                // =0
 1b85838:      	mov	w2, #0x0                // =0
 1b8583c:      	add	w3, w5, w3
 1b85840:      	bl	0x23b05e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b1c0>
 1b85844:      	ldp	x19, x20, [sp, #0x10]
 1b85848:      	ldp	x21, x22, [sp, #0x20]
 1b8584c:      	ldr	x23, [sp, #0x30]
 1b85850:      	ldp	x29, x30, [sp], #0x60
 1b85854:      	ret
 1b85858:      	add	x0, sp, #0x48
 1b8585c:      	adrp	x1, 0x3bd7000 <stdout+0x95f40>
 1b85860:      	add	x1, x1, #0x948
 1b85864:      	bl	0x23a5010 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbf0>
 1b85868:      	add	x1, sp, #0x48
 1b8586c:      	mov	x0, x20
 1b85870:      	bl	0x23af140 <_ZNSt8functionIFvvEEC2ERKS1_+0x39d20>
 1b85874:      	add	x0, sp, #0x48
 1b85878:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1b8587c:      	mov	x0, x22
 1b85880:      	ldr	w22, [x19, #0x88]
 1b85884:      	bl	0x23b1530 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c110>
 1b85888:      	ldr	x3, [x19]
 1b8588c:      	add	w2, w22, w0
 1b85890:      	mov	w1, #0x0                // =0
 1b85894:      	mov	x0, x20
 1b85898:      	mov	w4, w21
 1b8589c:      	ldur	x3, [x3, #-0x18]
 1b858a0:      	add	x3, x19, x3
 1b858a4:      	ldr	w3, [x3, #0x28]
 1b858a8:      	bl	0x23af680 <_ZNSt8functionIFvvEEC2ERKS1_+0x3a260>
 1b858ac:      	add	x0, x19, #0x8, lsl #12  // =0x8000
 1b858b0:      	ldr	x0, [x0, #0x688]
 1b858b4:      	ldrb	w1, [x0, #0xc1]
 1b858b8:      	cbz	w1, 0x1b85828 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3859a0>
 1b858bc:      	add	x0, x0, #0x10
 1b858c0:      	bl	0x1b84df0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x384f68>
 1b858c4:      	tst	w0, #0xff
 1b858c8:      	b.eq	0x1b85828 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3859a0>
 1b858cc:      	ldp	w1, w2, [x19, #0x88]
 1b858d0:      	movi	v3.2s, #0x0
 1b858d4:      	fmov	s4, #-1.00000000
 1b858d8:      	fmov	s0, #1.00000000
 1b858dc:      	add	x0, sp, #0x48
 1b858e0:      	add	w1, w2, w1, lsl #1
 1b858e4:      	fmov	s2, s3
 1b858e8:      	fmov	s1, s3
 1b858ec:      	scvtf	s5, w1
 1b858f0:      	bl	0x23a89a0 <_ZNSt8functionIFvvEEC2ERKS1_+0x33580>
 1b858f4:      	add	x2, sp, #0x48
 1b858f8:      	mov	x1, x23
 1b858fc:      	mov	x0, x20
 1b85900:      	mov	w3, #0x0                // =0
 1b85904:      	bl	0x23b04e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b0c0>
 1b85908:      	ldp	x19, x20, [sp, #0x10]
 1b8590c:      	ldp	x21, x22, [sp, #0x20]
 1b85910:      	ldr	x23, [sp, #0x30]
 1b85914:      	ldp	x29, x30, [sp], #0x60
 1b85918:      	ret
 1b8591c:      	mov	x19, x0
 1b85920:      	add	x0, sp, #0x48
 1b85924:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1b85928:      	mov	x0, x19
 1b8592c:      	bl	0x424d10 <_Unwind_Resume@plt>
 1b85930:      	stp	x29, x30, [sp, #-0x40]!
 1b85934:      	adrp	x1, 0x2b68000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5a51a8>
 1b85938:      	add	x1, x1, #0x278
 1b8593c:      	mov	x29, sp
 1b85940:      	stp	x19, x20, [sp, #0x10]
 1b85944:      	mov	x20, x0
 1b85948:      	adrp	x0, 0x2b68000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5a51a8>
 1b8594c:      	stp	x21, x22, [sp, #0x20]
 1b85950:      	add	x0, x0, #0xe8
 1b85954:      	ldr	x2, [x20]
 1b85958:      	ldur	x21, [x2, #-0x18]
 1b8595c:      	str	x23, [sp, #0x30]
 1b85960:      	add	x19, x20, x21
 1b85964:      	str	x0, [x20, x21]
 1b85968:      	add	x0, x19, #0x30
 1b8596c:      	add	x22, x19, #0x40
 1b85970:      	str	x1, [x19, #0x40]
 1b85974:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1b85978:      	adrp	x0, 0x2b67000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5a41a8>
 1b8597c:      	add	x0, x0, #0xdc0
 1b85980:      	str	x0, [x20, x21]
 1b85984:      	adrp	x0, 0x2b67000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5a41a8>
 1b85988:      	add	x0, x0, #0xf50
 1b8598c:      	str	x0, [x19, #0x40]
 1b85990:      	add	x0, x19, #0x20
 1b85994:      	bl	0x1965790 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x165908>
 1b85998:      	ldr	x23, [x19, #0x18]
 1b8599c:      	cbz	x23, 0x1b859b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x385b2c>
 1b859a0:      	mov	x0, x23
 1b859a4:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1b859a8:      	mov	x0, x23
 1b859ac:      	mov	x1, #0x4                // =4
 1b859b0:      	bl	0x426660 <_ZdlPvm@plt>
 1b859b4:      	adrp	x0, 0x29c6000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4031a8>
 1b859b8:      	add	x0, x0, #0x8
 1b859bc:      	str	x0, [x20, x21]
 1b859c0:      	add	x0, x19, #0x8
 1b859c4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1b859c8:      	mov	x0, x22
 1b859cc:      	bl	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1b859d0:      	mov	x0, x19
 1b859d4:      	mov	x1, #0x108              // =264
 1b859d8:      	ldp	x19, x20, [sp, #0x10]
 1b859dc:      	ldp	x21, x22, [sp, #0x20]
 1b859e0:      	ldr	x23, [sp, #0x30]
 1b859e4:      	ldp	x29, x30, [sp], #0x40
 1b859e8:      	b	0x426660 <_ZdlPvm@plt>
 1b859ec:      	nop
 1b859f0:      	stp	x29, x30, [sp, #-0x30]!
 1b859f4:      	adrp	x2, 0x2b68000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5a51a8>
 1b859f8:      	adrp	x1, 0x2b68000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5a51a8>
 1b859fc:      	mov	x29, sp
 1b85a00:      	stp	x19, x20, [sp, #0x10]
 1b85a04:      	mov	x20, x0
 1b85a08:      	mov	x19, x0
 1b85a0c:      	str	x21, [sp, #0x20]
 1b85a10:      	add	x2, x2, #0xe8
 1b85a14:      	add	x1, x1, #0x278
 1b85a18:      	str	x2, [x20], #0x40
 1b85a1c:      	str	x1, [x19, #0x40]
 1b85a20:      	add	x0, x0, #0x30
 1b85a24:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1b85a28:      	adrp	x1, 0x2b67000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5a41a8>
 1b85a2c:      	add	x1, x1, #0xdc0
 1b85a30:      	adrp	x0, 0x2b67000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5a41a8>
 1b85a34:      	add	x0, x0, #0xf50
 1b85a38:      	str	x1, [x19]
 1b85a3c:      	str	x0, [x19, #0x40]
 1b85a40:      	add	x0, x19, #0x20
 1b85a44:      	bl	0x1965790 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x165908>
 1b85a48:      	ldr	x21, [x19, #0x18]
 1b85a4c:      	cbz	x21, 0x1b85a64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x385bdc>
 1b85a50:      	mov	x0, x21
 1b85a54:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1b85a58:      	mov	x0, x21
 1b85a5c:      	mov	x1, #0x4                // =4
 1b85a60:      	bl	0x426660 <_ZdlPvm@plt>
 1b85a64:      	mov	x0, x19
 1b85a68:      	adrp	x1, 0x29c6000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4031a8>
 1b85a6c:      	add	x1, x1, #0x8
 1b85a70:      	str	x1, [x0], #0x8
 1b85a74:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1b85a78:      	mov	x0, x20
 1b85a7c:      	bl	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1b85a80:      	mov	x0, x19
 1b85a84:      	mov	x1, #0x108              // =264
 1b85a88:      	ldp	x19, x20, [sp, #0x10]
 1b85a8c:      	ldr	x21, [sp, #0x20]
 1b85a90:      	ldp	x29, x30, [sp], #0x30
 1b85a94:      	b	0x426660 <_ZdlPvm@plt>
 1b85a98:      	stp	x29, x30, [sp, #-0x40]!
 1b85a9c:      	adrp	x1, 0x2b68000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5a51a8>
 1b85aa0:      	add	x1, x1, #0x8a8
 1b85aa4:      	mov	x29, sp
 1b85aa8:      	stp	x19, x20, [sp, #0x10]
 1b85aac:      	mov	x20, x0
 1b85ab0:      	adrp	x0, 0x2b68000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5a51a8>
 1b85ab4:      	stp	x21, x22, [sp, #0x20]
 1b85ab8:      	add	x0, x0, #0x718
 1b85abc:      	ldr	x2, [x20]
 1b85ac0:      	ldur	x21, [x2, #-0x18]
 1b85ac4:      	str	x23, [sp, #0x30]
 1b85ac8:      	add	x19, x20, x21
 1b85acc:      	str	x0, [x20, x21]
 1b85ad0:      	add	x0, x19, #0x60
 1b85ad4:      	add	x22, x19, #0x90
 1b85ad8:      	str	x1, [x19, #0x90]
 1b85adc:      	bl	0x23aa9c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x355a0>
 1b85ae0:      	add	x0, x19, #0x30
 1b85ae4:      	bl	0x23a6880 <_ZNSt8functionIFvvEEC2ERKS1_+0x31460>
 1b85ae8:      	adrp	x0, 0x2b68000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5a51a8>
 1b85aec:      	add	x0, x0, #0x3f0
 1b85af0:      	str	x0, [x20, x21]
 1b85af4:      	adrp	x0, 0x2b68000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5a51a8>
 1b85af8:      	add	x0, x0, #0x580
 1b85afc:      	str	x0, [x19, #0x90]
 1b85b00:      	add	x0, x19, #0x20
 1b85b04:      	bl	0x1965790 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x165908>
 1b85b08:      	ldr	x23, [x19, #0x18]
 1b85b0c:      	cbz	x23, 0x1b85b24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x385c9c>
 1b85b10:      	mov	x0, x23
 1b85b14:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1b85b18:      	mov	x0, x23
 1b85b1c:      	mov	x1, #0x4                // =4
 1b85b20:      	bl	0x426660 <_ZdlPvm@plt>
 1b85b24:      	adrp	x0, 0x29c6000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4031a8>
 1b85b28:      	add	x0, x0, #0x8
 1b85b2c:      	str	x0, [x20, x21]
