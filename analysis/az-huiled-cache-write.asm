
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f0020 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67f08>:
 21f0020:	3940c004 	ldrb	w4, [x0,#48]
 21f0024:	12001c21 	and	w1, w1, #0xff
 21f0028:	b9400045 	ldr	w5, [x2]
 21f002c:	6b01009f 	cmp	w4, w1
 21f0030:	29469006 	ldp	w6, w4, [x0,#52]
 21f0034:	540003a0 	b.eq	21f00a8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67f90>
 21f0038:	3900c001 	strb	w1, [x0,#48]
 21f003c:	6b0400bf 	cmp	w5, w4
 21f0040:	540002e0 	b.eq	21f009c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67f84>
 21f0044:	b9400041 	ldr	w1, [x2]
 21f0048:	6b06007f 	cmp	w3, w6
 21f004c:	b9003801 	str	w1, [x0,#56]
 21f0050:	54000040 	b.eq	21f0058 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67f40>
 21f0054:	b9003403 	str	w3, [x0,#52]
 21f0058:	f9400c01 	ldr	x1, [x0,#24]
 21f005c:	b4000301 	cbz	x1, 21f00bc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67fa4>
 21f0060:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 21f0064:	910003fd 	mov	x29, sp
 21f0068:	f9400023 	ldr	x3, [x1]
 21f006c:	f9400863 	ldr	x3, [x3,#16]
 21f0070:	f9000bf3 	str	x19, [sp,#16]
 21f0074:	aa0003f3 	mov	x19, x0
 21f0078:	aa0103e0 	mov	x0, x1
 21f007c:	9100e262 	add	x2, x19, #0x38
 21f0080:	3940c261 	ldrb	w1, [x19,#48]
 21f0084:	d63f0060 	blr	x3
 21f0088:	b9003e60 	str	w0, [x19,#60]
 21f008c:	52800020 	mov	w0, #0x1                   	// #1
 21f0090:	f9400bf3 	ldr	x19, [sp,#16]
 21f0094:	a8c27bfd 	ldp	x29, x30, [sp],#32
 21f0098:	d65f03c0 	ret
 21f009c:	6b06007f 	cmp	w3, w6
 21f00a0:	54fffda1 	b.ne	21f0054 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67f3c>
 21f00a4:	17ffffed 	b	21f0058 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67f40>
 21f00a8:	6b0400bf 	cmp	w5, w4
 21f00ac:	54fffcc1 	b.ne	21f0044 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67f2c>
 21f00b0:	6b06007f 	cmp	w3, w6
 21f00b4:	54fffd01 	b.ne	21f0054 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67f3c>
 21f00b8:	14000003 	b	21f00c4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67fac>
 21f00bc:	b9403801 	ldr	w1, [x0,#56]
 21f00c0:	b9003c01 	str	w1, [x0,#60]
 21f00c4:	52800020 	mov	w0, #0x1                   	// #1
 21f00c8:	d65f03c0 	ret
 21f00cc:	d503201f 	nop
