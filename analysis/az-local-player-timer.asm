
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1e278c0:      	ldp	x23, x24, [sp, #0x30]
 1e278c4:      	ldp	x29, x30, [sp], #0x100
 1e278c8:      	ret
 1e278cc:      	add	x19, sp, #0x70
 1e278d0:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1e278d4:      	mov	x0, x19
 1e278d8:      	add	x1, x1, #0xda8
 1e278dc:      	stp	x21, x22, [sp, #0x20]
 1e278e0:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1e278e4:      	add	x22, sp, #0x78
 1e278e8:      	adrp	x1, 0x2da4000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7e11a8>
 1e278ec:      	add	x1, x1, #0x700
 1e278f0:      	add	x1, x1, #0x300
 1e278f4:      	mov	x0, x19
 1e278f8:      	mov	x8, x22
 1e278fc:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1e27900:      	add	x20, sp, #0x80
 1e27904:      	adrp	x1, 0x27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x2081a8>
 1e27908:      	mov	x8, x20
 1e2790c:      	add	x1, x1, #0xd98
 1e27910:      	mov	x0, x22
 1e27914:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1e27918:      	stp	x23, x24, [sp, #0x30]
 1e2791c:      	add	x23, sp, #0x68
 1e27920:      	adrp	x1, 0x266f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xac1a8>
 1e27924:      	mov	x0, x23
 1e27928:      	add	x1, x1, #0x1b8
 1e2792c:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1e27930:      	add	x21, sp, #0xc0
 1e27934:      	mov	x1, x23
 1e27938:      	mov	x8, x21
 1e2793c:      	mov	x0, x20
 1e27940:      	bl	0x2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18b978>
 1e27944:      	mov	w2, #0x1                // =1
 1e27948:      	mov	w1, #0x0                // =0
 1e2794c:      	mov	x0, x21
 1e27950:      	bl	0x22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x782c8>
 1e27954:      	b	0x1e27890 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627a08>
 1e27958:      	ldr	x0, [x19, #0xb0]
 1e2795c:      	add	x20, sp, #0x80
 1e27960:      	mov	x8, x20
 1e27964:      	add	x21, sp, #0xc0
 1e27968:      	stp	x25, x26, [sp, #0x40]
 1e2796c:      	add	x26, x19, #0xc0
 1e27970:      	bl	0x1492ce0 <_ZNSt15recursive_mutex4lockEv+0x7138>
 1e27974:      	mov	x1, x20
 1e27978:      	mov	x0, x26
 1e2797c:      	mov	x8, x21
 1e27980:      	bl	0x1e1ef88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x61f100>
 1e27984:      	mov	x1, x21
 1e27988:      	mov	x0, x26
 1e2798c:      	bl	0x1e26ef0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627068>
 1e27990:      	ldp	x0, x1, [sp, #0xd8]
 1e27994:      	stp	x27, x28, [sp, #0x50]
 1e27998:      	cmp	x0, x1
 1e2799c:      	b.eq	0x1e279a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627b1c>
 1e279a0:      	str	x0, [sp, #0xe0]
 1e279a4:      	cbz	x0, 0x1e279ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627b24>
 1e279a8:      	bl	0x424e50 <_ZdlPv@plt>
 1e279ac:      	mov	x0, x20
 1e279b0:      	bl	0x75b3c0 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev+0x62618>
 1e279b4:      	mov	w1, #0x1                // =1
 1e279b8:      	mov	x0, x22
 1e279bc:      	bl	0x75d770 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev+0x649c8>
 1e279c0:      	mov	w1, #0x1                // =1
 1e279c4:      	mov	x0, x24
 1e279c8:      	ldr	x25, [x19, #0x80]
 1e279cc:      	bl	0xafe218 <_ZSt20__throw_bad_weak_ptrv+0x1f3600>
 1e279d0:      	mov	x0, #0x18               // =24
 1e279d4:      	ldr	x27, [x19, #0x90]
 1e279d8:      	ldr	x28, [x19, #0xb0]
 1e279dc:      	bl	0x424d40 <_Znwm@plt>
 1e279e0:      	mov	x23, x0
 1e279e4:      	adrp	x1, 0x2da2000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7df1a8>
 1e279e8:      	add	x1, x1, #0x450
 1e279ec:      	movi	v0.2s, #0x1
 1e279f0:      	mov	x0, x25
 1e279f4:      	str	x1, [x23]
 1e279f8:      	ldr	x1, [x25]
 1e279fc:      	ldr	x1, [x1, #0x28]
 1e27a00:      	str	d0, [x23, #0x8]
 1e27a04:      	blr	x1
 1e27a08:      	tst	w0, #0xff
 1e27a0c:      	b.ne	0x1e27a7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627bf4>
 1e27a10:      	ldr	x1, [x25]
 1e27a14:      	mov	x0, x25
 1e27a18:      	ldr	x1, [x1, #0x38]
 1e27a1c:      	blr	x1
 1e27a20:      	tst	w0, #0xff
 1e27a24:      	b.ne	0x1e27a7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627bf4>
 1e27a28:      	ldr	x1, [x27]
 1e27a2c:      	mov	x0, x27
 1e27a30:      	ldr	x1, [x1, #0x18]
 1e27a34:      	blr	x1
 1e27a38:      	tst	w0, #0xff
 1e27a3c:      	b.ne	0x1e27b88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627d00>
 1e27a40:      	ldr	x1, [x27]
 1e27a44:      	mov	x0, x27
 1e27a48:      	ldr	x1, [x1, #0x10]
 1e27a4c:      	blr	x1
 1e27a50:      	tst	w0, #0xff
 1e27a54:      	b.ne	0x1e27b80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627cf8>
 1e27a58:      	mov	x0, x28
 1e27a5c:      	bl	0x14928f8 <_ZNSt15recursive_mutex4lockEv+0x6d50>
 1e27a60:      	mov	w2, #0x3                // =3
 1e27a64:      	cmp	w0, #0x1
 1e27a68:      	b.eq	0x1e27a80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627bf8>
 1e27a6c:      	cmp	w0, #0x2
 1e27a70:      	cset	w2, eq
 1e27a74:      	lsl	w2, w2, #2
 1e27a78:      	b	0x1e27a80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627bf8>
 1e27a7c:      	mov	w2, #0x1                // =1
 1e27a80:      	mov	x25, x23
 1e27a84:      	mov	w1, #0x1                // =1
 1e27a88:      	mov	x0, x24
 1e27a8c:      	str	w2, [x25, #0x10]!
 1e27a90:      	bl	0xafe218 <_ZSt20__throw_bad_weak_ptrv+0x1f3600>
 1e27a94:      	ldr	x1, [x19, #0x90]
 1e27a98:      	mov	x0, x1
 1e27a9c:      	ldr	x1, [x1]
 1e27aa0:      	ldr	x1, [x1, #0x10]
 1e27aa4:      	blr	x1
 1e27aa8:      	tst	w0, #0xff
 1e27aac:      	b.ne	0x1e27b4c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627cc4>
 1e27ab0:      	ldr	w0, [x23, #0x10]
 1e27ab4:      	cmp	w0, #0x4
 1e27ab8:      	b.eq	0x1e27af0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627c68>
 1e27abc:      	str	x25, [x19, #0x170]
 1e27ac0:      	add	x0, x19, #0x178
 1e27ac4:      	mov	x1, x23
 1e27ac8:      	bl	0x1e1a060 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x61a1d8>
 1e27acc:      	mov	x0, x23
 1e27ad0:      	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 1e27ad4:      	ldp	x19, x20, [sp, #0x10]
 1e27ad8:      	ldp	x21, x22, [sp, #0x20]
 1e27adc:      	ldp	x23, x24, [sp, #0x30]
 1e27ae0:      	ldp	x25, x26, [sp, #0x40]
 1e27ae4:      	ldp	x27, x28, [sp, #0x50]
 1e27ae8:      	ldp	x29, x30, [sp], #0x100
 1e27aec:      	ret
 1e27af0:      	ldr	x0, [x19, #0x170]
 1e27af4:      	ldr	w1, [x0]
 1e27af8:      	cmp	w1, #0x1
 1e27afc:      	b.eq	0x1e27b90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627d08>
 1e27b00:      	cmp	w1, #0x3
 1e27b04:      	b.ne	0x1e27abc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627c34>
 1e27b08:      	mov	x8, x20
 1e27b0c:      	mov	x0, x26
 1e27b10:      	bl	0x1e1f038 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x61f1b0>
 1e27b14:      	ldp	x0, x1, [sp, #0x98]
 1e27b18:      	ldr	w20, [sp, #0xb8]
 1e27b1c:      	cmp	x0, x1
 1e27b20:      	b.eq	0x1e27b28 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627ca0>
 1e27b24:      	str	x0, [sp, #0xa0]
 1e27b28:      	cbz	x0, 0x1e27b30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627ca8>
 1e27b2c:      	bl	0x424e50 <_ZdlPv@plt>
 1e27b30:      	ldr	w0, [x19, #0x180]
 1e27b34:      	cmp	w20, w0
 1e27b38:      	b.eq	0x1e27be8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627d60>
 1e27b3c:      	cmp	w20, #0x0
 1e27b40:      	ccmp	w0, #0x0, #0x4, ne
 1e27b44:      	b.eq	0x1e27abc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627c34>
 1e27b48:      	b	0x1e27acc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627c44>
 1e27b4c:      	mov	x0, x24
 1e27b50:      	mov	w1, #0x1                // =1
 1e27b54:      	bl	0xafe218 <_ZSt20__throw_bad_weak_ptrv+0x1f3600>
 1e27b58:      	ldr	x1, [x19, #0x90]
 1e27b5c:      	mov	x0, x1
 1e27b60:      	ldr	x1, [x1]
 1e27b64:      	ldr	x1, [x1, #0x28]
 1e27b68:      	blr	x1
 1e27b6c:      	ldr	w0, [x0, #0x38]
 1e27b70:      	cmp	w0, #0x0
 1e27b74:      	b.le	0x1e27ab0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627c28>
 1e27b78:      	str	w0, [x19, #0x180]
 1e27b7c:      	b	0x1e27ab0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627c28>
 1e27b80:      	mov	w2, #0x3                // =3
 1e27b84:      	b	0x1e27a80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627bf8>
 1e27b88:      	mov	w2, #0x2                // =2
 1e27b8c:      	b	0x1e27a80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627bf8>
 1e27b90:      	mov	x0, x22
 1e27b94:      	bl	0x75d770 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev+0x649c8>
 1e27b98:      	ldr	x1, [x19, #0x80]
 1e27b9c:      	mov	x0, x1
 1e27ba0:      	ldr	x1, [x1]
 1e27ba4:      	ldr	x1, [x1, #0x50]
 1e27ba8:      	blr	x1
 1e27bac:      	mov	w22, w0
 1e27bb0:      	mov	x8, x21
 1e27bb4:      	mov	x0, x26
 1e27bb8:      	bl	0x1e1f038 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x61f1b0>
 1e27bbc:      	ldp	x0, x1, [sp, #0xd8]
 1e27bc0:      	ldr	w20, [sp, #0xf8]
 1e27bc4:      	cmp	x0, x1
 1e27bc8:      	b.eq	0x1e27bd0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627d48>
 1e27bcc:      	str	x0, [sp, #0xe0]
 1e27bd0:      	cbz	x0, 0x1e27bd8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627d50>
 1e27bd4:      	bl	0x424e50 <_ZdlPv@plt>
 1e27bd8:      	cmp	w22, w20
 1e27bdc:      	b.eq	0x1e27be8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627d60>
 1e27be0:      	cbnz	w20, 0x1e27acc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627c44>
 1e27be4:      	b	0x1e27abc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627c34>
 1e27be8:      	str	x25, [x19, #0x170]
 1e27bec:      	mov	x1, x23
 1e27bf0:      	add	x0, x19, #0x178
 1e27bf4:      	bl	0x1e1a060 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x61a1d8>
 1e27bf8:      	str	wzr, [x19, #0x180]
 1e27bfc:      	b	0x1e27acc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627c44>
 1e27c00:      	mov	x1, x0
 1e27c04:      	mov	x0, x21
 1e27c08:      	mov	x21, x1
 1e27c0c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e27c10:      	mov	x0, x23
 1e27c14:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e27c18:      	mov	x0, x20
 1e27c1c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e27c20:      	ldp	x23, x24, [sp, #0x30]
 1e27c24:      	mov	x20, x21
 1e27c28:      	mov	x0, x22
 1e27c2c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e27c30:      	stp	x23, x24, [sp, #0x30]
 1e27c34:      	b	0x1e27c90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627e08>
 1e27c38:      	mov	x19, x0
 1e27c3c:      	mov	x0, x23
 1e27c40:      	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 1e27c44:      	mov	x0, x19
 1e27c48:      	bl	0x424d10 <_Unwind_Resume@plt>
 1e27c4c:      	mov	x20, x0
 1e27c50:      	stp	x23, x24, [sp, #0x30]
 1e27c54:      	b	0x1e27c90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627e08>
 1e27c58:      	mov	x21, x0
 1e27c5c:      	b	0x1e27c18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627d90>
 1e27c60:      	mov	x21, x0
 1e27c64:      	b	0x1e27c10 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627d88>
 1e27c68:      	mov	x20, x0
 1e27c6c:      	b	0x1e27c28 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627da0>
 1e27c70:      	mov	x19, x0
 1e27c74:      	mov	x0, x23
 1e27c78:      	bl	0x424e50 <_ZdlPv@plt>
 1e27c7c:      	mov	x0, x19
 1e27c80:      	bl	0x424d10 <_Unwind_Resume@plt>
 1e27c84:      	mov	x20, x0
 1e27c88:      	mov	x0, x22
 1e27c8c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e27c90:      	mov	x0, x19
 1e27c94:      	stp	x25, x26, [sp, #0x40]
 1e27c98:      	stp	x27, x28, [sp, #0x50]
 1e27c9c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e27ca0:      	mov	x0, x20
 1e27ca4:      	bl	0x424d10 <_Unwind_Resume@plt>
 1e27ca8:      	mov	x21, x0
 1e27cac:      	mov	x0, x20
 1e27cb0:      	mov	x20, x21
 1e27cb4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e27cb8:      	b	0x1e27c88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627e00>
 1e27cbc:      	mov	x21, x0
 1e27cc0:      	b	0x1e27cd4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627e4c>
 1e27cc4:      	mov	x1, x0
 1e27cc8:      	mov	x0, x21
 1e27ccc:      	mov	x21, x1
 1e27cd0:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e27cd4:      	mov	x0, x23
 1e27cd8:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e27cdc:      	b	0x1e27cac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627e24>
 1e27ce0:      	mov	x19, x0
 1e27ce4:      	mov	x0, x20
 1e27ce8:      	stp	x27, x28, [sp, #0x50]
 1e27cec:      	bl	0x75b3c0 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev+0x62618>
 1e27cf0:      	mov	x0, x19
 1e27cf4:      	bl	0x424d10 <_Unwind_Resume@plt>
 1e27cf8:      	mov	x19, x0
 1e27cfc:      	ldp	x1, x0, [sp, #0xd8]
