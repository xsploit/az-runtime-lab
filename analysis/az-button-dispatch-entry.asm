
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002147bf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947d68>:
 2147bf0:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
 2147bf4:	910003fd 	mov	x29, sp
 2147bf8:	f9405c03 	ldr	x3, [x0,#184]
 2147bfc:	b4000ea3 	cbz	x3, 2147dd0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947f48>
 2147c00:	a90153f3 	stp	x19, x20, [sp,#16]
 2147c04:	aa0103e2 	mov	x2, x1
 2147c08:	aa0303e1 	mov	x1, x3
 2147c0c:	f9400004 	ldr	x4, [x0]
 2147c10:	aa0003f3 	mov	x19, x0
 2147c14:	f9401083 	ldr	x3, [x4,#32]
 2147c18:	d63f0060 	blr	x3
 2147c1c:	b940b260 	ldr	w0, [x19,#176]
 2147c20:	7100001f 	cmp	w0, #0x0
 2147c24:	5400008c 	b.gt	2147c34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947dac>
 2147c28:	a94153f3 	ldp	x19, x20, [sp,#16]
 2147c2c:	a8c87bfd 	ldp	x29, x30, [sp],#128
 2147c30:	d65f03c0 	ret
 2147c34:	91010274 	add	x20, x19, #0x40
 2147c38:	aa1403e0 	mov	x0, x20
 2147c3c:	9407912d 	bl	232c0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fd8>
 2147c40:	72001c1f 	tst	w0, #0xff
 2147c44:	54ffff20 	b.eq	2147c28 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947da0>
 2147c48:	a9025bf5 	stp	x21, x22, [sp,#32]
 2147c4c:	b9408275 	ldr	w21, [x19,#128]
 2147c50:	a90573fb 	stp	x27, x28, [sp,#80]
 2147c54:	710002bf 	cmp	w21, #0x0
 2147c58:	b9009a7f 	str	wzr, [x19,#152]
 2147c5c:	54001120 	b.eq	2147e80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947ff8>
 2147c60:	54000c0d 	b.le	2147de0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947f58>
 2147c64:	937d7ea0 	sbfiz	x0, x21, #3, #32
 2147c68:	978b74da 	bl	424fd0 <malloc@plt>
 2147c6c:	91004003 	add	x3, x0, #0x10
