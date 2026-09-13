
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f00d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67fb8>:
 21f00d0:	f9401403 	ldr	x3, [x0,#40]
 21f00d4:	90001e81 	adrp	x1, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 21f00d8:	912a7021 	add	x1, x1, #0xa9c
 21f00dc:	91002062 	add	x2, x3, #0x8
 21f00e0:	eb01005f 	cmp	x2, x1
 21f00e4:	540002c3 	b.cc	21f013c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68024>
 21f00e8:	f240045f 	tst	x2, #0x3
 21f00ec:	54000281 	b.ne	21f013c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68024>
 21f00f0:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
 21f00f4:	910003fd 	mov	x29, sp
 21f00f8:	a90153f3 	stp	x19, x20, [sp,#16]
 21f00fc:	aa0003f3 	mov	x19, x0
 21f0100:	b000cdf4 	adrp	x20, 3bad000 <stdout@@GLIBC_2.17+0x6bf40>
 21f0104:	9107a294 	add	x20, x20, #0x1e8
 21f0108:	a9025bf5 	stp	x21, x22, [sp,#32]
 21f010c:	b9400876 	ldr	w22, [x3,#8]
 21f0110:	08dffe80 	ldarb	w0, [x20]
 21f0114:	b000cdf5 	adrp	x21, 3bad000 <stdout@@GLIBC_2.17+0x6bf40>
 21f0118:	360004a0 	tbz	w0, #0, 21f01ac <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68094>
 21f011c:	b941f2a0 	ldr	w0, [x21,#496]
 21f0120:	6b0002df 	cmp	w22, w0
 21f0124:	54000100 	b.eq	21f0144 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6802c>
 21f0128:	52800020 	mov	w0, #0x1                   	// #1
 21f012c:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f0130:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21f0134:	a8c57bfd 	ldp	x29, x30, [sp],#80
 21f0138:	d65f03c0 	ret
 21f013c:	52800020 	mov	w0, #0x1                   	// #1
 21f0140:	d65f03c0 	ret
 21f0144:	f9401674 	ldr	x20, [x19,#40]
 21f0148:	f0000020 	adrp	x0, 21f7000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6eee8>
 21f014c:	91110000 	add	x0, x0, #0x440
 21f0150:	f9400261 	ldr	x1, [x19]
 21f0154:	f9400282 	ldr	x2, [x20]
 21f0158:	f9400821 	ldr	x1, [x1,#16]
 21f015c:	f9400855 	ldr	x21, [x2,#16]
 21f0160:	eb00003f 	cmp	x1, x0
 21f0164:	54000361 	b.ne	21f01d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x680b8>
 21f0168:	f9400a60 	ldr	x0, [x19,#16]
 21f016c:	f9001fe0 	str	x0, [sp,#56]
 21f0170:	aa1403e0 	mov	x0, x20
 21f0174:	9100e3e1 	add	x1, sp, #0x38
 21f0178:	d63f02a0 	blr	x21
 21f017c:	aa0003e4 	mov	x4, x0
 21f0180:	aa0103e5 	mov	x5, x1
 21f0184:	2a0103e3 	mov	w3, w1
 21f0188:	d360fc86 	lsr	x6, x4, #32
 21f018c:	aa1303e0 	mov	x0, x19
 21f0190:	2a0403e1 	mov	w1, w4
 21f0194:	910107e2 	add	x2, sp, #0x41
 21f0198:	29081be4 	stp	w4, w6, [sp,#64]
 21f019c:	b9004be5 	str	w5, [sp,#72]
 21f01a0:	97ffffa0 	bl	21f0020 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67f08>
 21f01a4:	12001c00 	and	w0, w0, #0xff
 21f01a8:	17ffffe1 	b	21f012c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68014>
 21f01ac:	aa1403e0 	mov	x0, x20
 21f01b0:	b000cdf5 	adrp	x21, 3bad000 <stdout@@GLIBC_2.17+0x6bf40>
 21f01b4:	9788d82b 	bl	426260 <__cxa_guard_acquire@plt>
 21f01b8:	34fffb20 	cbz	w0, 21f011c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68004>
 21f01bc:	979301d3 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 21f01c0:	b901f2a0 	str	w0, [x21,#496]
 21f01c4:	aa1403e0 	mov	x0, x20
 21f01c8:	9788d99e 	bl	426840 <__cxa_guard_release@plt>
 21f01cc:	17ffffd4 	b	21f011c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68004>
 21f01d0:	aa1303e0 	mov	x0, x19
 21f01d4:	d63f0020 	blr	x1
 21f01d8:	f9001fe0 	str	x0, [sp,#56]
 21f01dc:	17ffffe5 	b	21f0170 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68058>
 21f01e0:	f9400022 	ldr	x2, [x1]
 21f01e4:	b4000122 	cbz	x2, 21f0208 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x680f0>
 21f01e8:	f9400c03 	ldr	x3, [x0,#24]
 21f01ec:	f900003f 	str	xzr, [x1]
 21f01f0:	f9000c02 	str	x2, [x0,#24]
 21f01f4:	b40000a3 	cbz	x3, 21f0208 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x680f0>
 21f01f8:	f9400061 	ldr	x1, [x3]
 21f01fc:	aa0303e0 	mov	x0, x3
 21f0200:	f9400421 	ldr	x1, [x1,#8]
 21f0204:	d61f0020 	br	x1
 21f0208:	d65f03c0 	ret
 21f020c:	d503201f 	nop
 21f0210:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 21f0214:	910003fd 	mov	x29, sp
 21f0218:	a90153f3 	stp	x19, x20, [sp,#16]
 21f021c:	aa0003f3 	mov	x19, x0
