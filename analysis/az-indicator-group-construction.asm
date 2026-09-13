
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000207e34c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e4c4>:
 207e34c:	a9405320 	ldp	x0, x20, [x25]
 207e350:	f901867f 	str	xzr, [x19,#776]
 207e354:	a900feff 	stp	xzr, xzr, [x23,#8]
 207e358:	f901927f 	str	xzr, [x19,#800]
 207e35c:	a900ff1f 	stp	xzr, xzr, [x24,#8]
 207e360:	eb000294 	subs	x20, x20, x0
 207e364:	3c880c20 	str	q0, [x1,#128]!
 207e368:	f900083f 	str	xzr, [x1,#16]
 207e36c:	f90043ff 	str	xzr, [sp,#128]
 207e370:	3d801fe0 	str	q0, [sp,#112]
 207e374:	54000c60 	b.eq	207e500 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e678>
 207e378:	aa1403e0 	mov	x0, x20
 207e37c:	978e9a71 	bl	424d40 <_Znwm@plt>
 207e380:	9e670008 	fmov	d8, x0
 207e384:	8b140014 	add	x20, x0, x20
 207e388:	a9400b21 	ldp	x1, x2, [x25]
 207e38c:	f90043f4 	str	x20, [sp,#128]
 207e390:	4e080500 	dup	v0.2d, v8.d[0]
 207e394:	d2800014 	mov	x20, #0x0                   	// #0
 207e398:	3d801fe0 	str	q0, [sp,#112]
 207e39c:	eb010042 	subs	x2, x2, x1
 207e3a0:	54000060 	b.eq	207e3ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e524>
 207e3a4:	aa0203f4 	mov	x20, x2
 207e3a8:	978e9976 	bl	424980 <memcpy@plt>
 207e3ac:	9e660100 	fmov	x0, d8
 207e3b0:	aa1a03e1 	mov	x1, x26
 207e3b4:	9101c3e2 	add	x2, sp, #0x70
 207e3b8:	8b140014 	add	x20, x0, x20
 207e3bc:	aa1303e0 	mov	x0, x19
 207e3c0:	f9003ff4 	str	x20, [sp,#120]
 207e3c4:	97fffcbf 	bl	207d6c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87d838>
 207e3c8:	f9403be0 	ldr	x0, [sp,#112]
 207e3cc:	b4000040 	cbz	x0, 207e3d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e54c>
 207e3d0:	978e9aa0 	bl	424e50 <_ZdlPv@plt>
 207e3d4:	d0006ca0 	adrp	x0, 2e14000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8511a8>
 207e3d8:	91054000 	add	x0, x0, #0x150
 207e3dc:	91061000 	add	x0, x0, #0x184
 207e3e0:	97fff3c4 	bl	207b2f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87b468>
 207e3e4:	8b001003 	add	x3, x0, x0, lsl #4
 207e3e8:	d2801662 	mov	x2, #0xb3                  	// #179
 207e3ec:	f2f12002 	movk	x2, #0x8900, lsl #48
 207e3f0:	d28d1445 	mov	x5, #0x68a2                	// #26786
 207e3f4:	8b030c03 	add	x3, x0, x3, lsl #3
 207e3f8:	f2a7f105 	movk	x5, #0x3f88, lsl #16
 207e3fc:	9101a464 	add	x4, x3, #0x69
 207e400:	f2cbadc5 	movk	x5, #0x5d6e, lsl #32
 207e404:	f2e03bc5 	movk	x5, #0x1de, lsl #48
 207e408:	aa1303e1 	mov	x1, x19
 207e40c:	9101c3e0 	add	x0, sp, #0x70
 207e410:	9bc27c83 	umulh	x3, x4, x2
 207e414:	d378fc63 	lsr	x3, x3, #56
 207e418:	9b059063 	msub	x3, x3, x5, x4
 207e41c:	8b031064 	add	x4, x3, x3, lsl #4
 207e420:	8b040c63 	add	x3, x3, x4, lsl #3
 207e424:	91018c64 	add	x4, x3, #0x63
 207e428:	9bc27c83 	umulh	x3, x4, x2
 207e42c:	d378fc63 	lsr	x3, x3, #56
 207e430:	9b059063 	msub	x3, x3, x5, x4
 207e434:	8b031064 	add	x4, x3, x3, lsl #4
 207e438:	8b040c63 	add	x3, x3, x4, lsl #3
 207e43c:	9101b864 	add	x4, x3, #0x6e
 207e440:	9bc27c83 	umulh	x3, x4, x2
 207e444:	d378fc63 	lsr	x3, x3, #56
 207e448:	9b059063 	msub	x3, x3, x5, x4
 207e44c:	8b031064 	add	x4, x3, x3, lsl #4
 207e450:	8b040c63 	add	x3, x3, x4, lsl #3
 207e454:	91012463 	add	x3, x3, #0x49
 207e458:	9bc27c62 	umulh	x2, x3, x2
 207e45c:	d378fc42 	lsr	x2, x2, #56
 207e460:	9b058c42 	msub	x2, x2, x5, x3
 207e464:	f9003be2 	str	x2, [sp,#112]
 207e468:	940001c8 	bl	207eb88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87ed00>
 207e46c:	aa1303e0 	mov	x0, x19
 207e470:	97fff51a 	bl	207b8d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87ba50>
 207e474:	91010260 	add	x0, x19, #0x40
 207e478:	940abd72 	bl	232da40 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5928>
 207e47c:	f9417661 	ldr	x1, [x19,#744]
 207e480:	528000a2 	mov	w2, #0x5                   	// #5
 207e484:	aa1503e0 	mov	x0, x21
 207e488:	94063626 	bl	220bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x83c08>
 207e48c:	a94153f3 	ldp	x19, x20, [sp,#16]
 207e490:	a9425bf5 	ldp	x21, x22, [sp,#32]
 207e494:	a94363f7 	ldp	x23, x24, [sp,#48]
 207e498:	a9446bf9 	ldp	x25, x26, [sp,#64]
 207e49c:	fd402be8 	ldr	d8, [sp,#80]
 207e4a0:	a8c97bfd 	ldp	x29, x30, [sp],#144
 207e4a4:	d65f03c0 	ret
