
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000207e1f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e370>:
 207e1f8:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
 207e1fc:	b0006ca3 	adrp	x3, 2e13000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8501a8>
 207e200:	913d8063 	add	x3, x3, #0xf60
 207e204:	910003fd 	mov	x29, sp
 207e208:	a9025bf5 	stp	x21, x22, [sp,#32]
 207e20c:	aa0003f5 	mov	x21, x0
 207e210:	a90153f3 	stp	x19, x20, [sp,#16]
 207e214:	aa0003f3 	mov	x19, x0
 207e218:	9101a3e0 	add	x0, sp, #0x68
 207e21c:	a9046bf9 	stp	x25, x26, [sp,#64]
 207e220:	aa0203f9 	mov	x25, x2
 207e224:	aa0103fa 	mov	x26, x1
 207e228:	f80086a3 	str	x3, [x21],#8
 207e22c:	d0006ca1 	adrp	x1, 2e14000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8511a8>
 207e230:	91242021 	add	x1, x1, #0x908
 207e234:	940ad6ab 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 207e238:	a9077fff 	stp	xzr, xzr, [sp,#112]
 207e23c:	aa1503e0 	mov	x0, x21
 207e240:	9101a3e1 	add	x1, sp, #0x68
 207e244:	9101c3e4 	add	x4, sp, #0x70
 207e248:	52808003 	mov	w3, #0x400                 	// #1024
 207e24c:	52817702 	mov	w2, #0xbb8                 	// #3000
 207e250:	94063e8c 	bl	220dc80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x85b68>
 207e254:	f9403ff4 	ldr	x20, [sp,#120]
 207e258:	b4000174 	cbz	x20, 207e284 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e3fc>
 207e25c:	d0006ca0 	adrp	x0, 2e14000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8511a8>
 207e260:	f9444c16 	ldr	x22, [x0,#2200]
 207e264:	b4001236 	cbz	x22, 207e4a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e620>
 207e268:	91002281 	add	x1, x20, #0x8
 207e26c:	885ffc20 	ldaxr	w0, [x1]
 207e270:	51000402 	sub	w2, w0, #0x1
 207e274:	8803fc22 	stlxr	w3, w2, [x1]
 207e278:	35ffffa3 	cbnz	w3, 207e26c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e3e4>
 207e27c:	7100041f 	cmp	w0, #0x1
 207e280:	540011e0 	b.eq	207e4bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e634>
 207e284:	9101a3e0 	add	x0, sp, #0x68
 207e288:	9409f8de 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 207e28c:	d0006ca4 	adrp	x4, 2e14000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8511a8>
 207e290:	d0006ca3 	adrp	x3, 2e14000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8511a8>
 207e294:	91010084 	add	x4, x4, #0x40
 207e298:	d0006ca2 	adrp	x2, 2e14000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8511a8>
 207e29c:	91034063 	add	x3, x3, #0xd0
 207e2a0:	9103e042 	add	x2, x2, #0xf8
 207e2a4:	d0006ca1 	adrp	x1, 2e14000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8511a8>
 207e2a8:	91048021 	add	x1, x1, #0x120
 207e2ac:	b0006ca0 	adrp	x0, 2e13000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8501a8>
 207e2b0:	913f6000 	add	x0, x0, #0xfd8
 207e2b4:	a9001260 	stp	x0, x4, [x19]
 207e2b8:	d2801300 	mov	x0, #0x98                  	// #152
 207e2bc:	f9001a63 	str	x3, [x19,#48]
 207e2c0:	f9002262 	str	x2, [x19,#64]
 207e2c4:	f9016261 	str	x1, [x19,#704]
 207e2c8:	978e9a9e 	bl	424d40 <_Znwm@plt>
 207e2cc:	aa0003f4 	mov	x20, x0
 207e2d0:	9000d636 	adrp	x22, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 207e2d4:	913962d6 	add	x22, x22, #0xe58
 207e2d8:	a90363f7 	stp	x23, x24, [sp,#48]
 207e2dc:	fd002be8 	str	d8, [sp,#80]
 207e2e0:	08dffec0 	ldarb	w0, [x22]
 207e2e4:	9000d637 	adrp	x23, 3b42000 <stdout@@GLIBC_2.17+0xf40>
 207e2e8:	36001100 	tbz	w0, #0, 207e508 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e680>
 207e2ec:	b94e62e2 	ldr	w2, [x23,#3680]
 207e2f0:	b0002a41 	adrp	x1, 25c7000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x41a8>
 207e2f4:	910c0021 	add	x1, x1, #0x300
 207e2f8:	f9000281 	str	x1, [x20]
 207e2fc:	b9000a82 	str	w2, [x20,#8]
 207e300:	91008280 	add	x0, x20, #0x20
 207e304:	f9000a9f 	str	xzr, [x20,#16]
 207e308:	910bc276 	add	x22, x19, #0x2f0
 207e30c:	3900629f 	strb	wzr, [x20,#24]
 207e310:	910c2277 	add	x23, x19, #0x308
 207e314:	910c8278 	add	x24, x19, #0x320
 207e318:	940ab682 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 207e31c:	f9017674 	str	x20, [x19,#744]
 207e320:	aa1403e0 	mov	x0, x20
 207e324:	b0006ca2 	adrp	x2, 2e13000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8501a8>
 207e328:	913ec042 	add	x2, x2, #0xfb0
 207e32c:	f9017a7f 	str	xzr, [x19,#752]
 207e330:	aa1403e1 	mov	x1, x20
 207e334:	a900fedf 	stp	xzr, xzr, [x22,#8]
 207e338:	4f000400 	movi	v0.4s, #0x0
 207e33c:	f8050402 	str	x2, [x0],#80
 207e340:	a9057e9f 	stp	xzr, xzr, [x20,#80]
 207e344:	a9017c1f 	stp	xzr, xzr, [x0,#16]
 207e348:	a9027c1f 	stp	xzr, xzr, [x0,#32]
 207e34c:	a9405320 	ldp	x0, x20, [x25]
