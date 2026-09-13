
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021371f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937368>:
 21371f0:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
 21371f4:	910003fd 	mov	x29, sp
 21371f8:	a90153f3 	stp	x19, x20, [sp,#16]
 21371fc:	aa0003f3 	mov	x19, x0
 2137200:	39c00020 	ldrsb	w0, [x1]
 2137204:	aa0103f4 	mov	x20, x1
 2137208:	37f80d60 	tbnz	w0, #31, 21373b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93752c>
 213720c:	39400680 	ldrb	w0, [x20,#1]
 2137210:	7940f661 	ldrh	w1, [x19,#122]
 2137214:	d3441000 	ubfx	x0, x0, #4, #1
 2137218:	3901e660 	strb	w0, [x19,#121]
 213721c:	79400680 	ldrh	w0, [x20,#2]
 2137220:	6b00003f 	cmp	w1, w0
 2137224:	54000b60 	b.eq	2137390 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x937508>
 2137228:	a9025bf5 	stp	x21, x22, [sp,#32]
 213722c:	d0005a41 	adrp	x1, 2c81000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x6be1a8>
 2137230:	b9401262 	ldr	w2, [x19,#16]
 2137234:	7900f660 	strh	w0, [x19,#122]
 2137238:	91352020 	add	x0, x1, #0xd48
 213723c:	7100005f 	cmp	w2, #0x0
 2137240:	b0006861 	adrp	x1, 2e44000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8811a8>
 2137244:	911a6021 	add	x1, x1, #0x698
 2137248:	79400695 	ldrh	w21, [x20,#2]
 213724c:	9a801021 	csel	x1, x1, x0, ne
 2137250:	910143e0 	add	x0, sp, #0x50
 2137254:	9407f2a3 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2137258:	b0006861 	adrp	x1, 2e44000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8811a8>
 213725c:	910163e0 	add	x0, sp, #0x58
 2137260:	911a8021 	add	x1, x1, #0x6a0
 2137264:	9407f29f 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2137268:	b0003921 	adrp	x1, 285c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2991a8>
 213726c:	910183e8 	add	x8, sp, #0x60
 2137270:	911e8021 	add	x1, x1, #0x7a0
 2137274:	910163e0 	add	x0, sp, #0x58
 2137278:	9407725e 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 213727c:	a90363f7 	stp	x23, x24, [sp,#48]
 2137280:	9101c3f8 	add	x24, sp, #0x70
 2137284:	f0002601 	adrp	x1, 25fa000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x371a8>
 2137288:	aa1803e0 	mov	x0, x24
 213728c:	91280021 	add	x1, x1, #0xa00
 2137290:	9407f294 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2137294:	910203f7 	add	x23, sp, #0x80
 2137298:	2a1503e1 	mov	w1, w21
 213729c:	aa1703e0 	mov	x0, x23
 21372a0:	9407661c 	bl	2310b10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1889f8>
 21372a4:	910223f5 	add	x21, sp, #0x88
 21372a8:	f0004421 	adrp	x1, 29be000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3fb1a8>
 21372ac:	aa1503e8 	mov	x8, x21
 21372b0:	911b4021 	add	x1, x1, #0x6d0
 21372b4:	aa1703e0 	mov	x0, x23
 21372b8:	9407724e 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 21372bc:	9101e3f6 	add	x22, sp, #0x78
 21372c0:	910143e1 	add	x1, sp, #0x50
 21372c4:	aa1603e0 	mov	x0, x22
 21372c8:	f90023f9 	str	x25, [sp,#64]
 21372cc:	94076099 	bl	230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187418>
 21372d0:	9101a3f9 	add	x25, sp, #0x68
 21372d4:	aa1603e1 	mov	x1, x22
 21372d8:	aa1903e8 	mov	x8, x25
 21372dc:	aa1503e0 	mov	x0, x21
 21372e0:	940771ec 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 21372e4:	aa1603e0 	mov	x0, x22
 21372e8:	940714c6 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21372ec:	aa1503e0 	mov	x0, x21
 21372f0:	940714c4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21372f4:	aa1703e0 	mov	x0, x23
 21372f8:	940714c2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21372fc:	aa1503e8 	mov	x8, x21
 2137300:	aa1903e1 	mov	x1, x25
 2137304:	aa1803e0 	mov	x0, x24
 2137308:	940771e2 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 213730c:	b0003c41 	adrp	x1, 28c0000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2fd1a8>
 2137310:	aa1603e8 	mov	x8, x22
 2137314:	912a6021 	add	x1, x1, #0xa98
 2137318:	aa1503e0 	mov	x0, x21
 213731c:	94077235 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2137320:	aa1503e0 	mov	x0, x21
 2137324:	940714b7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2137328:	aa1903e0 	mov	x0, x25
 213732c:	940714b5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2137330:	aa1803e0 	mov	x0, x24
 2137334:	940714b3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2137338:	aa1703e8 	mov	x8, x23
 213733c:	aa1603e1 	mov	x1, x22
 2137340:	910183e0 	add	x0, sp, #0x60
 2137344:	940771d3 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 2137348:	aa1703e1 	mov	x1, x23
 213734c:	aa1503e0 	mov	x0, x21
