
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000b39000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22e3e8>:
  b39000:	aa1b03e0 	mov	x0, x27
  b39004:	912e6021 	add	x1, x1, #0xb98
  b39008:	f9004bfb 	str	x27, [sp,#144]
  b3900c:	945feb35 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b39010:	9103a3fc 	add	x28, sp, #0xe8
  b39014:	aa1b03e1 	mov	x1, x27
  b39018:	aa1c03e8 	mov	x8, x28
  b3901c:	aa1603e0 	mov	x0, x22
  b39020:	945f6a9c 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b39024:	52800022 	mov	w2, #0x1                   	// #1
  b39028:	52800001 	mov	w1, #0x0                   	// #0
  b3902c:	aa1c03e0 	mov	x0, x28
  b39030:	945b1cec 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b39034:	aa1c03e0 	mov	x0, x28
  b39038:	945f0d72 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3903c:	aa1b03e0 	mov	x0, x27
  b39040:	945f0d70 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39044:	aa1603e0 	mov	x0, x22
  b39048:	945f0d6e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3904c:	aa1403e0 	mov	x0, x20
  b39050:	945f0d6c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39054:	9102e3e0 	add	x0, sp, #0xb8
  b39058:	945f0d6a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3905c:	a94363f7 	ldp	x23, x24, [sp,#48]
  b39060:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b39064:	a94573fb 	ldp	x27, x28, [sp,#80]
  b39068:	17fffd51 	b	b385ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x22d994>
  b3906c:	f94033e0 	ldr	x0, [sp,#96]
  b39070:	97e3b47c 	bl	426260 <__cxa_guard_acquire@plt>
  b39074:	34ffd9e0 	cbz	w0, b38bb0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22df98>
  b39078:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3907c:	b900237f 	str	wzr, [x27,#32]
  b39080:	97e3afd4 	bl	424fd0 <malloc@plt>
  b39084:	f9000760 	str	x0, [x27,#8]
  b39088:	52801304 	mov	w4, #0x98                  	// #152
  b3908c:	52800ca3 	mov	w3, #0x65                  	// #101
  b39090:	b9001364 	str	w4, [x27,#16]
  b39094:	d2806502 	mov	x2, #0x328                 	// #808
  b39098:	b9001b63 	str	w3, [x27,#24]
  b3909c:	52800001 	mov	w1, #0x0                   	// #0
  b390a0:	97e3ad54 	bl	4245f0 <memset@plt>
  b390a4:	f94033e0 	ldr	x0, [sp,#96]
  b390a8:	97e3b5e6 	bl	426840 <__cxa_guard_release@plt>
  b390ac:	aa1b03e1 	mov	x1, x27
  b390b0:	b0017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b390b4:	d0ffda00 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b390b8:	9135a042 	add	x2, x2, #0xd68
  b390bc:	91126000 	add	x0, x0, #0x498
  b390c0:	97e3b77c 	bl	426eb0 <__cxa_atexit@plt>
  b390c4:	17fffebb 	b	b38bb0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22df98>
  b390c8:	aa1403e0 	mov	x0, x20
  b390cc:	97e3b465 	bl	426260 <__cxa_guard_acquire@plt>
  b390d0:	34ffd960 	cbz	w0, b38bfc <_ZSt20__throw_bad_weak_ptrv@@Base+0x22dfe4>
  b390d4:	f0018083 	adrp	x3, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b390d8:	911b6063 	add	x3, x3, #0x6d8
  b390dc:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b390e0:	b900207f 	str	wzr, [x3,#32]
  b390e4:	97e3afbb 	bl	424fd0 <malloc@plt>
  b390e8:	f0018083 	adrp	x3, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b390ec:	911b6063 	add	x3, x3, #0x6d8
  b390f0:	52801305 	mov	w5, #0x98                  	// #152
  b390f4:	52800ca4 	mov	w4, #0x65                  	// #101
  b390f8:	d2806502 	mov	x2, #0x328                 	// #808
  b390fc:	52800001 	mov	w1, #0x0                   	// #0
  b39100:	f9000460 	str	x0, [x3,#8]
  b39104:	b9001065 	str	w5, [x3,#16]
  b39108:	b9001864 	str	w4, [x3,#24]
  b3910c:	97e3ad39 	bl	4245f0 <memset@plt>
  b39110:	f0018081 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b39114:	911b6023 	add	x3, x1, #0x6d8
  b39118:	aa1403e0 	mov	x0, x20
  b3911c:	b900287f 	str	wzr, [x3,#40]
  b39120:	97e3b5c8 	bl	426840 <__cxa_guard_release@plt>
  b39124:	f0018080 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b39128:	911b6003 	add	x3, x0, #0x6d8
  b3912c:	b0017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b39130:	aa0303e1 	mov	x1, x3
  b39134:	9135a042 	add	x2, x2, #0xd68
  b39138:	f0ffe3c0 	adrp	x0, 7b4000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xbb258>
  b3913c:	91278000 	add	x0, x0, #0x9e0
  b39140:	97e3b75c 	bl	426eb0 <__cxa_atexit@plt>
  b39144:	17fffeae 	b	b38bfc <_ZSt20__throw_bad_weak_ptrv@@Base+0x22dfe4>
  b39148:	aa1403e0 	mov	x0, x20
  b3914c:	97e3b445 	bl	426260 <__cxa_guard_acquire@plt>
  b39150:	34ffd5a0 	cbz	w0, b38c04 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22dfec>
  b39154:	f0018083 	adrp	x3, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b39158:	911b6063 	add	x3, x3, #0x6d8
  b3915c:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b39160:	b900207f 	str	wzr, [x3,#32]
  b39164:	97e3af9b 	bl	424fd0 <malloc@plt>
  b39168:	f0018083 	adrp	x3, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3916c:	911b6063 	add	x3, x3, #0x6d8
  b39170:	52801305 	mov	w5, #0x98                  	// #152
  b39174:	52800ca4 	mov	w4, #0x65                  	// #101
  b39178:	d2806502 	mov	x2, #0x328                 	// #808
  b3917c:	52800001 	mov	w1, #0x0                   	// #0
  b39180:	f9000460 	str	x0, [x3,#8]
  b39184:	b9001065 	str	w5, [x3,#16]
  b39188:	b9001864 	str	w4, [x3,#24]
  b3918c:	97e3ad19 	bl	4245f0 <memset@plt>
  b39190:	f0018081 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b39194:	911b6023 	add	x3, x1, #0x6d8
  b39198:	aa1403e0 	mov	x0, x20
  b3919c:	b900287f 	str	wzr, [x3,#40]
  b391a0:	97e3b5a8 	bl	426840 <__cxa_guard_release@plt>
  b391a4:	f0018080 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b391a8:	911b6003 	add	x3, x0, #0x6d8
  b391ac:	b0017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b391b0:	aa0303e1 	mov	x1, x3
  b391b4:	9135a042 	add	x2, x2, #0xd68
  b391b8:	f0ffe3c0 	adrp	x0, 7b4000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xbb258>
  b391bc:	91278000 	add	x0, x0, #0x9e0
  b391c0:	97e3b73c 	bl	426eb0 <__cxa_atexit@plt>
  b391c4:	17fffe90 	b	b38c04 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22dfec>
  b391c8:	9000d441 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b391cc:	910303e0 	add	x0, sp, #0xc0
  b391d0:	9136a021 	add	x1, x1, #0xda8
  b391d4:	945feac3 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b391d8:	910363f4 	add	x20, sp, #0xd8
  b391dc:	d000dec1 	adrp	x1, 2713000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1501a8>
  b391e0:	9137e021 	add	x1, x1, #0xdf8
  b391e4:	aa1403e8 	mov	x8, x20
  b391e8:	9100a021 	add	x1, x1, #0x28
  b391ec:	910303e0 	add	x0, sp, #0xc0
  b391f0:	f90047f4 	str	x20, [sp,#136]
  b391f4:	945f6a7f 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b391f8:	910383f6 	add	x22, sp, #0xe0
  b391fc:	d000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b39200:	aa1603e8 	mov	x8, x22
  b39204:	91366021 	add	x1, x1, #0xd98
  b39208:	aa1403e0 	mov	x0, x20
  b3920c:	f90043f6 	str	x22, [sp,#128]
  b39210:	945f6a78 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b39214:	910343fb 	add	x27, sp, #0xd0
  b39218:	b000d441 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3921c:	aa1b03e0 	mov	x0, x27
  b39220:	912e6021 	add	x1, x1, #0xb98
  b39224:	f9004bfb 	str	x27, [sp,#144]
  b39228:	945feaae 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3922c:	9103a3fc 	add	x28, sp, #0xe8
  b39230:	aa1b03e1 	mov	x1, x27
  b39234:	aa1c03e8 	mov	x8, x28
  b39238:	aa1603e0 	mov	x0, x22
  b3923c:	945f6a15 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b39240:	52800022 	mov	w2, #0x1                   	// #1
  b39244:	52800001 	mov	w1, #0x0                   	// #0
  b39248:	aa1c03e0 	mov	x0, x28
  b3924c:	945b1c65 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b39250:	aa1c03e0 	mov	x0, x28
  b39254:	945f0ceb 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39258:	aa1b03e0 	mov	x0, x27
  b3925c:	945f0ce9 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39260:	aa1603e0 	mov	x0, x22
  b39264:	945f0ce7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39268:	aa1403e0 	mov	x0, x20
  b3926c:	945f0ce5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39270:	910303e0 	add	x0, sp, #0xc0
  b39274:	945f0ce3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39278:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3927c:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b39280:	a94573fb 	ldp	x27, x28, [sp,#80]
  b39284:	17fffcca 	b	b385ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x22d994>
  b39288:	f94033e0 	ldr	x0, [sp,#96]
  b3928c:	97e3b3f5 	bl	426260 <__cxa_guard_acquire@plt>
  b39290:	34ffd140 	cbz	w0, b38cb8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22e0a0>
  b39294:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b39298:	b900237f 	str	wzr, [x27,#32]
  b3929c:	97e3af4d 	bl	424fd0 <malloc@plt>
  b392a0:	f9000760 	str	x0, [x27,#8]
  b392a4:	52801304 	mov	w4, #0x98                  	// #152
  b392a8:	52800ca3 	mov	w3, #0x65                  	// #101
  b392ac:	b9001364 	str	w4, [x27,#16]
  b392b0:	d2806502 	mov	x2, #0x328                 	// #808
  b392b4:	b9001b63 	str	w3, [x27,#24]
  b392b8:	52800001 	mov	w1, #0x0                   	// #0
  b392bc:	97e3accd 	bl	4245f0 <memset@plt>
  b392c0:	f94033e0 	ldr	x0, [sp,#96]
  b392c4:	97e3b55f 	bl	426840 <__cxa_guard_release@plt>
  b392c8:	aa1b03e1 	mov	x1, x27
  b392cc:	b0017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b392d0:	d0ffda00 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b392d4:	9135a042 	add	x2, x2, #0xd68
  b392d8:	91126000 	add	x0, x0, #0x498
  b392dc:	97e3b6f5 	bl	426eb0 <__cxa_atexit@plt>
  b392e0:	17fffe76 	b	b38cb8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22e0a0>
  b392e4:	f94033e0 	ldr	x0, [sp,#96]
  b392e8:	97e3b3de 	bl	426260 <__cxa_guard_acquire@plt>
  b392ec:	34ffb4c0 	cbz	w0, b38984 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22dd6c>
  b392f0:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b392f4:	b900237f 	str	wzr, [x27,#32]
  b392f8:	97e3af36 	bl	424fd0 <malloc@plt>
  b392fc:	f9000760 	str	x0, [x27,#8]
  b39300:	52801304 	mov	w4, #0x98                  	// #152
  b39304:	52800ca3 	mov	w3, #0x65                  	// #101
  b39308:	b9001364 	str	w4, [x27,#16]
  b3930c:	d2806502 	mov	x2, #0x328                 	// #808
  b39310:	b9001b63 	str	w3, [x27,#24]
  b39314:	52800001 	mov	w1, #0x0                   	// #0
  b39318:	97e3acb6 	bl	4245f0 <memset@plt>
  b3931c:	f94033e0 	ldr	x0, [sp,#96]
  b39320:	97e3b548 	bl	426840 <__cxa_guard_release@plt>
  b39324:	aa1b03e1 	mov	x1, x27
  b39328:	b0017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3932c:	d0ffda00 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b39330:	9135a042 	add	x2, x2, #0xd68
  b39334:	91126000 	add	x0, x0, #0x498
  b39338:	97e3b6de 	bl	426eb0 <__cxa_atexit@plt>
  b3933c:	17fffd92 	b	b38984 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22dd6c>
  b39340:	aa0303e0 	mov	x0, x3
  b39344:	f90033e3 	str	x3, [sp,#96]
  b39348:	97e3b3c6 	bl	426260 <__cxa_guard_acquire@plt>
  b3934c:	f94033e3 	ldr	x3, [sp,#96]
  b39350:	34ffb400 	cbz	w0, b389d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ddb8>
  b39354:	f001809c 	adrp	x28, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b39358:	911c439c 	add	x28, x28, #0x710
  b3935c:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b39360:	b900239f 	str	wzr, [x28,#32]
  b39364:	97e3af1b 	bl	424fd0 <malloc@plt>
  b39368:	f9000780 	str	x0, [x28,#8]
  b3936c:	52801305 	mov	w5, #0x98                  	// #152
  b39370:	52800ca4 	mov	w4, #0x65                  	// #101
  b39374:	b9001385 	str	w5, [x28,#16]
  b39378:	d2806502 	mov	x2, #0x328                 	// #808
  b3937c:	b9001b84 	str	w4, [x28,#24]
  b39380:	52800001 	mov	w1, #0x0                   	// #0
  b39384:	97e3ac9b 	bl	4245f0 <memset@plt>
  b39388:	b9002b9f 	str	wzr, [x28,#40]
  b3938c:	f94033e3 	ldr	x3, [sp,#96]
  b39390:	aa0303e0 	mov	x0, x3
  b39394:	97e3b52b 	bl	426840 <__cxa_guard_release@plt>
  b39398:	b0017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3939c:	aa1c03e1 	mov	x1, x28
  b393a0:	9135a042 	add	x2, x2, #0xd68
  b393a4:	f0ffe3a0 	adrp	x0, 7b0000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb7258>
  b393a8:	91292000 	add	x0, x0, #0xa48
  b393ac:	97e3b6c1 	bl	426eb0 <__cxa_atexit@plt>
  b393b0:	f94033e3 	ldr	x3, [sp,#96]
  b393b4:	17fffd87 	b	b389d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ddb8>
  b393b8:	f94037e0 	ldr	x0, [sp,#104]
  b393bc:	97e3b3a9 	bl	426260 <__cxa_guard_acquire@plt>
  b393c0:	34ffca00 	cbz	w0, b38d00 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22e0e8>
  b393c4:	f9403fe1 	ldr	x1, [sp,#120]
  b393c8:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b393cc:	b900203f 	str	wzr, [x1,#32]
  b393d0:	97e3af00 	bl	424fd0 <malloc@plt>
  b393d4:	f9403fe5 	ldr	x5, [sp,#120]
  b393d8:	52801304 	mov	w4, #0x98                  	// #152
  b393dc:	52800ca3 	mov	w3, #0x65                  	// #101
  b393e0:	d2806502 	mov	x2, #0x328                 	// #808
  b393e4:	52800001 	mov	w1, #0x0                   	// #0
  b393e8:	f90004a0 	str	x0, [x5,#8]
  b393ec:	b90010a4 	str	w4, [x5,#16]
  b393f0:	b90018a3 	str	w3, [x5,#24]
  b393f4:	97e3ac7f 	bl	4245f0 <memset@plt>
  b393f8:	f9403fe5 	ldr	x5, [sp,#120]
  b393fc:	f94037e0 	ldr	x0, [sp,#104]
  b39400:	b90028bf 	str	wzr, [x5,#40]
  b39404:	97e3b50f 	bl	426840 <__cxa_guard_release@plt>
  b39408:	f9403fe1 	ldr	x1, [sp,#120]
  b3940c:	b0017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b39410:	d0ffe280 	adrp	x0, 78b000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x92258>
  b39414:	9135a042 	add	x2, x2, #0xd68
  b39418:	9109a000 	add	x0, x0, #0x268
  b3941c:	97e3b6a5 	bl	426eb0 <__cxa_atexit@plt>
  b39420:	17fffe38 	b	b38d00 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22e0e8>
  b39424:	f94037e0 	ldr	x0, [sp,#104]
  b39428:	97e3b38e 	bl	426260 <__cxa_guard_acquire@plt>
  b3942c:	34ffc700 	cbz	w0, b38d0c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22e0f4>
  b39430:	f9403fe1 	ldr	x1, [sp,#120]
  b39434:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b39438:	b900203f 	str	wzr, [x1,#32]
  b3943c:	97e3aee5 	bl	424fd0 <malloc@plt>
  b39440:	f9403fe5 	ldr	x5, [sp,#120]
  b39444:	52801304 	mov	w4, #0x98                  	// #152
  b39448:	52800ca3 	mov	w3, #0x65                  	// #101
  b3944c:	d2806502 	mov	x2, #0x328                 	// #808
  b39450:	52800001 	mov	w1, #0x0                   	// #0
  b39454:	f90004a0 	str	x0, [x5,#8]
  b39458:	b90010a4 	str	w4, [x5,#16]
  b3945c:	b90018a3 	str	w3, [x5,#24]
  b39460:	97e3ac64 	bl	4245f0 <memset@plt>
  b39464:	f9403fe5 	ldr	x5, [sp,#120]
  b39468:	f94037e0 	ldr	x0, [sp,#104]
  b3946c:	b90028bf 	str	wzr, [x5,#40]
  b39470:	97e3b4f4 	bl	426840 <__cxa_guard_release@plt>
  b39474:	f9403fe1 	ldr	x1, [sp,#120]
  b39478:	b0017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3947c:	d0ffe280 	adrp	x0, 78b000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x92258>
  b39480:	9135a042 	add	x2, x2, #0xd68
  b39484:	9109a000 	add	x0, x0, #0x268
  b39488:	97e3b68a 	bl	426eb0 <__cxa_atexit@plt>
  b3948c:	17fffe20 	b	b38d0c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22e0f4>
  b39490:	aa0303e0 	mov	x0, x3
  b39494:	f90033e3 	str	x3, [sp,#96]
  b39498:	97e3b372 	bl	426260 <__cxa_guard_acquire@plt>
  b3949c:	34ffa9e0 	cbz	w0, b389d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ddc0>
  b394a0:	f001809c 	adrp	x28, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b394a4:	911c439c 	add	x28, x28, #0x710
  b394a8:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b394ac:	b900239f 	str	wzr, [x28,#32]
  b394b0:	97e3aec8 	bl	424fd0 <malloc@plt>
  b394b4:	f9000780 	str	x0, [x28,#8]
  b394b8:	52801305 	mov	w5, #0x98                  	// #152
  b394bc:	52800ca4 	mov	w4, #0x65                  	// #101
  b394c0:	b9001385 	str	w5, [x28,#16]
  b394c4:	d2806502 	mov	x2, #0x328                 	// #808
  b394c8:	b9001b84 	str	w4, [x28,#24]
  b394cc:	52800001 	mov	w1, #0x0                   	// #0
  b394d0:	97e3ac48 	bl	4245f0 <memset@plt>
  b394d4:	b9002b9f 	str	wzr, [x28,#40]
  b394d8:	f94033e3 	ldr	x3, [sp,#96]
  b394dc:	aa0303e0 	mov	x0, x3
  b394e0:	97e3b4d8 	bl	426840 <__cxa_guard_release@plt>
  b394e4:	b0017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b394e8:	aa1c03e1 	mov	x1, x28
  b394ec:	9135a042 	add	x2, x2, #0xd68
  b394f0:	f0ffe3a0 	adrp	x0, 7b0000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb7258>
  b394f4:	91292000 	add	x0, x0, #0xa48
  b394f8:	97e3b66e 	bl	426eb0 <__cxa_atexit@plt>
  b394fc:	17fffd37 	b	b389d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ddc0>
  b39500:	910343f4 	add	x20, sp, #0xd0
  b39504:	9000d441 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b39508:	aa1403e0 	mov	x0, x20
  b3950c:	9136a021 	add	x1, x1, #0xda8
  b39510:	f9004bf4 	str	x20, [sp,#144]
  b39514:	945fe9f3 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b39518:	910363fb 	add	x27, sp, #0xd8
  b3951c:	d000dec1 	adrp	x1, 2713000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1501a8>
  b39520:	9137e021 	add	x1, x1, #0xdf8
  b39524:	aa1b03e8 	mov	x8, x27
  b39528:	910dc021 	add	x1, x1, #0x370
  b3952c:	aa1403e0 	mov	x0, x20
  b39530:	f90047fb 	str	x27, [sp,#136]
  b39534:	945f69af 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b39538:	910383e0 	add	x0, sp, #0xe0
  b3953c:	d000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b39540:	aa0003e8 	mov	x8, x0
  b39544:	91366021 	add	x1, x1, #0xd98
  b39548:	f90043e0 	str	x0, [sp,#128]
  b3954c:	aa1b03e0 	mov	x0, x27
  b39550:	945f69a8 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b39554:	910323e1 	add	x1, sp, #0xc8
  b39558:	aa0103e2 	mov	x2, x1
  b3955c:	b000d441 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b39560:	aa0203e0 	mov	x0, x2
  b39564:	912e6021 	add	x1, x1, #0xb98
  b39568:	f9004fe2 	str	x2, [sp,#152]
  b3956c:	945fe9dd 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b39570:	f94043e0 	ldr	x0, [sp,#128]
  b39574:	9103a3fc 	add	x28, sp, #0xe8
  b39578:	f9404fe1 	ldr	x1, [sp,#152]
  b3957c:	aa1c03e8 	mov	x8, x28
  b39580:	945f6944 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b39584:	52800022 	mov	w2, #0x1                   	// #1
  b39588:	52800001 	mov	w1, #0x0                   	// #0
  b3958c:	aa1c03e0 	mov	x0, x28
  b39590:	945b1b94 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b39594:	aa1c03e0 	mov	x0, x28
  b39598:	945f0c1a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3959c:	f9404fe0 	ldr	x0, [sp,#152]
  b395a0:	945f0c18 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b395a4:	f94043e0 	ldr	x0, [sp,#128]
  b395a8:	945f0c16 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b395ac:	aa1b03e0 	mov	x0, x27
  b395b0:	945f0c14 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b395b4:	aa1403e0 	mov	x0, x20
  b395b8:	945f0c12 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b395bc:	f9400e74 	ldr	x20, [x19,#24]
  b395c0:	17fffce5 	b	b38954 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22dd3c>
  b395c4:	a94363f7 	ldp	x23, x24, [sp,#48]
  b395c8:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b395cc:	a94573fb 	ldp	x27, x28, [sp,#80]
  b395d0:	f9000e7f 	str	xzr, [x19,#24]
  b395d4:	17fffbf6 	b	b385ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x22d994>
  b395d8:	910363e2 	add	x2, sp, #0xd8
  b395dc:	910343fc 	add	x28, sp, #0xd0
  b395e0:	aa1c03e0 	mov	x0, x28
  b395e4:	9000d441 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b395e8:	9136a021 	add	x1, x1, #0xda8
  b395ec:	f90047e2 	str	x2, [sp,#136]
  b395f0:	945fe9bc 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b395f4:	f9004bfc 	str	x28, [sp,#144]
  b395f8:	aa1c03e0 	mov	x0, x28
  b395fc:	d000dec1 	adrp	x1, 2713000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1501a8>
  b39600:	f94047fc 	ldr	x28, [sp,#136]
  b39604:	9137e021 	add	x1, x1, #0xdf8
  b39608:	aa1c03e8 	mov	x8, x28
  b3960c:	945f6979 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b39610:	910383e1 	add	x1, sp, #0xe0
  b39614:	aa1c03e0 	mov	x0, x28
  b39618:	aa0103e2 	mov	x2, x1
  b3961c:	d000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b39620:	aa0203e8 	mov	x8, x2
  b39624:	91366021 	add	x1, x1, #0xd98
  b39628:	a90873e2 	stp	x2, x28, [sp,#128]
  b3962c:	945f6971 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b39630:	910323e3 	add	x3, sp, #0xc8
  b39634:	b000d441 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b39638:	aa0303e0 	mov	x0, x3
  b3963c:	912e4021 	add	x1, x1, #0xb90
  b39640:	f9004fe3 	str	x3, [sp,#152]
  b39644:	945fe9a7 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b39648:	f94043e0 	ldr	x0, [sp,#128]
  b3964c:	9103a3fc 	add	x28, sp, #0xe8
  b39650:	f9404fe1 	ldr	x1, [sp,#152]
  b39654:	aa1c03e8 	mov	x8, x28
  b39658:	945f690e 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3965c:	52800022 	mov	w2, #0x1                   	// #1
  b39660:	52800001 	mov	w1, #0x0                   	// #0
  b39664:	aa1c03e0 	mov	x0, x28
  b39668:	945b1b5e 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3966c:	aa1c03e0 	mov	x0, x28
  b39670:	945f0be4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39674:	f9404fe0 	ldr	x0, [sp,#152]
  b39678:	945f0be2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3967c:	f94043e0 	ldr	x0, [sp,#128]
  b39680:	945f0be0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39684:	f94047e0 	ldr	x0, [sp,#136]
  b39688:	945f0bde 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3968c:	f9404be0 	ldr	x0, [sp,#144]
  b39690:	945f0bdc 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39694:	17fffc19 	b	b386f8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22dae0>
  b39698:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3969c:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b396a0:	a94573fb 	ldp	x27, x28, [sp,#80]
  b396a4:	f900167f 	str	xzr, [x19,#40]
  b396a8:	17fffbc1 	b	b385ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x22d994>
  b396ac:	910363e2 	add	x2, sp, #0xd8
  b396b0:	910343fc 	add	x28, sp, #0xd0
  b396b4:	aa1c03e0 	mov	x0, x28
  b396b8:	9000d441 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b396bc:	9136a021 	add	x1, x1, #0xda8
  b396c0:	f90047e2 	str	x2, [sp,#136]
  b396c4:	945fe987 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b396c8:	f9004bfc 	str	x28, [sp,#144]
  b396cc:	aa1c03e0 	mov	x0, x28
  b396d0:	d000dec1 	adrp	x1, 2713000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1501a8>
  b396d4:	f94047fc 	ldr	x28, [sp,#136]
  b396d8:	9137e021 	add	x1, x1, #0xdf8
  b396dc:	aa1c03e8 	mov	x8, x28
  b396e0:	945f6944 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b396e4:	910383e1 	add	x1, sp, #0xe0
  b396e8:	aa1c03e0 	mov	x0, x28
  b396ec:	aa0103e2 	mov	x2, x1
  b396f0:	d000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b396f4:	aa0203e8 	mov	x8, x2
  b396f8:	91366021 	add	x1, x1, #0xd98
  b396fc:	a90873e2 	stp	x2, x28, [sp,#128]
  b39700:	945f693c 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b39704:	910323e3 	add	x3, sp, #0xc8
  b39708:	b000d441 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3970c:	aa0303e0 	mov	x0, x3
  b39710:	912e4021 	add	x1, x1, #0xb90
  b39714:	f9004fe3 	str	x3, [sp,#152]
  b39718:	945fe972 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3971c:	f94043e0 	ldr	x0, [sp,#128]
  b39720:	9103a3fc 	add	x28, sp, #0xe8
  b39724:	f9404fe1 	ldr	x1, [sp,#152]
  b39728:	aa1c03e8 	mov	x8, x28
  b3972c:	945f68d9 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b39730:	52800022 	mov	w2, #0x1                   	// #1
  b39734:	52800001 	mov	w1, #0x0                   	// #0
  b39738:	aa1c03e0 	mov	x0, x28
  b3973c:	945b1b29 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b39740:	aa1c03e0 	mov	x0, x28
  b39744:	945f0baf 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39748:	f9404fe0 	ldr	x0, [sp,#152]
  b3974c:	945f0bad 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39750:	f94043e0 	ldr	x0, [sp,#128]
  b39754:	945f0bab 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39758:	f94047e0 	ldr	x0, [sp,#136]
  b3975c:	945f0ba9 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39760:	f9404be0 	ldr	x0, [sp,#144]
  b39764:	945f0ba7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39768:	17fffc31 	b	b3882c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22dc14>
  b3976c:	910363e2 	add	x2, sp, #0xd8
  b39770:	910343fc 	add	x28, sp, #0xd0
  b39774:	aa1c03e0 	mov	x0, x28
  b39778:	9000d441 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3977c:	9136a021 	add	x1, x1, #0xda8
  b39780:	f90047e2 	str	x2, [sp,#136]
  b39784:	945fe957 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b39788:	f9004bfc 	str	x28, [sp,#144]
  b3978c:	aa1c03e0 	mov	x0, x28
  b39790:	d000dec1 	adrp	x1, 2713000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1501a8>
  b39794:	f94047fc 	ldr	x28, [sp,#136]
  b39798:	9137e021 	add	x1, x1, #0xdf8
  b3979c:	aa1c03e8 	mov	x8, x28
  b397a0:	945f6914 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b397a4:	910383e1 	add	x1, sp, #0xe0
  b397a8:	aa1c03e0 	mov	x0, x28
  b397ac:	aa0103e2 	mov	x2, x1
  b397b0:	d000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b397b4:	aa0203e8 	mov	x8, x2
  b397b8:	91366021 	add	x1, x1, #0xd98
  b397bc:	a90873e2 	stp	x2, x28, [sp,#128]
  b397c0:	945f690c 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b397c4:	910323e3 	add	x3, sp, #0xc8
  b397c8:	b000d441 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b397cc:	aa0303e0 	mov	x0, x3
  b397d0:	912e4021 	add	x1, x1, #0xb90
  b397d4:	f9004fe3 	str	x3, [sp,#152]
  b397d8:	945fe942 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b397dc:	f94043e0 	ldr	x0, [sp,#128]
  b397e0:	9103a3fc 	add	x28, sp, #0xe8
  b397e4:	f9404fe1 	ldr	x1, [sp,#152]
  b397e8:	aa1c03e8 	mov	x8, x28
  b397ec:	945f68a9 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b397f0:	52800022 	mov	w2, #0x1                   	// #1
  b397f4:	52800001 	mov	w1, #0x0                   	// #0
  b397f8:	aa1c03e0 	mov	x0, x28
  b397fc:	945b1af9 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b39800:	aa1c03e0 	mov	x0, x28
  b39804:	945f0b7f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39808:	f9404fe0 	ldr	x0, [sp,#152]
  b3980c:	945f0b7d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39810:	f94043e0 	ldr	x0, [sp,#128]
  b39814:	945f0b7b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39818:	f94047e0 	ldr	x0, [sp,#136]
  b3981c:	945f0b79 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39820:	f9404be0 	ldr	x0, [sp,#144]
  b39824:	945f0b77 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39828:	17fffd1b 	b	b38c94 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22e07c>
  b3982c:	910363e2 	add	x2, sp, #0xd8
  b39830:	910343fc 	add	x28, sp, #0xd0
  b39834:	aa1c03e0 	mov	x0, x28
  b39838:	9000d441 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3983c:	9136a021 	add	x1, x1, #0xda8
  b39840:	f90047e2 	str	x2, [sp,#136]
  b39844:	945fe927 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b39848:	f9004bfc 	str	x28, [sp,#144]
  b3984c:	aa1c03e0 	mov	x0, x28
  b39850:	d000dec1 	adrp	x1, 2713000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1501a8>
  b39854:	f94047fc 	ldr	x28, [sp,#136]
  b39858:	9137e021 	add	x1, x1, #0xdf8
  b3985c:	aa1c03e8 	mov	x8, x28
  b39860:	945f68e4 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b39864:	910383e1 	add	x1, sp, #0xe0
  b39868:	aa1c03e0 	mov	x0, x28
  b3986c:	aa0103e2 	mov	x2, x1
  b39870:	d000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b39874:	aa0203e8 	mov	x8, x2
  b39878:	91366021 	add	x1, x1, #0xd98
  b3987c:	a90873e2 	stp	x2, x28, [sp,#128]
  b39880:	945f68dc 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b39884:	910323e3 	add	x3, sp, #0xc8
  b39888:	b000d441 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3988c:	aa0303e0 	mov	x0, x3
  b39890:	912e4021 	add	x1, x1, #0xb90
  b39894:	f9004fe3 	str	x3, [sp,#152]
  b39898:	945fe912 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3989c:	f94043e0 	ldr	x0, [sp,#128]
  b398a0:	9103a3fc 	add	x28, sp, #0xe8
  b398a4:	f9404fe1 	ldr	x1, [sp,#152]
  b398a8:	aa1c03e8 	mov	x8, x28
  b398ac:	945f6879 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b398b0:	52800022 	mov	w2, #0x1                   	// #1
  b398b4:	52800001 	mov	w1, #0x0                   	// #0
  b398b8:	aa1c03e0 	mov	x0, x28
  b398bc:	945b1ac9 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b398c0:	aa1c03e0 	mov	x0, x28
  b398c4:	945f0b4f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b398c8:	f9404fe0 	ldr	x0, [sp,#152]
  b398cc:	945f0b4d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b398d0:	f94043e0 	ldr	x0, [sp,#128]
  b398d4:	945f0b4b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b398d8:	f94047e0 	ldr	x0, [sp,#136]
  b398dc:	945f0b49 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b398e0:	f9404be0 	ldr	x0, [sp,#144]
  b398e4:	945f0b47 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b398e8:	f9000674 	str	x20, [x19,#8]
  b398ec:	17fffc05 	b	b38900 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22dce8>
  b398f0:	910343fb 	add	x27, sp, #0xd0
  b398f4:	9000d441 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b398f8:	aa1b03e0 	mov	x0, x27
  b398fc:	9136a021 	add	x1, x1, #0xda8
  b39900:	910363fc 	add	x28, sp, #0xd8
  b39904:	f9004bfb 	str	x27, [sp,#144]
  b39908:	945fe8f6 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3990c:	d000dec1 	adrp	x1, 2713000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1501a8>
  b39910:	aa1b03e0 	mov	x0, x27
  b39914:	aa1c03e8 	mov	x8, x28
  b39918:	9137e021 	add	x1, x1, #0xdf8
  b3991c:	945f68b5 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b39920:	910383e0 	add	x0, sp, #0xe0
  b39924:	d000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b39928:	aa0003e8 	mov	x8, x0
  b3992c:	91366021 	add	x1, x1, #0xd98
  b39930:	a90873e0 	stp	x0, x28, [sp,#128]
  b39934:	aa1c03e0 	mov	x0, x28
  b39938:	945f68ae 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3993c:	910323e1 	add	x1, sp, #0xc8
  b39940:	aa0103e2 	mov	x2, x1
  b39944:	b000d441 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b39948:	aa0203e0 	mov	x0, x2
  b3994c:	912e4021 	add	x1, x1, #0xb90
  b39950:	f9004fe2 	str	x2, [sp,#152]
  b39954:	945fe8e3 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b39958:	f94043e0 	ldr	x0, [sp,#128]
  b3995c:	9103a3fc 	add	x28, sp, #0xe8
  b39960:	f9404fe1 	ldr	x1, [sp,#152]
  b39964:	aa1c03e8 	mov	x8, x28
  b39968:	945f684a 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3996c:	52800022 	mov	w2, #0x1                   	// #1
  b39970:	52800001 	mov	w1, #0x0                   	// #0
  b39974:	aa1c03e0 	mov	x0, x28
  b39978:	945b1a9a 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3997c:	aa1c03e0 	mov	x0, x28
  b39980:	945f0b20 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39984:	f9404fe0 	ldr	x0, [sp,#152]
  b39988:	945f0b1e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3998c:	f94043e0 	ldr	x0, [sp,#128]
  b39990:	945f0b1c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39994:	f94047e0 	ldr	x0, [sp,#136]
  b39998:	945f0b1a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3999c:	aa1b03e0 	mov	x0, x27
  b399a0:	945f0b18 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b399a4:	f9000e74 	str	x20, [x19,#24]
  b399a8:	17fffbeb 	b	b38954 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22dd3c>
  b399ac:	a94363f7 	ldp	x23, x24, [sp,#48]
  b399b0:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b399b4:	a94573fb 	ldp	x27, x28, [sp,#80]
  b399b8:	f900067f 	str	xzr, [x19,#8]
  b399bc:	17fffafc 	b	b385ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x22d994>
  b399c0:	aa1c03e0 	mov	x0, x28
  b399c4:	945f0b0f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b399c8:	f9404fe0 	ldr	x0, [sp,#152]
  b399cc:	945f0b0d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b399d0:	f94043e0 	ldr	x0, [sp,#128]
  b399d4:	945f0b0b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b399d8:	f94047e0 	ldr	x0, [sp,#136]
  b399dc:	945f0b09 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b399e0:	f9404be0 	ldr	x0, [sp,#144]
  b399e4:	945f0b07 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b399e8:	97e3b75e 	bl	427760 <_ZSt9terminatev@plt>
  b399ec:	aa0003f4 	mov	x20, x0
  b399f0:	aa1c03e0 	mov	x0, x28
  b399f4:	945f0b03 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b399f8:	f9404be0 	ldr	x0, [sp,#144]
  b399fc:	945f0b01 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39a00:	f94043e0 	ldr	x0, [sp,#128]
  b39a04:	945f0aff 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39a08:	f94047e0 	ldr	x0, [sp,#136]
  b39a0c:	945f0afd 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39a10:	f9404fe0 	ldr	x0, [sp,#152]
  b39a14:	945f0afb 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39a18:	f9403e60 	ldr	x0, [x19,#120]
  b39a1c:	b4000080 	cbz	x0, b39a2c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ee14>
  b39a20:	f9400001 	ldr	x1, [x0]
  b39a24:	f9400421 	ldr	x1, [x1,#8]
  b39a28:	d63f0020 	blr	x1
  b39a2c:	aa1a03e0 	mov	x0, x26
  b39a30:	97f7e154 	bl	931f80 <_ZSt20__throw_bad_weak_ptrv@@Base+0x27368>
  b39a34:	aa1903e0 	mov	x0, x25
  b39a38:	940000aa 	bl	b39ce0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f0c8>
  b39a3c:	aa1803e0 	mov	x0, x24
  b39a40:	97fc4dce 	bl	a4d178 <_ZSt20__throw_bad_weak_ptrv@@Base+0x142560>
  b39a44:	aa1703e0 	mov	x0, x23
  b39a48:	97f7e066 	bl	931be0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26fc8>
  b39a4c:	aa1503e0 	mov	x0, x21
  b39a50:	97f17652 	bl	797398 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x9e5f0>
  b39a54:	aa1403e0 	mov	x0, x20
  b39a58:	97e3acae 	bl	424d10 <_Unwind_Resume@plt>
  b39a5c:	17ffffd9 	b	b399c0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22eda8>
  b39a60:	aa0003f4 	mov	x20, x0
  b39a64:	f9404fe0 	ldr	x0, [sp,#152]
  b39a68:	945f0ae6 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39a6c:	f94043e0 	ldr	x0, [sp,#128]
  b39a70:	945f0ae4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39a74:	f94047e0 	ldr	x0, [sp,#136]
  b39a78:	945f0ae2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39a7c:	f9404be0 	ldr	x0, [sp,#144]
  b39a80:	945f0ae0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39a84:	17ffffe5 	b	b39a18 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ee00>
  b39a88:	aa0003f4 	mov	x20, x0
  b39a8c:	17fffff8 	b	b39a6c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ee54>
  b39a90:	aa0003f4 	mov	x20, x0
  b39a94:	17fffff8 	b	b39a74 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ee5c>
  b39a98:	aa0003f4 	mov	x20, x0
  b39a9c:	17fffff8 	b	b39a7c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ee64>
  b39aa0:	17ffffca 	b	b399c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edb0>
  b39aa4:	17ffffcb 	b	b399d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edb8>
  b39aa8:	17ffffcc 	b	b399d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edc0>
  b39aac:	17ffffcd 	b	b399e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edc8>
  b39ab0:	aa0003f4 	mov	x20, x0
  b39ab4:	f9404be0 	ldr	x0, [sp,#144]
  b39ab8:	945f0ad2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39abc:	f94043e0 	ldr	x0, [sp,#128]
  b39ac0:	945f0ad0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39ac4:	f94047e0 	ldr	x0, [sp,#136]
  b39ac8:	945f0ace 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39acc:	9102c3e0 	add	x0, sp, #0xb0
  b39ad0:	945f0acc 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39ad4:	17ffffd1 	b	b39a18 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ee00>
  b39ad8:	aa0003f4 	mov	x20, x0
  b39adc:	17fffff8 	b	b39abc <_ZSt20__throw_bad_weak_ptrv@@Base+0x22eea4>
  b39ae0:	aa0003f4 	mov	x20, x0
  b39ae4:	17fffff8 	b	b39ac4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22eeac>
  b39ae8:	aa0003f4 	mov	x20, x0
  b39aec:	17fffff8 	b	b39acc <_ZSt20__throw_bad_weak_ptrv@@Base+0x22eeb4>
  b39af0:	aa0003f4 	mov	x20, x0
  b39af4:	17ffffc1 	b	b399f8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ede0>
  b39af8:	aa0003f4 	mov	x20, x0
  b39afc:	17ffffc1 	b	b39a00 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ede8>
  b39b00:	aa0003f4 	mov	x20, x0
  b39b04:	17ffffc1 	b	b39a08 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edf0>
  b39b08:	aa0003f4 	mov	x20, x0
  b39b0c:	17ffffc1 	b	b39a10 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edf8>
  b39b10:	17ffffae 	b	b399c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edb0>
  b39b14:	17ffffaf 	b	b399d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edb8>
  b39b18:	17ffffb0 	b	b399d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edc0>
  b39b1c:	17ffffb1 	b	b399e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edc8>
  b39b20:	17ffffaa 	b	b399c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edb0>
  b39b24:	17ffffab 	b	b399d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edb8>
  b39b28:	17ffffac 	b	b399d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edc0>
  b39b2c:	17ffffad 	b	b399e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edc8>
  b39b30:	aa0003f4 	mov	x20, x0
  b39b34:	f9404be0 	ldr	x0, [sp,#144]
  b39b38:	945f0ab2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39b3c:	f94043e0 	ldr	x0, [sp,#128]
  b39b40:	945f0ab0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39b44:	f94047e0 	ldr	x0, [sp,#136]
  b39b48:	945f0aae 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39b4c:	910303e0 	add	x0, sp, #0xc0
  b39b50:	945f0aac 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39b54:	17ffffb1 	b	b39a18 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ee00>
  b39b58:	aa0003f4 	mov	x20, x0
  b39b5c:	17fffff8 	b	b39b3c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ef24>
  b39b60:	aa0003f4 	mov	x20, x0
  b39b64:	17fffff8 	b	b39b44 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ef2c>
  b39b68:	aa0003f4 	mov	x20, x0
  b39b6c:	17fffff8 	b	b39b4c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ef34>
  b39b70:	aa0003f4 	mov	x20, x0
  b39b74:	f9404be0 	ldr	x0, [sp,#144]
  b39b78:	945f0aa2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39b7c:	f94043e0 	ldr	x0, [sp,#128]
  b39b80:	945f0aa0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39b84:	f94047e0 	ldr	x0, [sp,#136]
  b39b88:	945f0a9e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39b8c:	9102e3e0 	add	x0, sp, #0xb8
  b39b90:	945f0a9c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39b94:	17ffffa1 	b	b39a18 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ee00>
  b39b98:	aa0003f4 	mov	x20, x0
  b39b9c:	17fffff8 	b	b39b7c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ef64>
  b39ba0:	aa0003f4 	mov	x20, x0
  b39ba4:	17fffff8 	b	b39b84 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ef6c>
  b39ba8:	aa0003f4 	mov	x20, x0
  b39bac:	17fffff8 	b	b39b8c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ef74>
  b39bb0:	aa0003f4 	mov	x20, x0
  b39bb4:	aa1c03e0 	mov	x0, x28
  b39bb8:	945f0a92 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39bbc:	17ffffde 	b	b39b34 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ef1c>
  b39bc0:	aa0003f4 	mov	x20, x0
  b39bc4:	aa1c03e0 	mov	x0, x28
  b39bc8:	945f0a8e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39bcc:	17ffffa6 	b	b39a64 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ee4c>
  b39bd0:	17ffff7c 	b	b399c0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22eda8>
  b39bd4:	17ffff7b 	b	b399c0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22eda8>
  b39bd8:	17ffff7c 	b	b399c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edb0>
  b39bdc:	17ffff7d 	b	b399d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edb8>
  b39be0:	17ffff7e 	b	b399d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edc0>
  b39be4:	17ffff7f 	b	b399e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edc8>
  b39be8:	aa0003f4 	mov	x20, x0
  b39bec:	aa1c03e0 	mov	x0, x28
  b39bf0:	945f0a84 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39bf4:	17ffffb0 	b	b39ab4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ee9c>
  b39bf8:	aa0003f4 	mov	x20, x0
  b39bfc:	aa1c03e0 	mov	x0, x28
  b39c00:	945f0a80 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39c04:	17ffffdc 	b	b39b74 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ef5c>
  b39c08:	aa0003f4 	mov	x20, x0
  b39c0c:	17ffff83 	b	b39a18 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ee00>
  b39c10:	17ffff6c 	b	b399c0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22eda8>
  b39c14:	17ffff6d 	b	b399c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edb0>
  b39c18:	17ffff6e 	b	b399d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edb8>
  b39c1c:	17ffff6f 	b	b399d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edc0>
  b39c20:	17ffff70 	b	b399e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22edc8>
  b39c24:	00000000 	.inst	0x00000000 ; undefined
  b39c28:	d65f03c0 	ret
  b39c2c:	00000000 	.inst	0x00000000 ; undefined
  b39c30:	d65f03c0 	ret
  b39c34:	00000000 	.inst	0x00000000 ; undefined
  b39c38:	d65f03c0 	ret
  b39c3c:	00000000 	.inst	0x00000000 ; undefined
  b39c40:	52800020 	mov	w0, #0x1                   	// #1
  b39c44:	d65f03c0 	ret
  b39c48:	52800020 	mov	w0, #0x1                   	// #1
  b39c4c:	d65f03c0 	ret
  b39c50:	d65f03c0 	ret
  b39c54:	00000000 	.inst	0x00000000 ; undefined
  b39c58:	d65f03c0 	ret
  b39c5c:	00000000 	.inst	0x00000000 ; undefined
  b39c60:	d65f03c0 	ret
  b39c64:	00000000 	.inst	0x00000000 ; undefined
  b39c68:	d65f03c0 	ret
  b39c6c:	00000000 	.inst	0x00000000 ; undefined
  b39c70:	d65f03c0 	ret
  b39c74:	00000000 	.inst	0x00000000 ; undefined
  b39c78:	d65f03c0 	ret
  b39c7c:	00000000 	.inst	0x00000000 ; undefined
  b39c80:	d65f03c0 	ret
  b39c84:	00000000 	.inst	0x00000000 ; undefined
  b39c88:	d65f03c0 	ret
  b39c8c:	00000000 	.inst	0x00000000 ; undefined
  b39c90:	d65f03c0 	ret
  b39c94:	00000000 	.inst	0x00000000 ; undefined
  b39c98:	d65f03c0 	ret
  b39c9c:	00000000 	.inst	0x00000000 ; undefined
  b39ca0:	d65f03c0 	ret
  b39ca4:	00000000 	.inst	0x00000000 ; undefined
  b39ca8:	d65f03c0 	ret
  b39cac:	00000000 	.inst	0x00000000 ; undefined
  b39cb0:	d2800301 	mov	x1, #0x18                  	// #24
  b39cb4:	17e3b26b 	b	426660 <_ZdlPvm@plt>
  b39cb8:	f9403c00 	ldr	x0, [x0,#120]
  b39cbc:	d0ffffa1 	adrp	x1, b2f000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2243e8>
  b39cc0:	912d6021 	add	x1, x1, #0xb58
  b39cc4:	f9400002 	ldr	x2, [x0]
  b39cc8:	f9402842 	ldr	x2, [x2,#80]
  b39ccc:	eb01005f 	cmp	x2, x1
  b39cd0:	54000041 	b.ne	b39cd8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f0c0>
  b39cd4:	d65f03c0 	ret
  b39cd8:	d61f0040 	br	x2
  b39cdc:	00000000 	.inst	0x00000000 ; undefined
  b39ce0:	f9400401 	ldr	x1, [x0,#8]
  b39ce4:	b5000041 	cbnz	x1, b39cec <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f0d4>
  b39ce8:	d65f03c0 	ret
  b39cec:	f9400001 	ldr	x1, [x0]
  b39cf0:	b5ffffc1 	cbnz	x1, b39ce8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f0d0>
  b39cf4:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
  b39cf8:	910003fd 	mov	x29, sp
  b39cfc:	a90153f3 	stp	x19, x20, [sp,#16]
  b39d00:	aa0003f3 	mov	x19, x0
  b39d04:	a9025bf5 	stp	x21, x22, [sp,#32]
  b39d08:	90018055 	adrp	x21, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b39d0c:	9123e2b5 	add	x21, x21, #0x8f8
  b39d10:	a90363f7 	stp	x23, x24, [sp,#48]
  b39d14:	a9046bf9 	stp	x25, x26, [sp,#64]
  b39d18:	f9002bfb 	str	x27, [sp,#80]
  b39d1c:	08dffea0 	ldarb	w0, [x21]
  b39d20:	36000e20 	tbz	w0, #0, b39ee4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f2cc>
  b39d24:	90018054 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b39d28:	91240294 	add	x20, x20, #0x900
  b39d2c:	b9801a81 	ldrsw	x1, [x20,#24]
  b39d30:	f9400662 	ldr	x2, [x19,#8]
  b39d34:	f9400683 	ldr	x3, [x20,#8]
  b39d38:	9ac10840 	udiv	x0, x2, x1
  b39d3c:	9b018800 	msub	x0, x0, x1, x2
  b39d40:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b39d44:	b5000080 	cbnz	x0, b39d54 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f13c>
  b39d48:	140000b4 	b	b3a018 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f400>
  b39d4c:	f9400800 	ldr	x0, [x0,#16]
  b39d50:	b4001640 	cbz	x0, b3a018 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f400>
  b39d54:	f9400001 	ldr	x1, [x0]
  b39d58:	eb01005f 	cmp	x2, x1
  b39d5c:	54ffff81 	b.ne	b39d4c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f134>
  b39d60:	f9400415 	ldr	x21, [x0,#8]
  b39d64:	b40015b5 	cbz	x21, b3a018 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f400>
  b39d68:	f0018094 	adrp	x20, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b39d6c:	91198294 	add	x20, x20, #0x660
  b39d70:	08dffe80 	ldarb	w0, [x20]
  b39d74:	36000ea0 	tbz	w0, #0, b39f48 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f330>
  b39d78:	08dffe80 	ldarb	w0, [x20]
  b39d7c:	360011a0 	tbz	w0, #0, b39fb0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f398>
  b39d80:	f0018081 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b39d84:	911a4021 	add	x1, x1, #0x690
  b39d88:	88dffc20 	ldar	w0, [x1]
  b39d8c:	37f81a00 	tbnz	w0, #31, b3a0cc <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f4b4>
  b39d90:	11000402 	add	w2, w0, #0x1
  b39d94:	885ffc23 	ldaxr	w3, [x1]
  b39d98:	6b00007f 	cmp	w3, w0
  b39d9c:	54000061 	b.ne	b39da8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f190>
  b39da0:	8804fc22 	stlxr	w4, w2, [x1]
  b39da4:	35ffff84 	cbnz	w4, b39d94 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f17c>
  b39da8:	54ffff01 	b.ne	b39d88 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f170>
  b39dac:	f0018080 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b39db0:	9119a000 	add	x0, x0, #0x668
  b39db4:	b9801802 	ldrsw	x2, [x0,#24]
  b39db8:	f9400403 	ldr	x3, [x0,#8]
  b39dbc:	9ac20aa0 	udiv	x0, x21, x2
  b39dc0:	9b02d400 	msub	x0, x0, x2, x21
  b39dc4:	f860d874 	ldr	x20, [x3,w0,sxtw #3]
  b39dc8:	b5000094 	cbnz	x20, b39dd8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f1c0>
  b39dcc:	14000007 	b	b39de8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f1d0>
  b39dd0:	f9400a94 	ldr	x20, [x20,#16]
  b39dd4:	b40000b4 	cbz	x20, b39de8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f1d0>
  b39dd8:	f9400280 	ldr	x0, [x20]
  b39ddc:	eb0002bf 	cmp	x21, x0
  b39de0:	54ffff81 	b.ne	b39dd0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f1b8>
  b39de4:	f9400694 	ldr	x20, [x20,#8]
  b39de8:	88dffc20 	ldar	w0, [x1]
  b39dec:	7100001f 	cmp	w0, #0x0
  b39df0:	5400188d 	b.le	b3a100 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f4e8>
  b39df4:	51000402 	sub	w2, w0, #0x1
  b39df8:	885ffc23 	ldaxr	w3, [x1]
  b39dfc:	6b00007f 	cmp	w3, w0
  b39e00:	54000061 	b.ne	b39e0c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f1f4>
  b39e04:	8804fc22 	stlxr	w4, w2, [x1]
  b39e08:	35ffff84 	cbnz	w4, b39df8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f1e0>
  b39e0c:	54fffee1 	b.ne	b39de8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f1d0>
  b39e10:	f9000274 	str	x20, [x19]
  b39e14:	b50005b4 	cbnz	x20, b39ec8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f2b0>
  b39e18:	9000d45b 	adrp	x27, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b39e1c:	d000deda 	adrp	x26, 2713000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1501a8>
  b39e20:	d000e494 	adrp	x20, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b39e24:	9136a37b 	add	x27, x27, #0xda8
  b39e28:	9137e35a 	add	x26, x26, #0xdf8
  b39e2c:	9101c3f9 	add	x25, sp, #0x70
  b39e30:	91366294 	add	x20, x20, #0xd98
  b39e34:	9101e3f8 	add	x24, sp, #0x78
  b39e38:	910203f7 	add	x23, sp, #0x80
  b39e3c:	9101a3f6 	add	x22, sp, #0x68
  b39e40:	910223f5 	add	x21, sp, #0x88
  b39e44:	aa1b03e1 	mov	x1, x27
  b39e48:	aa1703e0 	mov	x0, x23
  b39e4c:	945fe7a5 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b39e50:	aa1803e8 	mov	x8, x24
  b39e54:	9117a341 	add	x1, x26, #0x5e8
  b39e58:	aa1703e0 	mov	x0, x23
  b39e5c:	945f6765 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b39e60:	aa1903e8 	mov	x8, x25
  b39e64:	aa1403e1 	mov	x1, x20
  b39e68:	aa1803e0 	mov	x0, x24
  b39e6c:	945f6761 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b39e70:	aa1503e0 	mov	x0, x21
  b39e74:	b000d441 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b39e78:	912f2021 	add	x1, x1, #0xbc8
  b39e7c:	945fe799 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b39e80:	aa1603e8 	mov	x8, x22
  b39e84:	aa1503e1 	mov	x1, x21
  b39e88:	aa1903e0 	mov	x0, x25
  b39e8c:	945f6701 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b39e90:	52800022 	mov	w2, #0x1                   	// #1
  b39e94:	52800001 	mov	w1, #0x0                   	// #0
  b39e98:	aa1603e0 	mov	x0, x22
  b39e9c:	945b1951 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b39ea0:	aa1603e0 	mov	x0, x22
  b39ea4:	945f09d7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39ea8:	aa1503e0 	mov	x0, x21
  b39eac:	945f09d5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39eb0:	aa1903e0 	mov	x0, x25
  b39eb4:	945f09d3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39eb8:	aa1803e0 	mov	x0, x24
  b39ebc:	945f09d1 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39ec0:	aa1703e0 	mov	x0, x23
  b39ec4:	945f09cf 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b39ec8:	a94153f3 	ldp	x19, x20, [sp,#16]
  b39ecc:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b39ed0:	a94363f7 	ldp	x23, x24, [sp,#48]
  b39ed4:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b39ed8:	f9402bfb 	ldr	x27, [sp,#80]
  b39edc:	a8c97bfd 	ldp	x29, x30, [sp],#144
  b39ee0:	d65f03c0 	ret
  b39ee4:	aa1503e0 	mov	x0, x21
  b39ee8:	90018054 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b39eec:	97e3b0dd 	bl	426260 <__cxa_guard_acquire@plt>
  b39ef0:	91240294 	add	x20, x20, #0x900
  b39ef4:	34fff1c0 	cbz	w0, b39d2c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f114>
  b39ef8:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b39efc:	b900229f 	str	wzr, [x20,#32]
  b39f00:	97e3ac34 	bl	424fd0 <malloc@plt>
  b39f04:	f9000680 	str	x0, [x20,#8]
  b39f08:	52801304 	mov	w4, #0x98                  	// #152
  b39f0c:	52800ca3 	mov	w3, #0x65                  	// #101
  b39f10:	b9001284 	str	w4, [x20,#16]
  b39f14:	d2806502 	mov	x2, #0x328                 	// #808
  b39f18:	b9001a83 	str	w3, [x20,#24]
  b39f1c:	52800001 	mov	w1, #0x0                   	// #0
  b39f20:	97e3a9b4 	bl	4245f0 <memset@plt>
  b39f24:	aa1503e0 	mov	x0, x21
  b39f28:	97e3b246 	bl	426840 <__cxa_guard_release@plt>
  b39f2c:	aa1403e1 	mov	x1, x20
  b39f30:	b0017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b39f34:	d0ffda00 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b39f38:	9135a042 	add	x2, x2, #0xd68
  b39f3c:	91126000 	add	x0, x0, #0x498
  b39f40:	97e3b3dc 	bl	426eb0 <__cxa_atexit@plt>
  b39f44:	17ffff7a 	b	b39d2c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f114>
  b39f48:	aa1403e0 	mov	x0, x20
  b39f4c:	97e3b0c5 	bl	426260 <__cxa_guard_acquire@plt>
  b39f50:	34fff140 	cbz	w0, b39d78 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f160>
  b39f54:	f0018096 	adrp	x22, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b39f58:	9119a2d6 	add	x22, x22, #0x668
  b39f5c:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b39f60:	b90022df 	str	wzr, [x22,#32]
  b39f64:	97e3ac1b 	bl	424fd0 <malloc@plt>
  b39f68:	f90006c0 	str	x0, [x22,#8]
  b39f6c:	52801304 	mov	w4, #0x98                  	// #152
  b39f70:	52800ca3 	mov	w3, #0x65                  	// #101
  b39f74:	b90012c4 	str	w4, [x22,#16]
  b39f78:	d2806502 	mov	x2, #0x328                 	// #808
  b39f7c:	b9001ac3 	str	w3, [x22,#24]
  b39f80:	52800001 	mov	w1, #0x0                   	// #0
  b39f84:	97e3a99b 	bl	4245f0 <memset@plt>
  b39f88:	b9002adf 	str	wzr, [x22,#40]
  b39f8c:	aa1403e0 	mov	x0, x20
  b39f90:	97e3b22c 	bl	426840 <__cxa_guard_release@plt>
  b39f94:	b0017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b39f98:	aa1603e1 	mov	x1, x22
  b39f9c:	9135a042 	add	x2, x2, #0xd68
  b39fa0:	90ffe3c0 	adrp	x0, 7b1000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb8258>
  b39fa4:	91098000 	add	x0, x0, #0x260
  b39fa8:	97e3b3c2 	bl	426eb0 <__cxa_atexit@plt>
  b39fac:	17ffff73 	b	b39d78 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f160>
  b39fb0:	aa1403e0 	mov	x0, x20
  b39fb4:	97e3b0ab 	bl	426260 <__cxa_guard_acquire@plt>
  b39fb8:	34ffee40 	cbz	w0, b39d80 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f168>
  b39fbc:	f0018096 	adrp	x22, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b39fc0:	9119a2d6 	add	x22, x22, #0x668
  b39fc4:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b39fc8:	b90022df 	str	wzr, [x22,#32]
  b39fcc:	97e3ac01 	bl	424fd0 <malloc@plt>
  b39fd0:	f90006c0 	str	x0, [x22,#8]
  b39fd4:	52801304 	mov	w4, #0x98                  	// #152
  b39fd8:	52800ca3 	mov	w3, #0x65                  	// #101
  b39fdc:	b90012c4 	str	w4, [x22,#16]
  b39fe0:	d2806502 	mov	x2, #0x328                 	// #808
  b39fe4:	b9001ac3 	str	w3, [x22,#24]
  b39fe8:	52800001 	mov	w1, #0x0                   	// #0
  b39fec:	97e3a981 	bl	4245f0 <memset@plt>
  b39ff0:	b9002adf 	str	wzr, [x22,#40]
  b39ff4:	aa1403e0 	mov	x0, x20
  b39ff8:	97e3b212 	bl	426840 <__cxa_guard_release@plt>
  b39ffc:	b0017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3a000:	aa1603e1 	mov	x1, x22
  b3a004:	9135a042 	add	x2, x2, #0xd68
  b3a008:	f0ffe3a0 	adrp	x0, 7b1000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb8258>
  b3a00c:	91098000 	add	x0, x0, #0x260
  b3a010:	97e3b3a8 	bl	426eb0 <__cxa_atexit@plt>
  b3a014:	17ffff5b 	b	b39d80 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f168>
  b3a018:	f000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3a01c:	9101c3f9 	add	x25, sp, #0x70
  b3a020:	9136a03b 	add	x27, x1, #0xda8
  b3a024:	aa1903e0 	mov	x0, x25
  b3a028:	aa1b03e1 	mov	x1, x27
  b3a02c:	945fe72d 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3a030:	b000dec1 	adrp	x1, 2713000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1501a8>
  b3a034:	9101e3f8 	add	x24, sp, #0x78
  b3a038:	9137e03a 	add	x26, x1, #0xdf8
  b3a03c:	aa1903e0 	mov	x0, x25
  b3a040:	91146341 	add	x1, x26, #0x518
  b3a044:	aa1803e8 	mov	x8, x24
  b3a048:	945f66ea 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3a04c:	b000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3a050:	910203f7 	add	x23, sp, #0x80
  b3a054:	91366034 	add	x20, x1, #0xd98
  b3a058:	aa1703e8 	mov	x8, x23
  b3a05c:	aa1403e1 	mov	x1, x20
  b3a060:	aa1803e0 	mov	x0, x24
  b3a064:	945f66e3 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3a068:	9101a3f6 	add	x22, sp, #0x68
  b3a06c:	9000d441 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3a070:	aa1603e0 	mov	x0, x22
  b3a074:	912e6021 	add	x1, x1, #0xb98
  b3a078:	945fe71a 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3a07c:	910223f5 	add	x21, sp, #0x88
  b3a080:	aa1603e1 	mov	x1, x22
  b3a084:	aa1503e8 	mov	x8, x21
  b3a088:	aa1703e0 	mov	x0, x23
  b3a08c:	945f6681 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3a090:	52800022 	mov	w2, #0x1                   	// #1
  b3a094:	52800001 	mov	w1, #0x0                   	// #0
  b3a098:	aa1503e0 	mov	x0, x21
  b3a09c:	945b18d1 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3a0a0:	aa1503e0 	mov	x0, x21
  b3a0a4:	945f0957 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a0a8:	aa1603e0 	mov	x0, x22
  b3a0ac:	945f0955 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a0b0:	aa1703e0 	mov	x0, x23
  b3a0b4:	945f0953 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a0b8:	aa1803e0 	mov	x0, x24
  b3a0bc:	945f0951 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a0c0:	aa1903e0 	mov	x0, x25
  b3a0c4:	945f094f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a0c8:	17ffff5f 	b	b39e44 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f22c>
  b3a0cc:	f000d43b 	adrp	x27, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3a0d0:	b000deda 	adrp	x26, 2713000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1501a8>
  b3a0d4:	b000e494 	adrp	x20, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3a0d8:	9136a37b 	add	x27, x27, #0xda8
  b3a0dc:	9137e35a 	add	x26, x26, #0xdf8
  b3a0e0:	9101c3f9 	add	x25, sp, #0x70
  b3a0e4:	91366294 	add	x20, x20, #0xd98
  b3a0e8:	9101e3f8 	add	x24, sp, #0x78
  b3a0ec:	910203f7 	add	x23, sp, #0x80
  b3a0f0:	9101a3f6 	add	x22, sp, #0x68
  b3a0f4:	910223f5 	add	x21, sp, #0x88
  b3a0f8:	f900027f 	str	xzr, [x19]
  b3a0fc:	17ffff52 	b	b39e44 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f22c>
  b3a100:	9101c3f9 	add	x25, sp, #0x70
  b3a104:	f000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3a108:	aa1903e0 	mov	x0, x25
  b3a10c:	9136a021 	add	x1, x1, #0xda8
  b3a110:	9101e3f8 	add	x24, sp, #0x78
  b3a114:	945fe6f3 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3a118:	b000dec1 	adrp	x1, 2713000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1501a8>
  b3a11c:	aa1903e0 	mov	x0, x25
  b3a120:	aa1803e8 	mov	x8, x24
  b3a124:	9137e021 	add	x1, x1, #0xdf8
  b3a128:	945f66b2 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3a12c:	910203f7 	add	x23, sp, #0x80
  b3a130:	b000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3a134:	aa1703e8 	mov	x8, x23
  b3a138:	91366021 	add	x1, x1, #0xd98
  b3a13c:	aa1803e0 	mov	x0, x24
  b3a140:	945f66ac 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3a144:	9101a3f6 	add	x22, sp, #0x68
  b3a148:	9000d441 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3a14c:	aa1603e0 	mov	x0, x22
  b3a150:	912e4021 	add	x1, x1, #0xb90
  b3a154:	945fe6e3 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3a158:	910223f5 	add	x21, sp, #0x88
  b3a15c:	aa1603e1 	mov	x1, x22
  b3a160:	aa1503e8 	mov	x8, x21
  b3a164:	aa1703e0 	mov	x0, x23
  b3a168:	945f664a 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3a16c:	52800022 	mov	w2, #0x1                   	// #1
  b3a170:	52800001 	mov	w1, #0x0                   	// #0
  b3a174:	aa1503e0 	mov	x0, x21
  b3a178:	945b189a 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3a17c:	aa1503e0 	mov	x0, x21
  b3a180:	945f0920 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a184:	aa1603e0 	mov	x0, x22
  b3a188:	945f091e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a18c:	aa1703e0 	mov	x0, x23
  b3a190:	945f091c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a194:	aa1803e0 	mov	x0, x24
  b3a198:	945f091a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a19c:	aa1903e0 	mov	x0, x25
  b3a1a0:	945f0918 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a1a4:	17ffff1b 	b	b39e10 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f1f8>
  b3a1a8:	aa1503e0 	mov	x0, x21
  b3a1ac:	945f0915 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a1b0:	aa1603e0 	mov	x0, x22
  b3a1b4:	945f0913 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a1b8:	aa1703e0 	mov	x0, x23
  b3a1bc:	945f0911 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a1c0:	aa1803e0 	mov	x0, x24
  b3a1c4:	945f090f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a1c8:	aa1903e0 	mov	x0, x25
  b3a1cc:	945f090d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a1d0:	97e3b564 	bl	427760 <_ZSt9terminatev@plt>
  b3a1d4:	aa1503e0 	mov	x0, x21
  b3a1d8:	945f090a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a1dc:	aa1603e0 	mov	x0, x22
  b3a1e0:	945f0908 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a1e4:	aa1703e0 	mov	x0, x23
  b3a1e8:	945f0906 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a1ec:	aa1803e0 	mov	x0, x24
  b3a1f0:	945f0904 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a1f4:	aa1903e0 	mov	x0, x25
  b3a1f8:	945f0902 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a1fc:	97e3b559 	bl	427760 <_ZSt9terminatev@plt>
  b3a200:	17fffff7 	b	b3a1dc <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f5c4>
  b3a204:	17fffff8 	b	b3a1e4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f5cc>
  b3a208:	17fffff9 	b	b3a1ec <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f5d4>
  b3a20c:	17fffffa 	b	b3a1f4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f5dc>
  b3a210:	17ffffe8 	b	b3a1b0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f598>
  b3a214:	17ffffe9 	b	b3a1b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f5a0>
  b3a218:	17ffffea 	b	b3a1c0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f5a8>
  b3a21c:	17ffffeb 	b	b3a1c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f5b0>
  b3a220:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
  b3a224:	b000dec1 	adrp	x1, 2713000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1501a8>
  b3a228:	91358021 	add	x1, x1, #0xd60
  b3a22c:	910003fd 	mov	x29, sp
  b3a230:	f9000bf3 	str	x19, [sp,#16]
  b3a234:	aa0003f3 	mov	x19, x0
  b3a238:	f9403c00 	ldr	x0, [x0,#120]
  b3a23c:	f9000261 	str	x1, [x19]
  b3a240:	b4000080 	cbz	x0, b3a250 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f638>
  b3a244:	f9400001 	ldr	x1, [x0]
  b3a248:	f9400421 	ldr	x1, [x1,#8]
  b3a24c:	d63f0020 	blr	x1
  b3a250:	91012260 	add	x0, x19, #0x48
  b3a254:	97f7df4b 	bl	931f80 <_ZSt20__throw_bad_weak_ptrv@@Base+0x27368>
  b3a258:	9100e260 	add	x0, x19, #0x38
  b3a25c:	97fffea1 	bl	b39ce0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f0c8>
  b3a260:	9100a260 	add	x0, x19, #0x28
  b3a264:	97fc4bc5 	bl	a4d178 <_ZSt20__throw_bad_weak_ptrv@@Base+0x142560>
  b3a268:	91006260 	add	x0, x19, #0x18
  b3a26c:	97f7de5d 	bl	931be0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26fc8>
  b3a270:	91002260 	add	x0, x19, #0x8
  b3a274:	f9400bf3 	ldr	x19, [sp,#16]
  b3a278:	a8c27bfd 	ldp	x29, x30, [sp],#32
  b3a27c:	17f17447 	b	797398 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x9e5f0>
  b3a280:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
  b3a284:	b000dec1 	adrp	x1, 2713000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1501a8>
  b3a288:	91358021 	add	x1, x1, #0xd60
  b3a28c:	910003fd 	mov	x29, sp
  b3a290:	f9000bf3 	str	x19, [sp,#16]
  b3a294:	aa0003f3 	mov	x19, x0
  b3a298:	f9403c00 	ldr	x0, [x0,#120]
  b3a29c:	f9000261 	str	x1, [x19]
  b3a2a0:	b4000080 	cbz	x0, b3a2b0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f698>
  b3a2a4:	f9400001 	ldr	x1, [x0]
  b3a2a8:	f9400421 	ldr	x1, [x1,#8]
  b3a2ac:	d63f0020 	blr	x1
  b3a2b0:	91012260 	add	x0, x19, #0x48
  b3a2b4:	97f7df33 	bl	931f80 <_ZSt20__throw_bad_weak_ptrv@@Base+0x27368>
  b3a2b8:	9100e260 	add	x0, x19, #0x38
  b3a2bc:	97fffe89 	bl	b39ce0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f0c8>
  b3a2c0:	9100a260 	add	x0, x19, #0x28
  b3a2c4:	97fc4bad 	bl	a4d178 <_ZSt20__throw_bad_weak_ptrv@@Base+0x142560>
  b3a2c8:	91006260 	add	x0, x19, #0x18
  b3a2cc:	97f7de45 	bl	931be0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26fc8>
  b3a2d0:	91002260 	add	x0, x19, #0x8
  b3a2d4:	97f17431 	bl	797398 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x9e5f0>
  b3a2d8:	aa1303e0 	mov	x0, x19
  b3a2dc:	d2801201 	mov	x1, #0x90                  	// #144
  b3a2e0:	f9400bf3 	ldr	x19, [sp,#16]
  b3a2e4:	a8c27bfd 	ldp	x29, x30, [sp],#32
  b3a2e8:	17e3b0de 	b	426660 <_ZdlPvm@plt>
  b3a2ec:	00000000 	.inst	0x00000000 ; undefined
  b3a2f0:	a9478402 	ldp	x2, x1, [x0,#120]
  b3a2f4:	aa0203e0 	mov	x0, x2
  b3a2f8:	f9400042 	ldr	x2, [x2]
  b3a2fc:	f9401842 	ldr	x2, [x2,#48]
  b3a300:	d61f0040 	br	x2
  b3a304:	d503201f 	nop
  b3a308:	f9403c01 	ldr	x1, [x0,#120]
  b3a30c:	aa0103e0 	mov	x0, x1
  b3a310:	f9400021 	ldr	x1, [x1]
  b3a314:	f9401c21 	ldr	x1, [x1,#56]
  b3a318:	d61f0020 	br	x1
  b3a31c:	d503201f 	nop
  b3a320:	f9403c01 	ldr	x1, [x0,#120]
  b3a324:	aa0103e0 	mov	x0, x1
  b3a328:	f9400021 	ldr	x1, [x1]
  b3a32c:	f9402021 	ldr	x1, [x1,#64]
  b3a330:	d61f0020 	br	x1
  b3a334:	d503201f 	nop
  b3a338:	52800081 	mov	w1, #0x4                   	// #4
  b3a33c:	b9005801 	str	w1, [x0,#88]
  b3a340:	d65f03c0 	ret
  b3a344:	d503201f 	nop
  b3a348:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
  b3a34c:	910003fd 	mov	x29, sp
  b3a350:	f9000bf3 	str	x19, [sp,#16]
  b3a354:	aa0003f3 	mov	x19, x0
  b3a358:	39400400 	ldrb	w0, [x0,#1]
  b3a35c:	35000200 	cbnz	w0, b3a39c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f784>
  b3a360:	d2800000 	mov	x0, #0x0                   	// #0
  b3a364:	39400262 	ldrb	w2, [x19]
  b3a368:	d2801661 	mov	x1, #0xb3                  	// #179
  b3a36c:	f2f12001 	movk	x1, #0x8900, lsl #48
  b3a370:	d28d1443 	mov	x3, #0x68a2                	// #26786
  b3a374:	8b000040 	add	x0, x2, x0
  b3a378:	f2a7f103 	movk	x3, #0x3f88, lsl #16
  b3a37c:	f2cbadc3 	movk	x3, #0x5d6e, lsl #32
  b3a380:	f2e03bc3 	movk	x3, #0x1de, lsl #48
  b3a384:	9bc17c01 	umulh	x1, x0, x1
  b3a388:	f9400bf3 	ldr	x19, [sp,#16]
  b3a38c:	d378fc21 	lsr	x1, x1, #56
  b3a390:	a8c27bfd 	ldp	x29, x30, [sp],#32
  b3a394:	9b038020 	msub	x0, x1, x3, x0
  b3a398:	d65f03c0 	ret
  b3a39c:	91000660 	add	x0, x19, #0x1
  b3a3a0:	97ffffea 	bl	b3a348 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f730>
  b3a3a4:	8b001001 	add	x1, x0, x0, lsl #4
  b3a3a8:	8b010c00 	add	x0, x0, x1, lsl #3
  b3a3ac:	17ffffee 	b	b3a364 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f74c>
  b3a3b0:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
  b3a3b4:	910003fd 	mov	x29, sp
  b3a3b8:	a90153f3 	stp	x19, x20, [sp,#16]
  b3a3bc:	aa0003f4 	mov	x20, x0
  b3a3c0:	f9400c13 	ldr	x19, [x0,#24]
  b3a3c4:	a9025bf5 	stp	x21, x22, [sp,#32]
  b3a3c8:	aa0103f5 	mov	x21, x1
  b3a3cc:	b4000213 	cbz	x19, b3a40c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f7f4>
  b3a3d0:	f9400263 	ldr	x3, [x19]
  b3a3d4:	aa1503e2 	mov	x2, x21
  b3a3d8:	aa1303e0 	mov	x0, x19
  b3a3dc:	91020281 	add	x1, x20, #0x80
  b3a3e0:	f9405063 	ldr	x3, [x3,#160]
  b3a3e4:	d63f0060 	blr	x3
  b3a3e8:	a9478682 	ldp	x2, x1, [x20,#120]
  b3a3ec:	aa0203e0 	mov	x0, x2
  b3a3f0:	f9400042 	ldr	x2, [x2]
  b3a3f4:	f9401442 	ldr	x2, [x2,#40]
  b3a3f8:	d63f0040 	blr	x2
  b3a3fc:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3a400:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3a404:	a8c87bfd 	ldp	x29, x30, [sp],#128
  b3a408:	d65f03c0 	ret
  b3a40c:	f9401000 	ldr	x0, [x0,#32]
  b3a410:	b4fffe00 	cbz	x0, b3a3d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f7b8>
  b3a414:	a90363f7 	stp	x23, x24, [sp,#48]
  b3a418:	f0018037 	adrp	x23, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3a41c:	9123e2f7 	add	x23, x23, #0x8f8
  b3a420:	08dffee0 	ldarb	w0, [x23]
  b3a424:	36000e20 	tbz	w0, #0, b3a5e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f9d0>
  b3a428:	f0018036 	adrp	x22, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3a42c:	912402d6 	add	x22, x22, #0x900
  b3a430:	b9801ac1 	ldrsw	x1, [x22,#24]
  b3a434:	f9401282 	ldr	x2, [x20,#32]
  b3a438:	f94006c3 	ldr	x3, [x22,#8]
  b3a43c:	9ac10840 	udiv	x0, x2, x1
  b3a440:	9b018800 	msub	x0, x0, x1, x2
  b3a444:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b3a448:	b4000140 	cbz	x0, b3a470 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f858>
  b3a44c:	f9400001 	ldr	x1, [x0]
  b3a450:	eb02003f 	cmp	x1, x2
  b3a454:	540000a1 	b.ne	b3a468 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f850>
  b3a458:	14000035 	b	b3a52c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f914>
  b3a45c:	f9400001 	ldr	x1, [x0]
  b3a460:	eb01005f 	cmp	x2, x1
  b3a464:	54000640 	b.eq	b3a52c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f914>
  b3a468:	f9400800 	ldr	x0, [x0,#16]
  b3a46c:	b5ffff80 	cbnz	x0, b3a45c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f844>
  b3a470:	910183f6 	add	x22, sp, #0x60
  b3a474:	f000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3a478:	aa1603e0 	mov	x0, x22
  b3a47c:	9136a021 	add	x1, x1, #0xda8
  b3a480:	945fe618 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3a484:	9101a3f7 	add	x23, sp, #0x68
  b3a488:	d000dec1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3a48c:	911d4021 	add	x1, x1, #0x750
  b3a490:	9100a021 	add	x1, x1, #0x28
  b3a494:	aa1603e0 	mov	x0, x22
  b3a498:	aa1703e8 	mov	x8, x23
  b3a49c:	945f65d5 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3a4a0:	9101c3f8 	add	x24, sp, #0x70
  b3a4a4:	b000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3a4a8:	aa1803e8 	mov	x8, x24
  b3a4ac:	91366021 	add	x1, x1, #0xd98
  b3a4b0:	aa1703e0 	mov	x0, x23
  b3a4b4:	945f65cf 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3a4b8:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3a4bc:	910163f9 	add	x25, sp, #0x58
  b3a4c0:	9000d441 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3a4c4:	aa1903e0 	mov	x0, x25
  b3a4c8:	912e6021 	add	x1, x1, #0xb98
  b3a4cc:	945fe605 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3a4d0:	9101e3fa 	add	x26, sp, #0x78
  b3a4d4:	aa1903e1 	mov	x1, x25
  b3a4d8:	aa1a03e8 	mov	x8, x26
  b3a4dc:	aa1803e0 	mov	x0, x24
  b3a4e0:	945f656c 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3a4e4:	52800022 	mov	w2, #0x1                   	// #1
  b3a4e8:	52800001 	mov	w1, #0x0                   	// #0
  b3a4ec:	aa1a03e0 	mov	x0, x26
  b3a4f0:	945b17bc 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3a4f4:	aa1a03e0 	mov	x0, x26
  b3a4f8:	945f0842 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a4fc:	aa1903e0 	mov	x0, x25
  b3a500:	945f0840 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a504:	aa1803e0 	mov	x0, x24
  b3a508:	945f083e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a50c:	aa1703e0 	mov	x0, x23
  b3a510:	945f083c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a514:	aa1603e0 	mov	x0, x22
  b3a518:	945f083a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a51c:	f9400e93 	ldr	x19, [x20,#24]
  b3a520:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3a524:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3a528:	17ffffaa 	b	b3a3d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f7b8>
  b3a52c:	f9400416 	ldr	x22, [x0,#8]
  b3a530:	b4fffa16 	cbz	x22, b3a470 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f858>
  b3a534:	d0018097 	adrp	x23, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3a538:	911c22f7 	add	x23, x23, #0x708
  b3a53c:	08dffee0 	ldarb	w0, [x23]
  b3a540:	36000860 	tbz	w0, #0, b3a64c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fa34>
  b3a544:	08dffee0 	ldarb	w0, [x23]
  b3a548:	36000b60 	tbz	w0, #0, b3a6b4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fa9c>
  b3a54c:	d0018081 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3a550:	911ce021 	add	x1, x1, #0x738
  b3a554:	88dffc20 	ldar	w0, [x1]
  b3a558:	37f80420 	tbnz	w0, #31, b3a5dc <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f9c4>
  b3a55c:	11000402 	add	w2, w0, #0x1
  b3a560:	885ffc23 	ldaxr	w3, [x1]
  b3a564:	6b00007f 	cmp	w3, w0
  b3a568:	54000061 	b.ne	b3a574 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f95c>
  b3a56c:	8804fc22 	stlxr	w4, w2, [x1]
  b3a570:	35ffff84 	cbnz	w4, b3a560 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f948>
  b3a574:	54ffff01 	b.ne	b3a554 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f93c>
  b3a578:	d0018080 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3a57c:	911c4000 	add	x0, x0, #0x710
  b3a580:	b9801802 	ldrsw	x2, [x0,#24]
  b3a584:	f9400403 	ldr	x3, [x0,#8]
  b3a588:	9ac20ac0 	udiv	x0, x22, x2
  b3a58c:	9b02d800 	msub	x0, x0, x2, x22
  b3a590:	f860d873 	ldr	x19, [x3,w0,sxtw #3]
  b3a594:	b5000093 	cbnz	x19, b3a5a4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f98c>
  b3a598:	14000007 	b	b3a5b4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f99c>
  b3a59c:	f9400a73 	ldr	x19, [x19,#16]
  b3a5a0:	b40000b3 	cbz	x19, b3a5b4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f99c>
  b3a5a4:	f9400260 	ldr	x0, [x19]
  b3a5a8:	eb0002df 	cmp	x22, x0
  b3a5ac:	54ffff81 	b.ne	b3a59c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f984>
  b3a5b0:	f9400673 	ldr	x19, [x19,#8]
  b3a5b4:	88dffc20 	ldar	w0, [x1]
  b3a5b8:	7100001f 	cmp	w0, #0x0
  b3a5bc:	54000b0d 	b.le	b3a71c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fb04>
  b3a5c0:	51000402 	sub	w2, w0, #0x1
  b3a5c4:	885ffc23 	ldaxr	w3, [x1]
  b3a5c8:	6b00007f 	cmp	w3, w0
  b3a5cc:	54000061 	b.ne	b3a5d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f9c0>
  b3a5d0:	8804fc22 	stlxr	w4, w2, [x1]
  b3a5d4:	35ffff84 	cbnz	w4, b3a5c4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f9ac>
  b3a5d8:	54fffee1 	b.ne	b3a5b4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f99c>
  b3a5dc:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3a5e0:	f9000e93 	str	x19, [x20,#24]
  b3a5e4:	17ffff7b 	b	b3a3d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f7b8>
  b3a5e8:	aa1703e0 	mov	x0, x23
  b3a5ec:	f0018036 	adrp	x22, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3a5f0:	97e3af1c 	bl	426260 <__cxa_guard_acquire@plt>
  b3a5f4:	912402d6 	add	x22, x22, #0x900
  b3a5f8:	34fff1c0 	cbz	w0, b3a430 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f818>
  b3a5fc:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3a600:	b90022df 	str	wzr, [x22,#32]
  b3a604:	97e3aa73 	bl	424fd0 <malloc@plt>
  b3a608:	f90006c0 	str	x0, [x22,#8]
  b3a60c:	52801304 	mov	w4, #0x98                  	// #152
  b3a610:	52800ca3 	mov	w3, #0x65                  	// #101
  b3a614:	b90012c4 	str	w4, [x22,#16]
  b3a618:	d2806502 	mov	x2, #0x328                 	// #808
  b3a61c:	b9001ac3 	str	w3, [x22,#24]
  b3a620:	52800001 	mov	w1, #0x0                   	// #0
  b3a624:	97e3a7f3 	bl	4245f0 <memset@plt>
  b3a628:	aa1703e0 	mov	x0, x23
  b3a62c:	97e3b085 	bl	426840 <__cxa_guard_release@plt>
  b3a630:	aa1603e1 	mov	x1, x22
  b3a634:	90017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3a638:	b0ffda00 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b3a63c:	9135a042 	add	x2, x2, #0xd68
  b3a640:	91126000 	add	x0, x0, #0x498
  b3a644:	97e3b21b 	bl	426eb0 <__cxa_atexit@plt>
  b3a648:	17ffff7a 	b	b3a430 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f818>
  b3a64c:	aa1703e0 	mov	x0, x23
  b3a650:	97e3af04 	bl	426260 <__cxa_guard_acquire@plt>
  b3a654:	34fff780 	cbz	w0, b3a544 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f92c>
  b3a658:	d0018098 	adrp	x24, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3a65c:	911c4318 	add	x24, x24, #0x710
  b3a660:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3a664:	b900231f 	str	wzr, [x24,#32]
  b3a668:	97e3aa5a 	bl	424fd0 <malloc@plt>
  b3a66c:	f9000700 	str	x0, [x24,#8]
  b3a670:	52801304 	mov	w4, #0x98                  	// #152
  b3a674:	52800ca3 	mov	w3, #0x65                  	// #101
  b3a678:	b9001304 	str	w4, [x24,#16]
  b3a67c:	d2806502 	mov	x2, #0x328                 	// #808
  b3a680:	b9001b03 	str	w3, [x24,#24]
  b3a684:	52800001 	mov	w1, #0x0                   	// #0
  b3a688:	97e3a7da 	bl	4245f0 <memset@plt>
  b3a68c:	b9002b1f 	str	wzr, [x24,#40]
  b3a690:	aa1703e0 	mov	x0, x23
  b3a694:	97e3b06b 	bl	426840 <__cxa_guard_release@plt>
  b3a698:	90017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3a69c:	aa1803e1 	mov	x1, x24
  b3a6a0:	9135a042 	add	x2, x2, #0xd68
  b3a6a4:	d0ffe3a0 	adrp	x0, 7b0000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb7258>
  b3a6a8:	91292000 	add	x0, x0, #0xa48
  b3a6ac:	97e3b201 	bl	426eb0 <__cxa_atexit@plt>
  b3a6b0:	17ffffa5 	b	b3a544 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f92c>
  b3a6b4:	aa1703e0 	mov	x0, x23
  b3a6b8:	97e3aeea 	bl	426260 <__cxa_guard_acquire@plt>
  b3a6bc:	34fff480 	cbz	w0, b3a54c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f934>
  b3a6c0:	d0018098 	adrp	x24, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3a6c4:	911c4318 	add	x24, x24, #0x710
  b3a6c8:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3a6cc:	b900231f 	str	wzr, [x24,#32]
  b3a6d0:	97e3aa40 	bl	424fd0 <malloc@plt>
  b3a6d4:	f9000700 	str	x0, [x24,#8]
  b3a6d8:	52801304 	mov	w4, #0x98                  	// #152
  b3a6dc:	52800ca3 	mov	w3, #0x65                  	// #101
  b3a6e0:	b9001304 	str	w4, [x24,#16]
  b3a6e4:	d2806502 	mov	x2, #0x328                 	// #808
  b3a6e8:	b9001b03 	str	w3, [x24,#24]
  b3a6ec:	52800001 	mov	w1, #0x0                   	// #0
  b3a6f0:	97e3a7c0 	bl	4245f0 <memset@plt>
  b3a6f4:	b9002b1f 	str	wzr, [x24,#40]
  b3a6f8:	aa1703e0 	mov	x0, x23
  b3a6fc:	97e3b051 	bl	426840 <__cxa_guard_release@plt>
  b3a700:	90017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3a704:	aa1803e1 	mov	x1, x24
  b3a708:	9135a042 	add	x2, x2, #0xd68
  b3a70c:	d0ffe3a0 	adrp	x0, 7b0000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb7258>
  b3a710:	91292000 	add	x0, x0, #0xa48
  b3a714:	97e3b1e7 	bl	426eb0 <__cxa_atexit@plt>
  b3a718:	17ffff8d 	b	b3a54c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f934>
  b3a71c:	910183f6 	add	x22, sp, #0x60
  b3a720:	f000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3a724:	aa1603e0 	mov	x0, x22
  b3a728:	9136a021 	add	x1, x1, #0xda8
  b3a72c:	9101a3f7 	add	x23, sp, #0x68
  b3a730:	945fe56c 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3a734:	d000dec1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3a738:	aa1603e0 	mov	x0, x22
  b3a73c:	aa1703e8 	mov	x8, x23
  b3a740:	911d4021 	add	x1, x1, #0x750
  b3a744:	945f652b 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3a748:	9101c3f8 	add	x24, sp, #0x70
  b3a74c:	b000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3a750:	aa1803e8 	mov	x8, x24
  b3a754:	91366021 	add	x1, x1, #0xd98
  b3a758:	aa1703e0 	mov	x0, x23
  b3a75c:	945f6525 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3a760:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3a764:	910163f9 	add	x25, sp, #0x58
  b3a768:	9000d441 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3a76c:	aa1903e0 	mov	x0, x25
  b3a770:	912e4021 	add	x1, x1, #0xb90
  b3a774:	945fe55b 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3a778:	9101e3fa 	add	x26, sp, #0x78
  b3a77c:	aa1903e1 	mov	x1, x25
  b3a780:	aa1a03e8 	mov	x8, x26
  b3a784:	aa1803e0 	mov	x0, x24
  b3a788:	945f64c2 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3a78c:	52800022 	mov	w2, #0x1                   	// #1
  b3a790:	52800001 	mov	w1, #0x0                   	// #0
  b3a794:	aa1a03e0 	mov	x0, x26
  b3a798:	945b1712 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3a79c:	aa1a03e0 	mov	x0, x26
  b3a7a0:	945f0798 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a7a4:	aa1903e0 	mov	x0, x25
  b3a7a8:	945f0796 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a7ac:	aa1803e0 	mov	x0, x24
  b3a7b0:	945f0794 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a7b4:	aa1703e0 	mov	x0, x23
  b3a7b8:	945f0792 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a7bc:	aa1603e0 	mov	x0, x22
  b3a7c0:	945f0790 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a7c4:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3a7c8:	17ffff85 	b	b3a5dc <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f9c4>
  b3a7cc:	aa0003f3 	mov	x19, x0
  b3a7d0:	aa1a03e0 	mov	x0, x26
  b3a7d4:	945f078b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a7d8:	aa1903e0 	mov	x0, x25
  b3a7dc:	945f0789 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a7e0:	aa1803e0 	mov	x0, x24
  b3a7e4:	945f0787 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a7e8:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3a7ec:	aa1703e0 	mov	x0, x23
  b3a7f0:	945f0784 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a7f4:	aa1603e0 	mov	x0, x22
  b3a7f8:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3a7fc:	945f0781 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a800:	aa1303e0 	mov	x0, x19
  b3a804:	97e3a943 	bl	424d10 <_Unwind_Resume@plt>
  b3a808:	aa1a03e0 	mov	x0, x26
  b3a80c:	945f077d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a810:	aa1903e0 	mov	x0, x25
  b3a814:	945f077b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a818:	aa1803e0 	mov	x0, x24
  b3a81c:	945f0779 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a820:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3a824:	aa1703e0 	mov	x0, x23
  b3a828:	945f0776 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a82c:	aa1603e0 	mov	x0, x22
  b3a830:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3a834:	945f0773 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3a838:	97e3b3ca 	bl	427760 <_ZSt9terminatev@plt>
  b3a83c:	17fffff5 	b	b3a810 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fbf8>
  b3a840:	17fffff6 	b	b3a818 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fc00>
  b3a844:	17fffff8 	b	b3a824 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fc0c>
  b3a848:	17fffff9 	b	b3a82c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fc14>
  b3a84c:	aa0003f3 	mov	x19, x0
  b3a850:	17ffffe2 	b	b3a7d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fbc0>
  b3a854:	aa0003f3 	mov	x19, x0
  b3a858:	17ffffe2 	b	b3a7e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fbc8>
  b3a85c:	aa0003f3 	mov	x19, x0
  b3a860:	17ffffe3 	b	b3a7ec <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fbd4>
  b3a864:	aa0003f3 	mov	x19, x0
  b3a868:	17ffffe3 	b	b3a7f4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fbdc>
  b3a86c:	d503201f 	nop
  b3a870:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
  b3a874:	910003fd 	mov	x29, sp
  b3a878:	a90153f3 	stp	x19, x20, [sp,#16]
  b3a87c:	aa0003f4 	mov	x20, x0
  b3a880:	aa0003f3 	mov	x19, x0
  b3a884:	a9025bf5 	stp	x21, x22, [sp,#32]
  b3a888:	aa0403f6 	mov	x22, x4
  b3a88c:	2a0603e4 	mov	w4, w6
  b3a890:	f9001bf7 	str	x23, [sp,#48]
  b3a894:	aa0503f7 	mov	x23, x5
  b3a898:	97fff640 	bl	b38198 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22d580>
  b3a89c:	d000dec0 	adrp	x0, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3a8a0:	911ae000 	add	x0, x0, #0x6b8
  b3a8a4:	f8090680 	str	x0, [x20],#144
  b3a8a8:	f000dea0 	adrp	x0, 2711000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x14e1a8>
  b3a8ac:	9129dc00 	add	x0, x0, #0xa77
  b3a8b0:	97fffea6 	bl	b3a348 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f730>
  b3a8b4:	8b001003 	add	x3, x0, x0, lsl #4
  b3a8b8:	d2801661 	mov	x1, #0xb3                  	// #179
  b3a8bc:	d28d1442 	mov	x2, #0x68a2                	// #26786
  b3a8c0:	8b030c03 	add	x3, x0, x3, lsl #3
  b3a8c4:	f2f12001 	movk	x1, #0x8900, lsl #48
  b3a8c8:	91019464 	add	x4, x3, #0x65
  b3a8cc:	f2a7f102 	movk	x2, #0x3f88, lsl #16
  b3a8d0:	f2cbadc2 	movk	x2, #0x5d6e, lsl #32
  b3a8d4:	d2801400 	mov	x0, #0xa0                  	// #160
  b3a8d8:	f2e03bc2 	movk	x2, #0x1de, lsl #48
  b3a8dc:	9bc17c83 	umulh	x3, x4, x1
  b3a8e0:	d378fc63 	lsr	x3, x3, #56
  b3a8e4:	9b029063 	msub	x3, x3, x2, x4
  b3a8e8:	8b031064 	add	x4, x3, x3, lsl #4
  b3a8ec:	8b040c63 	add	x3, x3, x4, lsl #3
  b3a8f0:	9101cc64 	add	x4, x3, #0x73
  b3a8f4:	9bc17c83 	umulh	x3, x4, x1
  b3a8f8:	d378fc63 	lsr	x3, x3, #56
  b3a8fc:	9b029063 	msub	x3, x3, x2, x4
  b3a900:	8b031064 	add	x4, x3, x3, lsl #4
  b3a904:	8b040c63 	add	x3, x3, x4, lsl #3
  b3a908:	91018464 	add	x4, x3, #0x61
  b3a90c:	9bc17c83 	umulh	x3, x4, x1
  b3a910:	d378fc63 	lsr	x3, x3, #56
  b3a914:	9b029063 	msub	x3, x3, x2, x4
  b3a918:	8b031064 	add	x4, x3, x3, lsl #4
  b3a91c:	8b040c63 	add	x3, x3, x4, lsl #3
  b3a920:	91018c64 	add	x4, x3, #0x63
  b3a924:	9bc17c83 	umulh	x3, x4, x1
  b3a928:	d378fc63 	lsr	x3, x3, #56
  b3a92c:	9b029063 	msub	x3, x3, x2, x4
  b3a930:	8b031064 	add	x4, x3, x3, lsl #4
  b3a934:	8b040c63 	add	x3, x3, x4, lsl #3
  b3a938:	91019464 	add	x4, x3, #0x65
  b3a93c:	9bc17c83 	umulh	x3, x4, x1
  b3a940:	d378fc63 	lsr	x3, x3, #56
  b3a944:	9b029063 	msub	x3, x3, x2, x4
  b3a948:	8b031064 	add	x4, x3, x3, lsl #4
  b3a94c:	8b040c63 	add	x3, x3, x4, lsl #3
  b3a950:	9101cc64 	add	x4, x3, #0x73
  b3a954:	9bc17c83 	umulh	x3, x4, x1
  b3a958:	d378fc63 	lsr	x3, x3, #56
  b3a95c:	9b029063 	msub	x3, x3, x2, x4
  b3a960:	8b031064 	add	x4, x3, x3, lsl #4
  b3a964:	8b040c63 	add	x3, x3, x4, lsl #3
  b3a968:	91015463 	add	x3, x3, #0x55
  b3a96c:	9bc17c61 	umulh	x1, x3, x1
  b3a970:	d378fc21 	lsr	x1, x1, #56
  b3a974:	9b028c21 	msub	x1, x1, x2, x3
  b3a978:	a909067f 	stp	xzr, x1, [x19,#144]
  b3a97c:	97e3a8f1 	bl	424d40 <_Znwm@plt>
  b3a980:	aa0003f5 	mov	x21, x0
  b3a984:	aa1703e2 	mov	x2, x23
  b3a988:	aa1603e1 	mov	x1, x22
  b3a98c:	97ffddc5 	bl	b320a0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x227488>
  b3a990:	f9403e74 	ldr	x20, [x19,#120]
  b3a994:	f9003e75 	str	x21, [x19,#120]
  b3a998:	b4000454 	cbz	x20, b3aa20 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fe08>
  b3a99c:	f9400281 	ldr	x1, [x20]
  b3a9a0:	90ffffe0 	adrp	x0, b36000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22b3e8>
  b3a9a4:	91128000 	add	x0, x0, #0x4a0
  b3a9a8:	f9400421 	ldr	x1, [x1,#8]
  b3a9ac:	eb00003f 	cmp	x1, x0
  b3a9b0:	aa1403e0 	mov	x0, x20
  b3a9b4:	54000401 	b.ne	b3aa34 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fe1c>
  b3a9b8:	b000dec1 	adrp	x1, 2713000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1501a8>
  b3a9bc:	91074021 	add	x1, x1, #0x1d0
  b3a9c0:	f8090401 	str	x1, [x0],#144
  b3a9c4:	97ffed4d 	bl	b35ef8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22b2e0>
  b3a9c8:	91020280 	add	x0, x20, #0x80
  b3a9cc:	97ffebfb 	bl	b359b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ada0>
  b3a9d0:	f9403280 	ldr	x0, [x20,#96]
  b3a9d4:	9000dec1 	adrp	x1, 2712000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x14f1a8>
  b3a9d8:	911d4021 	add	x1, x1, #0x750
  b3a9dc:	f9000281 	str	x1, [x20]
  b3a9e0:	97e3a844 	bl	424af0 <free@plt>
  b3a9e4:	91010280 	add	x0, x20, #0x40
  b3a9e8:	97fc49e4 	bl	a4d178 <_ZSt20__throw_bad_weak_ptrv@@Base+0x142560>
  b3a9ec:	9100c280 	add	x0, x20, #0x30
  b3a9f0:	97f1726a 	bl	797398 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x9e5f0>
  b3a9f4:	91008280 	add	x0, x20, #0x20
  b3a9f8:	97ffd5b2 	bl	b300c0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2254a8>
  b3a9fc:	91004280 	add	x0, x20, #0x10
  b3aa00:	97ffd460 	bl	b2fb80 <_ZSt20__throw_bad_weak_ptrv@@Base+0x224f68>
  b3aa04:	aa1403e0 	mov	x0, x20
  b3aa08:	d2801401 	mov	x1, #0xa0                  	// #160
  b3aa0c:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3aa10:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3aa14:	f9401bf7 	ldr	x23, [sp,#48]
  b3aa18:	a8c47bfd 	ldp	x29, x30, [sp],#64
  b3aa1c:	17e3af11 	b	426660 <_ZdlPvm@plt>
  b3aa20:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3aa24:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3aa28:	f9401bf7 	ldr	x23, [sp,#48]
  b3aa2c:	a8c47bfd 	ldp	x29, x30, [sp],#64
  b3aa30:	d65f03c0 	ret
  b3aa34:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3aa38:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3aa3c:	f9401bf7 	ldr	x23, [sp,#48]
  b3aa40:	a8c47bfd 	ldp	x29, x30, [sp],#64
  b3aa44:	d61f0020 	br	x1
  b3aa48:	aa0003f6 	mov	x22, x0
  b3aa4c:	14000005 	b	b3aa60 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fe48>
  b3aa50:	aa0003f6 	mov	x22, x0
  b3aa54:	d2801401 	mov	x1, #0xa0                  	// #160
  b3aa58:	aa1503e0 	mov	x0, x21
  b3aa5c:	97e3af01 	bl	426660 <_ZdlPvm@plt>
  b3aa60:	aa1403e0 	mov	x0, x20
  b3aa64:	97ffb0c1 	bl	b26d68 <_ZSt20__throw_bad_weak_ptrv@@Base+0x21c150>
  b3aa68:	aa1303e0 	mov	x0, x19
  b3aa6c:	97fffded 	bl	b3a220 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22f608>
  b3aa70:	aa1603e0 	mov	x0, x22
  b3aa74:	97e3a8a7 	bl	424d10 <_Unwind_Resume@plt>
  b3aa78:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
  b3aa7c:	910003fd 	mov	x29, sp
  b3aa80:	a90153f3 	stp	x19, x20, [sp,#16]
  b3aa84:	aa0003f3 	mov	x19, x0
  b3aa88:	f9400c00 	ldr	x0, [x0,#24]
  b3aa8c:	b40007c0 	cbz	x0, b3ab84 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ff6c>
  b3aa90:	f9401660 	ldr	x0, [x19,#40]
  b3aa94:	b4001080 	cbz	x0, b3aca4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23008c>
  b3aa98:	a9025bf5 	stp	x21, x22, [sp,#32]
  b3aa9c:	91006275 	add	x21, x19, #0x18
  b3aaa0:	a90363f7 	stp	x23, x24, [sp,#48]
  b3aaa4:	52800021 	mov	w1, #0x1                   	// #1
  b3aaa8:	aa1503e0 	mov	x0, x21
  b3aaac:	b9005a7f 	str	wzr, [x19,#88]
  b3aab0:	9101e3f6 	add	x22, sp, #0x78
  b3aab4:	91020274 	add	x20, x19, #0x80
  b3aab8:	97f7db94 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3aabc:	f9400e77 	ldr	x23, [x19,#24]
  b3aac0:	aa1603e0 	mov	x0, x22
  b3aac4:	f000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3aac8:	91352021 	add	x1, x1, #0xd48
  b3aacc:	f94002e2 	ldr	x2, [x23]
  b3aad0:	f9403058 	ldr	x24, [x2,#96]
  b3aad4:	945fe483 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3aad8:	aa1703e0 	mov	x0, x23
  b3aadc:	aa1603e2 	mov	x2, x22
  b3aae0:	aa1403e1 	mov	x1, x20
  b3aae4:	52800003 	mov	w3, #0x0                   	// #0
  b3aae8:	d63f0300 	blr	x24
  b3aaec:	aa1603e0 	mov	x0, x22
  b3aaf0:	945f06c4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3aaf4:	52800021 	mov	w1, #0x1                   	// #1
  b3aaf8:	aa1503e0 	mov	x0, x21
  b3aafc:	97f7db83 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3ab00:	f9400e64 	ldr	x4, [x19,#24]
  b3ab04:	52800003 	mov	w3, #0x0                   	// #0
  b3ab08:	52800002 	mov	w2, #0x0                   	// #0
  b3ab0c:	aa1403e1 	mov	x1, x20
  b3ab10:	aa0403e0 	mov	x0, x4
  b3ab14:	f9400084 	ldr	x4, [x4]
  b3ab18:	f9403884 	ldr	x4, [x4,#112]
  b3ab1c:	d63f0080 	blr	x4
  b3ab20:	52800021 	mov	w1, #0x1                   	// #1
  b3ab24:	aa1503e0 	mov	x0, x21
  b3ab28:	97f7db78 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3ab2c:	f9400e63 	ldr	x3, [x19,#24]
  b3ab30:	aa1403e1 	mov	x1, x20
  b3ab34:	39422262 	ldrb	w2, [x19,#136]
  b3ab38:	aa0303e0 	mov	x0, x3
  b3ab3c:	f9400063 	ldr	x3, [x3]
  b3ab40:	f9401463 	ldr	x3, [x3,#40]
  b3ab44:	d63f0060 	blr	x3
  b3ab48:	aa1503e0 	mov	x0, x21
  b3ab4c:	52800021 	mov	w1, #0x1                   	// #1
  b3ab50:	97f7db6e 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3ab54:	f9400e63 	ldr	x3, [x19,#24]
  b3ab58:	aa1403e1 	mov	x1, x20
  b3ab5c:	39422262 	ldrb	w2, [x19,#136]
  b3ab60:	aa0303e0 	mov	x0, x3
  b3ab64:	f9400063 	ldr	x3, [x3]
  b3ab68:	f9405463 	ldr	x3, [x3,#168]
  b3ab6c:	d63f0060 	blr	x3
  b3ab70:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3ab74:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3ab78:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3ab7c:	a8c87bfd 	ldp	x29, x30, [sp],#128
  b3ab80:	d65f03c0 	ret
  b3ab84:	f9401260 	ldr	x0, [x19,#32]
  b3ab88:	b4ffff80 	cbz	x0, b3ab78 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ff60>
  b3ab8c:	a9025bf5 	stp	x21, x22, [sp,#32]
  b3ab90:	f0018035 	adrp	x21, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3ab94:	9123e2b5 	add	x21, x21, #0x8f8
  b3ab98:	08dffea0 	ldarb	w0, [x21]
  b3ab9c:	36001640 	tbz	w0, #0, b3ae64 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23024c>
  b3aba0:	f0018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3aba4:	91240294 	add	x20, x20, #0x900
  b3aba8:	b9801a81 	ldrsw	x1, [x20,#24]
  b3abac:	f9401262 	ldr	x2, [x19,#32]
  b3abb0:	f9400683 	ldr	x3, [x20,#8]
  b3abb4:	9ac10840 	udiv	x0, x2, x1
  b3abb8:	9b018800 	msub	x0, x0, x1, x2
  b3abbc:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b3abc0:	b5000080 	cbnz	x0, b3abd0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ffb8>
  b3abc4:	14000078 	b	b3ada4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23018c>
  b3abc8:	f9400800 	ldr	x0, [x0,#16]
  b3abcc:	b4000ec0 	cbz	x0, b3ada4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23018c>
  b3abd0:	f9400001 	ldr	x1, [x0]
  b3abd4:	eb01005f 	cmp	x2, x1
  b3abd8:	54ffff81 	b.ne	b3abc8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ffb0>
  b3abdc:	f9400415 	ldr	x21, [x0,#8]
  b3abe0:	b4000e35 	cbz	x21, b3ada4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23018c>
  b3abe4:	d0018094 	adrp	x20, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3abe8:	911c2294 	add	x20, x20, #0x708
  b3abec:	08dffe80 	ldarb	w0, [x20]
  b3abf0:	36001b20 	tbz	w0, #0, b3af54 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23033c>
  b3abf4:	08dffe80 	ldarb	w0, [x20]
  b3abf8:	36001e20 	tbz	w0, #0, b3afbc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2303a4>
  b3abfc:	d0018081 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3ac00:	911ce021 	add	x1, x1, #0x738
  b3ac04:	88dffc20 	ldar	w0, [x1]
  b3ac08:	37f82b20 	tbnz	w0, #31, b3b16c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230554>
  b3ac0c:	11000402 	add	w2, w0, #0x1
  b3ac10:	885ffc23 	ldaxr	w3, [x1]
  b3ac14:	6b00007f 	cmp	w3, w0
  b3ac18:	54000061 	b.ne	b3ac24 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23000c>
  b3ac1c:	8804fc22 	stlxr	w4, w2, [x1]
  b3ac20:	35ffff84 	cbnz	w4, b3ac10 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fff8>
  b3ac24:	54ffff01 	b.ne	b3ac04 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ffec>
  b3ac28:	d0018080 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3ac2c:	911c4000 	add	x0, x0, #0x710
  b3ac30:	b9801802 	ldrsw	x2, [x0,#24]
  b3ac34:	f9400403 	ldr	x3, [x0,#8]
  b3ac38:	9ac20aa0 	udiv	x0, x21, x2
  b3ac3c:	9b02d400 	msub	x0, x0, x2, x21
  b3ac40:	f860d874 	ldr	x20, [x3,w0,sxtw #3]
  b3ac44:	b5000094 	cbnz	x20, b3ac54 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23003c>
  b3ac48:	14000007 	b	b3ac64 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23004c>
  b3ac4c:	f9400a94 	ldr	x20, [x20,#16]
  b3ac50:	b40000b4 	cbz	x20, b3ac64 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23004c>
  b3ac54:	f9400280 	ldr	x0, [x20]
  b3ac58:	eb0002bf 	cmp	x21, x0
  b3ac5c:	54ffff81 	b.ne	b3ac4c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230034>
  b3ac60:	f9400694 	ldr	x20, [x20,#8]
  b3ac64:	88dffc20 	ldar	w0, [x1]
  b3ac68:	7100001f 	cmp	w0, #0x0
  b3ac6c:	5400290d 	b.le	b3b18c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230574>
  b3ac70:	51000402 	sub	w2, w0, #0x1
  b3ac74:	885ffc23 	ldaxr	w3, [x1]
  b3ac78:	6b00007f 	cmp	w3, w0
  b3ac7c:	54000061 	b.ne	b3ac88 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230070>
  b3ac80:	8804fc22 	stlxr	w4, w2, [x1]
  b3ac84:	35ffff84 	cbnz	w4, b3ac74 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23005c>
  b3ac88:	54fffee1 	b.ne	b3ac64 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23004c>
  b3ac8c:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3ac90:	f9000e74 	str	x20, [x19,#24]
  b3ac94:	b5ffeff4 	cbnz	x20, b3aa90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fe78>
  b3ac98:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3ac9c:	a8c87bfd 	ldp	x29, x30, [sp],#128
  b3aca0:	d65f03c0 	ret
  b3aca4:	f9401a60 	ldr	x0, [x19,#48]
  b3aca8:	b4fff680 	cbz	x0, b3ab78 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ff60>
  b3acac:	a9025bf5 	stp	x21, x22, [sp,#32]
  b3acb0:	f0018035 	adrp	x21, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3acb4:	9123e2b5 	add	x21, x21, #0x8f8
  b3acb8:	08dffea0 	ldarb	w0, [x21]
  b3acbc:	36001be0 	tbz	w0, #0, b3b038 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230420>
  b3acc0:	f0018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3acc4:	91240294 	add	x20, x20, #0x900
  b3acc8:	b9801a81 	ldrsw	x1, [x20,#24]
  b3accc:	f9401a62 	ldr	x2, [x19,#48]
  b3acd0:	f9400683 	ldr	x3, [x20,#8]
  b3acd4:	9ac10840 	udiv	x0, x2, x1
  b3acd8:	9b018800 	msub	x0, x0, x1, x2
  b3acdc:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b3ace0:	b5000080 	cbnz	x0, b3acf0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2300d8>
  b3ace4:	14000079 	b	b3aec8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2302b0>
  b3ace8:	f9400800 	ldr	x0, [x0,#16]
  b3acec:	b4000ee0 	cbz	x0, b3aec8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2302b0>
  b3acf0:	f9400001 	ldr	x1, [x0]
  b3acf4:	eb01005f 	cmp	x2, x1
  b3acf8:	54ffff81 	b.ne	b3ace8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2300d0>
  b3acfc:	f9400414 	ldr	x20, [x0,#8]
  b3ad00:	b4000e54 	cbz	x20, b3aec8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2302b0>
  b3ad04:	d0018095 	adrp	x21, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3ad08:	911b42b5 	add	x21, x21, #0x6d0
  b3ad0c:	08dffea0 	ldarb	w0, [x21]
  b3ad10:	36001c60 	tbz	w0, #0, b3b09c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230484>
  b3ad14:	08dffea0 	ldarb	w0, [x21]
  b3ad18:	36001f60 	tbz	w0, #0, b3b104 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2304ec>
  b3ad1c:	d0018080 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3ad20:	911c0002 	add	x2, x0, #0x700
  b3ad24:	88dffc41 	ldar	w1, [x2]
  b3ad28:	37f81821 	tbnz	w1, #31, b3b02c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230414>
  b3ad2c:	11000423 	add	w3, w1, #0x1
  b3ad30:	885ffc44 	ldaxr	w4, [x2]
  b3ad34:	6b01009f 	cmp	w4, w1
  b3ad38:	54000061 	b.ne	b3ad44 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23012c>
  b3ad3c:	8805fc43 	stlxr	w5, w3, [x2]
  b3ad40:	35ffff85 	cbnz	w5, b3ad30 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230118>
  b3ad44:	54ffff01 	b.ne	b3ad24 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23010c>
  b3ad48:	d0018081 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3ad4c:	911b6021 	add	x1, x1, #0x6d8
  b3ad50:	b9801823 	ldrsw	x3, [x1,#24]
  b3ad54:	f9400424 	ldr	x4, [x1,#8]
  b3ad58:	9ac30a81 	udiv	x1, x20, x3
  b3ad5c:	9b03d021 	msub	x1, x1, x3, x20
  b3ad60:	f861d881 	ldr	x1, [x4,w1,sxtw #3]
  b3ad64:	b5000081 	cbnz	x1, b3ad74 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23015c>
  b3ad68:	14000104 	b	b3b178 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230560>
  b3ad6c:	f9400821 	ldr	x1, [x1,#16]
  b3ad70:	b40015a1 	cbz	x1, b3b024 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23040c>
  b3ad74:	f9400022 	ldr	x2, [x1]
  b3ad78:	eb02029f 	cmp	x20, x2
  b3ad7c:	54ffff81 	b.ne	b3ad6c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230154>
  b3ad80:	f9400434 	ldr	x20, [x1,#8]
  b3ad84:	911c0000 	add	x0, x0, #0x700
  b3ad88:	97ed25be 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3ad8c:	f9001674 	str	x20, [x19,#40]
  b3ad90:	b5ffe874 	cbnz	x20, b3aa9c <_ZSt20__throw_bad_weak_ptrv@@Base+0x22fe84>
  b3ad94:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3ad98:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3ad9c:	a8c87bfd 	ldp	x29, x30, [sp],#128
  b3ada0:	d65f03c0 	ret
  b3ada4:	9101c3f5 	add	x21, sp, #0x70
  b3ada8:	f000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3adac:	aa1503e0 	mov	x0, x21
  b3adb0:	9136a021 	add	x1, x1, #0xda8
  b3adb4:	a90363f7 	stp	x23, x24, [sp,#48]
  b3adb8:	945fe3ca 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3adbc:	9101a3f7 	add	x23, sp, #0x68
  b3adc0:	d000dec1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3adc4:	911d4021 	add	x1, x1, #0x750
  b3adc8:	9100a021 	add	x1, x1, #0x28
  b3adcc:	aa1503e0 	mov	x0, x21
  b3add0:	aa1703e8 	mov	x8, x23
  b3add4:	945f6387 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3add8:	910183f8 	add	x24, sp, #0x60
  b3addc:	b000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3ade0:	aa1803e8 	mov	x8, x24
  b3ade4:	91366021 	add	x1, x1, #0xd98
  b3ade8:	aa1703e0 	mov	x0, x23
  b3adec:	945f6381 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3adf0:	9101e3f6 	add	x22, sp, #0x78
  b3adf4:	9000d441 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3adf8:	aa1603e0 	mov	x0, x22
  b3adfc:	912e6021 	add	x1, x1, #0xb98
  b3ae00:	945fe3b8 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3ae04:	f90023f9 	str	x25, [sp,#64]
  b3ae08:	910163f9 	add	x25, sp, #0x58
  b3ae0c:	aa1603e1 	mov	x1, x22
  b3ae10:	aa1803e0 	mov	x0, x24
  b3ae14:	aa1903e8 	mov	x8, x25
  b3ae18:	945f631e 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3ae1c:	52800022 	mov	w2, #0x1                   	// #1
  b3ae20:	52800001 	mov	w1, #0x0                   	// #0
  b3ae24:	aa1903e0 	mov	x0, x25
  b3ae28:	945b156e 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3ae2c:	aa1903e0 	mov	x0, x25
  b3ae30:	945f05f4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3ae34:	aa1603e0 	mov	x0, x22
  b3ae38:	945f05f2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3ae3c:	aa1803e0 	mov	x0, x24
  b3ae40:	945f05f0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3ae44:	aa1703e0 	mov	x0, x23
  b3ae48:	945f05ee 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3ae4c:	aa1503e0 	mov	x0, x21
  b3ae50:	945f05ec 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3ae54:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3ae58:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3ae5c:	f94023f9 	ldr	x25, [sp,#64]
  b3ae60:	17ffff46 	b	b3ab78 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ff60>
  b3ae64:	aa1503e0 	mov	x0, x21
  b3ae68:	f0018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3ae6c:	97e3acfd 	bl	426260 <__cxa_guard_acquire@plt>
  b3ae70:	91240294 	add	x20, x20, #0x900
  b3ae74:	34ffe9a0 	cbz	w0, b3aba8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ff90>
  b3ae78:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3ae7c:	b900229f 	str	wzr, [x20,#32]
  b3ae80:	97e3a854 	bl	424fd0 <malloc@plt>
  b3ae84:	f9000680 	str	x0, [x20,#8]
  b3ae88:	52801304 	mov	w4, #0x98                  	// #152
  b3ae8c:	52800ca3 	mov	w3, #0x65                  	// #101
  b3ae90:	b9001284 	str	w4, [x20,#16]
  b3ae94:	d2806502 	mov	x2, #0x328                 	// #808
  b3ae98:	b9001a83 	str	w3, [x20,#24]
  b3ae9c:	52800001 	mov	w1, #0x0                   	// #0
  b3aea0:	97e3a5d4 	bl	4245f0 <memset@plt>
  b3aea4:	aa1503e0 	mov	x0, x21
  b3aea8:	97e3ae66 	bl	426840 <__cxa_guard_release@plt>
  b3aeac:	aa1403e1 	mov	x1, x20
  b3aeb0:	90017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3aeb4:	b0ffda00 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b3aeb8:	9135a042 	add	x2, x2, #0xd68
  b3aebc:	91126000 	add	x0, x0, #0x498
  b3aec0:	97e3affc 	bl	426eb0 <__cxa_atexit@plt>
  b3aec4:	17ffff39 	b	b3aba8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ff90>
  b3aec8:	9101c3f5 	add	x21, sp, #0x70
  b3aecc:	f000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3aed0:	aa1503e0 	mov	x0, x21
  b3aed4:	9136a021 	add	x1, x1, #0xda8
  b3aed8:	a90363f7 	stp	x23, x24, [sp,#48]
  b3aedc:	945fe381 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3aee0:	9101a3f7 	add	x23, sp, #0x68
  b3aee4:	d000dec1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3aee8:	911d4021 	add	x1, x1, #0x750
  b3aeec:	91040021 	add	x1, x1, #0x100
  b3aef0:	aa1503e0 	mov	x0, x21
  b3aef4:	aa1703e8 	mov	x8, x23
  b3aef8:	945f633e 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3aefc:	910183f8 	add	x24, sp, #0x60
  b3af00:	b000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3af04:	aa1803e8 	mov	x8, x24
  b3af08:	91366021 	add	x1, x1, #0xd98
  b3af0c:	aa1703e0 	mov	x0, x23
  b3af10:	945f6338 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3af14:	9101e3f6 	add	x22, sp, #0x78
  b3af18:	9000d441 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3af1c:	aa1603e0 	mov	x0, x22
  b3af20:	912e6021 	add	x1, x1, #0xb98
  b3af24:	945fe36f 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3af28:	f90023f9 	str	x25, [sp,#64]
  b3af2c:	910163f9 	add	x25, sp, #0x58
  b3af30:	aa1603e1 	mov	x1, x22
  b3af34:	aa1803e0 	mov	x0, x24
  b3af38:	aa1903e8 	mov	x8, x25
  b3af3c:	945f62d5 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3af40:	52800022 	mov	w2, #0x1                   	// #1
  b3af44:	52800001 	mov	w1, #0x0                   	// #0
  b3af48:	aa1903e0 	mov	x0, x25
  b3af4c:	945b1525 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3af50:	17ffffb7 	b	b3ae2c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230214>
  b3af54:	aa1403e0 	mov	x0, x20
  b3af58:	97e3acc2 	bl	426260 <__cxa_guard_acquire@plt>
  b3af5c:	34ffe4c0 	cbz	w0, b3abf4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ffdc>
  b3af60:	d0018096 	adrp	x22, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3af64:	911c42d6 	add	x22, x22, #0x710
  b3af68:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3af6c:	b90022df 	str	wzr, [x22,#32]
  b3af70:	97e3a818 	bl	424fd0 <malloc@plt>
  b3af74:	f90006c0 	str	x0, [x22,#8]
  b3af78:	52801304 	mov	w4, #0x98                  	// #152
  b3af7c:	52800ca3 	mov	w3, #0x65                  	// #101
  b3af80:	b90012c4 	str	w4, [x22,#16]
  b3af84:	d2806502 	mov	x2, #0x328                 	// #808
  b3af88:	b9001ac3 	str	w3, [x22,#24]
  b3af8c:	52800001 	mov	w1, #0x0                   	// #0
  b3af90:	97e3a598 	bl	4245f0 <memset@plt>
  b3af94:	b9002adf 	str	wzr, [x22,#40]
  b3af98:	aa1403e0 	mov	x0, x20
  b3af9c:	97e3ae29 	bl	426840 <__cxa_guard_release@plt>
  b3afa0:	90017f62 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3afa4:	aa1603e1 	mov	x1, x22
  b3afa8:	9135a042 	add	x2, x2, #0xd68
  b3afac:	d0ffe3a0 	adrp	x0, 7b0000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb7258>
  b3afb0:	91292000 	add	x0, x0, #0xa48
  b3afb4:	97e3afbf 	bl	426eb0 <__cxa_atexit@plt>
  b3afb8:	17ffff0f 	b	b3abf4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ffdc>
  b3afbc:	aa1403e0 	mov	x0, x20
  b3afc0:	97e3aca8 	bl	426260 <__cxa_guard_acquire@plt>
  b3afc4:	34ffe1c0 	cbz	w0, b3abfc <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ffe4>
  b3afc8:	d0018096 	adrp	x22, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3afcc:	911c42d6 	add	x22, x22, #0x710
  b3afd0:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3afd4:	b90022df 	str	wzr, [x22,#32]
  b3afd8:	97e3a7fe 	bl	424fd0 <malloc@plt>
  b3afdc:	f90006c0 	str	x0, [x22,#8]
  b3afe0:	52801304 	mov	w4, #0x98                  	// #152
  b3afe4:	52800ca3 	mov	w3, #0x65                  	// #101
  b3afe8:	b90012c4 	str	w4, [x22,#16]
  b3afec:	d2806502 	mov	x2, #0x328                 	// #808
  b3aff0:	b9001ac3 	str	w3, [x22,#24]
  b3aff4:	52800001 	mov	w1, #0x0                   	// #0
  b3aff8:	97e3a57e 	bl	4245f0 <memset@plt>
  b3affc:	b9002adf 	str	wzr, [x22,#40]
  b3b000:	aa1403e0 	mov	x0, x20
  b3b004:	97e3ae0f 	bl	426840 <__cxa_guard_release@plt>
  b3b008:	f0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3b00c:	aa1603e1 	mov	x1, x22
  b3b010:	9135a042 	add	x2, x2, #0xd68
  b3b014:	b0ffe3a0 	adrp	x0, 7b0000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb7258>
  b3b018:	91292000 	add	x0, x0, #0xa48
  b3b01c:	97e3afa5 	bl	426eb0 <__cxa_atexit@plt>
  b3b020:	17fffef7 	b	b3abfc <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ffe4>
  b3b024:	911c0000 	add	x0, x0, #0x700
  b3b028:	97ed2516 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3b02c:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3b030:	f900167f 	str	xzr, [x19,#40]
  b3b034:	17fffed1 	b	b3ab78 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ff60>
  b3b038:	aa1503e0 	mov	x0, x21
  b3b03c:	d0018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3b040:	97e3ac88 	bl	426260 <__cxa_guard_acquire@plt>
  b3b044:	91240294 	add	x20, x20, #0x900
  b3b048:	34ffe400 	cbz	w0, b3acc8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2300b0>
  b3b04c:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3b050:	b900229f 	str	wzr, [x20,#32]
  b3b054:	97e3a7df 	bl	424fd0 <malloc@plt>
  b3b058:	f9000680 	str	x0, [x20,#8]
  b3b05c:	52801304 	mov	w4, #0x98                  	// #152
  b3b060:	52800ca3 	mov	w3, #0x65                  	// #101
  b3b064:	b9001284 	str	w4, [x20,#16]
  b3b068:	d2806502 	mov	x2, #0x328                 	// #808
  b3b06c:	b9001a83 	str	w3, [x20,#24]
  b3b070:	52800001 	mov	w1, #0x0                   	// #0
  b3b074:	97e3a55f 	bl	4245f0 <memset@plt>
  b3b078:	aa1503e0 	mov	x0, x21
  b3b07c:	97e3adf1 	bl	426840 <__cxa_guard_release@plt>
  b3b080:	aa1403e1 	mov	x1, x20
  b3b084:	f0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3b088:	90ffda00 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b3b08c:	9135a042 	add	x2, x2, #0xd68
  b3b090:	91126000 	add	x0, x0, #0x498
  b3b094:	97e3af87 	bl	426eb0 <__cxa_atexit@plt>
  b3b098:	17ffff0c 	b	b3acc8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2300b0>
  b3b09c:	aa1503e0 	mov	x0, x21
  b3b0a0:	97e3ac70 	bl	426260 <__cxa_guard_acquire@plt>
  b3b0a4:	34ffe380 	cbz	w0, b3ad14 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2300fc>
  b3b0a8:	b0018096 	adrp	x22, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3b0ac:	911b62d6 	add	x22, x22, #0x6d8
  b3b0b0:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3b0b4:	b90022df 	str	wzr, [x22,#32]
  b3b0b8:	97e3a7c6 	bl	424fd0 <malloc@plt>
  b3b0bc:	f90006c0 	str	x0, [x22,#8]
  b3b0c0:	52801304 	mov	w4, #0x98                  	// #152
  b3b0c4:	52800ca3 	mov	w3, #0x65                  	// #101
  b3b0c8:	b90012c4 	str	w4, [x22,#16]
  b3b0cc:	d2806502 	mov	x2, #0x328                 	// #808
  b3b0d0:	b9001ac3 	str	w3, [x22,#24]
  b3b0d4:	52800001 	mov	w1, #0x0                   	// #0
  b3b0d8:	97e3a546 	bl	4245f0 <memset@plt>
  b3b0dc:	b9002adf 	str	wzr, [x22,#40]
  b3b0e0:	aa1503e0 	mov	x0, x21
  b3b0e4:	97e3add7 	bl	426840 <__cxa_guard_release@plt>
  b3b0e8:	f0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3b0ec:	aa1603e1 	mov	x1, x22
  b3b0f0:	9135a042 	add	x2, x2, #0xd68
  b3b0f4:	b0ffe3c0 	adrp	x0, 7b4000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xbb258>
  b3b0f8:	91278000 	add	x0, x0, #0x9e0
  b3b0fc:	97e3af6d 	bl	426eb0 <__cxa_atexit@plt>
  b3b100:	17ffff05 	b	b3ad14 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2300fc>
  b3b104:	aa1503e0 	mov	x0, x21
  b3b108:	97e3ac56 	bl	426260 <__cxa_guard_acquire@plt>
  b3b10c:	34ffe080 	cbz	w0, b3ad1c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230104>
  b3b110:	b0018096 	adrp	x22, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3b114:	911b62d6 	add	x22, x22, #0x6d8
  b3b118:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3b11c:	b90022df 	str	wzr, [x22,#32]
  b3b120:	97e3a7ac 	bl	424fd0 <malloc@plt>
  b3b124:	f90006c0 	str	x0, [x22,#8]
  b3b128:	52801304 	mov	w4, #0x98                  	// #152
  b3b12c:	52800ca3 	mov	w3, #0x65                  	// #101
  b3b130:	b90012c4 	str	w4, [x22,#16]
  b3b134:	d2806502 	mov	x2, #0x328                 	// #808
  b3b138:	b9001ac3 	str	w3, [x22,#24]
  b3b13c:	52800001 	mov	w1, #0x0                   	// #0
  b3b140:	97e3a52c 	bl	4245f0 <memset@plt>
  b3b144:	b9002adf 	str	wzr, [x22,#40]
  b3b148:	aa1503e0 	mov	x0, x21
  b3b14c:	97e3adbd 	bl	426840 <__cxa_guard_release@plt>
  b3b150:	f0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3b154:	aa1603e1 	mov	x1, x22
  b3b158:	9135a042 	add	x2, x2, #0xd68
  b3b15c:	b0ffe3c0 	adrp	x0, 7b4000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xbb258>
  b3b160:	91278000 	add	x0, x0, #0x9e0
  b3b164:	97e3af53 	bl	426eb0 <__cxa_atexit@plt>
  b3b168:	17fffeed 	b	b3ad1c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230104>
  b3b16c:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3b170:	f9000e7f 	str	xzr, [x19,#24]
  b3b174:	17fffe81 	b	b3ab78 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ff60>
  b3b178:	aa0203e0 	mov	x0, x2
  b3b17c:	97ed24c1 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3b180:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3b184:	f900167f 	str	xzr, [x19,#40]
  b3b188:	17fffe7c 	b	b3ab78 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22ff60>
  b3b18c:	9101c3f5 	add	x21, sp, #0x70
  b3b190:	d000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3b194:	aa1503e0 	mov	x0, x21
  b3b198:	9136a021 	add	x1, x1, #0xda8
  b3b19c:	a90363f7 	stp	x23, x24, [sp,#48]
  b3b1a0:	945fe2d0 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3b1a4:	9101a3f7 	add	x23, sp, #0x68
  b3b1a8:	b000dec1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3b1ac:	aa1503e0 	mov	x0, x21
  b3b1b0:	aa1703e8 	mov	x8, x23
  b3b1b4:	911d4021 	add	x1, x1, #0x750
  b3b1b8:	945f628e 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3b1bc:	910183f8 	add	x24, sp, #0x60
  b3b1c0:	9000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3b1c4:	aa1803e8 	mov	x8, x24
  b3b1c8:	91366021 	add	x1, x1, #0xd98
  b3b1cc:	aa1703e0 	mov	x0, x23
  b3b1d0:	945f6288 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3b1d4:	9101e3f6 	add	x22, sp, #0x78
  b3b1d8:	f000d421 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3b1dc:	aa1603e0 	mov	x0, x22
  b3b1e0:	912e4021 	add	x1, x1, #0xb90
  b3b1e4:	945fe2bf 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3b1e8:	f90023f9 	str	x25, [sp,#64]
  b3b1ec:	910163f9 	add	x25, sp, #0x58
  b3b1f0:	aa1603e1 	mov	x1, x22
  b3b1f4:	aa1803e0 	mov	x0, x24
  b3b1f8:	aa1903e8 	mov	x8, x25
  b3b1fc:	945f6225 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3b200:	52800022 	mov	w2, #0x1                   	// #1
  b3b204:	52800001 	mov	w1, #0x0                   	// #0
  b3b208:	aa1903e0 	mov	x0, x25
  b3b20c:	945b1475 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3b210:	aa1903e0 	mov	x0, x25
  b3b214:	945f04fb 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b218:	aa1603e0 	mov	x0, x22
  b3b21c:	945f04f9 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b220:	aa1803e0 	mov	x0, x24
  b3b224:	945f04f7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b228:	aa1703e0 	mov	x0, x23
  b3b22c:	945f04f5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b230:	aa1503e0 	mov	x0, x21
  b3b234:	945f04f3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b238:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3b23c:	f94023f9 	ldr	x25, [sp,#64]
  b3b240:	17fffe93 	b	b3ac8c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230074>
  b3b244:	aa0003f3 	mov	x19, x0
  b3b248:	aa1903e0 	mov	x0, x25
  b3b24c:	945f04ed 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b250:	aa1603e0 	mov	x0, x22
  b3b254:	945f04eb 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b258:	f94023f9 	ldr	x25, [sp,#64]
  b3b25c:	aa1803e0 	mov	x0, x24
  b3b260:	945f04e8 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b264:	aa1703e0 	mov	x0, x23
  b3b268:	945f04e6 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b26c:	aa1503e0 	mov	x0, x21
  b3b270:	f90023f9 	str	x25, [sp,#64]
  b3b274:	945f04e3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b278:	aa1303e0 	mov	x0, x19
  b3b27c:	97e3a6a5 	bl	424d10 <_Unwind_Resume@plt>
  b3b280:	aa1903e0 	mov	x0, x25
  b3b284:	945f04df 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b288:	aa1603e0 	mov	x0, x22
  b3b28c:	945f04dd 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b290:	f94023f9 	ldr	x25, [sp,#64]
  b3b294:	aa1803e0 	mov	x0, x24
  b3b298:	945f04da 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b29c:	aa1703e0 	mov	x0, x23
  b3b2a0:	945f04d8 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b2a4:	aa1503e0 	mov	x0, x21
  b3b2a8:	f90023f9 	str	x25, [sp,#64]
  b3b2ac:	945f04d5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b2b0:	97e3b12c 	bl	427760 <_ZSt9terminatev@plt>
  b3b2b4:	17fffff5 	b	b3b288 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230670>
  b3b2b8:	17fffff7 	b	b3b294 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23067c>
  b3b2bc:	17fffff8 	b	b3b29c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230684>
  b3b2c0:	17fffff9 	b	b3b2a4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23068c>
  b3b2c4:	aa0003f3 	mov	x19, x0
  b3b2c8:	17ffffe7 	b	b3b264 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23064c>
  b3b2cc:	aa0003f3 	mov	x19, x0
  b3b2d0:	17ffffe7 	b	b3b26c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230654>
  b3b2d4:	aa0003f3 	mov	x19, x0
  b3b2d8:	aa1603e0 	mov	x0, x22
  b3b2dc:	f90023f9 	str	x25, [sp,#64]
  b3b2e0:	945f04c8 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b2e4:	aa1303e0 	mov	x0, x19
  b3b2e8:	97e3a68a 	bl	424d10 <_Unwind_Resume@plt>
  b3b2ec:	17ffffd6 	b	b3b244 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23062c>
  b3b2f0:	aa0003f3 	mov	x19, x0
  b3b2f4:	17ffffd7 	b	b3b250 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230638>
  b3b2f8:	aa0003f3 	mov	x19, x0
  b3b2fc:	17ffffd8 	b	b3b25c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230644>
  b3b300:	aa0003f3 	mov	x19, x0
  b3b304:	17ffffd3 	b	b3b250 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230638>
  b3b308:	aa0003f3 	mov	x19, x0
  b3b30c:	17ffffd4 	b	b3b25c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230644>
  b3b310:	aa0003f3 	mov	x19, x0
  b3b314:	17ffffd4 	b	b3b264 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23064c>
  b3b318:	aa0003f3 	mov	x19, x0
  b3b31c:	17ffffd4 	b	b3b26c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230654>
  b3b320:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
  b3b324:	910003fd 	mov	x29, sp
  b3b328:	a90153f3 	stp	x19, x20, [sp,#16]
  b3b32c:	aa0003f3 	mov	x19, x0
  b3b330:	f9400c00 	ldr	x0, [x0,#24]
  b3b334:	a9025bf5 	stp	x21, x22, [sp,#32]
  b3b338:	aa0103f5 	mov	x21, x1
  b3b33c:	b4000800 	cbz	x0, b3b43c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230824>
  b3b340:	f9401660 	ldr	x0, [x19,#40]
  b3b344:	b4000880 	cbz	x0, b3b454 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23083c>
  b3b348:	a90363f7 	stp	x23, x24, [sp,#48]
  b3b34c:	528000a0 	mov	w0, #0x5                   	// #5
  b3b350:	52800021 	mov	w1, #0x1                   	// #1
  b3b354:	b9005a60 	str	w0, [x19,#88]
  b3b358:	91006260 	add	x0, x19, #0x18
  b3b35c:	97f7d96b 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3b360:	f9400e64 	ldr	x4, [x19,#24]
  b3b364:	52800002 	mov	w2, #0x0                   	// #0
  b3b368:	39422263 	ldrb	w3, [x19,#136]
  b3b36c:	91020261 	add	x1, x19, #0x80
  b3b370:	aa0403e0 	mov	x0, x4
  b3b374:	f9400084 	ldr	x4, [x4]
  b3b378:	f9405884 	ldr	x4, [x4,#176]
  b3b37c:	d63f0080 	blr	x4
  b3b380:	b94012b4 	ldr	w20, [x21,#16]
  b3b384:	f9403e76 	ldr	x22, [x19,#120]
  b3b388:	7100029f 	cmp	w20, #0x0
  b3b38c:	f94002c0 	ldr	x0, [x22]
  b3b390:	f9402c17 	ldr	x23, [x0,#88]
  b3b394:	f9003fff 	str	xzr, [sp,#120]
  b3b398:	b90083ff 	str	wzr, [sp,#128]
  b3b39c:	b9008bf4 	str	w20, [sp,#136]
  b3b3a0:	54000360 	b.eq	b3b40c <_ZSt20__throw_bad_weak_ptrv@@Base+0x2307f4>
  b3b3a4:	54001bed 	b.le	b3b720 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230b08>
  b3b3a8:	937d7e80 	sbfiz	x0, x20, #3, #32
  b3b3ac:	97e3a709 	bl	424fd0 <malloc@plt>
  b3b3b0:	f94002a2 	ldr	x2, [x21]
  b3b3b4:	91004003 	add	x3, x0, #0x10
  b3b3b8:	f9003fe0 	str	x0, [sp,#120]
  b3b3bc:	51000681 	sub	w1, w20, #0x1
  b3b3c0:	91004044 	add	x4, x2, #0x10
  b3b3c4:	b90083f4 	str	w20, [sp,#128]
  b3b3c8:	eb00009f 	cmp	x4, x0
  b3b3cc:	fa438042 	ccmp	x2, x3, #0x2, hi
  b3b3d0:	7a442820 	ccmp	w1, #0x4, #0x0, cs
  b3b3d4:	54001aa9 	b.ls	b3b728 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230b10>
  b3b3d8:	53017e83 	lsr	w3, w20, #1
  b3b3dc:	d2800001 	mov	x1, #0x0                   	// #0
  b3b3e0:	d37cec63 	lsl	x3, x3, #4
  b3b3e4:	d503201f 	nop
  b3b3e8:	3ce16840 	ldr	q0, [x2,x1]
  b3b3ec:	3ca16800 	str	q0, [x0,x1]
  b3b3f0:	91004021 	add	x1, x1, #0x10
  b3b3f4:	eb03003f 	cmp	x1, x3
  b3b3f8:	54ffff81 	b.ne	b3b3e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2307d0>
  b3b3fc:	121f7a81 	and	w1, w20, #0xfffffffe
  b3b400:	36000074 	tbz	w20, #0, b3b40c <_ZSt20__throw_bad_weak_ptrv@@Base+0x2307f4>
  b3b404:	f8617842 	ldr	x2, [x2,x1,lsl #3]
  b3b408:	f8217802 	str	x2, [x0,x1,lsl #3]
  b3b40c:	39422663 	ldrb	w3, [x19,#137]
  b3b410:	aa1603e0 	mov	x0, x22
  b3b414:	f9404261 	ldr	x1, [x19,#128]
  b3b418:	9101e3e2 	add	x2, sp, #0x78
  b3b41c:	d63f02e0 	blr	x23
  b3b420:	f9403fe0 	ldr	x0, [sp,#120]
  b3b424:	97e3a5b3 	bl	424af0 <free@plt>
  b3b428:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3b42c:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3b430:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3b434:	a8c97bfd 	ldp	x29, x30, [sp],#144
  b3b438:	d65f03c0 	ret
  b3b43c:	f9401260 	ldr	x0, [x19,#32]
  b3b440:	b5000880 	cbnz	x0, b3b550 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230938>
  b3b444:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3b448:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3b44c:	a8c97bfd 	ldp	x29, x30, [sp],#144
  b3b450:	d65f03c0 	ret
  b3b454:	f9401a60 	ldr	x0, [x19,#48]
  b3b458:	b4ffff60 	cbz	x0, b3b444 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23082c>
  b3b45c:	d0018036 	adrp	x22, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3b460:	9123e2d6 	add	x22, x22, #0x8f8
  b3b464:	08dffec0 	ldarb	w0, [x22]
  b3b468:	36002600 	tbz	w0, #0, b3b928 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230d10>
  b3b46c:	d0018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3b470:	91240294 	add	x20, x20, #0x900
  b3b474:	b9801a81 	ldrsw	x1, [x20,#24]
  b3b478:	f9401a62 	ldr	x2, [x19,#48]
  b3b47c:	f9400683 	ldr	x3, [x20,#8]
  b3b480:	9ac10840 	udiv	x0, x2, x1
  b3b484:	9b018800 	msub	x0, x0, x1, x2
  b3b488:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b3b48c:	b5000080 	cbnz	x0, b3b49c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230884>
  b3b490:	140000c7 	b	b3b7ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x230b94>
  b3b494:	f9400800 	ldr	x0, [x0,#16]
  b3b498:	b40018a0 	cbz	x0, b3b7ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x230b94>
  b3b49c:	f9400001 	ldr	x1, [x0]
  b3b4a0:	eb01005f 	cmp	x2, x1
  b3b4a4:	54ffff81 	b.ne	b3b494 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23087c>
  b3b4a8:	f9400414 	ldr	x20, [x0,#8]
  b3b4ac:	b4001814 	cbz	x20, b3b7ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x230b94>
  b3b4b0:	b0018096 	adrp	x22, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3b4b4:	911b42d6 	add	x22, x22, #0x6d0
  b3b4b8:	08dffec0 	ldarb	w0, [x22]
  b3b4bc:	36002680 	tbz	w0, #0, b3b98c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230d74>
  b3b4c0:	08dffec0 	ldarb	w0, [x22]
  b3b4c4:	360029c0 	tbz	w0, #0, b3b9fc <_ZSt20__throw_bad_weak_ptrv@@Base+0x230de4>
  b3b4c8:	b0018080 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3b4cc:	911c0002 	add	x2, x0, #0x700
  b3b4d0:	88dffc41 	ldar	w1, [x2]
  b3b4d4:	37f82261 	tbnz	w1, #31, b3b920 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230d08>
  b3b4d8:	11000423 	add	w3, w1, #0x1
  b3b4dc:	885ffc44 	ldaxr	w4, [x2]
  b3b4e0:	6b01009f 	cmp	w4, w1
  b3b4e4:	54000061 	b.ne	b3b4f0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2308d8>
  b3b4e8:	8805fc43 	stlxr	w5, w3, [x2]
  b3b4ec:	35ffff85 	cbnz	w5, b3b4dc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2308c4>
  b3b4f0:	54ffff01 	b.ne	b3b4d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2308b8>
  b3b4f4:	b0018081 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3b4f8:	911b6021 	add	x1, x1, #0x6d8
  b3b4fc:	b9801823 	ldrsw	x3, [x1,#24]
  b3b500:	f9400424 	ldr	x4, [x1,#8]
  b3b504:	9ac30a81 	udiv	x1, x20, x3
  b3b508:	9b03d021 	msub	x1, x1, x3, x20
  b3b50c:	f861d881 	ldr	x1, [x4,w1,sxtw #3]
  b3b510:	b5000081 	cbnz	x1, b3b520 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230908>
  b3b514:	14000158 	b	b3ba74 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230e5c>
  b3b518:	f9400821 	ldr	x1, [x1,#16]
  b3b51c:	b4001fe1 	cbz	x1, b3b918 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230d00>
  b3b520:	f9400022 	ldr	x2, [x1]
  b3b524:	eb02029f 	cmp	x20, x2
  b3b528:	54ffff81 	b.ne	b3b518 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230900>
  b3b52c:	f9400434 	ldr	x20, [x1,#8]
  b3b530:	911c0000 	add	x0, x0, #0x700
  b3b534:	97ed23d3 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3b538:	f9001674 	str	x20, [x19,#40]
  b3b53c:	b5fff074 	cbnz	x20, b3b348 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230730>
  b3b540:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3b544:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3b548:	a8c97bfd 	ldp	x29, x30, [sp],#144
  b3b54c:	d65f03c0 	ret
  b3b550:	d0018036 	adrp	x22, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3b554:	9123e2d6 	add	x22, x22, #0x8f8
  b3b558:	08dffec0 	ldarb	w0, [x22]
  b3b55c:	36000f60 	tbz	w0, #0, b3b748 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230b30>
  b3b560:	d0018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3b564:	91240294 	add	x20, x20, #0x900
  b3b568:	b9801a81 	ldrsw	x1, [x20,#24]
  b3b56c:	f9401262 	ldr	x2, [x19,#32]
  b3b570:	f9400683 	ldr	x3, [x20,#8]
  b3b574:	9ac10840 	udiv	x0, x2, x1
  b3b578:	9b018800 	msub	x0, x0, x1, x2
  b3b57c:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b3b580:	b5000080 	cbnz	x0, b3b590 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230978>
  b3b584:	14000038 	b	b3b664 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230a4c>
  b3b588:	f9400800 	ldr	x0, [x0,#16]
  b3b58c:	b40006c0 	cbz	x0, b3b664 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230a4c>
  b3b590:	f9400001 	ldr	x1, [x0]
  b3b594:	eb01005f 	cmp	x2, x1
  b3b598:	54ffff81 	b.ne	b3b588 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230970>
  b3b59c:	f9400416 	ldr	x22, [x0,#8]
  b3b5a0:	b4000636 	cbz	x22, b3b664 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230a4c>
  b3b5a4:	b0018094 	adrp	x20, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3b5a8:	911c2294 	add	x20, x20, #0x708
  b3b5ac:	08dffe80 	ldarb	w0, [x20]
  b3b5b0:	36001440 	tbz	w0, #0, b3b838 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230c20>
  b3b5b4:	08dffe80 	ldarb	w0, [x20]
  b3b5b8:	36001780 	tbz	w0, #0, b3b8a8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230c90>
  b3b5bc:	b0018081 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3b5c0:	911ce021 	add	x1, x1, #0x738
  b3b5c4:	88dffc20 	ldar	w0, [x1]
  b3b5c8:	37f82520 	tbnz	w0, #31, b3ba6c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230e54>
  b3b5cc:	11000402 	add	w2, w0, #0x1
  b3b5d0:	885ffc23 	ldaxr	w3, [x1]
  b3b5d4:	6b00007f 	cmp	w3, w0
  b3b5d8:	54000061 	b.ne	b3b5e4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2309cc>
  b3b5dc:	8804fc22 	stlxr	w4, w2, [x1]
  b3b5e0:	35ffff84 	cbnz	w4, b3b5d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2309b8>
  b3b5e4:	54ffff01 	b.ne	b3b5c4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2309ac>
  b3b5e8:	b0018080 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3b5ec:	911c4000 	add	x0, x0, #0x710
  b3b5f0:	b9801802 	ldrsw	x2, [x0,#24]
  b3b5f4:	f9400403 	ldr	x3, [x0,#8]
  b3b5f8:	9ac20ac0 	udiv	x0, x22, x2
  b3b5fc:	9b02d800 	msub	x0, x0, x2, x22
  b3b600:	f860d874 	ldr	x20, [x3,w0,sxtw #3]
  b3b604:	b5000094 	cbnz	x20, b3b614 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2309fc>
  b3b608:	14000007 	b	b3b624 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230a0c>
  b3b60c:	f9400a94 	ldr	x20, [x20,#16]
  b3b610:	b40000b4 	cbz	x20, b3b624 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230a0c>
  b3b614:	f9400280 	ldr	x0, [x20]
  b3b618:	eb0002df 	cmp	x22, x0
  b3b61c:	54ffff81 	b.ne	b3b60c <_ZSt20__throw_bad_weak_ptrv@@Base+0x2309f4>
  b3b620:	f9400694 	ldr	x20, [x20,#8]
  b3b624:	88dffc20 	ldar	w0, [x1]
  b3b628:	7100001f 	cmp	w0, #0x0
  b3b62c:	540022cd 	b.le	b3ba84 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230e6c>
  b3b630:	51000402 	sub	w2, w0, #0x1
  b3b634:	885ffc23 	ldaxr	w3, [x1]
  b3b638:	6b00007f 	cmp	w3, w0
  b3b63c:	54000061 	b.ne	b3b648 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230a30>
  b3b640:	8804fc22 	stlxr	w4, w2, [x1]
  b3b644:	35ffff84 	cbnz	w4, b3b634 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230a1c>
  b3b648:	54fffee1 	b.ne	b3b624 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230a0c>
  b3b64c:	f9000e74 	str	x20, [x19,#24]
  b3b650:	b5ffe794 	cbnz	x20, b3b340 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230728>
  b3b654:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3b658:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3b65c:	a8c97bfd 	ldp	x29, x30, [sp],#144
  b3b660:	d65f03c0 	ret
  b3b664:	9101c3f6 	add	x22, sp, #0x70
  b3b668:	d000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3b66c:	aa1603e0 	mov	x0, x22
  b3b670:	9136a021 	add	x1, x1, #0xda8
  b3b674:	a90363f7 	stp	x23, x24, [sp,#48]
  b3b678:	945fe19a 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3b67c:	9101a3f7 	add	x23, sp, #0x68
  b3b680:	b000dec1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3b684:	911d4021 	add	x1, x1, #0x750
  b3b688:	9100a021 	add	x1, x1, #0x28
  b3b68c:	aa1603e0 	mov	x0, x22
  b3b690:	aa1703e8 	mov	x8, x23
  b3b694:	945f6157 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3b698:	910183f8 	add	x24, sp, #0x60
  b3b69c:	9000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3b6a0:	aa1803e8 	mov	x8, x24
  b3b6a4:	91366021 	add	x1, x1, #0xd98
  b3b6a8:	aa1703e0 	mov	x0, x23
  b3b6ac:	945f6151 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3b6b0:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3b6b4:	9101e3f9 	add	x25, sp, #0x78
  b3b6b8:	f000d421 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3b6bc:	aa1903e0 	mov	x0, x25
  b3b6c0:	912e6021 	add	x1, x1, #0xb98
  b3b6c4:	945fe187 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3b6c8:	910163fa 	add	x26, sp, #0x58
  b3b6cc:	aa1903e1 	mov	x1, x25
  b3b6d0:	aa1a03e8 	mov	x8, x26
  b3b6d4:	aa1803e0 	mov	x0, x24
  b3b6d8:	945f60ee 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3b6dc:	52800022 	mov	w2, #0x1                   	// #1
  b3b6e0:	52800001 	mov	w1, #0x0                   	// #0
  b3b6e4:	aa1a03e0 	mov	x0, x26
  b3b6e8:	945b133e 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3b6ec:	aa1a03e0 	mov	x0, x26
  b3b6f0:	945f03c4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b6f4:	aa1903e0 	mov	x0, x25
  b3b6f8:	945f03c2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b6fc:	aa1803e0 	mov	x0, x24
  b3b700:	945f03c0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b704:	aa1703e0 	mov	x0, x23
  b3b708:	945f03be 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b70c:	aa1603e0 	mov	x0, x22
  b3b710:	945f03bc 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3b714:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3b718:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3b71c:	17ffff4a 	b	b3b444 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23082c>
  b3b720:	b90083f4 	str	w20, [sp,#128]
  b3b724:	17ffff3a 	b	b3b40c <_ZSt20__throw_bad_weak_ptrv@@Base+0x2307f4>
  b3b728:	d2800001 	mov	x1, #0x0                   	// #0
  b3b72c:	d503201f 	nop
  b3b730:	f8617843 	ldr	x3, [x2,x1,lsl #3]
  b3b734:	f8217803 	str	x3, [x0,x1,lsl #3]
  b3b738:	91000421 	add	x1, x1, #0x1
  b3b73c:	6b01029f 	cmp	w20, w1
  b3b740:	54ffff8c 	b.gt	b3b730 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230b18>
  b3b744:	17ffff32 	b	b3b40c <_ZSt20__throw_bad_weak_ptrv@@Base+0x2307f4>
  b3b748:	aa1603e0 	mov	x0, x22
  b3b74c:	d0018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3b750:	97e3aac4 	bl	426260 <__cxa_guard_acquire@plt>
  b3b754:	91240294 	add	x20, x20, #0x900
  b3b758:	34fff080 	cbz	w0, b3b568 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230950>
  b3b75c:	b900229f 	str	wzr, [x20,#32]
  b3b760:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3b764:	97e3a61b 	bl	424fd0 <malloc@plt>
  b3b768:	f9000680 	str	x0, [x20,#8]
  b3b76c:	52801304 	mov	w4, #0x98                  	// #152
  b3b770:	52800ca3 	mov	w3, #0x65                  	// #101
  b3b774:	b9001284 	str	w4, [x20,#16]
  b3b778:	d2806502 	mov	x2, #0x328                 	// #808
  b3b77c:	b9001a83 	str	w3, [x20,#24]
  b3b780:	52800001 	mov	w1, #0x0                   	// #0
  b3b784:	97e3a39b 	bl	4245f0 <memset@plt>
  b3b788:	aa1603e0 	mov	x0, x22
  b3b78c:	97e3ac2d 	bl	426840 <__cxa_guard_release@plt>
  b3b790:	aa1403e1 	mov	x1, x20
  b3b794:	f0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3b798:	90ffda00 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b3b79c:	9135a042 	add	x2, x2, #0xd68
  b3b7a0:	91126000 	add	x0, x0, #0x498
  b3b7a4:	97e3adc3 	bl	426eb0 <__cxa_atexit@plt>
  b3b7a8:	17ffff70 	b	b3b568 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230950>
  b3b7ac:	9101c3f6 	add	x22, sp, #0x70
  b3b7b0:	d000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3b7b4:	aa1603e0 	mov	x0, x22
  b3b7b8:	9136a021 	add	x1, x1, #0xda8
  b3b7bc:	a90363f7 	stp	x23, x24, [sp,#48]
  b3b7c0:	945fe148 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3b7c4:	9101a3f7 	add	x23, sp, #0x68
  b3b7c8:	b000dec1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3b7cc:	911d4021 	add	x1, x1, #0x750
  b3b7d0:	91040021 	add	x1, x1, #0x100
  b3b7d4:	aa1603e0 	mov	x0, x22
  b3b7d8:	aa1703e8 	mov	x8, x23
  b3b7dc:	945f6105 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3b7e0:	910183f8 	add	x24, sp, #0x60
  b3b7e4:	9000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3b7e8:	aa1803e8 	mov	x8, x24
  b3b7ec:	91366021 	add	x1, x1, #0xd98
  b3b7f0:	aa1703e0 	mov	x0, x23
  b3b7f4:	945f60ff 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3b7f8:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3b7fc:	9101e3f9 	add	x25, sp, #0x78
  b3b800:	f000d421 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3b804:	aa1903e0 	mov	x0, x25
  b3b808:	912e6021 	add	x1, x1, #0xb98
  b3b80c:	945fe135 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3b810:	910163fa 	add	x26, sp, #0x58
  b3b814:	aa1903e1 	mov	x1, x25
  b3b818:	aa1a03e8 	mov	x8, x26
  b3b81c:	aa1803e0 	mov	x0, x24
  b3b820:	945f609c 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3b824:	52800022 	mov	w2, #0x1                   	// #1
  b3b828:	52800001 	mov	w1, #0x0                   	// #0
  b3b82c:	aa1a03e0 	mov	x0, x26
  b3b830:	945b12ec 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3b834:	17ffffae 	b	b3b6ec <_ZSt20__throw_bad_weak_ptrv@@Base+0x230ad4>
  b3b838:	aa1403e0 	mov	x0, x20
  b3b83c:	97e3aa89 	bl	426260 <__cxa_guard_acquire@plt>
  b3b840:	34ffeba0 	cbz	w0, b3b5b4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23099c>
  b3b844:	a90363f7 	stp	x23, x24, [sp,#48]
  b3b848:	b0018097 	adrp	x23, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3b84c:	911c42f7 	add	x23, x23, #0x710
  b3b850:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3b854:	b90022ff 	str	wzr, [x23,#32]
  b3b858:	97e3a5de 	bl	424fd0 <malloc@plt>
  b3b85c:	f90006e0 	str	x0, [x23,#8]
  b3b860:	52801304 	mov	w4, #0x98                  	// #152
  b3b864:	52800ca3 	mov	w3, #0x65                  	// #101
  b3b868:	b90012e4 	str	w4, [x23,#16]
  b3b86c:	d2806502 	mov	x2, #0x328                 	// #808
  b3b870:	b9001ae3 	str	w3, [x23,#24]
  b3b874:	52800001 	mov	w1, #0x0                   	// #0
  b3b878:	97e3a35e 	bl	4245f0 <memset@plt>
  b3b87c:	b9002aff 	str	wzr, [x23,#40]
  b3b880:	aa1403e0 	mov	x0, x20
  b3b884:	97e3abef 	bl	426840 <__cxa_guard_release@plt>
  b3b888:	aa1703e1 	mov	x1, x23
  b3b88c:	f0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3b890:	b0ffe3a0 	adrp	x0, 7b0000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb7258>
  b3b894:	9135a042 	add	x2, x2, #0xd68
  b3b898:	91292000 	add	x0, x0, #0xa48
  b3b89c:	97e3ad85 	bl	426eb0 <__cxa_atexit@plt>
  b3b8a0:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3b8a4:	17ffff44 	b	b3b5b4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23099c>
  b3b8a8:	aa1403e0 	mov	x0, x20
  b3b8ac:	97e3aa6d 	bl	426260 <__cxa_guard_acquire@plt>
  b3b8b0:	34ffe860 	cbz	w0, b3b5bc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2309a4>
  b3b8b4:	a90363f7 	stp	x23, x24, [sp,#48]
  b3b8b8:	b0018097 	adrp	x23, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3b8bc:	911c42f7 	add	x23, x23, #0x710
  b3b8c0:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3b8c4:	b90022ff 	str	wzr, [x23,#32]
  b3b8c8:	97e3a5c2 	bl	424fd0 <malloc@plt>
  b3b8cc:	f90006e0 	str	x0, [x23,#8]
  b3b8d0:	52801304 	mov	w4, #0x98                  	// #152
  b3b8d4:	52800ca3 	mov	w3, #0x65                  	// #101
  b3b8d8:	b90012e4 	str	w4, [x23,#16]
  b3b8dc:	d2806502 	mov	x2, #0x328                 	// #808
  b3b8e0:	b9001ae3 	str	w3, [x23,#24]
  b3b8e4:	52800001 	mov	w1, #0x0                   	// #0
  b3b8e8:	97e3a342 	bl	4245f0 <memset@plt>
  b3b8ec:	b9002aff 	str	wzr, [x23,#40]
  b3b8f0:	aa1403e0 	mov	x0, x20
  b3b8f4:	97e3abd3 	bl	426840 <__cxa_guard_release@plt>
  b3b8f8:	aa1703e1 	mov	x1, x23
  b3b8fc:	f0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3b900:	b0ffe3a0 	adrp	x0, 7b0000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb7258>
  b3b904:	9135a042 	add	x2, x2, #0xd68
  b3b908:	91292000 	add	x0, x0, #0xa48
  b3b90c:	97e3ad69 	bl	426eb0 <__cxa_atexit@plt>
  b3b910:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3b914:	17ffff2a 	b	b3b5bc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2309a4>
  b3b918:	911c0000 	add	x0, x0, #0x700
  b3b91c:	97ed22d9 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3b920:	f900167f 	str	xzr, [x19,#40]
  b3b924:	17fffec8 	b	b3b444 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23082c>
  b3b928:	aa1603e0 	mov	x0, x22
  b3b92c:	d0018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3b930:	97e3aa4c 	bl	426260 <__cxa_guard_acquire@plt>
  b3b934:	91240294 	add	x20, x20, #0x900
  b3b938:	34ffd9e0 	cbz	w0, b3b474 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23085c>
  b3b93c:	b900229f 	str	wzr, [x20,#32]
  b3b940:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3b944:	97e3a5a3 	bl	424fd0 <malloc@plt>
  b3b948:	f9000680 	str	x0, [x20,#8]
  b3b94c:	52801304 	mov	w4, #0x98                  	// #152
  b3b950:	52800ca3 	mov	w3, #0x65                  	// #101
  b3b954:	b9001284 	str	w4, [x20,#16]
  b3b958:	d2806502 	mov	x2, #0x328                 	// #808
  b3b95c:	b9001a83 	str	w3, [x20,#24]
  b3b960:	52800001 	mov	w1, #0x0                   	// #0
  b3b964:	97e3a323 	bl	4245f0 <memset@plt>
  b3b968:	aa1603e0 	mov	x0, x22
  b3b96c:	97e3abb5 	bl	426840 <__cxa_guard_release@plt>
  b3b970:	aa1403e1 	mov	x1, x20
  b3b974:	f0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3b978:	90ffda00 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b3b97c:	9135a042 	add	x2, x2, #0xd68
  b3b980:	91126000 	add	x0, x0, #0x498
  b3b984:	97e3ad4b 	bl	426eb0 <__cxa_atexit@plt>
  b3b988:	17fffebb 	b	b3b474 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23085c>
  b3b98c:	aa1603e0 	mov	x0, x22
  b3b990:	97e3aa34 	bl	426260 <__cxa_guard_acquire@plt>
  b3b994:	34ffd960 	cbz	w0, b3b4c0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2308a8>
  b3b998:	a90363f7 	stp	x23, x24, [sp,#48]
  b3b99c:	b0018097 	adrp	x23, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3b9a0:	911b62f7 	add	x23, x23, #0x6d8
  b3b9a4:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3b9a8:	b90022ff 	str	wzr, [x23,#32]
  b3b9ac:	97e3a589 	bl	424fd0 <malloc@plt>
  b3b9b0:	f90006e0 	str	x0, [x23,#8]
  b3b9b4:	52801304 	mov	w4, #0x98                  	// #152
  b3b9b8:	52800ca3 	mov	w3, #0x65                  	// #101
  b3b9bc:	b90012e4 	str	w4, [x23,#16]
  b3b9c0:	d2806502 	mov	x2, #0x328                 	// #808
  b3b9c4:	b9001ae3 	str	w3, [x23,#24]
  b3b9c8:	52800001 	mov	w1, #0x0                   	// #0
  b3b9cc:	97e3a309 	bl	4245f0 <memset@plt>
  b3b9d0:	b9002aff 	str	wzr, [x23,#40]
  b3b9d4:	aa1603e0 	mov	x0, x22
  b3b9d8:	97e3ab9a 	bl	426840 <__cxa_guard_release@plt>
  b3b9dc:	aa1703e1 	mov	x1, x23
  b3b9e0:	f0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3b9e4:	b0ffe3c0 	adrp	x0, 7b4000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xbb258>
  b3b9e8:	9135a042 	add	x2, x2, #0xd68
  b3b9ec:	91278000 	add	x0, x0, #0x9e0
  b3b9f0:	97e3ad30 	bl	426eb0 <__cxa_atexit@plt>
  b3b9f4:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3b9f8:	17fffeb2 	b	b3b4c0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2308a8>
  b3b9fc:	aa1603e0 	mov	x0, x22
  b3ba00:	97e3aa18 	bl	426260 <__cxa_guard_acquire@plt>
  b3ba04:	34ffd620 	cbz	w0, b3b4c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2308b0>
  b3ba08:	a90363f7 	stp	x23, x24, [sp,#48]
  b3ba0c:	b0018097 	adrp	x23, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3ba10:	911b62f7 	add	x23, x23, #0x6d8
  b3ba14:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3ba18:	b90022ff 	str	wzr, [x23,#32]
  b3ba1c:	97e3a56d 	bl	424fd0 <malloc@plt>
  b3ba20:	f90006e0 	str	x0, [x23,#8]
  b3ba24:	52801304 	mov	w4, #0x98                  	// #152
  b3ba28:	52800ca3 	mov	w3, #0x65                  	// #101
  b3ba2c:	b90012e4 	str	w4, [x23,#16]
  b3ba30:	d2806502 	mov	x2, #0x328                 	// #808
  b3ba34:	b9001ae3 	str	w3, [x23,#24]
  b3ba38:	52800001 	mov	w1, #0x0                   	// #0
  b3ba3c:	97e3a2ed 	bl	4245f0 <memset@plt>
  b3ba40:	b9002aff 	str	wzr, [x23,#40]
  b3ba44:	aa1603e0 	mov	x0, x22
  b3ba48:	97e3ab7e 	bl	426840 <__cxa_guard_release@plt>
  b3ba4c:	aa1703e1 	mov	x1, x23
  b3ba50:	f0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3ba54:	b0ffe3c0 	adrp	x0, 7b4000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xbb258>
  b3ba58:	9135a042 	add	x2, x2, #0xd68
  b3ba5c:	91278000 	add	x0, x0, #0x9e0
  b3ba60:	97e3ad14 	bl	426eb0 <__cxa_atexit@plt>
  b3ba64:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3ba68:	17fffe98 	b	b3b4c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2308b0>
  b3ba6c:	f9000e7f 	str	xzr, [x19,#24]
  b3ba70:	17fffe75 	b	b3b444 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23082c>
  b3ba74:	aa0203e0 	mov	x0, x2
  b3ba78:	97ed2282 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3ba7c:	f900167f 	str	xzr, [x19,#40]
  b3ba80:	17fffe71 	b	b3b444 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23082c>
  b3ba84:	9101c3f6 	add	x22, sp, #0x70
  b3ba88:	d000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3ba8c:	aa1603e0 	mov	x0, x22
  b3ba90:	9136a021 	add	x1, x1, #0xda8
  b3ba94:	a90363f7 	stp	x23, x24, [sp,#48]
  b3ba98:	945fe092 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3ba9c:	9101a3f7 	add	x23, sp, #0x68
  b3baa0:	b000dec1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3baa4:	aa1603e0 	mov	x0, x22
  b3baa8:	aa1703e8 	mov	x8, x23
  b3baac:	911d4021 	add	x1, x1, #0x750
  b3bab0:	945f6050 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3bab4:	910183f8 	add	x24, sp, #0x60
  b3bab8:	9000e481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3babc:	aa1803e8 	mov	x8, x24
  b3bac0:	91366021 	add	x1, x1, #0xd98
  b3bac4:	aa1703e0 	mov	x0, x23
  b3bac8:	945f604a 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3bacc:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3bad0:	9101e3f9 	add	x25, sp, #0x78
  b3bad4:	f000d421 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3bad8:	aa1903e0 	mov	x0, x25
  b3badc:	912e4021 	add	x1, x1, #0xb90
  b3bae0:	945fe080 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3bae4:	910163fa 	add	x26, sp, #0x58
  b3bae8:	aa1903e1 	mov	x1, x25
  b3baec:	aa1a03e8 	mov	x8, x26
  b3baf0:	aa1803e0 	mov	x0, x24
  b3baf4:	945f5fe7 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3baf8:	52800022 	mov	w2, #0x1                   	// #1
  b3bafc:	52800001 	mov	w1, #0x0                   	// #0
  b3bb00:	aa1a03e0 	mov	x0, x26
  b3bb04:	945b1237 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3bb08:	aa1a03e0 	mov	x0, x26
  b3bb0c:	945f02bd 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bb10:	aa1903e0 	mov	x0, x25
  b3bb14:	945f02bb 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bb18:	aa1803e0 	mov	x0, x24
  b3bb1c:	945f02b9 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bb20:	aa1703e0 	mov	x0, x23
  b3bb24:	945f02b7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bb28:	aa1603e0 	mov	x0, x22
  b3bb2c:	945f02b5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bb30:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3bb34:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3bb38:	17fffec5 	b	b3b64c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230a34>
  b3bb3c:	aa0003f3 	mov	x19, x0
  b3bb40:	aa1a03e0 	mov	x0, x26
  b3bb44:	945f02af 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bb48:	aa1903e0 	mov	x0, x25
  b3bb4c:	945f02ad 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bb50:	aa1803e0 	mov	x0, x24
  b3bb54:	945f02ab 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bb58:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3bb5c:	aa1703e0 	mov	x0, x23
  b3bb60:	945f02a8 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bb64:	aa1603e0 	mov	x0, x22
  b3bb68:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3bb6c:	945f02a5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bb70:	aa1303e0 	mov	x0, x19
  b3bb74:	97e3a467 	bl	424d10 <_Unwind_Resume@plt>
  b3bb78:	aa1a03e0 	mov	x0, x26
  b3bb7c:	945f02a1 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bb80:	aa1903e0 	mov	x0, x25
  b3bb84:	945f029f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bb88:	aa1803e0 	mov	x0, x24
  b3bb8c:	945f029d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bb90:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3bb94:	aa1703e0 	mov	x0, x23
  b3bb98:	945f029a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bb9c:	aa1603e0 	mov	x0, x22
  b3bba0:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3bba4:	945f0297 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3bba8:	97e3aeee 	bl	427760 <_ZSt9terminatev@plt>
  b3bbac:	17fffff5 	b	b3bb80 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230f68>
  b3bbb0:	17fffff6 	b	b3bb88 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230f70>
  b3bbb4:	17fffff8 	b	b3bb94 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230f7c>
  b3bbb8:	17fffff9 	b	b3bb9c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230f84>
  b3bbbc:	aa0003f3 	mov	x19, x0
  b3bbc0:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3bbc4:	f9403fe0 	ldr	x0, [sp,#120]
  b3bbc8:	97e3a3ca 	bl	424af0 <free@plt>
  b3bbcc:	aa1303e0 	mov	x0, x19
  b3bbd0:	97e3a450 	bl	424d10 <_Unwind_Resume@plt>
  b3bbd4:	aa0003f3 	mov	x19, x0
  b3bbd8:	17ffffe3 	b	b3bb64 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230f4c>
  b3bbdc:	17ffffd8 	b	b3bb3c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230f24>
  b3bbe0:	aa0003f3 	mov	x19, x0
  b3bbe4:	17ffffd9 	b	b3bb48 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230f30>
  b3bbe8:	aa0003f3 	mov	x19, x0
  b3bbec:	17ffffd9 	b	b3bb50 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230f38>
  b3bbf0:	aa0003f3 	mov	x19, x0
  b3bbf4:	17ffffda 	b	b3bb5c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230f44>
  b3bbf8:	aa0003f3 	mov	x19, x0
  b3bbfc:	17ffffda 	b	b3bb64 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230f4c>
  b3bc00:	aa0003f3 	mov	x19, x0
  b3bc04:	17ffffd3 	b	b3bb50 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230f38>
  b3bc08:	aa0003f3 	mov	x19, x0
  b3bc0c:	17ffffd4 	b	b3bb5c <_ZSt20__throw_bad_weak_ptrv@@Base+0x230f44>
  b3bc10:	aa0003f3 	mov	x19, x0
  b3bc14:	17ffffcd 	b	b3bb48 <_ZSt20__throw_bad_weak_ptrv@@Base+0x230f30>
  b3bc18:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
  b3bc1c:	910003fd 	mov	x29, sp
  b3bc20:	a90153f3 	stp	x19, x20, [sp,#16]
  b3bc24:	aa0003f3 	mov	x19, x0
  b3bc28:	f9400c00 	ldr	x0, [x0,#24]
  b3bc2c:	a9025bf5 	stp	x21, x22, [sp,#32]
  b3bc30:	aa0103f5 	mov	x21, x1
  b3bc34:	a90573fb 	stp	x27, x28, [sp,#80]
  b3bc38:	12001c76 	and	w22, w3, #0xff
  b3bc3c:	aa0203fc 	mov	x28, x2
  b3bc40:	b4000660 	cbz	x0, b3bd0c <_ZSt20__throw_bad_weak_ptrv@@Base+0x2310f4>
  b3bc44:	f9401660 	ldr	x0, [x19,#40]
  b3bc48:	b4000700 	cbz	x0, b3bd28 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231110>
  b3bc4c:	a90363f7 	stp	x23, x24, [sp,#48]
  b3bc50:	b9408261 	ldr	w1, [x19,#128]
  b3bc54:	52800040 	mov	w0, #0x2                   	// #2
  b3bc58:	b9005a60 	str	w0, [x19,#88]
  b3bc5c:	910223f7 	add	x23, sp, #0x88
  b3bc60:	91006274 	add	x20, x19, #0x18
  b3bc64:	aa1703e0 	mov	x0, x23
  b3bc68:	941f8fda 	bl	131fbd0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x54bec8>
  b3bc6c:	aa1703e0 	mov	x0, x23
  b3bc70:	941f9036 	bl	131fd48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x54c040>
  b3bc74:	72001c1f 	tst	w0, #0xff
  b3bc78:	54001b40 	b.eq	b3bfe0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2313c8>
  b3bc7c:	f94002a0 	ldr	x0, [x21]
  b3bc80:	91020276 	add	x22, x19, #0x80
  b3bc84:	39400000 	ldrb	w0, [x0]
  b3bc88:	35000d40 	cbnz	w0, b3be30 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231218>
  b3bc8c:	aa1403e0 	mov	x0, x20
  b3bc90:	52800021 	mov	w1, #0x1                   	// #1
  b3bc94:	97f7d71d 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3bc98:	f9400e63 	ldr	x3, [x19,#24]
  b3bc9c:	aa1603e1 	mov	x1, x22
  b3bca0:	39422262 	ldrb	w2, [x19,#136]
  b3bca4:	aa0303e0 	mov	x0, x3
  b3bca8:	f9400063 	ldr	x3, [x3]
  b3bcac:	f9401463 	ldr	x3, [x3,#40]
  b3bcb0:	d63f0060 	blr	x3
  b3bcb4:	f9400674 	ldr	x20, [x19,#8]
  b3bcb8:	b4001ad4 	cbz	x20, b3c010 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2313f8>
  b3bcbc:	f9400282 	ldr	x2, [x20]
  b3bcc0:	aa1603e1 	mov	x1, x22
  b3bcc4:	aa1403e0 	mov	x0, x20
  b3bcc8:	f9404042 	ldr	x2, [x2,#128]
  b3bccc:	d63f0040 	blr	x2
  b3bcd0:	d360bc02 	ubfx	x2, x0, #32, #16
  b3bcd4:	f9403e61 	ldr	x1, [x19,#120]
  b3bcd8:	79010a62 	strh	w2, [x19,#132]
  b3bcdc:	f9400022 	ldr	x2, [x1]
  b3bce0:	f9401042 	ldr	x2, [x2,#32]
  b3bce4:	b9008260 	str	w0, [x19,#128]
  b3bce8:	aa0103e0 	mov	x0, x1
  b3bcec:	f9404261 	ldr	x1, [x19,#128]
  b3bcf0:	d63f0040 	blr	x2
  b3bcf4:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3bcf8:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3bcfc:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3bd00:	a94573fb 	ldp	x27, x28, [sp,#80]
  b3bd04:	a8c97bfd 	ldp	x29, x30, [sp],#144
  b3bd08:	d65f03c0 	ret
  b3bd0c:	f9401260 	ldr	x0, [x19,#32]
  b3bd10:	b5000d80 	cbnz	x0, b3bec0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2312a8>
  b3bd14:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3bd18:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3bd1c:	a94573fb 	ldp	x27, x28, [sp,#80]
  b3bd20:	a8c97bfd 	ldp	x29, x30, [sp],#144
  b3bd24:	d65f03c0 	ret
  b3bd28:	f9401a60 	ldr	x0, [x19,#48]
  b3bd2c:	b4ffff40 	cbz	x0, b3bd14 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2310fc>
  b3bd30:	d0018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3bd34:	9123e294 	add	x20, x20, #0x8f8
  b3bd38:	a90363f7 	stp	x23, x24, [sp,#48]
  b3bd3c:	08dffe80 	ldarb	w0, [x20]
  b3bd40:	36003360 	tbz	w0, #0, b3c3ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x231794>
  b3bd44:	d0018038 	adrp	x24, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3bd48:	91240318 	add	x24, x24, #0x900
  b3bd4c:	b9801b01 	ldrsw	x1, [x24,#24]
  b3bd50:	f9401a62 	ldr	x2, [x19,#48]
  b3bd54:	f9400703 	ldr	x3, [x24,#8]
  b3bd58:	9ac10840 	udiv	x0, x2, x1
  b3bd5c:	9b018800 	msub	x0, x0, x1, x2
  b3bd60:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b3bd64:	b5000080 	cbnz	x0, b3bd74 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23115c>
  b3bd68:	14000136 	b	b3c240 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231628>
  b3bd6c:	f9400800 	ldr	x0, [x0,#16]
  b3bd70:	b4002680 	cbz	x0, b3c240 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231628>
  b3bd74:	f9400001 	ldr	x1, [x0]
  b3bd78:	eb01005f 	cmp	x2, x1
  b3bd7c:	54ffff81 	b.ne	b3bd6c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231154>
  b3bd80:	f9400417 	ldr	x23, [x0,#8]
  b3bd84:	b40025f7 	cbz	x23, b3c240 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231628>
  b3bd88:	b0018094 	adrp	x20, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3bd8c:	911b4294 	add	x20, x20, #0x6d0
  b3bd90:	08dffe80 	ldarb	w0, [x20]
  b3bd94:	360033e0 	tbz	w0, #0, b3c410 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2317f8>
  b3bd98:	08dffe80 	ldarb	w0, [x20]
  b3bd9c:	360036e0 	tbz	w0, #0, b3c478 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231860>
  b3bda0:	b0018080 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3bda4:	911c0002 	add	x2, x0, #0x700
  b3bda8:	88dffc41 	ldar	w1, [x2]
  b3bdac:	37f82fa1 	tbnz	w1, #31, b3c3a0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231788>
  b3bdb0:	11000423 	add	w3, w1, #0x1
  b3bdb4:	885ffc44 	ldaxr	w4, [x2]
  b3bdb8:	6b01009f 	cmp	w4, w1
  b3bdbc:	54000061 	b.ne	b3bdc8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2311b0>
  b3bdc0:	8805fc43 	stlxr	w5, w3, [x2]
  b3bdc4:	35ffff85 	cbnz	w5, b3bdb4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23119c>
  b3bdc8:	54ffff01 	b.ne	b3bda8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231190>
  b3bdcc:	b0018081 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3bdd0:	911b6021 	add	x1, x1, #0x6d8
  b3bdd4:	b9801823 	ldrsw	x3, [x1,#24]
  b3bdd8:	f9400424 	ldr	x4, [x1,#8]
  b3bddc:	9ac30ae1 	udiv	x1, x23, x3
  b3bde0:	9b03dc21 	msub	x1, x1, x3, x23
  b3bde4:	f861d881 	ldr	x1, [x4,w1,sxtw #3]
  b3bde8:	b5000081 	cbnz	x1, b3bdf8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2311e0>
  b3bdec:	14000240 	b	b3c6ec <_ZSt20__throw_bad_weak_ptrv@@Base+0x231ad4>
  b3bdf0:	f9400821 	ldr	x1, [x1,#16]
  b3bdf4:	b4002d21 	cbz	x1, b3c398 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231780>
  b3bdf8:	f9400022 	ldr	x2, [x1]
  b3bdfc:	eb0202ff 	cmp	x23, x2
  b3be00:	54ffff81 	b.ne	b3bdf0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2311d8>
  b3be04:	f9400434 	ldr	x20, [x1,#8]
  b3be08:	911c0000 	add	x0, x0, #0x700
  b3be0c:	97ed219d 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3be10:	f9001674 	str	x20, [x19,#40]
  b3be14:	b5fff1f4 	cbnz	x20, b3bc50 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231038>
  b3be18:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3be1c:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3be20:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3be24:	a94573fb 	ldp	x27, x28, [sp,#80]
  b3be28:	a8c97bfd 	ldp	x29, x30, [sp],#144
  b3be2c:	d65f03c0 	ret
  b3be30:	52800021 	mov	w1, #0x1                   	// #1
  b3be34:	9100a260 	add	x0, x19, #0x28
  b3be38:	97fc45f0 	bl	a4d5f8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1429e0>
  b3be3c:	f9401662 	ldr	x2, [x19,#40]
  b3be40:	aa1c03e1 	mov	x1, x28
  b3be44:	aa0203e0 	mov	x0, x2
  b3be48:	f9400042 	ldr	x2, [x2]
  b3be4c:	f9401842 	ldr	x2, [x2,#48]
  b3be50:	d63f0040 	blr	x2
  b3be54:	2a0003f8 	mov	w24, w0
  b3be58:	71001c1f 	cmp	w0, #0x7
  b3be5c:	54fffde0 	b.eq	b3be18 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231200>
  b3be60:	52800021 	mov	w1, #0x1                   	// #1
  b3be64:	aa1403e0 	mov	x0, x20
  b3be68:	97f7d6a8 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3be6c:	91020276 	add	x22, x19, #0x80
  b3be70:	f9400e64 	ldr	x4, [x19,#24]
  b3be74:	2a1803e2 	mov	w2, w24
  b3be78:	39422263 	ldrb	w3, [x19,#136]
  b3be7c:	aa1603e1 	mov	x1, x22
  b3be80:	aa0403e0 	mov	x0, x4
  b3be84:	f9400084 	ldr	x4, [x4]
  b3be88:	f9404884 	ldr	x4, [x4,#144]
  b3be8c:	d63f0080 	blr	x4
  b3be90:	52800021 	mov	w1, #0x1                   	// #1
  b3be94:	aa1403e0 	mov	x0, x20
  b3be98:	97f7d69c 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3be9c:	f9400e64 	ldr	x4, [x19,#24]
  b3bea0:	aa1503e2 	mov	x2, x21
  b3bea4:	39422263 	ldrb	w3, [x19,#136]
  b3bea8:	aa1603e1 	mov	x1, x22
  b3beac:	aa0403e0 	mov	x0, x4
  b3beb0:	f9400084 	ldr	x4, [x4]
  b3beb4:	f9404c84 	ldr	x4, [x4,#152]
  b3beb8:	d63f0080 	blr	x4
  b3bebc:	17ffff74 	b	b3bc8c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231074>
  b3bec0:	d0018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3bec4:	9123e294 	add	x20, x20, #0x8f8
  b3bec8:	a90363f7 	stp	x23, x24, [sp,#48]
  b3becc:	08dffe80 	ldarb	w0, [x20]
  b3bed0:	36001860 	tbz	w0, #0, b3c1dc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2315c4>
  b3bed4:	d0018038 	adrp	x24, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3bed8:	91240318 	add	x24, x24, #0x900
  b3bedc:	b9801b01 	ldrsw	x1, [x24,#24]
  b3bee0:	f9401262 	ldr	x2, [x19,#32]
  b3bee4:	f9400703 	ldr	x3, [x24,#8]
  b3bee8:	9ac10840 	udiv	x0, x2, x1
  b3beec:	9b018800 	msub	x0, x0, x1, x2
  b3bef0:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b3bef4:	b5000080 	cbnz	x0, b3bf04 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2312ec>
  b3bef8:	1400008b 	b	b3c124 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23150c>
  b3befc:	f9400800 	ldr	x0, [x0,#16]
  b3bf00:	b4001120 	cbz	x0, b3c124 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23150c>
  b3bf04:	f9400001 	ldr	x1, [x0]
  b3bf08:	eb01005f 	cmp	x2, x1
  b3bf0c:	54ffff81 	b.ne	b3befc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2312e4>
  b3bf10:	f9400417 	ldr	x23, [x0,#8]
  b3bf14:	b4001097 	cbz	x23, b3c124 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23150c>
  b3bf18:	b0018094 	adrp	x20, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3bf1c:	911c2294 	add	x20, x20, #0x708
  b3bf20:	08dffe80 	ldarb	w0, [x20]
  b3bf24:	36001d20 	tbz	w0, #0, b3c2c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2316b0>
  b3bf28:	08dffe80 	ldarb	w0, [x20]
  b3bf2c:	36002020 	tbz	w0, #0, b3c330 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231718>
  b3bf30:	b0018081 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3bf34:	911ce021 	add	x1, x1, #0x738
  b3bf38:	88dffc20 	ldar	w0, [x1]
  b3bf3c:	37f83d20 	tbnz	w0, #31, b3c6e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231ac8>
  b3bf40:	11000402 	add	w2, w0, #0x1
  b3bf44:	885ffc23 	ldaxr	w3, [x1]
  b3bf48:	6b00007f 	cmp	w3, w0
  b3bf4c:	54000061 	b.ne	b3bf58 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231340>
  b3bf50:	8804fc22 	stlxr	w4, w2, [x1]
  b3bf54:	35ffff84 	cbnz	w4, b3bf44 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23132c>
  b3bf58:	54ffff01 	b.ne	b3bf38 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231320>
  b3bf5c:	b0018080 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3bf60:	911c4000 	add	x0, x0, #0x710
  b3bf64:	b9801802 	ldrsw	x2, [x0,#24]
  b3bf68:	f9400403 	ldr	x3, [x0,#8]
  b3bf6c:	9ac20ae0 	udiv	x0, x23, x2
  b3bf70:	9b02dc00 	msub	x0, x0, x2, x23
  b3bf74:	f860d874 	ldr	x20, [x3,w0,sxtw #3]
  b3bf78:	b5000094 	cbnz	x20, b3bf88 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231370>
  b3bf7c:	14000007 	b	b3bf98 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231380>
  b3bf80:	f9400a94 	ldr	x20, [x20,#16]
  b3bf84:	b40000b4 	cbz	x20, b3bf98 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231380>
  b3bf88:	f9400280 	ldr	x0, [x20]
  b3bf8c:	eb0002ff 	cmp	x23, x0
  b3bf90:	54ffff81 	b.ne	b3bf80 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231368>
  b3bf94:	f9400694 	ldr	x20, [x20,#8]
  b3bf98:	88dffc20 	ldar	w0, [x1]
  b3bf9c:	7100001f 	cmp	w0, #0x0
  b3bfa0:	54003b0d 	b.le	b3c700 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231ae8>
  b3bfa4:	51000402 	sub	w2, w0, #0x1
  b3bfa8:	885ffc23 	ldaxr	w3, [x1]
  b3bfac:	6b00007f 	cmp	w3, w0
  b3bfb0:	54000061 	b.ne	b3bfbc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2313a4>
  b3bfb4:	8804fc22 	stlxr	w4, w2, [x1]
  b3bfb8:	35ffff84 	cbnz	w4, b3bfa8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231390>
  b3bfbc:	54fffee1 	b.ne	b3bf98 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231380>
  b3bfc0:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3bfc4:	f9000e74 	str	x20, [x19,#24]
  b3bfc8:	b5ffe3f4 	cbnz	x20, b3bc44 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23102c>
  b3bfcc:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3bfd0:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3bfd4:	a94573fb 	ldp	x27, x28, [sp,#80]
  b3bfd8:	a8c97bfd 	ldp	x29, x30, [sp],#144
  b3bfdc:	d65f03c0 	ret
  b3bfe0:	52800021 	mov	w1, #0x1                   	// #1
  b3bfe4:	aa1403e0 	mov	x0, x20
  b3bfe8:	97f7d648 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3bfec:	f9400e64 	ldr	x4, [x19,#24]
  b3bff0:	2a1603e2 	mov	w2, w22
  b3bff4:	39422263 	ldrb	w3, [x19,#136]
  b3bff8:	91020261 	add	x1, x19, #0x80
  b3bffc:	aa0403e0 	mov	x0, x4
  b3c000:	f9400084 	ldr	x4, [x4]
  b3c004:	f9403884 	ldr	x4, [x4,#112]
  b3c008:	d63f0080 	blr	x4
  b3c00c:	17ffff1c 	b	b3bc7c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231064>
  b3c010:	f9400a60 	ldr	x0, [x19,#16]
  b3c014:	b4ffe540 	cbz	x0, b3bcbc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2310a4>
  b3c018:	b0018035 	adrp	x21, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3c01c:	9123e2b5 	add	x21, x21, #0x8f8
  b3c020:	08dffea0 	ldarb	w0, [x21]
  b3c024:	36002bc0 	tbz	w0, #0, b3c59c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231984>
  b3c028:	b0018038 	adrp	x24, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3c02c:	91240318 	add	x24, x24, #0x900
  b3c030:	b9801b01 	ldrsw	x1, [x24,#24]
  b3c034:	f9400a62 	ldr	x2, [x19,#16]
  b3c038:	f9400703 	ldr	x3, [x24,#8]
  b3c03c:	9ac10840 	udiv	x0, x2, x1
  b3c040:	9b018800 	msub	x0, x0, x1, x2
  b3c044:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b3c048:	b5000080 	cbnz	x0, b3c058 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231440>
  b3c04c:	14000125 	b	b3c4e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2318c8>
  b3c050:	f9400800 	ldr	x0, [x0,#16]
  b3c054:	b4002460 	cbz	x0, b3c4e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2318c8>
  b3c058:	f9400001 	ldr	x1, [x0]
  b3c05c:	eb01005f 	cmp	x2, x1
  b3c060:	54ffff81 	b.ne	b3c050 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231438>
  b3c064:	f9400415 	ldr	x21, [x0,#8]
  b3c068:	b40023d5 	cbz	x21, b3c4e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2318c8>
  b3c06c:	b0018078 	adrp	x24, 3b49000 <stdout@@GLIBC_2.17+0x7f40>
  b3c070:	91248318 	add	x24, x24, #0x920
  b3c074:	08dfff00 	ldarb	w0, [x24]
  b3c078:	36002c40 	tbz	w0, #0, b3c600 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2319e8>
  b3c07c:	08dfff00 	ldarb	w0, [x24]
  b3c080:	36002f80 	tbz	w0, #0, b3c670 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231a58>
  b3c084:	b0018061 	adrp	x1, 3b49000 <stdout@@GLIBC_2.17+0x7f40>
  b3c088:	91254021 	add	x1, x1, #0x950
  b3c08c:	88dffc20 	ldar	w0, [x1]
  b3c090:	37f80460 	tbnz	w0, #31, b3c11c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231504>
  b3c094:	11000402 	add	w2, w0, #0x1
  b3c098:	885ffc23 	ldaxr	w3, [x1]
  b3c09c:	6b00007f 	cmp	w3, w0
  b3c0a0:	54000061 	b.ne	b3c0ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x231494>
  b3c0a4:	8804fc22 	stlxr	w4, w2, [x1]
  b3c0a8:	35ffff84 	cbnz	w4, b3c098 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231480>
  b3c0ac:	54ffff01 	b.ne	b3c08c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231474>
  b3c0b0:	b0018060 	adrp	x0, 3b49000 <stdout@@GLIBC_2.17+0x7f40>
  b3c0b4:	9124a000 	add	x0, x0, #0x928
  b3c0b8:	b9801802 	ldrsw	x2, [x0,#24]
  b3c0bc:	f9400403 	ldr	x3, [x0,#8]
  b3c0c0:	9ac20aa0 	udiv	x0, x21, x2
  b3c0c4:	9b02d400 	msub	x0, x0, x2, x21
  b3c0c8:	f860d874 	ldr	x20, [x3,w0,sxtw #3]
  b3c0cc:	b4000154 	cbz	x20, b3c0f4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2314dc>
  b3c0d0:	f9400280 	ldr	x0, [x20]
  b3c0d4:	eb15001f 	cmp	x0, x21
  b3c0d8:	540000a1 	b.ne	b3c0ec <_ZSt20__throw_bad_weak_ptrv@@Base+0x2314d4>
  b3c0dc:	1400012e 	b	b3c594 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23197c>
  b3c0e0:	f9400280 	ldr	x0, [x20]
  b3c0e4:	eb0002bf 	cmp	x21, x0
  b3c0e8:	54002560 	b.eq	b3c594 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23197c>
  b3c0ec:	f9400a94 	ldr	x20, [x20,#16]
  b3c0f0:	b5ffff94 	cbnz	x20, b3c0e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2314c8>
  b3c0f4:	88dffc20 	ldar	w0, [x1]
  b3c0f8:	7100001f 	cmp	w0, #0x0
  b3c0fc:	540035ad 	b.le	b3c7b0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231b98>
  b3c100:	51000402 	sub	w2, w0, #0x1
  b3c104:	885ffc23 	ldaxr	w3, [x1]
  b3c108:	6b00007f 	cmp	w3, w0
  b3c10c:	54000061 	b.ne	b3c118 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231500>
  b3c110:	8804fc22 	stlxr	w4, w2, [x1]
  b3c114:	35ffff84 	cbnz	w4, b3c104 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2314ec>
  b3c118:	54fffee1 	b.ne	b3c0f4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2314dc>
  b3c11c:	f9000674 	str	x20, [x19,#8]
  b3c120:	17fffee7 	b	b3bcbc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2310a4>
  b3c124:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3c128:	910203fa 	add	x26, sp, #0x80
  b3c12c:	aa1a03e0 	mov	x0, x26
  b3c130:	b000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3c134:	9136a021 	add	x1, x1, #0xda8
  b3c138:	945fdeea 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3c13c:	9101e3f9 	add	x25, sp, #0x78
  b3c140:	9000dec1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3c144:	911d4021 	add	x1, x1, #0x750
  b3c148:	9100a021 	add	x1, x1, #0x28
  b3c14c:	aa1a03e0 	mov	x0, x26
  b3c150:	aa1903e8 	mov	x8, x25
  b3c154:	945f5ea7 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3c158:	9101c3f8 	add	x24, sp, #0x70
  b3c15c:	f000e461 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3c160:	aa1803e8 	mov	x8, x24
  b3c164:	91366021 	add	x1, x1, #0xd98
  b3c168:	aa1903e0 	mov	x0, x25
  b3c16c:	945f5ea1 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3c170:	910223f7 	add	x23, sp, #0x88
  b3c174:	d000d421 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3c178:	aa1703e0 	mov	x0, x23
  b3c17c:	912e6021 	add	x1, x1, #0xb98
  b3c180:	945fded8 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3c184:	9101a3fb 	add	x27, sp, #0x68
  b3c188:	aa1703e1 	mov	x1, x23
  b3c18c:	aa1b03e8 	mov	x8, x27
  b3c190:	aa1803e0 	mov	x0, x24
  b3c194:	945f5e3f 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3c198:	52800022 	mov	w2, #0x1                   	// #1
  b3c19c:	52800001 	mov	w1, #0x0                   	// #0
  b3c1a0:	aa1b03e0 	mov	x0, x27
  b3c1a4:	945b108f 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3c1a8:	aa1b03e0 	mov	x0, x27
  b3c1ac:	945f0115 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c1b0:	aa1703e0 	mov	x0, x23
  b3c1b4:	945f0113 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c1b8:	aa1803e0 	mov	x0, x24
  b3c1bc:	945f0111 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c1c0:	aa1903e0 	mov	x0, x25
  b3c1c4:	945f010f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c1c8:	aa1a03e0 	mov	x0, x26
  b3c1cc:	945f010d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c1d0:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3c1d4:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3c1d8:	17fffecf 	b	b3bd14 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2310fc>
  b3c1dc:	aa1403e0 	mov	x0, x20
  b3c1e0:	b0018038 	adrp	x24, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3c1e4:	97e3a81f 	bl	426260 <__cxa_guard_acquire@plt>
  b3c1e8:	91240318 	add	x24, x24, #0x900
  b3c1ec:	34ffe780 	cbz	w0, b3bedc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2312c4>
  b3c1f0:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3c1f4:	b900231f 	str	wzr, [x24,#32]
  b3c1f8:	97e3a376 	bl	424fd0 <malloc@plt>
  b3c1fc:	f9000700 	str	x0, [x24,#8]
  b3c200:	52801304 	mov	w4, #0x98                  	// #152
  b3c204:	52800ca3 	mov	w3, #0x65                  	// #101
  b3c208:	b9001304 	str	w4, [x24,#16]
  b3c20c:	d2806502 	mov	x2, #0x328                 	// #808
  b3c210:	b9001b03 	str	w3, [x24,#24]
  b3c214:	52800001 	mov	w1, #0x0                   	// #0
  b3c218:	97e3a0f6 	bl	4245f0 <memset@plt>
  b3c21c:	aa1403e0 	mov	x0, x20
  b3c220:	97e3a988 	bl	426840 <__cxa_guard_release@plt>
  b3c224:	aa1803e1 	mov	x1, x24
  b3c228:	d0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3c22c:	f0ffd9e0 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b3c230:	9135a042 	add	x2, x2, #0xd68
  b3c234:	91126000 	add	x0, x0, #0x498
  b3c238:	97e3ab1e 	bl	426eb0 <__cxa_atexit@plt>
  b3c23c:	17ffff28 	b	b3bedc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2312c4>
  b3c240:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3c244:	910203fa 	add	x26, sp, #0x80
  b3c248:	aa1a03e0 	mov	x0, x26
  b3c24c:	b000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3c250:	9136a021 	add	x1, x1, #0xda8
  b3c254:	945fdea3 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3c258:	9101e3f9 	add	x25, sp, #0x78
  b3c25c:	9000dec1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3c260:	911d4021 	add	x1, x1, #0x750
  b3c264:	91040021 	add	x1, x1, #0x100
  b3c268:	aa1a03e0 	mov	x0, x26
  b3c26c:	aa1903e8 	mov	x8, x25
  b3c270:	945f5e60 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3c274:	9101c3f8 	add	x24, sp, #0x70
  b3c278:	f000e461 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3c27c:	aa1803e8 	mov	x8, x24
  b3c280:	91366021 	add	x1, x1, #0xd98
  b3c284:	aa1903e0 	mov	x0, x25
  b3c288:	945f5e5a 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3c28c:	910223f7 	add	x23, sp, #0x88
  b3c290:	d000d421 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3c294:	aa1703e0 	mov	x0, x23
  b3c298:	912e6021 	add	x1, x1, #0xb98
  b3c29c:	945fde91 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3c2a0:	9101a3fb 	add	x27, sp, #0x68
  b3c2a4:	aa1703e1 	mov	x1, x23
  b3c2a8:	aa1b03e8 	mov	x8, x27
  b3c2ac:	aa1803e0 	mov	x0, x24
  b3c2b0:	945f5df8 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3c2b4:	52800022 	mov	w2, #0x1                   	// #1
  b3c2b8:	52800001 	mov	w1, #0x0                   	// #0
  b3c2bc:	aa1b03e0 	mov	x0, x27
  b3c2c0:	945b1048 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3c2c4:	17ffffb9 	b	b3c1a8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231590>
  b3c2c8:	aa1403e0 	mov	x0, x20
  b3c2cc:	97e3a7e5 	bl	426260 <__cxa_guard_acquire@plt>
  b3c2d0:	34ffe2c0 	cbz	w0, b3bf28 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231310>
  b3c2d4:	90018098 	adrp	x24, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3c2d8:	911c4318 	add	x24, x24, #0x710
  b3c2dc:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3c2e0:	b900231f 	str	wzr, [x24,#32]
  b3c2e4:	97e3a33b 	bl	424fd0 <malloc@plt>
  b3c2e8:	f9000700 	str	x0, [x24,#8]
  b3c2ec:	52801304 	mov	w4, #0x98                  	// #152
  b3c2f0:	52800ca3 	mov	w3, #0x65                  	// #101
  b3c2f4:	b9001304 	str	w4, [x24,#16]
  b3c2f8:	d2806502 	mov	x2, #0x328                 	// #808
  b3c2fc:	b9001b03 	str	w3, [x24,#24]
  b3c300:	52800001 	mov	w1, #0x0                   	// #0
  b3c304:	97e3a0bb 	bl	4245f0 <memset@plt>
  b3c308:	b9002b1f 	str	wzr, [x24,#40]
  b3c30c:	aa1403e0 	mov	x0, x20
  b3c310:	97e3a94c 	bl	426840 <__cxa_guard_release@plt>
  b3c314:	d0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3c318:	aa1803e1 	mov	x1, x24
  b3c31c:	9135a042 	add	x2, x2, #0xd68
  b3c320:	90ffe3a0 	adrp	x0, 7b0000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb7258>
  b3c324:	91292000 	add	x0, x0, #0xa48
  b3c328:	97e3aae2 	bl	426eb0 <__cxa_atexit@plt>
  b3c32c:	17fffeff 	b	b3bf28 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231310>
  b3c330:	aa1403e0 	mov	x0, x20
  b3c334:	97e3a7cb 	bl	426260 <__cxa_guard_acquire@plt>
  b3c338:	34ffdfc0 	cbz	w0, b3bf30 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231318>
  b3c33c:	90018098 	adrp	x24, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3c340:	911c4318 	add	x24, x24, #0x710
  b3c344:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3c348:	b900231f 	str	wzr, [x24,#32]
  b3c34c:	97e3a321 	bl	424fd0 <malloc@plt>
  b3c350:	f9000700 	str	x0, [x24,#8]
  b3c354:	52801304 	mov	w4, #0x98                  	// #152
  b3c358:	52800ca3 	mov	w3, #0x65                  	// #101
  b3c35c:	b9001304 	str	w4, [x24,#16]
  b3c360:	d2806502 	mov	x2, #0x328                 	// #808
  b3c364:	b9001b03 	str	w3, [x24,#24]
  b3c368:	52800001 	mov	w1, #0x0                   	// #0
  b3c36c:	97e3a0a1 	bl	4245f0 <memset@plt>
  b3c370:	b9002b1f 	str	wzr, [x24,#40]
  b3c374:	aa1403e0 	mov	x0, x20
  b3c378:	97e3a932 	bl	426840 <__cxa_guard_release@plt>
  b3c37c:	d0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3c380:	aa1803e1 	mov	x1, x24
  b3c384:	9135a042 	add	x2, x2, #0xd68
  b3c388:	90ffe3a0 	adrp	x0, 7b0000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb7258>
  b3c38c:	91292000 	add	x0, x0, #0xa48
  b3c390:	97e3aac8 	bl	426eb0 <__cxa_atexit@plt>
  b3c394:	17fffee7 	b	b3bf30 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231318>
  b3c398:	911c0000 	add	x0, x0, #0x700
  b3c39c:	97ed2039 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3c3a0:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3c3a4:	f900167f 	str	xzr, [x19,#40]
  b3c3a8:	17fffe5b 	b	b3bd14 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2310fc>
  b3c3ac:	aa1403e0 	mov	x0, x20
  b3c3b0:	b0018038 	adrp	x24, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3c3b4:	97e3a7ab 	bl	426260 <__cxa_guard_acquire@plt>
  b3c3b8:	91240318 	add	x24, x24, #0x900
  b3c3bc:	34ffcc80 	cbz	w0, b3bd4c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231134>
  b3c3c0:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3c3c4:	b900231f 	str	wzr, [x24,#32]
  b3c3c8:	97e3a302 	bl	424fd0 <malloc@plt>
  b3c3cc:	f9000700 	str	x0, [x24,#8]
  b3c3d0:	52801304 	mov	w4, #0x98                  	// #152
  b3c3d4:	52800ca3 	mov	w3, #0x65                  	// #101
  b3c3d8:	b9001304 	str	w4, [x24,#16]
  b3c3dc:	d2806502 	mov	x2, #0x328                 	// #808
  b3c3e0:	b9001b03 	str	w3, [x24,#24]
  b3c3e4:	52800001 	mov	w1, #0x0                   	// #0
  b3c3e8:	97e3a082 	bl	4245f0 <memset@plt>
  b3c3ec:	aa1403e0 	mov	x0, x20
  b3c3f0:	97e3a914 	bl	426840 <__cxa_guard_release@plt>
  b3c3f4:	aa1803e1 	mov	x1, x24
  b3c3f8:	d0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3c3fc:	f0ffd9e0 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b3c400:	9135a042 	add	x2, x2, #0xd68
  b3c404:	91126000 	add	x0, x0, #0x498
  b3c408:	97e3aaaa 	bl	426eb0 <__cxa_atexit@plt>
  b3c40c:	17fffe50 	b	b3bd4c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231134>
  b3c410:	aa1403e0 	mov	x0, x20
  b3c414:	97e3a793 	bl	426260 <__cxa_guard_acquire@plt>
  b3c418:	34ffcc00 	cbz	w0, b3bd98 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231180>
  b3c41c:	90018098 	adrp	x24, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3c420:	911b6318 	add	x24, x24, #0x6d8
  b3c424:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3c428:	b900231f 	str	wzr, [x24,#32]
  b3c42c:	97e3a2e9 	bl	424fd0 <malloc@plt>
  b3c430:	f9000700 	str	x0, [x24,#8]
  b3c434:	52801304 	mov	w4, #0x98                  	// #152
  b3c438:	52800ca3 	mov	w3, #0x65                  	// #101
  b3c43c:	b9001304 	str	w4, [x24,#16]
  b3c440:	d2806502 	mov	x2, #0x328                 	// #808
  b3c444:	b9001b03 	str	w3, [x24,#24]
  b3c448:	52800001 	mov	w1, #0x0                   	// #0
  b3c44c:	97e3a069 	bl	4245f0 <memset@plt>
  b3c450:	b9002b1f 	str	wzr, [x24,#40]
  b3c454:	aa1403e0 	mov	x0, x20
  b3c458:	97e3a8fa 	bl	426840 <__cxa_guard_release@plt>
  b3c45c:	d0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3c460:	aa1803e1 	mov	x1, x24
  b3c464:	9135a042 	add	x2, x2, #0xd68
  b3c468:	90ffe3c0 	adrp	x0, 7b4000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xbb258>
  b3c46c:	91278000 	add	x0, x0, #0x9e0
  b3c470:	97e3aa90 	bl	426eb0 <__cxa_atexit@plt>
  b3c474:	17fffe49 	b	b3bd98 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231180>
  b3c478:	aa1403e0 	mov	x0, x20
  b3c47c:	97e3a779 	bl	426260 <__cxa_guard_acquire@plt>
  b3c480:	34ffc900 	cbz	w0, b3bda0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231188>
  b3c484:	90018098 	adrp	x24, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3c488:	911b6318 	add	x24, x24, #0x6d8
  b3c48c:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3c490:	b900231f 	str	wzr, [x24,#32]
  b3c494:	97e3a2cf 	bl	424fd0 <malloc@plt>
  b3c498:	f9000700 	str	x0, [x24,#8]
  b3c49c:	52801304 	mov	w4, #0x98                  	// #152
  b3c4a0:	52800ca3 	mov	w3, #0x65                  	// #101
  b3c4a4:	b9001304 	str	w4, [x24,#16]
  b3c4a8:	d2806502 	mov	x2, #0x328                 	// #808
  b3c4ac:	b9001b03 	str	w3, [x24,#24]
  b3c4b0:	52800001 	mov	w1, #0x0                   	// #0
  b3c4b4:	97e3a04f 	bl	4245f0 <memset@plt>
  b3c4b8:	b9002b1f 	str	wzr, [x24,#40]
  b3c4bc:	aa1403e0 	mov	x0, x20
  b3c4c0:	97e3a8e0 	bl	426840 <__cxa_guard_release@plt>
  b3c4c4:	d0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3c4c8:	aa1803e1 	mov	x1, x24
  b3c4cc:	9135a042 	add	x2, x2, #0xd68
  b3c4d0:	90ffe3c0 	adrp	x0, 7b4000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xbb258>
  b3c4d4:	91278000 	add	x0, x0, #0x9e0
  b3c4d8:	97e3aa76 	bl	426eb0 <__cxa_atexit@plt>
  b3c4dc:	17fffe31 	b	b3bda0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231188>
  b3c4e0:	9101c3f8 	add	x24, sp, #0x70
  b3c4e4:	b000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3c4e8:	aa1803e0 	mov	x0, x24
  b3c4ec:	9136a021 	add	x1, x1, #0xda8
  b3c4f0:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3c4f4:	945fddfb 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3c4f8:	9101e3f9 	add	x25, sp, #0x78
  b3c4fc:	9000dec1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3c500:	911d4021 	add	x1, x1, #0x750
  b3c504:	91184021 	add	x1, x1, #0x610
  b3c508:	aa1803e0 	mov	x0, x24
  b3c50c:	aa1903e8 	mov	x8, x25
  b3c510:	945f5db8 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3c514:	910203fa 	add	x26, sp, #0x80
  b3c518:	f000e461 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3c51c:	aa1a03e8 	mov	x8, x26
  b3c520:	91366021 	add	x1, x1, #0xd98
  b3c524:	aa1903e0 	mov	x0, x25
  b3c528:	945f5db2 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3c52c:	9101a3fb 	add	x27, sp, #0x68
  b3c530:	d000d421 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3c534:	aa1b03e0 	mov	x0, x27
  b3c538:	912e6021 	add	x1, x1, #0xb98
  b3c53c:	945fdde9 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3c540:	aa1703e8 	mov	x8, x23
  b3c544:	aa1b03e1 	mov	x1, x27
  b3c548:	aa1a03e0 	mov	x0, x26
  b3c54c:	945f5d51 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3c550:	52800022 	mov	w2, #0x1                   	// #1
  b3c554:	52800001 	mov	w1, #0x0                   	// #0
  b3c558:	aa1703e0 	mov	x0, x23
  b3c55c:	945b0fa1 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3c560:	aa1703e0 	mov	x0, x23
  b3c564:	945f0027 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c568:	aa1b03e0 	mov	x0, x27
  b3c56c:	945f0025 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c570:	aa1a03e0 	mov	x0, x26
  b3c574:	945f0023 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c578:	aa1903e0 	mov	x0, x25
  b3c57c:	945f0021 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c580:	aa1803e0 	mov	x0, x24
  b3c584:	945f001f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c588:	f9400674 	ldr	x20, [x19,#8]
  b3c58c:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3c590:	17fffdcb 	b	b3bcbc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2310a4>
  b3c594:	f9400694 	ldr	x20, [x20,#8]
  b3c598:	17fffed7 	b	b3c0f4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2314dc>
  b3c59c:	aa1503e0 	mov	x0, x21
  b3c5a0:	b0018038 	adrp	x24, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3c5a4:	97e3a72f 	bl	426260 <__cxa_guard_acquire@plt>
  b3c5a8:	91240318 	add	x24, x24, #0x900
  b3c5ac:	34ffd420 	cbz	w0, b3c030 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231418>
  b3c5b0:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3c5b4:	b900231f 	str	wzr, [x24,#32]
  b3c5b8:	97e3a286 	bl	424fd0 <malloc@plt>
  b3c5bc:	f9000700 	str	x0, [x24,#8]
  b3c5c0:	52801304 	mov	w4, #0x98                  	// #152
  b3c5c4:	52800ca3 	mov	w3, #0x65                  	// #101
  b3c5c8:	b9001304 	str	w4, [x24,#16]
  b3c5cc:	d2806502 	mov	x2, #0x328                 	// #808
  b3c5d0:	b9001b03 	str	w3, [x24,#24]
  b3c5d4:	52800001 	mov	w1, #0x0                   	// #0
  b3c5d8:	97e3a006 	bl	4245f0 <memset@plt>
  b3c5dc:	aa1503e0 	mov	x0, x21
  b3c5e0:	97e3a898 	bl	426840 <__cxa_guard_release@plt>
  b3c5e4:	aa1803e1 	mov	x1, x24
  b3c5e8:	d0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3c5ec:	f0ffd9e0 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b3c5f0:	9135a042 	add	x2, x2, #0xd68
  b3c5f4:	91126000 	add	x0, x0, #0x498
  b3c5f8:	97e3aa2e 	bl	426eb0 <__cxa_atexit@plt>
  b3c5fc:	17fffe8d 	b	b3c030 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231418>
  b3c600:	aa1803e0 	mov	x0, x24
  b3c604:	97e3a717 	bl	426260 <__cxa_guard_acquire@plt>
  b3c608:	34ffd3a0 	cbz	w0, b3c07c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231464>
  b3c60c:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3c610:	b0018079 	adrp	x25, 3b49000 <stdout@@GLIBC_2.17+0x7f40>
  b3c614:	9124a339 	add	x25, x25, #0x928
  b3c618:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3c61c:	b900233f 	str	wzr, [x25,#32]
  b3c620:	97e3a26c 	bl	424fd0 <malloc@plt>
  b3c624:	f9000720 	str	x0, [x25,#8]
  b3c628:	52801304 	mov	w4, #0x98                  	// #152
  b3c62c:	52800ca3 	mov	w3, #0x65                  	// #101
  b3c630:	b9001324 	str	w4, [x25,#16]
  b3c634:	d2806502 	mov	x2, #0x328                 	// #808
  b3c638:	b9001b23 	str	w3, [x25,#24]
  b3c63c:	52800001 	mov	w1, #0x0                   	// #0
  b3c640:	97e39fec 	bl	4245f0 <memset@plt>
  b3c644:	b9002b3f 	str	wzr, [x25,#40]
  b3c648:	aa1803e0 	mov	x0, x24
  b3c64c:	97e3a87d 	bl	426840 <__cxa_guard_release@plt>
  b3c650:	aa1903e1 	mov	x1, x25
  b3c654:	d0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3c658:	f0ffe260 	adrp	x0, 78b000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x92258>
  b3c65c:	9135a042 	add	x2, x2, #0xd68
  b3c660:	9109a000 	add	x0, x0, #0x268
  b3c664:	97e3aa13 	bl	426eb0 <__cxa_atexit@plt>
  b3c668:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3c66c:	17fffe84 	b	b3c07c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231464>
  b3c670:	aa1803e0 	mov	x0, x24
  b3c674:	97e3a6fb 	bl	426260 <__cxa_guard_acquire@plt>
  b3c678:	34ffd060 	cbz	w0, b3c084 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23146c>
  b3c67c:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3c680:	b0018079 	adrp	x25, 3b49000 <stdout@@GLIBC_2.17+0x7f40>
  b3c684:	9124a339 	add	x25, x25, #0x928
  b3c688:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3c68c:	b900233f 	str	wzr, [x25,#32]
  b3c690:	97e3a250 	bl	424fd0 <malloc@plt>
  b3c694:	f9000720 	str	x0, [x25,#8]
  b3c698:	52801304 	mov	w4, #0x98                  	// #152
  b3c69c:	52800ca3 	mov	w3, #0x65                  	// #101
  b3c6a0:	b9001324 	str	w4, [x25,#16]
  b3c6a4:	d2806502 	mov	x2, #0x328                 	// #808
  b3c6a8:	b9001b23 	str	w3, [x25,#24]
  b3c6ac:	52800001 	mov	w1, #0x0                   	// #0
  b3c6b0:	97e39fd0 	bl	4245f0 <memset@plt>
  b3c6b4:	b9002b3f 	str	wzr, [x25,#40]
  b3c6b8:	aa1803e0 	mov	x0, x24
  b3c6bc:	97e3a861 	bl	426840 <__cxa_guard_release@plt>
  b3c6c0:	aa1903e1 	mov	x1, x25
  b3c6c4:	d0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3c6c8:	f0ffe260 	adrp	x0, 78b000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x92258>
  b3c6cc:	9135a042 	add	x2, x2, #0xd68
  b3c6d0:	9109a000 	add	x0, x0, #0x268
  b3c6d4:	97e3a9f7 	bl	426eb0 <__cxa_atexit@plt>
  b3c6d8:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3c6dc:	17fffe6a 	b	b3c084 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23146c>
  b3c6e0:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3c6e4:	f9000e7f 	str	xzr, [x19,#24]
  b3c6e8:	17fffd8b 	b	b3bd14 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2310fc>
  b3c6ec:	aa0203e0 	mov	x0, x2
  b3c6f0:	97ed1f64 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3c6f4:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3c6f8:	f900167f 	str	xzr, [x19,#40]
  b3c6fc:	17fffd86 	b	b3bd14 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2310fc>
  b3c700:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3c704:	910203fa 	add	x26, sp, #0x80
  b3c708:	aa1a03e0 	mov	x0, x26
  b3c70c:	b000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3c710:	9101e3f9 	add	x25, sp, #0x78
  b3c714:	9136a021 	add	x1, x1, #0xda8
  b3c718:	945fdd72 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3c71c:	9000dec1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3c720:	aa1a03e0 	mov	x0, x26
  b3c724:	aa1903e8 	mov	x8, x25
  b3c728:	911d4021 	add	x1, x1, #0x750
  b3c72c:	945f5d31 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3c730:	9101c3f8 	add	x24, sp, #0x70
  b3c734:	f000e461 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3c738:	aa1803e8 	mov	x8, x24
  b3c73c:	91366021 	add	x1, x1, #0xd98
  b3c740:	aa1903e0 	mov	x0, x25
  b3c744:	945f5d2b 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3c748:	910223f7 	add	x23, sp, #0x88
  b3c74c:	d000d421 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3c750:	aa1703e0 	mov	x0, x23
  b3c754:	912e4021 	add	x1, x1, #0xb90
  b3c758:	945fdd62 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3c75c:	9101a3fb 	add	x27, sp, #0x68
  b3c760:	aa1703e1 	mov	x1, x23
  b3c764:	aa1b03e8 	mov	x8, x27
  b3c768:	aa1803e0 	mov	x0, x24
  b3c76c:	945f5cc9 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3c770:	52800022 	mov	w2, #0x1                   	// #1
  b3c774:	52800001 	mov	w1, #0x0                   	// #0
  b3c778:	aa1b03e0 	mov	x0, x27
  b3c77c:	945b0f19 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3c780:	aa1b03e0 	mov	x0, x27
  b3c784:	945eff9f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c788:	aa1703e0 	mov	x0, x23
  b3c78c:	945eff9d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c790:	aa1803e0 	mov	x0, x24
  b3c794:	945eff9b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c798:	aa1903e0 	mov	x0, x25
  b3c79c:	945eff99 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c7a0:	aa1a03e0 	mov	x0, x26
  b3c7a4:	945eff97 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c7a8:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3c7ac:	17fffe05 	b	b3bfc0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2313a8>
  b3c7b0:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3c7b4:	910203fa 	add	x26, sp, #0x80
  b3c7b8:	aa1a03e0 	mov	x0, x26
  b3c7bc:	b000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3c7c0:	9101e3f9 	add	x25, sp, #0x78
  b3c7c4:	9136a021 	add	x1, x1, #0xda8
  b3c7c8:	945fdd46 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3c7cc:	9000dec1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3c7d0:	aa1a03e0 	mov	x0, x26
  b3c7d4:	aa1903e8 	mov	x8, x25
  b3c7d8:	911d4021 	add	x1, x1, #0x750
  b3c7dc:	945f5d05 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3c7e0:	9101c3f8 	add	x24, sp, #0x70
  b3c7e4:	f000e461 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3c7e8:	aa1803e8 	mov	x8, x24
  b3c7ec:	91366021 	add	x1, x1, #0xd98
  b3c7f0:	aa1903e0 	mov	x0, x25
  b3c7f4:	945f5cff 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3c7f8:	d000d421 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3c7fc:	aa1703e0 	mov	x0, x23
  b3c800:	912e4021 	add	x1, x1, #0xb90
  b3c804:	945fdd37 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3c808:	9101a3fb 	add	x27, sp, #0x68
  b3c80c:	aa1703e1 	mov	x1, x23
  b3c810:	aa1b03e8 	mov	x8, x27
  b3c814:	aa1803e0 	mov	x0, x24
  b3c818:	945f5c9e 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3c81c:	52800022 	mov	w2, #0x1                   	// #1
  b3c820:	52800001 	mov	w1, #0x0                   	// #0
  b3c824:	aa1b03e0 	mov	x0, x27
  b3c828:	945b0eee 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3c82c:	aa1b03e0 	mov	x0, x27
  b3c830:	945eff74 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c834:	aa1703e0 	mov	x0, x23
  b3c838:	945eff72 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c83c:	aa1803e0 	mov	x0, x24
  b3c840:	945eff70 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c844:	aa1903e0 	mov	x0, x25
  b3c848:	945eff6e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c84c:	aa1a03e0 	mov	x0, x26
  b3c850:	945eff6c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c854:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3c858:	f9000674 	str	x20, [x19,#8]
  b3c85c:	17fffd18 	b	b3bcbc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2310a4>
  b3c860:	aa0003f3 	mov	x19, x0
  b3c864:	aa1703e0 	mov	x0, x23
  b3c868:	945eff66 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c86c:	aa1803e0 	mov	x0, x24
  b3c870:	945eff64 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c874:	aa1903e0 	mov	x0, x25
  b3c878:	945eff62 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c87c:	aa1a03e0 	mov	x0, x26
  b3c880:	945eff60 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c884:	aa1303e0 	mov	x0, x19
  b3c888:	97e3a122 	bl	424d10 <_Unwind_Resume@plt>
  b3c88c:	aa0003f3 	mov	x19, x0
  b3c890:	17fffff9 	b	b3c874 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c5c>
  b3c894:	aa1703e0 	mov	x0, x23
  b3c898:	945eff5a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c89c:	aa1803e0 	mov	x0, x24
  b3c8a0:	945eff58 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c8a4:	aa1903e0 	mov	x0, x25
  b3c8a8:	945eff56 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c8ac:	aa1a03e0 	mov	x0, x26
  b3c8b0:	945eff54 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c8b4:	97e3abab 	bl	427760 <_ZSt9terminatev@plt>
  b3c8b8:	aa0003f3 	mov	x19, x0
  b3c8bc:	17ffffec 	b	b3c86c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c54>
  b3c8c0:	17fffff9 	b	b3c8a4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c8c>
  b3c8c4:	aa0003f3 	mov	x19, x0
  b3c8c8:	17ffffed 	b	b3c87c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c64>
  b3c8cc:	17fffff4 	b	b3c89c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c84>
  b3c8d0:	aa1b03e0 	mov	x0, x27
  b3c8d4:	945eff4b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c8d8:	17ffffef 	b	b3c894 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c7c>
  b3c8dc:	17fffff4 	b	b3c8ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c94>
  b3c8e0:	aa0003f3 	mov	x19, x0
  b3c8e4:	aa1b03e0 	mov	x0, x27
  b3c8e8:	945eff46 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c8ec:	aa1a03e0 	mov	x0, x26
  b3c8f0:	945eff44 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c8f4:	aa1903e0 	mov	x0, x25
  b3c8f8:	945eff42 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c8fc:	aa1803e0 	mov	x0, x24
  b3c900:	945eff40 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c904:	aa1303e0 	mov	x0, x19
  b3c908:	97e3a102 	bl	424d10 <_Unwind_Resume@plt>
  b3c90c:	aa0003f3 	mov	x19, x0
  b3c910:	17fffff7 	b	b3c8ec <_ZSt20__throw_bad_weak_ptrv@@Base+0x231cd4>
  b3c914:	aa0003f3 	mov	x19, x0
  b3c918:	17fffff7 	b	b3c8f4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231cdc>
  b3c91c:	aa0003f3 	mov	x19, x0
  b3c920:	17fffff7 	b	b3c8fc <_ZSt20__throw_bad_weak_ptrv@@Base+0x231ce4>
  b3c924:	aa0003f3 	mov	x19, x0
  b3c928:	aa1b03e0 	mov	x0, x27
  b3c92c:	945eff35 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c930:	17ffffcd 	b	b3c864 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c4c>
  b3c934:	aa0003f3 	mov	x19, x0
  b3c938:	17ffffcb 	b	b3c864 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c4c>
  b3c93c:	aa0003f3 	mov	x19, x0
  b3c940:	17ffffcb 	b	b3c86c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c54>
  b3c944:	aa0003f3 	mov	x19, x0
  b3c948:	17ffffcb 	b	b3c874 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c5c>
  b3c94c:	aa0003f3 	mov	x19, x0
  b3c950:	aa1703e0 	mov	x0, x23
  b3c954:	945eff2b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3c958:	17ffffe3 	b	b3c8e4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231ccc>
  b3c95c:	aa0003f3 	mov	x19, x0
  b3c960:	17ffffc7 	b	b3c87c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c64>
  b3c964:	17fffff0 	b	b3c924 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231d0c>
  b3c968:	17ffffda 	b	b3c8d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231cb8>
  b3c96c:	17ffffca 	b	b3c894 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c7c>
  b3c970:	17ffffcb 	b	b3c89c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c84>
  b3c974:	17ffffcc 	b	b3c8a4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c8c>
  b3c978:	17ffffcd 	b	b3c8ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x231c94>
  b3c97c:	d503201f 	nop
  b3c980:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
  b3c984:	910003fd 	mov	x29, sp
  b3c988:	a90153f3 	stp	x19, x20, [sp,#16]
  b3c98c:	aa0003f3 	mov	x19, x0
  b3c990:	f9400c00 	ldr	x0, [x0,#24]
  b3c994:	a9025bf5 	stp	x21, x22, [sp,#32]
  b3c998:	12001c35 	and	w21, w1, #0xff
  b3c99c:	b4000f60 	cbz	x0, b3cb88 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231f70>
  b3c9a0:	f9401660 	ldr	x0, [x19,#40]
  b3c9a4:	b4000fe0 	cbz	x0, b3cba0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231f88>
  b3c9a8:	a90363f7 	stp	x23, x24, [sp,#48]
  b3c9ac:	91024278 	add	x24, x19, #0x90
  b3c9b0:	52800021 	mov	w1, #0x1                   	// #1
  b3c9b4:	aa1803e0 	mov	x0, x24
  b3c9b8:	97ffa836 	bl	b26a90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x21be78>
  b3c9bc:	72001c1f 	tst	w0, #0xff
  b3c9c0:	54001800 	b.eq	b3ccc0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2320a8>
  b3c9c4:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3c9c8:	91006277 	add	x23, x19, #0x18
  b3c9cc:	52800021 	mov	w1, #0x1                   	// #1
  b3c9d0:	b9005a7f 	str	wzr, [x19,#88]
  b3c9d4:	aa1703e0 	mov	x0, x23
  b3c9d8:	9101e3f4 	add	x20, sp, #0x78
  b3c9dc:	91020276 	add	x22, x19, #0x80
  b3c9e0:	97f7d3ca 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3c9e4:	f9400e79 	ldr	x25, [x19,#24]
  b3c9e8:	aa1403e0 	mov	x0, x20
  b3c9ec:	b000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3c9f0:	91352021 	add	x1, x1, #0xd48
  b3c9f4:	f9400322 	ldr	x2, [x25]
  b3c9f8:	f940305a 	ldr	x26, [x2,#96]
  b3c9fc:	945fdcb9 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3ca00:	39422263 	ldrb	w3, [x19,#136]
  b3ca04:	aa1903e0 	mov	x0, x25
  b3ca08:	aa1403e2 	mov	x2, x20
  b3ca0c:	aa1603e1 	mov	x1, x22
  b3ca10:	d63f0340 	blr	x26
  b3ca14:	aa1403e0 	mov	x0, x20
  b3ca18:	945efefa 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3ca1c:	52800021 	mov	w1, #0x1                   	// #1
  b3ca20:	aa1703e0 	mov	x0, x23
  b3ca24:	350013d5 	cbnz	w21, b3cc9c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232084>
  b3ca28:	97f7d3b8 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3ca2c:	f9400e63 	ldr	x3, [x19,#24]
  b3ca30:	aa1603e1 	mov	x1, x22
  b3ca34:	39422262 	ldrb	w2, [x19,#136]
  b3ca38:	aa0303e0 	mov	x0, x3
  b3ca3c:	f9400063 	ldr	x3, [x3]
  b3ca40:	f9401863 	ldr	x3, [x3,#48]
  b3ca44:	d63f0060 	blr	x3
  b3ca48:	52800021 	mov	w1, #0x1                   	// #1
  b3ca4c:	aa1703e0 	mov	x0, x23
  b3ca50:	97f7d3ae 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3ca54:	f9400e75 	ldr	x21, [x19,#24]
  b3ca58:	aa1403e0 	mov	x0, x20
  b3ca5c:	f94002a1 	ldr	x1, [x21]
  b3ca60:	f9406439 	ldr	x25, [x1,#200]
  b3ca64:	9461d213 	bl	23b12b0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x3be90>
  b3ca68:	aa1403e2 	mov	x2, x20
  b3ca6c:	aa1603e1 	mov	x1, x22
  b3ca70:	aa1503e0 	mov	x0, x21
  b3ca74:	d63f0320 	blr	x25
  b3ca78:	aa1403e0 	mov	x0, x20
  b3ca7c:	94619edd 	bl	23a45f0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2f1d0>
  b3ca80:	52800021 	mov	w1, #0x1                   	// #1
  b3ca84:	aa1703e0 	mov	x0, x23
  b3ca88:	97f7d3a0 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3ca8c:	f9400e64 	ldr	x4, [x19,#24]
  b3ca90:	52800002 	mov	w2, #0x0                   	// #0
  b3ca94:	39422263 	ldrb	w3, [x19,#136]
  b3ca98:	aa1603e1 	mov	x1, x22
  b3ca9c:	aa0403e0 	mov	x0, x4
  b3caa0:	f9400084 	ldr	x4, [x4]
  b3caa4:	f9403884 	ldr	x4, [x4,#112]
  b3caa8:	d63f0080 	blr	x4
  b3caac:	52800021 	mov	w1, #0x1                   	// #1
  b3cab0:	aa1703e0 	mov	x0, x23
  b3cab4:	97f7d395 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3cab8:	f9400e64 	ldr	x4, [x19,#24]
  b3cabc:	52800002 	mov	w2, #0x0                   	// #0
  b3cac0:	39422263 	ldrb	w3, [x19,#136]
  b3cac4:	aa1603e1 	mov	x1, x22
  b3cac8:	aa0403e0 	mov	x0, x4
  b3cacc:	f9400084 	ldr	x4, [x4]
  b3cad0:	f9404884 	ldr	x4, [x4,#144]
  b3cad4:	d63f0080 	blr	x4
  b3cad8:	52800021 	mov	w1, #0x1                   	// #1
  b3cadc:	aa1703e0 	mov	x0, x23
  b3cae0:	97f7d38a 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3cae4:	f9400e75 	ldr	x21, [x19,#24]
  b3cae8:	aa1403e0 	mov	x0, x20
  b3caec:	f94002a1 	ldr	x1, [x21]
  b3caf0:	f9404c39 	ldr	x25, [x1,#152]
  b3caf4:	945f4a87 	bl	230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1873f8>
  b3caf8:	39422263 	ldrb	w3, [x19,#136]
  b3cafc:	aa1503e0 	mov	x0, x21
  b3cb00:	aa1403e2 	mov	x2, x20
  b3cb04:	aa1603e1 	mov	x1, x22
  b3cb08:	d63f0320 	blr	x25
  b3cb0c:	aa1403e0 	mov	x0, x20
  b3cb10:	945efebc 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3cb14:	aa1703e0 	mov	x0, x23
  b3cb18:	52800021 	mov	w1, #0x1                   	// #1
  b3cb1c:	97f7d37b 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3cb20:	f9400e75 	ldr	x21, [x19,#24]
  b3cb24:	aa1403e0 	mov	x0, x20
  b3cb28:	f94002a1 	ldr	x1, [x21]
  b3cb2c:	f9405037 	ldr	x23, [x1,#160]
  b3cb30:	945f4a78 	bl	230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1873f8>
  b3cb34:	aa1403e2 	mov	x2, x20
  b3cb38:	aa1603e1 	mov	x1, x22
  b3cb3c:	aa1503e0 	mov	x0, x21
  b3cb40:	d63f02e0 	blr	x23
  b3cb44:	aa1403e0 	mov	x0, x20
  b3cb48:	945efeae 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3cb4c:	aa1803e0 	mov	x0, x24
  b3cb50:	52800021 	mov	w1, #0x1                   	// #1
  b3cb54:	97ffa7cf 	bl	b26a90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x21be78>
  b3cb58:	f9404a62 	ldr	x2, [x19,#144]
  b3cb5c:	aa1603e1 	mov	x1, x22
  b3cb60:	aa0203e0 	mov	x0, x2
  b3cb64:	f9400042 	ldr	x2, [x2]
  b3cb68:	f9400c42 	ldr	x2, [x2,#24]
  b3cb6c:	d63f0040 	blr	x2
  b3cb70:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3cb74:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3cb78:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3cb7c:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3cb80:	a8c87bfd 	ldp	x29, x30, [sp],#128
  b3cb84:	d65f03c0 	ret
  b3cb88:	f9401260 	ldr	x0, [x19,#32]
  b3cb8c:	b5000a40 	cbnz	x0, b3ccd4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2320bc>
  b3cb90:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3cb94:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3cb98:	a8c87bfd 	ldp	x29, x30, [sp],#128
  b3cb9c:	d65f03c0 	ret
  b3cba0:	f9401a60 	ldr	x0, [x19,#48]
  b3cba4:	b4ffff60 	cbz	x0, b3cb90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231f78>
  b3cba8:	b0018036 	adrp	x22, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3cbac:	9123e2d6 	add	x22, x22, #0x8f8
  b3cbb0:	08dffec0 	ldarb	w0, [x22]
  b3cbb4:	36002160 	tbz	w0, #0, b3cfe0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2323c8>
  b3cbb8:	b0018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3cbbc:	91240294 	add	x20, x20, #0x900
  b3cbc0:	b9801a81 	ldrsw	x1, [x20,#24]
  b3cbc4:	f9401a62 	ldr	x2, [x19,#48]
  b3cbc8:	f9400683 	ldr	x3, [x20,#8]
  b3cbcc:	9ac10840 	udiv	x0, x2, x1
  b3cbd0:	9b018800 	msub	x0, x0, x1, x2
  b3cbd4:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b3cbd8:	b5000080 	cbnz	x0, b3cbe8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231fd0>
  b3cbdc:	14000152 	b	b3d124 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23250c>
  b3cbe0:	f9400800 	ldr	x0, [x0,#16]
  b3cbe4:	b4002a00 	cbz	x0, b3d124 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23250c>
  b3cbe8:	f9400001 	ldr	x1, [x0]
  b3cbec:	eb01005f 	cmp	x2, x1
  b3cbf0:	54ffff81 	b.ne	b3cbe0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231fc8>
  b3cbf4:	f9400414 	ldr	x20, [x0,#8]
  b3cbf8:	b4002974 	cbz	x20, b3d124 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23250c>
  b3cbfc:	90018096 	adrp	x22, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3cc00:	911b42d6 	add	x22, x22, #0x6d0
  b3cc04:	08dffec0 	ldarb	w0, [x22]
  b3cc08:	360021e0 	tbz	w0, #0, b3d044 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23242c>
  b3cc0c:	08dffec0 	ldarb	w0, [x22]
  b3cc10:	36002520 	tbz	w0, #0, b3d0b4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23249c>
  b3cc14:	90018080 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3cc18:	911c0002 	add	x2, x0, #0x700
  b3cc1c:	88dffc41 	ldar	w1, [x2]
  b3cc20:	37f81dc1 	tbnz	w1, #31, b3cfd8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2323c0>
  b3cc24:	11000423 	add	w3, w1, #0x1
  b3cc28:	885ffc44 	ldaxr	w4, [x2]
  b3cc2c:	6b01009f 	cmp	w4, w1
  b3cc30:	54000061 	b.ne	b3cc3c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232024>
  b3cc34:	8805fc43 	stlxr	w5, w3, [x2]
  b3cc38:	35ffff85 	cbnz	w5, b3cc28 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232010>
  b3cc3c:	54ffff01 	b.ne	b3cc1c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232004>
  b3cc40:	90018081 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3cc44:	911b6021 	add	x1, x1, #0x6d8
  b3cc48:	b9801823 	ldrsw	x3, [x1,#24]
  b3cc4c:	f9400424 	ldr	x4, [x1,#8]
  b3cc50:	9ac30a81 	udiv	x1, x20, x3
  b3cc54:	9b03d021 	msub	x1, x1, x3, x20
  b3cc58:	f861d881 	ldr	x1, [x4,w1,sxtw #3]
  b3cc5c:	b5000081 	cbnz	x1, b3cc6c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232054>
  b3cc60:	14000157 	b	b3d1bc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2325a4>
  b3cc64:	f9400821 	ldr	x1, [x1,#16]
  b3cc68:	b4001b41 	cbz	x1, b3cfd0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2323b8>
  b3cc6c:	f9400022 	ldr	x2, [x1]
  b3cc70:	eb02029f 	cmp	x20, x2
  b3cc74:	54ffff81 	b.ne	b3cc64 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23204c>
  b3cc78:	f9400434 	ldr	x20, [x1,#8]
  b3cc7c:	911c0000 	add	x0, x0, #0x700
  b3cc80:	97ed1e00 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3cc84:	f9001674 	str	x20, [x19,#40]
  b3cc88:	b5ffe914 	cbnz	x20, b3c9a8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231d90>
  b3cc8c:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3cc90:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3cc94:	a8c87bfd 	ldp	x29, x30, [sp],#128
  b3cc98:	d65f03c0 	ret
  b3cc9c:	97f7d31b 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3cca0:	f9400e63 	ldr	x3, [x19,#24]
  b3cca4:	aa1603e1 	mov	x1, x22
  b3cca8:	39422262 	ldrb	w2, [x19,#136]
  b3ccac:	aa0303e0 	mov	x0, x3
  b3ccb0:	f9400063 	ldr	x3, [x3]
  b3ccb4:	f9401463 	ldr	x3, [x3,#40]
  b3ccb8:	d63f0060 	blr	x3
  b3ccbc:	17ffff63 	b	b3ca48 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231e30>
  b3ccc0:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3ccc4:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3ccc8:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3cccc:	a8c87bfd 	ldp	x29, x30, [sp],#128
  b3ccd0:	d65f03c0 	ret
  b3ccd4:	b0018036 	adrp	x22, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3ccd8:	9123e2d6 	add	x22, x22, #0x8f8
  b3ccdc:	08dffec0 	ldarb	w0, [x22]
  b3cce0:	360007c0 	tbz	w0, #0, b3cdd8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2321c0>
  b3cce4:	b0018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3cce8:	91240294 	add	x20, x20, #0x900
  b3ccec:	b9801a81 	ldrsw	x1, [x20,#24]
  b3ccf0:	f9401262 	ldr	x2, [x19,#32]
  b3ccf4:	f9400683 	ldr	x3, [x20,#8]
  b3ccf8:	9ac10840 	udiv	x0, x2, x1
  b3ccfc:	9b018800 	msub	x0, x0, x1, x2
  b3cd00:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b3cd04:	b5000080 	cbnz	x0, b3cd14 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2320fc>
  b3cd08:	14000085 	b	b3cf1c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232304>
  b3cd0c:	f9400800 	ldr	x0, [x0,#16]
  b3cd10:	b4001060 	cbz	x0, b3cf1c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232304>
  b3cd14:	f9400001 	ldr	x1, [x0]
  b3cd18:	eb01005f 	cmp	x2, x1
  b3cd1c:	54ffff81 	b.ne	b3cd0c <_ZSt20__throw_bad_weak_ptrv@@Base+0x2320f4>
  b3cd20:	f9400414 	ldr	x20, [x0,#8]
  b3cd24:	b4000fd4 	cbz	x20, b3cf1c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232304>
  b3cd28:	90018096 	adrp	x22, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3cd2c:	911c22d6 	add	x22, x22, #0x708
  b3cd30:	08dffec0 	ldarb	w0, [x22]
  b3cd34:	36000840 	tbz	w0, #0, b3ce3c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232224>
  b3cd38:	08dffec0 	ldarb	w0, [x22]
  b3cd3c:	36000b80 	tbz	w0, #0, b3ceac <_ZSt20__throw_bad_weak_ptrv@@Base+0x232294>
  b3cd40:	90018080 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3cd44:	911ce002 	add	x2, x0, #0x738
  b3cd48:	88dffc41 	ldar	w1, [x2]
  b3cd4c:	37f80421 	tbnz	w1, #31, b3cdd0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2321b8>
  b3cd50:	11000423 	add	w3, w1, #0x1
  b3cd54:	885ffc44 	ldaxr	w4, [x2]
  b3cd58:	6b01009f 	cmp	w4, w1
  b3cd5c:	54000061 	b.ne	b3cd68 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232150>
  b3cd60:	8805fc43 	stlxr	w5, w3, [x2]
  b3cd64:	35ffff85 	cbnz	w5, b3cd54 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23213c>
  b3cd68:	54ffff01 	b.ne	b3cd48 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232130>
  b3cd6c:	90018081 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3cd70:	911c4021 	add	x1, x1, #0x710
  b3cd74:	b9801823 	ldrsw	x3, [x1,#24]
  b3cd78:	f9400424 	ldr	x4, [x1,#8]
  b3cd7c:	9ac30a81 	udiv	x1, x20, x3
  b3cd80:	9b03d021 	msub	x1, x1, x3, x20
  b3cd84:	f861d881 	ldr	x1, [x4,w1,sxtw #3]
  b3cd88:	b5000081 	cbnz	x1, b3cd98 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232180>
  b3cd8c:	14000108 	b	b3d1ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x232594>
  b3cd90:	f9400821 	ldr	x1, [x1,#16]
  b3cd94:	b40001a1 	cbz	x1, b3cdc8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2321b0>
  b3cd98:	f9400022 	ldr	x2, [x1]
  b3cd9c:	eb02029f 	cmp	x20, x2
  b3cda0:	54ffff81 	b.ne	b3cd90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232178>
  b3cda4:	f9400434 	ldr	x20, [x1,#8]
  b3cda8:	911ce000 	add	x0, x0, #0x738
  b3cdac:	97ed1db5 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3cdb0:	f9000e74 	str	x20, [x19,#24]
  b3cdb4:	b5ffdf74 	cbnz	x20, b3c9a0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231d88>
  b3cdb8:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3cdbc:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3cdc0:	a8c87bfd 	ldp	x29, x30, [sp],#128
  b3cdc4:	d65f03c0 	ret
  b3cdc8:	911ce000 	add	x0, x0, #0x738
  b3cdcc:	97ed1dad 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3cdd0:	f9000e7f 	str	xzr, [x19,#24]
  b3cdd4:	17ffff6f 	b	b3cb90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231f78>
  b3cdd8:	aa1603e0 	mov	x0, x22
  b3cddc:	b0018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3cde0:	97e3a520 	bl	426260 <__cxa_guard_acquire@plt>
  b3cde4:	91240294 	add	x20, x20, #0x900
  b3cde8:	34fff820 	cbz	w0, b3ccec <_ZSt20__throw_bad_weak_ptrv@@Base+0x2320d4>
  b3cdec:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3cdf0:	b900229f 	str	wzr, [x20,#32]
  b3cdf4:	97e3a077 	bl	424fd0 <malloc@plt>
  b3cdf8:	f9000680 	str	x0, [x20,#8]
  b3cdfc:	52801304 	mov	w4, #0x98                  	// #152
  b3ce00:	52800ca3 	mov	w3, #0x65                  	// #101
  b3ce04:	b9001284 	str	w4, [x20,#16]
  b3ce08:	d2806502 	mov	x2, #0x328                 	// #808
  b3ce0c:	b9001a83 	str	w3, [x20,#24]
  b3ce10:	52800001 	mov	w1, #0x0                   	// #0
  b3ce14:	97e39df7 	bl	4245f0 <memset@plt>
  b3ce18:	aa1603e0 	mov	x0, x22
  b3ce1c:	97e3a689 	bl	426840 <__cxa_guard_release@plt>
  b3ce20:	aa1403e1 	mov	x1, x20
  b3ce24:	d0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3ce28:	f0ffd9e0 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b3ce2c:	9135a042 	add	x2, x2, #0xd68
  b3ce30:	91126000 	add	x0, x0, #0x498
  b3ce34:	97e3a81f 	bl	426eb0 <__cxa_atexit@plt>
  b3ce38:	17ffffad 	b	b3ccec <_ZSt20__throw_bad_weak_ptrv@@Base+0x2320d4>
  b3ce3c:	aa1603e0 	mov	x0, x22
  b3ce40:	97e3a508 	bl	426260 <__cxa_guard_acquire@plt>
  b3ce44:	34fff7a0 	cbz	w0, b3cd38 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232120>
  b3ce48:	a90363f7 	stp	x23, x24, [sp,#48]
  b3ce4c:	90018097 	adrp	x23, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3ce50:	911c42f7 	add	x23, x23, #0x710
  b3ce54:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3ce58:	b90022ff 	str	wzr, [x23,#32]
  b3ce5c:	97e3a05d 	bl	424fd0 <malloc@plt>
  b3ce60:	f90006e0 	str	x0, [x23,#8]
  b3ce64:	52801304 	mov	w4, #0x98                  	// #152
  b3ce68:	52800ca3 	mov	w3, #0x65                  	// #101
  b3ce6c:	b90012e4 	str	w4, [x23,#16]
  b3ce70:	d2806502 	mov	x2, #0x328                 	// #808
  b3ce74:	b9001ae3 	str	w3, [x23,#24]
  b3ce78:	52800001 	mov	w1, #0x0                   	// #0
  b3ce7c:	97e39ddd 	bl	4245f0 <memset@plt>
  b3ce80:	b9002aff 	str	wzr, [x23,#40]
  b3ce84:	aa1603e0 	mov	x0, x22
  b3ce88:	97e3a66e 	bl	426840 <__cxa_guard_release@plt>
  b3ce8c:	aa1703e1 	mov	x1, x23
  b3ce90:	d0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3ce94:	90ffe3a0 	adrp	x0, 7b0000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb7258>
  b3ce98:	9135a042 	add	x2, x2, #0xd68
  b3ce9c:	91292000 	add	x0, x0, #0xa48
  b3cea0:	97e3a804 	bl	426eb0 <__cxa_atexit@plt>
  b3cea4:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3cea8:	17ffffa4 	b	b3cd38 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232120>
  b3ceac:	aa1603e0 	mov	x0, x22
  b3ceb0:	97e3a4ec 	bl	426260 <__cxa_guard_acquire@plt>
  b3ceb4:	34fff460 	cbz	w0, b3cd40 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232128>
  b3ceb8:	a90363f7 	stp	x23, x24, [sp,#48]
  b3cebc:	90018097 	adrp	x23, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3cec0:	911c42f7 	add	x23, x23, #0x710
  b3cec4:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3cec8:	b90022ff 	str	wzr, [x23,#32]
  b3cecc:	97e3a041 	bl	424fd0 <malloc@plt>
  b3ced0:	f90006e0 	str	x0, [x23,#8]
  b3ced4:	52801304 	mov	w4, #0x98                  	// #152
  b3ced8:	52800ca3 	mov	w3, #0x65                  	// #101
  b3cedc:	b90012e4 	str	w4, [x23,#16]
  b3cee0:	d2806502 	mov	x2, #0x328                 	// #808
  b3cee4:	b9001ae3 	str	w3, [x23,#24]
  b3cee8:	52800001 	mov	w1, #0x0                   	// #0
  b3ceec:	97e39dc1 	bl	4245f0 <memset@plt>
  b3cef0:	b9002aff 	str	wzr, [x23,#40]
  b3cef4:	aa1603e0 	mov	x0, x22
  b3cef8:	97e3a652 	bl	426840 <__cxa_guard_release@plt>
  b3cefc:	aa1703e1 	mov	x1, x23
  b3cf00:	d0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3cf04:	90ffe3a0 	adrp	x0, 7b0000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb7258>
  b3cf08:	9135a042 	add	x2, x2, #0xd68
  b3cf0c:	91292000 	add	x0, x0, #0xa48
  b3cf10:	97e3a7e8 	bl	426eb0 <__cxa_atexit@plt>
  b3cf14:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3cf18:	17ffff8a 	b	b3cd40 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232128>
  b3cf1c:	9101c3f3 	add	x19, sp, #0x70
  b3cf20:	b000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3cf24:	aa1303e0 	mov	x0, x19
  b3cf28:	9136a021 	add	x1, x1, #0xda8
  b3cf2c:	945fdb6d 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3cf30:	9101a3f5 	add	x21, sp, #0x68
  b3cf34:	9000dec1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3cf38:	911d4021 	add	x1, x1, #0x750
  b3cf3c:	9100a021 	add	x1, x1, #0x28
  b3cf40:	aa1303e0 	mov	x0, x19
  b3cf44:	aa1503e8 	mov	x8, x21
  b3cf48:	945f5b2a 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3cf4c:	910183f6 	add	x22, sp, #0x60
  b3cf50:	f000e461 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3cf54:	aa1603e8 	mov	x8, x22
  b3cf58:	91366021 	add	x1, x1, #0xd98
  b3cf5c:	aa1503e0 	mov	x0, x21
  b3cf60:	945f5b24 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3cf64:	9101e3f4 	add	x20, sp, #0x78
  b3cf68:	d000d421 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3cf6c:	aa1403e0 	mov	x0, x20
  b3cf70:	912e6021 	add	x1, x1, #0xb98
  b3cf74:	945fdb5b 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3cf78:	a90363f7 	stp	x23, x24, [sp,#48]
  b3cf7c:	910163f7 	add	x23, sp, #0x58
  b3cf80:	aa1403e1 	mov	x1, x20
  b3cf84:	aa1703e8 	mov	x8, x23
  b3cf88:	aa1603e0 	mov	x0, x22
  b3cf8c:	945f5ac1 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3cf90:	52800022 	mov	w2, #0x1                   	// #1
  b3cf94:	52800001 	mov	w1, #0x0                   	// #0
  b3cf98:	aa1703e0 	mov	x0, x23
  b3cf9c:	945b0d11 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3cfa0:	aa1703e0 	mov	x0, x23
  b3cfa4:	945efd97 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3cfa8:	aa1403e0 	mov	x0, x20
  b3cfac:	945efd95 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3cfb0:	aa1603e0 	mov	x0, x22
  b3cfb4:	945efd93 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3cfb8:	aa1503e0 	mov	x0, x21
  b3cfbc:	945efd91 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3cfc0:	aa1303e0 	mov	x0, x19
  b3cfc4:	945efd8f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3cfc8:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3cfcc:	17fffef1 	b	b3cb90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231f78>
  b3cfd0:	911c0000 	add	x0, x0, #0x700
  b3cfd4:	97ed1d2b 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3cfd8:	f900167f 	str	xzr, [x19,#40]
  b3cfdc:	17fffeed 	b	b3cb90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231f78>
  b3cfe0:	aa1603e0 	mov	x0, x22
  b3cfe4:	b0018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3cfe8:	97e3a49e 	bl	426260 <__cxa_guard_acquire@plt>
  b3cfec:	91240294 	add	x20, x20, #0x900
  b3cff0:	34ffde80 	cbz	w0, b3cbc0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231fa8>
  b3cff4:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3cff8:	b900229f 	str	wzr, [x20,#32]
  b3cffc:	97e39ff5 	bl	424fd0 <malloc@plt>
  b3d000:	f9000680 	str	x0, [x20,#8]
  b3d004:	52801304 	mov	w4, #0x98                  	// #152
  b3d008:	52800ca3 	mov	w3, #0x65                  	// #101
  b3d00c:	b9001284 	str	w4, [x20,#16]
  b3d010:	d2806502 	mov	x2, #0x328                 	// #808
  b3d014:	b9001a83 	str	w3, [x20,#24]
  b3d018:	52800001 	mov	w1, #0x0                   	// #0
  b3d01c:	97e39d75 	bl	4245f0 <memset@plt>
  b3d020:	aa1603e0 	mov	x0, x22
  b3d024:	97e3a607 	bl	426840 <__cxa_guard_release@plt>
  b3d028:	aa1403e1 	mov	x1, x20
  b3d02c:	b0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3d030:	d0ffd9e0 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b3d034:	9135a042 	add	x2, x2, #0xd68
  b3d038:	91126000 	add	x0, x0, #0x498
  b3d03c:	97e3a79d 	bl	426eb0 <__cxa_atexit@plt>
  b3d040:	17fffee0 	b	b3cbc0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231fa8>
  b3d044:	aa1603e0 	mov	x0, x22
  b3d048:	97e3a486 	bl	426260 <__cxa_guard_acquire@plt>
  b3d04c:	34ffde00 	cbz	w0, b3cc0c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231ff4>
  b3d050:	a90363f7 	stp	x23, x24, [sp,#48]
  b3d054:	f0018077 	adrp	x23, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3d058:	911b62f7 	add	x23, x23, #0x6d8
  b3d05c:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3d060:	b90022ff 	str	wzr, [x23,#32]
  b3d064:	97e39fdb 	bl	424fd0 <malloc@plt>
  b3d068:	f90006e0 	str	x0, [x23,#8]
  b3d06c:	52801304 	mov	w4, #0x98                  	// #152
  b3d070:	52800ca3 	mov	w3, #0x65                  	// #101
  b3d074:	b90012e4 	str	w4, [x23,#16]
  b3d078:	d2806502 	mov	x2, #0x328                 	// #808
  b3d07c:	b9001ae3 	str	w3, [x23,#24]
  b3d080:	52800001 	mov	w1, #0x0                   	// #0
  b3d084:	97e39d5b 	bl	4245f0 <memset@plt>
  b3d088:	b9002aff 	str	wzr, [x23,#40]
  b3d08c:	aa1603e0 	mov	x0, x22
  b3d090:	97e3a5ec 	bl	426840 <__cxa_guard_release@plt>
  b3d094:	aa1703e1 	mov	x1, x23
  b3d098:	b0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3d09c:	f0ffe3a0 	adrp	x0, 7b4000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xbb258>
  b3d0a0:	9135a042 	add	x2, x2, #0xd68
  b3d0a4:	91278000 	add	x0, x0, #0x9e0
  b3d0a8:	97e3a782 	bl	426eb0 <__cxa_atexit@plt>
  b3d0ac:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3d0b0:	17fffed7 	b	b3cc0c <_ZSt20__throw_bad_weak_ptrv@@Base+0x231ff4>
  b3d0b4:	aa1603e0 	mov	x0, x22
  b3d0b8:	97e3a46a 	bl	426260 <__cxa_guard_acquire@plt>
  b3d0bc:	34ffdac0 	cbz	w0, b3cc14 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231ffc>
  b3d0c0:	a90363f7 	stp	x23, x24, [sp,#48]
  b3d0c4:	f0018077 	adrp	x23, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3d0c8:	911b62f7 	add	x23, x23, #0x6d8
  b3d0cc:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3d0d0:	b90022ff 	str	wzr, [x23,#32]
  b3d0d4:	97e39fbf 	bl	424fd0 <malloc@plt>
  b3d0d8:	f90006e0 	str	x0, [x23,#8]
  b3d0dc:	52801304 	mov	w4, #0x98                  	// #152
  b3d0e0:	52800ca3 	mov	w3, #0x65                  	// #101
  b3d0e4:	b90012e4 	str	w4, [x23,#16]
  b3d0e8:	d2806502 	mov	x2, #0x328                 	// #808
  b3d0ec:	b9001ae3 	str	w3, [x23,#24]
  b3d0f0:	52800001 	mov	w1, #0x0                   	// #0
  b3d0f4:	97e39d3f 	bl	4245f0 <memset@plt>
  b3d0f8:	b9002aff 	str	wzr, [x23,#40]
  b3d0fc:	aa1603e0 	mov	x0, x22
  b3d100:	97e3a5d0 	bl	426840 <__cxa_guard_release@plt>
  b3d104:	aa1703e1 	mov	x1, x23
  b3d108:	b0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3d10c:	f0ffe3a0 	adrp	x0, 7b4000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xbb258>
  b3d110:	9135a042 	add	x2, x2, #0xd68
  b3d114:	91278000 	add	x0, x0, #0x9e0
  b3d118:	97e3a766 	bl	426eb0 <__cxa_atexit@plt>
  b3d11c:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3d120:	17fffebd 	b	b3cc14 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231ffc>
  b3d124:	9101c3f3 	add	x19, sp, #0x70
  b3d128:	9000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3d12c:	aa1303e0 	mov	x0, x19
  b3d130:	9136a021 	add	x1, x1, #0xda8
  b3d134:	945fdaeb 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3d138:	9101a3f5 	add	x21, sp, #0x68
  b3d13c:	f000dea1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3d140:	911d4021 	add	x1, x1, #0x750
  b3d144:	91040021 	add	x1, x1, #0x100
  b3d148:	aa1303e0 	mov	x0, x19
  b3d14c:	aa1503e8 	mov	x8, x21
  b3d150:	945f5aa8 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3d154:	910183f6 	add	x22, sp, #0x60
  b3d158:	d000e461 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3d15c:	aa1603e8 	mov	x8, x22
  b3d160:	91366021 	add	x1, x1, #0xd98
  b3d164:	aa1503e0 	mov	x0, x21
  b3d168:	945f5aa2 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3d16c:	9101e3f4 	add	x20, sp, #0x78
  b3d170:	b000d421 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3d174:	aa1403e0 	mov	x0, x20
  b3d178:	912e6021 	add	x1, x1, #0xb98
  b3d17c:	945fdad9 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3d180:	a90363f7 	stp	x23, x24, [sp,#48]
  b3d184:	910163f7 	add	x23, sp, #0x58
  b3d188:	aa1403e1 	mov	x1, x20
  b3d18c:	aa1703e8 	mov	x8, x23
  b3d190:	aa1603e0 	mov	x0, x22
  b3d194:	945f5a3f 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3d198:	52800022 	mov	w2, #0x1                   	// #1
  b3d19c:	52800001 	mov	w1, #0x0                   	// #0
  b3d1a0:	aa1703e0 	mov	x0, x23
  b3d1a4:	945b0c8f 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3d1a8:	17ffff7e 	b	b3cfa0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232388>
  b3d1ac:	aa0203e0 	mov	x0, x2
  b3d1b0:	97ed1cb4 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3d1b4:	f9000e7f 	str	xzr, [x19,#24]
  b3d1b8:	17fffe76 	b	b3cb90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231f78>
  b3d1bc:	aa0203e0 	mov	x0, x2
  b3d1c0:	97ed1cb0 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3d1c4:	f900167f 	str	xzr, [x19,#40]
  b3d1c8:	17fffe72 	b	b3cb90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x231f78>
  b3d1cc:	aa0003f3 	mov	x19, x0
  b3d1d0:	aa1403e0 	mov	x0, x20
  b3d1d4:	945efd0b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d1d8:	aa1303e0 	mov	x0, x19
  b3d1dc:	97e39ecd 	bl	424d10 <_Unwind_Resume@plt>
  b3d1e0:	aa0003f3 	mov	x19, x0
  b3d1e4:	aa1403e0 	mov	x0, x20
  b3d1e8:	94619d02 	bl	23a45f0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2f1d0>
  b3d1ec:	aa1303e0 	mov	x0, x19
  b3d1f0:	97e39ec8 	bl	424d10 <_Unwind_Resume@plt>
  b3d1f4:	aa0003f7 	mov	x23, x0
  b3d1f8:	aa1403e0 	mov	x0, x20
  b3d1fc:	aa1703f4 	mov	x20, x23
  b3d200:	945efd00 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d204:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3d208:	aa1603e0 	mov	x0, x22
  b3d20c:	945efcfd 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d210:	aa1503e0 	mov	x0, x21
  b3d214:	945efcfb 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d218:	aa1303e0 	mov	x0, x19
  b3d21c:	a90363f7 	stp	x23, x24, [sp,#48]
  b3d220:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3d224:	945efcf7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d228:	aa1403e0 	mov	x0, x20
  b3d22c:	97e39eb9 	bl	424d10 <_Unwind_Resume@plt>
  b3d230:	aa0003f4 	mov	x20, x0
  b3d234:	17fffff5 	b	b3d208 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2325f0>
  b3d238:	aa0003f4 	mov	x20, x0
  b3d23c:	17fffff5 	b	b3d210 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2325f8>
  b3d240:	aa0003f4 	mov	x20, x0
  b3d244:	17fffff5 	b	b3d218 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232600>
  b3d248:	17ffffe1 	b	b3d1cc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2325b4>
  b3d24c:	aa0003e1 	mov	x1, x0
  b3d250:	aa1703e0 	mov	x0, x23
  b3d254:	aa0103f7 	mov	x23, x1
  b3d258:	945efcea 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d25c:	17ffffe7 	b	b3d1f8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2325e0>
  b3d260:	17ffffdb 	b	b3d1cc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2325b4>
  b3d264:	17fffffa 	b	b3d24c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232634>
  b3d268:	aa0003f7 	mov	x23, x0
  b3d26c:	17ffffe3 	b	b3d1f8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2325e0>
  b3d270:	aa0003f4 	mov	x20, x0
  b3d274:	17ffffe5 	b	b3d208 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2325f0>
  b3d278:	aa0003f4 	mov	x20, x0
  b3d27c:	17ffffe5 	b	b3d210 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2325f8>
  b3d280:	aa0003f4 	mov	x20, x0
  b3d284:	17ffffe5 	b	b3d218 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232600>
  b3d288:	a9b47bfd 	stp	x29, x30, [sp,#-192]!
  b3d28c:	910003fd 	mov	x29, sp
  b3d290:	a90153f3 	stp	x19, x20, [sp,#16]
  b3d294:	aa0003f3 	mov	x19, x0
  b3d298:	f9400c00 	ldr	x0, [x0,#24]
  b3d29c:	a90573fb 	stp	x27, x28, [sp,#80]
  b3d2a0:	b4000240 	cbz	x0, b3d2e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2326d0>
  b3d2a4:	f9401660 	ldr	x0, [x19,#40]
  b3d2a8:	b4000a20 	cbz	x0, b3d3ec <_ZSt20__throw_bad_weak_ptrv@@Base+0x2327d4>
  b3d2ac:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3d2b0:	91024279 	add	x25, x19, #0x90
  b3d2b4:	52800021 	mov	w1, #0x1                   	// #1
  b3d2b8:	aa1903e0 	mov	x0, x25
  b3d2bc:	97ffa5f5 	bl	b26a90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x21be78>
  b3d2c0:	72001c1f 	tst	w0, #0xff
  b3d2c4:	54000080 	b.eq	b3d2d4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2326bc>
  b3d2c8:	b9405a60 	ldr	w0, [x19,#88]
  b3d2cc:	7100081f 	cmp	w0, #0x2
  b3d2d0:	54001100 	b.eq	b3d4f0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2328d8>
  b3d2d4:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3d2d8:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3d2dc:	a94573fb 	ldp	x27, x28, [sp,#80]
  b3d2e0:	a8cc7bfd 	ldp	x29, x30, [sp],#192
  b3d2e4:	d65f03c0 	ret
  b3d2e8:	f9401260 	ldr	x0, [x19,#32]
  b3d2ec:	b4ffff60 	cbz	x0, b3d2d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2326c0>
  b3d2f0:	a9025bf5 	stp	x21, x22, [sp,#32]
  b3d2f4:	90018035 	adrp	x21, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3d2f8:	9123e2b5 	add	x21, x21, #0x8f8
  b3d2fc:	08dffea0 	ldarb	w0, [x21]
  b3d300:	36004020 	tbz	w0, #0, b3db04 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232eec>
  b3d304:	90018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3d308:	91240294 	add	x20, x20, #0x900
  b3d30c:	b9801a81 	ldrsw	x1, [x20,#24]
  b3d310:	f9401262 	ldr	x2, [x19,#32]
  b3d314:	f9400683 	ldr	x3, [x20,#8]
  b3d318:	9ac10840 	udiv	x0, x2, x1
  b3d31c:	9b018800 	msub	x0, x0, x1, x2
  b3d320:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b3d324:	b5000080 	cbnz	x0, b3d334 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23271c>
  b3d328:	14000150 	b	b3d868 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232c50>
  b3d32c:	f9400800 	ldr	x0, [x0,#16]
  b3d330:	b40029c0 	cbz	x0, b3d868 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232c50>
  b3d334:	f9400001 	ldr	x1, [x0]
  b3d338:	eb01005f 	cmp	x2, x1
  b3d33c:	54ffff81 	b.ne	b3d32c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232714>
  b3d340:	f9400416 	ldr	x22, [x0,#8]
  b3d344:	b4002936 	cbz	x22, b3d868 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232c50>
  b3d348:	f0018074 	adrp	x20, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3d34c:	911c2294 	add	x20, x20, #0x708
  b3d350:	08dffe80 	ldarb	w0, [x20]
  b3d354:	36004500 	tbz	w0, #0, b3dbf4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232fdc>
  b3d358:	08dffe80 	ldarb	w0, [x20]
  b3d35c:	36004800 	tbz	w0, #0, b3dc5c <_ZSt20__throw_bad_weak_ptrv@@Base+0x233044>
  b3d360:	f0018060 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3d364:	911ce002 	add	x2, x0, #0x738
  b3d368:	88dffc41 	ldar	w1, [x2]
  b3d36c:	37f83c61 	tbnz	w1, #31, b3daf8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232ee0>
  b3d370:	11000423 	add	w3, w1, #0x1
  b3d374:	885ffc44 	ldaxr	w4, [x2]
  b3d378:	6b01009f 	cmp	w4, w1
  b3d37c:	54000061 	b.ne	b3d388 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232770>
  b3d380:	8805fc43 	stlxr	w5, w3, [x2]
  b3d384:	35ffff85 	cbnz	w5, b3d374 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23275c>
  b3d388:	54ffff01 	b.ne	b3d368 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232750>
  b3d38c:	f0018061 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3d390:	911c4021 	add	x1, x1, #0x710
  b3d394:	b9801823 	ldrsw	x3, [x1,#24]
  b3d398:	f9400424 	ldr	x4, [x1,#8]
  b3d39c:	9ac30ac1 	udiv	x1, x22, x3
  b3d3a0:	9b03d821 	msub	x1, x1, x3, x22
  b3d3a4:	f861d881 	ldr	x1, [x4,w1,sxtw #3]
  b3d3a8:	b5000081 	cbnz	x1, b3d3b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2327a0>
  b3d3ac:	1400029b 	b	b3de18 <_ZSt20__throw_bad_weak_ptrv@@Base+0x233200>
  b3d3b0:	f9400821 	ldr	x1, [x1,#16]
  b3d3b4:	b40039e1 	cbz	x1, b3daf0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232ed8>
  b3d3b8:	f9400022 	ldr	x2, [x1]
  b3d3bc:	eb0202df 	cmp	x22, x2
  b3d3c0:	54ffff81 	b.ne	b3d3b0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232798>
  b3d3c4:	f9400434 	ldr	x20, [x1,#8]
  b3d3c8:	911ce000 	add	x0, x0, #0x738
  b3d3cc:	97ed1c2d 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3d3d0:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3d3d4:	f9000e74 	str	x20, [x19,#24]
  b3d3d8:	b5fff674 	cbnz	x20, b3d2a4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23268c>
  b3d3dc:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3d3e0:	a94573fb 	ldp	x27, x28, [sp,#80]
  b3d3e4:	a8cc7bfd 	ldp	x29, x30, [sp],#192
  b3d3e8:	d65f03c0 	ret
  b3d3ec:	f9401a60 	ldr	x0, [x19,#48]
  b3d3f0:	b4fff740 	cbz	x0, b3d2d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2326c0>
  b3d3f4:	a9025bf5 	stp	x21, x22, [sp,#32]
  b3d3f8:	90018035 	adrp	x21, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3d3fc:	9123e2b5 	add	x21, x21, #0x8f8
  b3d400:	08dffea0 	ldarb	w0, [x21]
  b3d404:	360046a0 	tbz	w0, #0, b3dcd8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2330c0>
  b3d408:	90018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3d40c:	91240294 	add	x20, x20, #0x900
  b3d410:	b9801a81 	ldrsw	x1, [x20,#24]
  b3d414:	f9401a62 	ldr	x2, [x19,#48]
  b3d418:	f9400683 	ldr	x3, [x20,#8]
  b3d41c:	9ac10840 	udiv	x0, x2, x1
  b3d420:	9b018800 	msub	x0, x0, x1, x2
  b3d424:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b3d428:	b5000080 	cbnz	x0, b3d438 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232820>
  b3d42c:	140001cf 	b	b3db68 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232f50>
  b3d430:	f9400800 	ldr	x0, [x0,#16]
  b3d434:	b40039a0 	cbz	x0, b3db68 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232f50>
  b3d438:	f9400001 	ldr	x1, [x0]
  b3d43c:	eb01005f 	cmp	x2, x1
  b3d440:	54ffff81 	b.ne	b3d430 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232818>
  b3d444:	f9400416 	ldr	x22, [x0,#8]
  b3d448:	b4003916 	cbz	x22, b3db68 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232f50>
  b3d44c:	f0018074 	adrp	x20, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3d450:	911b4294 	add	x20, x20, #0x6d0
  b3d454:	08dffe80 	ldarb	w0, [x20]
  b3d458:	36004720 	tbz	w0, #0, b3dd3c <_ZSt20__throw_bad_weak_ptrv@@Base+0x233124>
  b3d45c:	08dffe80 	ldarb	w0, [x20]
  b3d460:	36004a20 	tbz	w0, #0, b3dda4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23318c>
  b3d464:	f0018060 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3d468:	911c0002 	add	x2, x0, #0x700
  b3d46c:	88dffc41 	ldar	w1, [x2]
  b3d470:	37f842e1 	tbnz	w1, #31, b3dccc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2330b4>
  b3d474:	11000423 	add	w3, w1, #0x1
  b3d478:	885ffc44 	ldaxr	w4, [x2]
  b3d47c:	6b01009f 	cmp	w4, w1
  b3d480:	54000061 	b.ne	b3d48c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232874>
  b3d484:	8805fc43 	stlxr	w5, w3, [x2]
  b3d488:	35ffff85 	cbnz	w5, b3d478 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232860>
  b3d48c:	54ffff01 	b.ne	b3d46c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232854>
  b3d490:	f0018061 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3d494:	911b6021 	add	x1, x1, #0x6d8
  b3d498:	b9801823 	ldrsw	x3, [x1,#24]
  b3d49c:	f9400424 	ldr	x4, [x1,#8]
  b3d4a0:	9ac30ac1 	udiv	x1, x22, x3
  b3d4a4:	9b03d821 	msub	x1, x1, x3, x22
  b3d4a8:	f861d881 	ldr	x1, [x4,w1,sxtw #3]
  b3d4ac:	b5000081 	cbnz	x1, b3d4bc <_ZSt20__throw_bad_weak_ptrv@@Base+0x2328a4>
  b3d4b0:	14000278 	b	b3de90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x233278>
  b3d4b4:	f9400821 	ldr	x1, [x1,#16]
  b3d4b8:	b4004061 	cbz	x1, b3dcc4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2330ac>
  b3d4bc:	f9400022 	ldr	x2, [x1]
  b3d4c0:	eb0202df 	cmp	x22, x2
  b3d4c4:	54ffff81 	b.ne	b3d4b4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23289c>
  b3d4c8:	f9400434 	ldr	x20, [x1,#8]
  b3d4cc:	911c0000 	add	x0, x0, #0x700
  b3d4d0:	97ed1bec 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3d4d4:	f9001674 	str	x20, [x19,#40]
  b3d4d8:	b5006014 	cbnz	x20, b3e0d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2334c0>
  b3d4dc:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3d4e0:	a94153f3 	ldp	x19, x20, [sp,#16]
  b3d4e4:	a94573fb 	ldp	x27, x28, [sp,#80]
  b3d4e8:	a8cc7bfd 	ldp	x29, x30, [sp],#192
  b3d4ec:	d65f03c0 	ret
  b3d4f0:	a9025bf5 	stp	x21, x22, [sp,#32]
  b3d4f4:	f9402675 	ldr	x21, [x19,#72]
  b3d4f8:	a90363f7 	stp	x23, x24, [sp,#48]
  b3d4fc:	b4002175 	cbz	x21, b3d928 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232d10>
  b3d500:	f94002a2 	ldr	x2, [x21]
  b3d504:	9101c3e8 	add	x8, sp, #0x70
  b3d508:	f9404261 	ldr	x1, [x19,#128]
  b3d50c:	aa1503e0 	mov	x0, x21
  b3d510:	f9400842 	ldr	x2, [x2,#16]
  b3d514:	91006278 	add	x24, x19, #0x18
  b3d518:	d63f0040 	blr	x2
  b3d51c:	aa1803e0 	mov	x0, x24
  b3d520:	52800021 	mov	w1, #0x1                   	// #1
  b3d524:	97f7d0f9 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3d528:	f9400e63 	ldr	x3, [x19,#24]
  b3d52c:	91020275 	add	x21, x19, #0x80
  b3d530:	aa1503e1 	mov	x1, x21
  b3d534:	9101c3e2 	add	x2, sp, #0x70
  b3d538:	aa0303e0 	mov	x0, x3
  b3d53c:	f9400063 	ldr	x3, [x3]
  b3d540:	f9406463 	ldr	x3, [x3,#200]
  b3d544:	d63f0060 	blr	x3
  b3d548:	52800060 	mov	w0, #0x3                   	// #3
  b3d54c:	b9005a60 	str	w0, [x19,#88]
  b3d550:	52800021 	mov	w1, #0x1                   	// #1
  b3d554:	aa1803e0 	mov	x0, x24
  b3d558:	97f7d0ec 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3d55c:	f9400e64 	ldr	x4, [x19,#24]
  b3d560:	52800022 	mov	w2, #0x1                   	// #1
  b3d564:	39422263 	ldrb	w3, [x19,#136]
  b3d568:	aa1503e1 	mov	x1, x21
  b3d56c:	aa0403e0 	mov	x0, x4
  b3d570:	f9400084 	ldr	x4, [x4]
  b3d574:	f9405884 	ldr	x4, [x4,#176]
  b3d578:	d63f0080 	blr	x4
  b3d57c:	91002276 	add	x22, x19, #0x8
  b3d580:	52800021 	mov	w1, #0x1                   	// #1
  b3d584:	aa1603e0 	mov	x0, x22
  b3d588:	97f16712 	bl	7971d0 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x9e428>
  b3d58c:	f9400662 	ldr	x2, [x19,#8]
  b3d590:	aa1503e1 	mov	x1, x21
  b3d594:	aa0203e0 	mov	x0, x2
  b3d598:	f9400042 	ldr	x2, [x2]
  b3d59c:	f9404042 	ldr	x2, [x2,#128]
  b3d5a0:	d63f0040 	blr	x2
  b3d5a4:	b9008260 	str	w0, [x19,#128]
  b3d5a8:	d360bc00 	ubfx	x0, x0, #32, #16
  b3d5ac:	79010a60 	strh	w0, [x19,#132]
  b3d5b0:	9102a3f4 	add	x20, sp, #0xa8
  b3d5b4:	91002280 	add	x0, x20, #0x8
  b3d5b8:	945f47d6 	bl	230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1873f8>
  b3d5bc:	91004280 	add	x0, x20, #0x10
  b3d5c0:	945f47d4 	bl	230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1873f8>
  b3d5c4:	aa1603e0 	mov	x0, x22
  b3d5c8:	52800021 	mov	w1, #0x1                   	// #1
  b3d5cc:	97f16701 	bl	7971d0 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x9e428>
  b3d5d0:	f9400663 	ldr	x3, [x19,#8]
  b3d5d4:	aa1503e2 	mov	x2, x21
  b3d5d8:	aa1403e1 	mov	x1, x20
  b3d5dc:	aa0303e0 	mov	x0, x3
  b3d5e0:	f9400063 	ldr	x3, [x3]
  b3d5e4:	f9401063 	ldr	x3, [x3,#32]
  b3d5e8:	d63f0060 	blr	x3
  b3d5ec:	72001c1f 	tst	w0, #0xff
  b3d5f0:	54001280 	b.eq	b3d840 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232c28>
  b3d5f4:	9101e3f6 	add	x22, sp, #0x78
  b3d5f8:	91004281 	add	x1, x20, #0x10
  b3d5fc:	aa1603e0 	mov	x0, x22
  b3d600:	945f47cc 	bl	230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187418>
  b3d604:	f9403fe0 	ldr	x0, [sp,#120]
  b3d608:	39400000 	ldrb	w0, [x0]
  b3d60c:	34001160 	cbz	w0, b3d838 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232c20>
  b3d610:	aa1603e0 	mov	x0, x22
  b3d614:	945f69d3 	bl	2317d60 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18fc48>
  b3d618:	2a0003f7 	mov	w23, w0
  b3d61c:	945fbd6d 	bl	232cbd0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a4ab8>
  b3d620:	6b0002ff 	cmp	w23, w0
  b3d624:	540000a0 	b.eq	b3d638 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232a20>
  b3d628:	945fbd6a 	bl	232cbd0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a4ab8>
  b3d62c:	2a0003e1 	mov	w1, w0
  b3d630:	aa1603e0 	mov	x0, x22
  b3d634:	946030d7 	bl	2349990 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1c1878>
  b3d638:	d000daa1 	adrp	x1, 2693000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xd01a8>
  b3d63c:	aa1603e0 	mov	x0, x22
  b3d640:	913e2021 	add	x1, x1, #0xf88
  b3d644:	945f583b 	bl	2313730 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b618>
  b3d648:	910223fb 	add	x27, sp, #0x88
  b3d64c:	aa1603e1 	mov	x1, x22
  b3d650:	aa1b03e0 	mov	x0, x27
  b3d654:	94604a07 	bl	234fe70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1c7d58>
  b3d658:	910263fa 	add	x26, sp, #0x98
  b3d65c:	b000d9c1 	adrp	x1, 2676000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb31a8>
  b3d660:	aa1a03e0 	mov	x0, x26
  b3d664:	91014021 	add	x1, x1, #0x50
  b3d668:	910203f7 	add	x23, sp, #0x80
  b3d66c:	945f72f9 	bl	231a250 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x192138>
  b3d670:	aa1a03e1 	mov	x1, x26
  b3d674:	aa1703e8 	mov	x8, x23
  b3d678:	aa1b03e0 	mov	x0, x27
  b3d67c:	94604a05 	bl	234fe90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1c7d78>
  b3d680:	aa1b03e0 	mov	x0, x27
  b3d684:	945efbdf 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d688:	52800021 	mov	w1, #0x1                   	// #1
  b3d68c:	aa1903e0 	mov	x0, x25
  b3d690:	97ffa500 	bl	b26a90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x21be78>
  b3d694:	f9404a63 	ldr	x3, [x19,#144]
  b3d698:	aa1703e2 	mov	x2, x23
  b3d69c:	aa1503e1 	mov	x1, x21
  b3d6a0:	aa0303e0 	mov	x0, x3
  b3d6a4:	f9400063 	ldr	x3, [x3]
  b3d6a8:	f9400863 	ldr	x3, [x3,#16]
  b3d6ac:	d63f0060 	blr	x3
  b3d6b0:	aa1903e0 	mov	x0, x25
  b3d6b4:	52800021 	mov	w1, #0x1                   	// #1
  b3d6b8:	97ffa4f6 	bl	b26a90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x21be78>
  b3d6bc:	f9404a62 	ldr	x2, [x19,#144]
  b3d6c0:	aa1b03e8 	mov	x8, x27
  b3d6c4:	aa1503e1 	mov	x1, x21
  b3d6c8:	aa0203e0 	mov	x0, x2
  b3d6cc:	f9400042 	ldr	x2, [x2]
  b3d6d0:	f9401042 	ldr	x2, [x2,#32]
  b3d6d4:	d63f0040 	blr	x2
  b3d6d8:	f9404bf9 	ldr	x25, [sp,#144]
  b3d6dc:	b4000ab9 	cbz	x25, b3d830 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232c18>
  b3d6e0:	9100233b 	add	x27, x25, #0x8
  b3d6e4:	b9400360 	ldr	w0, [x27]
  b3d6e8:	34003a40 	cbz	w0, b3de30 <_ZSt20__throw_bad_weak_ptrv@@Base+0x233218>
  b3d6ec:	11000402 	add	w2, w0, #0x1
  b3d6f0:	885fff61 	ldaxr	w1, [x27]
  b3d6f4:	6b00003f 	cmp	w1, w0
  b3d6f8:	54000061 	b.ne	b3d704 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232aec>
  b3d6fc:	8803ff62 	stlxr	w3, w2, [x27]
  b3d700:	7100007f 	cmp	w3, #0x0
  b3d704:	54005041 	b.ne	b3e10c <_ZSt20__throw_bad_weak_ptrv@@Base+0x2334f4>
  b3d708:	b9400360 	ldr	w0, [x27]
  b3d70c:	34003800 	cbz	w0, b3de0c <_ZSt20__throw_bad_weak_ptrv@@Base+0x2331f4>
  b3d710:	f94047e0 	ldr	x0, [sp,#136]
  b3d714:	b40037c0 	cbz	x0, b3de0c <_ZSt20__throw_bad_weak_ptrv@@Base+0x2331f4>
  b3d718:	aa1a03e8 	mov	x8, x26
  b3d71c:	9427f3cf 	bl	153a658 <_ZNSt15recursive_mutex4lockEv@@Base+0xaeab0>
  b3d720:	f94053fa 	ldr	x26, [sp,#160]
  b3d724:	b400375a 	cbz	x26, b3de0c <_ZSt20__throw_bad_weak_ptrv@@Base+0x2331f4>
  b3d728:	9100235c 	add	x28, x26, #0x8
  b3d72c:	b9400380 	ldr	w0, [x28]
  b3d730:	34003a80 	cbz	w0, b3de80 <_ZSt20__throw_bad_weak_ptrv@@Base+0x233268>
  b3d734:	11000402 	add	w2, w0, #0x1
  b3d738:	885fff81 	ldaxr	w1, [x28]
  b3d73c:	6b00003f 	cmp	w1, w0
  b3d740:	54000061 	b.ne	b3d74c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232b34>
  b3d744:	8803ff82 	stlxr	w3, w2, [x28]
  b3d748:	7100007f 	cmp	w3, #0x0
  b3d74c:	2a0103e0 	mov	w0, w1
  b3d750:	54004ca1 	b.ne	b3e0e4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2334cc>
  b3d754:	b9400380 	ldr	w0, [x28]
  b3d758:	34000200 	cbz	w0, b3d798 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232b80>
  b3d75c:	f9404fe0 	ldr	x0, [sp,#152]
  b3d760:	f90037e0 	str	x0, [sp,#104]
  b3d764:	b40001a0 	cbz	x0, b3d798 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232b80>
  b3d768:	aa1803e0 	mov	x0, x24
  b3d76c:	52800021 	mov	w1, #0x1                   	// #1
  b3d770:	97f7d066 	bl	931908 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26cf0>
  b3d774:	f9400e73 	ldr	x19, [x19,#24]
  b3d778:	f94037e0 	ldr	x0, [sp,#104]
  b3d77c:	f9400261 	ldr	x1, [x19]
  b3d780:	f9402038 	ldr	x24, [x1,#64]
  b3d784:	9427d33f 	bl	1532480 <_ZNSt15recursive_mutex4lockEv@@Base+0xa68d8>
  b3d788:	2a0003e2 	mov	w2, w0
  b3d78c:	aa1503e1 	mov	x1, x21
  b3d790:	aa1303e0 	mov	x0, x19
  b3d794:	d63f0300 	blr	x24
  b3d798:	9000dec0 	adrp	x0, 2715000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1521a8>
  b3d79c:	f9440413 	ldr	x19, [x0,#2056]
  b3d7a0:	b4003833 	cbz	x19, b3dea4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23328c>
  b3d7a4:	885fff80 	ldaxr	w0, [x28]
  b3d7a8:	51000401 	sub	w1, w0, #0x1
  b3d7ac:	8802ff81 	stlxr	w2, w1, [x28]
  b3d7b0:	35ffffa2 	cbnz	w2, b3d7a4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232b8c>
  b3d7b4:	7100041f 	cmp	w0, #0x1
  b3d7b8:	54001560 	b.eq	b3da64 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232e4c>
  b3d7bc:	f94053e0 	ldr	x0, [sp,#160]
  b3d7c0:	b4000120 	cbz	x0, b3d7e4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232bcc>
  b3d7c4:	b4003793 	cbz	x19, b3deb4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23329c>
  b3d7c8:	91003002 	add	x2, x0, #0xc
  b3d7cc:	885ffc41 	ldaxr	w1, [x2]
  b3d7d0:	51000423 	sub	w3, w1, #0x1
  b3d7d4:	8804fc43 	stlxr	w4, w3, [x2]
  b3d7d8:	35ffffa4 	cbnz	w4, b3d7cc <_ZSt20__throw_bad_weak_ptrv@@Base+0x232bb4>
  b3d7dc:	7100043f 	cmp	w1, #0x1
  b3d7e0:	540016a0 	b.eq	b3dab4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232e9c>
  b3d7e4:	b4003333 	cbz	x19, b3de48 <_ZSt20__throw_bad_weak_ptrv@@Base+0x233230>
  b3d7e8:	885fff60 	ldaxr	w0, [x27]
  b3d7ec:	51000401 	sub	w1, w0, #0x1
  b3d7f0:	8802ff61 	stlxr	w2, w1, [x27]
  b3d7f4:	35ffffa2 	cbnz	w2, b3d7e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232bd0>
  b3d7f8:	7100041f 	cmp	w0, #0x1
  b3d7fc:	540010c0 	b.eq	b3da14 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232dfc>
  b3d800:	f9404be0 	ldr	x0, [sp,#144]
  b3d804:	b4000160 	cbz	x0, b3d830 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232c18>
  b3d808:	9000dec1 	adrp	x1, 2715000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1521a8>
  b3d80c:	f9440421 	ldr	x1, [x1,#2056]
  b3d810:	b4003141 	cbz	x1, b3de38 <_ZSt20__throw_bad_weak_ptrv@@Base+0x233220>
  b3d814:	91003002 	add	x2, x0, #0xc
  b3d818:	885ffc41 	ldaxr	w1, [x2]
  b3d81c:	51000423 	sub	w3, w1, #0x1
  b3d820:	8804fc43 	stlxr	w4, w3, [x2]
  b3d824:	35ffffa4 	cbnz	w4, b3d818 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232c00>
  b3d828:	7100043f 	cmp	w1, #0x1
  b3d82c:	54003160 	b.eq	b3de58 <_ZSt20__throw_bad_weak_ptrv@@Base+0x233240>
  b3d830:	aa1703e0 	mov	x0, x23
  b3d834:	945efb73 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d838:	aa1603e0 	mov	x0, x22
  b3d83c:	945efb71 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d840:	91004280 	add	x0, x20, #0x10
  b3d844:	945efb6f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d848:	91002280 	add	x0, x20, #0x8
  b3d84c:	945efb6d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d850:	9101c3e0 	add	x0, sp, #0x70
  b3d854:	94619b67 	bl	23a45f0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2f1d0>
  b3d858:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3d85c:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3d860:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3d864:	17fffe9d 	b	b3d2d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2326c0>
  b3d868:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3d86c:	910263fa 	add	x26, sp, #0x98
  b3d870:	aa1a03e0 	mov	x0, x26
  b3d874:	9000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3d878:	9136a021 	add	x1, x1, #0xda8
  b3d87c:	945fd919 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3d880:	910223fb 	add	x27, sp, #0x88
  b3d884:	f000dea1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3d888:	911d4021 	add	x1, x1, #0x750
  b3d88c:	9100a021 	add	x1, x1, #0x28
  b3d890:	aa1a03e0 	mov	x0, x26
  b3d894:	aa1b03e8 	mov	x8, x27
  b3d898:	945f58d6 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3d89c:	a90363f7 	stp	x23, x24, [sp,#48]
  b3d8a0:	910203f7 	add	x23, sp, #0x80
  b3d8a4:	d000e461 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3d8a8:	aa1703e8 	mov	x8, x23
  b3d8ac:	91366021 	add	x1, x1, #0xd98
  b3d8b0:	aa1b03e0 	mov	x0, x27
  b3d8b4:	945f58cf 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3d8b8:	9102a3f4 	add	x20, sp, #0xa8
  b3d8bc:	b000d421 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3d8c0:	aa1403e0 	mov	x0, x20
  b3d8c4:	912e6021 	add	x1, x1, #0xb98
  b3d8c8:	945fd906 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3d8cc:	9101e3f6 	add	x22, sp, #0x78
  b3d8d0:	aa1403e1 	mov	x1, x20
  b3d8d4:	aa1603e8 	mov	x8, x22
  b3d8d8:	aa1703e0 	mov	x0, x23
  b3d8dc:	945f586d 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3d8e0:	52800022 	mov	w2, #0x1                   	// #1
  b3d8e4:	52800001 	mov	w1, #0x0                   	// #0
  b3d8e8:	aa1603e0 	mov	x0, x22
  b3d8ec:	945b0abd 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3d8f0:	aa1603e0 	mov	x0, x22
  b3d8f4:	945efb43 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d8f8:	aa1403e0 	mov	x0, x20
  b3d8fc:	945efb41 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d900:	aa1703e0 	mov	x0, x23
  b3d904:	945efb3f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d908:	aa1b03e0 	mov	x0, x27
  b3d90c:	945efb3d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d910:	aa1a03e0 	mov	x0, x26
  b3d914:	945efb3b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  b3d918:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3d91c:	a94363f7 	ldp	x23, x24, [sp,#48]
  b3d920:	a9446bf9 	ldp	x25, x26, [sp,#64]
  b3d924:	17fffe6d 	b	b3d2d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2326c0>
  b3d928:	f9402a60 	ldr	x0, [x19,#80]
  b3d92c:	b4ffdea0 	cbz	x0, b3d500 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2328e8>
  b3d930:	90018036 	adrp	x22, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3d934:	9123e2d6 	add	x22, x22, #0x8f8
  b3d938:	08dffec0 	ldarb	w0, [x22]
  b3d93c:	36002c40 	tbz	w0, #0, b3dec4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2332ac>
  b3d940:	90018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3d944:	91240294 	add	x20, x20, #0x900
  b3d948:	b9801a81 	ldrsw	x1, [x20,#24]
  b3d94c:	f9402a62 	ldr	x2, [x19,#80]
  b3d950:	f9400683 	ldr	x3, [x20,#8]
  b3d954:	9ac10840 	udiv	x0, x2, x1
  b3d958:	9b018800 	msub	x0, x0, x1, x2
  b3d95c:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b3d960:	b5000080 	cbnz	x0, b3d970 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232d58>
  b3d964:	140001a9 	b	b3e008 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2333f0>
  b3d968:	f9400800 	ldr	x0, [x0,#16]
  b3d96c:	b40034e0 	cbz	x0, b3e008 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2333f0>
  b3d970:	f9400001 	ldr	x1, [x0]
  b3d974:	eb01005f 	cmp	x2, x1
  b3d978:	54ffff81 	b.ne	b3d968 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232d50>
  b3d97c:	f9400417 	ldr	x23, [x0,#8]
  b3d980:	b4003457 	cbz	x23, b3e008 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2333f0>
  b3d984:	f0018074 	adrp	x20, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3d988:	9117c294 	add	x20, x20, #0x5f0
  b3d98c:	08dffe80 	ldarb	w0, [x20]
  b3d990:	36003000 	tbz	w0, #0, b3df90 <_ZSt20__throw_bad_weak_ptrv@@Base+0x233378>
  b3d994:	08dffe80 	ldarb	w0, [x20]
  b3d998:	36002c80 	tbz	w0, #0, b3df28 <_ZSt20__throw_bad_weak_ptrv@@Base+0x233310>
  b3d99c:	f0018060 	adrp	x0, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3d9a0:	91188001 	add	x1, x0, #0x620
  b3d9a4:	88dffc22 	ldar	w2, [x1]
  b3d9a8:	37f80322 	tbnz	w2, #31, b3da0c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232df4>
  b3d9ac:	11000443 	add	w3, w2, #0x1
  b3d9b0:	885ffc24 	ldaxr	w4, [x1]
  b3d9b4:	6b02009f 	cmp	w4, w2
  b3d9b8:	54000061 	b.ne	b3d9c4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232dac>
  b3d9bc:	8805fc23 	stlxr	w5, w3, [x1]
  b3d9c0:	35ffff85 	cbnz	w5, b3d9b0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232d98>
  b3d9c4:	54ffff01 	b.ne	b3d9a4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232d8c>
  b3d9c8:	f0018061 	adrp	x1, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3d9cc:	9117e021 	add	x1, x1, #0x5f8
  b3d9d0:	b9801822 	ldrsw	x2, [x1,#24]
  b3d9d4:	f9400423 	ldr	x3, [x1,#8]
  b3d9d8:	9ac20ae1 	udiv	x1, x23, x2
  b3d9dc:	9b02dc21 	msub	x1, x1, x2, x23
  b3d9e0:	f861d875 	ldr	x21, [x3,w1,sxtw #3]
  b3d9e4:	b5000095 	cbnz	x21, b3d9f4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232ddc>
  b3d9e8:	14000007 	b	b3da04 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232dec>
  b3d9ec:	f9400ab5 	ldr	x21, [x21,#16]
  b3d9f0:	b40000b5 	cbz	x21, b3da04 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232dec>
  b3d9f4:	f94002a1 	ldr	x1, [x21]
  b3d9f8:	eb0102ff 	cmp	x23, x1
  b3d9fc:	54ffff81 	b.ne	b3d9ec <_ZSt20__throw_bad_weak_ptrv@@Base+0x232dd4>
  b3da00:	f94006b5 	ldr	x21, [x21,#8]
  b3da04:	91188000 	add	x0, x0, #0x620
  b3da08:	97ed1a9e 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3da0c:	f9002675 	str	x21, [x19,#72]
  b3da10:	17fffebc 	b	b3d500 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2328e8>
  b3da14:	f9400321 	ldr	x1, [x25]
  b3da18:	f0ffee60 	adrp	x0, 90c000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x13e8>
  b3da1c:	911cc000 	add	x0, x0, #0x730
  b3da20:	f9400821 	ldr	x1, [x1,#16]
  b3da24:	eb00003f 	cmp	x1, x0
  b3da28:	54000581 	b.ne	b3dad8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232ec0>
  b3da2c:	b4002e73 	cbz	x19, b3dff8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2333e0>
  b3da30:	91003321 	add	x1, x25, #0xc
  b3da34:	885ffc20 	ldaxr	w0, [x1]
  b3da38:	51000402 	sub	w2, w0, #0x1
  b3da3c:	8803fc22 	stlxr	w3, w2, [x1]
  b3da40:	35ffffa3 	cbnz	w3, b3da34 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232e1c>
  b3da44:	7100041f 	cmp	w0, #0x1
  b3da48:	54ffedc1 	b.ne	b3d800 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232be8>
  b3da4c:	f9400321 	ldr	x1, [x25]
  b3da50:	aa1903e0 	mov	x0, x25
  b3da54:	f9400c21 	ldr	x1, [x1,#24]
  b3da58:	d63f0020 	blr	x1
  b3da5c:	f9404be0 	ldr	x0, [sp,#144]
  b3da60:	17ffff69 	b	b3d804 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232bec>
  b3da64:	f9400341 	ldr	x1, [x26]
  b3da68:	f0ffee60 	adrp	x0, 90c000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x13e8>
  b3da6c:	911cc000 	add	x0, x0, #0x730
  b3da70:	f9400821 	ldr	x1, [x1,#16]
  b3da74:	eb00003f 	cmp	x1, x0
  b3da78:	54000361 	b.ne	b3dae4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232ecc>
  b3da7c:	b40031f3 	cbz	x19, b3e0b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2334a0>
  b3da80:	91003341 	add	x1, x26, #0xc
  b3da84:	885ffc20 	ldaxr	w0, [x1]
  b3da88:	51000402 	sub	w2, w0, #0x1
  b3da8c:	8803fc22 	stlxr	w3, w2, [x1]
  b3da90:	35ffffa3 	cbnz	w3, b3da84 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232e6c>
  b3da94:	7100041f 	cmp	w0, #0x1
  b3da98:	54ffe921 	b.ne	b3d7bc <_ZSt20__throw_bad_weak_ptrv@@Base+0x232ba4>
  b3da9c:	f9400341 	ldr	x1, [x26]
  b3daa0:	aa1a03e0 	mov	x0, x26
  b3daa4:	f9400c21 	ldr	x1, [x1,#24]
  b3daa8:	d63f0020 	blr	x1
  b3daac:	f94053e0 	ldr	x0, [sp,#160]
  b3dab0:	17ffff44 	b	b3d7c0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232ba8>
  b3dab4:	f9400003 	ldr	x3, [x0]
  b3dab8:	f0ffee61 	adrp	x1, 90c000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x13e8>
  b3dabc:	911ce021 	add	x1, x1, #0x738
  b3dac0:	f9400c62 	ldr	x2, [x3,#24]
  b3dac4:	eb01005f 	cmp	x2, x1
  b3dac8:	54003041 	b.ne	b3e0d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2334b8>
  b3dacc:	f9400461 	ldr	x1, [x3,#8]
  b3dad0:	d63f0020 	blr	x1
  b3dad4:	17ffff44 	b	b3d7e4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232bcc>
  b3dad8:	aa1903e0 	mov	x0, x25
  b3dadc:	d63f0020 	blr	x1
  b3dae0:	17ffffd3 	b	b3da2c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232e14>
  b3dae4:	aa1a03e0 	mov	x0, x26
  b3dae8:	d63f0020 	blr	x1
  b3daec:	17ffffe4 	b	b3da7c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232e64>
  b3daf0:	911ce000 	add	x0, x0, #0x738
  b3daf4:	97ed1a63 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3daf8:	f9000e7f 	str	xzr, [x19,#24]
  b3dafc:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3db00:	17fffe78 	b	b3d4e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2328c8>
  b3db04:	aa1503e0 	mov	x0, x21
  b3db08:	90018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3db0c:	97e3a1d5 	bl	426260 <__cxa_guard_acquire@plt>
  b3db10:	91240294 	add	x20, x20, #0x900
  b3db14:	34ffbfc0 	cbz	w0, b3d30c <_ZSt20__throw_bad_weak_ptrv@@Base+0x2326f4>
  b3db18:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3db1c:	b900229f 	str	wzr, [x20,#32]
  b3db20:	97e39d2c 	bl	424fd0 <malloc@plt>
  b3db24:	f9000680 	str	x0, [x20,#8]
  b3db28:	52801304 	mov	w4, #0x98                  	// #152
  b3db2c:	52800ca3 	mov	w3, #0x65                  	// #101
  b3db30:	b9001284 	str	w4, [x20,#16]
  b3db34:	d2806502 	mov	x2, #0x328                 	// #808
  b3db38:	b9001a83 	str	w3, [x20,#24]
  b3db3c:	52800001 	mov	w1, #0x0                   	// #0
  b3db40:	97e39aac 	bl	4245f0 <memset@plt>
  b3db44:	aa1503e0 	mov	x0, x21
  b3db48:	97e3a33e 	bl	426840 <__cxa_guard_release@plt>
  b3db4c:	aa1403e1 	mov	x1, x20
  b3db50:	b0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3db54:	d0ffd9e0 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b3db58:	9135a042 	add	x2, x2, #0xd68
  b3db5c:	91126000 	add	x0, x0, #0x498
  b3db60:	97e3a4d4 	bl	426eb0 <__cxa_atexit@plt>
  b3db64:	17fffdea 	b	b3d30c <_ZSt20__throw_bad_weak_ptrv@@Base+0x2326f4>
  b3db68:	a9046bf9 	stp	x25, x26, [sp,#64]
  b3db6c:	910263fa 	add	x26, sp, #0x98
  b3db70:	aa1a03e0 	mov	x0, x26
  b3db74:	9000d421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  b3db78:	9136a021 	add	x1, x1, #0xda8
  b3db7c:	945fd859 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3db80:	910223fb 	add	x27, sp, #0x88
  b3db84:	f000dea1 	adrp	x1, 2714000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1511a8>
  b3db88:	911d4021 	add	x1, x1, #0x750
  b3db8c:	91040021 	add	x1, x1, #0x100
  b3db90:	aa1a03e0 	mov	x0, x26
  b3db94:	aa1b03e8 	mov	x8, x27
  b3db98:	945f5816 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3db9c:	a90363f7 	stp	x23, x24, [sp,#48]
  b3dba0:	910203f7 	add	x23, sp, #0x80
  b3dba4:	d000e461 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  b3dba8:	aa1703e8 	mov	x8, x23
  b3dbac:	91366021 	add	x1, x1, #0xd98
  b3dbb0:	aa1b03e0 	mov	x0, x27
  b3dbb4:	945f580f 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  b3dbb8:	9102a3f4 	add	x20, sp, #0xa8
  b3dbbc:	b000d421 	adrp	x1, 25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x14d0>
  b3dbc0:	aa1403e0 	mov	x0, x20
  b3dbc4:	912e6021 	add	x1, x1, #0xb98
  b3dbc8:	945fd846 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  b3dbcc:	9101e3f6 	add	x22, sp, #0x78
  b3dbd0:	aa1403e1 	mov	x1, x20
  b3dbd4:	aa1603e8 	mov	x8, x22
  b3dbd8:	aa1703e0 	mov	x0, x23
  b3dbdc:	945f57ad 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  b3dbe0:	52800022 	mov	w2, #0x1                   	// #1
  b3dbe4:	52800001 	mov	w1, #0x0                   	// #0
  b3dbe8:	aa1603e0 	mov	x0, x22
  b3dbec:	945b09fd 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  b3dbf0:	17ffff40 	b	b3d8f0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232cd8>
  b3dbf4:	aa1403e0 	mov	x0, x20
  b3dbf8:	97e3a19a 	bl	426260 <__cxa_guard_acquire@plt>
  b3dbfc:	34ffbae0 	cbz	w0, b3d358 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232740>
  b3dc00:	f0018075 	adrp	x21, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3dc04:	911c42b5 	add	x21, x21, #0x710
  b3dc08:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3dc0c:	b90022bf 	str	wzr, [x21,#32]
  b3dc10:	97e39cf0 	bl	424fd0 <malloc@plt>
  b3dc14:	f90006a0 	str	x0, [x21,#8]
  b3dc18:	52801304 	mov	w4, #0x98                  	// #152
  b3dc1c:	52800ca3 	mov	w3, #0x65                  	// #101
  b3dc20:	b90012a4 	str	w4, [x21,#16]
  b3dc24:	d2806502 	mov	x2, #0x328                 	// #808
  b3dc28:	b9001aa3 	str	w3, [x21,#24]
  b3dc2c:	52800001 	mov	w1, #0x0                   	// #0
  b3dc30:	97e39a70 	bl	4245f0 <memset@plt>
  b3dc34:	b9002abf 	str	wzr, [x21,#40]
  b3dc38:	aa1403e0 	mov	x0, x20
  b3dc3c:	97e3a301 	bl	426840 <__cxa_guard_release@plt>
  b3dc40:	b0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3dc44:	aa1503e1 	mov	x1, x21
  b3dc48:	9135a042 	add	x2, x2, #0xd68
  b3dc4c:	f0ffe380 	adrp	x0, 7b0000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb7258>
  b3dc50:	91292000 	add	x0, x0, #0xa48
  b3dc54:	97e3a497 	bl	426eb0 <__cxa_atexit@plt>
  b3dc58:	17fffdc0 	b	b3d358 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232740>
  b3dc5c:	aa1403e0 	mov	x0, x20
  b3dc60:	97e3a180 	bl	426260 <__cxa_guard_acquire@plt>
  b3dc64:	34ffb7e0 	cbz	w0, b3d360 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232748>
  b3dc68:	f0018075 	adrp	x21, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3dc6c:	911c42b5 	add	x21, x21, #0x710
  b3dc70:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3dc74:	b90022bf 	str	wzr, [x21,#32]
  b3dc78:	97e39cd6 	bl	424fd0 <malloc@plt>
  b3dc7c:	f90006a0 	str	x0, [x21,#8]
  b3dc80:	52801304 	mov	w4, #0x98                  	// #152
  b3dc84:	52800ca3 	mov	w3, #0x65                  	// #101
  b3dc88:	b90012a4 	str	w4, [x21,#16]
  b3dc8c:	d2806502 	mov	x2, #0x328                 	// #808
  b3dc90:	b9001aa3 	str	w3, [x21,#24]
  b3dc94:	52800001 	mov	w1, #0x0                   	// #0
  b3dc98:	97e39a56 	bl	4245f0 <memset@plt>
  b3dc9c:	b9002abf 	str	wzr, [x21,#40]
  b3dca0:	aa1403e0 	mov	x0, x20
  b3dca4:	97e3a2e7 	bl	426840 <__cxa_guard_release@plt>
  b3dca8:	b0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3dcac:	aa1503e1 	mov	x1, x21
  b3dcb0:	9135a042 	add	x2, x2, #0xd68
  b3dcb4:	f0ffe380 	adrp	x0, 7b0000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xb7258>
  b3dcb8:	91292000 	add	x0, x0, #0xa48
  b3dcbc:	97e3a47d 	bl	426eb0 <__cxa_atexit@plt>
  b3dcc0:	17fffda8 	b	b3d360 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232748>
  b3dcc4:	911c0000 	add	x0, x0, #0x700
  b3dcc8:	97ed19ee 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3dccc:	f900167f 	str	xzr, [x19,#40]
  b3dcd0:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3dcd4:	17fffe03 	b	b3d4e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2328c8>
  b3dcd8:	aa1503e0 	mov	x0, x21
  b3dcdc:	90018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3dce0:	97e3a160 	bl	426260 <__cxa_guard_acquire@plt>
  b3dce4:	91240294 	add	x20, x20, #0x900
  b3dce8:	34ffb940 	cbz	w0, b3d410 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2327f8>
  b3dcec:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3dcf0:	b900229f 	str	wzr, [x20,#32]
  b3dcf4:	97e39cb7 	bl	424fd0 <malloc@plt>
  b3dcf8:	f9000680 	str	x0, [x20,#8]
  b3dcfc:	52801304 	mov	w4, #0x98                  	// #152
  b3dd00:	52800ca3 	mov	w3, #0x65                  	// #101
  b3dd04:	b9001284 	str	w4, [x20,#16]
  b3dd08:	d2806502 	mov	x2, #0x328                 	// #808
  b3dd0c:	b9001a83 	str	w3, [x20,#24]
  b3dd10:	52800001 	mov	w1, #0x0                   	// #0
  b3dd14:	97e39a37 	bl	4245f0 <memset@plt>
  b3dd18:	aa1503e0 	mov	x0, x21
  b3dd1c:	97e3a2c9 	bl	426840 <__cxa_guard_release@plt>
  b3dd20:	aa1403e1 	mov	x1, x20
  b3dd24:	b0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3dd28:	d0ffd9e0 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b3dd2c:	9135a042 	add	x2, x2, #0xd68
  b3dd30:	91126000 	add	x0, x0, #0x498
  b3dd34:	97e3a45f 	bl	426eb0 <__cxa_atexit@plt>
  b3dd38:	17fffdb6 	b	b3d410 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2327f8>
  b3dd3c:	aa1403e0 	mov	x0, x20
  b3dd40:	97e3a148 	bl	426260 <__cxa_guard_acquire@plt>
  b3dd44:	34ffb8c0 	cbz	w0, b3d45c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232844>
  b3dd48:	f0018075 	adrp	x21, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3dd4c:	911b62b5 	add	x21, x21, #0x6d8
  b3dd50:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3dd54:	b90022bf 	str	wzr, [x21,#32]
  b3dd58:	97e39c9e 	bl	424fd0 <malloc@plt>
  b3dd5c:	f90006a0 	str	x0, [x21,#8]
  b3dd60:	52801304 	mov	w4, #0x98                  	// #152
  b3dd64:	52800ca3 	mov	w3, #0x65                  	// #101
  b3dd68:	b90012a4 	str	w4, [x21,#16]
  b3dd6c:	d2806502 	mov	x2, #0x328                 	// #808
  b3dd70:	b9001aa3 	str	w3, [x21,#24]
  b3dd74:	52800001 	mov	w1, #0x0                   	// #0
  b3dd78:	97e39a1e 	bl	4245f0 <memset@plt>
  b3dd7c:	b9002abf 	str	wzr, [x21,#40]
  b3dd80:	aa1403e0 	mov	x0, x20
  b3dd84:	97e3a2af 	bl	426840 <__cxa_guard_release@plt>
  b3dd88:	b0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3dd8c:	aa1503e1 	mov	x1, x21
  b3dd90:	9135a042 	add	x2, x2, #0xd68
  b3dd94:	f0ffe3a0 	adrp	x0, 7b4000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xbb258>
  b3dd98:	91278000 	add	x0, x0, #0x9e0
  b3dd9c:	97e3a445 	bl	426eb0 <__cxa_atexit@plt>
  b3dda0:	17fffdaf 	b	b3d45c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232844>
  b3dda4:	aa1403e0 	mov	x0, x20
  b3dda8:	97e3a12e 	bl	426260 <__cxa_guard_acquire@plt>
  b3ddac:	34ffb5c0 	cbz	w0, b3d464 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23284c>
  b3ddb0:	f0018075 	adrp	x21, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3ddb4:	911b62b5 	add	x21, x21, #0x6d8
  b3ddb8:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3ddbc:	b90022bf 	str	wzr, [x21,#32]
  b3ddc0:	97e39c84 	bl	424fd0 <malloc@plt>
  b3ddc4:	f90006a0 	str	x0, [x21,#8]
  b3ddc8:	52801304 	mov	w4, #0x98                  	// #152
  b3ddcc:	52800ca3 	mov	w3, #0x65                  	// #101
  b3ddd0:	b90012a4 	str	w4, [x21,#16]
  b3ddd4:	d2806502 	mov	x2, #0x328                 	// #808
  b3ddd8:	b9001aa3 	str	w3, [x21,#24]
  b3dddc:	52800001 	mov	w1, #0x0                   	// #0
  b3dde0:	97e39a04 	bl	4245f0 <memset@plt>
  b3dde4:	b9002abf 	str	wzr, [x21,#40]
  b3dde8:	aa1403e0 	mov	x0, x20
  b3ddec:	97e3a295 	bl	426840 <__cxa_guard_release@plt>
  b3ddf0:	b0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3ddf4:	aa1503e1 	mov	x1, x21
  b3ddf8:	9135a042 	add	x2, x2, #0xd68
  b3ddfc:	f0ffe3a0 	adrp	x0, 7b4000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xbb258>
  b3de00:	91278000 	add	x0, x0, #0x9e0
  b3de04:	97e3a42b 	bl	426eb0 <__cxa_atexit@plt>
  b3de08:	17fffd97 	b	b3d464 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23284c>
  b3de0c:	9000dec0 	adrp	x0, 2715000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1521a8>
  b3de10:	f9440413 	ldr	x19, [x0,#2056]
  b3de14:	17fffe74 	b	b3d7e4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232bcc>
  b3de18:	aa0203e0 	mov	x0, x2
  b3de1c:	97ed1999 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3de20:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3de24:	f9000e7f 	str	xzr, [x19,#24]
  b3de28:	17fffd2c 	b	b3d2d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2326c0>
  b3de2c:	f9404bf9 	ldr	x25, [sp,#144]
  b3de30:	aa1903e0 	mov	x0, x25
  b3de34:	17fffe74 	b	b3d804 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232bec>
  b3de38:	b9400c01 	ldr	w1, [x0,#12]
  b3de3c:	51000422 	sub	w2, w1, #0x1
  b3de40:	b9000c02 	str	w2, [x0,#12]
  b3de44:	17fffe79 	b	b3d828 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232c10>
  b3de48:	b9400b20 	ldr	w0, [x25,#8]
  b3de4c:	51000401 	sub	w1, w0, #0x1
  b3de50:	b9000b21 	str	w1, [x25,#8]
  b3de54:	17fffe69 	b	b3d7f8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232be0>
  b3de58:	f9400003 	ldr	x3, [x0]
  b3de5c:	f0ffee61 	adrp	x1, 90c000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x13e8>
  b3de60:	911ce021 	add	x1, x1, #0x738
  b3de64:	f9400c62 	ldr	x2, [x3,#24]
  b3de68:	eb01005f 	cmp	x2, x1
  b3de6c:	540012e1 	b.ne	b3e0c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2334b0>
  b3de70:	f9400461 	ldr	x1, [x3,#8]
  b3de74:	d63f0020 	blr	x1
  b3de78:	17fffe6e 	b	b3d830 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232c18>
  b3de7c:	f94053fa 	ldr	x26, [sp,#160]
  b3de80:	9000dec1 	adrp	x1, 2715000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1521a8>
  b3de84:	aa1a03e0 	mov	x0, x26
  b3de88:	f9440433 	ldr	x19, [x1,#2056]
  b3de8c:	17fffe4d 	b	b3d7c0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232ba8>
  b3de90:	aa0203e0 	mov	x0, x2
  b3de94:	97ed197b 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
  b3de98:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b3de9c:	f900167f 	str	xzr, [x19,#40]
  b3dea0:	17fffd0e 	b	b3d2d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x2326c0>
  b3dea4:	b9400b40 	ldr	w0, [x26,#8]
  b3dea8:	51000401 	sub	w1, w0, #0x1
  b3deac:	b9000b41 	str	w1, [x26,#8]
  b3deb0:	17fffe41 	b	b3d7b4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232b9c>
  b3deb4:	b9400c01 	ldr	w1, [x0,#12]
  b3deb8:	51000422 	sub	w2, w1, #0x1
  b3debc:	b9000c02 	str	w2, [x0,#12]
  b3dec0:	17fffe47 	b	b3d7dc <_ZSt20__throw_bad_weak_ptrv@@Base+0x232bc4>
  b3dec4:	aa1603e0 	mov	x0, x22
  b3dec8:	90018034 	adrp	x20, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b3decc:	97e3a0e5 	bl	426260 <__cxa_guard_acquire@plt>
  b3ded0:	91240294 	add	x20, x20, #0x900
  b3ded4:	34ffd3a0 	cbz	w0, b3d948 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232d30>
  b3ded8:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3dedc:	b900229f 	str	wzr, [x20,#32]
  b3dee0:	97e39c3c 	bl	424fd0 <malloc@plt>
  b3dee4:	f9000680 	str	x0, [x20,#8]
  b3dee8:	52801304 	mov	w4, #0x98                  	// #152
  b3deec:	52800ca3 	mov	w3, #0x65                  	// #101
  b3def0:	b9001284 	str	w4, [x20,#16]
  b3def4:	d2806502 	mov	x2, #0x328                 	// #808
  b3def8:	b9001a83 	str	w3, [x20,#24]
  b3defc:	52800001 	mov	w1, #0x0                   	// #0
  b3df00:	97e399bc 	bl	4245f0 <memset@plt>
  b3df04:	aa1603e0 	mov	x0, x22
  b3df08:	97e3a24e 	bl	426840 <__cxa_guard_release@plt>
  b3df0c:	aa1403e1 	mov	x1, x20
  b3df10:	b0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3df14:	d0ffd9e0 	adrp	x0, 67b000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x6d28>
  b3df18:	9135a042 	add	x2, x2, #0xd68
  b3df1c:	91126000 	add	x0, x0, #0x498
  b3df20:	97e3a3e4 	bl	426eb0 <__cxa_atexit@plt>
  b3df24:	17fffe89 	b	b3d948 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232d30>
  b3df28:	aa1403e0 	mov	x0, x20
  b3df2c:	97e3a0cd 	bl	426260 <__cxa_guard_acquire@plt>
  b3df30:	34ffd360 	cbz	w0, b3d99c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232d84>
  b3df34:	f0018076 	adrp	x22, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3df38:	9117e2d6 	add	x22, x22, #0x5f8
  b3df3c:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3df40:	b90022df 	str	wzr, [x22,#32]
  b3df44:	97e39c23 	bl	424fd0 <malloc@plt>
  b3df48:	f90006c0 	str	x0, [x22,#8]
  b3df4c:	52801304 	mov	w4, #0x98                  	// #152
  b3df50:	52800ca3 	mov	w3, #0x65                  	// #101
  b3df54:	b90012c4 	str	w4, [x22,#16]
  b3df58:	d2806502 	mov	x2, #0x328                 	// #808
  b3df5c:	b9001ac3 	str	w3, [x22,#24]
  b3df60:	52800001 	mov	w1, #0x0                   	// #0
  b3df64:	97e399a3 	bl	4245f0 <memset@plt>
  b3df68:	b9002adf 	str	wzr, [x22,#40]
  b3df6c:	aa1403e0 	mov	x0, x20
  b3df70:	97e3a234 	bl	426840 <__cxa_guard_release@plt>
  b3df74:	b0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3df78:	aa1603e1 	mov	x1, x22
  b3df7c:	9135a042 	add	x2, x2, #0xd68
  b3df80:	f0ffe3a0 	adrp	x0, 7b4000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xbb258>
  b3df84:	9122e000 	add	x0, x0, #0x8b8
  b3df88:	97e3a3ca 	bl	426eb0 <__cxa_atexit@plt>
  b3df8c:	17fffe84 	b	b3d99c <_ZSt20__throw_bad_weak_ptrv@@Base+0x232d84>
  b3df90:	aa1403e0 	mov	x0, x20
  b3df94:	97e3a0b3 	bl	426260 <__cxa_guard_acquire@plt>
  b3df98:	34ffcfe0 	cbz	w0, b3d994 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232d7c>
  b3df9c:	f0018076 	adrp	x22, 3b4c000 <stdout@@GLIBC_2.17+0xaf40>
  b3dfa0:	9117e2d6 	add	x22, x22, #0x5f8
  b3dfa4:	d2809800 	mov	x0, #0x4c0                 	// #1216
  b3dfa8:	b90022df 	str	wzr, [x22,#32]
  b3dfac:	97e39c09 	bl	424fd0 <malloc@plt>
  b3dfb0:	f90006c0 	str	x0, [x22,#8]
  b3dfb4:	52801304 	mov	w4, #0x98                  	// #152
  b3dfb8:	52800ca3 	mov	w3, #0x65                  	// #101
  b3dfbc:	b90012c4 	str	w4, [x22,#16]
  b3dfc0:	d2806502 	mov	x2, #0x328                 	// #808
  b3dfc4:	b9001ac3 	str	w3, [x22,#24]
  b3dfc8:	52800001 	mov	w1, #0x0                   	// #0
  b3dfcc:	97e39989 	bl	4245f0 <memset@plt>
  b3dfd0:	b9002adf 	str	wzr, [x22,#40]
  b3dfd4:	aa1403e0 	mov	x0, x20
  b3dfd8:	97e3a21a 	bl	426840 <__cxa_guard_release@plt>
  b3dfdc:	b0017f42 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  b3dfe0:	aa1603e1 	mov	x1, x22
  b3dfe4:	9135a042 	add	x2, x2, #0xd68
  b3dfe8:	f0ffe3a0 	adrp	x0, 7b4000 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0xbb258>
  b3dfec:	9122e000 	add	x0, x0, #0x8b8
  b3dff0:	97e3a3b0 	bl	426eb0 <__cxa_atexit@plt>
  b3dff4:	17fffe68 	b	b3d994 <_ZSt20__throw_bad_weak_ptrv@@Base+0x232d7c>
  b3dff8:	b9400f20 	ldr	w0, [x25,#12]
  b3dffc:	51000401 	sub	w1, w0, #0x1
