
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1e01884:      	fmov	d11, d3
 1e01888:      	mov	x1, #0x4059000000000000 // =4636737291354636288
 1e0188c:      	fmov	d10, x1
 1e01890:      	fmul	d0, d11, d0
 1e01894:      	fcvtzs	w1, d0
 1e01898:      	tbz	x3, #0x3f, 0x1e00e98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601010>
 1e0189c:      	sub	w2, w1, #0x1
 1e018a0:      	adrp	x4, 0x27a0000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x1dd1a8>
 1e018a4:      	scvtf	d1, w2
 1e018a8:      	ldr	d2, [x4, #0x278]
 1e018ac:      	fsub	d0, d0, d1
 1e018b0:      	fcmpe	d0, d2
 1e018b4:      	str	d0, [sp, #0x130]
 1e018b8:      	b.pl	0x1e01908 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601a80>
 1e018bc:      	scvtf	d8, w1
 1e018c0:      	mov	x1, #0x8000             // =32768
 1e018c4:      	fdiv	d8, d8, d11
 1e018c8:      	add	x2, sp, #0x138
 1e018cc:      	ldr	x21, [x21]
 1e018d0:      	str	x2, [sp, #0xa8]
 1e018d4:      	add	x2, sp, #0x130
 1e018d8:      	str	x2, [sp, #0x88]
 1e018dc:      	str	x1, [sp, #0x138]
 1e018e0:      	fsub	d8, d8, d10
 1e018e4:      	b	0x1e00ed4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x60104c>
 1e018e8:      	adrp	x1, 0x2895000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x2d21a8>
 1e018ec:      	ldr	d1, [x1, #0x708]
 1e018f0:      	fcmpe	d0, d1
 1e018f4:      	b.pl	0x1e0191c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601a94>
 1e018f8:      	fdiv	d8, d8, d11
 1e018fc:      	mov	x1, #0x7999             // =31129
 1e01900:      	movk	x1, #0x228f, lsl #32
 1e01904:      	b	0x1e00ebc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601034>
 1e01908:      	adrp	x2, 0x2895000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x2d21a8>
 1e0190c:      	scvtf	d8, w1
 1e01910:      	ldr	d1, [x2, #0x708]
 1e01914:      	fcmpe	d0, d1
 1e01918:      	b.mi	0x1e02274 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6023ec>
 1e0191c:      	mov	x1, #0x3333333333333333 // =3689348814741910323
 1e01920:      	movk	x1, #0x3fd3, lsl #48
 1e01924:      	fmov	d1, x1
 1e01928:      	fcmpe	d0, d1
 1e0192c:      	b.pl	0x1e021f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602370>
 1e01930:      	mov	w1, #0x30a3             // =12451
 1e01934:      	mov	w4, #0x70a3             // =28835
 1e01938:      	add	x2, sp, #0x138
 1e0193c:      	str	x2, [sp, #0xa8]
 1e01940:      	str	w4, [sp, #0x138]
 1e01944:      	fdiv	d8, d8, d11
 1e01948:      	str	w1, [sp, #0x13c]
 1e0194c:      	add	x1, sp, #0x130
 1e01950:      	str	x1, [sp, #0x88]
 1e01954:      	ldr	x21, [x21]
 1e01958:      	tbz	x3, #0x3f, 0x1e00ed4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x60104c>
 1e0195c:      	b	0x1e018e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601a58>
 1e01960:      	mul	w3, w3, w28
 1e01964:      	cmp	w2, w26
 1e01968:      	madd	w0, w0, w9, w3
 1e0196c:      	csel	w2, w2, w26, le
 1e01970:      	strb	w2, [x6, #0x1]
 1e01974:      	cmp	w9, w28
 1e01978:      	asr	w0, w0, #15
 1e0197c:      	b.hs	0x1e01474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6015ec>
 1e01980:      	cmp	w0, w28
 1e01984:      	csel	w0, w0, w28, le
 1e01988:      	strb	w0, [x6]
 1e0198c:      	b	0x1e01480 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6015f8>
 1e01990:      	cmp	w2, w25
 1e01994:      	csel	w27, w2, w25, le
 1e01998:      	b	0x1e0143c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6015b4>
 1e0199c:      	mov	w4, w2
 1e019a0:      	b	0x1e0139c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601514>
 1e019a4:      	mov	w5, w0
 1e019a8:      	b	0x1e01348 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6014c0>
 1e019ac:      	add	x26, x26, #0x38
 1e019b0:      	add	x0, sp, #0x108
 1e019b4:      	add	x20, x25, x26
 1e019b8:      	ldrb	w3, [x25, x26]
 1e019bc:      	ldrb	w2, [x20, #0x1]
 1e019c0:      	ldrb	w1, [x20, #0x2]
 1e019c4:      	ubfx	x3, x3, #1, #8
 1e019c8:      	ubfx	x2, x2, #1, #8
 1e019cc:      	ubfx	x1, x1, #1, #8
 1e019d0:      	bl	0x23a5080 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc60>
 1e019d4:      	ldrb	w3, [x20, #0x4]
 1e019d8:      	add	x0, sp, #0x110
 1e019dc:      	ldrb	w2, [x20, #0x5]
 1e019e0:      	ldrb	w1, [x20, #0x6]
 1e019e4:      	ubfx	x3, x3, #1, #8
 1e019e8:      	ubfx	x2, x2, #1, #8
 1e019ec:      	ubfx	x1, x1, #1, #8
 1e019f0:      	bl	0x23a5080 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc60>
 1e019f4:      	ldrb	w3, [x20, #0x8]
 1e019f8:      	add	x0, sp, #0x118
 1e019fc:      	ldrb	w2, [x20, #0x9]
 1e01a00:      	ldrb	w1, [x20, #0xa]
 1e01a04:      	ubfx	x3, x3, #1, #8
 1e01a08:      	ubfx	x2, x2, #1, #8
 1e01a0c:      	ubfx	x1, x1, #1, #8
 1e01a10:      	bl	0x23a5080 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc60>
 1e01a14:      	ldrb	w3, [x20, #0xc]
 1e01a18:      	add	x0, sp, #0x120
 1e01a1c:      	ldrb	w2, [x20, #0xd]
 1e01a20:      	ldrb	w1, [x20, #0xe]
 1e01a24:      	ubfx	x3, x3, #1, #8
 1e01a28:      	ubfx	x2, x2, #1, #8
 1e01a2c:      	ubfx	x1, x1, #1, #8
 1e01a30:      	bl	0x23a5080 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc60>
 1e01a34:      	ldrh	w3, [sp, #0x108]
 1e01a38:      	mov	w1, #-0x80000000        // =-2147483648
 1e01a3c:      	ldrb	w2, [sp, #0x122]
 1e01a40:      	mov	x0, x22
 1e01a44:      	ldrb	w8, [sp, #0x10a]
 1e01a48:      	ldrb	w6, [sp, #0x112]
 1e01a4c:      	ldrb	w4, [sp, #0x11a]
 1e01a50:      	ldrh	w7, [sp, #0x110]
 1e01a54:      	ldrh	w5, [sp, #0x118]
 1e01a58:      	strh	w3, [x25, x26]
 1e01a5c:      	ldrh	w3, [sp, #0x120]
 1e01a60:      	strb	w8, [x20, #0x2]
 1e01a64:      	strh	w7, [x20, #0x4]
 1e01a68:      	strb	w6, [x20, #0x6]
 1e01a6c:      	strh	w5, [x20, #0x8]
 1e01a70:      	strb	w4, [x20, #0xa]
 1e01a74:      	strh	w3, [x20, #0xc]
 1e01a78:      	strb	w2, [x20, #0xe]
 1e01a7c:      	ldr	x2, [x22]
 1e01a80:      	ldr	x2, [x2, #0x28]
 1e01a84:      	blr	x2
 1e01a88:      	cmp	w0, #0x1
 1e01a8c:      	b.le	0x1e01b38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601cb0>
 1e01a90:      	ldrb	w3, [x20, #0x10]
 1e01a94:      	add	x0, sp, #0x128
 1e01a98:      	ldrb	w2, [x20, #0x11]
 1e01a9c:      	ldrb	w1, [x20, #0x12]
 1e01aa0:      	ubfx	x3, x3, #1, #8
 1e01aa4:      	ubfx	x2, x2, #1, #8
 1e01aa8:      	ubfx	x1, x1, #1, #8
 1e01aac:      	bl	0x23a5080 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc60>
 1e01ab0:      	ldrb	w3, [x20, #0x14]
 1e01ab4:      	add	x0, sp, #0x140
 1e01ab8:      	ldrb	w2, [x20, #0x15]
 1e01abc:      	ldrb	w1, [x20, #0x16]
 1e01ac0:      	ubfx	x3, x3, #1, #8
 1e01ac4:      	ubfx	x2, x2, #1, #8
 1e01ac8:      	ubfx	x1, x1, #1, #8
 1e01acc:      	bl	0x23a5080 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc60>
 1e01ad0:      	ldrb	w3, [x20, #0x18]
 1e01ad4:      	add	x0, sp, #0x150
 1e01ad8:      	ldrb	w2, [x20, #0x19]
 1e01adc:      	ldrb	w1, [x20, #0x1a]
 1e01ae0:      	ubfx	x3, x3, #1, #8
 1e01ae4:      	ubfx	x2, x2, #1, #8
 1e01ae8:      	ubfx	x1, x1, #1, #8
 1e01aec:      	bl	0x23a5080 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc60>
 1e01af0:      	ldrb	w5, [sp, #0x12a]
 1e01af4:      	add	x0, sp, #0x150
 1e01af8:      	ldrb	w3, [sp, #0x142]
 1e01afc:      	ldrb	w1, [sp, #0x152]
 1e01b00:      	ldrh	w6, [sp, #0x128]
 1e01b04:      	ldrh	w4, [sp, #0x140]
 1e01b08:      	ldrh	w2, [sp, #0x150]
 1e01b0c:      	strh	w6, [x20, #0x10]
 1e01b10:      	strb	w5, [x20, #0x12]
 1e01b14:      	strh	w4, [x20, #0x14]
 1e01b18:      	strb	w3, [x20, #0x16]
 1e01b1c:      	strh	w2, [x20, #0x18]
 1e01b20:      	strb	w1, [x20, #0x1a]
 1e01b24:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e01b28:      	add	x0, sp, #0x140
 1e01b2c:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e01b30:      	add	x0, sp, #0x128
 1e01b34:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e01b38:      	add	x0, sp, #0x120
 1e01b3c:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e01b40:      	add	x0, sp, #0x118
 1e01b44:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e01b48:      	add	x0, sp, #0x110
 1e01b4c:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e01b50:      	add	w19, w19, #0x3
 1e01b54:      	add	x0, sp, #0x108
 1e01b58:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e01b5c:      	b	0x1e01854 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6019cc>
 1e01b60:      	fmov	d0, #1.00000000
 1e01b64:      	ldr	x0, [x22]
 1e01b68:      	fcmpe	d11, d0
 1e01b6c:      	ldr	x3, [x0, #0x30]
 1e01b70:      	b.lt	0x1e02280 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6023f8>
 1e01b74:      	mov	w1, w24
 1e01b78:      	mov	w2, #0x0                // =0
 1e01b7c:      	mov	x0, x22
 1e01b80:      	add	x8, sp, #0x140
 1e01b84:      	blr	x3
 1e01b88:      	mov	x28, x21
 1e01b8c:      	ldr	w2, [sp, #0x90]
 1e01b90:      	mov	w1, #0x1                // =1
 1e01b94:      	ldrb	w0, [sp, #0x140]
 1e01b98:      	fadd	d9, d9, d10
 1e01b9c:      	and	w3, w2, #0xff
 1e01ba0:      	str	w3, [sp, #0xc0]
 1e01ba4:      	ldrb	w24, [sp, #0x143]
 1e01ba8:      	ldrb	w26, [x28], #0x4
 1e01bac:      	mul	w0, w0, w2
 1e01bb0:      	ldrb	w25, [sp, #0x142]
 1e01bb4:      	ldrb	w27, [sp, #0x141]
 1e01bb8:      	ldrb	w19, [x21, #0x2]
 1e01bbc:      	ldrb	w23, [x21, #0x1]
 1e01bc0:      	sdiv	w0, w0, w20
 1e01bc4:      	ands	w0, w0, #0xff
 1e01bc8:      	csel	w0, w0, w1, ne
 1e01bcc:      	str	w0, [sp, #0x80]
 1e01bd0:      	ldr	w0, [sp, #0x9c]
 1e01bd4:      	cmp	w0, w1
 1e01bd8:      	b.le	0x1e02a88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602c00>
 1e01bdc:      	add	x20, sp, #0x150
 1e01be0:      	add	x0, sp, #0x151
 1e01be4:      	str	w1, [sp, #0x98]
 1e01be8:      	str	x0, [sp, #0xa0]
 1e01bec:      	add	x0, sp, #0x141
 1e01bf0:      	str	x0, [sp, #0xb0]
 1e01bf4:      	str	x20, [sp, #0xb8]
 1e01bf8:      	ldr	x20, [sp, #0xa8]
 1e01bfc:      	ldr	x21, [sp, #0xd0]
 1e01c00:      	b	0x1e01e10 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601f88>
 1e01c04:      	mov	w1, #0x3e8              // =1000
 1e01c08:      	mul	w1, w3, w1
 1e01c0c:      	udiv	w1, w1, w4
 1e01c10:      	cmp	w1, #0x8ae
 1e01c14:      	b.gt	0x1e01ecc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602044>
 1e01c18:      	ldr	x1, [sp, #0x88]
 1e01c1c:      	mov	w13, #0xff              // =255
 1e01c20:      	ldr	d0, [x1]
 1e01c24:      	mov	w1, #0x8000             // =32768
 1e01c28:      	fcvtzs	w14, d0, #0xf
 1e01c2c:      	sub	w1, w1, w14
 1e01c30:      	mul	w12, w7, w14
 1e01c34:      	mul	w2, w11, w14
 1e01c38:      	mul	w14, w6, w14
 1e01c3c:      	madd	w12, w24, w1, w12
 1e01c40:      	madd	w2, w25, w1, w2
 1e01c44:      	madd	w1, w27, w1, w14
 1e01c48:      	asr	w12, w12, #15
 1e01c4c:      	cmp	w12, w13
 1e01c50:      	asr	w2, w2, #15
 1e01c54:      	csel	w12, w12, w13, le
 1e01c58:      	asr	w1, w1, #15
 1e01c5c:      	cmp	w2, w13
 1e01c60:      	strb	w12, [x21, #0x2]
 1e01c64:      	csel	w2, w2, w13, le
 1e01c68:      	cmp	w1, w13
 1e01c6c:      	csel	w1, w1, w13, le
 1e01c70:      	strb	w1, [x21]
 1e01c74:      	strb	w2, [x21, #0x1]
 1e01c78:      	lsl	w1, w23, #6
 1e01c7c:      	lsl	w2, w9, #6
 1e01c80:      	sub	w1, w1, w23
 1e01c84:      	add	w13, w19, w19, lsl #8
 1e01c88:      	sub	w2, w2, w9
 1e01c8c:      	add	w12, w8, w8, lsl #8
 1e01c90:      	add	w1, w13, w1, lsl #3
 1e01c94:      	mov	w13, #0x3e80            // =16000
 1e01c98:      	add	w2, w12, w2, lsl #3
 1e01c9c:      	mov	w12, #0x62              // =98
 1e01ca0:      	mov	w14, #0x64              // =100
 1e01ca4:      	madd	w1, w26, w12, w1
 1e01ca8:      	madd	w2, w10, w12, w2
 1e01cac:      	add	w1, w1, w13
 1e01cb0:      	add	w2, w2, w13
 1e01cb4:      	mul	w14, w1, w14
 1e01cb8:      	udiv	w12, w14, w2
 1e01cbc:      	cmp	w12, #0x2c
 1e01cc0:      	b.le	0x1e01f34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6020ac>
 1e01cc4:      	mov	w12, #0x3e8             // =1000
 1e01cc8:      	mul	w12, w1, w12
 1e01ccc:      	udiv	w12, w12, w2
 1e01cd0:      	cmp	w12, #0x8ae
 1e01cd4:      	b.gt	0x1e01f34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6020ac>
 1e01cd8:      	ldr	x12, [sp, #0x88]
 1e01cdc:      	mov	w15, #0xff              // =255
 1e01ce0:      	ldr	d0, [x12]
 1e01ce4:      	mov	w12, #0x8000            // =32768
 1e01ce8:      	fcvtzs	w17, d0, #0xf
 1e01cec:      	sub	w12, w12, w17
 1e01cf0:      	mul	w16, w8, w17
 1e01cf4:      	mul	w13, w9, w17
 1e01cf8:      	mul	w17, w10, w17
 1e01cfc:      	madd	w16, w19, w12, w16
 1e01d00:      	madd	w13, w23, w12, w13
 1e01d04:      	madd	w12, w26, w12, w17
 1e01d08:      	asr	w16, w16, #15
 1e01d0c:      	cmp	w16, w15
 1e01d10:      	asr	w13, w13, #15
 1e01d14:      	csel	w16, w16, w15, le
 1e01d18:      	asr	w12, w12, #15
 1e01d1c:      	cmp	w13, w15
 1e01d20:      	strb	w16, [x21, #0xa]
 1e01d24:      	csel	w13, w13, w15, le
 1e01d28:      	cmp	w12, w15
 1e01d2c:      	csel	w12, w12, w15, le
 1e01d30:      	strb	w12, [x21, #0x8]
 1e01d34:      	ldr	w12, [sp, #0x80]
 1e01d38:      	strb	w13, [x21, #0x9]
 1e01d3c:      	cmp	w0, w12
 1e01d40:      	b.ls	0x1e01fa4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x60211c>
 1e01d44:      	udiv	w14, w14, w4
 1e01d48:      	ldrb	w2, [sp, #0xc0]
 1e01d4c:      	strb	w12, [x21, #0x3]
 1e01d50:      	strb	w0, [x21, #0x7]
 1e01d54:      	strb	w2, [x21, #0xb]
 1e01d58:      	cmp	w14, #0x2c
 1e01d5c:      	b.le	0x1e020c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602238>
 1e01d60:      	mov	w2, #0x3e8              // =1000
 1e01d64:      	mul	w1, w1, w2
 1e01d68:      	udiv	w4, w1, w4
 1e01d6c:      	cmp	w4, #0x8ae
 1e01d70:      	b.gt	0x1e020c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602238>
 1e01d74:      	ldr	x1, [sp, #0x88]
 1e01d78:      	mov	w4, #0xff               // =255
 1e01d7c:      	ldr	d0, [x1]
 1e01d80:      	mov	w1, #0x8000             // =32768
 1e01d84:      	fcvtzs	w5, d0, #0xf
 1e01d88:      	sub	w1, w1, w5
 1e01d8c:      	mul	w3, w7, w5
 1e01d90:      	mul	w2, w11, w5
 1e01d94:      	mul	w5, w6, w5
 1e01d98:      	madd	w3, w19, w1, w3
 1e01d9c:      	madd	w2, w23, w1, w2
 1e01da0:      	madd	w1, w26, w1, w5
 1e01da4:      	asr	w3, w3, #15
 1e01da8:      	asr	w2, w2, #15
 1e01dac:      	cmp	w3, w4
 1e01db0:      	asr	w1, w1, #15
 1e01db4:      	csel	w3, w3, w4, le
 1e01db8:      	cmp	w2, w4
 1e01dbc:      	csel	w2, w2, w4, le
 1e01dc0:      	cmp	w1, w4
 1e01dc4:      	csel	w1, w1, w4, le
 1e01dc8:      	strb	w1, [x21, #0x4]
 1e01dcc:      	strb	w2, [x21, #0x5]
 1e01dd0:      	strb	w3, [x21, #0x6]
 1e01dd4:      	ldp	w1, w2, [sp, #0x98]
 1e01dd8:      	str	w0, [sp, #0x80]
 1e01ddc:      	add	x28, x28, #0x4
 1e01de0:      	fadd	d9, d9, d10
 1e01de4:      	add	w1, w1, #0x1
 1e01de8:      	str	w1, [sp, #0x98]
 1e01dec:      	add	x21, x21, #0x1c
 1e01df0:      	mov	w27, w6
 1e01df4:      	mov	w25, w11
 1e01df8:      	mov	w24, w7
 1e01dfc:      	mov	w26, w10
 1e01e00:      	mov	w23, w9
 1e01e04:      	mov	w19, w8
 1e01e08:      	cmp	w2, w1
 1e01e0c:      	b.eq	0x1e021a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602318>
 1e01e10:      	ldr	x3, [x22]
 1e01e14:      	fcvtzs	w1, d9
 1e01e18:      	ldr	x8, [sp, #0xb8]
 1e01e1c:      	mov	w2, #0x0                // =0
 1e01e20:      	ldr	x3, [x3, #0x30]
 1e01e24:      	mov	x0, x22
 1e01e28:      	blr	x3
 1e01e2c:      	ldrb	w2, [sp, #0x150]
 1e01e30:      	ldr	x1, [sp, #0xa0]
 1e01e34:      	strb	w2, [sp, #0x140]
 1e01e38:      	ldr	x0, [sp, #0xb0]
 1e01e3c:      	bl	0x23a5020 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc00>
 1e01e40:      	ldr	x0, [sp, #0xa0]
 1e01e44:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e01e48:      	ldrb	w11, [sp, #0x142]
 1e01e4c:      	lsl	w0, w25, #6
 1e01e50:      	ldrb	w7, [sp, #0x143]
 1e01e54:      	sub	w0, w0, w25
 1e01e58:      	add	w3, w24, w24, lsl #8
 1e01e5c:      	mov	w1, #0x62               // =98
 1e01e60:      	lsl	w4, w11, #6
 1e01e64:      	add	w3, w3, w0, lsl #3
 1e01e68:      	sub	w4, w4, w11
 1e01e6c:      	add	w2, w7, w7, lsl #8
 1e01e70:      	ldrb	w0, [sp, #0x140]
 1e01e74:      	mov	w5, #0x64               // =100
 1e01e78:      	add	w4, w2, w4, lsl #3
 1e01e7c:      	ldr	w2, [sp, #0x90]
 1e01e80:      	ldrb	w6, [sp, #0x141]
 1e01e84:      	madd	w3, w27, w1, w3
 1e01e88:      	mov	w1, #0x3e80             // =16000
 1e01e8c:      	ldrb	w8, [x28, #0x2]
 1e01e90:      	add	w3, w3, w1
 1e01e94:      	ldrb	w9, [x28, #0x1]
 1e01e98:      	mul	w0, w0, w2
 1e01e9c:      	mov	w2, #0x62               // =98
 1e01ea0:      	ldrb	w10, [x28]
 1e01ea4:      	madd	w4, w6, w2, w4
 1e01ea8:      	mul	w5, w3, w5
 1e01eac:      	add	w4, w4, w1
 1e01eb0:      	ldr	w1, [sp, #0x94]
 1e01eb4:      	sdiv	w0, w0, w1
 1e01eb8:      	udiv	w1, w5, w4
 1e01ebc:      	ands	w0, w0, #0xff
 1e01ec0:      	csinc	w0, w0, wzr, ne
 1e01ec4:      	cmp	w1, #0x2c
 1e01ec8:      	b.gt	0x1e01c04 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601d7c>
 1e01ecc:      	ldp	w1, w13, [x20]
 1e01ed0:      	cmp	w24, w7
 1e01ed4:      	mul	w2, w7, w13
 1e01ed8:      	madd	w2, w24, w1, w2
 1e01edc:      	asr	w2, w2, #15
 1e01ee0:      	b.lo	0x1e02134 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6022ac>
 1e01ee4:      	cmp	w24, w2
 1e01ee8:      	csel	w12, w24, w2, le
 1e01eec:      	mul	w2, w11, w13
 1e01ef0:      	strb	w12, [x21, #0x2]
 1e01ef4:      	madd	w2, w25, w1, w2
 1e01ef8:      	cmp	w11, w25
 1e01efc:      	asr	w2, w2, #15
 1e01f00:      	b.hi	0x1e02128 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6022a0>
 1e01f04:      	cmp	w25, w2
 1e01f08:      	csel	w2, w25, w2, le
 1e01f0c:      	mul	w13, w6, w13
 1e01f10:      	strb	w2, [x21, #0x1]
 1e01f14:      	madd	w1, w27, w1, w13
 1e01f18:      	cmp	w6, w27
 1e01f1c:      	asr	w1, w1, #15
 1e01f20:      	b.hi	0x1e020b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602228>
 1e01f24:      	cmp	w27, w1
 1e01f28:      	csel	w1, w27, w1, le
 1e01f2c:      	strb	w1, [x21]
 1e01f30:      	b	0x1e01c78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601df0>
 1e01f34:      	ldp	w12, w15, [x20]
 1e01f38:      	cmp	w8, w19
 1e01f3c:      	mul	w13, w8, w15
 1e01f40:      	madd	w13, w19, w12, w13
 1e01f44:      	asr	w13, w13, #15
 1e01f48:      	b.hi	0x1e0203c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6021b4>
 1e01f4c:      	cmp	w19, w13
 1e01f50:      	csel	w16, w19, w13, le
 1e01f54:      	mul	w13, w9, w15
 1e01f58:      	strb	w16, [x21, #0xa]
 1e01f5c:      	madd	w13, w23, w12, w13
 1e01f60:      	cmp	w9, w23
 1e01f64:      	asr	w13, w13, #15
 1e01f68:      	b.hi	0x1e0200c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602184>
 1e01f6c:      	mul	w15, w10, w15
 1e01f70:      	cmp	w23, w13
 1e01f74:      	madd	w12, w26, w12, w15
 1e01f78:      	csel	w13, w23, w13, le
 1e01f7c:      	strb	w13, [x21, #0x9]
 1e01f80:      	cmp	w10, w26
 1e01f84:      	asr	w12, w12, #15
 1e01f88:      	b.hi	0x1e0202c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6021a4>
 1e01f8c:      	cmp	w26, w12
 1e01f90:      	csel	w12, w26, w12, le
 1e01f94:      	strb	w12, [x21, #0x8]
 1e01f98:      	ldr	w12, [sp, #0x80]
 1e01f9c:      	cmp	w0, w12
 1e01fa0:      	b.hi	0x1e01d44 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601ebc>
 1e01fa4:      	udiv	w5, w5, w2
 1e01fa8:      	ldrb	w1, [sp, #0x80]
 1e01fac:      	strb	w1, [x21, #0x7]
 1e01fb0:      	ldrb	w1, [sp, #0xc0]
 1e01fb4:      	strb	w0, [x21, #0x3]
 1e01fb8:      	strb	w1, [x21, #0xb]
 1e01fbc:      	cmp	w5, #0x2c
 1e01fc0:      	b.le	0x1e02048 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6021c0>
 1e01fc4:      	mov	w1, #0x3e8              // =1000
 1e01fc8:      	mul	w3, w3, w1
 1e01fcc:      	udiv	w2, w3, w2
 1e01fd0:      	cmp	w2, #0x8ae
 1e01fd4:      	b.gt	0x1e02048 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6021c0>
 1e01fd8:      	ldr	x1, [sp, #0x88]
 1e01fdc:      	mov	w4, #0xff               // =255
 1e01fe0:      	ldr	d0, [x1]
 1e01fe4:      	mov	w1, #0x8000             // =32768
 1e01fe8:      	fcvtzs	w5, d0, #0xf
 1e01fec:      	sub	w1, w1, w5
 1e01ff0:      	mul	w3, w8, w5
 1e01ff4:      	mul	w2, w9, w5
 1e01ff8:      	mul	w5, w10, w5
 1e01ffc:      	madd	w3, w24, w1, w3
 1e02000:      	madd	w2, w25, w1, w2
 1e02004:      	madd	w1, w27, w1, w5
 1e02008:      	b	0x1e01da4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601f1c>
 1e0200c:      	mul	w15, w10, w15
 1e02010:      	cmp	w9, w13
 1e02014:      	madd	w12, w26, w12, w15
 1e02018:      	csel	w13, w9, w13, le
 1e0201c:      	strb	w13, [x21, #0x9]
 1e02020:      	cmp	w10, w26
 1e02024:      	asr	w12, w12, #15
 1e02028:      	b.ls	0x1e01f8c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602104>
 1e0202c:      	cmp	w10, w12
 1e02030:      	csel	w12, w10, w12, le
 1e02034:      	strb	w12, [x21, #0x8]
 1e02038:      	b	0x1e01f98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602110>
 1e0203c:      	cmp	w8, w13
 1e02040:      	csel	w16, w8, w13, le
 1e02044:      	b	0x1e01f54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6020cc>
 1e02048:      	ldp	w1, w3, [x20]
 1e0204c:      	cmp	w8, w24
 1e02050:      	mul	w2, w8, w3
 1e02054:      	madd	w2, w24, w1, w2
 1e02058:      	asr	w2, w2, #15
 1e0205c:      	b.hi	0x1e02184 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6022fc>
 1e02060:      	cmp	w24, w2
 1e02064:      	csel	w24, w24, w2, le
 1e02068:      	mul	w2, w9, w3
 1e0206c:      	strb	w24, [x21, #0x6]
 1e02070:      	madd	w2, w25, w1, w2
 1e02074:      	cmp	w9, w25
 1e02078:      	asr	w2, w2, #15
 1e0207c:      	b.hi	0x1e02178 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6022f0>
 1e02080:      	cmp	w25, w2
 1e02084:      	csel	w2, w25, w2, le
 1e02088:      	mul	w3, w10, w3
 1e0208c:      	strb	w2, [x21, #0x5]
 1e02090:      	madd	w1, w27, w1, w3
 1e02094:      	cmp	w10, w27
 1e02098:      	asr	w1, w1, #15
 1e0209c:      	b.hi	0x1e02168 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6022e0>
 1e020a0:      	cmp	w27, w1
 1e020a4:      	csel	w1, w27, w1, le
 1e020a8:      	strb	w1, [x21, #0x4]
 1e020ac:      	b	0x1e01dd4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601f4c>
 1e020b0:      	cmp	w6, w1
 1e020b4:      	csel	w1, w6, w1, le
 1e020b8:      	strb	w1, [x21]
 1e020bc:      	b	0x1e01c78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601df0>
 1e020c0:      	ldp	w1, w3, [x20]
 1e020c4:      	cmp	w19, w7
 1e020c8:      	mul	w2, w7, w3
 1e020cc:      	madd	w2, w19, w1, w2
 1e020d0:      	asr	w2, w2, #15
 1e020d4:      	b.lo	0x1e0215c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6022d4>
 1e020d8:      	cmp	w19, w2
 1e020dc:      	csel	w19, w19, w2, le
 1e020e0:      	mul	w2, w11, w3
 1e020e4:      	strb	w19, [x21, #0x6]
 1e020e8:      	madd	w2, w23, w1, w2
 1e020ec:      	cmp	w23, w11
 1e020f0:      	asr	w2, w2, #15
 1e020f4:      	b.lo	0x1e02150 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6022c8>
 1e020f8:      	cmp	w23, w2
 1e020fc:      	csel	w2, w23, w2, le
 1e02100:      	mul	w3, w6, w3
 1e02104:      	strb	w2, [x21, #0x5]
 1e02108:      	madd	w1, w26, w1, w3
 1e0210c:      	cmp	w6, w26
 1e02110:      	asr	w1, w1, #15
 1e02114:      	b.hi	0x1e02140 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6022b8>
 1e02118:      	cmp	w26, w1
 1e0211c:      	csel	w1, w26, w1, le
 1e02120:      	strb	w1, [x21, #0x4]
 1e02124:      	b	0x1e01dd4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601f4c>
 1e02128:      	cmp	w11, w2
 1e0212c:      	csel	w2, w11, w2, le
 1e02130:      	b	0x1e01f0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602084>
 1e02134:      	cmp	w7, w2
 1e02138:      	csel	w12, w7, w2, le
 1e0213c:      	b	0x1e01eec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602064>
 1e02140:      	cmp	w6, w1
 1e02144:      	csel	w1, w6, w1, le
 1e02148:      	strb	w1, [x21, #0x4]
 1e0214c:      	b	0x1e01dd4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601f4c>
 1e02150:      	cmp	w11, w2
 1e02154:      	csel	w2, w11, w2, le
 1e02158:      	b	0x1e02100 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602278>
 1e0215c:      	cmp	w7, w2
 1e02160:      	csel	w19, w7, w2, le
 1e02164:      	b	0x1e020e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602258>
 1e02168:      	cmp	w10, w1
 1e0216c:      	csel	w1, w10, w1, le
 1e02170:      	strb	w1, [x21, #0x4]
 1e02174:      	b	0x1e01dd4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601f4c>
 1e02178:      	cmp	w9, w2
 1e0217c:      	csel	w2, w9, w2, le
 1e02180:      	b	0x1e02088 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602200>
 1e02184:      	cmp	w8, w2
 1e02188:      	csel	w24, w8, w2, le
 1e0218c:      	b	0x1e02068 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6021e0>
 1e02190:      	mov	w0, #0x1                // =1
 1e02194:      	mov	w1, #0x1                // =1
 1e02198:      	strb	w0, [sp, #0x14b]
 1e0219c:      	b	0x1e0103c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6011b4>
 1e021a0:      	mov	x1, x2
 1e021a4:      	mov	w4, #0x1c               // =28
 1e021a8:      	ldr	x2, [sp, #0xd0]
 1e021ac:      	smaddl	x4, w1, w4, x2
 1e021b0:      	sub	x4, x4, #0x1c
 1e021b4:      	dup	v0.8b, w6
 1e021b8:      	mov	w3, w0
 1e021bc:      	ldrb	w5, [sp, #0xc0]
 1e021c0:      	add	x0, sp, #0x141
 1e021c4:      	strb	w10, [x4, #0x8]
 1e021c8:      	strb	w9, [x4, #0x9]
 1e021cc:      	mov	v0.b[1], w11
 1e021d0:      	strb	w8, [x4, #0xa]
 1e021d4:      	strb	w5, [x4, #0xb]
 1e021d8:      	mov	v0.b[2], w7
 1e021dc:      	mov	v0.b[3], w3
 1e021e0:      	mov	v0.b[5], w11
 1e021e4:      	mov	v0.b[6], w7
 1e021e8:      	mov	v0.b[7], w3
 1e021ec:      	str	d0, [x4]
 1e021f0:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e021f4:      	b	0x1e0159c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601714>
 1e021f8:      	adrp	x1, 0x2d99000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7d61a8>
 1e021fc:      	ldr	d1, [x1, #0x498]
 1e02200:      	fcmpe	d0, d1
 1e02204:      	b.mi	0x1e02a5c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602bd4>
 1e02208:      	fmov	d1, #0.50000000
 1e0220c:      	fcmpe	d0, d1
 1e02210:      	b.mi	0x1e02a70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602be8>
 1e02214:      	mov	x1, #0x3333333333333333 // =3689348814741910323
 1e02218:      	movk	x1, #0x3fe3, lsl #48
 1e0221c:      	fmov	d1, x1
 1e02220:      	fcmpe	d0, d1
 1e02224:      	b.mi	0x1e02a7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602bf4>
 1e02228:      	mov	x1, #0x6666666666666666 // =7378697629483820646
 1e0222c:      	movk	x1, #0x3fe6, lsl #48
 1e02230:      	fmov	d1, x1
 1e02234:      	fcmpe	d0, d1
 1e02238:      	b.mi	0x1e02ad8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602c50>
 1e0223c:      	adrp	x1, 0x2900000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x33d1a8>
 1e02240:      	ldr	d1, [x1, #0xf70]
 1e02244:      	fcmpe	d0, d1
 1e02248:      	b.mi	0x1e02acc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602c44>
 1e0224c:      	adrp	x1, 0x28fd000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x33a1a8>
 1e02250:      	mov	w5, #0x7999             // =31129
 1e02254:      	mov	w4, #0x30a3             // =12451
 1e02258:      	mov	w2, #0x228f             // =8847
 1e0225c:      	ldr	d1, [x1, #0x480]
 1e02260:      	mov	w1, #0x70a3             // =28835
 1e02264:      	fcmpe	d0, d1
 1e02268:      	csel	w1, w1, w5, mi
 1e0226c:      	csel	w4, w4, w2, mi
 1e02270:      	b	0x1e01938 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601ab0>
 1e02274:      	mov	x1, #0x7999             // =31129
 1e02278:      	movk	x1, #0x228f, lsl #32
 1e0227c:      	b	0x1e018c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601a3c>
 1e02280:      	add	x20, sp, #0x150
 1e02284:      	fadd	d8, d9, d10
 1e02288:      	add	x23, x20, #0x1
 1e0228c:      	fmov	d11, d0
 1e02290:      	mov	w28, #0x0               // =0
 1e02294:      	mov	w25, #0x0               // =0
 1e02298:      	mov	w19, #0x1               // =1
 1e0229c:      	mov	w1, w24
 1e022a0:      	ldp	w26, w27, [sp, #0x90]
 1e022a4:      	str	wzr, [sp, #0x98]
 1e022a8:      	str	wzr, [sp, #0xa0]
 1e022ac:      	b	0x1e022bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x602434>
