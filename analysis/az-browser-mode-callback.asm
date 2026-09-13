
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000204c7b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84c930>:
 204c7b8:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
 204c7bc:	910003fd 	mov	x29, sp
 204c7c0:	a90153f3 	stp	x19, x20, [sp,#16]
 204c7c4:	aa0003f3 	mov	x19, x0
 204c7c8:	f9402414 	ldr	x20, [x0,#72]
 204c7cc:	a9025bf5 	stp	x21, x22, [sp,#32]
 204c7d0:	b4000b74 	cbz	x20, 204c93c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84cab4>
 204c7d4:	f9400281 	ldr	x1, [x20]
 204c7d8:	aa1403e0 	mov	x0, x20
 204c7dc:	910163e8 	add	x8, sp, #0x58
 204c7e0:	f9400821 	ldr	x1, [x1,#16]
 204c7e4:	d63f0020 	blr	x1
 204c7e8:	f9402674 	ldr	x20, [x19,#72]
 204c7ec:	b4001334 	cbz	x20, 204ca50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84cbc8>
 204c7f0:	f9400281 	ldr	x1, [x20]
 204c7f4:	aa1403e0 	mov	x0, x20
 204c7f8:	f9401421 	ldr	x1, [x1,#40]
 204c7fc:	d63f0020 	blr	x1
 204c800:	a9428e61 	ldp	x1, x3, [x19,#40]
 204c804:	12001c05 	and	w5, w0, #0xff
 204c808:	f9400660 	ldr	x0, [x19,#8]
 204c80c:	eb03003f 	cmp	x1, x3
 204c810:	54000180 	b.eq	204c840 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84c9b8>
 204c814:	f9400022 	ldr	x2, [x1]
 204c818:	f9402fe4 	ldr	x4, [sp,#88]
 204c81c:	eb02009f 	cmp	x4, x2
 204c820:	54000320 	b.eq	204c884 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84c9fc>
 204c824:	91002021 	add	x1, x1, #0x8
 204c828:	14000004 	b	204c838 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84c9b0>
 204c82c:	f8408422 	ldr	x2, [x1],#8
 204c830:	eb04005f 	cmp	x2, x4
 204c834:	54000280 	b.eq	204c884 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84c9fc>
 204c838:	eb01007f 	cmp	x3, x1
 204c83c:	54ffff81 	b.ne	204c82c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84c9a4>
 204c840:	39410261 	ldrb	w1, [x19,#64]
 204c844:	6a0100bf 	tst	w5, w1
 204c848:	540001e1 	b.ne	204c884 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84c9fc>
 204c84c:	52800023 	mov	w3, #0x1                   	// #1
 204c850:	910203e2 	add	x2, sp, #0x80
 204c854:	9101e3e1 	add	x1, sp, #0x78
 204c858:	b9007be3 	str	w3, [sp,#120]
 204c85c:	a9087fff 	stp	xzr, xzr, [sp,#128]
 204c860:	9400b662 	bl	207a1e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87a360>
 204c864:	f94047f3 	ldr	x19, [sp,#136]
 204c868:	b50001f3 	cbnz	x19, 204c8a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84ca1c>
 204c86c:	910163e0 	add	x0, sp, #0x58
 204c870:	940abfc8 	bl	22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x174678>
 204c874:	a94153f3 	ldp	x19, x20, [sp,#16]
 204c878:	a9425bf5 	ldp	x21, x22, [sp,#32]
 204c87c:	a8c97bfd 	ldp	x29, x30, [sp],#144
 204c880:	d65f03c0 	ret
 204c884:	52800043 	mov	w3, #0x2                   	// #2
 204c888:	910203e2 	add	x2, sp, #0x80
 204c88c:	9101e3e1 	add	x1, sp, #0x78
 204c890:	b9007be3 	str	w3, [sp,#120]
 204c894:	a9087fff 	stp	xzr, xzr, [sp,#128]
 204c898:	9400b654 	bl	207a1e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87a360>
 204c89c:	f94047f3 	ldr	x19, [sp,#136]
 204c8a0:	b4fffe73 	cbz	x19, 204c86c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84c9e4>
 204c8a4:	d0006de0 	adrp	x0, 2e0a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8471a8>
 204c8a8:	f9430414 	ldr	x20, [x0,#1544]
 204c8ac:	b4000414 	cbz	x20, 204c92c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84caa4>
 204c8b0:	91002261 	add	x1, x19, #0x8
 204c8b4:	885ffc20 	ldaxr	w0, [x1]
 204c8b8:	51000402 	sub	w2, w0, #0x1
 204c8bc:	8803fc22 	stlxr	w3, w2, [x1]
 204c8c0:	35ffffa3 	cbnz	w3, 204c8b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84ca2c>
 204c8c4:	7100041f 	cmp	w0, #0x1
 204c8c8:	54fffd21 	b.ne	204c86c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84c9e4>
 204c8cc:	f9400261 	ldr	x1, [x19]
 204c8d0:	90ff4600 	adrp	x0, 90c000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x13e8>
 204c8d4:	911cc000 	add	x0, x0, #0x730
 204c8d8:	f9400821 	ldr	x1, [x1,#16]
 204c8dc:	eb00003f 	cmp	x1, x0
 204c8e0:	54001461 	b.ne	204cb6c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84cce4>
 204c8e4:	b40013d4 	cbz	x20, 204cb5c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84ccd4>
 204c8e8:	91003261 	add	x1, x19, #0xc
 204c8ec:	885ffc20 	ldaxr	w0, [x1]
 204c8f0:	51000402 	sub	w2, w0, #0x1
 204c8f4:	8803fc22 	stlxr	w3, w2, [x1]
 204c8f8:	35ffffa3 	cbnz	w3, 204c8ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84ca64>
 204c8fc:	7100041f 	cmp	w0, #0x1
 204c900:	54fffb61 	b.ne	204c86c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84c9e4>
 204c904:	f9400261 	ldr	x1, [x19]
 204c908:	90ff4600 	adrp	x0, 90c000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x13e8>
 204c90c:	911ce000 	add	x0, x0, #0x738
 204c910:	f9400c22 	ldr	x2, [x1,#24]
 204c914:	eb00005f 	cmp	x2, x0
 204c918:	54001301 	b.ne	204cb78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84ccf0>
 204c91c:	f9400421 	ldr	x1, [x1,#8]
 204c920:	aa1303e0 	mov	x0, x19
 204c924:	d63f0020 	blr	x1
 204c928:	17ffffd1 	b	204c86c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84c9e4>
 204c92c:	b9400a60 	ldr	w0, [x19,#8]
 204c930:	51000401 	sub	w1, w0, #0x1
 204c934:	b9000a61 	str	w1, [x19,#8]
 204c938:	17ffffe3 	b	204c8c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84ca3c>
 204c93c:	f9402800 	ldr	x0, [x0,#80]
 204c940:	b4fff4a0 	cbz	x0, 204c7d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84c94c>
 204c944:	b000d7b6 	adrp	x22, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 204c948:	9123e2d6 	add	x22, x22, #0x8f8
 204c94c:	08dffec0 	ldarb	w0, [x22]
 204c950:	360011e0 	tbz	w0, #0, 204cb8c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84cd04>
 204c954:	b000d7b5 	adrp	x21, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 204c958:	912402b5 	add	x21, x21, #0x900
 204c95c:	b9801aa1 	ldrsw	x1, [x21,#24]
