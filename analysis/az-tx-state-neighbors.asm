
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002130700 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930878>:
 2130700:	34ffffc5 	cbz	w5, 21306f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930870>
 2130704:	110004a4 	add	w4, w5, #0x1
 2130708:	885ffc43 	ldaxr	w3, [x2]
 213070c:	6b05007f 	cmp	w3, w5
 2130710:	54000061 	b.ne	213071c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930894>
 2130714:	8806fc44 	stlxr	w6, w4, [x2]
 2130718:	710000df 	cmp	w6, #0x0
 213071c:	2a0303e5 	mov	w5, w3
 2130720:	54fffd60 	b.eq	21306cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930844>
 2130724:	17fffff7 	b	2130700 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930878>
 2130728:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
 213072c:	d2800700 	mov	x0, #0x38                  	// #56
 2130730:	910003fd 	mov	x29, sp
 2130734:	a90153f3 	stp	x19, x20, [sp,#16]
 2130738:	978bd74e 	bl	426470 <__cxa_allocate_exception@plt>
 213073c:	b0002c04 	adrp	x4, 26b1000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xee1a8>
 2130740:	aa0003f3 	mov	x19, x0
 2130744:	91390084 	add	x4, x4, #0xe40
 2130748:	b0002c03 	adrp	x3, 26b1000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xee1a8>
 213074c:	b0002c02 	adrp	x2, 26b1000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xee1a8>
 2130750:	9139e063 	add	x3, x3, #0xe78
 2130754:	b0002c06 	adrp	x6, 26b1000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xee1a8>
 2130758:	913ac042 	add	x2, x2, #0xeb0
 213075c:	913780c6 	add	x6, x6, #0xde0
 2130760:	b0002c05 	adrp	x5, 26b1000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xee1a8>
 2130764:	913820a5 	add	x5, x5, #0xe08
 2130768:	12800007 	mov	w7, #0xffffffff            	// #-1
 213076c:	91002001 	add	x1, x0, #0x8
 2130770:	aa0103e0 	mov	x0, x1
 2130774:	9100a3e1 	add	x1, sp, #0x28
 2130778:	a9000e64 	stp	x4, x3, [x19]
 213077c:	a9017e7f 	stp	xzr, xzr, [x19,#16]
 2130780:	f900127f 	str	xzr, [x19,#32]
 2130784:	a90217e6 	stp	x6, x5, [sp,#32]
 2130788:	b9002a67 	str	w7, [x19,#40]
 213078c:	f9001a62 	str	x2, [x19,#48]
 2130790:	a9037fff 	stp	xzr, xzr, [sp,#48]
 2130794:	f90023ff 	str	xzr, [sp,#64]
 2130798:	b9004be7 	str	w7, [sp,#72]
 213079c:	9798c571 	bl	761d60 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x68fb8>
 21307a0:	910083e0 	add	x0, sp, #0x20
 21307a4:	97a3b2c5 	bl	a1d2b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1126a0>
 21307a8:	b0ff4762 	adrp	x2, a1d000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1123e8>
 21307ac:	b0002c01 	adrp	x1, 26b1000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xee1a8>
 21307b0:	aa1303e0 	mov	x0, x19
 21307b4:	9116c042 	add	x2, x2, #0x5b0
 21307b8:	912d4021 	add	x1, x1, #0xb50
 21307bc:	978bd0f9 	bl	424ba0 <__cxa_throw@plt>
 21307c0:	aa0003f4 	mov	x20, x0
 21307c4:	aa1303e0 	mov	x0, x19
 21307c8:	97a3b2bc 	bl	a1d2b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1126a0>
 21307cc:	910083e0 	add	x0, sp, #0x20
 21307d0:	97a3b2ba 	bl	a1d2b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1126a0>
 21307d4:	aa1303e0 	mov	x0, x19
 21307d8:	978bda26 	bl	427070 <__cxa_free_exception@plt>
 21307dc:	aa1403e0 	mov	x0, x20
 21307e0:	978bd14c 	bl	424d10 <_Unwind_Resume@plt>
 21307e4:	d503201f 	nop
 21307e8:	aa0003e2 	mov	x2, x0
 21307ec:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21307f0:	aa0103e0 	mov	x0, x1
 21307f4:	910003fd 	mov	x29, sp
 21307f8:	b9400043 	ldr	w3, [x2]
 21307fc:	f9400024 	ldr	x4, [x1]
 2130800:	4a837c63 	eor	w3, w3, w3, asr #31
 2130804:	39403041 	ldrb	w1, [x2,#12]
 2130808:	7100047f 	cmp	w3, #0x1
 213080c:	f9401085 	ldr	x5, [x4,#32]
 2130810:	54000069 	b.ls	213081c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930994>
 2130814:	a90153f3 	stp	x19, x20, [sp,#16]
 2130818:	978bd872 	bl	4269e0 <abort@plt>
 213081c:	b0006884 	adrp	x4, 2e41000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87e1a8>
 2130820:	911ea084 	add	x4, x4, #0x7a8
 2130824:	38634883 	ldrb	w3, [x4,w3,uxtw]
 2130828:	10000064 	adr	x4, 2130834 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9309ac>
 213082c:	8b238883 	add	x3, x4, w3, sxtb #2
 2130830:	d61f0060 	br	x3
 2130834:	79c01044 	ldrsh	w4, [x2,#8]
 2130838:	39402843 	ldrb	w3, [x2,#10]
 213083c:	b9400446 	ldr	w6, [x2,#4]
 2130840:	9100a3e2 	add	x2, sp, #0x28
 2130844:	b9002be6 	str	w6, [sp,#40]
 2130848:	79005be4 	strh	w4, [sp,#44]
 213084c:	3900bbe3 	strb	w3, [sp,#46]
 2130850:	d63f00a0 	blr	x5
 2130854:	a8c37bfd 	ldp	x29, x30, [sp],#48
 2130858:	d65f03c0 	ret
 213085c:	a90153f3 	stp	x19, x20, [sp,#16]
 2130860:	b0002c13 	adrp	x19, 26b1000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xee1a8>
 2130864:	912e6273 	add	x19, x19, #0xb98
 2130868:	f90017f3 	str	x19, [sp,#40]
 213086c:	97ffffaf 	bl	2130728 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9308a0>
 2130870:	aa0003f4 	mov	x20, x0
 2130874:	9100a3e0 	add	x0, sp, #0x28
 2130878:	f90017f3 	str	x19, [sp,#40]
 213087c:	978bce2d 	bl	424130 <_ZNSt9exceptionD2Ev@plt>
 2130880:	aa1403e0 	mov	x0, x20
 2130884:	978bd123 	bl	424d10 <_Unwind_Resume@plt>
 2130888:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 213088c:	aa0103e3 	mov	x3, x1
 2130890:	910003fd 	mov	x29, sp
 2130894:	b9400002 	ldr	w2, [x0]
 2130898:	f9400024 	ldr	x4, [x1]
 213089c:	4a827c42 	eor	w2, w2, w2, asr #31
 21308a0:	39403001 	ldrb	w1, [x0,#12]
 21308a4:	7100045f 	cmp	w2, #0x1
 21308a8:	f9401485 	ldr	x5, [x4,#40]
 21308ac:	54000069 	b.ls	21308b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930a30>
 21308b0:	a90153f3 	stp	x19, x20, [sp,#16]
 21308b4:	978bd84b 	bl	4269e0 <abort@plt>
 21308b8:	b0006884 	adrp	x4, 2e41000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87e1a8>
 21308bc:	911eb084 	add	x4, x4, #0x7ac
 21308c0:	38624882 	ldrb	w2, [x4,w2,uxtw]
 21308c4:	10000064 	adr	x4, 21308d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930a48>
 21308c8:	8b228882 	add	x2, x4, w2, sxtb #2
 21308cc:	d61f0040 	br	x2
 21308d0:	79400802 	ldrh	w2, [x0,#4]
 21308d4:	aa0303e0 	mov	x0, x3
 21308d8:	d63f00a0 	blr	x5
 21308dc:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21308e0:	d65f03c0 	ret
 21308e4:	a90153f3 	stp	x19, x20, [sp,#16]
 21308e8:	b0002c13 	adrp	x19, 26b1000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xee1a8>
 21308ec:	912e6273 	add	x19, x19, #0xb98
 21308f0:	f90017f3 	str	x19, [sp,#40]
 21308f4:	97ffff8d 	bl	2130728 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9308a0>
 21308f8:	aa0003f4 	mov	x20, x0
 21308fc:	9100a3e0 	add	x0, sp, #0x28
 2130900:	f90017f3 	str	x19, [sp,#40]
 2130904:	978bce0b 	bl	424130 <_ZNSt9exceptionD2Ev@plt>
 2130908:	aa1403e0 	mov	x0, x20
 213090c:	978bd101 	bl	424d10 <_Unwind_Resume@plt>
 2130910:	12001c21 	and	w1, w1, #0xff
 2130914:	91002000 	add	x0, x0, #0x8
 2130918:	08dffc02 	ldarb	w2, [x0]
 213091c:	12001c42 	and	w2, w2, #0xff
 2130920:	2a020023 	orr	w3, w1, w2
 2130924:	085ffc04 	ldaxrb	w4, [x0]
 2130928:	6b02009f 	cmp	w4, w2
 213092c:	54000061 	b.ne	2130938 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930ab0>
 2130930:	0805fc03 	stlxrb	w5, w3, [x0]
 2130934:	35ffff85 	cbnz	w5, 2130924 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930a9c>
 2130938:	54ffff01 	b.ne	2130918 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930a90>
 213093c:	d65f03c0 	ret
