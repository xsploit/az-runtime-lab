
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000018b9678 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb97f0>:
 18b9678:	eb01001f 	cmp	x0, x1
 18b967c:	54000040 	b.eq	18b9684 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb97fc>
 18b9680:	d65f03c0 	ret
 18b9684:	a9b67bfd 	stp	x29, x30, [sp,#-160]!
 18b9688:	910003fd 	mov	x29, sp
 18b968c:	a90153f3 	stp	x19, x20, [sp,#16]
 18b9690:	f940dc13 	ldr	x19, [x0,#440]
 18b9694:	b40008d3 	cbz	x19, 18b97ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9924>
 18b9698:	a9025bf5 	stp	x21, x22, [sp,#32]
 18b969c:	942e78fd 	bl	2457a90 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0xe2670>
 18b96a0:	7100001f 	cmp	w0, #0x0
 18b96a4:	51000400 	sub	w0, w0, #0x1
 18b96a8:	540010ad 	b.le	18b98bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9a34>
 18b96ac:	f9400a74 	ldr	x20, [x19,#16]
 18b96b0:	b9003fe0 	str	w0, [sp,#60]
 18b96b4:	aa1403f6 	mov	x22, x20
 18b96b8:	b4000e54 	cbz	x20, 18b9880 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb99f8>
 18b96bc:	f9400262 	ldr	x2, [x19]
 18b96c0:	f0ff7ca1 	adrp	x1, 850000 <_ZNSt5mutex4lockEv@@Base+0x1bd50>
 18b96c4:	9138a021 	add	x1, x1, #0xe28
 18b96c8:	f9400c42 	ldr	x2, [x2,#24]
 18b96cc:	eb01005f 	cmp	x2, x1
 18b96d0:	54000e81 	b.ne	18b98a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9a18>
 18b96d4:	71001c1f 	cmp	w0, #0x7
 18b96d8:	5400074d 	b.le	18b97c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9938>
 18b96dc:	f94006d4 	ldr	x20, [x22,#8]
 18b96e0:	910103f5 	add	x21, sp, #0x40
 18b96e4:	aa1503e0 	mov	x0, x21
 18b96e8:	91008261 	add	x1, x19, #0x20
 18b96ec:	9429533d 	bl	230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862c8>
 18b96f0:	f9400281 	ldr	x1, [x20]
 18b96f4:	52800020 	mov	w0, #0x1                   	// #1
 18b96f8:	b9402a62 	ldr	w2, [x19,#40]
 18b96fc:	390123e0 	strb	w0, [sp,#72]
 18b9700:	aa1403e0 	mov	x0, x20
 18b9704:	f9401421 	ldr	x1, [x1,#40]
 18b9708:	f9002bf6 	str	x22, [sp,#80]
 18b970c:	b9005be2 	str	w2, [sp,#88]
 18b9710:	f90033ff 	str	xzr, [sp,#96]
 18b9714:	d63f0020 	blr	x1
 18b9718:	72001c1f 	tst	w0, #0xff
 18b971c:	54000b60 	b.eq	18b9888 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9a00>
 18b9720:	f9400282 	ldr	x2, [x20]
 18b9724:	aa1503e1 	mov	x1, x21
 18b9728:	aa1403e0 	mov	x0, x20
 18b972c:	f9401853 	ldr	x19, [x2,#48]
 18b9730:	97bf8f0e 	bl	89d368 <_ZNSt5mutex4lockEv@@Base+0x690b8>
 18b9734:	aa0003e1 	mov	x1, x0
 18b9738:	aa1403e0 	mov	x0, x20
 18b973c:	d63f0260 	blr	x19
 18b9740:	b4000300 	cbz	x0, 18b97a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9918>
 18b9744:	f9400e80 	ldr	x0, [x20,#24]
 18b9748:	b40002c0 	cbz	x0, 18b97a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9918>
 18b974c:	94259e75 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 18b9750:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 18b9754:	d00068c1 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 18b9758:	91196021 	add	x1, x1, #0x658
 18b975c:	f90037e1 	str	x1, [sp,#104]
 18b9760:	fd003be0 	str	d0, [sp,#112]
 18b9764:	72001c1f 	tst	w0, #0xff
 18b9768:	2f00e400 	movi	d0, #0x0
 18b976c:	54000080 	b.eq	18b977c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb98f4>
 18b9770:	d00118e0 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 18b9774:	394de000 	ldrb	w0, [x0,#888]
 18b9778:	34000b00 	cbz	w0, 18b98d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9a50>
 18b977c:	f9004bff 	str	xzr, [sp,#144]
 18b9780:	fd003fe0 	str	d0, [sp,#120]
 18b9784:	f9400e81 	ldr	x1, [x20,#24]
 18b9788:	aa0103e0 	mov	x0, x1
 18b978c:	f9400021 	ldr	x1, [x1]
 18b9790:	f9400821 	ldr	x1, [x1,#16]
 18b9794:	d63f0020 	blr	x1
 18b9798:	9101a3e0 	add	x0, sp, #0x68
 18b979c:	97b82577 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 18b97a0:	aa1503e0 	mov	x0, x21
 18b97a4:	94290bfb 	bl	22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x174678>
 18b97a8:	a9425bf5 	ldp	x21, x22, [sp,#32]
 18b97ac:	a94153f3 	ldp	x19, x20, [sp,#16]
 18b97b0:	a8ca7bfd 	ldp	x29, x30, [sp],#160
 18b97b4:	d65f03c0 	ret
 18b97b8:	f9400a74 	ldr	x20, [x19,#16]
 18b97bc:	d503201f 	nop
 18b97c0:	910103f5 	add	x21, sp, #0x40
 18b97c4:	f9400696 	ldr	x22, [x20,#8]
 18b97c8:	91008261 	add	x1, x19, #0x20
 18b97cc:	aa1503e0 	mov	x0, x21
 18b97d0:	94295304 	bl	230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862c8>
 18b97d4:	b9403fe2 	ldr	w2, [sp,#60]
 18b97d8:	52800020 	mov	w0, #0x1                   	// #1
 18b97dc:	f94002c1 	ldr	x1, [x22]
 18b97e0:	390123e0 	strb	w0, [sp,#72]
 18b97e4:	aa1603e0 	mov	x0, x22
 18b97e8:	f9401421 	ldr	x1, [x1,#40]
 18b97ec:	f9002bf4 	str	x20, [sp,#80]
 18b97f0:	b9005be2 	str	w2, [sp,#88]
 18b97f4:	f90033ff 	str	xzr, [sp,#96]
 18b97f8:	d63f0020 	blr	x1
 18b97fc:	72001c1f 	tst	w0, #0xff
 18b9800:	540004a0 	b.eq	18b9894 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9a0c>
 18b9804:	f94002c2 	ldr	x2, [x22]
 18b9808:	aa1503e1 	mov	x1, x21
 18b980c:	aa1603e0 	mov	x0, x22
 18b9810:	f9401853 	ldr	x19, [x2,#48]
 18b9814:	97bf8ed5 	bl	89d368 <_ZNSt5mutex4lockEv@@Base+0x690b8>
 18b9818:	aa0003e1 	mov	x1, x0
 18b981c:	aa1603e0 	mov	x0, x22
 18b9820:	d63f0260 	blr	x19
 18b9824:	b4fffbe0 	cbz	x0, 18b97a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9918>
 18b9828:	f9400ec0 	ldr	x0, [x22,#24]
 18b982c:	b4fffba0 	cbz	x0, 18b97a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9918>
 18b9830:	94259e3c 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 18b9834:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 18b9838:	d00068c1 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 18b983c:	91196021 	add	x1, x1, #0x658
 18b9840:	f90037e1 	str	x1, [sp,#104]
 18b9844:	fd003be0 	str	d0, [sp,#112]
 18b9848:	72001c1f 	tst	w0, #0xff
 18b984c:	2f00e400 	movi	d0, #0x0
 18b9850:	54000080 	b.eq	18b9860 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb99d8>
 18b9854:	d00118e0 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 18b9858:	394de000 	ldrb	w0, [x0,#888]
 18b985c:	340003a0 	cbz	w0, 18b98d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9a48>
 18b9860:	f9004bff 	str	xzr, [sp,#144]
 18b9864:	fd003fe0 	str	d0, [sp,#120]
 18b9868:	f9400ec1 	ldr	x1, [x22,#24]
 18b986c:	aa0103e0 	mov	x0, x1
 18b9870:	f9400021 	ldr	x1, [x1]
 18b9874:	f9400821 	ldr	x1, [x1,#16]
 18b9878:	d63f0020 	blr	x1
 18b987c:	17ffffc7 	b	18b9798 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9910>
 18b9880:	a9425bf5 	ldp	x21, x22, [sp,#32]
 18b9884:	17ffffca 	b	18b97ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9924>
 18b9888:	aa1503e0 	mov	x0, x21
 18b988c:	97bf8c5f 	bl	89ca08 <_ZNSt5mutex4lockEv@@Base+0x68758>
 18b9890:	17ffffc4 	b	18b97a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9918>
 18b9894:	aa1503e0 	mov	x0, x21
 18b9898:	97bf8c5c 	bl	89ca08 <_ZNSt5mutex4lockEv@@Base+0x68758>
 18b989c:	17ffffc1 	b	18b97a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9918>
 18b98a0:	9100f3e1 	add	x1, sp, #0x3c
 18b98a4:	aa1303e0 	mov	x0, x19
 18b98a8:	d63f0040 	blr	x2
 18b98ac:	72001c1f 	tst	w0, #0xff
 18b98b0:	54fff841 	b.ne	18b97b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9930>
 18b98b4:	f9400a76 	ldr	x22, [x19,#16]
 18b98b8:	17ffff89 	b	18b96dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9854>
 18b98bc:	52800000 	mov	w0, #0x0                   	// #0
 18b98c0:	d2800001 	mov	x1, #0x0                   	// #0
 18b98c4:	94251b7f 	bl	22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x785a8>
 18b98c8:	52800000 	mov	w0, #0x0                   	// #0
 18b98cc:	17ffff78 	b	18b96ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9824>
 18b98d0:	9429d388 	bl	232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a65d8>
 18b98d4:	17ffffe3 	b	18b9860 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb99d8>
 18b98d8:	9429d386 	bl	232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a65d8>
 18b98dc:	17ffffa8 	b	18b977c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb98f4>
 18b98e0:	aa0003f3 	mov	x19, x0
 18b98e4:	aa1503e0 	mov	x0, x21
 18b98e8:	94290baa 	bl	22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x174678>
 18b98ec:	aa1303e0 	mov	x0, x19
 18b98f0:	97adad08 	bl	424d10 <_Unwind_Resume@plt>
 18b98f4:	aa0003f3 	mov	x19, x0
 18b98f8:	9101a3e0 	add	x0, sp, #0x68
 18b98fc:	97b8251f 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 18b9900:	aa1503e0 	mov	x0, x21
 18b9904:	94290ba3 	bl	22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x174678>
 18b9908:	aa1303e0 	mov	x0, x19
 18b990c:	97adad01 	bl	424d10 <_Unwind_Resume@plt>
 18b9910:	aa0003f3 	mov	x19, x0
 18b9914:	17fffffb 	b	18b9900 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9a78>
 18b9918:	aa0003f3 	mov	x19, x0
 18b991c:	9101a3e0 	add	x0, sp, #0x68
 18b9920:	97b82516 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 18b9924:	17fffff0 	b	18b98e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb9a5c>
