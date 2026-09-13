
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f21b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6a098>:
 21f21b0:	9000ca95 	adrp	x21, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 21f21b4:	913862b5 	add	x21, x21, #0xe18
 21f21b8:	f9001bf7 	str	x23, [sp,#48]
 21f21bc:	f9000261 	str	x1, [x19]
 21f21c0:	9788cae0 	bl	424d40 <_Znwm@plt>
 21f21c4:	aa0003f4 	mov	x20, x0
 21f21c8:	91004016 	add	x22, x0, #0x10
 21f21cc:	b0001ea0 	adrp	x0, 25c7000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x41a8>
 21f21d0:	911c6000 	add	x0, x0, #0x718
 21f21d4:	b20003e1 	mov	x1, #0x100000001           	// #4294967297
 21f21d8:	a9000680 	stp	x0, x1, [x20]
 21f21dc:	f9000a9f 	str	xzr, [x20,#16]
 21f21e0:	b9000adf 	str	wzr, [x22,#8]
 21f21e4:	08dffea0 	ldarb	w0, [x21]
 21f21e8:	9000ca97 	adrp	x23, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 21f21ec:	36000260 	tbz	w0, #0, 21f2238 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6a120>
 21f21f0:	b94e22e3 	ldr	w3, [x23,#3616]
 21f21f4:	b0006382 	adrp	x2, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f21f8:	913d8042 	add	x2, x2, #0xf60
 21f21fc:	b0006380 	adrp	x0, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f2200:	913ec000 	add	x0, x0, #0xfb0
 21f2204:	b00063a1 	adrp	x1, 2e67000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a41a8>
 21f2208:	91292021 	add	x1, x1, #0xa48
 21f220c:	f9000a81 	str	x1, [x20,#16]
 21f2210:	f9401bf7 	ldr	x23, [sp,#48]
 21f2214:	a9005a62 	stp	x2, x22, [x19]
 21f2218:	a9017e74 	stp	x20, xzr, [x19,#16]
 21f221c:	a902027f 	stp	xzr, x0, [x19,#32]
 21f2220:	f9001a7f 	str	xzr, [x19,#48]
 21f2224:	b9001a83 	str	w3, [x20,#24]
 21f2228:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f222c:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21f2230:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21f2234:	d65f03c0 	ret
 21f2238:	aa1503e0 	mov	x0, x21
 21f223c:	9000ca97 	adrp	x23, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 21f2240:	9788d008 	bl	426260 <__cxa_guard_acquire@plt>
 21f2244:	34fffd60 	cbz	w0, 21f21f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6a0d8>
 21f2248:	9792f9b0 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 21f224c:	b90e22e0 	str	w0, [x23,#3616]
 21f2250:	aa1503e0 	mov	x0, x21
 21f2254:	9788d17b 	bl	426840 <__cxa_guard_release@plt>
 21f2258:	17ffffe6 	b	21f21f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6a0d8>
 21f225c:	d503201f 	nop
 21f2260:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 21f2264:	b0006382 	adrp	x2, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f2268:	91130042 	add	x2, x2, #0x4c0
 21f226c:	910003fd 	mov	x29, sp
 21f2270:	a90153f3 	stp	x19, x20, [sp,#16]
 21f2274:	aa0003f3 	mov	x19, x0
 21f2278:	9000cf34 	adrp	x20, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f227c:	9134a294 	add	x20, x20, #0xd28
 21f2280:	a9025bf5 	stp	x21, x22, [sp,#32]
 21f2284:	52800415 	mov	w21, #0x20                  	// #32
 21f2288:	a90363f7 	stp	x23, x24, [sp,#48]
 21f228c:	aa0103f8 	mov	x24, x1
 21f2290:	f8008402 	str	x2, [x0],#8
 21f2294:	97ffffbf 	bl	21f2190 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6a078>
 21f2298:	91010260 	add	x0, x19, #0x40
 21f229c:	9404e6a1 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 21f22a0:	b900827f 	str	wzr, [x19,#128]
 21f22a4:	d280c400 	mov	x0, #0x620                 	// #1568
 21f22a8:	b9009a7f 	str	wzr, [x19,#152]
 21f22ac:	b900b27f 	str	wzr, [x19,#176]
 21f22b0:	9788cb48 	bl	424fd0 <malloc@plt>
 21f22b4:	f9005260 	str	x0, [x19,#160]
 21f22b8:	52800700 	mov	w0, #0x38                  	// #56
 21f22bc:	b900aa60 	str	w0, [x19,#168]
 21f22c0:	d2802000 	mov	x0, #0x100                 	// #256
 21f22c4:	9788cb43 	bl	424fd0 <malloc@plt>
 21f22c8:	f9003a60 	str	x0, [x19,#112]
 21f22cc:	b9007a75 	str	w21, [x19,#120]
 21f22d0:	d2802000 	mov	x0, #0x100                 	// #256
 21f22d4:	9788cb3f 	bl	424fd0 <malloc@plt>
 21f22d8:	f9004660 	str	x0, [x19,#136]
 21f22dc:	b0006380 	adrp	x0, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f22e0:	9113c000 	add	x0, x0, #0x4f0
 21f22e4:	f9000260 	str	x0, [x19]
 21f22e8:	b9009275 	str	w21, [x19,#144]
 21f22ec:	f9005e7f 	str	xzr, [x19,#184]
 21f22f0:	08dffe80 	ldarb	w0, [x20]
 21f22f4:	9000cf35 	adrp	x21, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f22f8:	36000300 	tbz	w0, #0, 21f2358 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6a240>
 21f22fc:	b94d32a1 	ldr	w1, [x21,#3376]
 21f2300:	52800023 	mov	w3, #0x1                   	// #1
 21f2304:	b0006382 	adrp	x2, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f2308:	9114a042 	add	x2, x2, #0x528
 21f230c:	b0006380 	adrp	x0, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f2310:	91170000 	add	x0, x0, #0x5c0
 21f2314:	f9000262 	str	x2, [x19]
 21f2318:	f9006260 	str	x0, [x19,#192]
 21f231c:	b900ca61 	str	w1, [x19,#200]
 21f2320:	f9006a78 	str	x24, [x19,#208]
 21f2324:	3903627f 	strb	wzr, [x19,#216]
 21f2328:	b900de7f 	str	wzr, [x19,#220]
 21f232c:	f900727f 	str	xzr, [x19,#224]
