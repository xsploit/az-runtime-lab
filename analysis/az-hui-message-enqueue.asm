
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021fc388 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74270>:
 21fc388:	91003020 	add	x0, x1, #0xc
 21fc38c:	88dffc02 	ldar	w2, [x0]
 21fc390:	7100005f 	cmp	w2, #0x0
 21fc394:	540000cd 	b.le	21fc3ac <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74294>
 21fc398:	b9401023 	ldr	w3, [x1,#16]
 21fc39c:	5289eb02 	mov	w2, #0x4f58                	// #20312
 21fc3a0:	72aa4862 	movk	w2, #0x5243, lsl #16
 21fc3a4:	6b02007f 	cmp	w3, w2
 21fc3a8:	54000ac0 	b.eq	21fc500 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x743e8>
 21fc3ac:	f9400a76 	ldr	x22, [x19,#16]
 21fc3b0:	f9003be1 	str	x1, [sp,#112]
 21fc3b4:	aa1603e0 	mov	x0, x22
 21fc3b8:	f94002c1 	ldr	x1, [x22]
 21fc3bc:	f9401421 	ldr	x1, [x1,#40]
 21fc3c0:	d63f0020 	blr	x1
 21fc3c4:	72001c1f 	tst	w0, #0xff
 21fc3c8:	540006e0 	b.eq	21fc4a4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x7438c>
 21fc3cc:	f94002c2 	ldr	x2, [x22]
 21fc3d0:	9101c3e1 	add	x1, sp, #0x70
 21fc3d4:	aa1603e0 	mov	x0, x22
 21fc3d8:	f9401854 	ldr	x20, [x2,#48]
 21fc3dc:	97ffff19 	bl	21fc040 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x73f28>
 21fc3e0:	aa0003e1 	mov	x1, x0
 21fc3e4:	aa1603e0 	mov	x0, x22
 21fc3e8:	d63f0280 	blr	x20
 21fc3ec:	aa0003f4 	mov	x20, x0
 21fc3f0:	b4000540 	cbz	x0, 21fc498 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74380>
 21fc3f4:	f9400ec0 	ldr	x0, [x22,#24]
 21fc3f8:	b40002c0 	cbz	x0, 21fc450 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74338>
 21fc3fc:	94009349 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 21fc400:	72001c1f 	tst	w0, #0xff
 21fc404:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 21fc408:	f0001ea1 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 21fc40c:	91196021 	add	x1, x1, #0x658
 21fc410:	f9003fe1 	str	x1, [sp,#120]
 21fc414:	fd0043e0 	str	d0, [sp,#128]
 21fc418:	2f00e400 	movi	d0, #0x0
 21fc41c:	54000080 	b.eq	21fc42c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74314>
 21fc420:	f000cec0 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 21fc424:	394de000 	ldrb	w0, [x0,#888]
 21fc428:	34000960 	cbz	w0, 21fc554 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x7443c>
 21fc42c:	f90053ff 	str	xzr, [sp,#160]
 21fc430:	fd0047e0 	str	d0, [sp,#136]
 21fc434:	f9400ec1 	ldr	x1, [x22,#24]
 21fc438:	aa0103e0 	mov	x0, x1
 21fc43c:	f9400021 	ldr	x1, [x1]
 21fc440:	f9400821 	ldr	x1, [x1,#16]
 21fc444:	d63f0020 	blr	x1
 21fc448:	9101e3e0 	add	x0, sp, #0x78
 21fc44c:	97931a4b 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 21fc450:	f9400e61 	ldr	x1, [x19,#24]
 21fc454:	91002020 	add	x0, x1, #0x8
 21fc458:	eb0002bf 	cmp	x21, x0
 21fc45c:	540001e8 	b.hi	21fc498 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74380>
 21fc460:	f240041f 	tst	x0, #0x3
 21fc464:	540001a1 	b.ne	21fc498 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74380>
 21fc468:	d000ced5 	adrp	x21, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21fc46c:	9131a2b5 	add	x21, x21, #0xc68
 21fc470:	f9001bf7 	str	x23, [sp,#48]
 21fc474:	b9400837 	ldr	w23, [x1,#8]
 21fc478:	08dffea0 	ldarb	w0, [x21]
 21fc47c:	d000ced6 	adrp	x22, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21fc480:	36000580 	tbz	w0, #0, 21fc530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74418>
 21fc484:	b94c72c0 	ldr	w0, [x22,#3184]
 21fc488:	6b0002ff 	cmp	w23, w0
 21fc48c:	54000440 	b.eq	21fc514 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x743fc>
 21fc490:	f9401bf7 	ldr	x23, [sp,#48]
 21fc494:	d503201f 	nop
 21fc498:	aa1403e0 	mov	x0, x20
 21fc49c:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21fc4a0:	17ffffa6 	b	21fc338 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74220>
 21fc4a4:	f9403be1 	ldr	x1, [sp,#112]
 21fc4a8:	91002020 	add	x0, x1, #0x8
 21fc4ac:	eb0002bf 	cmp	x21, x0
 21fc4b0:	54ffff48 	b.hi	21fc498 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74380>
 21fc4b4:	f240041f 	tst	x0, #0x3
 21fc4b8:	54ffff01 	b.ne	21fc498 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74380>
 21fc4bc:	b9400833 	ldr	w19, [x1,#8]
 21fc4c0:	9792d73a 	bl	6b21a8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x21618>
 21fc4c4:	6b00027f 	cmp	w19, w0
 21fc4c8:	54fffe81 	b.ne	21fc498 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74380>
 21fc4cc:	f9403be1 	ldr	x1, [sp,#112]
 21fc4d0:	aa0103e0 	mov	x0, x1
 21fc4d4:	f9400021 	ldr	x1, [x1]
 21fc4d8:	f9400821 	ldr	x1, [x1,#16]
 21fc4dc:	d63f0020 	blr	x1
 21fc4e0:	f9403be0 	ldr	x0, [sp,#112]
 21fc4e4:	91003000 	add	x0, x0, #0xc
 21fc4e8:	88dffc00 	ldar	w0, [x0]
 21fc4ec:	7100001f 	cmp	w0, #0x0
 21fc4f0:	f9403be0 	ldr	x0, [sp,#112]
 21fc4f4:	5400034d 	b.le	21fc55c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74444>
 21fc4f8:	97fff5e6 	bl	21f9c90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x71b78>
 21fc4fc:	17ffffe7 	b	21fc498 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74380>
 21fc500:	885ffc02 	ldaxr	w2, [x0]
 21fc504:	11000442 	add	w2, w2, #0x1
 21fc508:	8803fc02 	stlxr	w3, w2, [x0]
 21fc50c:	35ffffa3 	cbnz	w3, 21fc500 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x743e8>
 21fc510:	17ffffa7 	b	21fc3ac <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74294>
 21fc514:	f9400e61 	ldr	x1, [x19,#24]
 21fc518:	aa0103e0 	mov	x0, x1
 21fc51c:	f9400021 	ldr	x1, [x1]
 21fc520:	f9400821 	ldr	x1, [x1,#16]
 21fc524:	d63f0020 	blr	x1
 21fc528:	f9401bf7 	ldr	x23, [sp,#48]
 21fc52c:	17ffffdb 	b	21fc498 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74380>
