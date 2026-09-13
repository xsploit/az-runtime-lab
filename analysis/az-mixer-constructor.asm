
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021b29d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a8b8>:
 21b29d0:	aa0103e0 	mov	x0, x1
 21b29d4:	97930641 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 21b29d8:	17ffffb2 	b	21b28a0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a788>
 21b29dc:	d503201f 	nop
 21b29e0:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 21b29e4:	910003fd 	mov	x29, sp
 21b29e8:	6d0327e8 	stp	d8, d9, [sp,#48]
 21b29ec:	1e604008 	fmov	d8, d0
 21b29f0:	1e204029 	fmov	s9, s1
 21b29f4:	a9025bf5 	stp	x21, x22, [sp,#32]
 21b29f8:	aa0003f5 	mov	x21, x0
 21b29fc:	2a0103f6 	mov	w22, w1
 21b2a00:	a90153f3 	stp	x19, x20, [sp,#16]
 21b2a04:	91044013 	add	x19, x0, #0x110
 21b2a08:	9104e014 	add	x20, x0, #0x138
 21b2a0c:	9404c369 	bl	22e37b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x15b698>
 21b2a10:	a9117ebf 	stp	xzr, xzr, [x21,#272]
 21b2a14:	90006520 	adrp	x0, 2e56000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8931a8>
 21b2a18:	912fe000 	add	x0, x0, #0xbf8
 21b2a1c:	f90002a0 	str	x0, [x21]
 21b2a20:	b900127f 	str	wzr, [x19,#16]
 21b2a24:	531f7ac1 	lsl	w1, w22, #1
 21b2a28:	a901fe7f 	stp	xzr, xzr, [x19,#24]
 21b2a2c:	52800042 	mov	w2, #0x2                   	// #2
 21b2a30:	aa1503e0 	mov	x0, x21
 21b2a34:	f9009ebf 	str	xzr, [x21,#312]
 21b2a38:	a900fe9f 	stp	xzr, xzr, [x20,#8]
 21b2a3c:	b94042a3 	ldr	w3, [x21,#64]
 21b2a40:	fd401ea0 	ldr	d0, [x21,#56]
 21b2a44:	f900aabf 	str	xzr, [x21,#336]
 21b2a48:	b90162bf 	str	wzr, [x21,#352]
 21b2a4c:	a916febf 	stp	xzr, xzr, [x21,#360]
 21b2a50:	9404bae4 	bl	22e15e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1594c8>
 21b2a54:	fd401261 	ldr	d1, [x19,#32]
 21b2a58:	bd400660 	ldr	s0, [x19,#4]
 21b2a5c:	1e602028 	fcmp	d1, #0.0
 21b2a60:	54000a41 	b.ne	21b2ba8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2aa90>
 21b2a64:	1e202120 	fcmp	s9, s0
 21b2a68:	54000160 	b.eq	21b2a94 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a97c>
 21b2a6c:	b9401260 	ldr	w0, [x19,#16]
 21b2a70:	b9000e60 	str	w0, [x19,#12]
 21b2a74:	bd000669 	str	s9, [x19,#4]
 21b2a78:	7100001f 	cmp	w0, #0x0
 21b2a7c:	5400092d 	b.le	21b2ba0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2aa88>
 21b2a80:	bd4112a1 	ldr	s1, [x21,#272]
 21b2a84:	1e220000 	scvtf	s0, w0
 21b2a88:	1e213929 	fsub	s9, s9, s1
 21b2a8c:	1e201929 	fdiv	s9, s9, s0
 21b2a90:	bd000a69 	str	s9, [x19,#8]
 21b2a94:	93407ec1 	sxtw	x1, w22
 21b2a98:	aa1403e0 	mov	x0, x20
 21b2a9c:	94000975 	bl	21b5070 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2cf58>
 21b2aa0:	710002df 	cmp	w22, #0x0
 21b2aa4:	f9400681 	ldr	x1, [x20,#8]
 21b2aa8:	5400028d 	b.le	21b2af8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a9e0>
 21b2aac:	52800013 	mov	w19, #0x0                   	// #0
 21b2ab0:	14000009 	b	21b2ad4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a9bc>
 21b2ab4:	a9007c3f 	stp	xzr, xzr, [x1]
 21b2ab8:	11000673 	add	w19, w19, #0x1
 21b2abc:	6b1302df 	cmp	w22, w19
 21b2ac0:	b900103f 	str	wzr, [x1,#16]
 21b2ac4:	a901fc3f 	stp	xzr, xzr, [x1,#24]
 21b2ac8:	9100a021 	add	x1, x1, #0x28
 21b2acc:	f9000681 	str	x1, [x20,#8]
 21b2ad0:	54000140 	b.eq	21b2af8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a9e0>
 21b2ad4:	f9400a80 	ldr	x0, [x20,#16]
 21b2ad8:	eb01001f 	cmp	x0, x1
 21b2adc:	54fffec1 	b.ne	21b2ab4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a99c>
 21b2ae0:	aa1403e0 	mov	x0, x20
 21b2ae4:	94000a67 	bl	21b5480 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d368>
 21b2ae8:	11000673 	add	w19, w19, #0x1
 21b2aec:	6b1302df 	cmp	w22, w19
 21b2af0:	f940a2a1 	ldr	x1, [x21,#320]
 21b2af4:	54ffff01 	b.ne	21b2ad4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a9bc>
 21b2af8:	f9409ea0 	ldr	x0, [x21,#312]
 21b2afc:	1e2e1001 	fmov	s1, #1.000000000000000000e+00
 21b2b00:	eb01001f 	cmp	x0, x1
 21b2b04:	540000a1 	b.ne	21b2b18 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2aa00>
 21b2b08:	1400001f 	b	21b2b84 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2aa6c>
 21b2b0c:	9100a000 	add	x0, x0, #0x28
 21b2b10:	eb00003f 	cmp	x1, x0
 21b2b14:	54000380 	b.eq	21b2b84 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2aa6c>
 21b2b18:	bd400400 	ldr	s0, [x0,#4]
 21b2b1c:	1e212000 	fcmp	s0, s1
 21b2b20:	54000160 	b.eq	21b2b4c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2aa34>
 21b2b24:	b9401002 	ldr	w2, [x0,#16]
 21b2b28:	b9000c02 	str	w2, [x0,#12]
 21b2b2c:	bd000401 	str	s1, [x0,#4]
 21b2b30:	7100005f 	cmp	w2, #0x0
 21b2b34:	5400032d 	b.le	21b2b98 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2aa80>
 21b2b38:	bd400002 	ldr	s2, [x0]
 21b2b3c:	1e220040 	scvtf	s0, w2
 21b2b40:	1e223822 	fsub	s2, s1, s2
 21b2b44:	1e201840 	fdiv	s0, s2, s0
 21b2b48:	bd000800 	str	s0, [x0,#8]
 21b2b4c:	fd401000 	ldr	d0, [x0,#32]
 21b2b50:	1e602100 	fcmp	d8, d0
 21b2b54:	54fffdc0 	b.eq	21b2b0c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a9f4>
 21b2b58:	fd400c00 	ldr	d0, [x0,#24]
 21b2b5c:	fd001008 	str	d8, [x0,#32]
 21b2b60:	1e602018 	fcmpe	d0, #0.0
 21b2b64:	54fffd4d 	b.le	21b2b0c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a9f4>
 21b2b68:	1e600900 	fmul	d0, d8, d0
 21b2b6c:	bd000001 	str	s1, [x0]
 21b2b70:	1e700002 	fcvtms	w2, d0
 21b2b74:	2901881f 	stp	wzr, w2, [x0,#12]
 21b2b78:	9100a000 	add	x0, x0, #0x28
 21b2b7c:	eb00003f 	cmp	x1, x0
 21b2b80:	54fffcc1 	b.ne	21b2b18 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2aa00>
 21b2b84:	a94153f3 	ldp	x19, x20, [sp,#16]
 21b2b88:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21b2b8c:	6d4327e8 	ldp	d8, d9, [sp,#48]
 21b2b90:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21b2b94:	d65f03c0 	ret
 21b2b98:	bd000001 	str	s1, [x0]
 21b2b9c:	17ffffec 	b	21b2b4c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2aa34>
 21b2ba0:	bd0112a9 	str	s9, [x21,#272]
 21b2ba4:	17ffffbc 	b	21b2a94 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a97c>
 21b2ba8:	fd400e61 	ldr	d1, [x19,#24]
 21b2bac:	f900127f 	str	xzr, [x19,#32]
 21b2bb0:	1e602038 	fcmpe	d1, #0.0
 21b2bb4:	54fff58d 	b.le	21b2a64 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a94c>
 21b2bb8:	2f00e402 	movi	d2, #0x0
 21b2bbc:	1e620821 	fmul	d1, d1, d2
 21b2bc0:	1e700020 	fcvtms	w0, d1
 21b2bc4:	b9001260 	str	w0, [x19,#16]
 21b2bc8:	bd0112a0 	str	s0, [x21,#272]
 21b2bcc:	b9000e7f 	str	wzr, [x19,#12]
