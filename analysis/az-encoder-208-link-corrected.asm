
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000006cada0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3a210>:
  6cada0:	54ffff01 	b.ne	6cad80 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3a1f0>
  6cada4:	f001a3c2 	adrp	x2, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
  6cada8:	91168042 	add	x2, x2, #0x5a0
  6cadac:	d2844f41 	mov	x1, #0x227a                	// #8826
  6cadb0:	f2b088c1 	movk	x1, #0x8446, lsl #16
  6cadb4:	b9801843 	ldrsw	x3, [x2,#24]
  6cadb8:	f2d21241 	movk	x1, #0x9092, lsl #32
  6cadbc:	f2e03ac1 	movk	x1, #0x1d6, lsl #48
  6cadc0:	f9400444 	ldr	x4, [x2,#8]
  6cadc4:	9ac30822 	udiv	x2, x1, x3
  6cadc8:	9b038442 	msub	x2, x2, x3, x1
  6cadcc:	f862d898 	ldr	x24, [x4,w2,sxtw #3]
  6cadd0:	b5000098 	cbnz	x24, 6cade0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3a250>
  6cadd4:	14000007 	b	6cadf0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3a260>
  6cadd8:	f9400b18 	ldr	x24, [x24,#16]
  6caddc:	b40000b8 	cbz	x24, 6cadf0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3a260>
  6cade0:	f9400302 	ldr	x2, [x24]
  6cade4:	eb01005f 	cmp	x2, x1
  6cade8:	54ffff81 	b.ne	6cadd8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3a248>
  6cadec:	f9400718 	ldr	x24, [x24,#8]
  6cadf0:	88dffc01 	ldar	w1, [x0]
  6cadf4:	7100003f 	cmp	w1, #0x0
  6cadf8:	54000f0d 	b.le	6cafd8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3a448>
  6cadfc:	51000422 	sub	w2, w1, #0x1
  6cae00:	885ffc03 	ldaxr	w3, [x0]
  6cae04:	6b01007f 	cmp	w3, w1
  6cae08:	54000061 	b.ne	6cae14 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3a284>
  6cae0c:	8804fc02 	stlxr	w4, w2, [x0]
  6cae10:	35ffff84 	cbnz	w4, 6cae00 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3a270>
  6cae14:	54fffee1 	b.ne	6cadf0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3a260>
  6cae18:	b4000198 	cbz	x24, 6cae48 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3a2b8>
  6cae1c:	f9400303 	ldr	x3, [x24]
  6cae20:	910082e1 	add	x1, x23, #0x20
  6cae24:	aa1803e0 	mov	x0, x24
  6cae28:	52800022 	mov	w2, #0x1                   	// #1
  6cae2c:	f9401063 	ldr	x3, [x3,#32]
  6cae30:	d63f0060 	blr	x3
  6cae34:	a94153f3 	ldp	x19, x20, [sp,#16]
  6cae38:	a9425bf5 	ldp	x21, x22, [sp,#32]
  6cae3c:	a94363f7 	ldp	x23, x24, [sp,#48]
  6cae40:	a8c77bfd 	ldp	x29, x30, [sp],#112
  6cae44:	d65f03c0 	ret
  6cae48:	910123f3 	add	x19, sp, #0x48
  6cae4c:	f000f7a1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  6cae50:	aa1303e0 	mov	x0, x19
  6cae54:	9136a021 	add	x1, x1, #0xda8
  6cae58:	9471a3a2 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  6cae5c:	910143f4 	add	x20, sp, #0x50
  6cae60:	b000f841 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  6cae64:	9138a021 	add	x1, x1, #0xe28
  6cae68:	91018021 	add	x1, x1, #0x60
  6cae6c:	aa1303e0 	mov	x0, x19
  6cae70:	aa1403e8 	mov	x8, x20
  6cae74:	9471235f 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  6cae78:	910163f5 	add	x21, sp, #0x58
  6cae7c:	b0010801 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  6cae80:	aa1503e8 	mov	x8, x21
  6cae84:	91366021 	add	x1, x1, #0xd98
  6cae88:	aa1403e0 	mov	x0, x20
  6cae8c:	94712359 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
