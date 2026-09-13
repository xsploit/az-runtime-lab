
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000089d878 <_ZNSt5mutex4lockEv@@Base+0x695c8>:
  89d878:	a9b97bfd 	stp	x29, x30, [sp,#-112]!
  89d87c:	aa0003e1 	mov	x1, x0
  89d880:	910003fd 	mov	x29, sp
  89d884:	a90153f3 	stp	x19, x20, [sp,#16]
  89d888:	aa0003f3 	mov	x19, x0
  89d88c:	f9400814 	ldr	x20, [x0,#16]
  89d890:	a9025bf5 	stp	x21, x22, [sp,#32]
  89d894:	39402016 	ldrb	w22, [x0,#8]
  89d898:	91006280 	add	x0, x20, #0x18
  89d89c:	f9401275 	ldr	x21, [x19,#32]
  89d8a0:	97fb1694 	bl	7632f0 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x6a548>
  89d8a4:	91008281 	add	x1, x20, #0x20
  89d8a8:	eb01001f 	cmp	x0, x1
  89d8ac:	54000b00 	b.eq	89da0c <_ZNSt5mutex4lockEv@@Base+0x6975c>
  89d8b0:	f9401400 	ldr	x0, [x0,#40]
  89d8b4:	97ff8de7 	bl	881050 <_ZNSt5mutex4lockEv@@Base+0x4cda0>
  89d8b8:	b4001120 	cbz	x0, 89dadc <_ZNSt5mutex4lockEv@@Base+0x6982c>
  89d8bc:	b9400004 	ldr	w4, [x0]
  89d8c0:	710002df 	cmp	w22, #0x0
  89d8c4:	b9401a63 	ldr	w3, [x19,#24]
  89d8c8:	d00199c1 	adrp	x1, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
  89d8cc:	911bc021 	add	x1, x1, #0x6f0
  89d8d0:	9a930021 	csel	x1, x1, x19, eq
  89d8d4:	6b04007f 	cmp	w3, w4
  89d8d8:	54000760 	b.eq	89d9c4 <_ZNSt5mutex4lockEv@@Base+0x69714>
  89d8dc:	f9400024 	ldr	x4, [x1]
  89d8e0:	b9000003 	str	w3, [x0]
  89d8e4:	39400082 	ldrb	w2, [x4]
  89d8e8:	35000f02 	cbnz	w2, 89dac8 <_ZNSt5mutex4lockEv@@Base+0x69818>
  89d8ec:	f9400a60 	ldr	x0, [x19,#16]
  89d8f0:	f9400800 	ldr	x0, [x0,#16]
  89d8f4:	b4000680 	cbz	x0, 89d9c4 <_ZNSt5mutex4lockEv@@Base+0x69714>
  89d8f8:	f000e901 	adrp	x1, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
  89d8fc:	91002002 	add	x2, x0, #0x8
  89d900:	912a7021 	add	x1, x1, #0xa9c
  89d904:	eb01005f 	cmp	x2, x1
  89d908:	54000662 	b.cs	89d9d4 <_ZNSt5mutex4lockEv@@Base+0x69724>
  89d90c:	910123f4 	add	x20, sp, #0x48
  89d910:	9000e921 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  89d914:	aa1403e0 	mov	x0, x20
  89d918:	9136a021 	add	x1, x1, #0xda8
  89d91c:	946a58f1 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  89d920:	910143f5 	add	x21, sp, #0x50
  89d924:	b000ed61 	adrp	x1, 264a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x871a8>
  89d928:	913d4021 	add	x1, x1, #0xf50
  89d92c:	910dc021 	add	x1, x1, #0x370
  89d930:	aa1403e0 	mov	x0, x20
  89d934:	aa1503e8 	mov	x8, x21
  89d938:	9469d8ae 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  89d93c:	910163f6 	add	x22, sp, #0x58
  89d940:	d000f961 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  89d944:	aa1603e8 	mov	x8, x22
  89d948:	91366021 	add	x1, x1, #0xd98
  89d94c:	aa1503e0 	mov	x0, x21
  89d950:	9469d8a8 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  89d954:	a90363f7 	stp	x23, x24, [sp,#48]
  89d958:	910183f7 	add	x23, sp, #0x60
  89d95c:	9000ec21 	adrp	x1, 2621000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x5e1a8>
  89d960:	aa1703e0 	mov	x0, x23
  89d964:	91038021 	add	x1, x1, #0xe0
  89d968:	946a58de 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  89d96c:	9101a3f8 	add	x24, sp, #0x68
  89d970:	aa1703e1 	mov	x1, x23
  89d974:	aa1803e8 	mov	x8, x24
  89d978:	aa1603e0 	mov	x0, x22
  89d97c:	9469d845 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  89d980:	52800022 	mov	w2, #0x1                   	// #1
  89d984:	52800001 	mov	w1, #0x0                   	// #0
  89d988:	aa1803e0 	mov	x0, x24
  89d98c:	94658a95 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  89d990:	aa1803e0 	mov	x0, x24
  89d994:	94697b1b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d998:	aa1703e0 	mov	x0, x23
  89d99c:	94697b19 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d9a0:	aa1603e0 	mov	x0, x22
  89d9a4:	94697b17 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d9a8:	aa1503e0 	mov	x0, x21
  89d9ac:	94697b15 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d9b0:	aa1403e0 	mov	x0, x20
  89d9b4:	94697b13 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89d9b8:	f9400a60 	ldr	x0, [x19,#16]
  89d9bc:	a94363f7 	ldp	x23, x24, [sp,#48]
  89d9c0:	f900081f 	str	xzr, [x0,#16]
  89d9c4:	a94153f3 	ldp	x19, x20, [sp,#16]
  89d9c8:	a9425bf5 	ldp	x21, x22, [sp,#32]
  89d9cc:	a8c77bfd 	ldp	x29, x30, [sp],#112
  89d9d0:	d65f03c0 	ret
  89d9d4:	f240045f 	tst	x2, #0x3
  89d9d8:	54fff9a1 	b.ne	89d90c <_ZNSt5mutex4lockEv@@Base+0x6965c>
  89d9dc:	b9400814 	ldr	w20, [x0,#8]
  89d9e0:	97fe733e 	bl	83a6d8 <_ZNSt5mutex4lockEv@@Base+0x6428>
  89d9e4:	6b00029f 	cmp	w20, w0
  89d9e8:	54fff921 	b.ne	89d90c <_ZNSt5mutex4lockEv@@Base+0x6965c>
  89d9ec:	f9400a60 	ldr	x0, [x19,#16]
  89d9f0:	91006001 	add	x1, x0, #0x18
  89d9f4:	f9400802 	ldr	x2, [x0,#16]
  89d9f8:	aa0203e0 	mov	x0, x2
  89d9fc:	f9400042 	ldr	x2, [x2]
  89da00:	f9400842 	ldr	x2, [x2,#16]
  89da04:	d63f0040 	blr	x2
  89da08:	17ffffef 	b	89d9c4 <_ZNSt5mutex4lockEv@@Base+0x69714>
  89da0c:	d2800400 	mov	x0, #0x20                  	// #32
  89da10:	97ee1ccc 	bl	424d40 <_Znwm@plt>
  89da14:	aa0003f5 	mov	x21, x0
  89da18:	f000eca1 	adrp	x1, 2634000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x711a8>
  89da1c:	912b8021 	add	x1, x1, #0xae0
  89da20:	d2800400 	mov	x0, #0x20                  	// #32
  89da24:	f90002a1 	str	x1, [x21]
  89da28:	b9000abf 	str	wzr, [x21,#8]
  89da2c:	f9000abf 	str	xzr, [x21,#16]
  89da30:	97ee1cc4 	bl	424d40 <_Znwm@plt>
  89da34:	aa0003e1 	mov	x1, x0
  89da38:	a90363f7 	stp	x23, x24, [sp,#48]
  89da3c:	aa0003f7 	mov	x23, x0
  89da40:	b9401a62 	ldr	w2, [x19,#24]
  89da44:	d2800200 	mov	x0, #0x10                  	// #16
  89da48:	b8008422 	str	w2, [x1],#8
  89da4c:	f90006ff 	str	xzr, [x23,#8]
  89da50:	b900083f 	str	wzr, [x1,#8]
  89da54:	b900103f 	str	wzr, [x1,#16]
  89da58:	f9000eb7 	str	x23, [x21,#24]
  89da5c:	97ee1cb9 	bl	424d40 <_Znwm@plt>
  89da60:	f9400aa2 	ldr	x2, [x21,#16]
  89da64:	b000ecc1 	adrp	x1, 2636000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x731a8>
  89da68:	912e8021 	add	x1, x1, #0xba0
  89da6c:	a9005c01 	stp	x1, x23, [x0]
  89da70:	f9000aa0 	str	x0, [x21,#16]
  89da74:	b40000a2 	cbz	x2, 89da88 <_ZNSt5mutex4lockEv@@Base+0x697d8>
  89da78:	f9400041 	ldr	x1, [x2]
  89da7c:	aa0203e0 	mov	x0, x2
  89da80:	f9400421 	ldr	x1, [x1,#8]
  89da84:	d63f0020 	blr	x1
  89da88:	f90037f5 	str	x21, [sp,#104]
  89da8c:	910022b5 	add	x21, x21, #0x8
  89da90:	885ffea0 	ldaxr	w0, [x21]
  89da94:	11000400 	add	w0, w0, #0x1
  89da98:	8801fea0 	stlxr	w1, w0, [x21]
  89da9c:	35ffffa1 	cbnz	w1, 89da90 <_ZNSt5mutex4lockEv@@Base+0x697e0>
  89daa0:	2a1603e3 	mov	w3, w22
  89daa4:	aa1403e0 	mov	x0, x20
  89daa8:	9101a3e2 	add	x2, sp, #0x68
  89daac:	aa1303e1 	mov	x1, x19
  89dab0:	97ff8dc2 	bl	8811b8 <_ZNSt5mutex4lockEv@@Base+0x4cf08>
  89dab4:	f94037e0 	ldr	x0, [sp,#104]
  89dab8:	b40000e0 	cbz	x0, 89dad4 <_ZNSt5mutex4lockEv@@Base+0x69824>
  89dabc:	97fe8ca1 	bl	840d40 <_ZNSt5mutex4lockEv@@Base+0xca90>
  89dac0:	a94363f7 	ldp	x23, x24, [sp,#48]
  89dac4:	17ffff8a 	b	89d8ec <_ZNSt5mutex4lockEv@@Base+0x6963c>
  89dac8:	aa1503e2 	mov	x2, x21
  89dacc:	97fffecd 	bl	89d600 <_ZNSt5mutex4lockEv@@Base+0x69350>
  89dad0:	17ffff87 	b	89d8ec <_ZNSt5mutex4lockEv@@Base+0x6963c>
  89dad4:	a94363f7 	ldp	x23, x24, [sp,#48]
  89dad8:	17ffff85 	b	89d8ec <_ZNSt5mutex4lockEv@@Base+0x6963c>
  89dadc:	910143f5 	add	x21, sp, #0x50
  89dae0:	9000e921 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  89dae4:	aa1503e0 	mov	x0, x21
  89dae8:	9136a021 	add	x1, x1, #0xda8
  89daec:	946a587d 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  89daf0:	910163f6 	add	x22, sp, #0x58
  89daf4:	b000ed61 	adrp	x1, 264a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x871a8>
  89daf8:	913d4021 	add	x1, x1, #0xf50
  89dafc:	9108c021 	add	x1, x1, #0x230
  89db00:	aa1503e0 	mov	x0, x21
  89db04:	aa1603e8 	mov	x8, x22
  89db08:	9469d83a 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  89db0c:	a90363f7 	stp	x23, x24, [sp,#48]
  89db10:	910183f7 	add	x23, sp, #0x60
  89db14:	d000f961 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  89db18:	aa1703e8 	mov	x8, x23
  89db1c:	91366021 	add	x1, x1, #0xd98
  89db20:	aa1603e0 	mov	x0, x22
  89db24:	9469d833 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  89db28:	910123f4 	add	x20, sp, #0x48
  89db2c:	b000ea81 	adrp	x1, 25ee000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2b1a8>
  89db30:	aa1403e0 	mov	x0, x20
  89db34:	91240021 	add	x1, x1, #0x900
  89db38:	946a586a 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  89db3c:	9101a3f8 	add	x24, sp, #0x68
  89db40:	aa1403e1 	mov	x1, x20
  89db44:	aa1803e8 	mov	x8, x24
  89db48:	aa1703e0 	mov	x0, x23
  89db4c:	9469d7d1 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  89db50:	52800022 	mov	w2, #0x1                   	// #1
  89db54:	52800001 	mov	w1, #0x0                   	// #0
  89db58:	aa1803e0 	mov	x0, x24
  89db5c:	94658a21 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  89db60:	aa1803e0 	mov	x0, x24
  89db64:	94697aa7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89db68:	aa1403e0 	mov	x0, x20
  89db6c:	94697aa5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89db70:	aa1703e0 	mov	x0, x23
  89db74:	94697aa3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89db78:	aa1603e0 	mov	x0, x22
  89db7c:	94697aa1 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89db80:	aa1503e0 	mov	x0, x21
  89db84:	94697a9f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89db88:	a94363f7 	ldp	x23, x24, [sp,#48]
  89db8c:	17ffff8e 	b	89d9c4 <_ZNSt5mutex4lockEv@@Base+0x69714>
  89db90:	aa0003f3 	mov	x19, x0
  89db94:	aa1403e0 	mov	x0, x20
  89db98:	a90363f7 	stp	x23, x24, [sp,#48]
  89db9c:	94697a99 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89dba0:	aa1303e0 	mov	x0, x19
  89dba4:	97ee1c5b 	bl	424d10 <_Unwind_Resume@plt>
  89dba8:	aa0003f3 	mov	x19, x0
  89dbac:	aa1503e0 	mov	x0, x21
  89dbb0:	94697a94 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89dbb4:	17fffff8 	b	89db94 <_ZNSt5mutex4lockEv@@Base+0x698e4>
  89dbb8:	aa0003f3 	mov	x19, x0
  89dbbc:	14000006 	b	89dbd4 <_ZNSt5mutex4lockEv@@Base+0x69924>
  89dbc0:	aa0003f3 	mov	x19, x0
  89dbc4:	14000006 	b	89dbdc <_ZNSt5mutex4lockEv@@Base+0x6992c>
  89dbc8:	aa0003f3 	mov	x19, x0
  89dbcc:	aa1803e0 	mov	x0, x24
  89dbd0:	94697a8c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89dbd4:	aa1703e0 	mov	x0, x23
  89dbd8:	94697a8a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89dbdc:	aa1603e0 	mov	x0, x22
  89dbe0:	94697a88 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89dbe4:	a94363f7 	ldp	x23, x24, [sp,#48]
  89dbe8:	17fffff1 	b	89dbac <_ZNSt5mutex4lockEv@@Base+0x698fc>
  89dbec:	aa0003f3 	mov	x19, x0
  89dbf0:	aa1803e0 	mov	x0, x24
  89dbf4:	94697a83 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89dbf8:	aa1403e0 	mov	x0, x20
  89dbfc:	94697a81 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89dc00:	aa1703e0 	mov	x0, x23
  89dc04:	94697a7f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89dc08:	aa1603e0 	mov	x0, x22
  89dc0c:	94697a7d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89dc10:	aa1503e0 	mov	x0, x21
  89dc14:	94697a7b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  89dc18:	aa1303e0 	mov	x0, x19
  89dc1c:	97ee1c3d 	bl	424d10 <_Unwind_Resume@plt>
  89dc20:	aa0003f3 	mov	x19, x0
  89dc24:	17fffff5 	b	89dbf8 <_ZNSt5mutex4lockEv@@Base+0x69948>
  89dc28:	aa0003f3 	mov	x19, x0
  89dc2c:	17fffff5 	b	89dc00 <_ZNSt5mutex4lockEv@@Base+0x69950>
  89dc30:	aa0003f3 	mov	x19, x0
  89dc34:	17fffff5 	b	89dc08 <_ZNSt5mutex4lockEv@@Base+0x69958>
  89dc38:	aa0003f3 	mov	x19, x0
  89dc3c:	a90363f7 	stp	x23, x24, [sp,#48]
  89dc40:	17fffff4 	b	89dc10 <_ZNSt5mutex4lockEv@@Base+0x69960>
  89dc44:	f94037e1 	ldr	x1, [sp,#104]
  89dc48:	aa0003f3 	mov	x19, x0
  89dc4c:	b4fffe61 	cbz	x1, 89dc18 <_ZNSt5mutex4lockEv@@Base+0x69968>
  89dc50:	aa0103e0 	mov	x0, x1
  89dc54:	97fe8c3b 	bl	840d40 <_ZNSt5mutex4lockEv@@Base+0xca90>
  89dc58:	17fffff0 	b	89dc18 <_ZNSt5mutex4lockEv@@Base+0x69968>
  89dc5c:	f9400ea1 	ldr	x1, [x21,#24]
  89dc60:	aa0003f3 	mov	x19, x0
  89dc64:	b4000061 	cbz	x1, 89dc70 <_ZNSt5mutex4lockEv@@Base+0x699c0>
  89dc68:	aa0103e0 	mov	x0, x1
  89dc6c:	97ee297e 	bl	428264 <sqlite3_key@plt+0x9f4>
  89dc70:	f9400aa0 	ldr	x0, [x21,#16]
  89dc74:	9000ea81 	adrp	x1, 25ed000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a1a8>
  89dc78:	910e0021 	add	x1, x1, #0x380
  89dc7c:	f90002a1 	str	x1, [x21]
  89dc80:	b4000080 	cbz	x0, 89dc90 <_ZNSt5mutex4lockEv@@Base+0x699e0>
  89dc84:	f9400001 	ldr	x1, [x0]
  89dc88:	f9400421 	ldr	x1, [x1,#8]
  89dc8c:	d63f0020 	blr	x1
  89dc90:	d2800401 	mov	x1, #0x20                  	// #32
  89dc94:	aa1503e0 	mov	x0, x21
  89dc98:	97ee2272 	bl	426660 <_ZdlPvm@plt>
  89dc9c:	aa1303e0 	mov	x0, x19
  89dca0:	97ee1c1c 	bl	424d10 <_Unwind_Resume@plt>
  89dca4:	aa0003f3 	mov	x19, x0
  89dca8:	a90363f7 	stp	x23, x24, [sp,#48]
  89dcac:	17fffff1 	b	89dc70 <_ZNSt5mutex4lockEv@@Base+0x699c0>
  89dcb0:	91006000 	add	x0, x0, #0x18
  89dcb4:	17fffef1 	b	89d878 <_ZNSt5mutex4lockEv@@Base+0x695c8>
