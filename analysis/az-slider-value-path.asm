
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002188118 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_>:
 21ee410: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 21ee414: 910003fd     	mov	x29, sp
 21ee418: f9405c00     	ldr	x0, [x0, #0xb8]
 21ee41c: f9000bf3     	str	x19, [sp, #0x10]
 21ee420: aa0803f3     	mov	x19, x8
 21ee424: b4000200     	cbz	x0, 0x21ee464 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x6634c>
 21ee428: f9400002     	ldr	x2, [x0]
 21ee42c: f0ffffe1     	adrp	x1, 0x21ed000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x64ee8>
 21ee430: 9130c021     	add	x1, x1, #0xc30
 21ee434: f9400c42     	ldr	x2, [x2, #0x18]
 21ee438: eb01005f     	cmp	x2, x1
 21ee43c: 54000201     	b.ne	0x21ee47c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x66364>
 21ee440: 0f000401     	movi	v1.2s, #0x0
 21ee444: bd401000     	ldr	s0, [x0, #0x10]
 21ee448: aa1303e0     	mov	x0, x19
 21ee44c: f9400bf3     	ldr	x19, [sp, #0x10]
 21ee450: 1e212010     	fcmpe	s0, s1
 21ee454: 1e21cc00     	fcsel	s0, s0, s1, gt
 21ee458: 2d000101     	stp	s1, s0, [x8]
 21ee45c: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 21ee460: d65f03c0     	ret
 21ee464: d2e7f000     	mov	x0, #0x3f80000000000000 // =4575657221408423936
 21ee468: f9000100     	str	x0, [x8]
 21ee46c: aa1303e0     	mov	x0, x19
 21ee470: f9400bf3     	ldr	x19, [sp, #0x10]
 21ee474: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 21ee478: d65f03c0     	ret
 21ee47c: d63f0040     	blr	x2
 21ee480: aa1303e0     	mov	x0, x19
 21ee484: f9400bf3     	ldr	x19, [sp, #0x10]
 21ee488: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 21ee48c: d65f03c0     	ret
 21ee490: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
 21ee494: 910003fd     	mov	x29, sp
 21ee498: bd400821     	ldr	s1, [x1, #0x8]
 21ee49c: f9400002     	ldr	x2, [x0]
 21ee4a0: f0ffffe1     	adrp	x1, 0x21ed000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x64ee8>
 21ee4a4: 9130c021     	add	x1, x1, #0xc30
 21ee4a8: f9400c42     	ldr	x2, [x2, #0x18]
 21ee4ac: f9000bf3     	str	x19, [sp, #0x10]
 21ee4b0: fd000fe8     	str	d8, [sp, #0x18]
 21ee4b4: aa0003f3     	mov	x19, x0
 21ee4b8: eb01005f     	cmp	x2, x1
 21ee4bc: 7e21d828     	ucvtf	s8, s1
 21ee4c0: 540002c1     	b.ne	0x21ee518 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x66400>
 21ee4c4: 0f000402     	movi	v2.2s, #0x0
 21ee4c8: bd401003     	ldr	s3, [x0, #0x10]
 21ee4cc: 1e222070     	fcmpe	s3, s2
 21ee4d0: 1e204040     	fmov	s0, s2
 21ee4d4: 1e22cc62     	fcsel	s2, s3, s2, gt
 21ee4d8: bd400e61     	ldr	s1, [x19, #0xc]
 21ee4dc: 7e21d821     	ucvtf	s1, s1
 21ee4e0: 1e211901     	fdiv	s1, s8, s1
 21ee4e4: 1e230821     	fmul	s1, s1, s3
 21ee4e8: 1e202030     	fcmpe	s1, s0
 21ee4ec: 540000a5     	b.pl	0x21ee500 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x663e8>
 21ee4f0: f9400bf3     	ldr	x19, [sp, #0x10]
 21ee4f4: fd400fe8     	ldr	d8, [sp, #0x18]
 21ee4f8: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 21ee4fc: d65f03c0     	ret
 21ee500: 1e222030     	fcmpe	s1, s2
 21ee504: fd400fe8     	ldr	d8, [sp, #0x18]
 21ee508: f9400bf3     	ldr	x19, [sp, #0x10]
 21ee50c: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 21ee510: 1e21cc40     	fcsel	s0, s2, s1, gt
 21ee514: d65f03c0     	ret
 21ee518: 9100a3e8     	add	x8, sp, #0x28
 21ee51c: d63f0040     	blr	x2
 21ee520: bd401263     	ldr	s3, [x19, #0x10]
 21ee524: 2d450be0     	ldp	s0, s2, [sp, #0x28]
 21ee528: 17ffffec     	b	0x21ee4d8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x663c0>


runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002188118 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_>:
 21ef320: f9400045     	ldr	x5, [x2]
 21ef324: f9007005     	str	x5, [x0, #0xe0]
 21ef328: b0001e83     	adrp	x3, 0x25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb+0xf4e8>
 21ef32c: 912a7063     	add	x3, x3, #0xa9c
 21ef330: 91002024     	add	x4, x1, #0x8
 21ef334: eb03009f     	cmp	x4, x3
 21ef338: 54000323     	b.lo	0x21ef39c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x67284>
 21ef33c: f240049f     	tst	x4, #0x3
 21ef340: 540002e1     	b.ne	0x21ef39c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x67284>
 21ef344: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
 21ef348: 910003fd     	mov	x29, sp
 21ef34c: a90153f3     	stp	x19, x20, [sp, #0x10]
 21ef350: aa0103f3     	mov	x19, x1
 21ef354: aa0003f4     	mov	x20, x0
 21ef358: a9025bf5     	stp	x21, x22, [sp, #0x20]
 21ef35c: aa0203f5     	mov	x21, x2
 21ef360: d000ce16     	adrp	x22, 0x3bb1000 <stdout+0x6ff40>
 21ef364: 912742d6     	add	x22, x22, #0x9d0
 21ef368: a90363f7     	stp	x23, x24, [sp, #0x30]
 21ef36c: b9400838     	ldr	w24, [x1, #0x8]
 21ef370: 08dffec0     	ldarb	w0, [x22]
 21ef374: d000ce17     	adrp	x23, 0x3bb1000 <stdout+0x6ff40>
 21ef378: 360007c0     	tbz	w0, #0x0, 0x21ef470 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x67358>
 21ef37c: b949dae0     	ldr	w0, [x23, #0x9d8]
 21ef380: 6b00031f     	cmp	w24, w0
 21ef384: 540000e0     	b.eq	0x21ef3a0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x67288>
 21ef388: a94153f3     	ldp	x19, x20, [sp, #0x10]
 21ef38c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 21ef390: a94363f7     	ldp	x23, x24, [sp, #0x30]
 21ef394: a8c57bfd     	ldp	x29, x30, [sp], #0x50
 21ef398: d65f03c0     	ret
 21ef39c: d65f03c0     	ret
 21ef3a0: f9400262     	ldr	x2, [x19]
 21ef3a4: aa1303e0     	mov	x0, x19
 21ef3a8: aa1503e1     	mov	x1, x21
 21ef3ac: f9400842     	ldr	x2, [x2, #0x10]
 21ef3b0: d63f0040     	blr	x2
 21ef3b4: bd40da81     	ldr	s1, [x20, #0xd8]
 21ef3b8: 0f016682     	movi	v2.2s, #0x34, lsl #24
 21ef3bc: 1e213801     	fsub	s1, s0, s1
 21ef3c0: 1e202028     	fcmp	s1, #0.0
 21ef3c4: 1e214023     	fneg	s3, s1
 21ef3c8: 1e21bc61     	fcsel	s1, s3, s1, lt
 21ef3cc: 1e222030     	fcmpe	s1, s2
 21ef3d0: 54fffdc4     	b.mi	0x21ef388 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x67270>
 21ef3d4: 1e3e1001     	fmov	s1, #-1.00000000
 21ef3d8: 1e212010     	fcmpe	s0, s1
 21ef3dc: 540005c4     	b.mi	0x21ef494 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x6737c>
 21ef3e0: 1e2e1001     	fmov	s1, #1.00000000
 21ef3e4: 1e212000     	fcmp	s0, s1
 21ef3e8: 1e21dc00     	fcsel	s0, s0, s1, le
 21ef3ec: 91028297     	add	x23, x20, #0xa0
 21ef3f0: b9400ab8     	ldr	w24, [x21, #0x8]
 21ef3f4: b900de98     	str	w24, [x20, #0xdc]
 21ef3f8: bd00da80     	str	s0, [x20, #0xd8]
 21ef3fc: b94012f3     	ldr	w19, [x23, #0x10]
 21ef400: b9400ae1     	ldr	w1, [x23, #0x8]
 21ef404: 11000676     	add	w22, w19, #0x1
 21ef408: 6b0102df     	cmp	w22, w1
 21ef40c: f9405280     	ldr	x0, [x20, #0xa0]
 21ef410: 5400024d     	b.le	0x21ef458 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x67340>
 21ef414: 0b567ed5     	add	w21, w22, w22, lsr #31
 21ef418: 0b9506d5     	add	w21, w22, w21, asr #1
 21ef41c: 110022b5     	add	w21, w21, #0x8
 21ef420: 121d72b5     	and	w21, w21, #0xfffffff8
 21ef424: 6b15003f     	cmp	w1, w21
 21ef428: 54000180     	b.eq	0x21ef458 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x67340>
 21ef42c: 710002bf     	cmp	w21, #0x0
 21ef430: 5400036d     	b.le	0x21ef49c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x67384>
 21ef434: bd004fe0     	str	s0, [sp, #0x4c]
 21ef438: 937d7ea1     	sbfiz	x1, x21, #3, #32
 21ef43c: b4000400     	cbz	x0, 0x21ef4bc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x673a4>
 21ef440: 9788d418     	bl	0x4244a0 <realloc@plt>
 21ef444: b94012f3     	ldr	w19, [x23, #0x10]
 21ef448: bd404fe0     	ldr	s0, [sp, #0x4c]
 21ef44c: 11000676     	add	w22, w19, #0x1
 21ef450: f9005280     	str	x0, [x20, #0xa0]
 21ef454: b9000af5     	str	w21, [x23, #0x8]
 21ef458: 937d7e73     	sbfiz	x19, x19, #3, #32
 21ef45c: b90012f6     	str	w22, [x23, #0x10]
 21ef460: 8b130001     	add	x1, x0, x19
 21ef464: bc336800     	str	s0, [x0, x19]
 21ef468: b9000438     	str	w24, [x1, #0x4]
 21ef46c: 17ffffc7     	b	0x21ef388 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x67270>
 21ef470: aa1603e0     	mov	x0, x22
 21ef474: d000ce17     	adrp	x23, 0x3bb1000 <stdout+0x6ff40>
 21ef478: 9788db7a     	bl	0x426260 <__cxa_guard_acquire@plt>
 21ef47c: 34fff800     	cbz	w0, 0x21ef37c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x67264>
 21ef480: 97930522     	bl	0x6b0908 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x1fd78>
 21ef484: b909dae0     	str	w0, [x23, #0x9d8]
 21ef488: aa1603e0     	mov	x0, x22
 21ef48c: 9788dced     	bl	0x426840 <__cxa_guard_release@plt>
 21ef490: 17ffffbb     	b	0x21ef37c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x67264>
 21ef494: 1e204020     	fmov	s0, s1
 21ef498: 17ffffd5     	b	0x21ef3ec <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x672d4>
 21ef49c: bd004fe0     	str	s0, [sp, #0x4c]
 21ef4a0: 9788d594     	bl	0x424af0 <free@plt>
 21ef4a4: b94012f3     	ldr	w19, [x23, #0x10]
 21ef4a8: d2800000     	mov	x0, #0x0                // =0
 21ef4ac: f900529f     	str	xzr, [x20, #0xa0]
 21ef4b0: 11000676     	add	w22, w19, #0x1
 21ef4b4: bd404fe0     	ldr	s0, [sp, #0x4c]
 21ef4b8: 17ffffe7     	b	0x21ef454 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x6733c>
 21ef4bc: aa0103e0     	mov	x0, x1
 21ef4c0: 9788d6c4     	bl	0x424fd0 <malloc@plt>
 21ef4c4: f9005280     	str	x0, [x20, #0xa0]
 21ef4c8: bd404fe0     	ldr	s0, [sp, #0x4c]
 21ef4cc: 17ffffe2     	b	0x21ef454 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x6733c>


runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002188118 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_>:
 21f7550: f9406800     	ldr	x0, [x0, #0xd0]
 21f7554: d65f03c0     	ret
 21f7558: d503201f     	nop
 21f755c: d503201f     	nop
 21f7560: f9400800     	ldr	x0, [x0, #0x10]
 21f7564: d65f03c0     	ret
		...
 21f7570: f9406c00     	ldr	x0, [x0, #0xd8]
 21f7574: d65f03c0     	ret
 21f7578: d503201f     	nop
 21f757c: d503201f     	nop
 21f7580: f9400c00     	ldr	x0, [x0, #0x18]
 21f7584: d65f03c0     	ret
		...
 21f7590: f9407000     	ldr	x0, [x0, #0xe0]
 21f7594: d65f03c0     	ret
 21f7598: d503201f     	nop
 21f759c: d503201f     	nop
 21f75a0: aa0003e1     	mov	x1, x0
 21f75a4: d2800000     	mov	x0, #0x0                // =0
 21f75a8: 39408022     	ldrb	w2, [x1, #0x20]
 21f75ac: b9402421     	ldr	w1, [x1, #0x24]
 21f75b0: b3401c40     	bfxil	x0, x2, #0, #8
 21f75b4: b3607c20     	bfi	x0, x1, #32, #32
 21f75b8: d65f03c0     	ret


runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002188118 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_>:
 21f4950: 90001e64     	adrp	x4, 0x25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb+0xf4e8>
 21f4954: 912a7084     	add	x4, x4, #0xa9c
 21f4958: 91002025     	add	x5, x1, #0x8
 21f495c: eb0400bf     	cmp	x5, x4
 21f4960: 54000243     	b.lo	0x21f49a8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x6c890>
 21f4964: f24004bf     	tst	x5, #0x3
 21f4968: 54000201     	b.ne	0x21f49a8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x6c890>
 21f496c: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
 21f4970: 910003fd     	mov	x29, sp
 21f4974: a9025bf5     	stp	x21, x22, [sp, #0x20]
 21f4978: aa0203f5     	mov	x21, x2
 21f497c: b9400836     	ldr	w22, [x1, #0x8]
 21f4980: a90153f3     	stp	x19, x20, [sp, #0x10]
 21f4984: aa0003f4     	mov	x20, x0
 21f4988: aa0103f3     	mov	x19, x1
 21f498c: 94001b25     	bl	0x21fb620 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x73508>
 21f4990: 6b0002df     	cmp	w22, w0
 21f4994: 540000c0     	b.eq	0x21f49ac <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x6c894>
 21f4998: a94153f3     	ldp	x19, x20, [sp, #0x10]
 21f499c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 21f49a0: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 21f49a4: d65f03c0     	ret
 21f49a8: d65f03c0     	ret
 21f49ac: f9400281     	ldr	x1, [x20]
 21f49b0: f0000000     	adrp	x0, 0x21f7000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x6eee8>
 21f49b4: 91154000     	add	x0, x0, #0x550
 21f49b8: f9400262     	ldr	x2, [x19]
 21f49bc: f9401421     	ldr	x1, [x1, #0x28]
 21f49c0: f9400856     	ldr	x22, [x2, #0x10]
 21f49c4: eb00003f     	cmp	x1, x0
 21f49c8: 54000161     	b.ne	0x21f49f4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x6c8dc>
 21f49cc: f9406a80     	ldr	x0, [x20, #0xd0]
 21f49d0: d0ffffe1     	adrp	x1, 0x21f2000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x69ee8>
 21f49d4: 913b0021     	add	x1, x1, #0xec0
 21f49d8: eb0102df     	cmp	x22, x1
 21f49dc: 54000121     	b.ne	0x21f4a00 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x6c8e8>
 21f49e0: d1010260     	sub	x0, x19, #0x40
 21f49e4: a94153f3     	ldp	x19, x20, [sp, #0x10]
 21f49e8: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 21f49ec: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 21f49f0: 17fff810     	b	0x21f2a30 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x6a918>
 21f49f4: aa1403e0     	mov	x0, x20
 21f49f8: d63f0020     	blr	x1
 21f49fc: 17fffff5     	b	0x21f49d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x6c8b8>
 21f4a00: aa1503e3     	mov	x3, x21
 21f4a04: aa0003e2     	mov	x2, x0
 21f4a08: 91030281     	add	x1, x20, #0xc0
 21f4a0c: aa1303e0     	mov	x0, x19
 21f4a10: aa1603e4     	mov	x4, x22
 21f4a14: a94153f3     	ldp	x19, x20, [sp, #0x10]
 21f4a18: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 21f4a1c: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 21f4a20: d61f0080     	br	x4
