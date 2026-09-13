
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021b5180 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d068>:
 21b5180:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 21b5184:	910003fd 	mov	x29, sp
 21b5188:	39400022 	ldrb	w2, [x1]
 21b518c:	a90153f3 	stp	x19, x20, [sp,#16]
 21b5190:	a9025bf5 	stp	x21, x22, [sp,#32]
 21b5194:	a940d036 	ldp	x22, x20, [x1,#8]
 21b5198:	a90363f7 	stp	x23, x24, [sp,#48]
 21b519c:	b9400ad8 	ldr	w24, [x22,#8]
 21b51a0:	f9400ec3 	ldr	x3, [x22,#24]
 21b51a4:	35000b02 	cbnz	w2, 21b5304 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d1ec>
 21b51a8:	2a1803f8 	mov	w24, w24
 21b51ac:	f100071f 	cmp	x24, #0x1
 21b51b0:	540006c0 	b.eq	21b5288 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d170>
 21b51b4:	d37ef465 	lsl	x5, x3, #2
 21b51b8:	91003ca1 	add	x1, x5, #0xf
 21b51bc:	927cec21 	and	x1, x1, #0xfffffffffffffff0
 21b51c0:	cb2163ff 	sub	sp, sp, x1
 21b51c4:	910003f7 	mov	x23, sp
 21b51c8:	b4000303 	cbz	x3, 21b5228 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d110>
 21b51cc:	b9400c04 	ldr	w4, [x0,#12]
 21b51d0:	d2800002 	mov	x2, #0x0                   	// #0
 21b51d4:	2a0403e1 	mov	w1, w4
 21b51d8:	7100003f 	cmp	w1, #0x0
 21b51dc:	5400006d 	b.le	21b51e8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d0d0>
 21b51e0:	51000421 	sub	w1, w1, #0x1
 21b51e4:	b9000c01 	str	w1, [x0,#12]
 21b51e8:	91000442 	add	x2, x2, #0x1
 21b51ec:	eb02007f 	cmp	x3, x2
 21b51f0:	54ffff41 	b.ne	21b51d8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d0c0>
 21b51f4:	8b1700a2 	add	x2, x5, x23
 21b51f8:	aa1703e1 	mov	x1, x23
 21b51fc:	d503201f 	nop
 21b5200:	7100009f 	cmp	w4, #0x0
 21b5204:	5400076d 	b.le	21b52f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d1d8>
 21b5208:	bd400000 	ldr	s0, [x0]
 21b520c:	51000484 	sub	w4, w4, #0x1
 21b5210:	bd400801 	ldr	s1, [x0,#8]
 21b5214:	1e212800 	fadd	s0, s0, s1
 21b5218:	bc004420 	str	s0, [x1],#4
 21b521c:	eb01005f 	cmp	x2, x1
 21b5220:	bd000000 	str	s0, [x0]
 21b5224:	54fffee1 	b.ne	21b5200 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d0e8>
 21b5228:	b4000258 	cbz	x24, 21b5270 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d158>
 21b522c:	2a0303f5 	mov	w21, w3
 21b5230:	d37df318 	lsl	x24, x24, #3
 21b5234:	d2800013 	mov	x19, #0x0                   	// #0
 21b5238:	f9400280 	ldr	x0, [x20]
 21b523c:	2a1503e3 	mov	w3, w21
 21b5240:	f94002c1 	ldr	x1, [x22]
 21b5244:	aa1703e2 	mov	x2, x23
 21b5248:	f8736800 	ldr	x0, [x0,x19]
 21b524c:	f8736821 	ldr	x1, [x1,x19]
 21b5250:	91002273 	add	x19, x19, #0x8
 21b5254:	f9400a84 	ldr	x4, [x20,#16]
 21b5258:	f9400ac5 	ldr	x5, [x22,#16]
 21b525c:	8b040800 	add	x0, x0, x4, lsl #2
 21b5260:	8b050821 	add	x1, x1, x5, lsl #2
 21b5264:	9401fb13 	bl	2233eb0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xabd98>
 21b5268:	eb13031f 	cmp	x24, x19
 21b526c:	54fffe61 	b.ne	21b5238 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d120>
 21b5270:	910003bf 	mov	sp, x29
 21b5274:	a94153f3 	ldp	x19, x20, [sp,#16]
 21b5278:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21b527c:	a94363f7 	ldp	x23, x24, [sp,#48]
 21b5280:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21b5284:	d65f03c0 	ret
 21b5288:	f9400281 	ldr	x1, [x20]
 21b528c:	f94002c2 	ldr	x2, [x22]
 21b5290:	f9400ac4 	ldr	x4, [x22,#16]
 21b5294:	f9400046 	ldr	x6, [x2]
 21b5298:	f9400022 	ldr	x2, [x1]
 21b529c:	f9400a81 	ldr	x1, [x20,#16]
 21b52a0:	b4fffe83 	cbz	x3, 21b5270 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d158>
 21b52a4:	b9400c05 	ldr	w5, [x0,#12]
 21b52a8:	8b0408c4 	add	x4, x6, x4, lsl #2
 21b52ac:	8b010842 	add	x2, x2, x1, lsl #2
 21b52b0:	d2800001 	mov	x1, #0x0                   	// #0
 21b52b4:	710000bf 	cmp	w5, #0x0
 21b52b8:	bc617881 	ldr	s1, [x4,x1,lsl #2]
 21b52bc:	540007ad 	b.le	21b53b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d298>
 21b52c0:	bd400002 	ldr	s2, [x0]
 21b52c4:	510004a5 	sub	w5, w5, #0x1
 21b52c8:	bd400800 	ldr	s0, [x0,#8]
 21b52cc:	b9000c05 	str	w5, [x0,#12]
 21b52d0:	1e222800 	fadd	s0, s0, s2
 21b52d4:	1e210801 	fmul	s1, s0, s1
 21b52d8:	bd000000 	str	s0, [x0]
 21b52dc:	bc217841 	str	s1, [x2,x1,lsl #2]
 21b52e0:	91000421 	add	x1, x1, #0x1
 21b52e4:	eb01007f 	cmp	x3, x1
 21b52e8:	54fffe61 	b.ne	21b52b4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d19c>
 21b52ec:	17ffffe1 	b	21b5270 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d158>
 21b52f0:	b9400405 	ldr	w5, [x0,#4]
 21b52f4:	b8004425 	str	w5, [x1],#4
 21b52f8:	eb01005f 	cmp	x2, x1
 21b52fc:	54fff821 	b.ne	21b5200 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d0e8>
 21b5300:	17ffffca 	b	21b5228 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d110>
 21b5304:	b9400c01 	ldr	w1, [x0,#12]
 21b5308:	6b01007f 	cmp	w3, w1
 21b530c:	540004ca 	b.ge	21b53a4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d28c>
 21b5310:	1e220060 	scvtf	s0, w3
 21b5314:	bd400801 	ldr	s1, [x0,#8]
 21b5318:	bd400002 	ldr	s2, [x0]
 21b531c:	4b030022 	sub	w2, w1, w3
 21b5320:	1f000820 	fmadd	s0, s1, s0, s2
 21b5324:	b9400a81 	ldr	w1, [x20,#8]
 21b5328:	d2800013 	mov	x19, #0x0                   	// #0
 21b532c:	f9400ad5 	ldr	x21, [x22,#16]
 21b5330:	6b18003f 	cmp	w1, w24
 21b5334:	f9400e84 	ldr	x4, [x20,#24]
 21b5338:	1a989021 	csel	w1, w1, w24, ls
 21b533c:	f94002d6 	ldr	x22, [x22]
 21b5340:	b9000c02 	str	w2, [x0,#12]
 21b5344:	eb03009f 	cmp	x4, x3
 21b5348:	bd000000 	str	s0, [x0]
 21b534c:	d37d7c37 	ubfiz	x23, x1, #3, #32
 21b5350:	9a839098 	csel	x24, x4, x3, ls
 21b5354:	d37ef6b5 	lsl	x21, x21, #2
 21b5358:	34fff8c1 	cbz	w1, 21b5270 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d158>
 21b535c:	d503201f 	nop
 21b5360:	f9400280 	ldr	x0, [x20]
 21b5364:	2a1803e2 	mov	w2, w24
 21b5368:	f9400a83 	ldr	x3, [x20,#16]
 21b536c:	f8736800 	ldr	x0, [x0,x19]
 21b5370:	f8736ac1 	ldr	x1, [x22,x19]
 21b5374:	91002273 	add	x19, x19, #0x8
 21b5378:	8b030800 	add	x0, x0, x3, lsl #2
 21b537c:	8b150021 	add	x1, x1, x21
 21b5380:	9401f630 	bl	2232c40 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xaab28>
 21b5384:	eb1302ff 	cmp	x23, x19
 21b5388:	54fffec1 	b.ne	21b5360 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d248>
 21b538c:	910003bf 	mov	sp, x29
 21b5390:	a94153f3 	ldp	x19, x20, [sp,#16]
 21b5394:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21b5398:	a94363f7 	ldp	x23, x24, [sp,#48]
 21b539c:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21b53a0:	d65f03c0 	ret
 21b53a4:	52800002 	mov	w2, #0x0                   	// #0
 21b53a8:	bd400400 	ldr	s0, [x0,#4]
 21b53ac:	17ffffde 	b	21b5324 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d20c>
 21b53b0:	bd400400 	ldr	s0, [x0,#4]
 21b53b4:	1e210801 	fmul	s1, s0, s1
 21b53b8:	bc217841 	str	s1, [x2,x1,lsl #2]
 21b53bc:	91000421 	add	x1, x1, #0x1
 21b53c0:	eb01007f 	cmp	x3, x1
 21b53c4:	54fff781 	b.ne	21b52b4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d19c>
 21b53c8:	17ffffaa 	b	21b5270 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d158>
 21b53cc:	00000000 	.inst	0x00000000 ; undefined
 21b53d0:	f100003f 	cmp	x1, #0x0
 21b53d4:	540002ed 	b.le	21b5430 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d318>
 21b53d8:	a9400804 	ldp	x4, x2, [x0]
 21b53dc:	f9400483 	ldr	x3, [x4,#8]
 21b53e0:	cb020065 	sub	x5, x3, x2
 21b53e4:	eb850c3f 	cmp	x1, x5, asr #3
 21b53e8:	5400010a 	b.ge	21b5408 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d2f0>
 21b53ec:	f9400c83 	ldr	x3, [x4,#24]
 21b53f0:	d37df021 	lsl	x1, x1, #3
 21b53f4:	8b010042 	add	x2, x2, x1
 21b53f8:	eb03005f 	cmp	x2, x3
 21b53fc:	9a9f1042 	csel	x2, x2, xzr, ne
 21b5400:	f9000402 	str	x2, [x0,#8]
 21b5404:	d65f03c0 	ret
 21b5408:	f9400085 	ldr	x5, [x4]
 21b540c:	cb050063 	sub	x3, x3, x5
 21b5410:	cb830c21 	sub	x1, x1, x3, asr #3
 21b5414:	f9400c83 	ldr	x3, [x4,#24]
 21b5418:	d37df021 	lsl	x1, x1, #3
 21b541c:	8b010042 	add	x2, x2, x1
 21b5420:	eb03005f 	cmp	x2, x3
 21b5424:	9a9f1042 	csel	x2, x2, xzr, ne
 21b5428:	f9000402 	str	x2, [x0,#8]
 21b542c:	17fffff6 	b	21b5404 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d2ec>
 21b5430:	54fffea0 	b.eq	21b5404 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d2ec>
 21b5434:	a9400804 	ldp	x4, x2, [x0]
 21b5438:	b40001c2 	cbz	x2, 21b5470 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d358>
 21b543c:	f9400085 	ldr	x5, [x4]
 21b5440:	cb0103e1 	neg	x1, x1
 21b5444:	cb050046 	sub	x6, x2, x5
 21b5448:	cb010fe3 	neg	x3, x1, lsl #3
 21b544c:	eb860c3f 	cmp	x1, x6, asr #3
