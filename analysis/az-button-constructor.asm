
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f38f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6b7d8>:
 21f38f0:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 21f38f4:	90006382 	adrp	x2, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f38f8:	9107a042 	add	x2, x2, #0x1e8
 21f38fc:	910003fd 	mov	x29, sp
 21f3900:	a90153f3 	stp	x19, x20, [sp,#16]
 21f3904:	aa0003f3 	mov	x19, x0
 21f3908:	91022014 	add	x20, x0, #0x88
 21f390c:	a9025bf5 	stp	x21, x22, [sp,#32]
 21f3910:	9101c015 	add	x21, x0, #0x70
 21f3914:	f9001bf7 	str	x23, [sp,#48]
 21f3918:	aa0103f7 	mov	x23, x1
 21f391c:	f8008402 	str	x2, [x0],#8
 21f3920:	97fffa1c 	bl	21f2190 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6a078>
 21f3924:	91010260 	add	x0, x19, #0x40
 21f3928:	9404e0fe 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 21f392c:	f9003a7f 	str	xzr, [x19,#112]
 21f3930:	d2800700 	mov	x0, #0x38                  	// #56
 21f3934:	b9007a7f 	str	wzr, [x19,#120]
 21f3938:	b900827f 	str	wzr, [x19,#128]
 21f393c:	f900467f 	str	xzr, [x19,#136]
 21f3940:	b900927f 	str	wzr, [x19,#144]
 21f3944:	b9009a7f 	str	wzr, [x19,#152]
 21f3948:	b900b27f 	str	wzr, [x19,#176]
 21f394c:	9788c5a1 	bl	424fd0 <malloc@plt>
 21f3950:	f9005260 	str	x0, [x19,#160]
 21f3954:	52800700 	mov	w0, #0x38                  	// #56
 21f3958:	b900aa60 	str	w0, [x19,#168]
 21f395c:	52800401 	mov	w1, #0x20                  	// #32
 21f3960:	aa1503e0 	mov	x0, x21
 21f3964:	97ffe9c7 	bl	21ee080 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x65f68>
 21f3968:	b9409260 	ldr	w0, [x19,#144]
 21f396c:	71003c1f 	cmp	w0, #0xf
 21f3970:	5400008c 	b.gt	21f3980 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6b868>
 21f3974:	aa1403e0 	mov	x0, x20
 21f3978:	52800401 	mov	w1, #0x20                  	// #32
 21f397c:	97ffe9c1 	bl	21ee080 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x65f68>
 21f3980:	90006395 	adrp	x21, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f3984:	910862b5 	add	x21, x21, #0x218
 21f3988:	f000cdd4 	adrp	x20, 3bae000 <stdout@@GLIBC_2.17+0x6cf40>
 21f398c:	91002294 	add	x20, x20, #0x8
 21f3990:	f9000275 	str	x21, [x19]
 21f3994:	f9005e7f 	str	xzr, [x19,#184]
 21f3998:	08dffe80 	ldarb	w0, [x20]
 21f399c:	f000cdd6 	adrp	x22, 3bae000 <stdout@@GLIBC_2.17+0x6cf40>
 21f39a0:	360005a0 	tbz	w0, #0, 21f3a54 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6b93c>
 21f39a4:	b94012c2 	ldr	w2, [x22,#16]
 21f39a8:	90006381 	adrp	x1, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f39ac:	9109e021 	add	x1, x1, #0x278
 21f39b0:	90006380 	adrp	x0, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f39b4:	910b4000 	add	x0, x0, #0x2d0
 21f39b8:	f9000261 	str	x1, [x19]
 21f39bc:	f9006260 	str	x0, [x19,#192]
 21f39c0:	d2800200 	mov	x0, #0x10                  	// #16
 21f39c4:	b900ca62 	str	w2, [x19,#200]
 21f39c8:	f9006a77 	str	x23, [x19,#208]
 21f39cc:	3903627f 	strb	wzr, [x19,#216]
 21f39d0:	9788c4dc 	bl	424d40 <_Znwm@plt>
 21f39d4:	aa0003f5 	mov	x21, x0
 21f39d8:	d000cdf4 	adrp	x20, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 21f39dc:	91318294 	add	x20, x20, #0xc60
