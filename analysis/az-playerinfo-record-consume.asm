
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002130aa8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930c20>:
 2130aa8:	3940c3e0 	ldrb	w0, [sp,#48]
 2130aac:	340000c0 	cbz	w0, 2130ac4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930c3c>
 2130ab0:	f84343e0 	ldur	x0, [sp,#52]
 2130ab4:	f9000a60 	str	x0, [x19,#16]
 2130ab8:	f84393e0 	ldur	x0, [sp,#57]
 2130abc:	f8015260 	stur	x0, [x19,#21]
 2130ac0:	17ffffea 	b	2130a68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930be0>
 2130ac4:	3900327f 	strb	wzr, [x19,#12]
 2130ac8:	394123e0 	ldrb	w0, [sp,#72]
 2130acc:	34fffda0 	cbz	w0, 2130a80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930bf8>
 2130ad0:	394143e2 	ldrb	w2, [sp,#80]
 2130ad4:	52800024 	mov	w4, #0x1                   	// #1
 2130ad8:	394163e1 	ldrb	w1, [sp,#88]
 2130adc:	b9404fe3 	ldr	w3, [sp,#76]
 2130ae0:	b94057e0 	ldr	w0, [sp,#84]
 2130ae4:	3900c3e4 	strb	w4, [sp,#48]
 2130ae8:	b90037e3 	str	w3, [sp,#52]
 2130aec:	3900e3e2 	strb	w2, [sp,#56]
 2130af0:	b9003fe0 	str	w0, [sp,#60]
 2130af4:	390103e1 	strb	w1, [sp,#64]
 2130af8:	17ffffe2 	b	2130a80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930bf8>
 2130afc:	3900c3ff 	strb	wzr, [sp,#48]
 2130b00:	17ffffe0 	b	2130a80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930bf8>
 2130b04:	d503201f 	nop
 2130b08:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 2130b0c:	910003fd 	mov	x29, sp
 2130b10:	a90153f3 	stp	x19, x20, [sp,#16]
 2130b14:	9117c014 	add	x20, x0, #0x5f0
 2130b18:	91170013 	add	x19, x0, #0x5c0
 2130b1c:	aa1303e0 	mov	x0, x19
 2130b20:	a9025bf5 	stp	x21, x22, [sp,#32]
 2130b24:	aa0103f6 	mov	x22, x1
 2130b28:	9407ed6e 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 2130b2c:	a9408295 	ldp	x21, x0, [x20,#8]
 2130b30:	eb0002bf 	cmp	x21, x0
 2130b34:	54000240 	b.eq	2130b7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930cf4>
 2130b38:	910022a2 	add	x2, x21, #0x8
 2130b3c:	9100e3e1 	add	x1, sp, #0x38
 2130b40:	aa1603e0 	mov	x0, x22
 2130b44:	f9001fe2 	str	x2, [sp,#56]
 2130b48:	94000f6c 	bl	21348f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x934a70>
 2130b4c:	b94002c0 	ldr	w0, [x22]
 2130b50:	f9400681 	ldr	x1, [x20,#8]
 2130b54:	4a807c00 	eor	w0, w0, w0, asr #31
 2130b58:	b90002a0 	str	w0, [x21]
 2130b5c:	91006020 	add	x0, x1, #0x18
 2130b60:	f9000680 	str	x0, [x20,#8]
 2130b64:	aa1303e0 	mov	x0, x19
 2130b68:	9407ed6a 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 2130b6c:	a94153f3 	ldp	x19, x20, [sp,#16]
 2130b70:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2130b74:	a8c47bfd 	ldp	x29, x30, [sp],#64
 2130b78:	d65f03c0 	ret
 2130b7c:	aa1603e2 	mov	x2, x22
 2130b80:	aa1503e1 	mov	x1, x21
 2130b84:	aa1403e0 	mov	x0, x20
 2130b88:	94000fc8 	bl	2134aa8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x934c20>
 2130b8c:	aa1303e0 	mov	x0, x19
