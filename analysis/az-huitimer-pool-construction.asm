
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f1790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69678>:
 21f1790:	b9001262 	str	w2, [x19,#16]
 21f1794:	f9000e7f 	str	xzr, [x19,#24]
 21f1798:	f9400bf3 	ldr	x19, [sp,#16]
 21f179c:	a8c27bfd 	ldp	x29, x30, [sp],#32
 21f17a0:	d65f03c0 	ret
 21f17a4:	d503201f 	nop
 21f17a8:	d503201f 	nop
 21f17ac:	d503201f 	nop
 21f17b0:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21f17b4:	910003fd 	mov	x29, sp
 21f17b8:	a90153f3 	stp	x19, x20, [sp,#16]
 21f17bc:	aa0003f3 	mov	x19, x0
 21f17c0:	94068f50 	bl	2395500 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x200e0>
 21f17c4:	f0006381 	adrp	x1, 2e64000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a11a8>
 21f17c8:	91084021 	add	x1, x1, #0x210
 21f17cc:	f900067f 	str	xzr, [x19,#8]
 21f17d0:	91008274 	add	x20, x19, #0x20
 21f17d4:	b900127f 	str	wzr, [x19,#16]
 21f17d8:	d2800300 	mov	x0, #0x18                  	// #24
 21f17dc:	b900167f 	str	wzr, [x19,#20]
 21f17e0:	f9000261 	str	x1, [x19]
 21f17e4:	b9001a7f 	str	wzr, [x19,#24]
 21f17e8:	b9001e7f 	str	wzr, [x19,#28]
 21f17ec:	f900127f 	str	xzr, [x19,#32]
 21f17f0:	9788cd54 	bl	424d40 <_Znwm@plt>
 21f17f4:	aa0003f3 	mov	x19, x0
 21f17f8:	9793026c 	bl	6b21a8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x21618>
 21f17fc:	f0006381 	adrp	x1, 2e64000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a11a8>
 21f1800:	9107a021 	add	x1, x1, #0x1e8
 21f1804:	91003262 	add	x2, x19, #0xc
 21f1808:	b9000a60 	str	w0, [x19,#8]
 21f180c:	5289eb00 	mov	w0, #0x4f58                	// #20312
 21f1810:	72aa4860 	movk	w0, #0x5243, lsl #16
 21f1814:	f9000261 	str	x1, [x19]
 21f1818:	b9000e7f 	str	wzr, [x19,#12]
 21f181c:	b9001260 	str	w0, [x19,#16]
 21f1820:	c8dffe81 	ldar	x1, [x20]
 21f1824:	eb01027f 	cmp	x19, x1
 21f1828:	540001e0 	b.eq	21f1864 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6974c>
 21f182c:	b9401261 	ldr	w1, [x19,#16]
 21f1830:	f90013f5 	str	x21, [sp,#32]
 21f1834:	6b00003f 	cmp	w1, w0
 21f1838:	540002a0 	b.eq	21f188c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69774>
 21f183c:	c85ffe95 	ldaxr	x21, [x20]
 21f1840:	c800fe93 	stlxr	w0, x19, [x20]
 21f1844:	35ffffc0 	cbnz	w0, 21f183c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69724>
 21f1848:	b40000d5 	cbz	x21, 21f1860 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69748>
 21f184c:	aa1503e0 	mov	x0, x21
 21f1850:	9792fd5a 	bl	6b0db8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x20228>
 21f1854:	72001c1f 	tst	w0, #0xff
 21f1858:	540000c1 	b.ne	21f1870 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69758>
 21f185c:	d503201f 	nop
 21f1860:	f94013f5 	ldr	x21, [sp,#32]
 21f1864:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f1868:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21f186c:	d65f03c0 	ret
 21f1870:	f94002a1 	ldr	x1, [x21]
 21f1874:	aa1503e0 	mov	x0, x21
 21f1878:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f187c:	f94013f5 	ldr	x21, [sp,#32]
 21f1880:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21f1884:	f9400421 	ldr	x1, [x1,#8]
 21f1888:	d61f0020 	br	x1
 21f188c:	885ffc40 	ldaxr	w0, [x2]
 21f1890:	11000400 	add	w0, w0, #0x1
 21f1894:	8801fc40 	stlxr	w1, w0, [x2]
 21f1898:	35ffffa1 	cbnz	w1, 21f188c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69774>
 21f189c:	17ffffe8 	b	21f183c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69724>
 21f18a0:	f90013f5 	str	x21, [sp,#32]
 21f18a4:	aa0003f5 	mov	x21, x0
 21f18a8:	aa1403e0 	mov	x0, x20
 21f18ac:	94002369 	bl	21fa650 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x72538>
 21f18b0:	aa1303e0 	mov	x0, x19
 21f18b4:	94068d4b 	bl	2394de0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x1f9c0>
 21f18b8:	aa1503e0 	mov	x0, x21
 21f18bc:	9788cd15 	bl	424d10 <_Unwind_Resume@plt>
 21f18c0:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21f18c4:	aa0003e1 	mov	x1, x0
 21f18c8:	910003fd 	mov	x29, sp
 21f18cc:	a90153f3 	stp	x19, x20, [sp,#16]
 21f18d0:	b000cf34 	adrp	x20, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f18d4:	f946da93 	ldr	x19, [x20,#3504]
 21f18d8:	b40000b3 	cbz	x19, 21f18ec <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x697d4>
 21f18dc:	aa1303e0 	mov	x0, x19
 21f18e0:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f18e4:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21f18e8:	17fffc3e 	b	21f09e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x688c8>
 21f18ec:	d2800500 	mov	x0, #0x28                  	// #40
 21f18f0:	f90017e1 	str	x1, [sp,#40]
 21f18f4:	9788cd13 	bl	424d40 <_Znwm@plt>
 21f18f8:	aa0003f3 	mov	x19, x0
 21f18fc:	97ffffad 	bl	21f17b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69698>
 21f1900:	f906da93 	str	x19, [x20,#3504]
 21f1904:	aa1303e0 	mov	x0, x19
 21f1908:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f190c:	f94017e1 	ldr	x1, [sp,#40]
 21f1910:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21f1914:	17fffc33 	b	21f09e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x688c8>
 21f1918:	d503201f 	nop
 21f191c:	d503201f 	nop
