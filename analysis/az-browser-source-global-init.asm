
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000065fe90 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base-0x14448>:
  65fe90:	aa1503e0 	mov	x0, x21
  65fe94:	97f71c07 	bl	426eb0 <__cxa_atexit@plt>
  65fe98:	aa1303e0 	mov	x0, x19
  65fe9c:	90010c61 	adrp	x1, 27eb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2281a8>
  65fea0:	91230021 	add	x1, x1, #0x8c0
  65fea4:	94734f8f 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  65fea8:	aa1403e2 	mov	x2, x20
  65feac:	aa1303e1 	mov	x1, x19
  65feb0:	aa1503e0 	mov	x0, x21
  65feb4:	a94153f3 	ldp	x19, x20, [sp,#16]
  65feb8:	a9425bf5 	ldp	x21, x22, [sp,#32]
  65febc:	f9401bf7 	ldr	x23, [sp,#48]
  65fec0:	a8c47bfd 	ldp	x29, x30, [sp],#64
  65fec4:	17f71bfb 	b	426eb0 <__cxa_atexit@plt>
  65fec8:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
  65fecc:	910003fd 	mov	x29, sp
  65fed0:	a90153f3 	stp	x19, x20, [sp,#16]
  65fed4:	9001aa93 	adrp	x19, 3baf000 <stdout@@GLIBC_2.17+0x6df40>
  65fed8:	9119a273 	add	x19, x19, #0x668
  65fedc:	a9025bf5 	stp	x21, x22, [sp,#32]
  65fee0:	9100e275 	add	x21, x19, #0x38
  65fee4:	aa1503e0 	mov	x0, x21
  65fee8:	f001a634 	adrp	x20, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  65feec:	9135a294 	add	x20, x20, #0xd68
  65fef0:	f9001bf7 	str	x23, [sp,#48]
  65fef4:	97f71d43 	bl	427400 <_ZNSt8ios_base4InitC1Ev@plt>
  65fef8:	aa1403e2 	mov	x2, x20
  65fefc:	aa1503e1 	mov	x1, x21
  65ff00:	f0ffee20 	adrp	x0, 426000 <curl_url_set@plt>
  65ff04:	91294000 	add	x0, x0, #0xa50
  65ff08:	97f71bea 	bl	426eb0 <__cxa_atexit@plt>
  65ff0c:	91002277 	add	x23, x19, #0x8
  65ff10:	91010260 	add	x0, x19, #0x40
  65ff14:	94733d9f 	bl	232f590 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a7478>
  65ff18:	aa1703e0 	mov	x0, x23
  65ff1c:	d0011961 	adrp	x1, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
  65ff20:	91304021 	add	x1, x1, #0xc10
  65ff24:	947392cb 	bl	2344a50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bc938>
  65ff28:	aa1403e2 	mov	x2, x20
  65ff2c:	b000e4f5 	adrp	x21, 22fc000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x173ee8>
  65ff30:	911e42b5 	add	x21, x21, #0x790
  65ff34:	91006276 	add	x22, x19, #0x18
  65ff38:	aa1703e1 	mov	x1, x23
  65ff3c:	aa1503e0 	mov	x0, x21
  65ff40:	97f71bdc 	bl	426eb0 <__cxa_atexit@plt>
  65ff44:	91086277 	add	x23, x19, #0x218
  65ff48:	aa1603e0 	mov	x0, x22
  65ff4c:	d0011961 	adrp	x1, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
  65ff50:	91308021 	add	x1, x1, #0xc20
  65ff54:	947392bf 	bl	2344a50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bc938>
  65ff58:	aa1403e2 	mov	x2, x20
  65ff5c:	aa1603e1 	mov	x1, x22
  65ff60:	aa1503e0 	mov	x0, x21
  65ff64:	91008276 	add	x22, x19, #0x20
  65ff68:	97f71bd2 	bl	426eb0 <__cxa_atexit@plt>
  65ff6c:	aa1603e0 	mov	x0, x22
  65ff70:	d0011961 	adrp	x1, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
  65ff74:	9130c021 	add	x1, x1, #0xc30
  65ff78:	947392b6 	bl	2344a50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1bc938>
  65ff7c:	aa1403e2 	mov	x2, x20
  65ff80:	aa1603e1 	mov	x1, x22
  65ff84:	aa1503e0 	mov	x0, x21
  65ff88:	9100a276 	add	x22, x19, #0x28
  65ff8c:	97f71bc9 	bl	426eb0 <__cxa_atexit@plt>
