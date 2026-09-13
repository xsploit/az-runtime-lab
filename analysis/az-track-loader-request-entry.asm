
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000a6d300 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1626e8>:
  a6d300:	d1036000 	sub	x0, x0, #0xd8
  a6d304:	17fffd41 	b	a6c808 <_ZSt20__throw_bad_weak_ptrv@@Base+0x161bf0>
  a6d308:	a9a97bfd 	stp	x29, x30, [sp,#-368]!
  a6d30c:	910003fd 	mov	x29, sp
  a6d310:	a90153f3 	stp	x19, x20, [sp,#16]
  a6d314:	aa0403f3 	mov	x19, x4
  a6d318:	b201f3e4 	mov	x4, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
  a6d31c:	a90573fb 	stp	x27, x28, [sp,#80]
  a6d320:	2a0103fc 	mov	w28, w1
  a6d324:	f2955564 	movk	x4, #0xaaab
  a6d328:	a9402468 	ldp	x8, x9, [x3]
  a6d32c:	a9025bf5 	stp	x21, x22, [sp,#32]
  a6d330:	aa0003f6 	mov	x22, x0
  a6d334:	a9408663 	ldp	x3, x1, [x19,#8]
  a6d338:	b9007fe2 	str	w2, [sp,#124]
  a6d33c:	79400262 	ldrh	w2, [x19]
  a6d340:	aa0503f4 	mov	x20, x5
  a6d344:	b90073e2 	str	w2, [sp,#112]
  a6d348:	a90363f7 	stp	x23, x24, [sp,#48]
  a6d34c:	aa0603f7 	mov	x23, x6
  a6d350:	cb030020 	sub	x0, x1, x3
  a6d354:	a91327e8 	stp	x8, x9, [sp,#304]
  a6d358:	9342fc02 	asr	x2, x0, #2
  a6d35c:	fd0033e8 	str	d8, [sp,#96]
  a6d360:	9b047c42 	mul	x2, x2, x4
  a6d364:	b40029c2 	cbz	x2, a6d89c <_ZSt20__throw_bad_weak_ptrv@@Base+0x162c84>
  a6d368:	a9046bf9 	stp	x25, x26, [sp,#64]
  a6d36c:	b200f3e1 	mov	x1, #0x5555555555555555    	// #6148914691236517205
  a6d370:	f2e2aaa1 	movk	x1, #0x1555, lsl #48
  a6d374:	eb01005f 	cmp	x2, x1
  a6d378:	54004c88 	b.hi	a6dd08 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1630f0>
  a6d37c:	97e6de71 	bl	424d40 <_Znwm@plt>
  a6d380:	aa0003f5 	mov	x21, x0
  a6d384:	a9408663 	ldp	x3, x1, [x19,#8]
  a6d388:	eb03003f 	cmp	x1, x3
  a6d38c:	54002900 	b.eq	a6d8ac <_ZSt20__throw_bad_weak_ptrv@@Base+0x162c94>
  a6d390:	aa0303e0 	mov	x0, x3
  a6d394:	aa1503e2 	mov	x2, x21
  a6d398:	f9400004 	ldr	x4, [x0]
  a6d39c:	f9000044 	str	x4, [x2]
  a6d3a0:	91003000 	add	x0, x0, #0xc
  a6d3a4:	91003042 	add	x2, x2, #0xc
  a6d3a8:	b85fc004 	ldur	w4, [x0,#-4]
  a6d3ac:	eb00003f 	cmp	x1, x0
  a6d3b0:	b81fc044 	stur	w4, [x2,#-4]
  a6d3b4:	54ffff21 	b.ne	a6d398 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162780>
  a6d3b8:	d1003033 	sub	x19, x1, #0xc
  a6d3bc:	d2955561 	mov	x1, #0xaaab                	// #43691
  a6d3c0:	cb030273 	sub	x19, x19, x3
  a6d3c4:	f2b55541 	movk	x1, #0xaaaa, lsl #16
  a6d3c8:	f2d55541 	movk	x1, #0xaaaa, lsl #32
  a6d3cc:	d342fe73 	lsr	x19, x19, #2
  a6d3d0:	f2e55541 	movk	x1, #0x2aaa, lsl #48
  a6d3d4:	9b017e73 	mul	x19, x19, x1
  a6d3d8:	9240f673 	and	x19, x19, #0x3fffffffffffffff
  a6d3dc:	91000673 	add	x19, x19, #0x1
  a6d3e0:	8b130673 	add	x19, x19, x19, lsl #1
  a6d3e4:	8b130ab3 	add	x19, x21, x19, lsl #2
  a6d3e8:	394002e1 	ldrb	w1, [x23]
  a6d3ec:	b90087e1 	str	w1, [sp,#132]
  a6d3f0:	b9400281 	ldr	w1, [x20]
  a6d3f4:	f94002c0 	ldr	x0, [x22]
  a6d3f8:	b90083e1 	str	w1, [sp,#128]
  a6d3fc:	f940181a 	ldr	x26, [x0,#48]
  a6d400:	945ecf48 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
  a6d404:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
  a6d408:	d000db21 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  a6d40c:	9118e021 	add	x1, x1, #0x638
  a6d410:	f9007be1 	str	x1, [sp,#240]
  a6d414:	fd007fe0 	str	d0, [sp,#248]
  a6d418:	72001c1f 	tst	w0, #0xff
  a6d41c:	2f00e400 	movi	d0, #0x0
  a6d420:	54000fa1 	b.ne	a6d614 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1629fc>
  a6d424:	f94006c3 	ldr	x3, [x22,#8]
  a6d428:	f9008fff 	str	xzr, [sp,#280]
  a6d42c:	d2800102 	mov	x2, #0x8                   	// #8
  a6d430:	d2800d01 	mov	x1, #0x68                  	// #104
  a6d434:	aa0303e0 	mov	x0, x3
  a6d438:	fd0083e0 	str	d0, [sp,#256]
  a6d43c:	f9400063 	ldr	x3, [x3]
  a6d440:	f9400863 	ldr	x3, [x3,#16]
  a6d444:	d63f0060 	blr	x3
  a6d448:	aa0003f4 	mov	x20, x0
  a6d44c:	b4003440 	cbz	x0, a6dad4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x162ebc>
