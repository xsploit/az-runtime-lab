
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002211550 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x89438>:
 2211550:	a9ba7bfd 	stp	x29, x30, [sp,#-96]!
 2211554:	910003fd 	mov	x29, sp
 2211558:	a90153f3 	stp	x19, x20, [sp,#16]
 221155c:	aa0103f3 	mov	x19, x1
 2211560:	aa0003f4 	mov	x20, x0
 2211564:	94003eef 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 2211568:	72001c1f 	tst	w0, #0xff
 221156c:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 2211570:	b00062a1 	adrp	x1, 2e66000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a31a8>
 2211574:	9124a021 	add	x1, x1, #0x928
 2211578:	f90017e1 	str	x1, [sp,#40]
 221157c:	fd001be0 	str	d0, [sp,#48]
 2211580:	2f00e400 	movi	d0, #0x0
 2211584:	54000080 	b.eq	2211594 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8947c>
 2211588:	d000ce20 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 221158c:	394de000 	ldrb	w0, [x0,#888]
 2211590:	34000380 	cbz	w0, 2211600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x894e8>
 2211594:	f9400261 	ldr	x1, [x19]
 2211598:	f9002bff 	str	xzr, [sp,#80]
 221159c:	aa1303e0 	mov	x0, x19
 22115a0:	fd001fe0 	str	d0, [sp,#56]
 22115a4:	f9400021 	ldr	x1, [x1]
 22115a8:	d63f0020 	blr	x1
 22115ac:	f9400680 	ldr	x0, [x20,#8]
 22115b0:	d0ffffa1 	adrp	x1, 2207000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x7eee8>
 22115b4:	91398021 	add	x1, x1, #0xe60
 22115b8:	f9400002 	ldr	x2, [x0]
 22115bc:	f9400c42 	ldr	x2, [x2,#24]
 22115c0:	eb01005f 	cmp	x2, x1
 22115c4:	54000101 	b.ne	22115e4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x894cc>
 22115c8:	aa1303e0 	mov	x0, x19
 22115cc:	97ffdb69 	bl	2208370 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x80258>
 22115d0:	9100a3e0 	add	x0, sp, #0x28
 22115d4:	9792c5e9 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 22115d8:	a94153f3 	ldp	x19, x20, [sp,#16]
 22115dc:	a8c67bfd 	ldp	x29, x30, [sp],#96
 22115e0:	d65f03c0 	ret
 22115e4:	aa1303e1 	mov	x1, x19
 22115e8:	d63f0040 	blr	x2
 22115ec:	9100a3e0 	add	x0, sp, #0x28
 22115f0:	9792c5e2 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 22115f4:	a94153f3 	ldp	x19, x20, [sp,#16]
 22115f8:	a8c67bfd 	ldp	x29, x30, [sp],#96
 22115fc:	d65f03c0 	ret
