
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002131378 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9314f0>:
 2131378:	39417002 	ldrb	w2, [x0,#92]
 213137c:	340004e2 	cbz	w2, 2131418 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931590>
 2131380:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 2131384:	910003fd 	mov	x29, sp
 2131388:	b9400023 	ldr	w3, [x1]
 213138c:	39419002 	ldrb	w2, [x0,#100]
 2131390:	b9406000 	ldr	w0, [x0,#96]
 2131394:	b9002be0 	str	w0, [sp,#40]
 2131398:	4a837c63 	eor	w3, w3, w3, asr #31
 213139c:	3900b3e2 	strb	w2, [sp,#44]
 21313a0:	7100047f 	cmp	w3, #0x1
 21313a4:	540002a0 	b.eq	21313f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931570>
 21313a8:	540003ad 	b.le	213141c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931594>
 21313ac:	7100087f 	cmp	w3, #0x2
 21313b0:	54000201 	b.ne	21313f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931568>
 21313b4:	9100c3e0 	add	x0, sp, #0x30
 21313b8:	91002021 	add	x1, x1, #0x8
 21313bc:	97fffcb7 	bl	2130698 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930810>
 21313c0:	f9401be0 	ldr	x0, [sp,#48]
 21313c4:	b40000c0 	cbz	x0, 21313dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931554>
 21313c8:	f9400003 	ldr	x3, [x0]
 21313cc:	9100a3e1 	add	x1, sp, #0x28
 21313d0:	3940b3e2 	ldrb	w2, [sp,#44]
 21313d4:	f9400c63 	ldr	x3, [x3,#24]
 21313d8:	d63f0060 	blr	x3
 21313dc:	f9401fe0 	ldr	x0, [sp,#56]
 21313e0:	b4000040 	cbz	x0, 21313e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931560>
 21313e4:	97950bbd 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 21313e8:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21313ec:	d65f03c0 	ret
 21313f0:	71000c7f 	cmp	w3, #0x3
 21313f4:	54000161 	b.ne	2131420 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931598>
 21313f8:	f9400420 	ldr	x0, [x1,#8]
 21313fc:	b4ffff60 	cbz	x0, 21313e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931560>
 2131400:	f9400003 	ldr	x3, [x0]
 2131404:	9100a3e1 	add	x1, sp, #0x28
 2131408:	f9400c63 	ldr	x3, [x3,#24]
 213140c:	d63f0060 	blr	x3
 2131410:	a8c47bfd 	ldp	x29, x30, [sp],#64
 2131414:	d65f03c0 	ret
 2131418:	d65f03c0 	ret
 213141c:	34fffe63 	cbz	w3, 21313e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931560>
 2131420:	f9000bf3 	str	x19, [sp,#16]
 2131424:	978bd56f 	bl	4269e0 <abort@plt>
 2131428:	f9401fe1 	ldr	x1, [sp,#56]
 213142c:	f9000bf3 	str	x19, [sp,#16]
 2131430:	aa0003f3 	mov	x19, x0
 2131434:	b4000061 	cbz	x1, 2131440 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9315b8>
 2131438:	aa0103e0 	mov	x0, x1
 213143c:	97950ba7 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 2131440:	aa1303e0 	mov	x0, x19
 2131444:	978bce33 	bl	424d10 <_Unwind_Resume@plt>
 2131448:	3941a002 	ldrb	w2, [x0,#104]
 213144c:	35000042 	cbnz	w2, 2131454 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9315cc>
 2131450:	d65f03c0 	ret
 2131454:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 2131458:	910003fd 	mov	x29, sp
 213145c:	3941b003 	ldrb	w3, [x0,#108]
 2131460:	7846d002 	ldurh	w2, [x0,#109]
 2131464:	3941a804 	ldrb	w4, [x0,#106]
 2131468:	7100147f 	cmp	w3, #0x5
 213146c:	39c1ac05 	ldrsb	w5, [x0,#107]
 2131470:	5ac00442 	rev16	w2, w2
 2131474:	79c0e000 	ldrsh	w0, [x0,#112]
 2131478:	540001c0 	b.eq	21314b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931628>
 213147c:	b90033ff 	str	wzr, [sp,#48]
 2131480:	79006be0 	strh	w0, [sp,#52]
 2131484:	79006fe2 	strh	w2, [sp,#54]
 2131488:	790073e5 	strh	w5, [sp,#56]
 213148c:	3900ebe4 	strb	w4, [sp,#58]
 2131490:	9100c3e0 	add	x0, sp, #0x30
 2131494:	3900f3e3 	strb	w3, [sp,#60]
 2131498:	94001446 	bl	21365b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x936728>
 213149c:	9100c3e0 	add	x0, sp, #0x30
 21314a0:	9100a3e1 	add	x1, sp, #0x28
 21314a4:	94000cdb 	bl	2134810 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x934988>
 21314a8:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21314ac:	d65f03c0 	ret
 21314b0:	52800022 	mov	w2, #0x1                   	// #1
 21314b4:	b90033e2 	str	w2, [sp,#48]
 21314b8:	79006be0 	strh	w0, [sp,#52]
 21314bc:	17fffff5 	b	2131490 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931608>
 21314c0:	9100a3e1 	add	x1, sp, #0x28
 21314c4:	f9000bf3 	str	x19, [sp,#16]
 21314c8:	aa0003f3 	mov	x19, x0
 21314cc:	9100c3e0 	add	x0, sp, #0x30
 21314d0:	94000cd0 	bl	2134810 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x934988>
 21314d4:	aa1303e0 	mov	x0, x19
 21314d8:	978bce0e 	bl	424d10 <_Unwind_Resume@plt>
 21314dc:	d503201f 	nop
