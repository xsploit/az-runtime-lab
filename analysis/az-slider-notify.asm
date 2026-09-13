
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f4950 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6c838>:
 21f4950:	90001e64 	adrp	x4, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 21f4954:	912a7084 	add	x4, x4, #0xa9c
 21f4958:	91002025 	add	x5, x1, #0x8
 21f495c:	eb0400bf 	cmp	x5, x4
 21f4960:	54000243 	b.cc	21f49a8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6c890>
 21f4964:	f24004bf 	tst	x5, #0x3
 21f4968:	54000201 	b.ne	21f49a8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6c890>
 21f496c:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21f4970:	910003fd 	mov	x29, sp
 21f4974:	a9025bf5 	stp	x21, x22, [sp,#32]
 21f4978:	aa0203f5 	mov	x21, x2
 21f497c:	b9400836 	ldr	w22, [x1,#8]
 21f4980:	a90153f3 	stp	x19, x20, [sp,#16]
 21f4984:	aa0003f4 	mov	x20, x0
 21f4988:	aa0103f3 	mov	x19, x1
 21f498c:	94001b25 	bl	21fb620 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x73508>
 21f4990:	6b0002df 	cmp	w22, w0
 21f4994:	540000c0 	b.eq	21f49ac <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6c894>
 21f4998:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f499c:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21f49a0:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21f49a4:	d65f03c0 	ret
 21f49a8:	d65f03c0 	ret
 21f49ac:	f9400281 	ldr	x1, [x20]
 21f49b0:	f0000000 	adrp	x0, 21f7000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6eee8>
 21f49b4:	91154000 	add	x0, x0, #0x550
 21f49b8:	f9400262 	ldr	x2, [x19]
 21f49bc:	f9401421 	ldr	x1, [x1,#40]
 21f49c0:	f9400856 	ldr	x22, [x2,#16]
 21f49c4:	eb00003f 	cmp	x1, x0
 21f49c8:	54000161 	b.ne	21f49f4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6c8dc>
 21f49cc:	f9406a80 	ldr	x0, [x20,#208]
 21f49d0:	d0ffffe1 	adrp	x1, 21f2000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69ee8>
 21f49d4:	913b0021 	add	x1, x1, #0xec0
 21f49d8:	eb0102df 	cmp	x22, x1
 21f49dc:	54000121 	b.ne	21f4a00 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6c8e8>
 21f49e0:	d1010260 	sub	x0, x19, #0x40
 21f49e4:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f49e8:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21f49ec:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21f49f0:	17fff810 	b	21f2a30 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6a918>
 21f49f4:	aa1403e0 	mov	x0, x20
 21f49f8:	d63f0020 	blr	x1
 21f49fc:	17fffff5 	b	21f49d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6c8b8>
 21f4a00:	aa1503e3 	mov	x3, x21
 21f4a04:	aa0003e2 	mov	x2, x0
 21f4a08:	91030281 	add	x1, x20, #0xc0
 21f4a0c:	aa1303e0 	mov	x0, x19
 21f4a10:	aa1603e4 	mov	x4, x22
 21f4a14:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f4a18:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21f4a1c:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21f4a20:	d61f0080 	br	x4
 21f4a24:	d503201f 	nop
 21f4a28:	d503201f 	nop
 21f4a2c:	d503201f 	nop
