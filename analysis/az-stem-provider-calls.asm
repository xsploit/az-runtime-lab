
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000001df6a98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6c10>:
 1df6a98:	f9402295 	ldr	x21, [x20,#64]
 1df6a9c:	b4000ab5 	cbz	x21, 1df6bf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6d68>
 1df6aa0:	f94002a1 	ldr	x1, [x21]
 1df6aa4:	aa1503e0 	mov	x0, x21
 1df6aa8:	f9400821 	ldr	x1, [x1,#16]
 1df6aac:	d63f0020 	blr	x1
 1df6ab0:	12001c00 	and	w0, w0, #0xff
 1df6ab4:	7100041f 	cmp	w0, #0x1
 1df6ab8:	54fffec1 	b.ne	1df6a90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6c08>
 1df6abc:	b940ca61 	ldr	w1, [x19,#200]
 1df6ac0:	a9425bf5 	ldp	x21, x22, [sp,#32]
 1df6ac4:	531f7821 	lsl	w1, w1, #1
 1df6ac8:	11002c21 	add	w1, w1, #0xb
 1df6acc:	17ffffe1 	b	1df6a50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6bc8>
 1df6ad0:	f9400e80 	ldr	x0, [x20,#24]
 1df6ad4:	b4fffd00 	cbz	x0, 1df6a74 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6bec>
 1df6ad8:	f000ea56 	adrp	x22, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 1df6adc:	9123e2d6 	add	x22, x22, #0x8f8
 1df6ae0:	a90363f7 	stp	x23, x24, [sp,#48]
 1df6ae4:	08dffec0 	ldarb	w0, [x22]
 1df6ae8:	36001720 	tbz	w0, #0, 1df6dcc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6f44>
 1df6aec:	f000ea57 	adrp	x23, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 1df6af0:	912402f7 	add	x23, x23, #0x900
 1df6af4:	b9801ae1 	ldrsw	x1, [x23,#24]
 1df6af8:	f9400e82 	ldr	x2, [x20,#24]
 1df6afc:	f94006e3 	ldr	x3, [x23,#8]
 1df6b00:	9ac10840 	udiv	x0, x2, x1
 1df6b04:	9b018800 	msub	x0, x0, x1, x2
 1df6b08:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
 1df6b0c:	b4000140 	cbz	x0, 1df6b34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6cac>
 1df6b10:	f9400001 	ldr	x1, [x0]
 1df6b14:	eb02003f 	cmp	x1, x2
 1df6b18:	540000a1 	b.ne	1df6b2c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6ca4>
 1df6b1c:	1400007c 	b	1df6d0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6e84>
 1df6b20:	f9400001 	ldr	x1, [x0]
 1df6b24:	eb01005f 	cmp	x2, x1
 1df6b28:	54000f20 	b.eq	1df6d0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6e84>
 1df6b2c:	f9400800 	ldr	x0, [x0,#16]
 1df6b30:	b5ffff80 	cbnz	x0, 1df6b20 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6c98>
 1df6b34:	910163f7 	add	x23, sp, #0x58
 1df6b38:	f0003e41 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 1df6b3c:	aa1703e0 	mov	x0, x23
 1df6b40:	9136a021 	add	x1, x1, #0xda8
 1df6b44:	9414f467 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 1df6b48:	910183f8 	add	x24, sp, #0x60
 1df6b4c:	b0007cc1 	adrp	x1, 2d8f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x7cc1a8>
 1df6b50:	912f0021 	add	x1, x1, #0xbc0
 1df6b54:	9100a021 	add	x1, x1, #0x28
 1df6b58:	aa1703e0 	mov	x0, x23
 1df6b5c:	aa1803e8 	mov	x8, x24
 1df6b60:	94147424 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 1df6b64:	a9046bf9 	stp	x25, x26, [sp,#64]
 1df6b68:	9101a3f9 	add	x25, sp, #0x68
 1df6b6c:	b0004ea1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 1df6b70:	aa1903e8 	mov	x8, x25
 1df6b74:	91366021 	add	x1, x1, #0xd98
 1df6b78:	aa1803e0 	mov	x0, x24
 1df6b7c:	9414741d 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 1df6b80:	910143fa 	add	x26, sp, #0x50
 1df6b84:	90003e61 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
 1df6b88:	aa1a03e0 	mov	x0, x26
 1df6b8c:	912e6021 	add	x1, x1, #0xb98
 1df6b90:	9414f454 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 1df6b94:	9101c3f6 	add	x22, sp, #0x70
 1df6b98:	aa1a03e1 	mov	x1, x26
 1df6b9c:	aa1603e8 	mov	x8, x22
 1df6ba0:	aa1903e0 	mov	x0, x25
 1df6ba4:	941473bb 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 1df6ba8:	52800022 	mov	w2, #0x1                   	// #1
 1df6bac:	52800001 	mov	w1, #0x0                   	// #0
 1df6bb0:	aa1603e0 	mov	x0, x22
 1df6bb4:	9410260b 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 1df6bb8:	aa1603e0 	mov	x0, x22
 1df6bbc:	94141691 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1df6bc0:	aa1a03e0 	mov	x0, x26
 1df6bc4:	9414168f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1df6bc8:	aa1903e0 	mov	x0, x25
 1df6bcc:	9414168d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1df6bd0:	aa1803e0 	mov	x0, x24
 1df6bd4:	9414168b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1df6bd8:	aa1703e0 	mov	x0, x23
 1df6bdc:	94141689 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1df6be0:	f9400a95 	ldr	x21, [x20,#16]
 1df6be4:	a94363f7 	ldp	x23, x24, [sp,#48]
 1df6be8:	a9446bf9 	ldp	x25, x26, [sp,#64]
 1df6bec:	17ffffa2 	b	1df6a74 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6bec>
 1df6bf0:	f9402680 	ldr	x0, [x20,#72]
 1df6bf4:	b4fff560 	cbz	x0, 1df6aa0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6c18>
 1df6bf8:	a90363f7 	stp	x23, x24, [sp,#48]
 1df6bfc:	f000ea58 	adrp	x24, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 1df6c00:	9123e318 	add	x24, x24, #0x8f8
 1df6c04:	08dfff00 	ldarb	w0, [x24]
 1df6c08:	36001da0 	tbz	w0, #0, 1df6fbc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f7134>
 1df6c0c:	f000ea57 	adrp	x23, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 1df6c10:	912402f7 	add	x23, x23, #0x900
 1df6c14:	b9801ae1 	ldrsw	x1, [x23,#24]
 1df6c18:	f9402682 	ldr	x2, [x20,#72]
 1df6c1c:	f94006e3 	ldr	x3, [x23,#8]
 1df6c20:	9ac10840 	udiv	x0, x2, x1
 1df6c24:	9b018800 	msub	x0, x0, x1, x2
 1df6c28:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
 1df6c2c:	b4000140 	cbz	x0, 1df6c54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6dcc>
 1df6c30:	f9400001 	ldr	x1, [x0]
 1df6c34:	eb02003f 	cmp	x1, x2
 1df6c38:	540000a1 	b.ne	1df6c4c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6dc4>
 1df6c3c:	140000b1 	b	1df6f00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f7078>
 1df6c40:	f9400001 	ldr	x1, [x0]
 1df6c44:	eb01005f 	cmp	x2, x1
 1df6c48:	540015c0 	b.eq	1df6f00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f7078>
 1df6c4c:	f9400800 	ldr	x0, [x0,#16]
 1df6c50:	b5ffff80 	cbnz	x0, 1df6c40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6db8>
 1df6c54:	910163f7 	add	x23, sp, #0x58
 1df6c58:	f0003e41 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 1df6c5c:	aa1703e0 	mov	x0, x23
 1df6c60:	9136a021 	add	x1, x1, #0xda8
 1df6c64:	9414f41f 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 1df6c68:	910183f8 	add	x24, sp, #0x60
 1df6c6c:	b0007cc1 	adrp	x1, 2d8f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x7cc1a8>
 1df6c70:	912f0021 	add	x1, x1, #0xbc0
 1df6c74:	91040021 	add	x1, x1, #0x100
 1df6c78:	aa1703e0 	mov	x0, x23
 1df6c7c:	aa1803e8 	mov	x8, x24
 1df6c80:	941473dc 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 1df6c84:	a9046bf9 	stp	x25, x26, [sp,#64]
 1df6c88:	9101a3f9 	add	x25, sp, #0x68
 1df6c8c:	b0004ea1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 1df6c90:	aa1903e8 	mov	x8, x25
 1df6c94:	91366021 	add	x1, x1, #0xd98
 1df6c98:	aa1803e0 	mov	x0, x24
 1df6c9c:	941473d5 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 1df6ca0:	910143fa 	add	x26, sp, #0x50
 1df6ca4:	90003e61 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
 1df6ca8:	aa1a03e0 	mov	x0, x26
 1df6cac:	912e6021 	add	x1, x1, #0xb98
 1df6cb0:	9414f40c 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 1df6cb4:	aa1603e8 	mov	x8, x22
 1df6cb8:	aa1a03e1 	mov	x1, x26
 1df6cbc:	aa1903e0 	mov	x0, x25
 1df6cc0:	94147374 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 1df6cc4:	52800022 	mov	w2, #0x1                   	// #1
 1df6cc8:	52800001 	mov	w1, #0x0                   	// #0
 1df6ccc:	aa1603e0 	mov	x0, x22
 1df6cd0:	941025c4 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 1df6cd4:	aa1603e0 	mov	x0, x22
 1df6cd8:	9414164a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1df6cdc:	aa1a03e0 	mov	x0, x26
 1df6ce0:	94141648 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1df6ce4:	aa1903e0 	mov	x0, x25
 1df6ce8:	94141646 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1df6cec:	aa1803e0 	mov	x0, x24
 1df6cf0:	94141644 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1df6cf4:	aa1703e0 	mov	x0, x23
 1df6cf8:	94141642 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1df6cfc:	a94363f7 	ldp	x23, x24, [sp,#48]
 1df6d00:	a9446bf9 	ldp	x25, x26, [sp,#64]
 1df6d04:	f9402295 	ldr	x21, [x20,#64]
 1df6d08:	17ffff66 	b	1df6aa0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6c18>
 1df6d0c:	f9400416 	ldr	x22, [x0,#8]
 1df6d10:	b4fff136 	cbz	x22, 1df6b34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6cac>
 1df6d14:	d000ea97 	adrp	x23, 3b48000 <stdout@@GLIBC_2.17+0x6f40>
 1df6d18:	912e22f7 	add	x23, x23, #0xb88
 1df6d1c:	08dffee0 	ldarb	w0, [x23]
 1df6d20:	36000880 	tbz	w0, #0, 1df6e30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6fa8>
 1df6d24:	08dffee0 	ldarb	w0, [x23]
 1df6d28:	36000b80 	tbz	w0, #0, 1df6e98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f7010>
 1df6d2c:	d000ea81 	adrp	x1, 3b48000 <stdout@@GLIBC_2.17+0x6f40>
 1df6d30:	912ee021 	add	x1, x1, #0xbb8
 1df6d34:	88dffc20 	ldar	w0, [x1]
 1df6d38:	37f80420 	tbnz	w0, #31, 1df6dbc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6f34>
 1df6d3c:	11000402 	add	w2, w0, #0x1
 1df6d40:	885ffc23 	ldaxr	w3, [x1]
 1df6d44:	6b00007f 	cmp	w3, w0
 1df6d48:	54000061 	b.ne	1df6d54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6ecc>
 1df6d4c:	8804fc22 	stlxr	w4, w2, [x1]
 1df6d50:	35ffff84 	cbnz	w4, 1df6d40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6eb8>
 1df6d54:	54ffff01 	b.ne	1df6d34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6eac>
 1df6d58:	d000ea80 	adrp	x0, 3b48000 <stdout@@GLIBC_2.17+0x6f40>
 1df6d5c:	912e4000 	add	x0, x0, #0xb90
 1df6d60:	b9801802 	ldrsw	x2, [x0,#24]
 1df6d64:	f9400403 	ldr	x3, [x0,#8]
 1df6d68:	9ac20ac0 	udiv	x0, x22, x2
 1df6d6c:	9b02d800 	msub	x0, x0, x2, x22
 1df6d70:	f860d875 	ldr	x21, [x3,w0,sxtw #3]
 1df6d74:	b5000095 	cbnz	x21, 1df6d84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6efc>
 1df6d78:	14000007 	b	1df6d94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6f0c>
 1df6d7c:	f9400ab5 	ldr	x21, [x21,#16]
 1df6d80:	b40000b5 	cbz	x21, 1df6d94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6f0c>
 1df6d84:	f94002a0 	ldr	x0, [x21]
 1df6d88:	eb0002df 	cmp	x22, x0
 1df6d8c:	54ffff81 	b.ne	1df6d7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6ef4>
 1df6d90:	f94006b5 	ldr	x21, [x21,#8]
 1df6d94:	88dffc20 	ldar	w0, [x1]
 1df6d98:	7100001f 	cmp	w0, #0x0
 1df6d9c:	54001b2d 	b.le	1df7100 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f7278>
 1df6da0:	51000402 	sub	w2, w0, #0x1
 1df6da4:	885ffc23 	ldaxr	w3, [x1]
 1df6da8:	6b00007f 	cmp	w3, w0
 1df6dac:	54000061 	b.ne	1df6db8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6f30>
 1df6db0:	8804fc22 	stlxr	w4, w2, [x1]
 1df6db4:	35ffff84 	cbnz	w4, 1df6da4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6f1c>
 1df6db8:	54fffee1 	b.ne	1df6d94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6f0c>
 1df6dbc:	9101c3f6 	add	x22, sp, #0x70
 1df6dc0:	a94363f7 	ldp	x23, x24, [sp,#48]
 1df6dc4:	f9000a95 	str	x21, [x20,#16]
 1df6dc8:	17ffff2b 	b	1df6a74 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6bec>
 1df6dcc:	aa1603e0 	mov	x0, x22
 1df6dd0:	f000ea57 	adrp	x23, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 1df6dd4:	9798bd23 	bl	426260 <__cxa_guard_acquire@plt>
 1df6dd8:	912402f7 	add	x23, x23, #0x900
 1df6ddc:	34ffe8c0 	cbz	w0, 1df6af4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6c6c>
 1df6de0:	d2809800 	mov	x0, #0x4c0                 	// #1216
 1df6de4:	b90022ff 	str	wzr, [x23,#32]
 1df6de8:	9798b87a 	bl	424fd0 <malloc@plt>
 1df6dec:	f90006e0 	str	x0, [x23,#8]
