
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021ee490 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66378>:
 21ee490:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21ee494:	910003fd 	mov	x29, sp
 21ee498:	bd400821 	ldr	s1, [x1,#8]
 21ee49c:	f9400002 	ldr	x2, [x0]
 21ee4a0:	f0ffffe1 	adrp	x1, 21ed000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x64ee8>
 21ee4a4:	9130c021 	add	x1, x1, #0xc30
 21ee4a8:	f9400c42 	ldr	x2, [x2,#24]
 21ee4ac:	f9000bf3 	str	x19, [sp,#16]
 21ee4b0:	fd000fe8 	str	d8, [sp,#24]
 21ee4b4:	aa0003f3 	mov	x19, x0
 21ee4b8:	eb01005f 	cmp	x2, x1
 21ee4bc:	7e21d828 	ucvtf	s8, s1
 21ee4c0:	540002c1 	b.ne	21ee518 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66400>
 21ee4c4:	0f000402 	movi	v2.2s, #0x0
 21ee4c8:	bd401003 	ldr	s3, [x0,#16]
 21ee4cc:	1e222070 	fcmpe	s3, s2
 21ee4d0:	1e204040 	fmov	s0, s2
 21ee4d4:	1e22cc62 	fcsel	s2, s3, s2, gt
 21ee4d8:	bd400e61 	ldr	s1, [x19,#12]
 21ee4dc:	7e21d821 	ucvtf	s1, s1
 21ee4e0:	1e211901 	fdiv	s1, s8, s1
 21ee4e4:	1e230821 	fmul	s1, s1, s3
 21ee4e8:	1e202030 	fcmpe	s1, s0
 21ee4ec:	540000a5 	b.pl	21ee500 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x663e8>
 21ee4f0:	f9400bf3 	ldr	x19, [sp,#16]
 21ee4f4:	fd400fe8 	ldr	d8, [sp,#24]
 21ee4f8:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21ee4fc:	d65f03c0 	ret
 21ee500:	1e222030 	fcmpe	s1, s2
 21ee504:	fd400fe8 	ldr	d8, [sp,#24]
 21ee508:	f9400bf3 	ldr	x19, [sp,#16]
 21ee50c:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21ee510:	1e21cc40 	fcsel	s0, s2, s1, gt
 21ee514:	d65f03c0 	ret
 21ee518:	9100a3e8 	add	x8, sp, #0x28
 21ee51c:	d63f0040 	blr	x2
 21ee520:	bd401263 	ldr	s3, [x19,#16]
 21ee524:	2d450be0 	ldp	s0, s2, [sp,#40]
 21ee528:	17ffffec 	b	21ee4d8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x663c0>
 21ee52c:	d503201f 	nop
 21ee530:	9000cf40 	adrp	x0, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21ee534:	f946dc00 	ldr	x0, [x0,#3512]
 21ee538:	b4000140 	cbz	x0, 21ee560 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66448>
 21ee53c:	f9400402 	ldr	x2, [x0,#8]
 21ee540:	b4000102 	cbz	x2, 21ee560 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66448>
 21ee544:	f9400801 	ldr	x1, [x0,#16]
 21ee548:	b40000c1 	cbz	x1, 21ee560 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66448>
 21ee54c:	f9401823 	ldr	x3, [x1,#48]
 21ee550:	52800000 	mov	w0, #0x0                   	// #0
 21ee554:	eb03005f 	cmp	x2, x3
 21ee558:	54000080 	b.eq	21ee568 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66450>
 21ee55c:	d65f03c0 	ret
 21ee560:	52800000 	mov	w0, #0x0                   	// #0
 21ee564:	d65f03c0 	ret
 21ee568:	f9400022 	ldr	x2, [x1]
 21ee56c:	b0ff2500 	adrp	x0, 68f000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x1ad28>
 21ee570:	911ae000 	add	x0, x0, #0x6b8
 21ee574:	f9401042 	ldr	x2, [x2,#32]
 21ee578:	eb00005f 	cmp	x2, x0
 21ee57c:	54000141 	b.ne	21ee5a4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6648c>
 21ee580:	9100e020 	add	x0, x1, #0x38
 21ee584:	c8dffc02 	ldar	x2, [x0]
 21ee588:	9101e021 	add	x1, x1, #0x78
 21ee58c:	c8dffc20 	ldar	x0, [x1]
