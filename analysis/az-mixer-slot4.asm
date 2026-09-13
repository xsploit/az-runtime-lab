
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021afae0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x279c8>:
 21afae0:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 21afae4:	910003fd 	mov	x29, sp
 21afae8:	a90153f3 	stp	x19, x20, [sp,#16]
 21afaec:	93407c34 	sxtw	x20, w1
 21afaf0:	aa0003f3 	mov	x19, x0
 21afaf4:	a9538801 	ldp	x1, x2, [x0,#312]
 21afaf8:	eb02003f 	cmp	x1, x2
 21afafc:	54000200 	b.eq	21afb3c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x27a24>
 21afb00:	1e602018 	fcmpe	d0, #0.0
 21afb04:	aa0103e0 	mov	x0, x1
 21afb08:	540003ad 	b.le	21afb7c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x27a64>
 21afb0c:	d503201f 	nop
 21afb10:	fd401001 	ldr	d1, [x0,#32]
 21afb14:	9100a000 	add	x0, x0, #0x28
 21afb18:	b85dc001 	ldur	w1, [x0,#-36]
 21afb1c:	b81d8001 	stur	w1, [x0,#-40]
 21afb20:	1e610801 	fmul	d1, d0, d1
 21afb24:	b81e401f 	stur	wzr, [x0,#-28]
 21afb28:	fc1f0000 	stur	d0, [x0,#-16]
 21afb2c:	1e700021 	fcvtms	w1, d1
 21afb30:	b81e8001 	stur	w1, [x0,#-24]
 21afb34:	eb00005f 	cmp	x2, x0
 21afb38:	54fffec1 	b.ne	21afb10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x279f8>
 21afb3c:	f940aa60 	ldr	x0, [x19,#336]
 21afb40:	9789d3ec 	bl	424af0 <free@plt>
 21afb44:	d2800260 	mov	x0, #0x13                  	// #19
 21afb48:	8b34cc00 	add	x0, x0, w20, sxtw #3
 21afb4c:	9789d521 	bl	424fd0 <malloc@plt>
 21afb50:	91004c01 	add	x1, x0, #0x13
 21afb54:	52800042 	mov	w2, #0x2                   	// #2
 21afb58:	927ef421 	and	x1, x1, #0xfffffffffffffffc
 21afb5c:	a9150260 	stp	x0, x0, [x19,#336]
 21afb60:	8b140823 	add	x3, x1, x20, lsl #2
 21afb64:	a9000c01 	stp	x1, x3, [x0]
 21afb68:	b9016262 	str	w2, [x19,#352]
 21afb6c:	a916d27f 	stp	xzr, x20, [x19,#360]
 21afb70:	a94153f3 	ldp	x19, x20, [sp,#16]
 21afb74:	a8c27bfd 	ldp	x29, x30, [sp],#32
 21afb78:	d65f03c0 	ret
 21afb7c:	9100a000 	add	x0, x0, #0x28
 21afb80:	fc1f0000 	stur	d0, [x0,#-16]
 21afb84:	eb00005f 	cmp	x2, x0
 21afb88:	54fffda0 	b.eq	21afb3c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x27a24>
 21afb8c:	9100a000 	add	x0, x0, #0x28
 21afb90:	fc1f0000 	stur	d0, [x0,#-16]
 21afb94:	eb00005f 	cmp	x2, x0
 21afb98:	54ffff21 	b.ne	21afb7c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x27a64>
 21afb9c:	17ffffe8 	b	21afb3c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x27a24>
