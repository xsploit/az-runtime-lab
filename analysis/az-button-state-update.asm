
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
 2147c70:	aa0003e2 	mov	x2, x0
 2147c74:	f9403a60 	ldr	x0, [x19,#112]
 2147c78:	510006a1 	sub	w1, w21, #0x1
 2147c7c:	eb03001f 	cmp	x0, x3
 2147c80:	91004003 	add	x3, x0, #0x10
 2147c84:	fa433042 	ccmp	x2, x3, #0x2, cc
 2147c88:	7a442820 	ccmp	w1, #0x4, #0x0, cs
 2147c8c:	54001009 	b.ls	2147e8c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x948004>
 2147c90:	53017ea3 	lsr	w3, w21, #1
 2147c94:	d2800001 	mov	x1, #0x0                   	// #0
 2147c98:	d37cec63 	lsl	x3, x3, #4
 2147c9c:	d503201f 	nop
 2147ca0:	3ce16800 	ldr	q0, [x0,x1]
 2147ca4:	3ca16840 	str	q0, [x2,x1]
 2147ca8:	91004021 	add	x1, x1, #0x10
 2147cac:	eb03003f 	cmp	x1, x3
 2147cb0:	54ffff81 	b.ne	2147ca0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947e18>
 2147cb4:	121f7aa1 	and	w1, w21, #0xfffffffe
 2147cb8:	36000075 	tbz	w21, #0, 2147cc4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947e3c>
 2147cbc:	f8617800 	ldr	x0, [x0,x1,lsl #3]
 2147cc0:	f8217840 	str	x0, [x2,x1,lsl #3]
 2147cc4:	2a1503e1 	mov	w1, w21
 2147cc8:	f9404660 	ldr	x0, [x19,#136]
 2147ccc:	b9009261 	str	w1, [x19,#144]
 2147cd0:	91022261 	add	x1, x19, #0x88
 2147cd4:	f9004662 	str	x2, [x19,#136]
 2147cd8:	b9009a75 	str	w21, [x19,#152]
 2147cdc:	f90033e1 	str	x1, [sp,#96]
 2147ce0:	978b7384 	bl	424af0 <free@plt>
 2147ce4:	aa1403e0 	mov	x0, x20
 2147ce8:	9407910a 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 2147cec:	aa1303e0 	mov	x0, x19
 2147cf0:	f84a0c1b 	ldr	x27, [x0,#160]!
 2147cf4:	aa1b03f6 	mov	x22, x27
 2147cf8:	b9801000 	ldrsw	x0, [x0,#16]
 2147cfc:	8b00037b 	add	x27, x27, x0
 2147d00:	eb1b02df 	cmp	x22, x27
 2147d04:	540005a0 	b.eq	2147db8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947f30>
 2147d08:	a9046bf9 	stp	x25, x26, [sp,#64]
 2147d0c:	d000cffa 	adrp	x26, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 2147d10:	9118e35a 	add	x26, x26, #0x638
 2147d14:	a90363f7 	stp	x23, x24, [sp,#48]
 2147d18:	b00023d8 	adrp	x24, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 2147d1c:	f94033e1 	ldr	x1, [sp,#96]
 2147d20:	d000cff7 	adrp	x23, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 2147d24:	f9404660 	ldr	x0, [x19,#136]
 2147d28:	912a7318 	add	x24, x24, #0xa9c
 2147d2c:	b9801035 	ldrsw	x21, [x1,#16]
 2147d30:	911902f7 	add	x23, x23, #0x640
 2147d34:	394002c1 	ldrb	w1, [x22]
 2147d38:	aa0003f4 	mov	x20, x0
 2147d3c:	3901ffe1 	strb	w1, [sp,#127]
