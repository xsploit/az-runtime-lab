
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000020213f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821568>:
 20213f0:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
 20213f4:	910003fd 	mov	x29, sp
 20213f8:	a90153f3 	stp	x19, x20, [sp,#16]
 20213fc:	aa0003f4 	mov	x20, x0
 2021400:	9000dc73 	adrp	x19, 3bad000 <stdout@@GLIBC_2.17+0x6bf40>
 2021404:	9107a273 	add	x19, x19, #0x1e8
 2021408:	a9025bf5 	stp	x21, x22, [sp,#32]
 202140c:	aa0203f6 	mov	x22, x2
 2021410:	a90363f7 	stp	x23, x24, [sp,#48]
 2021414:	aa0103f7 	mov	x23, x1
 2021418:	08dffe60 	ldarb	w0, [x19]
 202141c:	9000dc75 	adrp	x21, 3bad000 <stdout@@GLIBC_2.17+0x6bf40>
 2021420:	36000f80 	tbz	w0, #0, 2021610 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821788>
 2021424:	d0006ee0 	adrp	x0, 2dff000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x83c1a8>
 2021428:	912ee000 	add	x0, x0, #0xbb8
 202142c:	b941f2a2 	ldr	w2, [x21,#496]
 2021430:	9000dc73 	adrp	x19, 3bad000 <stdout@@GLIBC_2.17+0x6bf40>
 2021434:	f94002e1 	ldr	x1, [x23]
 2021438:	9106c273 	add	x19, x19, #0x1b0
 202143c:	f9000280 	str	x0, [x20]
 2021440:	b9000a82 	str	w2, [x20,#8]
 2021444:	a9015a81 	stp	x1, x22, [x20,#16]
 2021448:	3900829f 	strb	wzr, [x20,#32]
 202144c:	08dffe60 	ldarb	w0, [x19]
 2021450:	36000740 	tbz	w0, #0, 2021538 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8216b0>
 2021454:	08dffe60 	ldarb	w0, [x19]
 2021458:	36000a80 	tbz	w0, #0, 20215a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821720>
 202145c:	9000dc60 	adrp	x0, 3bad000 <stdout@@GLIBC_2.17+0x6bf40>
 2021460:	91078000 	add	x0, x0, #0x1e0
 2021464:	88dffc01 	ldar	w1, [x0]
 2021468:	37f80fa1 	tbnz	w1, #31, 202165c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8217d4>
 202146c:	11000422 	add	w2, w1, #0x1
 2021470:	885ffc03 	ldaxr	w3, [x0]
 2021474:	6b01007f 	cmp	w3, w1
 2021478:	54000061 	b.ne	2021484 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8215fc>
 202147c:	8804fc02 	stlxr	w4, w2, [x0]
 2021480:	35ffff84 	cbnz	w4, 2021470 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8215e8>
 2021484:	54ffff01 	b.ne	2021464 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8215dc>
 2021488:	9000dc62 	adrp	x2, 3bad000 <stdout@@GLIBC_2.17+0x6bf40>
 202148c:	9106e042 	add	x2, x2, #0x1b8
 2021490:	f9400a81 	ldr	x1, [x20,#16]
 2021494:	b9801843 	ldrsw	x3, [x2,#24]
 2021498:	f9400444 	ldr	x4, [x2,#8]
 202149c:	9ac30822 	udiv	x2, x1, x3
 20214a0:	9b038442 	msub	x2, x2, x3, x1
 20214a4:	f862d893 	ldr	x19, [x4,w2,sxtw #3]
 20214a8:	b5000093 	cbnz	x19, 20214b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821630>
 20214ac:	14000007 	b	20214c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821640>
 20214b0:	f9400a73 	ldr	x19, [x19,#16]
 20214b4:	b40000b3 	cbz	x19, 20214c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821640>
 20214b8:	f9400262 	ldr	x2, [x19]
 20214bc:	eb02003f 	cmp	x1, x2
 20214c0:	54ffff81 	b.ne	20214b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821628>
 20214c4:	f9400673 	ldr	x19, [x19,#8]
 20214c8:	88dffc01 	ldar	w1, [x0]
 20214cc:	7100003f 	cmp	w1, #0x0
 20214d0:	5400128d 	b.le	2021720 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821898>
 20214d4:	51000422 	sub	w2, w1, #0x1
 20214d8:	885ffc03 	ldaxr	w3, [x0]
 20214dc:	6b01007f 	cmp	w3, w1
 20214e0:	54000061 	b.ne	20214ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821664>
 20214e4:	8804fc02 	stlxr	w4, w2, [x0]
 20214e8:	35ffff84 	cbnz	w4, 20214d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821650>
 20214ec:	54fffee1 	b.ne	20214c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821640>
 20214f0:	b4000b73 	cbz	x19, 202165c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8217d4>
 20214f4:	f9400261 	ldr	x1, [x19]
 20214f8:	aa1303e0 	mov	x0, x19
 20214fc:	f9400c21 	ldr	x1, [x1,#24]
 2021500:	d63f0020 	blr	x1
 2021504:	f9400262 	ldr	x2, [x19]
 2021508:	7100041f 	cmp	w0, #0x1
 202150c:	1a9f17e0 	cset	w0, eq
 2021510:	39008280 	strb	w0, [x20,#32]
 2021514:	aa1403e1 	mov	x1, x20
 2021518:	aa1303e0 	mov	x0, x19
 202151c:	f9401842 	ldr	x2, [x2,#48]
 2021520:	d63f0040 	blr	x2
 2021524:	a94153f3 	ldp	x19, x20, [sp,#16]
 2021528:	a9425bf5 	ldp	x21, x22, [sp,#32]
 202152c:	a94363f7 	ldp	x23, x24, [sp,#48]
 2021530:	a8c87bfd 	ldp	x29, x30, [sp],#128
 2021534:	d65f03c0 	ret
 2021538:	aa1303e0 	mov	x0, x19
 202153c:	97901349 	bl	426260 <__cxa_guard_acquire@plt>
 2021540:	34fff8a0 	cbz	w0, 2021454 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8215cc>
 2021544:	9000dc75 	adrp	x21, 3bad000 <stdout@@GLIBC_2.17+0x6bf40>
 2021548:	9106e2b5 	add	x21, x21, #0x1b8
 202154c:	d2809800 	mov	x0, #0x4c0                 	// #1216
 2021550:	b90022bf 	str	wzr, [x21,#32]
 2021554:	97900e9f 	bl	424fd0 <malloc@plt>
 2021558:	f90006a0 	str	x0, [x21,#8]
 202155c:	52801304 	mov	w4, #0x98                  	// #152
 2021560:	52800ca3 	mov	w3, #0x65                  	// #101
 2021564:	b90012a4 	str	w4, [x21,#16]
 2021568:	d2806502 	mov	x2, #0x328                 	// #808
 202156c:	b9001aa3 	str	w3, [x21,#24]
 2021570:	52800001 	mov	w1, #0x0                   	// #0
 2021574:	97900c1f 	bl	4245f0 <memset@plt>
 2021578:	b9002abf 	str	wzr, [x21,#40]
 202157c:	aa1303e0 	mov	x0, x19
 2021580:	979014b0 	bl	426840 <__cxa_guard_release@plt>
 2021584:	aa1503e1 	mov	x1, x21
 2021588:	b000d822 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
 202158c:	90000000 	adrp	x0, 2021000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821178>
