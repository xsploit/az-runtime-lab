
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000001d07528 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5076a0>:
 1d07528:	a9b57bfd 	stp	x29, x30, [sp,#-176]!
 1d0752c:	910003fd 	mov	x29, sp
 1d07530:	a90153f3 	stp	x19, x20, [sp,#16]
 1d07534:	aa0003f3 	mov	x19, x0
 1d07538:	b9400054 	ldr	w20, [x2]
 1d0753c:	a9025bf5 	stp	x21, x22, [sp,#32]
 1d07540:	a90363f7 	stp	x23, x24, [sp,#48]
 1d07544:	d1024017 	sub	x23, x0, #0x90
 1d07548:	941899c2 	bl	232dc50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5b38>
 1d0754c:	aa0003f5 	mov	x21, x0
 1d07550:	941a39a8 	bl	2395bf0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x207d0>
 1d07554:	b4000040 	cbz	x0, 1d0755c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5076d4>
 1d07558:	f9400800 	ldr	x0, [x0,#16]
 1d0755c:	eb0002bf 	cmp	x21, x0
 1d07560:	54000261 	b.ne	1d075ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x507724>
 1d07564:	7100069f 	cmp	w20, #0x1
 1d07568:	54000060 	b.eq	1d07574 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5076ec>
 1d0756c:	71000a9f 	cmp	w20, #0x2
 1d07570:	1a9f0294 	csel	w20, w20, wzr, eq
 1d07574:	394ba2e0 	ldrb	w0, [x23,#744]
 1d07578:	35000c20 	cbnz	w0, 1d076fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x507874>
 1d0757c:	52800281 	mov	w1, #0x14                  	// #20
 1d07580:	aa1703e0 	mov	x0, x23
 1d07584:	2a1403e2 	mov	w2, w20
 1d07588:	97ffe320 	bl	1d00208 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x500380>
 1d0758c:	f9409ee0 	ldr	x0, [x23,#312]
 1d07590:	2a1403e1 	mov	w1, w20
 1d07594:	94009855 	bl	1d2d6e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x52d860>
 1d07598:	a94153f3 	ldp	x19, x20, [sp,#16]
 1d0759c:	a9425bf5 	ldp	x21, x22, [sp,#32]
 1d075a0:	a94363f7 	ldp	x23, x24, [sp,#48]
 1d075a4:	a8cb7bfd 	ldp	x29, x30, [sp],#176
 1d075a8:	d65f03c0 	ret
 1d075ac:	941466dd 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 1d075b0:	72001c1f 	tst	w0, #0xff
 1d075b4:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 1d075b8:	90004661 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 1d075bc:	9118e021 	add	x1, x1, #0x638
 1d075c0:	f9003fe1 	str	x1, [sp,#120]
 1d075c4:	fd0043e0 	str	d0, [sp,#128]
 1d075c8:	2f00e400 	movi	d0, #0x0
 1d075cc:	54000080 	b.eq	1d075dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x507754>
 1d075d0:	9000f680 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 1d075d4:	394de000 	ldrb	w0, [x0,#888]
 1d075d8:	34000a20 	cbz	w0, 1d0771c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x507894>
 1d075dc:	f9411e63 	ldr	x3, [x19,#568]
 1d075e0:	f90053ff 	str	xzr, [sp,#160]
 1d075e4:	d2800102 	mov	x2, #0x8                   	// #8
 1d075e8:	d2800601 	mov	x1, #0x30                  	// #48
 1d075ec:	aa0303e0 	mov	x0, x3
 1d075f0:	fd0047e0 	str	d0, [sp,#136]
 1d075f4:	f9400063 	ldr	x3, [x3]
 1d075f8:	f9400863 	ldr	x3, [x3,#16]
 1d075fc:	d63f0060 	blr	x3
 1d07600:	aa0003f5 	mov	x21, x0
 1d07604:	b4000b00 	cbz	x0, 1d07764 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5078dc>
 1d07608:	91094260 	add	x0, x19, #0x250
 1d0760c:	f90023f9 	str	x25, [sp,#64]
