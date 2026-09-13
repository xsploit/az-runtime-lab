
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021fc040 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x73f28>:
 21fc040:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
 21fc044:	910003fd 	mov	x29, sp
 21fc048:	a90153f3 	stp	x19, x20, [sp,#16]
 21fc04c:	aa0003f4 	mov	x20, x0
 21fc050:	a9025bf5 	stp	x21, x22, [sp,#32]
 21fc054:	aa0103f6 	mov	x22, x1
 21fc058:	94009432 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 21fc05c:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 21fc060:	f0001ea1 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 21fc064:	9118e021 	add	x1, x1, #0x638
 21fc068:	f9002fe1 	str	x1, [sp,#88]
 21fc06c:	fd0033e0 	str	d0, [sp,#96]
 21fc070:	72001c1f 	tst	w0, #0xff
 21fc074:	2f00e400 	movi	d0, #0x0
 21fc078:	54000080 	b.eq	21fc088 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x73f70>
 21fc07c:	f000cec0 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 21fc080:	394de000 	ldrb	w0, [x0,#888]
 21fc084:	34000700 	cbz	w0, 21fc164 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x7404c>
 21fc088:	f9400683 	ldr	x3, [x20,#8]
 21fc08c:	f90043ff 	str	xzr, [sp,#128]
 21fc090:	d2800102 	mov	x2, #0x8                   	// #8
 21fc094:	d2800501 	mov	x1, #0x28                  	// #40
 21fc098:	aa0303e0 	mov	x0, x3
 21fc09c:	fd0037e0 	str	d0, [sp,#104]
 21fc0a0:	f9400063 	ldr	x3, [x3]
 21fc0a4:	f9400863 	ldr	x3, [x3,#16]
 21fc0a8:	d63f0060 	blr	x3
 21fc0ac:	aa0003f3 	mov	x19, x0
 21fc0b0:	b40005e0 	cbz	x0, 21fc16c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74054>
 21fc0b4:	91008280 	add	x0, x20, #0x20
 21fc0b8:	c85ffc14 	ldaxr	x20, [x0]
 21fc0bc:	91000694 	add	x20, x20, #0x1
 21fc0c0:	c801fc14 	stlxr	w1, x20, [x0]
 21fc0c4:	35ffffa1 	cbnz	w1, 21fc0b8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x73fa0>
 21fc0c8:	9793caee 	bl	6eec80 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x5e0f0>
 21fc0cc:	d000ced5 	adrp	x21, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21fc0d0:	9130e2b5 	add	x21, x21, #0xc38
 21fc0d4:	90006341 	adrp	x1, 2e64000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a11a8>
 21fc0d8:	910d6021 	add	x1, x1, #0x358
 21fc0dc:	f9000261 	str	x1, [x19]
 21fc0e0:	f94002c1 	ldr	x1, [x22]
 21fc0e4:	b9000a60 	str	w0, [x19,#8]
 21fc0e8:	a9010674 	stp	x20, x1, [x19,#16]
 21fc0ec:	08dffea0 	ldarb	w0, [x21]
 21fc0f0:	360001c0 	tbz	w0, #0, 21fc128 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74010>
 21fc0f4:	d000ced4 	adrp	x20, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21fc0f8:	91310294 	add	x20, x20, #0xc40
 21fc0fc:	885ffe80 	ldaxr	w0, [x20]
 21fc100:	11000400 	add	w0, w0, #0x1
 21fc104:	8801fe80 	stlxr	w1, w0, [x20]
 21fc108:	35ffffa1 	cbnz	w1, 21fc0fc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x73fe4>
 21fc10c:	910163e0 	add	x0, sp, #0x58
 21fc110:	97931b1a 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 21fc114:	aa1303e0 	mov	x0, x19
 21fc118:	a94153f3 	ldp	x19, x20, [sp,#16]
 21fc11c:	a9425bf5 	ldp	x21, x22, [sp,#32]
