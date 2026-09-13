
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f6430 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e318>:
 21f6430:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
 21f6434:	9000cf01 	adrp	x1, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f6438:	910003fd 	mov	x29, sp
 21f643c:	a90153f3 	stp	x19, x20, [sp,#16]
 21f6440:	f946dc33 	ldr	x19, [x1,#3512]
 21f6444:	b4000133 	cbz	x19, 21f6468 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e350>
 21f6448:	aa0003f4 	mov	x20, x0
 21f644c:	f9400660 	ldr	x0, [x19,#8]
 21f6450:	b40000c0 	cbz	x0, 21f6468 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e350>
 21f6454:	f9400a61 	ldr	x1, [x19,#16]
 21f6458:	b4000081 	cbz	x1, 21f6468 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e350>
 21f645c:	f9401821 	ldr	x1, [x1,#48]
 21f6460:	eb00003f 	cmp	x1, x0
 21f6464:	540001e0 	b.eq	21f64a0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e388>
 21f6468:	90006381 	adrp	x1, 2e66000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a31a8>
 21f646c:	91282021 	add	x1, x1, #0xa08
 21f6470:	910123e0 	add	x0, sp, #0x48
 21f6474:	9404f61b 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21f6478:	910123e0 	add	x0, sp, #0x48
 21f647c:	9404dfe9 	bl	232e420 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a6308>
 21f6480:	910123e0 	add	x0, sp, #0x48
 21f6484:	9404185f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21f6488:	d2800001 	mov	x1, #0x0                   	// #0
 21f648c:	52800000 	mov	w0, #0x0                   	// #0
 21f6490:	9400288c 	bl	22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x785a8>
 21f6494:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f6498:	a8c57bfd 	ldp	x29, x30, [sp],#80
 21f649c:	d65f03c0 	ret
 21f64a0:	9404ddec 	bl	232dc50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5b38>
 21f64a4:	f9400661 	ldr	x1, [x19,#8]
 21f64a8:	eb00003f 	cmp	x1, x0
 21f64ac:	54fffde1 	b.ne	21f6468 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e350>
 21f64b0:	94001034 	bl	21fa580 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x72468>
 21f64b4:	aa0003f3 	mov	x19, x0
 21f64b8:	9404d70e 	bl	232c0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fd8>
 21f64bc:	72001c1f 	tst	w0, #0xff
 21f64c0:	54fffea0 	b.eq	21f6494 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e37c>
 21f64c4:	a9025bf5 	stp	x21, x22, [sp,#32]
 21f64c8:	9404a0e2 	bl	231e850 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x196738>
 21f64cc:	91006296 	add	x22, x20, #0x18
 21f64d0:	2a0003f5 	mov	w21, w0
 21f64d4:	88dffec0 	ldar	w0, [x22]
 21f64d8:	7100041f 	cmp	w0, #0x1
 21f64dc:	54000220 	b.eq	21f6520 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e408>
 21f64e0:	b9401280 	ldr	w0, [x20,#16]
 21f64e4:	6b15001f 	cmp	w0, w21
 21f64e8:	54000148 	b.hi	21f6510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e3f8>
 21f64ec:	aa1403e0 	mov	x0, x20
 21f64f0:	97ffe91c 	bl	21f0960 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68848>
 21f64f4:	f9400680 	ldr	x0, [x20,#8]
 21f64f8:	b40000c0 	cbz	x0, 21f6510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e3f8>
 21f64fc:	f9400680 	ldr	x0, [x20,#8]
 21f6500:	b9400800 	ldr	w0, [x0,#8]
 21f6504:	7100001f 	cmp	w0, #0x0
 21f6508:	540002ed 	b.le	21f6564 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e44c>
 21f650c:	d503201f 	nop
 21f6510:	aa1303e0 	mov	x0, x19
 21f6514:	9404d6ff 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21f6518:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21f651c:	17ffffde 	b	21f6494 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e37c>
 21f6520:	b9401e80 	ldr	w0, [x20,#28]
 21f6524:	6b15001f 	cmp	w0, w21
 21f6528:	54ffff42 	b.cs	21f6510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e3f8>
 21f652c:	94001015 	bl	21fa580 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x72468>
 21f6530:	aa0003f5 	mov	x21, x0
 21f6534:	9404d6f7 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21f6538:	91008294 	add	x20, x20, #0x20
 21f653c:	c8dffe80 	ldar	x0, [x20]
 21f6540:	b40000a0 	cbz	x0, 21f6554 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e43c>
 21f6544:	97fffebf 	bl	21f6040 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6df28>
 21f6548:	aa1503e0 	mov	x0, x21
 21f654c:	9404d6e5 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 21f6550:	17fffff0 	b	21f6510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e3f8>
 21f6554:	f9001fe0 	str	x0, [sp,#56]
 21f6558:	97ffde9e 	bl	21edfd0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x65eb8>
 21f655c:	f9401fe0 	ldr	x0, [sp,#56]
 21f6560:	17fffff9 	b	21f6544 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e42c>
 21f6564:	52800020 	mov	w0, #0x1                   	// #1
 21f6568:	885ffec1 	ldaxr	w1, [x22]
 21f656c:	35000061 	cbnz	w1, 21f6578 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e460>
 21f6570:	8802fec0 	stlxr	w2, w0, [x22]
 21f6574:	35ffffa2 	cbnz	w2, 21f6568 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e450>
 21f6578:	7100003f 	cmp	w1, #0x0
 21f657c:	54fffca1 	b.ne	21f6510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e3f8>
 21f6580:	1104b2b5 	add	w21, w21, #0x12c
 21f6584:	b9001e95 	str	w21, [x20,#28]
 21f6588:	94000ffe 	bl	21fa580 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x72468>
 21f658c:	aa0003f5 	mov	x21, x0
 21f6590:	9404d6e0 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21f6594:	91008294 	add	x20, x20, #0x20
 21f6598:	c8dffe80 	ldar	x0, [x20]
 21f659c:	b4000060 	cbz	x0, 21f65a8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e490>
 21f65a0:	97fffea8 	bl	21f6040 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6df28>
 21f65a4:	17ffffe9 	b	21f6548 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e430>
 21f65a8:	f9001fe0 	str	x0, [sp,#56]
 21f65ac:	97ffde89 	bl	21edfd0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x65eb8>
 21f65b0:	f9401fe0 	ldr	x0, [sp,#56]
 21f65b4:	97fffea3 	bl	21f6040 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6df28>
 21f65b8:	17ffffe4 	b	21f6548 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e430>
 21f65bc:	aa0003f4 	mov	x20, x0
 21f65c0:	aa1503e0 	mov	x0, x21
 21f65c4:	9404d6c7 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 21f65c8:	aa1303e0 	mov	x0, x19
 21f65cc:	9404d6d1 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21f65d0:	aa1403e0 	mov	x0, x20
 21f65d4:	9788b9cf 	bl	424d10 <_Unwind_Resume@plt>
 21f65d8:	17fffff9 	b	21f65bc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e4a4>
 21f65dc:	aa0003f3 	mov	x19, x0
 21f65e0:	910123e0 	add	x0, sp, #0x48
 21f65e4:	a9025bf5 	stp	x21, x22, [sp,#32]
 21f65e8:	94041806 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21f65ec:	aa1303e0 	mov	x0, x19
 21f65f0:	9788b9c8 	bl	424d10 <_Unwind_Resume@plt>
 21f65f4:	d503201f 	nop
 21f65f8:	d503201f 	nop
 21f65fc:	d503201f 	nop
 21f6600:	a9b67bfd 	stp	x29, x30, [sp,#-160]!
 21f6604:	910003fd 	mov	x29, sp
 21f6608:	a9046bf9 	stp	x25, x26, [sp,#64]
 21f660c:	aa0003f9 	mov	x25, x0
 21f6610:	91004000 	add	x0, x0, #0x10
 21f6614:	a90153f3 	stp	x19, x20, [sp,#16]
 21f6618:	f90043e0 	str	x0, [sp,#128]
 21f661c:	9404997d 	bl	231cc10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x194af8>
 21f6620:	39074720 	strb	w0, [x25,#465]
 21f6624:	f940f320 	ldr	x0, [x25,#480]
 21f6628:	b5001c20 	cbnz	x0, 21f69ac <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e894>
 21f662c:	f940cf21 	ldr	x1, [x25,#408]
 21f6630:	9000cf02 	adrp	x2, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f6634:	aa0103e0 	mov	x0, x1
 21f6638:	f906dc41 	str	x1, [x2,#3512]
 21f663c:	97ffe7b1 	bl	21f0500 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x683e8>
