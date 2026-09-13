
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000098213c <_ZSt20__throw_bad_weak_ptrv@@Base+0x77524>:
  98213c:	b9400040 	ldr	w0, [x2]
  982140:	34000820 	cbz	w0, 982244 <_ZSt20__throw_bad_weak_ptrv@@Base+0x7762c>
  982144:	7100041f 	cmp	w0, #0x1
  982148:	54000700 	b.eq	982228 <_ZSt20__throw_bad_weak_ptrv@@Base+0x77610>
  98214c:	a9025bf5 	stp	x21, x22, [sp,#32]
  982150:	910183f6 	add	x22, sp, #0x60
  982154:	aa1603e0 	mov	x0, x22
  982158:	f000e1e1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  98215c:	9136a021 	add	x1, x1, #0xda8
  982160:	9466c6e0 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  982164:	910163f5 	add	x21, sp, #0x58
  982168:	9000e881 	adrp	x1, 2692000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xcf1a8>
  98216c:	9112e021 	add	x1, x1, #0x4b8
  982170:	9106c021 	add	x1, x1, #0x1b0
  982174:	aa1603e0 	mov	x0, x22
  982178:	aa1503e8 	mov	x8, x21
  98217c:	9466469d 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  982180:	a90153f3 	stp	x19, x20, [sp,#16]
  982184:	910143f4 	add	x20, sp, #0x50
  982188:	b000f241 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  98218c:	aa1403e8 	mov	x8, x20
  982190:	91366021 	add	x1, x1, #0xd98
  982194:	aa1503e0 	mov	x0, x21
  982198:	94664696 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  98219c:	9101a3f7 	add	x23, sp, #0x68
  9821a0:	b000e881 	adrp	x1, 2693000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xd01a8>
  9821a4:	aa1703e0 	mov	x0, x23
  9821a8:	913dc021 	add	x1, x1, #0xf70
  9821ac:	9466c6cd 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  9821b0:	910123f3 	add	x19, sp, #0x48
  9821b4:	aa1703e1 	mov	x1, x23
  9821b8:	aa1303e8 	mov	x8, x19
  9821bc:	aa1403e0 	mov	x0, x20
  9821c0:	94664634 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  9821c4:	52800022 	mov	w2, #0x1                   	// #1
  9821c8:	52800001 	mov	w1, #0x0                   	// #0
  9821cc:	aa1303e0 	mov	x0, x19
  9821d0:	9461f884 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  9821d4:	aa1303e0 	mov	x0, x19
  9821d8:	9465e90a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  9821dc:	aa1703e0 	mov	x0, x23
  9821e0:	9465e908 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  9821e4:	aa1403e0 	mov	x0, x20
  9821e8:	9465e906 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  9821ec:	aa1503e0 	mov	x0, x21
  9821f0:	9465e904 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  9821f4:	aa1603e0 	mov	x0, x22
  9821f8:	9465e902 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  9821fc:	f9402302 	ldr	x2, [x24,#64]
  982200:	52800041 	mov	w1, #0x2                   	// #2
  982204:	a94153f3 	ldp	x19, x20, [sp,#16]
  982208:	aa0203e0 	mov	x0, x2
  98220c:	f9400042 	ldr	x2, [x2]
  982210:	a9425bf5 	ldp	x21, x22, [sp,#32]
  982214:	f9400c42 	ldr	x2, [x2,#24]
  982218:	d63f0040 	blr	x2
  98221c:	a94363f7 	ldp	x23, x24, [sp,#48]
  982220:	a8c77bfd 	ldp	x29, x30, [sp],#112
  982224:	d65f03c0 	ret
  982228:	f9402302 	ldr	x2, [x24,#64]
  98222c:	52800061 	mov	w1, #0x3                   	// #3
  982230:	aa0203e0 	mov	x0, x2
  982234:	f9400042 	ldr	x2, [x2]
  982238:	f9400c42 	ldr	x2, [x2,#24]
  98223c:	d63f0040 	blr	x2
  982240:	17fffff7 	b	98221c <_ZSt20__throw_bad_weak_ptrv@@Base+0x77604>
  982244:	f9402302 	ldr	x2, [x24,#64]
  982248:	52800041 	mov	w1, #0x2                   	// #2
  98224c:	aa0203e0 	mov	x0, x2
  982250:	f9400042 	ldr	x2, [x2]
  982254:	f9400c42 	ldr	x2, [x2,#24]
  982258:	d63f0040 	blr	x2
  98225c:	17fffff0 	b	98221c <_ZSt20__throw_bad_weak_ptrv@@Base+0x77604>
