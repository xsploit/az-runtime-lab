
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021eed10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66bf8>:
 21eed10:	f94052a0 	ldr	x0, [x21,#160]
 21eed14:	b94012f8 	ldr	w24, [x23,#16]
 21eed18:	b9400ae1 	ldr	w1, [x23,#8]
 21eed1c:	11000716 	add	w22, w24, #0x1
 21eed20:	6b0102df 	cmp	w22, w1
 21eed24:	5400020d 	b.le	21eed64 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66c4c>
 21eed28:	0b567ed4 	add	w20, w22, w22, lsr #31
 21eed2c:	0b9406d4 	add	w20, w22, w20, asr #1
 21eed30:	11002294 	add	w20, w20, #0x8
 21eed34:	121d7294 	and	w20, w20, #0xfffffff8
 21eed38:	6b14003f 	cmp	w1, w20
 21eed3c:	54000140 	b.eq	21eed64 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66c4c>
 21eed40:	7100029f 	cmp	w20, #0x0
 21eed44:	5400032d 	b.le	21eeda8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66c90>
 21eed48:	93407e81 	sxtw	x1, w20
 21eed4c:	b40003a0 	cbz	x0, 21eedc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66ca8>
 21eed50:	9788d5d4 	bl	4244a0 <realloc@plt>
 21eed54:	b94012f8 	ldr	w24, [x23,#16]
 21eed58:	f90052a0 	str	x0, [x21,#160]
 21eed5c:	11000716 	add	w22, w24, #0x1
 21eed60:	b9000af4 	str	w20, [x23,#8]
 21eed64:	b90012f6 	str	w22, [x23,#16]
 21eed68:	3838c813 	strb	w19, [x0,w24,sxtw]
 21eed6c:	17ffffd5 	b	21eecc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66ba8>
 21eed70:	aa1603e0 	mov	x0, x22
 21eed74:	f000ce17 	adrp	x23, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 21eed78:	9788dd3a 	bl	426260 <__cxa_guard_acquire@plt>
 21eed7c:	34fff9c0 	cbz	w0, 21eecb4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66b9c>
 21eed80:	979306e2 	bl	6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1fd78>
 21eed84:	b90c6ae0 	str	w0, [x23,#3176]
 21eed88:	aa1603e0 	mov	x0, x22
 21eed8c:	9788dead 	bl	426840 <__cxa_guard_release@plt>
 21eed90:	17ffffc9 	b	21eecb4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66b9c>
 21eed94:	aa1303e0 	mov	x0, x19
 21eed98:	aa1403e1 	mov	x1, x20
 21eed9c:	d63f0040 	blr	x2
 21eeda0:	12001c13 	and	w19, w0, #0xff
 21eeda4:	17ffffd6 	b	21eecfc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66be4>
 21eeda8:	9788d752 	bl	424af0 <free@plt>
 21eedac:	b94012f8 	ldr	w24, [x23,#16]
