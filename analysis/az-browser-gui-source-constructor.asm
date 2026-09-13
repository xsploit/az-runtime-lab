
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002057bb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x857d30>:
 2057bb8:	a9b47bfd 	stp	x29, x30, [sp,#-192]!
 2057bbc:	910003fd 	mov	x29, sp
 2057bc0:	a90153f3 	stp	x19, x20, [sp,#16]
 2057bc4:	aa0003f3 	mov	x19, x0
 2057bc8:	91004014 	add	x20, x0, #0x10
 2057bcc:	d2800100 	mov	x0, #0x8                   	// #8
 2057bd0:	a9025bf5 	stp	x21, x22, [sp,#32]
 2057bd4:	f0006d95 	adrp	x21, 2e0a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8471a8>
 2057bd8:	a90363f7 	stp	x23, x24, [sp,#48]
 2057bdc:	aa0303f7 	mov	x23, x3
 2057be0:	911042b5 	add	x21, x21, #0x410
 2057be4:	a90573fb 	stp	x27, x28, [sp,#80]
 2057be8:	aa0103fb 	mov	x27, x1
 2057bec:	aa0403fc 	mov	x28, x4
 2057bf0:	f90037e2 	str	x2, [sp,#104]
 2057bf4:	b9009bff 	str	wzr, [sp,#152]
 2057bf8:	978f3452 	bl	424d40 <_Znwm@plt>
 2057bfc:	aa0003f6 	mov	x22, x0
 2057c00:	a9007e75 	stp	x21, xzr, [x19]
 2057c04:	d2800100 	mov	x0, #0x8                   	// #8
 2057c08:	f94037e2 	ldr	x2, [sp,#104]
 2057c0c:	f9000a7f 	str	xzr, [x19,#16]
 2057c10:	f90002c2 	str	x2, [x22]
 2057c14:	a900fe9f 	stp	xzr, xzr, [x20,#8]
 2057c18:	978f344a 	bl	424d40 <_Znwm@plt>
 2057c1c:	f9000a60 	str	x0, [x19,#16]
 2057c20:	91002002 	add	x2, x0, #0x8
 2057c24:	f94002c1 	ldr	x1, [x22]
 2057c28:	a9008a82 	stp	x2, x2, [x20,#8]
 2057c2c:	f9000001 	str	x1, [x0]
 2057c30:	f9000661 	str	x1, [x19,#8]
 2057c34:	b4002161 	cbz	x1, 2058060 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8581d8>
 2057c38:	aa1603e0 	mov	x0, x22
 2057c3c:	a9046bf9 	stp	x25, x26, [sp,#64]
 2057c40:	978f3484 	bl	424e50 <_ZdlPv@plt>
 2057c44:	a9416678 	ldp	x24, x25, [x19,#16]
 2057c48:	eb19031f 	cmp	x24, x25
 2057c4c:	54000660 	b.eq	2057d18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x857e90>
 2057c50:	90006db6 	adrp	x22, 2e0b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8481a8>
 2057c54:	913b02d6 	add	x22, x22, #0xec0
 2057c58:	912d22d6 	add	x22, x22, #0xb48
 2057c5c:	1400000b 	b	2057c88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x857e00>
 2057c60:	91002281 	add	x1, x20, #0x8
 2057c64:	885ffc20 	ldaxr	w0, [x1]
 2057c68:	51000402 	sub	w2, w0, #0x1
 2057c6c:	8803fc22 	stlxr	w3, w2, [x1]
 2057c70:	35ffffa3 	cbnz	w3, 2057c64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x857ddc>
 2057c74:	7100041f 	cmp	w0, #0x1
 2057c78:	540002a0 	b.eq	2057ccc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x857e44>
 2057c7c:	91002318 	add	x24, x24, #0x8
 2057c80:	eb18033f 	cmp	x25, x24
 2057c84:	540004a0 	b.eq	2057d18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x857e90>
 2057c88:	f9400300 	ldr	x0, [x24]
 2057c8c:	b4ffff80 	cbz	x0, 2057c7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x857df4>
 2057c90:	9102a3e3 	add	x3, sp, #0xa8
 2057c94:	aa1603e2 	mov	x2, x22
 2057c98:	910263e1 	add	x1, sp, #0x98
 2057c9c:	a90affff 	stp	xzr, xzr, [sp,#168]
 2057ca0:	940089ba 	bl	207a388 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87a500>
 2057ca4:	f9405bf4 	ldr	x20, [sp,#176]
 2057ca8:	b4fffeb4 	cbz	x20, 2057c7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x857df4>
 2057cac:	b0006da0 	adrp	x0, 2e0c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8491a8>
 2057cb0:	f946141a 	ldr	x26, [x0,#3112]
 2057cb4:	b5fffd7a 	cbnz	x26, 2057c60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x857dd8>
 2057cb8:	b9400a80 	ldr	w0, [x20,#8]
 2057cbc:	51000401 	sub	w1, w0, #0x1
 2057cc0:	b9000a81 	str	w1, [x20,#8]
 2057cc4:	7100041f 	cmp	w0, #0x1
 2057cc8:	54fffda1 	b.ne	2057c7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x857df4>
 2057ccc:	f9400281 	ldr	x1, [x20]
 2057cd0:	aa1403e0 	mov	x0, x20
 2057cd4:	f9400821 	ldr	x1, [x1,#16]
 2057cd8:	d63f0020 	blr	x1
 2057cdc:	b4001cba 	cbz	x26, 2058070 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8581e8>
 2057ce0:	91003281 	add	x1, x20, #0xc
 2057ce4:	885ffc20 	ldaxr	w0, [x1]
 2057ce8:	51000402 	sub	w2, w0, #0x1
 2057cec:	8803fc22 	stlxr	w3, w2, [x1]
 2057cf0:	35ffffa3 	cbnz	w3, 2057ce4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x857e5c>
 2057cf4:	7100041f 	cmp	w0, #0x1
 2057cf8:	54fffc21 	b.ne	2057c7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x857df4>
 2057cfc:	f9400281 	ldr	x1, [x20]
