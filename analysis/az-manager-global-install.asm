AZ EP147 instruction excerpt; addresses authoritative, nearest-symbol labels are not function names.
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
