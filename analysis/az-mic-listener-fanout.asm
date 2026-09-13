
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000089d600 <_ZNSt5mutex4lockEv@@Base+0x69350>:
  89d600:	aa0003e3 	mov	x3, x0
  89d604:	a9b67bfd 	stp	x29, x30, [sp,#-160]!
  89d608:	910003fd 	mov	x29, sp
  89d60c:	f8408c64 	ldr	x4, [x3,#8]!
  89d610:	a9025bf5 	stp	x21, x22, [sp,#32]
  89d614:	b9801075 	ldrsw	x21, [x3,#16]
  89d618:	8b150c95 	add	x21, x4, x21, lsl #3
  89d61c:	eb0402bf 	cmp	x21, x4
  89d620:	54000920 	b.eq	89d744 <_ZNSt5mutex4lockEv@@Base+0x69494>
  89d624:	b000ecd6 	adrp	x22, 2636000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x731a8>
  89d628:	913142d6 	add	x22, x22, #0xc50
  89d62c:	910342d6 	add	x22, x22, #0xd0
  89d630:	a90153f3 	stp	x19, x20, [sp,#16]
  89d634:	aa0403f3 	mov	x19, x4
  89d638:	a90363f7 	stp	x23, x24, [sp,#48]
  89d63c:	f000e917 	adrp	x23, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
  89d640:	9000e938 	adrp	x24, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  89d644:	912a72f7 	add	x23, x23, #0xa9c
  89d648:	9136a318 	add	x24, x24, #0xda8
  89d64c:	a9046bf9 	stp	x25, x26, [sp,#64]
  89d650:	aa0203fa 	mov	x26, x2
  89d654:	a90573fb 	stp	x27, x28, [sp,#80]
  89d658:	aa0103fb 	mov	x27, x1
  89d65c:	f90033e0 	str	x0, [sp,#96]
  89d660:	f9400274 	ldr	x20, [x19]
  89d664:	91002283 	add	x3, x20, #0x8
  89d668:	eb0302ff 	cmp	x23, x3
  89d66c:	540001a8 	b.hi	89d6a0 <_ZNSt5mutex4lockEv@@Base+0x693f0>
  89d670:	f240047f 	tst	x3, #0x3
  89d674:	54000161 	b.ne	89d6a0 <_ZNSt5mutex4lockEv@@Base+0x693f0>
  89d678:	b0019581 	adrp	x1, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
  89d67c:	b9400a99 	ldr	w25, [x20,#8]
  89d680:	9110603c 	add	x28, x1, #0x418
  89d684:	08dfff80 	ldarb	w0, [x28]
  89d688:	36000aa0 	tbz	w0, #0, 89d7dc <_ZNSt5mutex4lockEv@@Base+0x6952c>
  89d68c:	b0019582 	adrp	x2, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
  89d690:	91108042 	add	x2, x2, #0x420
  89d694:	b9400040 	ldr	w0, [x2]
  89d698:	6b00033f 	cmp	w25, w0
  89d69c:	540005a0 	b.eq	89d750 <_ZNSt5mutex4lockEv@@Base+0x694a0>
  89d6a0:	aa1803e1 	mov	x1, x24
  89d6a4:	9101e3e0 	add	x0, sp, #0x78
  89d6a8:	946a598e 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  89d6ac:	9101e3e0 	add	x0, sp, #0x78
  89d6b0:	910203e8 	add	x8, sp, #0x80
  89d6b4:	aa1603e1 	mov	x1, x22
  89d6b8:	9469d94e 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  89d6bc:	d000f961 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  89d6c0:	910223e8 	add	x8, sp, #0x88
  89d6c4:	91366021 	add	x1, x1, #0xd98
  89d6c8:	910203e0 	add	x0, sp, #0x80
  89d6cc:	9469d949 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  89d6d0:	b000ea81 	adrp	x1, 25ee000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2b1a8>
  89d6d4:	910243e0 	add	x0, sp, #0x90
  89d6d8:	91242021 	add	x1, x1, #0x908
  89d6dc:	946a5981 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  89d6e0:	910243e1 	add	x1, sp, #0x90
  89d6e4:	910263e8 	add	x8, sp, #0x98
  89d6e8:	910223e0 	add	x0, sp, #0x88
  89d6ec:	9469d8e9 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  89d6f0:	52800022 	mov	w2, #0x1                   	// #1
  89d6f4:	52800001 	mov	w1, #0x0                   	// #0
  89d6f8:	910263e0 	add	x0, sp, #0x98
  89d6fc:	94658b39 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  89d700:	910263e0 	add	x0, sp, #0x98
  89d704:	94697bbf 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d708:	910243e0 	add	x0, sp, #0x90
  89d70c:	94697bbd 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d710:	910223e0 	add	x0, sp, #0x88
  89d714:	94697bbb 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d718:	910203e0 	add	x0, sp, #0x80
  89d71c:	94697bb9 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d720:	9101e3e0 	add	x0, sp, #0x78
  89d724:	94697bb7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d728:	91002273 	add	x19, x19, #0x8
  89d72c:	eb1302bf 	cmp	x21, x19
  89d730:	54fff981 	b.ne	89d660 <_ZNSt5mutex4lockEv@@Base+0x693b0>
  89d734:	a94153f3 	ldp	x19, x20, [sp,#16]
  89d738:	a94363f7 	ldp	x23, x24, [sp,#48]
  89d73c:	a9446bf9 	ldp	x25, x26, [sp,#64]
  89d740:	a94573fb 	ldp	x27, x28, [sp,#80]
  89d744:	a9425bf5 	ldp	x21, x22, [sp,#32]
  89d748:	a8ca7bfd 	ldp	x29, x30, [sp],#160
  89d74c:	d65f03c0 	ret
  89d750:	eb1a029f 	cmp	x20, x26
  89d754:	54fffea0 	b.eq	89d728 <_ZNSt5mutex4lockEv@@Base+0x69478>
  89d758:	f9400281 	ldr	x1, [x20]
  89d75c:	f0fffe20 	adrp	x0, 864000 <_ZNSt5mutex4lockEv@@Base+0x2fd50>
  89d760:	91254000 	add	x0, x0, #0x950
  89d764:	f9400823 	ldr	x3, [x1,#16]
  89d768:	eb00007f 	cmp	x3, x0
  89d76c:	54000521 	b.ne	89d810 <_ZNSt5mutex4lockEv@@Base+0x69560>
  89d770:	f9400360 	ldr	x0, [x27]
  89d774:	f9401281 	ldr	x1, [x20,#32]
  89d778:	eb00003f 	cmp	x1, x0
  89d77c:	54fffd61 	b.ne	89d728 <_ZNSt5mutex4lockEv@@Base+0x69478>
  89d780:	f94033f9 	ldr	x25, [sp,#96]
  89d784:	b9406281 	ldr	w1, [x20,#96]
  89d788:	b9400320 	ldr	w0, [x25]
  89d78c:	6b00003f 	cmp	w1, w0
  89d790:	54fffcc0 	b.eq	89d728 <_ZNSt5mutex4lockEv@@Base+0x69478>
  89d794:	9100c29c 	add	x28, x20, #0x30
  89d798:	aa1c03e0 	mov	x0, x28
  89d79c:	97fe5ac5 	bl	8342b0 <_ZNSt5mutex4lockEv@@Base>
  89d7a0:	9000ed80 	adrp	x0, 264d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a1a8>
  89d7a4:	b9400321 	ldr	w1, [x25]
  89d7a8:	b9006281 	str	w1, [x20,#96]
  89d7ac:	f941e800 	ldr	x0, [x0,#976]
  89d7b0:	b4000060 	cbz	x0, 89d7bc <_ZNSt5mutex4lockEv@@Base+0x6950c>
  89d7b4:	aa1c03e0 	mov	x0, x28
  89d7b8:	97ee24a2 	bl	426a40 <pthread_mutex_unlock@plt>
  89d7bc:	39419280 	ldrb	w0, [x20,#100]
  89d7c0:	34fffb40 	cbz	w0, 89d728 <_ZNSt5mutex4lockEv@@Base+0x69478>
  89d7c4:	f9400e81 	ldr	x1, [x20,#24]
  89d7c8:	aa0103e0 	mov	x0, x1
  89d7cc:	f9400021 	ldr	x1, [x1]
  89d7d0:	f9400821 	ldr	x1, [x1,#16]
  89d7d4:	d63f0020 	blr	x1
  89d7d8:	17ffffd4 	b	89d728 <_ZNSt5mutex4lockEv@@Base+0x69478>
  89d7dc:	aa1c03e0 	mov	x0, x28
  89d7e0:	97ee22a0 	bl	426260 <__cxa_guard_acquire@plt>
  89d7e4:	b0019581 	adrp	x1, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
  89d7e8:	91108022 	add	x2, x1, #0x420
  89d7ec:	34fff540 	cbz	w0, 89d694 <_ZNSt5mutex4lockEv@@Base+0x693e4>
  89d7f0:	f90037e2 	str	x2, [sp,#104]
  89d7f4:	97f84c45 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
  89d7f8:	b0019581 	adrp	x1, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
  89d7fc:	b9042020 	str	w0, [x1,#1056]
  89d800:	aa1c03e0 	mov	x0, x28
  89d804:	97ee240f 	bl	426840 <__cxa_guard_release@plt>
  89d808:	f94037e2 	ldr	x2, [sp,#104]
  89d80c:	17ffffa2 	b	89d694 <_ZNSt5mutex4lockEv@@Base+0x693e4>
  89d810:	f94033e2 	ldr	x2, [sp,#96]
  89d814:	aa1403e0 	mov	x0, x20
  89d818:	aa1b03e1 	mov	x1, x27
  89d81c:	d63f0060 	blr	x3
  89d820:	17ffffc2 	b	89d728 <_ZNSt5mutex4lockEv@@Base+0x69478>
  89d824:	aa0003f3 	mov	x19, x0
  89d828:	1400000c 	b	89d858 <_ZNSt5mutex4lockEv@@Base+0x695a8>
  89d82c:	aa0003f3 	mov	x19, x0
  89d830:	1400000c 	b	89d860 <_ZNSt5mutex4lockEv@@Base+0x695b0>
  89d834:	aa0003f3 	mov	x19, x0
  89d838:	14000004 	b	89d848 <_ZNSt5mutex4lockEv@@Base+0x69598>
  89d83c:	aa0003f3 	mov	x19, x0
  89d840:	910263e0 	add	x0, sp, #0x98
  89d844:	94697b6f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d848:	910243e0 	add	x0, sp, #0x90
  89d84c:	94697b6d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d850:	910223e0 	add	x0, sp, #0x88
  89d854:	94697b6b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d858:	910203e0 	add	x0, sp, #0x80
  89d85c:	94697b69 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d860:	9101e3e0 	add	x0, sp, #0x78
  89d864:	94697b67 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d868:	aa1303e0 	mov	x0, x19
  89d86c:	97ee1d29 	bl	424d10 <_Unwind_Resume@plt>
  89d870:	aa0003f3 	mov	x19, x0
  89d874:	17fffff7 	b	89d850 <_ZNSt5mutex4lockEv@@Base+0x695a0>
