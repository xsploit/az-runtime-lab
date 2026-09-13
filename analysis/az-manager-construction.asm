AZ EP147 instruction excerpt; addresses authoritative, nearest-symbol labels are not function names.
 21f2050:	a9ba7bfd 	stp	x29, x30, [sp,#-96]!
 21f2054:	910003fd 	mov	x29, sp
 21f2058:	a90153f3 	stp	x19, x20, [sp,#16]
 21f205c:	aa0003f4 	mov	x20, x0
 21f2060:	9000cf33 	adrp	x19, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f2064:	91316273 	add	x19, x19, #0xc58
 21f2068:	a9025bf5 	stp	x21, x22, [sp,#32]
 21f206c:	f9001bf7 	str	x23, [sp,#48]
 21f2070:	08dffe60 	ldarb	w0, [x19]
 21f2074:	9000cf35 	adrp	x21, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f2078:	36000620 	tbz	w0, #0, 21f213c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6a024>
 21f207c:	b94c62a1 	ldr	w1, [x21,#3168]
 21f2080:	d2800400 	mov	x0, #0x20                  	// #32
 21f2084:	b9000281 	str	w1, [x20]
 21f2088:	9000ca95 	adrp	x21, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 21f208c:	913862b5 	add	x21, x21, #0xe18
 21f2090:	f900069f 	str	xzr, [x20,#8]
 21f2094:	f90027ff 	str	xzr, [sp,#72]
 21f2098:	9788cb2a 	bl	424d40 <_Znwm@plt>
 21f209c:	aa0003f3 	mov	x19, x0
 21f20a0:	91004016 	add	x22, x0, #0x10
 21f20a4:	b0001ea0 	adrp	x0, 25c7000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x41a8>
 21f20a8:	911c6000 	add	x0, x0, #0x718
 21f20ac:	b20003e1 	mov	x1, #0x100000001           	// #4294967297
 21f20b0:	a9000660 	stp	x0, x1, [x19]
 21f20b4:	f9000a7f 	str	xzr, [x19,#16]
 21f20b8:	b9000adf 	str	wzr, [x22,#8]
 21f20bc:	08dffea0 	ldarb	w0, [x21]
 21f20c0:	9000ca97 	adrp	x23, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 21f20c4:	360004e0 	tbz	w0, #0, 21f2160 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6a048>
 21f20c8:	b94e22e2 	ldr	w2, [x23,#3616]
 21f20cc:	b00063a1 	adrp	x1, 2e67000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a41a8>
 21f20d0:	91292021 	add	x1, x1, #0xa48
 21f20d4:	f9000a61 	str	x1, [x19,#16]
 21f20d8:	b9001a62 	str	w2, [x19,#24]
 21f20dc:	d2801a00 	mov	x0, #0xd0                  	// #208
 21f20e0:	a9054ff6 	stp	x22, x19, [sp,#80]
 21f20e4:	9788cb17 	bl	424d40 <_Znwm@plt>
 21f20e8:	910143e4 	add	x4, sp, #0x50
 21f20ec:	aa0003f3 	mov	x19, x0
 21f20f0:	d2800003 	mov	x3, #0x0                   	// #0
 21f20f4:	52810002 	mov	w2, #0x800                 	// #2048
 21f20f8:	910123e1 	add	x1, sp, #0x48
 21f20fc:	94006a35 	bl	220c9d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x848b8>
 21f2100:	f9402fe0 	ldr	x0, [sp,#88]
 21f2104:	f9000a93 	str	x19, [x20,#16]
 21f2108:	b4000040 	cbz	x0, 21f2110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69ff8>
 21f210c:	97920873 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 21f2110:	f94027e0 	ldr	x0, [sp,#72]
 21f2114:	b4000080 	cbz	x0, 21f2124 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6a00c>
 21f2118:	f9400001 	ldr	x1, [x0]
 21f211c:	f9400421 	ldr	x1, [x1,#8]
 21f2120:	d63f0020 	blr	x1
 21f2124:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21f2128:	f9401bf7 	ldr	x23, [sp,#48]
 21f212c:	f9000e9f 	str	xzr, [x20,#24]
 21f2130:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f2134:	a8c67bfd 	ldp	x29, x30, [sp],#96
 21f2138:	d65f03c0 	ret
 21f213c:	aa1303e0 	mov	x0, x19
 21f2140:	9000cf35 	adrp	x21, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f2144:	9788d047 	bl	426260 <__cxa_guard_acquire@plt>
 21f2148:	34fff9a0 	cbz	w0, 21f207c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69f64>
 21f214c:	9792f9ef 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 21f2150:	b90c62a0 	str	w0, [x21,#3168]
 21f2154:	aa1303e0 	mov	x0, x19
 21f2158:	9788d1ba 	bl	426840 <__cxa_guard_release@plt>
 21f215c:	17ffffc8 	b	21f207c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69f64>
 21f2160:	aa1503e0 	mov	x0, x21
 21f2164:	9000ca97 	adrp	x23, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 21f2168:	9788d03e 	bl	426260 <__cxa_guard_acquire@plt>
 21f216c:	34fffae0 	cbz	w0, 21f20c8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69fb0>
 21f2170:	9792f9e6 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 21f2174:	b90e22e0 	str	w0, [x23,#3616]
 21f2178:	aa1503e0 	mov	x0, x21
 21f217c:	9788d1b1 	bl	426840 <__cxa_guard_release@plt>
 21f2180:	17ffffd2 	b	21f20c8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69fb0>
