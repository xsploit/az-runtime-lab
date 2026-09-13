
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1fbd600:      	b	0x1fbd590 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd708>
 1fbd604:      	b	0x1fbd388 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd500>
 1fbd608:      	b	0x1fbd390 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd508>
 1fbd60c:      	b	0x1fbd398 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd510>
 1fbd610:      	b	0x1fbd3a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd518>
 1fbd614:      	b	0x1fbd3a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd520>
 1fbd618:      	stp	x29, x30, [sp, #-0x20]!
 1fbd61c:      	mov	x29, sp
 1fbd620:      	str	x19, [sp, #0x10]
 1fbd624:      	mov	x19, x0
 1fbd628:      	ldrb	w0, [x0, #0x1]
 1fbd62c:      	cbnz	w0, 0x1fbd66c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd7e4>
 1fbd630:      	mov	x0, #0x0                // =0
 1fbd634:      	ldrb	w2, [x19]
 1fbd638:      	mov	x1, #0xb3               // =179
 1fbd63c:      	movk	x1, #0x8900, lsl #48
 1fbd640:      	mov	x3, #0x68a2             // =26786
 1fbd644:      	add	x0, x2, x0
 1fbd648:      	movk	x3, #0x3f88, lsl #16
 1fbd64c:      	movk	x3, #0x5d6e, lsl #32
 1fbd650:      	movk	x3, #0x1de, lsl #48
 1fbd654:      	umulh	x1, x0, x1
 1fbd658:      	ldr	x19, [sp, #0x10]
 1fbd65c:      	lsr	x1, x1, #56
 1fbd660:      	ldp	x29, x30, [sp], #0x20
 1fbd664:      	msub	x0, x1, x3, x0
 1fbd668:      	ret
 1fbd66c:      	add	x0, x19, #0x1
 1fbd670:      	bl	0x1fbd618 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd790>
 1fbd674:      	add	x1, x0, x0, lsl #4
 1fbd678:      	add	x0, x0, x1, lsl #3
 1fbd67c:      	b	0x1fbd634 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd7ac>
 1fbd680:      	stp	x29, x30, [sp, #-0xb0]!
 1fbd684:      	mov	x29, sp
 1fbd688:      	stp	x19, x20, [sp, #0x10]
 1fbd68c:      	mov	x19, x0
 1fbd690:      	ldr	x20, [x0]
 1fbd694:      	stp	x21, x22, [sp, #0x20]
 1fbd698:      	mov	x21, x1
 1fbd69c:      	add	x22, sp, #0x80
 1fbd6a0:      	cbz	x20, 0x1fbdc94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bde0c>
 1fbd6a4:      	ldr	x1, [x20]
 1fbd6a8:      	mov	x0, x20
 1fbd6ac:      	mov	x8, x22
 1fbd6b0:      	ldr	x1, [x1, #0x18]
 1fbd6b4:      	blr	x1
 1fbd6b8:      	ldrb	w0, [sp, #0x88]
 1fbd6bc:      	cbnz	w0, 0x1fbd900 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bda78>
 1fbd6c0:      	mov	x0, x21
 1fbd6c4:      	bl	0x1492cb0 <_ZNSt15recursive_mutex4lockEv+0x7108>
 1fbd6c8:      	str	w0, [x19, #0xa0]
 1fbd6cc:      	mov	x0, x21
 1fbd6d0:      	str	x1, [x19, #0xa8]
 1fbd6d4:      	bl	0x1493718 <_ZNSt15recursive_mutex4lockEv+0x7b70>
 1fbd6d8:      	str	x0, [x19, #0xe0]
 1fbd6dc:      	mov	x0, x21
 1fbd6e0:      	bl	0x1493870 <_ZNSt15recursive_mutex4lockEv+0x7cc8>
 1fbd6e4:      	str	x0, [x19, #0xe8]
 1fbd6e8:      	mov	x0, x21
 1fbd6ec:      	bl	0x14938b8 <_ZNSt15recursive_mutex4lockEv+0x7d10>
 1fbd6f0:      	str	x0, [x19, #0xf0]
 1fbd6f4:      	mov	x0, x21
 1fbd6f8:      	bl	0x1492908 <_ZNSt15recursive_mutex4lockEv+0x6d60>
 1fbd6fc:      	ands	w0, w0, #0xff
 1fbd700:      	b.ne	0x1fbddac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bdf24>
 1fbd704:      	strb	w0, [x19, #0x100]
 1fbd708:      	mov	x0, x21
 1fbd70c:      	bl	0x1493668 <_ZNSt15recursive_mutex4lockEv+0x7ac0>
 1fbd710:      	ldr	x1, [x0, #0x8]
 1fbd714:      	str	x1, [x19, #0xb8]
 1fbd718:      	ldr	w1, [x0, #0x20]
 1fbd71c:      	ldr	w3, [x0, #0x10]
 1fbd720:      	ldr	x2, [x0, #0x18]
 1fbd724:      	str	w3, [x19, #0xc0]
 1fbd728:      	str	x2, [x19, #0xc8]
 1fbd72c:      	str	w1, [x19, #0xd0]
 1fbd730:      	add	x0, x0, #0x28
 1fbd734:      	ldar	x0, [x0]
 1fbd738:      	add	x20, x19, #0xd8
 1fbd73c:      	ldar	x1, [x20]
 1fbd740:      	cmp	x0, x1
 1fbd744:      	b.eq	0x1fbd8e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bda60>
 1fbd748:      	add	x1, x0, #0xc
 1fbd74c:      	cbz	x0, 0x1fbd82c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd9a4>
 1fbd750:      	mov	w3, #0x4f58             // =20312
 1fbd754:      	movk	w3, #0x5243, lsl #16
 1fbd758:      	ldar	w2, [x1]
 1fbd75c:      	cmp	w2, #0x0
 1fbd760:      	b.le	0x1fbd82c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd9a4>
 1fbd764:      	ldr	w4, [x0, #0x10]
 1fbd768:      	cmp	w4, w3
 1fbd76c:      	b.ne	0x1fbd82c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd9a4>
 1fbd770:      	add	w4, w2, #0x1
 1fbd774:      	ldaxr	w5, [x1]
 1fbd778:      	cmp	w5, w2
 1fbd77c:      	b.ne	0x1fbd788 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd900>
 1fbd780:      	stlxr	w6, w4, [x1]
 1fbd784:      	cbnz	w6, 0x1fbd774 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd8ec>
 1fbd788:      	b.ne	0x1fbd758 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd8d0>
 1fbd78c:      	ldr	w1, [x0, #0x10]
 1fbd790:      	cmp	w1, w3
 1fbd794:      	b.eq	0x1fbd830 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd9a8>
 1fbd798:      	add	x0, sp, #0x78
 1fbd79c:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1fbd7a0:      	add	x1, x1, #0xd70
 1fbd7a4:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1fbd7a8:      	adrp	x1, 0x2de4000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x8211a8>
 1fbd7ac:      	add	x1, x1, #0x9b8
 1fbd7b0:      	add	x1, x1, #0x758
 1fbd7b4:      	add	x0, sp, #0x78
 1fbd7b8:      	add	x8, sp, #0x70
 1fbd7bc:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1fbd7c0:      	add	x8, sp, #0x68
 1fbd7c4:      	add	x0, sp, #0x70
 1fbd7c8:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1fbd7cc:      	add	x1, x1, #0xd38
 1fbd7d0:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1fbd7d4:      	mov	x0, x22
 1fbd7d8:      	adrp	x1, 0x25cf000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xc1a8>
 1fbd7dc:      	add	x1, x1, #0x870
 1fbd7e0:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1fbd7e4:      	add	x8, sp, #0x60
 1fbd7e8:      	add	x0, sp, #0x68
 1fbd7ec:      	mov	x1, x22
 1fbd7f0:      	bl	0x2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18b978>
 1fbd7f4:      	mov	w2, #0x1                // =1
 1fbd7f8:      	mov	w1, w2
 1fbd7fc:      	add	x0, sp, #0x60
 1fbd800:      	bl	0x22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x782c8>
 1fbd804:      	add	x0, sp, #0x60
 1fbd808:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1fbd80c:      	mov	x0, x22
 1fbd810:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1fbd814:      	add	x0, sp, #0x68
 1fbd818:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1fbd81c:      	add	x0, sp, #0x70
 1fbd820:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1fbd824:      	add	x0, sp, #0x78
 1fbd828:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1fbd82c:      	mov	x0, #0x0                // =0
 1fbd830:      	ldaxr	x1, [x20]
 1fbd834:      	stlxr	w2, x0, [x20]
 1fbd838:      	cbnz	w2, 0x1fbd830 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bd9a8>
 1fbd83c:      	cbz	x1, 0x1fbd8e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7bda60>
 1fbd840:      	ldr	w2, [x1, #0x10]
 1fbd844:      	mov	w0, #0x4f58             // =20312
 1fbd848:      	movk	w0, #0x5243, lsl #16
 1fbd84c:      	cmp	w2, w0
 1fbd850:      	b.eq	0x1fbe084 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7be1fc>
 1fbd854:      	add	x0, sp, #0x68
 1fbd858:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1fbd85c:      	add	x1, x1, #0xd70
 1fbd860:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1fbd864:      	adrp	x1, 0x2de4000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x8211a8>
 1fbd868:      	add	x1, x1, #0x9b8
 1fbd86c:      	add	x1, x1, #0x40
 1fbd870:      	add	x0, sp, #0x68
 1fbd874:      	add	x8, sp, #0x70
 1fbd878:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1fbd87c:      	add	x8, sp, #0x78
 1fbd880:      	add	x0, sp, #0x70
 1fbd884:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1fbd888:      	add	x1, x1, #0xd38
 1fbd88c:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1fbd890:      	add	x0, sp, #0x60
 1fbd894:      	adrp	x1, 0x25cf000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xc1a8>
 1fbd898:      	add	x1, x1, #0x870
 1fbd89c:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1fbd8a0:      	mov	x8, x22
 1fbd8a4:      	add	x1, sp, #0x60
 1fbd8a8:      	add	x0, sp, #0x78
 1fbd8ac:      	bl	0x2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18b978>
 1fbd8b0:      	mov	w2, #0x1                // =1
 1fbd8b4:      	mov	w1, w2
 1fbd8b8:      	mov	x0, x22
 1fbd8bc:      	bl	0x22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x782c8>
 1fbd8c0:      	mov	x0, x22
 1fbd8c4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1fbd8c8:      	add	x0, sp, #0x60
 1fbd8cc:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1fbd8d0:      	add	x0, sp, #0x78
 1fbd8d4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1fbd8d8:      	add	x0, sp, #0x70
 1fbd8dc:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1fbd8e0:      	add	x0, sp, #0x68
 1fbd8e4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1fbd8e8:      	ldr	x0, [x19, #0xe0]
 1fbd8ec:      	str	x0, [x19, #0xf8]
 1fbd8f0:      	ldp	x19, x20, [sp, #0x10]
 1fbd8f4:      	ldp	x21, x22, [sp, #0x20]
 1fbd8f8:      	ldp	x29, x30, [sp], #0xb0
 1fbd8fc:      	ret
