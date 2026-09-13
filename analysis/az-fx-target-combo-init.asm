
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000018c72e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc7458>:
 18c72e0:	aa1403e0 	mov	x0, x20
 18c72e4:	94303877 	bl	24d54c0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x1600a0>
 18c72e8:	aa1503e0 	mov	x0, x21
 18c72ec:	9428d4c5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 18c72f0:	900084a0 	adrp	x0, 295b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3981a8>
 18c72f4:	91364000 	add	x0, x0, #0xd90
 18c72f8:	f0011433 	adrp	x19, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
 18c72fc:	9110a273 	add	x19, x19, #0x428
 18c7300:	f900ce80 	str	x0, [x20,#408]
 18c7304:	08dffe60 	ldarb	w0, [x19]
 18c7308:	f0011437 	adrp	x23, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
 18c730c:	36003140 	tbz	w0, #0, 18c7934 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc7aac>
 18c7310:	b94432e6 	ldr	w6, [x23,#1072]
 18c7314:	900084c5 	adrp	x5, 295f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x39c1a8>
 18c7318:	900084c0 	adrp	x0, 295f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x39c1a8>
 18c731c:	913940a5 	add	x5, x5, #0xe50
 18c7320:	913fe000 	add	x0, x0, #0xff8
 18c7324:	b00084c4 	adrp	x4, 2960000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x39d1a8>
 18c7328:	b00084c3 	adrp	x3, 2960000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x39d1a8>
 18c732c:	9100a084 	add	x4, x4, #0x28
 18c7330:	91014063 	add	x3, x3, #0x50
 18c7334:	b00084c2 	adrp	x2, 2960000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x39d1a8>
 18c7338:	b00084c1 	adrp	x1, 2960000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x39d1a8>
 18c733c:	9101e042 	add	x2, x2, #0x78
 18c7340:	91028021 	add	x1, x1, #0xa0
 18c7344:	f9000285 	str	x5, [x20]
 18c7348:	f9006680 	str	x0, [x20,#200]
 18c734c:	9106e288 	add	x8, x20, #0x1b8
 18c7350:	a90d8e84 	stp	x4, x3, [x20,#216]
 18c7354:	aa1603e0 	mov	x0, x22
 18c7358:	a9198682 	stp	x2, x1, [x20,#408]
 18c735c:	f900da98 	str	x24, [x20,#432]
 18c7360:	b901aa86 	str	w6, [x20,#424]
 18c7364:	f94002c1 	ldr	x1, [x22]
 18c7368:	f9409c21 	ldr	x1, [x1,#312]
 18c736c:	d63f0020 	blr	x1
 18c7370:	52800082 	mov	w2, #0x4                   	// #4
 18c7374:	d0008621 	adrp	x1, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 18c7378:	91072296 	add	x22, x20, #0x1c8
 18c737c:	91002021 	add	x1, x1, #0x8
 18c7380:	910022a0 	add	x0, x21, #0x8
 18c7384:	b900b3e2 	str	w2, [sp,#176]
 18c7388:	9429b256 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c738c:	528000a2 	mov	w2, #0x5                   	// #5
 18c7390:	d0008621 	adrp	x1, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 18c7394:	910062a0 	add	x0, x21, #0x18
 18c7398:	91004021 	add	x1, x1, #0x10
 18c739c:	b900c3e2 	str	w2, [sp,#192]
 18c73a0:	9429b250 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c73a4:	52800062 	mov	w2, #0x3                   	// #3
 18c73a8:	d0008621 	adrp	x1, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 18c73ac:	9100a2a0 	add	x0, x21, #0x28
 18c73b0:	91006021 	add	x1, x1, #0x18
 18c73b4:	b900d3e2 	str	w2, [sp,#208]
 18c73b8:	9429b24a 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c73bc:	528000c2 	mov	w2, #0x6                   	// #6
 18c73c0:	d0008621 	adrp	x1, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 18c73c4:	9100e2a0 	add	x0, x21, #0x38
 18c73c8:	91008021 	add	x1, x1, #0x20
 18c73cc:	b900e3e2 	str	w2, [sp,#224]
 18c73d0:	9429b244 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c73d4:	528000e2 	mov	w2, #0x7                   	// #7
 18c73d8:	d0008621 	adrp	x1, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 18c73dc:	910122a0 	add	x0, x21, #0x48
 18c73e0:	9100a021 	add	x1, x1, #0x28
 18c73e4:	b900f3e2 	str	w2, [sp,#240]
 18c73e8:	9429b23e 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c73ec:	d0008621 	adrp	x1, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 18c73f0:	910162a0 	add	x0, x21, #0x58
 18c73f4:	9100c021 	add	x1, x1, #0x30
 18c73f8:	b90103ff 	str	wzr, [sp,#256]
 18c73fc:	9429b239 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c7400:	52800022 	mov	w2, #0x1                   	// #1
 18c7404:	d0008621 	adrp	x1, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 18c7408:	9101a2a0 	add	x0, x21, #0x68
 18c740c:	9100e021 	add	x1, x1, #0x38
 18c7410:	b90113e2 	str	w2, [sp,#272]
 18c7414:	9429b233 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c7418:	52800042 	mov	w2, #0x2                   	// #2
 18c741c:	d0008621 	adrp	x1, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 18c7420:	9101e2a0 	add	x0, x21, #0x78
 18c7424:	91010021 	add	x1, x1, #0x40
 18c7428:	b90123e2 	str	w2, [sp,#288]
 18c742c:	9429b22d 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 18c7430:	aa1503e1 	mov	x1, x21
 18c7434:	d2800102 	mov	x2, #0x8                   	// #8
 18c7438:	aa1603e0 	mov	x0, x22
 18c743c:	97ffb00b 	bl	18b3468 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xb35e0>
 18c7440:	a95ce280 	ldp	x0, x24, [x20,#456]
 18c7444:	a9046bf9 	stp	x25, x26, [sp,#64]
 18c7448:	d2800019 	mov	x25, #0x0                   	// #0
 18c744c:	a9097fff 	stp	xzr, xzr, [sp,#144]
 18c7450:	f90053ff 	str	xzr, [sp,#160]
 18c7454:	cb000313 	sub	x19, x24, x0
 18c7458:	9344fe61 	asr	x1, x19, #4
 18c745c:	b4000101 	cbz	x1, 18c747c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc75f4>
 18c7460:	92fe0000 	mov	x0, #0xfffffffffffffff     	// #1152921504606846975
 18c7464:	eb00003f 	cmp	x1, x0
 18c7468:	54002aa8 	b.hi	18c79bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc7b34>
 18c746c:	aa1303e0 	mov	x0, x19
 18c7470:	97ad7634 	bl	424d40 <_Znwm@plt>
 18c7474:	aa0003f9 	mov	x25, x0
 18c7478:	a95ce280 	ldp	x0, x24, [x20,#456]
 18c747c:	4e080f20 	dup	v0.2d, x25
 18c7480:	8b130333 	add	x19, x25, x19
 18c7484:	f90053f3 	str	x19, [sp,#160]
 18c7488:	eb00031f 	cmp	x24, x0
 18c748c:	3d8027e0 	str	q0, [sp,#144]
 18c7490:	540027c0 	b.eq	18c7988 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc7b00>
 18c7494:	d100431a 	sub	x26, x24, #0x10
 18c7498:	91002013 	add	x19, x0, #0x8
 18c749c:	cb00035a 	sub	x26, x26, x0
 18c74a0:	91002318 	add	x24, x24, #0x8
 18c74a4:	aa1903f7 	mov	x23, x25
 18c74a8:	d344ff5a 	lsr	x26, x26, #4
 18c74ac:	d503201f 	nop
 18c74b0:	aa1703e0 	mov	x0, x23
 18c74b4:	b85f8262 	ldur	w2, [x19,#-8]
 18c74b8:	aa1303e1 	mov	x1, x19
 18c74bc:	91004273 	add	x19, x19, #0x10
 18c74c0:	910042f7 	add	x23, x23, #0x10
 18c74c4:	b8008402 	str	w2, [x0],#8
 18c74c8:	9429201a 	bl	230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187418>
 18c74cc:	eb13031f 	cmp	x24, x19
 18c74d0:	54ffff01 	b.ne	18c74b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc7628>
 18c74d4:	91000744 	add	x4, x26, #0x1
 18c74d8:	f9404be1 	ldr	x1, [sp,#144]
 18c74dc:	8b041324 	add	x4, x25, x4, lsl #4
 18c74e0:	f9004fe4 	str	x4, [sp,#152]
 18c74e4:	cb010080 	sub	x0, x4, x1
 18c74e8:	9346fc02 	asr	x2, x0, #6
 18c74ec:	9344fc03 	asr	x3, x0, #4
 18c74f0:	f100005f 	cmp	x2, #0x0
 18c74f4:	5400260d 	b.le	18c79b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc7b2c>
 18c74f8:	b9400020 	ldr	w0, [x1]
 18c74fc:	37f80420 	tbnz	w0, #31, 18c7580 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc76f8>
 18c7500:	b9401020 	ldr	w0, [x1,#16]
 18c7504:	37f82500 	tbnz	w0, #31, 18c79a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc7b1c>
 18c7508:	b9402020 	ldr	w0, [x1,#32]
 18c750c:	37f82480 	tbnz	w0, #31, 18c799c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc7b14>
 18c7510:	b9403020 	ldr	w0, [x1,#48]
 18c7514:	36f80160 	tbz	w0, #31, 18c7540 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc76b8>
 18c7518:	14000125 	b	18c79ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xc7b24>
 18c751c:	b9404023 	ldr	w3, [x1,#64]
