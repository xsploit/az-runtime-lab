
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002079ac8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879c40>:
 2079ac8:	a9ba7bfd 	stp	x29, x30, [sp,#-96]!
 2079acc:	d0006cc1 	adrp	x1, 2e13000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8501a8>
 2079ad0:	910003fd 	mov	x29, sp
 2079ad4:	a90153f3 	stp	x19, x20, [sp,#16]
 2079ad8:	aa0003f3 	mov	x19, x0
 2079adc:	f9473434 	ldr	x20, [x1,#3688]
 2079ae0:	a9025bf5 	stp	x21, x22, [sp,#32]
 2079ae4:	91002015 	add	x21, x0, #0x8
 2079ae8:	b4000094 	cbz	x20, 2079af8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879c70>
 2079aec:	aa1503e0 	mov	x0, x21
 2079af0:	978eb528 	bl	426f90 <pthread_mutex_lock@plt>
 2079af4:	35001480 	cbnz	w0, 2079d84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879efc>
 2079af8:	f9402260 	ldr	x0, [x19,#64]
 2079afc:	a90363f7 	stp	x23, x24, [sp,#48]
 2079b00:	a9046bf9 	stp	x25, x26, [sp,#64]
 2079b04:	3940f279 	ldrb	w25, [x19,#60]
 2079b08:	3940f678 	ldrb	w24, [x19,#61]
 2079b0c:	3940fa77 	ldrb	w23, [x19,#62]
 2079b10:	b9403a76 	ldr	w22, [x19,#56]
 2079b14:	b4000520 	cbz	x0, 2079bb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879d30>
 2079b18:	97ff468e 	bl	204b550 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84b6c8>
 2079b1c:	72001c1f 	tst	w0, #0xff
 2079b20:	54000be1 	b.ne	2079c9c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879e14>
 2079b24:	f940267a 	ldr	x26, [x19,#72]
 2079b28:	a9047e7f 	stp	xzr, xzr, [x19,#64]
 2079b2c:	b400043a 	cbz	x26, 2079bb0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879d28>
 2079b30:	b4000df4 	cbz	x20, 2079cec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879e64>
 2079b34:	91002341 	add	x1, x26, #0x8
 2079b38:	885ffc20 	ldaxr	w0, [x1]
 2079b3c:	51000402 	sub	w2, w0, #0x1
 2079b40:	8803fc22 	stlxr	w3, w2, [x1]
 2079b44:	35ffffa3 	cbnz	w3, 2079b38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879cb0>
 2079b48:	7100041f 	cmp	w0, #0x1
 2079b4c:	54000321 	b.ne	2079bb0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879d28>
 2079b50:	f9400341 	ldr	x1, [x26]
 2079b54:	f0ff4480 	adrp	x0, 90c000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x13e8>
 2079b58:	911cc000 	add	x0, x0, #0x730
 2079b5c:	f9400821 	ldr	x1, [x1,#16]
 2079b60:	eb00003f 	cmp	x1, x0
 2079b64:	54000e41 	b.ne	2079d2c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879ea4>
 2079b68:	b4000d34 	cbz	x20, 2079d0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879e84>
 2079b6c:	91003341 	add	x1, x26, #0xc
 2079b70:	885ffc20 	ldaxr	w0, [x1]
 2079b74:	51000402 	sub	w2, w0, #0x1
 2079b78:	8803fc22 	stlxr	w3, w2, [x1]
 2079b7c:	35ffffa3 	cbnz	w3, 2079b70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879ce8>
 2079b80:	7100041f 	cmp	w0, #0x1
 2079b84:	54000161 	b.ne	2079bb0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879d28>
 2079b88:	f9400341 	ldr	x1, [x26]
 2079b8c:	f0ff4480 	adrp	x0, 90c000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x13e8>
 2079b90:	911ce000 	add	x0, x0, #0x738
 2079b94:	f9400c22 	ldr	x2, [x1,#24]
 2079b98:	eb00005f 	cmp	x2, x0
 2079b9c:	54000e81 	b.ne	2079d6c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879ee4>
 2079ba0:	f9400421 	ldr	x1, [x1,#8]
 2079ba4:	aa1a03e0 	mov	x0, x26
 2079ba8:	d63f0020 	blr	x1
 2079bac:	d503201f 	nop
 2079bb0:	7900a27f 	strh	wzr, [x19,#80]
 2079bb4:	39014a7f 	strb	wzr, [x19,#82]
 2079bb8:	f9402e60 	ldr	x0, [x19,#88]
 2079bbc:	b40004e0 	cbz	x0, 2079c58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879dd0>
 2079bc0:	97ff4664 	bl	204b550 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84b6c8>
 2079bc4:	72001c1f 	tst	w0, #0xff
 2079bc8:	54000821 	b.ne	2079ccc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879e44>
 2079bcc:	f940327a 	ldr	x26, [x19,#96]
 2079bd0:	a905fe7f 	stp	xzr, xzr, [x19,#88]
 2079bd4:	b400043a 	cbz	x26, 2079c58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879dd0>
 2079bd8:	b4000934 	cbz	x20, 2079cfc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879e74>
 2079bdc:	91002341 	add	x1, x26, #0x8
 2079be0:	885ffc20 	ldaxr	w0, [x1]
 2079be4:	51000402 	sub	w2, w0, #0x1
 2079be8:	8803fc22 	stlxr	w3, w2, [x1]
 2079bec:	35ffffa3 	cbnz	w3, 2079be0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879d58>
 2079bf0:	7100041f 	cmp	w0, #0x1
 2079bf4:	54000321 	b.ne	2079c58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879dd0>
 2079bf8:	f9400341 	ldr	x1, [x26]
 2079bfc:	f0ff4480 	adrp	x0, 90c000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x13e8>
 2079c00:	911cc000 	add	x0, x0, #0x730
 2079c04:	f9400821 	ldr	x1, [x1,#16]
 2079c08:	eb00003f 	cmp	x1, x0
 2079c0c:	54000981 	b.ne	2079d3c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879eb4>
 2079c10:	b4000874 	cbz	x20, 2079d1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879e94>
 2079c14:	91003341 	add	x1, x26, #0xc
 2079c18:	885ffc20 	ldaxr	w0, [x1]
 2079c1c:	51000402 	sub	w2, w0, #0x1
 2079c20:	8803fc22 	stlxr	w3, w2, [x1]
 2079c24:	35ffffa3 	cbnz	w3, 2079c18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879d90>
 2079c28:	7100041f 	cmp	w0, #0x1
 2079c2c:	54000161 	b.ne	2079c58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879dd0>
 2079c30:	f9400341 	ldr	x1, [x26]
 2079c34:	f0ff4480 	adrp	x0, 90c000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x13e8>
 2079c38:	911ce000 	add	x0, x0, #0x738
 2079c3c:	f9400c22 	ldr	x2, [x1,#24]
 2079c40:	eb00005f 	cmp	x2, x0
 2079c44:	540009a1 	b.ne	2079d78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879ef0>
 2079c48:	f9400421 	ldr	x1, [x1,#8]
 2079c4c:	aa1a03e0 	mov	x0, x26
 2079c50:	d63f0020 	blr	x1
 2079c54:	d503201f 	nop
 2079c58:	b9005bf6 	str	w22, [sp,#88]
 2079c5c:	390173f9 	strb	w25, [sp,#92]
 2079c60:	390177f8 	strb	w24, [sp,#93]
 2079c64:	39017bf7 	strb	w23, [sp,#94]
 2079c68:	b4000074 	cbz	x20, 2079c74 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879dec>
 2079c6c:	aa1503e0 	mov	x0, x21
 2079c70:	978eb374 	bl	426a40 <pthread_mutex_unlock@plt>
 2079c74:	294b07e2 	ldp	w2, w1, [sp,#88]
 2079c78:	d2800000 	mov	x0, #0x0                   	// #0
 2079c7c:	a94153f3 	ldp	x19, x20, [sp,#16]
 2079c80:	b3407c40 	bfxil	x0, x2, #0, #32
 2079c84:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2079c88:	b3607c20 	bfi	x0, x1, #32, #32
 2079c8c:	a94363f7 	ldp	x23, x24, [sp,#48]
 2079c90:	a9446bf9 	ldp	x25, x26, [sp,#64]
 2079c94:	a8c67bfd 	ldp	x29, x30, [sp],#96
 2079c98:	d65f03c0 	ret
 2079c9c:	f9402260 	ldr	x0, [x19,#64]
 2079ca0:	97ff45e6 	bl	204b438 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84b5b0>
 2079ca4:	39414262 	ldrb	w2, [x19,#80]
 2079ca8:	39414661 	ldrb	w1, [x19,#81]
 2079cac:	39414a63 	ldrb	w3, [x19,#82]
 2079cb0:	2a010044 	orr	w4, w2, w1
 2079cb4:	340004c4 	cbz	w4, 2079d4c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879ec4>
 2079cb8:	b9005be0 	str	w0, [sp,#88]
 2079cbc:	390173e2 	strb	w2, [sp,#92]
 2079cc0:	390177e1 	strb	w1, [sp,#93]
 2079cc4:	39017be3 	strb	w3, [sp,#94]
 2079cc8:	17ffffe8 	b	2079c68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879de0>
 2079ccc:	f9402e60 	ldr	x0, [x19,#88]
 2079cd0:	97ff45da 	bl	204b438 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84b5b0>
 2079cd4:	2a0003f6 	mov	w22, w0
 2079cd8:	b9005bf6 	str	w22, [sp,#88]
 2079cdc:	390173f9 	strb	w25, [sp,#92]
 2079ce0:	390177f8 	strb	w24, [sp,#93]
 2079ce4:	39017bf7 	strb	w23, [sp,#94]
 2079ce8:	17ffffe0 	b	2079c68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879de0>
 2079cec:	b9400b40 	ldr	w0, [x26,#8]
 2079cf0:	51000401 	sub	w1, w0, #0x1
 2079cf4:	b9000b41 	str	w1, [x26,#8]
 2079cf8:	17ffff94 	b	2079b48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879cc0>
 2079cfc:	b9400b40 	ldr	w0, [x26,#8]
 2079d00:	51000401 	sub	w1, w0, #0x1
 2079d04:	b9000b41 	str	w1, [x26,#8]
 2079d08:	17ffffba 	b	2079bf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879d68>
 2079d0c:	b9400f40 	ldr	w0, [x26,#12]
 2079d10:	51000401 	sub	w1, w0, #0x1
 2079d14:	b9000f41 	str	w1, [x26,#12]
 2079d18:	17ffff9a 	b	2079b80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879cf8>
 2079d1c:	b9400f40 	ldr	w0, [x26,#12]
 2079d20:	51000401 	sub	w1, w0, #0x1
 2079d24:	b9000f41 	str	w1, [x26,#12]
 2079d28:	17ffffc0 	b	2079c28 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879da0>
 2079d2c:	aa1a03e0 	mov	x0, x26
 2079d30:	d63f0020 	blr	x1
 2079d34:	b5fff1d4 	cbnz	x20, 2079b6c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879ce4>
 2079d38:	17fffff5 	b	2079d0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879e84>
 2079d3c:	aa1a03e0 	mov	x0, x26
 2079d40:	d63f0020 	blr	x1
 2079d44:	b5fff694 	cbnz	x20, 2079c14 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879d8c>
 2079d48:	17fffff5 	b	2079d1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879e94>
 2079d4c:	34000083 	cbz	w3, 2079d5c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879ed4>
 2079d50:	52800001 	mov	w1, #0x0                   	// #0
 2079d54:	52800002 	mov	w2, #0x0                   	// #0
 2079d58:	17ffffd8 	b	2079cb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879e30>
 2079d5c:	2a1703e3 	mov	w3, w23
 2079d60:	2a1803e1 	mov	w1, w24
 2079d64:	2a1903e2 	mov	w2, w25
 2079d68:	17ffffd4 	b	2079cb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879e30>
 2079d6c:	aa1a03e0 	mov	x0, x26
 2079d70:	d63f0040 	blr	x2
 2079d74:	17ffff8f 	b	2079bb0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879d28>
 2079d78:	aa1a03e0 	mov	x0, x26
 2079d7c:	d63f0040 	blr	x2
 2079d80:	17ffffb6 	b	2079c58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879dd0>
 2079d84:	a90363f7 	stp	x23, x24, [sp,#48]
 2079d88:	a9046bf9 	stp	x25, x26, [sp,#64]
 2079d8c:	978eaaa5 	bl	424820 <_ZSt20__throw_system_errori@plt>
 2079d90:	aa0003f3 	mov	x19, x0
 2079d94:	b4000074 	cbz	x20, 2079da0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x879f18>
 2079d98:	aa1503e0 	mov	x0, x21
 2079d9c:	978eb329 	bl	426a40 <pthread_mutex_unlock@plt>
 2079da0:	aa1303e0 	mov	x0, x19
 2079da4:	978eabdb 	bl	424d10 <_Unwind_Resume@plt>
