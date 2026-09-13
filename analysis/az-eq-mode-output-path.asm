
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

000000000090ac18 <_ZSt20__throw_bad_weak_ptrv>:
  a8a7b8:      	stp	x29, x30, [sp, #-0x60]!
  a8a7bc:      	mov	x29, sp
  a8a7c0:      	stp	x19, x20, [sp, #0x10]
  a8a7c4:      	add	x20, x0, #0x38
  a8a7c8:      	mov	x19, x0
  a8a7cc:      	mov	x0, x20
  a8a7d0:      	str	x21, [sp, #0x20]
  a8a7d4:      	mov	x21, x1
  a8a7d8:      	bl	0xa8a3b8 <_ZSt20__throw_bad_weak_ptrv+0x17f7a0>
  a8a7dc:      	tst	w0, #0xff
  a8a7e0:      	b.eq	0xa8a814 <_ZSt20__throw_bad_weak_ptrv+0x17fbfc>
  a8a7e4:      	mov	x0, x20
  a8a7e8:      	bl	0xa8a3b8 <_ZSt20__throw_bad_weak_ptrv+0x17f7a0>
  a8a7ec:      	ldr	x2, [x19, #0x38]
  a8a7f0:      	ldrb	w1, [x21]
  a8a7f4:      	mov	x0, x2
  a8a7f8:      	ldr	x2, [x2]
  a8a7fc:      	ldr	x2, [x2, #0x18]
  a8a800:      	blr	x2
  a8a804:      	ldp	x19, x20, [sp, #0x10]
  a8a808:      	ldr	x21, [sp, #0x20]
  a8a80c:      	ldp	x29, x30, [sp], #0x60
  a8a810:      	ret
  a8a814:      	add	x0, sp, #0x38
  a8a818:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
  a8a81c:      	add	x1, x1, #0xda8
  a8a820:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
  a8a824:      	adrp	x1, 0x26d9000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x1161a8>
  a8a828:      	add	x1, x1, #0x90
  a8a82c:      	add	x1, x1, #0x1b8
  a8a830:      	add	x0, sp, #0x38
  a8a834:      	add	x8, sp, #0x40
  a8a838:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
  a8a83c:      	adrp	x1, 0x27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x2081a8>
  a8a840:      	add	x8, sp, #0x48
  a8a844:      	add	x1, x1, #0xd98
  a8a848:      	add	x0, sp, #0x40
  a8a84c:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
  a8a850:      	adrp	x1, 0x26da000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x1171a8>
  a8a854:      	add	x0, sp, #0x50
  a8a858:      	add	x1, x1, #0xa10
  a8a85c:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
  a8a860:      	add	x1, sp, #0x50
  a8a864:      	add	x8, sp, #0x58
  a8a868:      	add	x0, sp, #0x48
  a8a86c:      	bl	0x2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18b978>
  a8a870:      	mov	w2, #0x1                // =1
  a8a874:      	mov	w1, #0x0                // =0
  a8a878:      	add	x0, sp, #0x58
  a8a87c:      	bl	0x22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x782c8>
  a8a880:      	add	x0, sp, #0x58
  a8a884:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a888:      	add	x0, sp, #0x50
  a8a88c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a890:      	add	x0, sp, #0x48
  a8a894:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a898:      	add	x0, sp, #0x40
  a8a89c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a8a0:      	add	x0, sp, #0x38
  a8a8a4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a8a8:      	ldp	x19, x20, [sp, #0x10]
  a8a8ac:      	ldr	x21, [sp, #0x20]
  a8a8b0:      	ldp	x29, x30, [sp], #0x60
  a8a8b4:      	ret
  a8a8b8:      	mov	x19, x0
  a8a8bc:      	b	0xa8a8fc <_ZSt20__throw_bad_weak_ptrv+0x17fce4>
  a8a8c0:      	mov	x19, x0
  a8a8c4:      	b	0xa8a8f4 <_ZSt20__throw_bad_weak_ptrv+0x17fcdc>
  a8a8c8:      	mov	x19, x0
  a8a8cc:      	b	0xa8a8e4 <_ZSt20__throw_bad_weak_ptrv+0x17fccc>
  a8a8d0:      	mov	x19, x0
  a8a8d4:      	b	0xa8a8ec <_ZSt20__throw_bad_weak_ptrv+0x17fcd4>
  a8a8d8:      	mov	x19, x0
  a8a8dc:      	add	x0, sp, #0x58
  a8a8e0:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a8e4:      	add	x0, sp, #0x50
  a8a8e8:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a8ec:      	add	x0, sp, #0x48
  a8a8f0:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a8f4:      	add	x0, sp, #0x40
  a8a8f8:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a8fc:      	add	x0, sp, #0x38
  a8a900:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a904:      	mov	x0, x19
  a8a908:      	bl	0x424d10 <_Unwind_Resume@plt>
  a8a90c:      	nop
  a8a910:      	stp	x29, x30, [sp, #-0x70]!
  a8a914:      	mov	x29, sp
  a8a918:      	stp	x23, x24, [sp, #0x30]
  a8a91c:      	mov	x24, x0
  a8a920:      	ldr	x0, [x0, #0x328]
  a8a924:      	stp	x19, x20, [sp, #0x10]
  a8a928:      	cbz	x0, 0xa8ab18 <_ZSt20__throw_bad_weak_ptrv+0x17ff00>
  a8a92c:      	ldr	x1, [x1]
  a8a930:      	ldr	x0, [x0, #0x20]
  a8a934:      	cmp	x0, x1
  a8a938:      	b.eq	0xa8a9fc <_ZSt20__throw_bad_weak_ptrv+0x17fde4>
  a8a93c:      	add	x20, sp, #0x48
  a8a940:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
  a8a944:      	mov	x0, x20
  a8a948:      	add	x1, x1, #0xda8
  a8a94c:      	stp	x21, x22, [sp, #0x20]
  a8a950:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
  a8a954:      	add	x21, sp, #0x50
  a8a958:      	adrp	x1, 0x26d9000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x1161a8>
  a8a95c:      	add	x1, x1, #0x90
  a8a960:      	add	x1, x1, #0x1f0
  a8a964:      	mov	x0, x20
  a8a968:      	mov	x8, x21
  a8a96c:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
  a8a970:      	add	x22, sp, #0x58
  a8a974:      	adrp	x1, 0x27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x2081a8>
  a8a978:      	mov	x8, x22
  a8a97c:      	add	x1, x1, #0xd98
  a8a980:      	mov	x0, x21
  a8a984:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
  a8a988:      	add	x23, sp, #0x60
  a8a98c:      	adrp	x1, 0x26da000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x1171a8>
  a8a990:      	mov	x0, x23
  a8a994:      	add	x1, x1, #0xa48
  a8a998:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
  a8a99c:      	add	x19, sp, #0x68
  a8a9a0:      	mov	x1, x23
  a8a9a4:      	mov	x8, x19
  a8a9a8:      	mov	x0, x22
  a8a9ac:      	bl	0x2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18b978>
  a8a9b0:      	mov	w2, #0x1                // =1
  a8a9b4:      	mov	w1, #0x0                // =0
  a8a9b8:      	mov	x0, x19
  a8a9bc:      	bl	0x22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x782c8>
  a8a9c0:      	mov	x0, x19
  a8a9c4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a9c8:      	mov	x0, x23
  a8a9cc:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a9d0:      	mov	x0, x22
  a8a9d4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a9d8:      	mov	x0, x21
  a8a9dc:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a9e0:      	mov	x0, x20
  a8a9e4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8a9e8:      	ldp	x19, x20, [sp, #0x10]
  a8a9ec:      	ldp	x21, x22, [sp, #0x20]
  a8a9f0:      	ldp	x23, x24, [sp, #0x30]
  a8a9f4:      	ldp	x29, x30, [sp], #0x70
  a8a9f8:      	ret
  a8a9fc:      	ldr	w0, [x2]
  a8aa00:      	cbz	w0, 0xa8aafc <_ZSt20__throw_bad_weak_ptrv+0x17fee4>
  a8aa04:      	cmp	w0, #0x1
  a8aa08:      	b.eq	0xa8aae0 <_ZSt20__throw_bad_weak_ptrv+0x17fec8>
  a8aa0c:      	add	x23, sp, #0x60
  a8aa10:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
  a8aa14:      	mov	x0, x23
  a8aa18:      	add	x1, x1, #0xda8
  a8aa1c:      	stp	x21, x22, [sp, #0x20]
  a8aa20:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
  a8aa24:      	add	x22, sp, #0x58
  a8aa28:      	adrp	x1, 0x26d9000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x1161a8>
  a8aa2c:      	add	x1, x1, #0x90
  a8aa30:      	add	x1, x1, #0x140
  a8aa34:      	mov	x0, x23
  a8aa38:      	mov	x8, x22
  a8aa3c:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
  a8aa40:      	add	x21, sp, #0x50
  a8aa44:      	adrp	x1, 0x27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x2081a8>
  a8aa48:      	mov	x8, x21
  a8aa4c:      	add	x1, x1, #0xd98
  a8aa50:      	mov	x0, x22
  a8aa54:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
  a8aa58:      	add	x19, sp, #0x68
  a8aa5c:      	adrp	x1, 0x2693000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xd01a8>
  a8aa60:      	mov	x0, x19
  a8aa64:      	add	x1, x1, #0xf70
  a8aa68:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
  a8aa6c:      	add	x20, sp, #0x48
  a8aa70:      	mov	x1, x19
  a8aa74:      	mov	x8, x20
  a8aa78:      	mov	x0, x21
  a8aa7c:      	bl	0x2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18b978>
  a8aa80:      	mov	w2, #0x1                // =1
  a8aa84:      	mov	w1, #0x0                // =0
  a8aa88:      	mov	x0, x20
  a8aa8c:      	bl	0x22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x782c8>
  a8aa90:      	mov	x0, x20
  a8aa94:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8aa98:      	mov	x0, x19
  a8aa9c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8aaa0:      	mov	x0, x21
  a8aaa4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8aaa8:      	mov	x0, x22
  a8aaac:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8aab0:      	mov	x0, x23
  a8aab4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8aab8:      	mov	w2, #0x0                // =0
  a8aabc:      	mov	x1, x19
  a8aac0:      	mov	x0, x24
  a8aac4:      	strb	w2, [sp, #0x68]
  a8aac8:      	ldp	x21, x22, [sp, #0x20]
  a8aacc:      	bl	0xa8a7b8 <_ZSt20__throw_bad_weak_ptrv+0x17fba0>
  a8aad0:      	ldp	x19, x20, [sp, #0x10]
  a8aad4:      	ldp	x23, x24, [sp, #0x30]
  a8aad8:      	ldp	x29, x30, [sp], #0x70
  a8aadc:      	ret
  a8aae0:      	mov	w2, w0
  a8aae4:      	add	x19, sp, #0x68
  a8aae8:      	mov	x1, x19
  a8aaec:      	mov	x0, x24
  a8aaf0:      	strb	w2, [sp, #0x68]
  a8aaf4:      	bl	0xa8a7b8 <_ZSt20__throw_bad_weak_ptrv+0x17fba0>
  a8aaf8:      	b	0xa8aad0 <_ZSt20__throw_bad_weak_ptrv+0x17feb8>
  a8aafc:      	mov	w2, #0x0                // =0
  a8ab00:      	add	x19, sp, #0x68
  a8ab04:      	mov	x1, x19
  a8ab08:      	mov	x0, x24
  a8ab0c:      	strb	w2, [sp, #0x68]
  a8ab10:      	bl	0xa8a7b8 <_ZSt20__throw_bad_weak_ptrv+0x17fba0>
  a8ab14:      	b	0xa8aad0 <_ZSt20__throw_bad_weak_ptrv+0x17feb8>
  a8ab18:      	add	x20, sp, #0x48
  a8ab1c:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
  a8ab20:      	mov	x0, x20
  a8ab24:      	add	x1, x1, #0xda8
  a8ab28:      	stp	x21, x22, [sp, #0x20]
  a8ab2c:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
  a8ab30:      	add	x21, sp, #0x50
  a8ab34:      	adrp	x1, 0x26d9000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x1161a8>
  a8ab38:      	add	x1, x1, #0x90
  a8ab3c:      	add	x1, x1, #0x1f0
  a8ab40:      	mov	x0, x20
  a8ab44:      	mov	x8, x21
  a8ab48:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
  a8ab4c:      	add	x22, sp, #0x58
  a8ab50:      	adrp	x1, 0x27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x2081a8>
  a8ab54:      	mov	x8, x22
  a8ab58:      	add	x1, x1, #0xd98
  a8ab5c:      	mov	x0, x21
  a8ab60:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
  a8ab64:      	add	x23, sp, #0x60
  a8ab68:      	adrp	x1, 0x26da000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x1171a8>
  a8ab6c:      	mov	x0, x23
  a8ab70:      	add	x1, x1, #0xa28
  a8ab74:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
  a8ab78:      	add	x19, sp, #0x68
  a8ab7c:      	mov	x1, x23
  a8ab80:      	mov	x8, x19
  a8ab84:      	mov	x0, x22
  a8ab88:      	bl	0x2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18b978>
  a8ab8c:      	mov	w2, #0x1                // =1
  a8ab90:      	mov	w1, #0x0                // =0
  a8ab94:      	mov	x0, x19
  a8ab98:      	bl	0x22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x782c8>
  a8ab9c:      	b	0xa8a9c0 <_ZSt20__throw_bad_weak_ptrv+0x17fda8>
  a8aba0:      	mov	x19, x0
  a8aba4:      	mov	x0, x20
  a8aba8:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8abac:      	mov	x0, x19
  a8abb0:      	bl	0x424d10 <_Unwind_Resume@plt>
  a8abb4:      	mov	x19, x0
  a8abb8:      	mov	x0, x23
  a8abbc:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8abc0:      	mov	x0, x19
  a8abc4:      	bl	0x424d10 <_Unwind_Resume@plt>
  a8abc8:      	mov	x19, x0
  a8abcc:      	mov	x0, x22
  a8abd0:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8abd4:      	b	0xa8abb8 <_ZSt20__throw_bad_weak_ptrv+0x17ffa0>
  a8abd8:      	mov	x19, x0
  a8abdc:      	mov	x0, x21
  a8abe0:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8abe4:      	b	0xa8abcc <_ZSt20__throw_bad_weak_ptrv+0x17ffb4>
  a8abe8:      	mov	x20, x0
  a8abec:      	mov	x0, x19
  a8abf0:      	mov	x19, x20
  a8abf4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8abf8:      	b	0xa8abdc <_ZSt20__throw_bad_weak_ptrv+0x17ffc4>
  a8abfc:      	mov	x19, x0
  a8ac00:      	b	0xa8aba4 <_ZSt20__throw_bad_weak_ptrv+0x17ff8c>
  a8ac04:      	mov	x19, x0
  a8ac08:      	b	0xa8ac40 <_ZSt20__throw_bad_weak_ptrv+0x180028>
  a8ac0c:      	mov	x1, x0
  a8ac10:      	mov	x0, x20
  a8ac14:      	mov	x20, x1
  a8ac18:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8ac1c:      	b	0xa8abec <_ZSt20__throw_bad_weak_ptrv+0x17ffd4>
  a8ac20:      	mov	x1, x0
  a8ac24:      	mov	x0, x19
  a8ac28:      	mov	x19, x1
  a8ac2c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8ac30:      	mov	x0, x23
  a8ac34:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8ac38:      	mov	x0, x22
  a8ac3c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8ac40:      	mov	x0, x21
  a8ac44:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
  a8ac48:      	b	0xa8aba4 <_ZSt20__throw_bad_weak_ptrv+0x17ff8c>
  a8ac4c:      	mov	x19, x0
  a8ac50:      	b	0xa8ac30 <_ZSt20__throw_bad_weak_ptrv+0x180018>
  a8ac54:      	mov	x19, x0
  a8ac58:      	b	0xa8ac38 <_ZSt20__throw_bad_weak_ptrv+0x180020>
  a8ac5c:      	mov	x19, x0
  a8ac60:      	b	0xa8ac40 <_ZSt20__throw_bad_weak_ptrv+0x180028>
  a8ac64:      	mov	x19, x0
  a8ac68:      	b	0xa8ac38 <_ZSt20__throw_bad_weak_ptrv+0x180020>
  a8ac6c:      	mov	x19, x0
  a8ac70:      	b	0xa8ac30 <_ZSt20__throw_bad_weak_ptrv+0x180018>
  a8ac74:      	b	0xa8ac20 <_ZSt20__throw_bad_weak_ptrv+0x180008>
  a8ac78:      	sub	x0, x0, #0x8
  a8ac7c:      	b	0xa8a910 <_ZSt20__throw_bad_weak_ptrv+0x17fcf8>

runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 2134518:      	strb	w1, [x0, #0x14]
 213451c:      	ret

runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 215a2f8:      	ldr	x0, [x0, #0x70]
 215a2fc:      	ldrb	w2, [x1]
 215a300:      	ldrb	w5, [x1, #0x1]
 215a304:      	ldrb	w7, [x0, #0x2e9]
 215a308:      	ldrb	w3, [x1, #0x2]
 215a30c:      	ldrb	w4, [x1, #0x3]
 215a310:      	bfxil	w2, w7, #0, #4
 215a314:      	strb	w2, [x1]
 215a318:      	mov	w7, w2
 215a31c:      	ldrb	w2, [x1, #0x4]
 215a320:      	ldrb	w12, [x0, #0x289]
 215a324:      	bfi	w7, w12, #4, #4
 215a328:      	strb	w7, [x1]
 215a32c:      	ldrb	w7, [x0, #0x3a9]
 215a330:      	bfxil	w5, w7, #0, #4
 215a334:      	strb	w5, [x1, #0x1]
 215a338:      	ldrb	w7, [x0, #0x349]
 215a33c:      	bfi	w5, w7, #4, #4
 215a340:      	strb	w5, [x1, #0x1]
 215a344:      	ldrb	w5, [x0, #0x3a8]
 215a348:      	bfxil	w3, w5, #0, #2
 215a34c:      	strb	w3, [x1, #0x2]
 215a350:      	ldrb	w5, [x0, #0x348]
 215a354:      	bfi	w3, w5, #2, #2
 215a358:      	strb	w3, [x1, #0x2]
 215a35c:      	ldrb	w5, [x0, #0x2e8]
 215a360:      	bfi	w3, w5, #4, #2
 215a364:      	strb	w3, [x1, #0x2]
 215a368:      	ldrb	w5, [x0, #0x288]
 215a36c:      	bfi	w3, w5, #6, #2
 215a370:      	strb	w3, [x1, #0x2]
 215a374:      	ldrb	w3, [x0, #0x52a]
 215a378:      	bfxil	w4, w3, #0, #2
 215a37c:      	strb	w4, [x1, #0x3]
 215a380:      	ldrb	w3, [x0, #0x529]
 215a384:      	bfi	w4, w3, #2, #2
 215a388:      	strb	w4, [x1, #0x3]
 215a38c:      	ldrb	w3, [x0, #0x15]
 215a390:      	bfxil	w2, w3, #0, #2
 215a394:      	strb	w2, [x1, #0x4]
 215a398:      	ldrb	w3, [x0, #0x16]
 215a39c:      	bfi	w2, w3, #2, #2
 215a3a0:      	strb	w2, [x1, #0x4]
 215a3a4:      	ldrb	w3, [x0, #0x14]
 215a3a8:      	bfi	w2, w3, #4, #2
 215a3ac:      	strb	w2, [x1, #0x4]
 215a3b0:      	ldrb	w4, [x0, #0x518]
 215a3b4:      	ldrb	w3, [x1, #0x6]
 215a3b8:      	ldrb	w7, [x1, #0x7]
 215a3bc:      	bfi	w2, w4, #6, #2
 215a3c0:      	strb	w2, [x1, #0x4]
