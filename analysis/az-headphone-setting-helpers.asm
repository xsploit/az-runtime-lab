
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000a82918 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177d00>:
  a82918:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
  a8291c:	d2800700 	mov	x0, #0x38                  	// #56
  a82920:	910003fd 	mov	x29, sp
  a82924:	f9000bf3 	str	x19, [sp,#16]
  a82928:	97e68ed2 	bl	426470 <__cxa_allocate_exception@plt>
  a8292c:	f000db43 	adrp	x3, 25ed000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a1a8>
  a82930:	aa0003f3 	mov	x19, x0
  a82934:	911b4063 	add	x3, x3, #0x6d0
  a82938:	f000db42 	adrp	x2, 25ed000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a1a8>
  a8293c:	f000db41 	adrp	x1, 25ed000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a1a8>
  a82940:	911c2042 	add	x2, x2, #0x708
  a82944:	911d0021 	add	x1, x1, #0x740
  a82948:	f000db45 	adrp	x5, 25ed000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a1a8>
  a8294c:	f000db44 	adrp	x4, 25ed000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a1a8>
  a82950:	9119c0a5 	add	x5, x5, #0x670
  a82954:	911a6084 	add	x4, x4, #0x698
  a82958:	12800006 	mov	w6, #0xffffffff            	// #-1
  a8295c:	910083e0 	add	x0, sp, #0x20
  a82960:	a9000a63 	stp	x3, x2, [x19]
  a82964:	a9017e7f 	stp	xzr, xzr, [x19,#16]
  a82968:	f900127f 	str	xzr, [x19,#32]
  a8296c:	a90213e5 	stp	x5, x4, [sp,#32]
  a82970:	b9002a66 	str	w6, [x19,#40]
  a82974:	f9001a61 	str	x1, [x19,#48]
  a82978:	a9037fff 	stp	xzr, xzr, [sp,#48]
  a8297c:	f90023ff 	str	xzr, [sp,#64]
  a82980:	b9004be6 	str	w6, [sp,#72]
  a82984:	97f379e1 	bl	761108 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x68360>
  a82988:	f0ffe6e2 	adrp	x2, 761000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x68258>
  a8298c:	f000db41 	adrp	x1, 25ed000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a1a8>
  a82990:	aa1303e0 	mov	x0, x19
  a82994:	91284042 	add	x2, x2, #0xa10
  a82998:	91070021 	add	x1, x1, #0x1c0
  a8299c:	97e68881 	bl	424ba0 <__cxa_throw@plt>
  a829a0:	b9400020 	ldr	w0, [x1]
  a829a4:	340005c0 	cbz	w0, a82a5c <_ZSt20__throw_bad_weak_ptrv@@Base+0x177e44>
  a829a8:	7100041f 	cmp	w0, #0x1
  a829ac:	54000560 	b.eq	a82a58 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177e40>
  a829b0:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
  a829b4:	f000d9e1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a829b8:	9136a021 	add	x1, x1, #0xda8
  a829bc:	910003fd 	mov	x29, sp
  a829c0:	9100a3e0 	add	x0, sp, #0x28
  a829c4:	9462c4c7 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a829c8:	f000e281 	adrp	x1, 26d5000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1121a8>
  a829cc:	910ee021 	add	x1, x1, #0x3b8
  a829d0:	91066021 	add	x1, x1, #0x198
  a829d4:	9100a3e0 	add	x0, sp, #0x28
  a829d8:	9100c3e8 	add	x8, sp, #0x30
  a829dc:	94624485 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a829e0:	b000ea41 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a829e4:	9100e3e8 	add	x8, sp, #0x38
  a829e8:	91366021 	add	x1, x1, #0xd98
  a829ec:	9100c3e0 	add	x0, sp, #0x30
  a829f0:	94624480 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a829f4:	b000e081 	adrp	x1, 2693000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xd01a8>
  a829f8:	910103e0 	add	x0, sp, #0x40
  a829fc:	913dc021 	add	x1, x1, #0xf70
  a82a00:	9462c4b8 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a82a04:	910103e1 	add	x1, sp, #0x40
  a82a08:	910123e8 	add	x8, sp, #0x48
  a82a0c:	9100e3e0 	add	x0, sp, #0x38
  a82a10:	94624420 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a82a14:	52800022 	mov	w2, #0x1                   	// #1
  a82a18:	52800001 	mov	w1, #0x0                   	// #0
  a82a1c:	910123e0 	add	x0, sp, #0x48
  a82a20:	945df670 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a82a24:	910123e0 	add	x0, sp, #0x48
  a82a28:	9461e6f6 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82a2c:	910103e0 	add	x0, sp, #0x40
  a82a30:	9461e6f4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82a34:	9100e3e0 	add	x0, sp, #0x38
  a82a38:	9461e6f2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82a3c:	9100c3e0 	add	x0, sp, #0x30
  a82a40:	9461e6f0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82a44:	9100a3e0 	add	x0, sp, #0x28
  a82a48:	9461e6ee 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82a4c:	52800000 	mov	w0, #0x0                   	// #0
  a82a50:	a8c57bfd 	ldp	x29, x30, [sp],#80
  a82a54:	d65f03c0 	ret
  a82a58:	d65f03c0 	ret
  a82a5c:	52800000 	mov	w0, #0x0                   	// #0
  a82a60:	d65f03c0 	ret
  a82a64:	f9000bf3 	str	x19, [sp,#16]
  a82a68:	aa0003f3 	mov	x19, x0
  a82a6c:	1400000b 	b	a82a98 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177e80>
  a82a70:	f9000bf3 	str	x19, [sp,#16]
  a82a74:	aa0003f3 	mov	x19, x0
  a82a78:	910123e0 	add	x0, sp, #0x48
  a82a7c:	9461e6e1 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82a80:	910103e0 	add	x0, sp, #0x40
  a82a84:	9461e6df 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82a88:	9100e3e0 	add	x0, sp, #0x38
  a82a8c:	9461e6dd 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82a90:	9100c3e0 	add	x0, sp, #0x30
  a82a94:	9461e6db 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82a98:	9100a3e0 	add	x0, sp, #0x28
  a82a9c:	9461e6d9 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a82aa0:	aa1303e0 	mov	x0, x19
  a82aa4:	97e6889b 	bl	424d10 <_Unwind_Resume@plt>
  a82aa8:	f9000bf3 	str	x19, [sp,#16]
  a82aac:	aa0003f3 	mov	x19, x0
  a82ab0:	17fffff6 	b	a82a88 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177e70>
  a82ab4:	f9000bf3 	str	x19, [sp,#16]
  a82ab8:	aa0003f3 	mov	x19, x0
  a82abc:	17fffff1 	b	a82a80 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177e68>
  a82ac0:	f9000bf3 	str	x19, [sp,#16]
  a82ac4:	aa0003f3 	mov	x19, x0
  a82ac8:	17fffff2 	b	a82a90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177e78>
  a82acc:	d503201f 	nop
  a82ad0:	f9401402 	ldr	x2, [x0,#40]
  a82ad4:	39400021 	ldrb	w1, [x1]
  a82ad8:	aa0203e0 	mov	x0, x2
  a82adc:	f9400042 	ldr	x2, [x2]
  a82ae0:	f9400842 	ldr	x2, [x2,#16]
  a82ae4:	d61f0040 	br	x2
  a82ae8:	b9400020 	ldr	w0, [x1]
  a82aec:	71000c1f 	cmp	w0, #0x3
  a82af0:	540000c8 	b.hi	a82b08 <_ZSt20__throw_bad_weak_ptrv@@Base+0x177ef0>
  a82af4:	f000e281 	adrp	x1, 26d5000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1121a8>
  a82af8:	910ee021 	add	x1, x1, #0x3b8
  a82afc:	8b204020 	add	x0, x1, w0, uxtw
  a82b00:	39420000 	ldrb	w0, [x0,#128]
  a82b04:	d65f03c0 	ret
  a82b08:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
  a82b0c:	f000d9e1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a82b10:	9136a021 	add	x1, x1, #0xda8
  a82b14:	910003fd 	mov	x29, sp
