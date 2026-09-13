
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000018c84e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8658>:
 18c84e0:	942e3bfc 	bl	24574d0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0xe20b0>
 18c84e4:	91004273 	add	x19, x19, #0x10
 18c84e8:	eb1302ff 	cmp	x23, x19
 18c84ec:	54ffff21 	b.ne	18c84d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8648>
 18c84f0:	9101e3e0 	add	x0, sp, #0x78
 18c84f4:	97ff04d9 	bl	1889858 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x899d0>
 18c84f8:	52800021 	mov	w1, #0x1                   	// #1
 18c84fc:	aa1503e0 	mov	x0, x21
 18c8500:	942e3e14 	bl	2457d50 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0xe2930>
 18c8504:	910662a1 	add	x1, x21, #0x198
 18c8508:	aa1503e0 	mov	x0, x21
 18c850c:	942e3e15 	bl	2457d60 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0xe2940>
 18c8510:	f940deb3 	ldr	x19, [x21,#440]
 18c8514:	b4000c93 	cbz	x19, 18c86a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc881c>
 18c8518:	f9400a77 	ldr	x23, [x19,#16]
 18c851c:	b4000c57 	cbz	x23, 18c86a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc881c>
 18c8520:	91008279 	add	x25, x19, #0x20
 18c8524:	d2800400 	mov	x0, #0x20                  	// #32
 18c8528:	97ad7206 	bl	424d40 <_Znwm@plt>
 18c852c:	aa0003f8 	mov	x24, x0
 18c8530:	b9402a61 	ldr	w1, [x19,#40]
 18c8534:	d2800800 	mov	x0, #0x40                  	// #64
 18c8538:	b9000301 	str	w1, [x24]
 18c853c:	97ad72a5 	bl	424fd0 <malloc@plt>
 18c8540:	aa0003e2 	mov	x2, x0
 18c8544:	aa1803e1 	mov	x1, x24
 18c8548:	910682a5 	add	x5, x21, #0x1a0
 18c854c:	52800104 	mov	w4, #0x8                   	// #8
 18c8550:	52800023 	mov	w3, #0x1                   	// #1
 18c8554:	f9000045 	str	x5, [x2]
 18c8558:	d2800400 	mov	x0, #0x20                  	// #32
 18c855c:	f8008c22 	str	x2, [x1,#8]!
 18c8560:	b9000824 	str	w4, [x1,#8]
 18c8564:	b9001023 	str	w3, [x1,#16]
 18c8568:	97ad71f6 	bl	424d40 <_Znwm@plt>
 18c856c:	aa0003f3 	mov	x19, x0
 18c8570:	90006b61 	adrp	x1, 2634000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x711a8>
 18c8574:	912d4021 	add	x1, x1, #0xb50
 18c8578:	d2800200 	mov	x0, #0x10                  	// #16
 18c857c:	f9000261 	str	x1, [x19]
 18c8580:	b9000a7f 	str	wzr, [x19,#8]
 18c8584:	a901627f 	stp	xzr, x24, [x19,#16]
 18c8588:	97ad71ee 	bl	424d40 <_Znwm@plt>
 18c858c:	f9400a62 	ldr	x2, [x19,#16]
 18c8590:	d0006b61 	adrp	x1, 2636000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x731a8>
 18c8594:	91300021 	add	x1, x1, #0xc00
 18c8598:	a9006001 	stp	x1, x24, [x0]
 18c859c:	f9000a60 	str	x0, [x19,#16]
 18c85a0:	b40000a2 	cbz	x2, 18c85b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc872c>
 18c85a4:	f9400041 	ldr	x1, [x2]
 18c85a8:	aa0203e0 	mov	x0, x2
 18c85ac:	f9400421 	ldr	x1, [x1,#8]
 18c85b0:	d63f0020 	blr	x1
 18c85b4:	91002278 	add	x24, x19, #0x8
 18c85b8:	885fff00 	ldaxr	w0, [x24]
 18c85bc:	11000400 	add	w0, w0, #0x1
 18c85c0:	8801ff00 	stlxr	w1, w0, [x24]
 18c85c4:	35ffffa1 	cbnz	w1, 18c85b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8730>
 18c85c8:	aa1903e1 	mov	x1, x25
 18c85cc:	9101e3e0 	add	x0, sp, #0x78
 18c85d0:	f94006f9 	ldr	x25, [x23,#8]
 18c85d4:	94291783 	bl	230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862c8>
 18c85d8:	a9084ff7 	stp	x23, x19, [sp,#128]
 18c85dc:	885fff00 	ldaxr	w0, [x24]
 18c85e0:	11000400 	add	w0, w0, #0x1
 18c85e4:	8801ff00 	stlxr	w1, w0, [x24]
 18c85e8:	35ffffa1 	cbnz	w1, 18c85dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8754>
 18c85ec:	f9400321 	ldr	x1, [x25]
 18c85f0:	aa1903e0 	mov	x0, x25
 18c85f4:	f9401421 	ldr	x1, [x1,#40]
 18c85f8:	d63f0020 	blr	x1
 18c85fc:	72001c1f 	tst	w0, #0xff
 18c8600:	54000c60 	b.eq	18c878c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8904>
 18c8604:	f9400322 	ldr	x2, [x25]
 18c8608:	9101e3e1 	add	x1, sp, #0x78
 18c860c:	aa1903e0 	mov	x0, x25
 18c8610:	f9401857 	ldr	x23, [x2,#48]
 18c8614:	97fffe4d 	bl	18c7f48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc80c0>
 18c8618:	aa0003e1 	mov	x1, x0
 18c861c:	aa1903e0 	mov	x0, x25
 18c8620:	d63f02e0 	blr	x23
 18c8624:	b4000320 	cbz	x0, 18c8688 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8800>
 18c8628:	f9400f20 	ldr	x0, [x25,#24]
 18c862c:	b40002e0 	cbz	x0, 18c8688 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8800>
 18c8630:	942562bc 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 18c8634:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 18c8638:	f0006841 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 18c863c:	91196021 	add	x1, x1, #0x658
 18c8640:	f9004be1 	str	x1, [sp,#144]
 18c8644:	fd004fe0 	str	d0, [sp,#152]
 18c8648:	72001c1f 	tst	w0, #0xff
 18c864c:	2f00e400 	movi	d0, #0x0
 18c8650:	540000a0 	b.eq	18c8664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc87dc>
 18c8654:	f0011860 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 18c8658:	394de000 	ldrb	w0, [x0,#888]
 18c865c:	35000040 	cbnz	w0, 18c8664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc87dc>
 18c8660:	94299824 	bl	232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a65d8>
 18c8664:	f9005fff 	str	xzr, [sp,#184]
 18c8668:	fd0053e0 	str	d0, [sp,#160]
 18c866c:	f9400f21 	ldr	x1, [x25,#24]
 18c8670:	aa0103e0 	mov	x0, x1
 18c8674:	f9400021 	ldr	x1, [x1]
 18c8678:	f9400821 	ldr	x1, [x1,#16]
 18c867c:	d63f0020 	blr	x1
 18c8680:	aa1403e0 	mov	x0, x20
 18c8684:	97b7e9bd 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 18c8688:	f94047e0 	ldr	x0, [sp,#136]
 18c868c:	b4000040 	cbz	x0, 18c8694 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc880c>
 18c8690:	97fe7334 	bl	1865360 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x654d8>
 18c8694:	9101e3e0 	add	x0, sp, #0x78
 18c8698:	9428d03e 	bl	22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x174678>
 18c869c:	aa1303e0 	mov	x0, x19
 18c86a0:	97fe7330 	bl	1865360 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x654d8>
 18c86a4:	a94153f3 	ldp	x19, x20, [sp,#16]
 18c86a8:	a9425bf5 	ldp	x21, x22, [sp,#32]
 18c86ac:	a94363f7 	ldp	x23, x24, [sp,#48]
 18c86b0:	f94023f9 	ldr	x25, [sp,#64]
 18c86b4:	a8d77bfd 	ldp	x29, x30, [sp],#368
 18c86b8:	d65f03c0 	ret
