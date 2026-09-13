
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

000000000148bba8 <_ZNSt15recursive_mutex4lockEv>:
 1498380:      	mov	x0, x28
 1498384:      	bl	0x75b258 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev+0x624b0>
 1498388:      	mov	x0, x19
 149838c:      	bl	0x424d10 <_Unwind_Resume@plt>
 1498390:      	mov	x19, x0
 1498394:      	mov	x0, x22
 1498398:      	bl	0x99c0c8 <_ZSt20__throw_bad_weak_ptrv+0x914b0>
 149839c:      	mov	x0, x19
 14983a0:      	bl	0x424d10 <_Unwind_Resume@plt>
 14983a4:      	b	0x149837c <_ZNSt15recursive_mutex4lockEv+0xc7d4>
 14983a8:      	b	0x149837c <_ZNSt15recursive_mutex4lockEv+0xc7d4>
 14983ac:      	udf	#0x0
 14983b0:      	mov	x1, x0
 14983b4:      	ldr	x0, [x0, #0xf88]
 14983b8:      	cbz	x0, 0x14983d0 <_ZNSt15recursive_mutex4lockEv+0xc828>
 14983bc:      	ldr	x3, [x0]
 14983c0:      	add	x2, x1, #0xf80
 14983c4:      	add	x1, x1, #0x18
 14983c8:      	ldr	x3, [x3, #0x18]
 14983cc:      	br	x3
 14983d0:      	mov	w0, #0x0                // =0
 14983d4:      	ret
 14983d8:      	ldr	x0, [x0, #0x1f20]
 14983dc:      	ret
 14983e0:      	ldr	x0, [x0, #0x1f18]
 14983e4:      	ret
 14983e8:      	stp	x29, x30, [sp, #-0xe0]!
 14983ec:      	mov	x29, sp
 14983f0:      	stp	x21, x22, [sp, #0x20]
 14983f4:      	add	x21, x0, #0x8
 14983f8:      	adrp	x22, 0x289e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x2db1a8>
 14983fc:      	add	x22, x22, #0x320
 1498400:      	stp	x19, x20, [sp, #0x10]
 1498404:      	ldr	w19, [x21, #0x1ef8]
 1498408:      	mov	x20, x1
 149840c:      	add	x22, x22, #0xb8
 1498410:      	stp	x23, x24, [sp, #0x30]
 1498414:      	adrp	x23, 0x289e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x2db1a8>
 1498418:      	add	x23, x23, #0x408
 149841c:      	stp	x25, x26, [sp, #0x40]
 1498420:      	mov	x25, x2
 1498424:      	mov	w24, #0x2               // =2
 1498428:      	stp	x27, x28, [sp, #0x50]
 149842c:      	bl	0x2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x99008>
 1498430:      	fmov	d0, #0.50000000
 1498434:      	str	x23, [sp, #0xa8]
 1498438:      	tst	w0, #0xff
 149843c:      	str	d0, [sp, #0xb0]
 1498440:      	movi	d0, #0000000000000000
 1498444:      	b.eq	0x1498454 <_ZNSt15recursive_mutex4lockEv+0xc8ac>
 1498448:      	adrp	x0, 0x3bd7000 <stdout+0x95f40>
 149844c:      	ldrb	w0, [x0, #0x378]
 1498450:      	cbz	w0, 0x14985b4 <_ZNSt15recursive_mutex4lockEv+0xca0c>
 1498454:      	sxtw	x27, w19
 1498458:      	str	xzr, [sp, #0xd0]
 149845c:      	add	x0, x27, #0x1
 1498460:      	str	d0, [sp, #0xb8]
 1498464:      	lsl	x26, x0, #5
 1498468:      	sub	x26, x26, x0
 149846c:      	lsl	x26, x26, #4
 1498470:      	sub	x26, x26, x0
 1498474:      	add	x26, x21, x26, lsl #3
 1498478:      	ldar	w0, [x26]
 149847c:      	tbnz	w0, #0x1f, 0x14984e8 <_ZNSt15recursive_mutex4lockEv+0xc940>
 1498480:      	add	w1, w0, #0x1
 1498484:      	ldaxr	w2, [x26]
 1498488:      	cmp	w2, w0
 149848c:      	b.ne	0x1498498 <_ZNSt15recursive_mutex4lockEv+0xc8f0>
 1498490:      	stlxr	w3, w1, [x26]
 1498494:      	cbnz	w3, 0x1498484 <_ZNSt15recursive_mutex4lockEv+0xc8dc>
 1498498:      	b.ne	0x1498478 <_ZNSt15recursive_mutex4lockEv+0xc8d0>
 149849c:      	lsl	x0, x27, #5
 14984a0:      	sub	x0, x0, x27
 14984a4:      	ldr	x2, [x25]
 14984a8:      	lsl	x0, x0, #4
 14984ac:      	sub	x0, x0, x27
 14984b0:      	add	x0, x21, x0, lsl #3
 14984b4:      	ldr	x1, [x0, #0x8]
 14984b8:      	cmp	x2, x1
 14984bc:      	b.lo	0x1498620 <_ZNSt15recursive_mutex4lockEv+0xca78>
 14984c0:      	ldar	w0, [x26]
 14984c4:      	cmp	w0, #0x0
 14984c8:      	b.le	0x149945c <_ZNSt15recursive_mutex4lockEv+0xd8b4>
 14984cc:      	sub	w1, w0, #0x1
 14984d0:      	ldaxr	w2, [x26]
 14984d4:      	cmp	w2, w0
 14984d8:      	b.ne	0x14984e4 <_ZNSt15recursive_mutex4lockEv+0xc93c>
 14984dc:      	stlxr	w3, w1, [x26]
 14984e0:      	cbnz	w3, 0x14984d0 <_ZNSt15recursive_mutex4lockEv+0xc928>
 14984e4:      	b.ne	0x14984c0 <_ZNSt15recursive_mutex4lockEv+0xc918>
 14984e8:      	ldr	d0, [sp, #0xb8]
 14984ec:      	fcmp	d0, #0.0
 14984f0:      	b.ne	0x1498554 <_ZNSt15recursive_mutex4lockEv+0xc9ac>
 14984f4:      	ldr	x3, [sp, #0xd0]
 14984f8:      	cbz	x3, 0x149853c <_ZNSt15recursive_mutex4lockEv+0xc994>
 14984fc:      	add	x1, sp, #0xc0
 1498500:      	mov	w2, #0x3                // =3
 1498504:      	mov	x0, x1
 1498508:      	add	w19, w19, #0x1
 149850c:      	blr	x3
 1498510:      	and	w19, w19, #0x1
 1498514:      	cmp	w24, #0x1
 1498518:      	b.ne	0x149854c <_ZNSt15recursive_mutex4lockEv+0xc9a4>
 149851c:      	mov	w0, #0x0                // =0
 1498520:      	ldp	x19, x20, [sp, #0x10]
 1498524:      	ldp	x21, x22, [sp, #0x20]
 1498528:      	ldp	x23, x24, [sp, #0x30]
 149852c:      	ldp	x25, x26, [sp, #0x40]
 1498530:      	ldp	x27, x28, [sp, #0x50]
 1498534:      	ldp	x29, x30, [sp], #0xe0
 1498538:      	ret
 149853c:      	add	w19, w19, #0x1
 1498540:      	cmp	w24, #0x1
 1498544:      	and	w19, w19, #0x1
 1498548:      	b.eq	0x149851c <_ZNSt15recursive_mutex4lockEv+0xc974>
 149854c:      	mov	w24, #0x1               // =1
 1498550:      	b	0x149842c <_ZNSt15recursive_mutex4lockEv+0xc884>
 1498554:      	str	d8, [sp, #0x60]
 1498558:      	bl	0x232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a65d8>
 149855c:      	ldp	d1, d8, [sp, #0xb0]
 1498560:      	fsub	d8, d0, d8
 1498564:      	fcmpe	d8, d1
 1498568:      	b.le	0x14985ac <_ZNSt15recursive_mutex4lockEv+0xca04>
 149856c:      	ldr	x26, [sp, #0xa8]
 1498570:      	cbz	x26, 0x14985bc <_ZNSt15recursive_mutex4lockEv+0xca14>
 1498574:      	add	x8, sp, #0xa0
 1498578:      	bl	0x221e7f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x966d8>
 149857c:      	add	x0, sp, #0xa0
 1498580:      	bl	0x2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x191aa8>
 1498584:      	fmov	d0, d8
 1498588:      	mov	x2, x0
 149858c:      	mov	x1, x26
 1498590:      	adrp	x0, 0x25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x101a8>
 1498594:      	add	x0, x0, #0x618
 1498598:      	bl	0x22005d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x784b8>
 149859c:      	add	x0, sp, #0xa0
 14985a0:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 14985a4:      	ldr	d8, [sp, #0x60]
 14985a8:      	b	0x14984f4 <_ZNSt15recursive_mutex4lockEv+0xc94c>
 14985ac:      	ldr	d8, [sp, #0x60]
 14985b0:      	b	0x14984f4 <_ZNSt15recursive_mutex4lockEv+0xc94c>
 14985b4:      	bl	0x232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a65d8>
 14985b8:      	b	0x1498454 <_ZNSt15recursive_mutex4lockEv+0xc8ac>
 14985bc:      	ldr	x0, [sp, #0xd0]
 14985c0:      	cbz	x0, 0x149a0d0 <_ZNSt15recursive_mutex4lockEv+0xe528>
 14985c4:      	ldr	x1, [sp, #0xd8]
 14985c8:      	add	x8, sp, #0x98
 14985cc:      	add	x0, sp, #0xc0
 14985d0:      	blr	x1
 14985d4:      	add	x0, sp, #0x98
 14985d8:      	bl	0x2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x191aa8>
 14985dc:      	add	x8, sp, #0xa0
 14985e0:      	str	x0, [sp, #0x70]
 14985e4:      	bl	0x221e7f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x966d8>
 14985e8:      	add	x0, sp, #0xa0
 14985ec:      	bl	0x2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x191aa8>
 14985f0:      	fmov	d0, d8
 14985f4:      	ldr	x1, [sp, #0x70]
 14985f8:      	mov	x2, x0
 14985fc:      	adrp	x0, 0x25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x101a8>
 1498600:      	add	x0, x0, #0x618
 1498604:      	bl	0x22005d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x784b8>
 1498608:      	add	x0, sp, #0xa0
 149860c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1498610:      	add	x0, sp, #0x98
 1498614:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1498618:      	ldr	d8, [sp, #0x60]
 149861c:      	b	0x14984f4 <_ZNSt15recursive_mutex4lockEv+0xc94c>
 1498620:      	mov	w23, #0xf78             // =3960
 1498624:      	smull	x23, w19, w23
 1498628:      	add	x2, x23, #0x10
 149862c:      	add	x1, x23, #0x30
 1498630:      	add	x28, x21, x2
 1498634:      	add	x1, x21, x1
 1498638:      	ldr	w4, [x21, x2]
 149863c:      	ldr	x2, [x28, #0x8]
 1498640:      	str	w4, [x20]
 1498644:      	ldr	x4, [x1, #0x8]
 1498648:      	str	x2, [x20, #0x8]
 149864c:      	ldr	w2, [x0, #0x20]
 1498650:      	str	w2, [x20, #0x10]
 1498654:      	ldr	w2, [x1, #0x20]
 1498658:      	ldrb	w5, [x0, #0x24]
 149865c:      	strb	w5, [x20, #0x14]
 1498660:      	ldrb	w5, [x0, #0x25]
 1498664:      	strb	w5, [x20, #0x15]
 1498668:      	ldrb	w5, [x0, #0x26]
 149866c:      	strb	w5, [x20, #0x16]
 1498670:      	ldrb	w5, [x0, #0x27]
 1498674:      	strb	w5, [x20, #0x17]
 1498678:      	ldrb	w5, [x0, #0x28]
 149867c:      	strb	w5, [x20, #0x18]
 1498680:      	ldrb	w5, [x0, #0x29]
 1498684:      	strb	w5, [x20, #0x19]
 1498688:      	ldrb	w0, [x0, #0x2a]
 149868c:      	str	x4, [x20, #0x28]
 1498690:      	strb	w0, [x20, #0x1a]
 1498694:      	ldr	w4, [x1, #0x10]
 1498698:      	ldr	x0, [x1, #0x18]
 149869c:      	str	w4, [x20, #0x30]
 14986a0:      	str	x0, [x20, #0x38]
 14986a4:      	str	w2, [x20, #0x40]
 14986a8:      	add	x1, x1, #0x28
 14986ac:      	ldar	x0, [x1]
 14986b0:      	add	x19, x20, #0x48
 14986b4:      	ldar	x1, [x19]
 14986b8:      	cmp	x0, x1
 14986bc:      	b.eq	0x14987c8 <_ZNSt15recursive_mutex4lockEv+0xcc20>
 14986c0:      	add	x1, x0, #0xc
 14986c4:      	cbz	x0, 0x14999e0 <_ZNSt15recursive_mutex4lockEv+0xde38>
 14986c8:      	mov	w4, #0x4f58             // =20312
 14986cc:      	movk	w4, #0x5243, lsl #16
 14986d0:      	ldar	w2, [x1]
 14986d4:      	cmp	w2, #0x0
 14986d8:      	b.le	0x14999e0 <_ZNSt15recursive_mutex4lockEv+0xde38>
 14986dc:      	ldr	w5, [x0, #0x10]
 14986e0:      	cmp	w5, w4
 14986e4:      	b.ne	0x14999e0 <_ZNSt15recursive_mutex4lockEv+0xde38>
 14986e8:      	add	w5, w2, #0x1
 14986ec:      	ldaxr	w6, [x1]
 14986f0:      	cmp	w6, w2
 14986f4:      	b.ne	0x1498700 <_ZNSt15recursive_mutex4lockEv+0xcb58>
 14986f8:      	stlxr	w3, w5, [x1]
 14986fc:      	cbnz	w3, 0x14986ec <_ZNSt15recursive_mutex4lockEv+0xcb44>
 1498700:      	b.ne	0x14986d0 <_ZNSt15recursive_mutex4lockEv+0xcb28>
 1498704:      	ldr	w1, [x0, #0x10]
 1498708:      	cmp	w1, w4
 149870c:      	b.ne	0x149994c <_ZNSt15recursive_mutex4lockEv+0xdda4>
 1498710:      	ldaxr	x1, [x19]
 1498714:      	stlxr	w2, x0, [x19]
 1498718:      	cbnz	w2, 0x1498710 <_ZNSt15recursive_mutex4lockEv+0xcb68>
 149871c:      	cbz	x1, 0x14987c8 <_ZNSt15recursive_mutex4lockEv+0xcc20>
 1498720:      	ldr	w2, [x1, #0x10]
 1498724:      	mov	w0, #0x4f58             // =20312
 1498728:      	movk	w0, #0x5243, lsl #16
 149872c:      	cmp	w2, w0
 1498730:      	b.eq	0x1499a40 <_ZNSt15recursive_mutex4lockEv+0xde98>
 1498734:      	add	x0, sp, #0x88
 1498738:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 149873c:      	add	x1, x1, #0xd70
 1498740:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1498744:      	add	x0, sp, #0x88
 1498748:      	add	x8, sp, #0x90
 149874c:      	adrp	x1, 0x289e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x2db1a8>
 1498750:      	add	x1, x1, #0x320
 1498754:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1498758:      	add	x8, sp, #0x98
 149875c:      	add	x0, sp, #0x90
 1498760:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1498764:      	add	x1, x1, #0xd38
 1498768:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 149876c:      	add	x0, sp, #0x80
 1498770:      	adrp	x1, 0x25cf000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xc1a8>
 1498774:      	add	x1, x1, #0x870
 1498778:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 149877c:      	add	x8, sp, #0xa0
 1498780:      	add	x1, sp, #0x80
 1498784:      	add	x0, sp, #0x98
 1498788:      	bl	0x2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18b978>
 149878c:      	mov	w2, #0x1                // =1
 1498790:      	mov	w1, w2
 1498794:      	add	x0, sp, #0xa0
 1498798:      	bl	0x22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x782c8>
 149879c:      	add	x0, sp, #0xa0
 14987a0:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 14987a4:      	add	x0, sp, #0x80
 14987a8:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 14987ac:      	add	x0, sp, #0x98
 14987b0:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 14987b4:      	add	x0, sp, #0x90
 14987b8:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 14987bc:      	add	x0, sp, #0x88
 14987c0:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 14987c4:      	nop
 14987c8:      	add	x0, x21, x23
 14987cc:      	str	x0, [sp, #0x70]
 14987d0:      	add	x0, x0, #0x60
 14987d4:      	ldar	x0, [x0]
 14987d8:      	add	x19, x20, #0x50
 14987dc:      	ldar	x1, [x19]
 14987e0:      	cmp	x0, x1
 14987e4:      	b.eq	0x14988f0 <_ZNSt15recursive_mutex4lockEv+0xcd48>
 14987e8:      	add	x1, x0, #0xc
 14987ec:      	cbz	x0, 0x149980c <_ZNSt15recursive_mutex4lockEv+0xdc64>
 14987f0:      	mov	w4, #0x4f58             // =20312
 14987f4:      	movk	w4, #0x5243, lsl #16
 14987f8:      	ldar	w2, [x1]
 14987fc:      	cmp	w2, #0x0
 1498800:      	b.le	0x149980c <_ZNSt15recursive_mutex4lockEv+0xdc64>
 1498804:      	ldr	w5, [x0, #0x10]
 1498808:      	cmp	w5, w4
 149880c:      	b.ne	0x149980c <_ZNSt15recursive_mutex4lockEv+0xdc64>
 1498810:      	add	w5, w2, #0x1
 1498814:      	ldaxr	w6, [x1]
 1498818:      	cmp	w6, w2
 149881c:      	b.ne	0x1498828 <_ZNSt15recursive_mutex4lockEv+0xcc80>
 1498820:      	stlxr	w3, w5, [x1]
 1498824:      	cbnz	w3, 0x1498814 <_ZNSt15recursive_mutex4lockEv+0xcc6c>
 1498828:      	b.ne	0x14987f8 <_ZNSt15recursive_mutex4lockEv+0xcc50>
 149882c:      	ldr	w1, [x0, #0x10]
 1498830:      	cmp	w1, w4
 1498834:      	b.ne	0x1499778 <_ZNSt15recursive_mutex4lockEv+0xdbd0>
 1498838:      	ldaxr	x1, [x19]
 149883c:      	stlxr	w2, x0, [x19]
 1498840:      	cbnz	w2, 0x1498838 <_ZNSt15recursive_mutex4lockEv+0xcc90>
 1498844:      	cbz	x1, 0x14988f0 <_ZNSt15recursive_mutex4lockEv+0xcd48>
 1498848:      	ldr	w2, [x1, #0x10]
 149884c:      	mov	w0, #0x4f58             // =20312
 1498850:      	movk	w0, #0x5243, lsl #16
 1498854:      	cmp	w2, w0
 1498858:      	b.eq	0x1499b30 <_ZNSt15recursive_mutex4lockEv+0xdf88>
 149885c:      	add	x0, sp, #0x88
 1498860:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1498864:      	add	x1, x1, #0xd70
 1498868:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 149886c:      	add	x0, sp, #0x88
 1498870:      	add	x8, sp, #0x90
 1498874:      	adrp	x1, 0x289e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x2db1a8>
 1498878:      	add	x1, x1, #0x320
 149887c:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1498880:      	add	x8, sp, #0x98
 1498884:      	add	x0, sp, #0x90
 1498888:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 149888c:      	add	x1, x1, #0xd38
 1498890:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1498894:      	add	x0, sp, #0x80
 1498898:      	adrp	x1, 0x25cf000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xc1a8>
 149889c:      	add	x1, x1, #0x870
 14988a0:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 14988a4:      	add	x8, sp, #0xa0
 14988a8:      	add	x1, sp, #0x80
 14988ac:      	add	x0, sp, #0x98
 14988b0:      	bl	0x2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18b978>
 14988b4:      	mov	w2, #0x1                // =1
 14988b8:      	mov	w1, w2
 14988bc:      	add	x0, sp, #0xa0
 14988c0:      	bl	0x22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x782c8>
 14988c4:      	add	x0, sp, #0xa0
 14988c8:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 14988cc:      	add	x0, sp, #0x80
 14988d0:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 14988d4:      	add	x0, sp, #0x98
 14988d8:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 14988dc:      	add	x0, sp, #0x90
 14988e0:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 14988e4:      	add	x0, sp, #0x88
 14988e8:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 14988ec:      	nop
 14988f0:      	lsl	x0, x27, #5
 14988f4:      	add	x1, x23, #0xc8
 14988f8:      	sub	x0, x0, x27
 14988fc:      	add	x1, x21, x1
 1498900:      	lsl	x0, x0, #4
 1498904:      	sub	x0, x0, x27
 1498908:      	add	x0, x21, x0, lsl #3
 149890c:      	ldrb	w2, [x0, #0x68]
 1498910:      	strb	w2, [x20, #0x58]
 1498914:      	ldrb	w2, [x0, #0x69]
 1498918:      	strb	w2, [x20, #0x59]
 149891c:      	ldrb	w2, [x0, #0x6a]
 1498920:      	strb	w2, [x20, #0x5a]
 1498924:      	ldrb	w2, [x0, #0x6b]
 1498928:      	strb	w2, [x20, #0x5b]
 149892c:      	ldr	w2, [x0, #0x6c]
 1498930:      	str	w2, [x20, #0x5c]
 1498934:      	ldrb	w2, [x0, #0x70]
 1498938:      	strb	w2, [x20, #0x60]
 149893c:      	ldr	w2, [x0, #0x74]
 1498940:      	str	w2, [x20, #0x64]
 1498944:      	ldrb	w2, [x0, #0x78]
 1498948:      	strb	w2, [x20, #0x68]
 149894c:      	ldrb	w2, [x0, #0x79]
 1498950:      	strb	w2, [x20, #0x69]
 1498954:      	ldrb	w2, [x0, #0x7a]
 1498958:      	strb	w2, [x20, #0x6a]
 149895c:      	ldrb	w2, [x0, #0x7b]
 1498960:      	strb	w2, [x20, #0x6b]
 1498964:      	ldr	w2, [x0, #0x7c]
 1498968:      	str	w2, [x20, #0x6c]
 149896c:      	ldr	w2, [x0, #0x80]
 1498970:      	str	w2, [x20, #0x70]
 1498974:      	ldrb	w2, [x0, #0x84]
 1498978:      	strb	w2, [x20, #0x74]
 149897c:      	ldr	x2, [x0, #0x88]
 1498980:      	str	x2, [x20, #0x78]
 1498984:      	ldr	x2, [x28, #0x80]
 1498988:      	str	x2, [x20, #0x80]
 149898c:      	ldr	w2, [x0, #0x98]
 1498990:      	ldr	w6, [x28, #0x9c]
 1498994:      	ldr	x4, [x1, #0x8]
 1498998:      	ldr	x5, [x28, #0xa8]
 149899c:      	str	w2, [x20, #0x88]
 14989a0:      	ldr	w2, [x0, #0x9c]
 14989a4:      	str	w2, [x20, #0x8c]
 14989a8:      	ldr	w2, [x1, #0x20]
 14989ac:      	ldr	w7, [x0, #0xa0]
 14989b0:      	str	w7, [x20, #0x90]
 14989b4:      	ldrb	w0, [x0, #0xa4]
 14989b8:      	strb	w0, [x20, #0x94]
 14989bc:      	ldr	w0, [x28, #0x98]
 14989c0:      	stp	w0, w6, [x20, #0x98]
 14989c4:      	ldp	w0, w6, [x28, #0xa0]
 14989c8:      	str	x5, [x20, #0xa8]
 14989cc:      	ldr	x5, [x28, #0xb0]
 14989d0:      	str	x4, [x20, #0xc0]
 14989d4:      	str	w0, [x20, #0xa0]
 14989d8:      	ldr	w4, [x1, #0x10]
 14989dc:      	ldr	x0, [x1, #0x18]
 14989e0:      	str	w6, [x20, #0xa4]
 14989e4:      	str	x5, [x20, #0xb0]
 14989e8:      	str	w4, [x20, #0xc8]
 14989ec:      	str	x0, [x20, #0xd0]
 14989f0:      	str	w2, [x20, #0xd8]
 14989f4:      	add	x1, x1, #0x28
 14989f8:      	ldar	x0, [x1]
 14989fc:      	add	x19, x20, #0xe0
 1498a00:      	ldar	x1, [x19]
 1498a04:      	cmp	x0, x1
 1498a08:      	b.eq	0x1498b10 <_ZNSt15recursive_mutex4lockEv+0xcf68>
 1498a0c:      	add	x1, x0, #0xc
 1498a10:      	cbz	x0, 0x14996d4 <_ZNSt15recursive_mutex4lockEv+0xdb2c>
 1498a14:      	mov	w4, #0x4f58             // =20312
 1498a18:      	movk	w4, #0x5243, lsl #16
 1498a1c:      	ldar	w2, [x1]
 1498a20:      	cmp	w2, #0x0
 1498a24:      	b.le	0x14996d4 <_ZNSt15recursive_mutex4lockEv+0xdb2c>
 1498a28:      	ldr	w5, [x0, #0x10]
 1498a2c:      	cmp	w5, w4
