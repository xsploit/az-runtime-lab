
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000a75428 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16a810>:
  a75428:	a9b97bfd 	stp	x29, x30, [sp,#-112]!
  a7542c:	910003fd 	mov	x29, sp
  a75430:	a90363f7 	stp	x23, x24, [sp,#48]
  a75434:	aa0003f8 	mov	x24, x0
  a75438:	f9402800 	ldr	x0, [x0,#80]
  a7543c:	b4000ea0 	cbz	x0, a75610 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16a9f8>
  a75440:	f9400021 	ldr	x1, [x1]
  a75444:	f9401000 	ldr	x0, [x0,#32]
  a75448:	eb01001f 	cmp	x0, x1
  a7544c:	54000640 	b.eq	a75514 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16a8fc>
  a75450:	a90153f3 	stp	x19, x20, [sp,#16]
  a75454:	910123f3 	add	x19, sp, #0x48
  a75458:	aa1303e0 	mov	x0, x19
  a7545c:	9000da61 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a75460:	9136a021 	add	x1, x1, #0xda8
  a75464:	9462fa1f 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a75468:	910143f4 	add	x20, sp, #0x50
  a7546c:	d000e2c1 	adrp	x1, 26cf000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x10c1a8>
  a75470:	9118c021 	add	x1, x1, #0x630
  a75474:	91026021 	add	x1, x1, #0x98
  a75478:	aa1303e0 	mov	x0, x19
  a7547c:	aa1403e8 	mov	x8, x20
  a75480:	946279dc 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a75484:	a9025bf5 	stp	x21, x22, [sp,#32]
  a75488:	910163f5 	add	x21, sp, #0x58
  a7548c:	d000eaa1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a75490:	aa1503e8 	mov	x8, x21
  a75494:	91366021 	add	x1, x1, #0xd98
  a75498:	aa1403e0 	mov	x0, x20
  a7549c:	946279d5 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a754a0:	910183f6 	add	x22, sp, #0x60
  a754a4:	f000e2c1 	adrp	x1, 26d0000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x10d1a8>
  a754a8:	aa1603e0 	mov	x0, x22
  a754ac:	913ea021 	add	x1, x1, #0xfa8
  a754b0:	9462fa0c 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a754b4:	9101a3f7 	add	x23, sp, #0x68
  a754b8:	aa1603e1 	mov	x1, x22
  a754bc:	aa1703e8 	mov	x8, x23
  a754c0:	aa1503e0 	mov	x0, x21
  a754c4:	94627973 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a754c8:	52800022 	mov	w2, #0x1                   	// #1
  a754cc:	52800001 	mov	w1, #0x0                   	// #0
  a754d0:	aa1703e0 	mov	x0, x23
  a754d4:	945e2bc3 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a754d8:	aa1703e0 	mov	x0, x23
  a754dc:	94621c49 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a754e0:	aa1603e0 	mov	x0, x22
  a754e4:	94621c47 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a754e8:	aa1503e0 	mov	x0, x21
  a754ec:	94621c45 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a754f0:	aa1403e0 	mov	x0, x20
  a754f4:	94621c43 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a754f8:	aa1303e0 	mov	x0, x19
  a754fc:	94621c41 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a75500:	a94153f3 	ldp	x19, x20, [sp,#16]
  a75504:	a9425bf5 	ldp	x21, x22, [sp,#32]
  a75508:	a94363f7 	ldp	x23, x24, [sp,#48]
  a7550c:	a8c77bfd 	ldp	x29, x30, [sp],#112
  a75510:	d65f03c0 	ret
  a75514:	b9400041 	ldr	w1, [x2]
  a75518:	7100083f 	cmp	w1, #0x2
  a7551c:	540001a8 	b.hi	a75550 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16a938>
  a75520:	d000e2c0 	adrp	x0, 26cf000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x10c1a8>
  a75524:	9118c000 	add	x0, x0, #0x630
  a75528:	91046000 	add	x0, x0, #0x118
  a7552c:	38614801 	ldrb	w1, [x0,w1,uxtw]
  a75530:	f9401702 	ldr	x2, [x24,#40]
  a75534:	aa0203e0 	mov	x0, x2
  a75538:	f9400042 	ldr	x2, [x2]
  a7553c:	f9400842 	ldr	x2, [x2,#16]
  a75540:	d63f0040 	blr	x2
  a75544:	a94363f7 	ldp	x23, x24, [sp,#48]
  a75548:	a8c77bfd 	ldp	x29, x30, [sp],#112
  a7554c:	d65f03c0 	ret
  a75550:	a9025bf5 	stp	x21, x22, [sp,#32]
  a75554:	910183f6 	add	x22, sp, #0x60
  a75558:	aa1603e0 	mov	x0, x22
  a7555c:	9000da61 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a75560:	9136a021 	add	x1, x1, #0xda8
  a75564:	9462f9df 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a75568:	910163f5 	add	x21, sp, #0x58
  a7556c:	d000e2c1 	adrp	x1, 26cf000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x10c1a8>
  a75570:	9118c021 	add	x1, x1, #0x630
  a75574:	91048021 	add	x1, x1, #0x120
  a75578:	aa1603e0 	mov	x0, x22
  a7557c:	aa1503e8 	mov	x8, x21
  a75580:	9462799c 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a75584:	a90153f3 	stp	x19, x20, [sp,#16]
  a75588:	910143f4 	add	x20, sp, #0x50
  a7558c:	d000eaa1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a75590:	aa1403e8 	mov	x8, x20
  a75594:	91366021 	add	x1, x1, #0xd98
  a75598:	aa1503e0 	mov	x0, x21
  a7559c:	94627995 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a755a0:	9101a3f7 	add	x23, sp, #0x68
  a755a4:	d000e0e1 	adrp	x1, 2693000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xd01a8>
  a755a8:	aa1703e0 	mov	x0, x23
  a755ac:	913dc021 	add	x1, x1, #0xf70
  a755b0:	9462f9cc 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a755b4:	910123f3 	add	x19, sp, #0x48
  a755b8:	aa1703e1 	mov	x1, x23
  a755bc:	aa1303e8 	mov	x8, x19
  a755c0:	aa1403e0 	mov	x0, x20
  a755c4:	94627933 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a755c8:	52800022 	mov	w2, #0x1                   	// #1
  a755cc:	52800001 	mov	w1, #0x0                   	// #0
  a755d0:	aa1303e0 	mov	x0, x19
  a755d4:	945e2b83 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a755d8:	aa1303e0 	mov	x0, x19
  a755dc:	94621c09 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a755e0:	aa1703e0 	mov	x0, x23
  a755e4:	94621c07 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a755e8:	aa1403e0 	mov	x0, x20
  a755ec:	94621c05 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a755f0:	aa1503e0 	mov	x0, x21
  a755f4:	94621c03 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a755f8:	aa1603e0 	mov	x0, x22
  a755fc:	94621c01 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a75600:	52800001 	mov	w1, #0x0                   	// #0
  a75604:	a94153f3 	ldp	x19, x20, [sp,#16]
  a75608:	a9425bf5 	ldp	x21, x22, [sp,#32]
  a7560c:	17ffffc9 	b	a75530 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16a918>
  a75610:	a90153f3 	stp	x19, x20, [sp,#16]
  a75614:	910123f3 	add	x19, sp, #0x48
  a75618:	aa1303e0 	mov	x0, x19
  a7561c:	9000da61 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a75620:	9136a021 	add	x1, x1, #0xda8
  a75624:	9462f9af 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a75628:	910143f4 	add	x20, sp, #0x50
  a7562c:	d000e2c1 	adrp	x1, 26cf000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x10c1a8>
  a75630:	9118c021 	add	x1, x1, #0x630
  a75634:	91026021 	add	x1, x1, #0x98
  a75638:	aa1303e0 	mov	x0, x19
  a7563c:	aa1403e8 	mov	x8, x20
  a75640:	9462796c 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a75644:	a9025bf5 	stp	x21, x22, [sp,#32]
  a75648:	910163f5 	add	x21, sp, #0x58
  a7564c:	d000eaa1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a75650:	aa1503e8 	mov	x8, x21
  a75654:	91366021 	add	x1, x1, #0xd98
  a75658:	aa1403e0 	mov	x0, x20
  a7565c:	94627965 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a75660:	910183f6 	add	x22, sp, #0x60
  a75664:	f000e2c1 	adrp	x1, 26d0000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x10d1a8>
  a75668:	aa1603e0 	mov	x0, x22
  a7566c:	913e4021 	add	x1, x1, #0xf90
  a75670:	9462f99c 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a75674:	9101a3f7 	add	x23, sp, #0x68
  a75678:	aa1603e1 	mov	x1, x22
  a7567c:	aa1703e8 	mov	x8, x23
  a75680:	aa1503e0 	mov	x0, x21
  a75684:	94627903 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a75688:	52800022 	mov	w2, #0x1                   	// #1
  a7568c:	52800001 	mov	w1, #0x0                   	// #0
  a75690:	aa1703e0 	mov	x0, x23
  a75694:	945e2b53 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a75698:	17ffff90 	b	a754d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16a8c0>
  a7569c:	a90153f3 	stp	x19, x20, [sp,#16]
  a756a0:	aa0003f3 	mov	x19, x0
  a756a4:	aa1603e0 	mov	x0, x22
  a756a8:	94621bd6 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a756ac:	aa1303e0 	mov	x0, x19
  a756b0:	97e6bd98 	bl	424d10 <_Unwind_Resume@plt>
  a756b4:	aa0003f5 	mov	x21, x0
  a756b8:	aa1403e0 	mov	x0, x20
  a756bc:	94621bd1 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a756c0:	aa1303e0 	mov	x0, x19
  a756c4:	94621bcf 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a756c8:	aa1503e0 	mov	x0, x21
  a756cc:	97e6bd91 	bl	424d10 <_Unwind_Resume@plt>
  a756d0:	aa0003f7 	mov	x23, x0
  a756d4:	aa1503e0 	mov	x0, x21
  a756d8:	aa1703f5 	mov	x21, x23
  a756dc:	94621bc9 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a756e0:	17fffff6 	b	a756b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16aaa0>
  a756e4:	aa0003f7 	mov	x23, x0
  a756e8:	14000005 	b	a756fc <_ZSt20__throw_bad_weak_ptrv@@Base+0x16aae4>
  a756ec:	aa0003e1 	mov	x1, x0
  a756f0:	aa1703e0 	mov	x0, x23
  a756f4:	aa0103f7 	mov	x23, x1
  a756f8:	94621bc2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a756fc:	aa1603e0 	mov	x0, x22
  a75700:	94621bc0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a75704:	17fffff4 	b	a756d4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16aabc>
  a75708:	a9025bf5 	stp	x21, x22, [sp,#32]
  a7570c:	aa0003f5 	mov	x21, x0
  a75710:	17ffffec 	b	a756c0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16aaa8>
  a75714:	17fffff6 	b	a756ec <_ZSt20__throw_bad_weak_ptrv@@Base+0x16aad4>
  a75718:	aa0003f7 	mov	x23, x0
  a7571c:	17fffff8 	b	a756fc <_ZSt20__throw_bad_weak_ptrv@@Base+0x16aae4>
  a75720:	aa0003f7 	mov	x23, x0
  a75724:	17ffffec 	b	a756d4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16aabc>
  a75728:	aa0003f5 	mov	x21, x0
  a7572c:	17ffffe3 	b	a756b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16aaa0>
  a75730:	17fffff6 	b	a75708 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16aaf0>
  a75734:	aa0003e1 	mov	x1, x0
  a75738:	aa1303e0 	mov	x0, x19
  a7573c:	aa0103f3 	mov	x19, x1
  a75740:	94621bb0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a75744:	aa1703e0 	mov	x0, x23
  a75748:	94621bae 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a7574c:	aa1403e0 	mov	x0, x20
  a75750:	94621bac 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a75754:	aa1503e0 	mov	x0, x21
  a75758:	94621baa 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a7575c:	17ffffd2 	b	a756a4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16aa8c>
  a75760:	aa0003f3 	mov	x19, x0
  a75764:	17fffff8 	b	a75744 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16ab2c>
  a75768:	aa0003f3 	mov	x19, x0
  a7576c:	17fffff8 	b	a7574c <_ZSt20__throw_bad_weak_ptrv@@Base+0x16ab34>
  a75770:	aa0003f3 	mov	x19, x0
  a75774:	17fffff8 	b	a75754 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16ab3c>
  a75778:	d1006000 	sub	x0, x0, #0x18
  a7577c:	17ffff2b 	b	a75428 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16a810>
