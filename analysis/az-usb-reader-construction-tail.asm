
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002101750 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9018c8>:
 2101750:	9407ebac 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2101754:	d0006981 	adrp	x1, 2e33000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8701a8>
 2101758:	910223e0 	add	x0, sp, #0x88
 210175c:	912b6021 	add	x1, x1, #0xad8
 2101760:	9408c960 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2101764:	b940bbf3 	ldr	w19, [sp,#184]
 2101768:	52800060 	mov	w0, #0x3                   	// #3
 210176c:	b940b3e1 	ldr	w1, [sp,#176]
 2101770:	b90093e0 	str	w0, [sp,#144]
 2101774:	11000676 	add	w22, w19, #0x1
 2101778:	6b0102df 	cmp	w22, w1
 210177c:	f94057e0 	ldr	x0, [sp,#168]
 2101780:	5400020d 	b.le	21017c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x901938>
 2101784:	0b567ed4 	add	w20, w22, w22, lsr #31
 2101788:	0b9406d4 	add	w20, w22, w20, asr #1
 210178c:	11002294 	add	w20, w20, #0x8
 2101790:	121d7294 	and	w20, w20, #0xfffffff8
 2101794:	6b14003f 	cmp	w1, w20
 2101798:	54000140 	b.eq	21017c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x901938>
 210179c:	7100029f 	cmp	w20, #0x0
 21017a0:	540012ed 	b.le	21019fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x901b74>
 21017a4:	937c7e81 	sbfiz	x1, x20, #4, #32
 21017a8:	b4001560 	cbz	x0, 2101a54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x901bcc>
 21017ac:	978c8b3d 	bl	4244a0 <realloc@plt>
 21017b0:	b940bbf3 	ldr	w19, [sp,#184]
 21017b4:	f90057e0 	str	x0, [sp,#168]
 21017b8:	11000676 	add	w22, w19, #0x1
 21017bc:	b900b3f4 	str	w20, [sp,#176]
 21017c0:	8b33d013 	add	x19, x0, w19, sxtw #4
 21017c4:	910223e1 	add	x1, sp, #0x88
 21017c8:	aa1303e0 	mov	x0, x19
 21017cc:	b900bbf6 	str	w22, [sp,#184]
 21017d0:	940839a8 	bl	230fe70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187d58>
 21017d4:	b94093e0 	ldr	w0, [sp,#144]
 21017d8:	b9000a60 	str	w0, [x19,#8]
 21017dc:	910223e0 	add	x0, sp, #0x88
 21017e0:	9407eb88 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21017e4:	f0003b01 	adrp	x1, 2864000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a11a8>
 21017e8:	910263e0 	add	x0, sp, #0x98
 21017ec:	91232021 	add	x1, x1, #0x8c8
 21017f0:	9408c93c 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21017f4:	b940bbf3 	ldr	w19, [sp,#184]
 21017f8:	52800080 	mov	w0, #0x4                   	// #4
 21017fc:	b940b3e1 	ldr	w1, [sp,#176]
 2101800:	b900a3e0 	str	w0, [sp,#160]
 2101804:	11000676 	add	w22, w19, #0x1
 2101808:	6b0102df 	cmp	w22, w1
 210180c:	f94057e0 	ldr	x0, [sp,#168]
 2101810:	5400020d 	b.le	2101850 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9019c8>
 2101814:	0b567ed4 	add	w20, w22, w22, lsr #31
 2101818:	0b9406d4 	add	w20, w22, w20, asr #1
 210181c:	11002294 	add	w20, w20, #0x8
 2101820:	121d7294 	and	w20, w20, #0xfffffff8
 2101824:	6b14003f 	cmp	w1, w20
 2101828:	54000140 	b.eq	2101850 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9019c8>
 210182c:	7100029f 	cmp	w20, #0x0
 2101830:	54000cad 	b.le	21019c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x901b3c>
 2101834:	937c7e81 	sbfiz	x1, x20, #4, #32
 2101838:	b4001160 	cbz	x0, 2101a64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x901bdc>
 210183c:	978c8b19 	bl	4244a0 <realloc@plt>
 2101840:	b940bbf3 	ldr	w19, [sp,#184]
 2101844:	f90057e0 	str	x0, [sp,#168]
 2101848:	11000676 	add	w22, w19, #0x1
 210184c:	b900b3f4 	str	w20, [sp,#176]
 2101850:	8b33d013 	add	x19, x0, w19, sxtw #4
 2101854:	910263e1 	add	x1, sp, #0x98
 2101858:	aa1303e0 	mov	x0, x19
 210185c:	b900bbf6 	str	w22, [sp,#184]
 2101860:	94083984 	bl	230fe70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187d58>
 2101864:	b940a3e0 	ldr	w0, [sp,#160]
 2101868:	b9000a60 	str	w0, [x19,#8]
 210186c:	910263e0 	add	x0, sp, #0x98
 2101870:	9407eb64 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2101874:	d0006981 	adrp	x1, 2e33000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8701a8>
 2101878:	9100c3e0 	add	x0, sp, #0x30
 210187c:	912ba021 	add	x1, x1, #0xae8
 2101880:	9408c918 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2101884:	d0006981 	adrp	x1, 2e33000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8701a8>
 2101888:	9100e3e0 	add	x0, sp, #0x38
 210188c:	912be021 	add	x1, x1, #0xaf8
 2101890:	9408c914 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2101894:	d0006981 	adrp	x1, 2e33000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8701a8>
 2101898:	910103e0 	add	x0, sp, #0x40
 210189c:	912c2021 	add	x1, x1, #0xb08
