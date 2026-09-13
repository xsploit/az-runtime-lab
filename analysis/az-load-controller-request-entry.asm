
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000a371f0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c5d8>:
  a371f0:	d10d43ff 	sub	sp, sp, #0x350
  a371f4:	a9007bfd 	stp	x29, x30, [sp]
  a371f8:	910003fd 	mov	x29, sp
  a371fc:	a90363f7 	stp	x23, x24, [sp,#48]
  a37200:	aa0003f7 	mov	x23, x0
  a37204:	39400020 	ldrb	w0, [x1]
  a37208:	a90153f3 	stp	x19, x20, [sp,#16]
  a3720c:	a9025bf5 	stp	x21, x22, [sp,#32]
  a37210:	f90023f9 	str	x25, [sp,#64]
  a37214:	340000a0 	cbz	w0, a37228 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c610>
  a37218:	39401020 	ldrb	w0, [x1,#4]
  a3721c:	aa0103f3 	mov	x19, x1
  a37220:	f240101f 	tst	x0, #0x1f
  a37224:	54000621 	b.ne	a372e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c6d0>
  a37228:	9101a3f5 	add	x21, sp, #0x68
  a3722c:	d000dc41 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a37230:	aa1503e0 	mov	x0, x21
  a37234:	9136a021 	add	x1, x1, #0xda8
  a37238:	9463f2aa 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a3723c:	9101c3f3 	add	x19, sp, #0x70
  a37240:	b000e421 	adrp	x1, 26bc000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xf91a8>
  a37244:	91230021 	add	x1, x1, #0x8c0
  a37248:	91286021 	add	x1, x1, #0xa18
  a3724c:	aa1503e0 	mov	x0, x21
  a37250:	aa1303e8 	mov	x8, x19
  a37254:	94637267 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a37258:	9101e3f6 	add	x22, sp, #0x78
  a3725c:	9000eca1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a37260:	aa1603e8 	mov	x8, x22
  a37264:	91366021 	add	x1, x1, #0xd98
  a37268:	aa1303e0 	mov	x0, x19
  a3726c:	94637261 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a37270:	d000e441 	adrp	x1, 26c1000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xfe1a8>
  a37274:	9102c3e0 	add	x0, sp, #0xb0
  a37278:	91122021 	add	x1, x1, #0x488
  a3727c:	9463f299 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a37280:	9103a3f4 	add	x20, sp, #0xe8
  a37284:	9102c3e1 	add	x1, sp, #0xb0
  a37288:	aa1403e8 	mov	x8, x20
  a3728c:	aa1603e0 	mov	x0, x22
  a37290:	94637200 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a37294:	52800022 	mov	w2, #0x1                   	// #1
  a37298:	52800001 	mov	w1, #0x0                   	// #0
  a3729c:	aa1403e0 	mov	x0, x20
  a372a0:	945f2450 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a372a4:	aa1403e0 	mov	x0, x20
  a372a8:	946314d6 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a372ac:	9102c3e0 	add	x0, sp, #0xb0
  a372b0:	946314d4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a372b4:	aa1603e0 	mov	x0, x22
  a372b8:	946314d2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a372bc:	aa1303e0 	mov	x0, x19
  a372c0:	946314d0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a372c4:	aa1503e0 	mov	x0, x21
  a372c8:	946314ce 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a372cc:	a9407bfd 	ldp	x29, x30, [sp]
  a372d0:	a94153f3 	ldp	x19, x20, [sp,#16]
  a372d4:	a9425bf5 	ldp	x21, x22, [sp,#32]
  a372d8:	a94363f7 	ldp	x23, x24, [sp,#48]
  a372dc:	f94023f9 	ldr	x25, [sp,#64]
  a372e0:	910d43ff 	add	sp, sp, #0x350
  a372e4:	d65f03c0 	ret
  a372e8:	39401820 	ldrb	w0, [x1,#6]
  a372ec:	34fff9e0 	cbz	w0, a37228 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c610>
  a372f0:	b9400820 	ldr	w0, [x1,#8]
  a372f4:	34fff9a0 	cbz	w0, a37228 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c610>
  a372f8:	39400044 	ldrb	w4, [x2]
  a372fc:	9103a3f4 	add	x20, sp, #0xe8
  a37300:	f8404043 	ldur	x3, [x2,#4]
  a37304:	91004041 	add	x1, x2, #0x10
  a37308:	91004280 	add	x0, x20, #0x10
  a3730c:	3903a3e4 	strb	w4, [sp,#232]
  a37310:	f80ec3e3 	stur	x3, [sp,#236]
  a37314:	97ffbfc1 	bl	a27218 <_ZSt20__throw_bad_weak_ptrv@@Base+0x11c600>
  a37318:	f90187f7 	str	x23, [sp,#776]
  a3731c:	a9401664 	ldp	x4, x5, [x19]
