
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000001df68d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6a48>:
 1df68d0:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 1df68d4:	b0007cc1 	adrp	x1, 2d8f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x7cc1a8>
 1df68d8:	91296021 	add	x1, x1, #0xa58
 1df68dc:	910003fd 	mov	x29, sp
 1df68e0:	f9000bf3 	str	x19, [sp,#16]
 1df68e4:	aa0003f3 	mov	x19, x0
 1df68e8:	f9407800 	ldr	x0, [x0,#240]
 1df68ec:	f9000261 	str	x1, [x19]
 1df68f0:	f9007a7f 	str	xzr, [x19,#240]
 1df68f4:	b4000120 	cbz	x0, 1df6918 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6a90>
 1df68f8:	f9400001 	ldr	x1, [x0]
 1df68fc:	f9400421 	ldr	x1, [x1,#8]
 1df6900:	d63f0020 	blr	x1
 1df6904:	f9407a60 	ldr	x0, [x19,#240]
 1df6908:	b4000080 	cbz	x0, 1df6918 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6a90>
 1df690c:	f9400001 	ldr	x1, [x0]
 1df6910:	f9400421 	ldr	x1, [x1,#8]
 1df6914:	d63f0020 	blr	x1
 1df6918:	91032260 	add	x0, x19, #0xc8
 1df691c:	97ffff93 	bl	1df6768 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f68e0>
 1df6920:	aa1303e0 	mov	x0, x19
 1df6924:	f9400bf3 	ldr	x19, [sp,#16]
 1df6928:	a8c27bfd 	ldp	x29, x30, [sp],#32
 1df692c:	141a6d69 	b	2491ed0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x11cab0>
 1df6930:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 1df6934:	910003fd 	mov	x29, sp
 1df6938:	f9000bf3 	str	x19, [sp,#16]
 1df693c:	aa0103f3 	mov	x19, x1
 1df6940:	5287c881 	mov	w1, #0x3e44                	// #15940
 1df6944:	9100a3e0 	add	x0, sp, #0x28
 1df6948:	72bfe641 	movk	w1, #0xff32, lsl #16
 1df694c:	9416b9c9 	bl	23a5070 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2fc50>
 1df6950:	9100a3e1 	add	x1, sp, #0x28
 1df6954:	aa1303e0 	mov	x0, x19
 1df6958:	9416e39e 	bl	23af7d0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x3a3b0>
 1df695c:	9100a3e0 	add	x0, sp, #0x28
 1df6960:	9416a564 	bl	239fef0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2aad0>
 1df6964:	f9400bf3 	ldr	x19, [sp,#16]
 1df6968:	a8c37bfd 	ldp	x29, x30, [sp],#48
 1df696c:	d65f03c0 	ret
 1df6970:	aa0003f3 	mov	x19, x0
 1df6974:	9100a3e0 	add	x0, sp, #0x28
 1df6978:	9416a55e 	bl	239fef0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2aad0>
 1df697c:	aa1303e0 	mov	x0, x19
 1df6980:	9798b8e4 	bl	424d10 <_Unwind_Resume@plt>
 1df6984:	d503201f 	nop
 1df6988:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 1df698c:	b0007cc1 	adrp	x1, 2d8f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x7cc1a8>
 1df6990:	91296021 	add	x1, x1, #0xa58
 1df6994:	910003fd 	mov	x29, sp
 1df6998:	f9000bf3 	str	x19, [sp,#16]
 1df699c:	aa0003f3 	mov	x19, x0
 1df69a0:	f9407800 	ldr	x0, [x0,#240]
 1df69a4:	f9000261 	str	x1, [x19]
 1df69a8:	f9007a7f 	str	xzr, [x19,#240]
 1df69ac:	b4000120 	cbz	x0, 1df69d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6b48>
 1df69b0:	f9400001 	ldr	x1, [x0]
 1df69b4:	f9400421 	ldr	x1, [x1,#8]
 1df69b8:	d63f0020 	blr	x1
 1df69bc:	f9407a60 	ldr	x0, [x19,#240]
 1df69c0:	b4000080 	cbz	x0, 1df69d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6b48>
 1df69c4:	f9400001 	ldr	x1, [x0]
 1df69c8:	f9400421 	ldr	x1, [x1,#8]
 1df69cc:	d63f0020 	blr	x1
 1df69d0:	91032260 	add	x0, x19, #0xc8
 1df69d4:	97ffff65 	bl	1df6768 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f68e0>
 1df69d8:	aa1303e0 	mov	x0, x19
 1df69dc:	941a6d3d 	bl	2491ed0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x11cab0>
 1df69e0:	aa1303e0 	mov	x0, x19
 1df69e4:	d2801f01 	mov	x1, #0xf8                  	// #248
 1df69e8:	f9400bf3 	ldr	x19, [sp,#16]
 1df69ec:	a8c27bfd 	ldp	x29, x30, [sp],#32
 1df69f0:	1798bf1c 	b	426660 <_ZdlPvm@plt>
 1df69f4:	d503201f 	nop
 1df69f8:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
 1df69fc:	910003fd 	mov	x29, sp
 1df6a00:	a90153f3 	stp	x19, x20, [sp,#16]
 1df6a04:	aa0003f3 	mov	x19, x0
 1df6a08:	f9406814 	ldr	x20, [x0,#208]
 1df6a0c:	39430680 	ldrb	w0, [x20,#193]
 1df6a10:	350002a0 	cbnz	w0, 1df6a64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6bdc>
 1df6a14:	b940ca61 	ldr	w1, [x19,#200]
 1df6a18:	71000c3f 	cmp	w1, #0x3
 1df6a1c:	5400016d 	b.le	1df6a48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6bc0>
 1df6a20:	52800121 	mov	w1, #0x9                   	// #9
 1df6a24:	f9407a60 	ldr	x0, [x19,#240]
 1df6a28:	b940c802 	ldr	w2, [x0,#200]
 1df6a2c:	6b01005f 	cmp	w2, w1
 1df6a30:	54000060 	b.eq	1df6a3c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6bb4>
 1df6a34:	b900c801 	str	w1, [x0,#200]
 1df6a38:	941a46ce 	bl	2488570 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x113150>
 1df6a3c:	a94153f3 	ldp	x19, x20, [sp,#16]
 1df6a40:	a8c87bfd 	ldp	x29, x30, [sp],#128
 1df6a44:	d65f03c0 	ret
 1df6a48:	531f7821 	lsl	w1, w1, #1
 1df6a4c:	11000421 	add	w1, w1, #0x1
 1df6a50:	7100643f 	cmp	w1, #0x19
 1df6a54:	54fffe89 	b.ls	1df6a24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6b9c>
 1df6a58:	a94153f3 	ldp	x19, x20, [sp,#16]
 1df6a5c:	a8c87bfd 	ldp	x29, x30, [sp],#128
 1df6a60:	d65f03c0 	ret
 1df6a64:	a9025bf5 	stp	x21, x22, [sp,#32]
 1df6a68:	9101c3f6 	add	x22, sp, #0x70
 1df6a6c:	f9400a95 	ldr	x21, [x20,#16]
 1df6a70:	b4000315 	cbz	x21, 1df6ad0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6c48>
 1df6a74:	f94002a1 	ldr	x1, [x21]
 1df6a78:	aa1503e0 	mov	x0, x21
 1df6a7c:	aa1603e8 	mov	x8, x22
 1df6a80:	f9400c21 	ldr	x1, [x1,#24]
 1df6a84:	d63f0020 	blr	x1
 1df6a88:	3941e3e0 	ldrb	w0, [sp,#120]
 1df6a8c:	35000060 	cbnz	w0, 1df6a98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6c10>
 1df6a90:	a9425bf5 	ldp	x21, x22, [sp,#32]
 1df6a94:	17ffffe0 	b	1df6a14 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6b8c>
 1df6a98:	f9402295 	ldr	x21, [x20,#64]
 1df6a9c:	b4000ab5 	cbz	x21, 1df6bf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6d68>
 1df6aa0:	f94002a1 	ldr	x1, [x21]
 1df6aa4:	aa1503e0 	mov	x0, x21
 1df6aa8:	f9400821 	ldr	x1, [x1,#16]
 1df6aac:	d63f0020 	blr	x1
 1df6ab0:	12001c00 	and	w0, w0, #0xff
 1df6ab4:	7100041f 	cmp	w0, #0x1
 1df6ab8:	54fffec1 	b.ne	1df6a90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6c08>
 1df6abc:	b940ca61 	ldr	w1, [x19,#200]
 1df6ac0:	a9425bf5 	ldp	x21, x22, [sp,#32]
 1df6ac4:	531f7821 	lsl	w1, w1, #1
 1df6ac8:	11002c21 	add	w1, w1, #0xb
 1df6acc:	17ffffe1 	b	1df6a50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6bc8>
 1df6ad0:	f9400e80 	ldr	x0, [x20,#24]
 1df6ad4:	b4fffd00 	cbz	x0, 1df6a74 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6bec>
 1df6ad8:	f000ea56 	adrp	x22, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 1df6adc:	9123e2d6 	add	x22, x22, #0x8f8
 1df6ae0:	a90363f7 	stp	x23, x24, [sp,#48]
 1df6ae4:	08dffec0 	ldarb	w0, [x22]
 1df6ae8:	36001720 	tbz	w0, #0, 1df6dcc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6f44>
 1df6aec:	f000ea57 	adrp	x23, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 1df6af0:	912402f7 	add	x23, x23, #0x900
 1df6af4:	b9801ae1 	ldrsw	x1, [x23,#24]
 1df6af8:	f9400e82 	ldr	x2, [x20,#24]
 1df6afc:	f94006e3 	ldr	x3, [x23,#8]
