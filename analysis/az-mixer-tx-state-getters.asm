
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002130940 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930ab8>:
 2130940:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 2130944:	910003fd 	mov	x29, sp
 2130948:	f90013f5 	str	x21, [sp,#32]
 213094c:	9101a015 	add	x21, x0, #0x68
 2130950:	a90153f3 	stp	x19, x20, [sp,#16]
 2130954:	aa0003f4 	mov	x20, x0
 2130958:	aa0803f3 	mov	x19, x8
 213095c:	aa1503e0 	mov	x0, x21
 2130960:	9407ede4 	bl	232c0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fd8>
 2130964:	72001c1f 	tst	w0, #0xff
 2130968:	540000e1 	b.ne	2130984 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930afc>
 213096c:	3900027f 	strb	wzr, [x19]
 2130970:	aa1303e0 	mov	x0, x19
 2130974:	a94153f3 	ldp	x19, x20, [sp,#16]
 2130978:	f94013f5 	ldr	x21, [sp,#32]
 213097c:	a8c37bfd 	ldp	x29, x30, [sp],#48
 2130980:	d65f03c0 	ret
 2130984:	39414280 	ldrb	w0, [x20,#80]
 2130988:	35000120 	cbnz	w0, 21309ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930b24>
 213098c:	3900027f 	strb	wzr, [x19]
 2130990:	aa1503e0 	mov	x0, x21
 2130994:	9407eddf 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 2130998:	aa1303e0 	mov	x0, x19
 213099c:	a94153f3 	ldp	x19, x20, [sp,#16]
 21309a0:	f94013f5 	ldr	x21, [sp,#32]
 21309a4:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21309a8:	d65f03c0 	ret
 21309ac:	b9405a81 	ldr	w1, [x20,#88]
 21309b0:	52800022 	mov	w2, #0x1                   	// #1
 21309b4:	3901429f 	strb	wzr, [x20,#80]
 21309b8:	f9403280 	ldr	x0, [x20,#96]
 21309bc:	39000262 	strb	w2, [x19]
 21309c0:	b9000a61 	str	w1, [x19,#8]
 21309c4:	f9000a60 	str	x0, [x19,#16]
 21309c8:	17fffff2 	b	2130990 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930b08>
 21309cc:	d503201f 	nop
 21309d0:	a9ba7bfd 	stp	x29, x30, [sp,#-96]!
 21309d4:	910003fd 	mov	x29, sp
 21309d8:	f90013f5 	str	x21, [sp,#32]
 21309dc:	91008015 	add	x21, x0, #0x20
 21309e0:	a90153f3 	stp	x19, x20, [sp,#16]
 21309e4:	aa0003f3 	mov	x19, x0
 21309e8:	aa0803f4 	mov	x20, x8
 21309ec:	aa1503e0 	mov	x0, x21
 21309f0:	9407edc0 	bl	232c0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fd8>
 21309f4:	72001c1f 	tst	w0, #0xff
 21309f8:	54000141 	b.ne	2130a20 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930b98>
 21309fc:	9100c3e1 	add	x1, sp, #0x30
 2130a00:	aa1403e0 	mov	x0, x20
 2130a04:	3900c3ff 	strb	wzr, [sp,#48]
 2130a08:	94000f66 	bl	21347a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x934918>
 2130a0c:	aa1403e0 	mov	x0, x20
 2130a10:	a94153f3 	ldp	x19, x20, [sp,#16]
 2130a14:	f94013f5 	ldr	x21, [sp,#32]
 2130a18:	a8c67bfd 	ldp	x29, x30, [sp],#96
 2130a1c:	d65f03c0 	ret
 2130a20:	910123e0 	add	x0, sp, #0x48
 2130a24:	91003261 	add	x1, x19, #0xc
 2130a28:	3900c3ff 	strb	wzr, [sp,#48]
 2130a2c:	94000f5d 	bl	21347a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x934918>
 2130a30:	39403260 	ldrb	w0, [x19,#12]
 2130a34:	350003a0 	cbnz	w0, 2130aa8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930c20>
 2130a38:	3940c3e0 	ldrb	w0, [sp,#48]
 2130a3c:	34000460 	cbz	w0, 2130ac8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930c40>
 2130a40:	b94037e2 	ldr	w2, [sp,#52]
 2130a44:	52800021 	mov	w1, #0x1                   	// #1
 2130a48:	3940e3e4 	ldrb	w4, [sp,#56]
 2130a4c:	b9001262 	str	w2, [x19,#16]
 2130a50:	394103e2 	ldrb	w2, [sp,#64]
 2130a54:	b9403fe3 	ldr	w3, [sp,#60]
 2130a58:	39003261 	strb	w1, [x19,#12]
 2130a5c:	39005264 	strb	w4, [x19,#20]
 2130a60:	b9001a63 	str	w3, [x19,#24]
 2130a64:	39007262 	strb	w2, [x19,#28]
 2130a68:	394123e0 	ldrb	w0, [sp,#72]
 2130a6c:	34000480 	cbz	w0, 2130afc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930c74>
