 21f66dc:	b941d720 	ldr	w0, [x25,#468]
 21f66e0:	52800023 	mov	w3, #0x1                   	// #1
 21f66e4:	b9408fe2 	ldr	w2, [sp,#140]
 21f66e8:	f9403fe1 	ldr	x1, [sp,#120]
 21f66ec:	9788c031 	bl	4267b0 <epoll_wait@plt>
 21f66f0:	2a0003f4 	mov	w20, w0
 21f66f4:	37f80f20 	tbnz	w0, #31, 21f68d8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e7c0>
 21f66f8:	9000cf00 	adrp	x0, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f66fc:	f946d800 	ldr	x0, [x0,#3504]
 21f6700:	b4000040 	cbz	x0, 21f6708 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e5f0>
 21f6704:	97ffff4b 	bl	21f6430 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e318>
 21f6708:	f940cf20 	ldr	x0, [x25,#408]
 21f670c:	d0001e56 	adrp	x22, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 21f6710:	912a72d6 	add	x22, x22, #0xa9c
 21f6714:	eb0002df 	cmp	x22, x0
 21f6718:	540001c8 	b.hi	21f6750 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e638>
 21f671c:	f240041f 	tst	x0, #0x3
 21f6720:	54000181 	b.ne	21f6750 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e638>
 21f6724:	9000cf13 	adrp	x19, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f6728:	91316273 	add	x19, x19, #0xc58
 21f672c:	b9400018 	ldr	w24, [x0]
 21f6730:	08dffe60 	ldarb	w0, [x19]
 21f6734:	36001280 	tbz	w0, #0, 21f6984 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e86c>
 21f6738:	9000cf17 	adrp	x23, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f673c:	913182f7 	add	x23, x23, #0xc60
 21f6740:	b94002e0 	ldr	w0, [x23]
 21f6744:	6b00031f 	cmp	w24, w0
 21f6748:	54000f80 	b.eq	21f6938 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e820>
 21f674c:	d503201f 	nop
