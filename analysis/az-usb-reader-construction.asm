
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002101600 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x901778>:
 2101600:	a90573fb 	stp	x27, x28, [sp,#80]
 2101604:	fd0033e8 	str	d8, [sp,#96]
 2101608:	978c9416 	bl	426660 <_ZdlPvm@plt>
 210160c:	17ffffec 	b	21015bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x901734>
 2101610:	a9b47bfd 	stp	x29, x30, [sp,#-192]!
 2101614:	910003fd 	mov	x29, sp
 2101618:	a9025bf5 	stp	x21, x22, [sp,#32]
 210161c:	aa0003f5 	mov	x21, x0
 2101620:	910163e0 	add	x0, sp, #0x58
 2101624:	940837bb 	bl	230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1873f8>
 2101628:	f90057ff 	str	xzr, [sp,#168]
 210162c:	d0006981 	adrp	x1, 2e33000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8701a8>
 2101630:	9101a3e0 	add	x0, sp, #0x68
 2101634:	912ae021 	add	x1, x1, #0xab8
 2101638:	b900b3ff 	str	wzr, [sp,#176]
 210163c:	b900bbff 	str	wzr, [sp,#184]
 2101640:	9408c9a8 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2101644:	a90153f3 	stp	x19, x20, [sp,#16]
 2101648:	b940bbf3 	ldr	w19, [sp,#184]
 210164c:	b940b3e1 	ldr	w1, [sp,#176]
 2101650:	b90073ff 	str	wzr, [sp,#112]
 2101654:	11000676 	add	w22, w19, #0x1
 2101658:	6b0102df 	cmp	w22, w1
 210165c:	f94057e0 	ldr	x0, [sp,#168]
 2101660:	5400020d 	b.le	21016a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x901818>
 2101664:	0b567ed4 	add	w20, w22, w22, lsr #31
 2101668:	0b9406d4 	add	w20, w22, w20, asr #1
 210166c:	11002294 	add	w20, w20, #0x8
 2101670:	121d7294 	and	w20, w20, #0xfffffff8
 2101674:	6b14003f 	cmp	w1, w20
 2101678:	54000140 	b.eq	21016a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x901818>
 210167c:	7100029f 	cmp	w20, #0x0
 2101680:	54001ccd 	b.le	2101a18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x901b90>
 2101684:	937c7e81 	sbfiz	x1, x20, #4, #32
 2101688:	b4001d60 	cbz	x0, 2101a34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x901bac>
 210168c:	978c8b85 	bl	4244a0 <realloc@plt>
 2101690:	b940bbf3 	ldr	w19, [sp,#184]
 2101694:	f90057e0 	str	x0, [sp,#168]
 2101698:	11000676 	add	w22, w19, #0x1
 210169c:	b900b3f4 	str	w20, [sp,#176]
 21016a0:	8b33d013 	add	x19, x0, w19, sxtw #4
 21016a4:	9101a3e1 	add	x1, sp, #0x68
 21016a8:	aa1303e0 	mov	x0, x19
 21016ac:	b900bbf6 	str	w22, [sp,#184]
 21016b0:	940839f0 	bl	230fe70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187d58>
 21016b4:	b94073e0 	ldr	w0, [sp,#112]
 21016b8:	b9000a60 	str	w0, [x19,#8]
 21016bc:	9101a3e0 	add	x0, sp, #0x68
 21016c0:	9407ebd0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21016c4:	d0006981 	adrp	x1, 2e33000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8701a8>
 21016c8:	9101e3e0 	add	x0, sp, #0x78
 21016cc:	912b2021 	add	x1, x1, #0xac8
 21016d0:	9408c984 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21016d4:	b940bbf3 	ldr	w19, [sp,#184]
 21016d8:	52800020 	mov	w0, #0x1                   	// #1
 21016dc:	b940b3e1 	ldr	w1, [sp,#176]
 21016e0:	b90083e0 	str	w0, [sp,#128]
 21016e4:	0b000276 	add	w22, w19, w0
 21016e8:	6b0102df 	cmp	w22, w1
 21016ec:	f94057e0 	ldr	x0, [sp,#168]
 21016f0:	5400020d 	b.le	2101730 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9018a8>
 21016f4:	0b567ed4 	add	w20, w22, w22, lsr #31
 21016f8:	0b9406d4 	add	w20, w22, w20, asr #1
 21016fc:	11002294 	add	w20, w20, #0x8
 2101700:	121d7294 	and	w20, w20, #0xfffffff8
 2101704:	6b14003f 	cmp	w1, w20
 2101708:	54000140 	b.eq	2101730 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9018a8>
 210170c:	7100029f 	cmp	w20, #0x0
 2101710:	5400168d 	b.le	21019e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x901b58>
 2101714:	937c7e81 	sbfiz	x1, x20, #4, #32
 2101718:	b4001960 	cbz	x0, 2101a44 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x901bbc>
 210171c:	978c8b61 	bl	4244a0 <realloc@plt>
 2101720:	b940bbf3 	ldr	w19, [sp,#184]
 2101724:	f90057e0 	str	x0, [sp,#168]
 2101728:	11000676 	add	w22, w19, #0x1
 210172c:	b900b3f4 	str	w20, [sp,#176]
 2101730:	8b33d013 	add	x19, x0, w19, sxtw #4
 2101734:	9101e3e1 	add	x1, sp, #0x78
 2101738:	aa1303e0 	mov	x0, x19
 210173c:	b900bbf6 	str	w22, [sp,#184]
 2101740:	940839cc 	bl	230fe70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187d58>
 2101744:	b94083e0 	ldr	w0, [sp,#128]
 2101748:	b9000a60 	str	w0, [x19,#8]
 210174c:	9101e3e0 	add	x0, sp, #0x78
