
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000018c8200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8378>:
 18c8200:	f00084a5 	adrp	x5, 295f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x39c1a8>
 18c8204:	f00084a0 	adrp	x0, 295f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x39c1a8>
 18c8208:	912f60a5 	add	x5, x5, #0xbd8
 18c820c:	91360000 	add	x0, x0, #0xd80
 18c8210:	f00084a4 	adrp	x4, 295f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x39c1a8>
 18c8214:	f00084a3 	adrp	x3, 295f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x39c1a8>
 18c8218:	9136c084 	add	x4, x4, #0xdb0
 18c821c:	91376063 	add	x3, x3, #0xdd8
 18c8220:	f00084a2 	adrp	x2, 295f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x39c1a8>
 18c8224:	f00084a1 	adrp	x1, 295f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x39c1a8>
 18c8228:	91380042 	add	x2, x2, #0xe00
 18c822c:	9138a021 	add	x1, x1, #0xe28
 18c8230:	f90002a5 	str	x5, [x21]
 18c8234:	f90066a0 	str	x0, [x21,#200]
 18c8238:	9106e2a8 	add	x8, x21, #0x1b8
 18c823c:	a90d8ea4 	stp	x4, x3, [x21,#216]
 18c8240:	aa1603e0 	mov	x0, x22
 18c8244:	a91986a2 	stp	x2, x1, [x21,#408]
 18c8248:	f900dab8 	str	x24, [x21,#432]
 18c824c:	b901aaa6 	str	w6, [x21,#424]
 18c8250:	f94002c1 	ldr	x1, [x22]
 18c8254:	f940a821 	ldr	x1, [x1,#336]
 18c8258:	d63f0020 	blr	x1
 18c825c:	52800022 	mov	w2, #0x1                   	// #1
 18c8260:	90008621 	adrp	x1, 298c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3c91a8>
 18c8264:	910722b6 	add	x22, x21, #0x1c8
 18c8268:	913da021 	add	x1, x1, #0xf68
 18c826c:	91002280 	add	x0, x20, #0x8
 18c8270:	b90093e2 	str	w2, [sp,#144]
 18c8274:	9429ae9b 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c8278:	90008621 	adrp	x1, 298c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3c91a8>
 18c827c:	91006280 	add	x0, x20, #0x18
 18c8280:	913dc021 	add	x1, x1, #0xf70
 18c8284:	b900a3ff 	str	wzr, [sp,#160]
 18c8288:	9429ae96 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c828c:	52800042 	mov	w2, #0x2                   	// #2
 18c8290:	90008621 	adrp	x1, 298c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3c91a8>
 18c8294:	9100a280 	add	x0, x20, #0x28
 18c8298:	913de021 	add	x1, x1, #0xf78
 18c829c:	b900b3e2 	str	w2, [sp,#176]
 18c82a0:	9429ae90 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c82a4:	52800062 	mov	w2, #0x3                   	// #3
 18c82a8:	90008621 	adrp	x1, 298c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3c91a8>
 18c82ac:	9100e280 	add	x0, x20, #0x38
 18c82b0:	913e2021 	add	x1, x1, #0xf88
 18c82b4:	b900c3e2 	str	w2, [sp,#192]
 18c82b8:	9429ae8a 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c82bc:	528000a2 	mov	w2, #0x5                   	// #5
 18c82c0:	90008621 	adrp	x1, 298c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3c91a8>
 18c82c4:	91012280 	add	x0, x20, #0x48
 18c82c8:	913e4021 	add	x1, x1, #0xf90
 18c82cc:	b900d3e2 	str	w2, [sp,#208]
 18c82d0:	9429ae84 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c82d4:	52800142 	mov	w2, #0xa                   	// #10
 18c82d8:	90008621 	adrp	x1, 298c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3c91a8>
 18c82dc:	91016280 	add	x0, x20, #0x58
 18c82e0:	913e6021 	add	x1, x1, #0xf98
 18c82e4:	b900e3e2 	str	w2, [sp,#224]
 18c82e8:	9429ae7e 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c82ec:	52800102 	mov	w2, #0x8                   	// #8
 18c82f0:	90006d21 	adrp	x1, 266c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xa91a8>
 18c82f4:	9101a280 	add	x0, x20, #0x68
 18c82f8:	91286021 	add	x1, x1, #0xa18
 18c82fc:	b900f3e2 	str	w2, [sp,#240]
 18c8300:	9429ae78 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c8304:	528000c2 	mov	w2, #0x6                   	// #6
 18c8308:	90008621 	adrp	x1, 298c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3c91a8>
 18c830c:	9101e280 	add	x0, x20, #0x78
 18c8310:	913e8021 	add	x1, x1, #0xfa0
 18c8314:	b90103e2 	str	w2, [sp,#256]
 18c8318:	9429ae72 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c831c:	528000e2 	mov	w2, #0x7                   	// #7
 18c8320:	90008621 	adrp	x1, 298c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3c91a8>
 18c8324:	91022280 	add	x0, x20, #0x88
 18c8328:	913ea021 	add	x1, x1, #0xfa8
 18c832c:	b90113e2 	str	w2, [sp,#272]
 18c8330:	9429ae6c 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c8334:	528001e2 	mov	w2, #0xf                   	// #15
 18c8338:	90008621 	adrp	x1, 298c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3c91a8>
 18c833c:	91026280 	add	x0, x20, #0x98
 18c8340:	913ec021 	add	x1, x1, #0xfb0
 18c8344:	b90123e2 	str	w2, [sp,#288]
 18c8348:	9429ae66 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c834c:	528001c2 	mov	w2, #0xe                   	// #14
 18c8350:	90008621 	adrp	x1, 298c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3c91a8>
 18c8354:	9102a280 	add	x0, x20, #0xa8
 18c8358:	913ee021 	add	x1, x1, #0xfb8
 18c835c:	b90133e2 	str	w2, [sp,#304]
 18c8360:	9429ae60 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c8364:	52800162 	mov	w2, #0xb                   	// #11
 18c8368:	90008621 	adrp	x1, 298c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3c91a8>
 18c836c:	9102e280 	add	x0, x20, #0xb8
 18c8370:	913f2021 	add	x1, x1, #0xfc8
 18c8374:	b90143e2 	str	w2, [sp,#320]
 18c8378:	9429ae5a 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c837c:	52800202 	mov	w2, #0x10                  	// #16
 18c8380:	90008621 	adrp	x1, 298c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3c91a8>
 18c8384:	91032280 	add	x0, x20, #0xc8
 18c8388:	913f4021 	add	x1, x1, #0xfd0
 18c838c:	b90153e2 	str	w2, [sp,#336]
 18c8390:	9429ae54 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c8394:	52800082 	mov	w2, #0x4                   	// #4
 18c8398:	90008621 	adrp	x1, 298c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3c91a8>
 18c839c:	91036280 	add	x0, x20, #0xd8
 18c83a0:	913f8021 	add	x1, x1, #0xfe0
 18c83a4:	b90163e2 	str	w2, [sp,#352]
 18c83a8:	9429ae4e 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c83ac:	aa1403e1 	mov	x1, x20
 18c83b0:	d28001c2 	mov	x2, #0xe                   	// #14
 18c83b4:	aa1603e0 	mov	x0, x22
 18c83b8:	97ffa992 	bl	18b2a00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb2b78>
 18c83bc:	aa1603e1 	mov	x1, x22
 18c83c0:	9101e3e0 	add	x0, sp, #0x78
 18c83c4:	97ff64d3 	bl	18a1710 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xa1888>
 18c83c8:	a94793e1 	ldp	x1, x4, [sp,#120]
 18c83cc:	cb010080 	sub	x0, x4, x1
 18c83d0:	9346fc03 	asr	x3, x0, #6
 18c83d4:	9344fc02 	asr	x2, x0, #4
 18c83d8:	f100007f 	cmp	x3, #0x0
 18c83dc:	54001fed 	b.le	18c87d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8950>
 18c83e0:	b9400020 	ldr	w0, [x1]
 18c83e4:	37f816c0 	tbnz	w0, #31, 18c86bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8834>
 18c83e8:	b9401020 	ldr	w0, [x1,#16]
 18c83ec:	37f81fe0 	tbnz	w0, #31, 18c87e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8960>
 18c83f0:	b9402020 	ldr	w0, [x1,#32]
 18c83f4:	37f81f60 	tbnz	w0, #31, 18c87e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8958>
 18c83f8:	b9403020 	ldr	w0, [x1,#48]
 18c83fc:	8b031823 	add	x3, x1, x3, lsl #6
 18c8400:	36f80160 	tbz	w0, #31, 18c842c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc85a4>
 18c8404:	140000fb 	b	18c87f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8968>
 18c8408:	b9404022 	ldr	w2, [x1,#64]
 18c840c:	37f815a2 	tbnz	w2, #31, 18c86c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8838>
 18c8410:	b9401002 	ldr	w2, [x0,#16]
 18c8414:	37f81c82 	tbnz	w2, #31, 18c87a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc891c>
 18c8418:	b9402002 	ldr	w2, [x0,#32]
 18c841c:	37f81c82 	tbnz	w2, #31, 18c87ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8924>
 18c8420:	b9403002 	ldr	w2, [x0,#48]
 18c8424:	37f81c82 	tbnz	w2, #31, 18c87b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc892c>
 18c8428:	aa0003e1 	mov	x1, x0
 18c842c:	91010020 	add	x0, x1, #0x40
 18c8430:	eb00007f 	cmp	x3, x0
 18c8434:	54fffea1 	b.ne	18c8408 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8580>
 18c8438:	cb000082 	sub	x2, x4, x0
 18c843c:	9344fc42 	asr	x2, x2, #4
 18c8440:	f100085f 	cmp	x2, #0x2
 18c8444:	54001c20 	b.eq	18c87c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8940>
 18c8448:	f1000c5f 	cmp	x2, #0x3
 18c844c:	54001b80 	b.eq	18c87bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8934>
 18c8450:	f100045f 	cmp	x2, #0x1
 18c8454:	54000061 	b.ne	18c8460 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc85d8>
 18c8458:	b9400001 	ldr	w1, [x0]
 18c845c:	37f81321 	tbnz	w1, #31, 18c86c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8838>
 18c8460:	9101e3e0 	add	x0, sp, #0x78
 18c8464:	97ff04fd 	bl	1889858 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x899d0>
 18c8468:	91034293 	add	x19, x20, #0xd0
 18c846c:	d503201f 	nop
 18c8470:	91002260 	add	x0, x19, #0x8
 18c8474:	9428d063 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 18c8478:	eb14027f 	cmp	x19, x20
 18c847c:	d1004273 	sub	x19, x19, #0x10
 18c8480:	54ffff81 	b.ne	18c8470 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc85e8>
 18c8484:	90008621 	adrp	x1, 298c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3c91a8>
 18c8488:	aa1403e0 	mov	x0, x20
 18c848c:	913fa021 	add	x1, x1, #0xfe8
 18c8490:	9429ae14 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c8494:	aa1403e1 	mov	x1, x20
 18c8498:	aa1503e0 	mov	x0, x21
 18c849c:	942e3c55 	bl	24575f0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0xe21d0>
 18c84a0:	aa1403e0 	mov	x0, x20
 18c84a4:	9428d057 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 18c84a8:	52800061 	mov	w1, #0x3                   	// #3
 18c84ac:	aa1503e0 	mov	x0, x21
 18c84b0:	94302e68 	bl	24d3e50 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x15ea30>
 18c84b4:	aa1603e1 	mov	x1, x22
 18c84b8:	9101e3e0 	add	x0, sp, #0x78
 18c84bc:	97ff6495 	bl	18a1710 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xa1888>
 18c84c0:	a947dff3 	ldp	x19, x23, [sp,#120]
 18c84c4:	eb17027f 	cmp	x19, x23
 18c84c8:	54000140 	b.eq	18c84f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc8668>
 18c84cc:	d503201f 	nop
 18c84d0:	aa1303e1 	mov	x1, x19
 18c84d4:	aa1503e0 	mov	x0, x21
 18c84d8:	b8408422 	ldr	w2, [x1],#8
 18c84dc:	11000442 	add	w2, w2, #0x1
