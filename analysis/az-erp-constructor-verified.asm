
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002142660 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9427d8>:
 2142660:	a9ba7bfd 	stp	x29, x30, [sp,#-96]!
 2142664:	f0006801 	adrp	x1, 2e45000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8821a8>
 2142668:	911d6021 	add	x1, x1, #0x758
 214266c:	910003fd 	mov	x29, sp
 2142670:	a90153f3 	stp	x19, x20, [sp,#16]
 2142674:	aa0003f3 	mov	x19, x0
 2142678:	f0006800 	adrp	x0, 2e45000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8821a8>
 214267c:	a9025bf5 	stp	x21, x22, [sp,#32]
 2142680:	911c6000 	add	x0, x0, #0x718
 2142684:	9100c275 	add	x21, x19, #0x30
 2142688:	f9001bf7 	str	x23, [sp,#48]
 214268c:	a9000660 	stp	x0, x1, [x19]
 2142690:	aa1503e0 	mov	x0, x21
 2142694:	52800001 	mov	w1, #0x0                   	// #0
 2142698:	a9017e7f 	stp	xzr, xzr, [x19,#16]
 214269c:	a9027e7f 	stp	xzr, xzr, [x19,#32]
 21426a0:	94000e6e 	bl	2146058 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9461d0>
 21426a4:	91064277 	add	x23, x19, #0x190
 21426a8:	52800021 	mov	w1, #0x1                   	// #1
 21426ac:	aa1703e0 	mov	x0, x23
 21426b0:	94000e6a 	bl	2146058 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9461d0>
 21426b4:	d2966ee1 	mov	x1, #0xb377                	// #45943
 21426b8:	d2801c00 	mov	x0, #0xe0                  	// #224
 21426bc:	f2a9f041 	movk	x1, #0x4f82, lsl #16
 21426c0:	f2cbfd01 	movk	x1, #0x5fe8, lsl #32
 21426c4:	f2e02d01 	movk	x1, #0x168, lsl #48
 21426c8:	f9002fe1 	str	x1, [sp,#88]
 21426cc:	978b899d 	bl	424d40 <_Znwm@plt>
 21426d0:	d2966ee1 	mov	x1, #0xb377                	// #45943
 21426d4:	aa0003f4 	mov	x20, x0
 21426d8:	f2a9f041 	movk	x1, #0x4f82, lsl #16
 21426dc:	f2cbfd01 	movk	x1, #0x5fe8, lsl #32
 21426e0:	f2e02d01 	movk	x1, #0x168, lsl #48
 21426e4:	9402c483 	bl	21f38f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6b7d8>
 21426e8:	f9400a60 	ldr	x0, [x19,#16]
 21426ec:	f9000a74 	str	x20, [x19,#16]
 21426f0:	91004276 	add	x22, x19, #0x10
 21426f4:	b40000c0 	cbz	x0, 214270c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x942884>
 21426f8:	f9400001 	ldr	x1, [x0]
 21426fc:	f9400421 	ldr	x1, [x1,#8]
 2142700:	d63f0020 	blr	x1
 2142704:	f9400a74 	ldr	x20, [x19,#16]
 2142708:	b4000054 	cbz	x20, 2142710 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x942888>
 214270c:	91030294 	add	x20, x20, #0xc0
 2142710:	aa1403e1 	mov	x1, x20
 2142714:	910163e0 	add	x0, sp, #0x58
 2142718:	9400079e 	bl	2144590 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944708>
 214271c:	d291b661 	mov	x1, #0x8db3                	// #36275
 2142720:	d2801c00 	mov	x0, #0xe0                  	// #224
 2142724:	f2abc1a1 	movk	x1, #0x5e0d, lsl #16
 2142728:	f2ce9bc1 	movk	x1, #0x74de, lsl #32
 214272c:	f2e00381 	movk	x1, #0x1c, lsl #48
 2142730:	f9002be1 	str	x1, [sp,#80]
 2142734:	978b8983 	bl	424d40 <_Znwm@plt>
 2142738:	d291b661 	mov	x1, #0x8db3                	// #36275
 214273c:	aa0003f4 	mov	x20, x0
 2142740:	f2abc1a1 	movk	x1, #0x5e0d, lsl #16
 2142744:	f2ce9bc1 	movk	x1, #0x74de, lsl #32
 2142748:	f2e00381 	movk	x1, #0x1c, lsl #48
 214274c:	9402c469 	bl	21f38f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6b7d8>
 2142750:	f9400e60 	ldr	x0, [x19,#24]
 2142754:	f9000e74 	str	x20, [x19,#24]
 2142758:	b40000c0 	cbz	x0, 2142770 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9428e8>
 214275c:	f9400001 	ldr	x1, [x0]
 2142760:	f9400421 	ldr	x1, [x1,#8]
 2142764:	d63f0020 	blr	x1
 2142768:	f9400e74 	ldr	x20, [x19,#24]
 214276c:	b4000054 	cbz	x20, 2142774 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9428ec>
 2142770:	91030294 	add	x20, x20, #0xc0
 2142774:	aa1403e1 	mov	x1, x20
 2142778:	910143e0 	add	x0, sp, #0x50
 214277c:	94000785 	bl	2144590 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944708>
 2142780:	d29f4361 	mov	x1, #0xfa1b                	// #64027
 2142784:	d2801c00 	mov	x0, #0xe0                  	// #224
 2142788:	f2b27ea1 	movk	x1, #0x93f5, lsl #16
 214278c:	f2d32ea1 	movk	x1, #0x9975, lsl #32
 2142790:	f2e007e1 	movk	x1, #0x3f, lsl #48
 2142794:	f90027e1 	str	x1, [sp,#72]
 2142798:	978b896a 	bl	424d40 <_Znwm@plt>
 214279c:	d29f4361 	mov	x1, #0xfa1b                	// #64027
 21427a0:	aa0003f4 	mov	x20, x0
 21427a4:	f2b27ea1 	movk	x1, #0x93f5, lsl #16
 21427a8:	f2d32ea1 	movk	x1, #0x9975, lsl #32
 21427ac:	f2e007e1 	movk	x1, #0x3f, lsl #48
 21427b0:	9402c450 	bl	21f38f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6b7d8>
 21427b4:	f9401260 	ldr	x0, [x19,#32]
 21427b8:	f9001274 	str	x20, [x19,#32]
 21427bc:	b40000c0 	cbz	x0, 21427d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x94294c>
 21427c0:	f9400001 	ldr	x1, [x0]
 21427c4:	f9400421 	ldr	x1, [x1,#8]
 21427c8:	d63f0020 	blr	x1
 21427cc:	f9401274 	ldr	x20, [x19,#32]
 21427d0:	b4000054 	cbz	x20, 21427d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x942950>
 21427d4:	91030294 	add	x20, x20, #0xc0
 21427d8:	aa1403e1 	mov	x1, x20
 21427dc:	910123e0 	add	x0, sp, #0x48
 21427e0:	9400076c 	bl	2144590 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944708>
 21427e4:	d286ce81 	mov	x1, #0x3674                	// #13940
 21427e8:	d2801c00 	mov	x0, #0xe0                  	// #224
 21427ec:	f2b283a1 	movk	x1, #0x941d, lsl #16
 21427f0:	f2d32ea1 	movk	x1, #0x9975, lsl #32
 21427f4:	f2e007e1 	movk	x1, #0x3f, lsl #48
 21427f8:	f90023e1 	str	x1, [sp,#64]
 21427fc:	978b8951 	bl	424d40 <_Znwm@plt>
 2142800:	d286ce81 	mov	x1, #0x3674                	// #13940
 2142804:	aa0003f4 	mov	x20, x0
 2142808:	f2b283a1 	movk	x1, #0x941d, lsl #16
 214280c:	f2d32ea1 	movk	x1, #0x9975, lsl #32
