
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000204b550 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84b6c8>:
 204b550:	f9400401 	ldr	x1, [x0,#8]
 204b554:	b5000061 	cbnz	x1, 204b560 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84b6d8>
 204b558:	52800020 	mov	w0, #0x1                   	// #1
 204b55c:	d65f03c0 	ret
 204b560:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 204b564:	910003fd 	mov	x29, sp
 204b568:	f9000bf3 	str	x19, [sp,#16]
 204b56c:	aa0003f3 	mov	x19, x0
 204b570:	978f6dac 	bl	426c20 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
 204b574:	d2869b62 	mov	x2, #0x34db                	// #13531
 204b578:	f9401a61 	ldr	x1, [x19,#48]
 204b57c:	f2baf6c2 	movk	x2, #0xd7b6, lsl #16
 204b580:	f2dbd042 	movk	x2, #0xde82, lsl #32
 204b584:	cb010000 	sub	x0, x0, x1
 204b588:	f2e86362 	movk	x2, #0x431b, lsl #48
 204b58c:	f9400663 	ldr	x3, [x19,#8]
 204b590:	9b427c02 	smulh	x2, x0, x2
 204b594:	f9400bf3 	ldr	x19, [sp,#16]
 204b598:	9352fc42 	asr	x2, x2, #18
 204b59c:	cb80fc40 	sub	x0, x2, x0, asr #63
 204b5a0:	eb00007f 	cmp	x3, x0
 204b5a4:	1a9fd7e0 	cset	w0, gt
 204b5a8:	a8c27bfd 	ldp	x29, x30, [sp],#32
 204b5ac:	d65f03c0 	ret
 204b5b0:	f9401821 	ldr	x1, [x1,#48]
 204b5b4:	f9001801 	str	x1, [x0,#48]
 204b5b8:	d65f03c0 	ret
 204b5bc:	00000000 	.inst	0x00000000 ; undefined
 204b5c0:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 204b5c4:	f0006de1 	adrp	x1, 2e0a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8471a8>
 204b5c8:	910003fd 	mov	x29, sp
 204b5cc:	a90153f3 	stp	x19, x20, [sp,#16]
 204b5d0:	aa0003f3 	mov	x19, x0
 204b5d4:	f941b034 	ldr	x20, [x1,#864]
 204b5d8:	a9025bf5 	stp	x21, x22, [sp,#32]
 204b5dc:	aa0303f6 	mov	x22, x3
 204b5e0:	91008015 	add	x21, x0, #0x20
 204b5e4:	b4000094 	cbz	x20, 204b5f4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84b76c>
 204b5e8:	aa1503e0 	mov	x0, x21
 204b5ec:	978f6e69 	bl	426f90 <pthread_mutex_lock@plt>
 204b5f0:	350003e0 	cbnz	w0, 204b66c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84b7e4>
 204b5f4:	bd4002c0 	ldr	s0, [x22]
 204b5f8:	1e2e1003 	fmov	s3, #1.000000000000000000e+00
 204b5fc:	1e2c1002 	fmov	s2, #5.000000000000000000e-01
 204b600:	52a86fe0 	mov	w0, #0x437f0000            	// #1132396544
 204b604:	1e270001 	fmov	s1, w0
 204b608:	b9405661 	ldr	w1, [x19,#84]
 204b60c:	1e232800 	fadd	s0, s0, s3
 204b610:	7100043f 	cmp	w1, #0x1
 204b614:	1e220800 	fmul	s0, s0, s2
 204b618:	1e210800 	fmul	s0, s0, s1
 204b61c:	1e390000 	fcvtzu	w0, s0
 204b620:	12001c00 	and	w0, w0, #0xff
 204b624:	54000200 	b.eq	204b664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84b7dc>
 204b628:	7100083f 	cmp	w1, #0x2
 204b62c:	54000100 	b.eq	204b64c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84b7c4>
 204b630:	39014260 	strb	w0, [x19,#80]
 204b634:	b4000114 	cbz	x20, 204b654 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84b7cc>
 204b638:	aa1503e0 	mov	x0, x21
 204b63c:	a94153f3 	ldp	x19, x20, [sp,#16]
 204b640:	a9425bf5 	ldp	x21, x22, [sp,#32]
 204b644:	a8c37bfd 	ldp	x29, x30, [sp],#48
 204b648:	178f6cfe 	b	426a40 <pthread_mutex_unlock@plt>
 204b64c:	39014a60 	strb	w0, [x19,#82]
