
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f6a20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e908>:
 21f6a20:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 21f6a24:	910003fd 	mov	x29, sp
 21f6a28:	a90153f3 	stp	x19, x20, [sp,#16]
 21f6a2c:	aa0003f4 	mov	x20, x0
 21f6a30:	f9001bf7 	str	x23, [sp,#48]
 21f6a34:	94000ed3 	bl	21fa580 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x72468>
 21f6a38:	aa0003f7 	mov	x23, x0
 21f6a3c:	9404d5ad 	bl	232c0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fd8>
 21f6a40:	72001c1f 	tst	w0, #0xff
 21f6a44:	54000141 	b.ne	21f6a6c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e954>
 21f6a48:	91008294 	add	x20, x20, #0x20
 21f6a4c:	c8dffe93 	ldar	x19, [x20]
 21f6a50:	b4000813 	cbz	x19, 21f6b50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6ea38>
 21f6a54:	aa1303e0 	mov	x0, x19
 21f6a58:	97fffd7a 	bl	21f6040 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6df28>
 21f6a5c:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f6a60:	f9401bf7 	ldr	x23, [sp,#48]
 21f6a64:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21f6a68:	d65f03c0 	ret
 21f6a6c:	aa1403e0 	mov	x0, x20
 21f6a70:	97ffe7bc 	bl	21f0960 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68848>
 21f6a74:	f9400680 	ldr	x0, [x20,#8]
 21f6a78:	b40005e0 	cbz	x0, 21f6b34 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6ea1c>
 21f6a7c:	f9400680 	ldr	x0, [x20,#8]
 21f6a80:	a9025bf5 	stp	x21, x22, [sp,#32]
 21f6a84:	b0000016 	adrp	x22, 21f7000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6eee8>
 21f6a88:	911c42d6 	add	x22, x22, #0x710
 21f6a8c:	b9400800 	ldr	w0, [x0,#8]
 21f6a90:	7100001f 	cmp	w0, #0x0
 21f6a94:	5400020d 	b.le	21f6ad4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e9bc>
 21f6a98:	14000026 	b	21f6b30 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6ea18>
 21f6a9c:	f9401262 	ldr	x2, [x19,#32]
 21f6aa0:	b9402a61 	ldr	w1, [x19,#40]
 21f6aa4:	aa0203e0 	mov	x0, x2
 21f6aa8:	f9400042 	ldr	x2, [x2]
 21f6aac:	f9400842 	ldr	x2, [x2,#16]
 21f6ab0:	d63f0040 	blr	x2
 21f6ab4:	aa1503e0 	mov	x0, x21
 21f6ab8:	9404d58a 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 21f6abc:	f9400680 	ldr	x0, [x20,#8]
 21f6ac0:	b4000380 	cbz	x0, 21f6b30 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6ea18>
 21f6ac4:	f9400680 	ldr	x0, [x20,#8]
 21f6ac8:	b9400800 	ldr	w0, [x0,#8]
 21f6acc:	7100001f 	cmp	w0, #0x0
 21f6ad0:	5400030c 	b.gt	21f6b30 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6ea18>
 21f6ad4:	f9400693 	ldr	x19, [x20,#8]
 21f6ad8:	aa1403e0 	mov	x0, x20
 21f6adc:	aa1303e1 	mov	x1, x19
 21f6ae0:	b9400e62 	ldr	w2, [x19,#12]
 21f6ae4:	b9000a62 	str	w2, [x19,#8]
 21f6ae8:	97ffe7e6 	bl	21f0a80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68968>
 21f6aec:	aa1303e1 	mov	x1, x19
 21f6af0:	aa1403e0 	mov	x0, x20
 21f6af4:	97ffe7bb 	bl	21f09e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x688c8>
 21f6af8:	94000ea2 	bl	21fa580 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x72468>
 21f6afc:	aa0003f5 	mov	x21, x0
 21f6b00:	9404d584 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21f6b04:	f9400260 	ldr	x0, [x19]
 21f6b08:	f9400801 	ldr	x1, [x0,#16]
 21f6b0c:	eb16003f 	cmp	x1, x22
 21f6b10:	54fffc60 	b.eq	21f6a9c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e984>
 21f6b14:	aa1303e0 	mov	x0, x19
 21f6b18:	d63f0020 	blr	x1
 21f6b1c:	aa1503e0 	mov	x0, x21
 21f6b20:	9404d570 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 21f6b24:	f9400680 	ldr	x0, [x20,#8]
 21f6b28:	b5fffce0 	cbnz	x0, 21f6ac4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e9ac>
 21f6b2c:	d503201f 	nop
 21f6b30:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21f6b34:	91006294 	add	x20, x20, #0x18
 21f6b38:	889ffe9f 	stlr	wzr, [x20]
 21f6b3c:	aa1703e0 	mov	x0, x23
 21f6b40:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f6b44:	f9401bf7 	ldr	x23, [sp,#48]
 21f6b48:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21f6b4c:	1404d571 	b	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21f6b50:	97ffdd20 	bl	21edfd0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x65eb8>
 21f6b54:	aa1303e0 	mov	x0, x19
 21f6b58:	97fffd3a 	bl	21f6040 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6df28>
 21f6b5c:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f6b60:	f9401bf7 	ldr	x23, [sp,#48]
 21f6b64:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21f6b68:	d65f03c0 	ret
 21f6b6c:	aa0003f3 	mov	x19, x0
 21f6b70:	aa1503e0 	mov	x0, x21
 21f6b74:	9404d55b 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 21f6b78:	aa1703e0 	mov	x0, x23
 21f6b7c:	9404d565 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21f6b80:	aa1303e0 	mov	x0, x19
 21f6b84:	9788b863 	bl	424d10 <_Unwind_Resume@plt>
 21f6b88:	d503201f 	nop
 21f6b8c:	d503201f 	nop
 21f6b90:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
 21f6b94:	910003fd 	mov	x29, sp
 21f6b98:	a90153f3 	stp	x19, x20, [sp,#16]
 21f6b9c:	aa0003f3 	mov	x19, x0
 21f6ba0:	9000cf14 	adrp	x20, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f6ba4:	91312294 	add	x20, x20, #0xc48
 21f6ba8:	a9025bf5 	stp	x21, x22, [sp,#32]
 21f6bac:	aa0203f5 	mov	x21, x2
 21f6bb0:	a90363f7 	stp	x23, x24, [sp,#48]
 21f6bb4:	08dffe80 	ldarb	w0, [x20]
 21f6bb8:	9000cf16 	adrp	x22, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f6bbc:	36001280 	tbz	w0, #0, 21f6e0c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6ecf4>
 21f6bc0:	aa1303f4 	mov	x20, x19
 21f6bc4:	b94c52c0 	ldr	w0, [x22,#3152]
 21f6bc8:	b9000a60 	str	w0, [x19,#8]
 21f6bcc:	d2800002 	mov	x2, #0x0                   	// #0
 21f6bd0:	b0006360 	adrp	x0, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f6bd4:	9105c000 	add	x0, x0, #0x170
 21f6bd8:	f8010680 	str	x0, [x20],#16
 21f6bdc:	aa1403e0 	mov	x0, x20
 21f6be0:	9404d568 	bl	232c180 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a4068>
 21f6be4:	91068276 	add	x22, x19, #0x1a0
 21f6be8:	d0006362 	adrp	x2, 2e64000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a11a8>
 21f6bec:	910b6042 	add	x2, x2, #0x2d8
 21f6bf0:	d0006360 	adrp	x0, 2e64000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a11a8>
 21f6bf4:	910c4000 	add	x0, x0, #0x310
 21f6bf8:	f9000262 	str	x2, [x19]
 21f6bfc:	f9000a60 	str	x0, [x19,#16]
 21f6c00:	12800003 	mov	w3, #0xffffffff            	// #-1
 21f6c04:	a919fe7f 	stp	xzr, xzr, [x19,#408]
 21f6c08:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
 21f6c0c:	d2800400 	mov	x0, #0x20                  	// #32
 21f6c10:	b9000adf 	str	wzr, [x22,#8]
 21f6c14:	b90012df 	str	wzr, [x22,#16]
 21f6c18:	3907427f 	strb	wzr, [x19,#464]
 21f6c1c:	3907467f 	strb	wzr, [x19,#465]
 21f6c20:	b901d663 	str	w3, [x19,#468]
 21f6c24:	f900de7f 	str	xzr, [x19,#440]
 21f6c28:	f94002a1 	ldr	x1, [x21]
 21f6c2c:	b901c27f 	str	wzr, [x19,#448]
 21f6c30:	b901ca7f 	str	wzr, [x19,#456]
 21f6c34:	f900ee62 	str	x2, [x19,#472]
 21f6c38:	f900f261 	str	x1, [x19,#480]
 21f6c3c:	9788b841 	bl	424d40 <_Znwm@plt>
 21f6c40:	aa0003f5 	mov	x21, x0
 21f6c44:	97ffed03 	bl	21f2050 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69f38>
 21f6c48:	f940ce60 	ldr	x0, [x19,#408]
 21f6c4c:	eb0002bf 	cmp	x21, x0
 21f6c50:	54000060 	b.eq	21f6c5c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6eb44>
 21f6c54:	f900ce75 	str	x21, [x19,#408]
 21f6c58:	9400167a 	bl	21fc640 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74528>
 21f6c5c:	52800140 	mov	w0, #0xa                   	// #10
