
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000009837c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78bb0>:
  9837c8:	d63f00c0 	blr	x6
  9837cc:	f9400281 	ldr	x1, [x20]
  9837d0:	91016268 	add	x8, x19, #0x58
  9837d4:	aa1403e0 	mov	x0, x20
  9837d8:	f940a421 	ldr	x1, [x1,#328]
  9837dc:	d63f0020 	blr	x1
  9837e0:	f9400281 	ldr	x1, [x20]
  9837e4:	aa1403e0 	mov	x0, x20
  9837e8:	9101a268 	add	x8, x19, #0x68
  9837ec:	f940a021 	ldr	x1, [x1,#320]
  9837f0:	d63f0020 	blr	x1
  9837f4:	f9402674 	ldr	x20, [x19,#72]
  9837f8:	b4003274 	cbz	x20, 983e44 <_ZSt20__throw_bad_weak_ptrv@@Base+0x7922c>
  9837fc:	f9400a96 	ldr	x22, [x20,#16]
  983800:	b4000cb6 	cbz	x22, 983994 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78d7c>
  983804:	91008298 	add	x24, x20, #0x20
  983808:	d2800400 	mov	x0, #0x20                  	// #32
  98380c:	97ea854d 	bl	424d40 <_Znwm@plt>
  983810:	aa0003f7 	mov	x23, x0
  983814:	b9402a81 	ldr	w1, [x20,#40]
  983818:	d2800800 	mov	x0, #0x40                  	// #64
  98381c:	b90002e1 	str	w1, [x23]
  983820:	97ea85ec 	bl	424fd0 <malloc@plt>
  983824:	aa0003e2 	mov	x2, x0
  983828:	aa1703e1 	mov	x1, x23
  98382c:	91002265 	add	x5, x19, #0x8
  983830:	52800104 	mov	w4, #0x8                   	// #8
  983834:	52800023 	mov	w3, #0x1                   	// #1
  983838:	f9000045 	str	x5, [x2]
  98383c:	d2800400 	mov	x0, #0x20                  	// #32
  983840:	f8008c22 	str	x2, [x1,#8]!
  983844:	b9000824 	str	w4, [x1,#8]
  983848:	b9001023 	str	w3, [x1,#16]
  98384c:	97ea853d 	bl	424d40 <_Znwm@plt>
  983850:	aa0003f5 	mov	x21, x0
  983854:	b000e581 	adrp	x1, 2634000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x711a8>
  983858:	912aa021 	add	x1, x1, #0xaa8
  98385c:	d2800200 	mov	x0, #0x10                  	// #16
  983860:	f90002a1 	str	x1, [x21]
  983864:	b9000abf 	str	wzr, [x21,#8]
  983868:	a9015ebf 	stp	xzr, x23, [x21,#16]
  98386c:	97ea8535 	bl	424d40 <_Znwm@plt>
  983870:	f9400aa2 	ldr	x2, [x21,#16]
  983874:	f000e581 	adrp	x1, 2636000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x731a8>
  983878:	912dc021 	add	x1, x1, #0xb70
  98387c:	a9005c01 	stp	x1, x23, [x0]
  983880:	f9000aa0 	str	x0, [x21,#16]
  983884:	b40000a2 	cbz	x2, 983898 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78c80>
  983888:	f9400041 	ldr	x1, [x2]
  98388c:	aa0203e0 	mov	x0, x2
  983890:	f9400421 	ldr	x1, [x1,#8]
  983894:	d63f0020 	blr	x1
  983898:	910022b7 	add	x23, x21, #0x8
  98389c:	885ffee0 	ldaxr	w0, [x23]
  9838a0:	11000400 	add	w0, w0, #0x1
  9838a4:	8801fee0 	stlxr	w1, w0, [x23]
  9838a8:	35ffffa1 	cbnz	w1, 98389c <_ZSt20__throw_bad_weak_ptrv@@Base+0x78c84>
  9838ac:	910323f4 	add	x20, sp, #0xc8
  9838b0:	aa1803e1 	mov	x1, x24
  9838b4:	aa1403e0 	mov	x0, x20
  9838b8:	f94006d8 	ldr	x24, [x22,#8]
  9838bc:	94662ac9 	bl	230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862c8>
  9838c0:	a90d57f6 	stp	x22, x21, [sp,#208]
  9838c4:	885ffee0 	ldaxr	w0, [x23]
  9838c8:	11000400 	add	w0, w0, #0x1
  9838cc:	8801fee0 	stlxr	w1, w0, [x23]
  9838d0:	35ffffa1 	cbnz	w1, 9838c4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78cac>
  9838d4:	f9400301 	ldr	x1, [x24]
  9838d8:	aa1803e0 	mov	x0, x24
  9838dc:	f9401421 	ldr	x1, [x1,#40]
  9838e0:	d63f0020 	blr	x1
  9838e4:	72001c1f 	tst	w0, #0xff
  9838e8:	540027a0 	b.eq	983ddc <_ZSt20__throw_bad_weak_ptrv@@Base+0x791c4>
  9838ec:	f9400302 	ldr	x2, [x24]
  9838f0:	aa1403e1 	mov	x1, x20
  9838f4:	aa1803e0 	mov	x0, x24
  9838f8:	f9401856 	ldr	x22, [x2,#48]
  9838fc:	940007ff 	bl	9858f8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x7ace0>
  983900:	aa0003e1 	mov	x1, x0
  983904:	aa1803e0 	mov	x0, x24
  983908:	d63f02c0 	blr	x22
  98390c:	b4000360 	cbz	x0, 983978 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78d60>
  983910:	f9400f00 	ldr	x0, [x24,#24]
  983914:	b4000320 	cbz	x0, 983978 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78d60>
  983918:	94627602 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
  98391c:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
  983920:	9000e281 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  983924:	91196021 	add	x1, x1, #0x658
  983928:	f9002fe1 	str	x1, [sp,#88]
  98392c:	fd0033e0 	str	d0, [sp,#96]
  983930:	72001c1f 	tst	w0, #0xff
  983934:	2f00e400 	movi	d0, #0x0
  983938:	540000c0 	b.eq	983950 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78d38>
  98393c:	900192a0 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
  983940:	394de000 	ldrb	w0, [x0,#888]
  983944:	35000060 	cbnz	w0, 983950 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78d38>
  983948:	9466ab6a 	bl	232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a65d8>
  98394c:	d503201f 	nop
  983950:	f90043ff 	str	xzr, [sp,#128]
  983954:	fd0037e0 	str	d0, [sp,#104]
  983958:	f9400f01 	ldr	x1, [x24,#24]
  98395c:	aa0103e0 	mov	x0, x1
  983960:	f9400021 	ldr	x1, [x1]
  983964:	f9400821 	ldr	x1, [x1,#16]
  983968:	d63f0020 	blr	x1
  98396c:	910163e0 	add	x0, sp, #0x58
  983970:	97f4fd02 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
  983974:	d503201f 	nop
  983978:	f9406fe0 	ldr	x0, [sp,#216]
  98397c:	b4000040 	cbz	x0, 983984 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78d6c>
  983980:	97fff8d6 	bl	981cd8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x770c0>
  983984:	aa1403e0 	mov	x0, x20
  983988:	9465e382 	bl	22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x174678>
  98398c:	aa1503e0 	mov	x0, x21
  983990:	97fff8d2 	bl	981cd8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x770c0>
  983994:	f9402e74 	ldr	x20, [x19,#88]
  983998:	b4002bd4 	cbz	x20, 983f10 <_ZSt20__throw_bad_weak_ptrv@@Base+0x792f8>
  98399c:	f9400a96 	ldr	x22, [x20,#16]
  9839a0:	b4000cb6 	cbz	x22, 983b34 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78f1c>
  9839a4:	91008298 	add	x24, x20, #0x20
  9839a8:	d2800400 	mov	x0, #0x20                  	// #32
  9839ac:	97ea84e5 	bl	424d40 <_Znwm@plt>
  9839b0:	aa0003f7 	mov	x23, x0
  9839b4:	b9402a81 	ldr	w1, [x20,#40]
  9839b8:	d2800800 	mov	x0, #0x40                  	// #64
  9839bc:	b90002e1 	str	w1, [x23]
  9839c0:	97ea8584 	bl	424fd0 <malloc@plt>
  9839c4:	aa0003e2 	mov	x2, x0
  9839c8:	aa1703e1 	mov	x1, x23
  9839cc:	91006265 	add	x5, x19, #0x18
  9839d0:	52800104 	mov	w4, #0x8                   	// #8
  9839d4:	52800023 	mov	w3, #0x1                   	// #1
  9839d8:	f9000045 	str	x5, [x2]
  9839dc:	d2800400 	mov	x0, #0x20                  	// #32
  9839e0:	f8008c22 	str	x2, [x1,#8]!
  9839e4:	b9000824 	str	w4, [x1,#8]
  9839e8:	b9001023 	str	w3, [x1,#16]
  9839ec:	97ea84d5 	bl	424d40 <_Znwm@plt>
  9839f0:	aa0003f5 	mov	x21, x0
  9839f4:	b000e581 	adrp	x1, 2634000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x711a8>
  9839f8:	912c6021 	add	x1, x1, #0xb18
  9839fc:	d2800200 	mov	x0, #0x10                  	// #16
  983a00:	f90002a1 	str	x1, [x21]
  983a04:	b9000abf 	str	wzr, [x21,#8]
  983a08:	a9015ebf 	stp	xzr, x23, [x21,#16]
  983a0c:	97ea84cd 	bl	424d40 <_Znwm@plt>
  983a10:	f9400aa2 	ldr	x2, [x21,#16]
  983a14:	f000e581 	adrp	x1, 2636000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x731a8>
  983a18:	912f4021 	add	x1, x1, #0xbd0
  983a1c:	a9005c01 	stp	x1, x23, [x0]
  983a20:	f9000aa0 	str	x0, [x21,#16]
  983a24:	b40000a2 	cbz	x2, 983a38 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78e20>
  983a28:	f9400041 	ldr	x1, [x2]
  983a2c:	aa0203e0 	mov	x0, x2
