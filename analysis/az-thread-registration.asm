
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000001865b08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x65c80>:
 1865b08:	d28c0610 	mov	x16, #0x6030                	// #24624
 1865b0c:	cb3063ff 	sub	sp, sp, x16
 1865b10:	b0008821 	adrp	x1, 296a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3a71a8>
 1865b14:	910363e0 	add	x0, sp, #0xd8
 1865b18:	911a2021 	add	x1, x1, #0x688
 1865b1c:	d28beb02 	mov	x2, #0x5f58                	// #24408
 1865b20:	a9007bfd 	stp	x29, x30, [sp]
 1865b24:	910003fd 	mov	x29, sp
 1865b28:	a90153f3 	stp	x19, x20, [sp,#16]
 1865b2c:	910383f4 	add	x20, sp, #0xe0
 1865b30:	a9025bf5 	stp	x21, x22, [sp,#32]
 1865b34:	a90363f7 	stp	x23, x24, [sp,#48]
 1865b38:	a9046bf9 	stp	x25, x26, [sp,#64]
 1865b3c:	a90573fb 	stp	x27, x28, [sp,#80]
 1865b40:	97aefb90 	bl	424980 <memcpy@plt>
 1865b44:	b0008820 	adrp	x0, 296a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3a71a8>
 1865b48:	91060000 	add	x0, x0, #0x180
 1865b4c:	91118000 	add	x0, x0, #0x460
 1865b50:	f90043e0 	str	x0, [sp,#128]
 1865b54:	d503201f 	nop
 1865b58:	b9400a9c 	ldr	w28, [x20,#8]
 1865b5c:	d1002280 	sub	x0, x20, #0x8
 1865b60:	7100039f 	cmp	w28, #0x0
 1865b64:	540039ad 	b.le	1866298 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x66410>
 1865b68:	f85f829b 	ldur	x27, [x20,#-8]
 1865b6c:	39403280 	ldrb	w0, [x20,#12]
 1865b70:	d378df61 	lsl	x1, x27, #8
 1865b74:	f9003fe1 	str	x1, [sp,#120]
 1865b78:	34001a40 	cbz	w0, 1865ec0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x66038>
 1865b7c:	900116f5 	adrp	x21, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 1865b80:	900116f3 	adrp	x19, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 1865b84:	9123e2b5 	add	x21, x21, #0x8f8
 1865b88:	91240273 	add	x19, x19, #0x900
 1865b8c:	b0011600 	adrp	x0, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
 1865b90:	5280001a 	mov	w26, #0x0                   	// #0
 1865b94:	9135a000 	add	x0, x0, #0xd68
 1865b98:	f9004be0 	str	x0, [sp,#144]
 1865b9c:	d503201f 	nop
 1865ba0:	f9403fe0 	ldr	x0, [sp,#120]
 1865ba4:	92401f57 	and	x23, x26, #0xff
 1865ba8:	aa0002f7 	orr	x23, x23, x0
 1865bac:	08dffea0 	ldarb	w0, [x21]
 1865bb0:	36003480 	tbz	w0, #0, 1866240 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x663b8>
 1865bb4:	b9801a60 	ldrsw	x0, [x19,#24]
 1865bb8:	f9400661 	ldr	x1, [x19,#8]
 1865bbc:	9ac00af9 	udiv	x25, x23, x0
 1865bc0:	9b00df39 	msub	x25, x25, x0, x23
 1865bc4:	93407f22 	sxtw	x2, w25
 1865bc8:	f862783b 	ldr	x27, [x1,x2,lsl #3]
 1865bcc:	b400025b 	cbz	x27, 1865c14 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x65d8c>
 1865bd0:	f9400360 	ldr	x0, [x27]
 1865bd4:	eb0002ff 	cmp	x23, x0
 1865bd8:	54001240 	b.eq	1865e20 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x65f98>
 1865bdc:	aa1b03e0 	mov	x0, x27
 1865be0:	14000004 	b	1865bf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x65d68>
 1865be4:	f9400003 	ldr	x3, [x0]
 1865be8:	eb0302ff 	cmp	x23, x3
 1865bec:	540011a0 	b.eq	1865e20 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x65f98>
 1865bf0:	f9400800 	ldr	x0, [x0,#16]
 1865bf4:	b5ffff80 	cbnz	x0, 1865be4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x65d5c>
 1865bf8:	aa1b03f6 	mov	x22, x27
 1865bfc:	14000004 	b	1865c0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x65d84>
 1865c00:	f94002c0 	ldr	x0, [x22]
 1865c04:	eb0002ff 	cmp	x23, x0
 1865c08:	540002e0 	b.eq	1865c64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x65ddc>
 1865c0c:	f9400ad6 	ldr	x22, [x22,#16]
 1865c10:	b5ffff96 	cbnz	x22, 1865c00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x65d78>
 1865c14:	d2800300 	mov	x0, #0x18                  	// #24
 1865c18:	f9003be2 	str	x2, [sp,#112]
 1865c1c:	97aefc49 	bl	424d40 <_Znwm@plt>
 1865c20:	b9401a78 	ldr	w24, [x19,#24]
 1865c24:	a9007c17 	stp	x23, xzr, [x0]
 1865c28:	aa0003f6 	mov	x22, x0
 1865c2c:	6b19031f 	cmp	w24, w25
 1865c30:	f900081b 	str	x27, [x0,#16]
 1865c34:	f9403be2 	ldr	x2, [sp,#112]
 1865c38:	54000c29 	b.ls	1865dbc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x65f34>
 1865c3c:	f9400660 	ldr	x0, [x19,#8]
 1865c40:	f8227816 	str	x22, [x0,x2,lsl #3]
 1865c44:	531f7b17 	lsl	w23, w24, #1
 1865c48:	b9402260 	ldr	w0, [x19,#32]
 1865c4c:	0b1802e5 	add	w5, w23, w24
 1865c50:	11000400 	add	w0, w0, #0x1
 1865c54:	b9002260 	str	w0, [x19,#32]
 1865c58:	0b457ca1 	add	w1, w5, w5, lsr #31
 1865c5c:	6b81041f 	cmp	w0, w1, asr #1
 1865c60:	540002ac 	b.gt	1865cb4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x65e2c>
 1865c64:	910022d6 	add	x22, x22, #0x8
 1865c68:	f9400280 	ldr	x0, [x20]
 1865c6c:	f90002c0 	str	x0, [x22]
 1865c70:	1100075a 	add	w26, w26, #0x1
 1865c74:	6b1a039f 	cmp	w28, w26
 1865c78:	54fff941 	b.ne	1865ba0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x65d18>
 1865c7c:	91006294 	add	x20, x20, #0x18
