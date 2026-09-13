
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021fc270 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74158>:
 21fc270:	a9b57bfd 	stp	x29, x30, [sp,#-176]!
 21fc274:	910003fd 	mov	x29, sp
 21fc278:	a90153f3 	stp	x19, x20, [sp,#16]
 21fc27c:	aa0003f3 	mov	x19, x0
 21fc280:	f9400400 	ldr	x0, [x0,#8]
 21fc284:	b40000c0 	cbz	x0, 21fc29c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74184>
 21fc288:	f9400a62 	ldr	x2, [x19,#16]
 21fc28c:	b4000082 	cbz	x2, 21fc29c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74184>
 21fc290:	f9401842 	ldr	x2, [x2,#48]
 21fc294:	eb00005f 	cmp	x2, x0
 21fc298:	54000560 	b.eq	21fc344 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x7422c>
 21fc29c:	910163e0 	add	x0, sp, #0x58
 21fc2a0:	b0001e21 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 21fc2a4:	9136a021 	add	x1, x1, #0xda8
 21fc2a8:	9404de8e 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21fc2ac:	b0006341 	adrp	x1, 2e65000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a21a8>
 21fc2b0:	9117e021 	add	x1, x1, #0x5f8
 21fc2b4:	910f8021 	add	x1, x1, #0x3e0
 21fc2b8:	910163e0 	add	x0, sp, #0x58
 21fc2bc:	910183e8 	add	x8, sp, #0x60
 21fc2c0:	94045e4c 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 21fc2c4:	f0002e61 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 21fc2c8:	9101a3e8 	add	x8, sp, #0x68
 21fc2cc:	91366021 	add	x1, x1, #0xd98
 21fc2d0:	910183e0 	add	x0, sp, #0x60
 21fc2d4:	94045e47 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 21fc2d8:	d0006341 	adrp	x1, 2e66000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a31a8>
 21fc2dc:	9101c3e0 	add	x0, sp, #0x70
 21fc2e0:	911ac021 	add	x1, x1, #0x6b0
 21fc2e4:	9404de7f 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21fc2e8:	9101e3f3 	add	x19, sp, #0x78
 21fc2ec:	9101c3e1 	add	x1, sp, #0x70
 21fc2f0:	aa1303e8 	mov	x8, x19
 21fc2f4:	9101a3e0 	add	x0, sp, #0x68
 21fc2f8:	94045de6 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 21fc2fc:	52800022 	mov	w2, #0x1                   	// #1
 21fc300:	52800001 	mov	w1, #0x0                   	// #0
 21fc304:	aa1303e0 	mov	x0, x19
 21fc308:	94001036 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 21fc30c:	aa1303e0 	mov	x0, x19
 21fc310:	940400bc 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21fc314:	9101c3e0 	add	x0, sp, #0x70
 21fc318:	940400ba 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21fc31c:	9101a3e0 	add	x0, sp, #0x68
 21fc320:	940400b8 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21fc324:	910183e0 	add	x0, sp, #0x60
 21fc328:	940400b6 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21fc32c:	910163e0 	add	x0, sp, #0x58
 21fc330:	940400b4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21fc334:	d2800000 	mov	x0, #0x0                   	// #0
 21fc338:	a94153f3 	ldp	x19, x20, [sp,#16]
 21fc33c:	a8cb7bfd 	ldp	x29, x30, [sp],#176
 21fc340:	d65f03c0 	ret
 21fc344:	a9025bf5 	stp	x21, x22, [sp,#32]
 21fc348:	91002020 	add	x0, x1, #0x8
 21fc34c:	90001e35 	adrp	x21, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 21fc350:	912a72b5 	add	x21, x21, #0xa9c
 21fc354:	eb0002bf 	cmp	x21, x0
 21fc358:	54000148 	b.hi	21fc380 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74268>
 21fc35c:	f2400414 	ands	x20, x0, #0x3
 21fc360:	54000101 	b.ne	21fc380 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74268>
 21fc364:	b9400836 	ldr	w22, [x1,#8]
 21fc368:	f90027e1 	str	x1, [sp,#72]
 21fc36c:	9792d78f 	bl	6b21a8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x21618>
 21fc370:	6b0002df 	cmp	w22, w0
 21fc374:	f94027e1 	ldr	x1, [sp,#72]
 21fc378:	54000080 	b.eq	21fc388 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74270>
 21fc37c:	d503201f 	nop
 21fc380:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21fc384:	17ffffc6 	b	21fc29c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74184>
 21fc388:	91003020 	add	x0, x1, #0xc
 21fc38c:	88dffc02 	ldar	w2, [x0]
