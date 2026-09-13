
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1b854b0:      	stp	x29, x30, [sp, #-0x60]!
 1b854b4:      	mov	w4, #0x0                // =0
 1b854b8:      	mov	w3, #0x0                // =0
 1b854bc:      	mov	x29, sp
 1b854c0:      	stp	x19, x20, [sp, #0x10]
 1b854c4:      	mov	x19, x0
 1b854c8:      	mov	x20, x1
 1b854cc:      	str	x23, [sp, #0x30]
 1b854d0:      	add	x23, x0, #0x110
 1b854d4:      	mov	w2, #0x0                // =0
 1b854d8:      	stp	x21, x22, [sp, #0x20]
 1b854dc:      	add	x22, x0, #0x108
 1b854e0:      	mov	x0, x1
 1b854e4:      	mov	x1, x23
 1b854e8:      	bl	0x23b05e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b1c0>
 1b854ec:      	ldr	w3, [x19, #0x88]
 1b854f0:      	mov	x1, x22
 1b854f4:      	mov	x0, x20
 1b854f8:      	mov	w4, #0x0                // =0
 1b854fc:      	mov	w2, #0x0                // =0
 1b85500:      	bl	0x23b05e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b1c0>
 1b85504:      	ldr	w21, [x19, #0x8c]
 1b85508:      	mov	x0, x22
 1b8550c:      	bl	0x23b1530 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c110>
 1b85510:      	subs	w21, w21, w0
 1b85514:      	b.ne	0x1b85558 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3856d0>
 1b85518:      	add	x0, x19, #0x8, lsl #12  // =0x8000
 1b8551c:      	ldr	x0, [x0, #0x688]
 1b85520:      	ldrb	w1, [x0, #0xc1]
 1b85524:      	cbnz	w1, 0x1b855bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x385734>
 1b85528:      	ldp	w5, w3, [x19, #0x88]
 1b8552c:      	mov	x1, x23
 1b85530:      	mov	x0, x20
 1b85534:      	mov	w4, #0x0                // =0
 1b85538:      	mov	w2, #0x0                // =0
 1b8553c:      	add	w3, w5, w3
 1b85540:      	bl	0x23b05e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b1c0>
 1b85544:      	ldp	x19, x20, [sp, #0x10]
 1b85548:      	ldp	x21, x22, [sp, #0x20]
 1b8554c:      	ldr	x23, [sp, #0x30]
 1b85550:      	ldp	x29, x30, [sp], #0x60
 1b85554:      	ret
 1b85558:      	add	x0, sp, #0x48
 1b8555c:      	adrp	x1, 0x3bd7000 <stdout+0x95f40>
 1b85560:      	add	x1, x1, #0x948
 1b85564:      	bl	0x23a5010 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbf0>
 1b85568:      	add	x1, sp, #0x48
 1b8556c:      	mov	x0, x20
 1b85570:      	bl	0x23af140 <_ZNSt8functionIFvvEEC2ERKS1_+0x39d20>
 1b85574:      	add	x0, sp, #0x48
 1b85578:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1b8557c:      	mov	x0, x22
 1b85580:      	ldr	w22, [x19, #0x88]
 1b85584:      	bl	0x23b1530 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c110>
 1b85588:      	ldr	x3, [x19]
 1b8558c:      	add	w2, w22, w0
 1b85590:      	mov	w1, #0x0                // =0
 1b85594:      	mov	x0, x20
 1b85598:      	mov	w4, w21
 1b8559c:      	ldur	x3, [x3, #-0x18]
 1b855a0:      	add	x3, x19, x3
 1b855a4:      	ldr	w3, [x3, #0x28]
 1b855a8:      	bl	0x23af680 <_ZNSt8functionIFvvEEC2ERKS1_+0x3a260>
 1b855ac:      	add	x0, x19, #0x8, lsl #12  // =0x8000
 1b855b0:      	ldr	x0, [x0, #0x688]
 1b855b4:      	ldrb	w1, [x0, #0xc1]
 1b855b8:      	cbz	w1, 0x1b85528 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3856a0>
 1b855bc:      	add	x0, x0, #0x10
 1b855c0:      	bl	0x1b84df0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x384f68>
 1b855c4:      	tst	w0, #0xff
 1b855c8:      	b.eq	0x1b85528 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3856a0>
 1b855cc:      	ldp	w1, w2, [x19, #0x88]
 1b855d0:      	movi	v3.2s, #0x0
 1b855d4:      	fmov	s4, #-1.00000000
 1b855d8:      	fmov	s0, #1.00000000
 1b855dc:      	add	x0, sp, #0x48
 1b855e0:      	add	w1, w2, w1, lsl #1
 1b855e4:      	fmov	s2, s3
 1b855e8:      	fmov	s1, s3
 1b855ec:      	scvtf	s5, w1
 1b855f0:      	bl	0x23a89a0 <_ZNSt8functionIFvvEEC2ERKS1_+0x33580>
 1b855f4:      	add	x2, sp, #0x48
 1b855f8:      	mov	x1, x23
 1b855fc:      	mov	x0, x20
 1b85600:      	mov	w3, #0x0                // =0
 1b85604:      	bl	0x23b04e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b0c0>
 1b85608:      	ldp	x19, x20, [sp, #0x10]
 1b8560c:      	ldp	x21, x22, [sp, #0x20]
 1b85610:      	ldr	x23, [sp, #0x30]
 1b85614:      	ldp	x29, x30, [sp], #0x60
 1b85618:      	ret
 1b8561c:      	mov	x19, x0
 1b85620:      	add	x0, sp, #0x48
 1b85624:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1b85628:      	mov	x0, x19
 1b8562c:      	bl	0x424d10 <_Unwind_Resume@plt>
 1b85630:      	stp	x29, x30, [sp, #-0x60]!
 1b85634:      	mov	w4, #0x0                // =0
 1b85638:      	mov	w3, #0x0                // =0
 1b8563c:      	mov	x29, sp
 1b85640:      	stp	x19, x20, [sp, #0x10]
 1b85644:      	mov	x19, x0
 1b85648:      	mov	x20, x1
 1b8564c:      	str	x23, [sp, #0x30]
 1b85650:      	add	x23, x0, #0x110
 1b85654:      	mov	w2, #0x0                // =0
 1b85658:      	stp	x21, x22, [sp, #0x20]
 1b8565c:      	add	x22, x0, #0x108
 1b85660:      	mov	x0, x1
 1b85664:      	mov	x1, x23
 1b85668:      	bl	0x23b05e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b1c0>
 1b8566c:      	ldr	w3, [x19, #0x88]
 1b85670:      	mov	x1, x22
 1b85674:      	mov	x0, x20
 1b85678:      	mov	w4, #0x0                // =0
 1b8567c:      	mov	w2, #0x0                // =0
 1b85680:      	bl	0x23b05e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b1c0>
 1b85684:      	ldr	w21, [x19, #0x8c]
 1b85688:      	mov	x0, x22
 1b8568c:      	bl	0x23b1530 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c110>
 1b85690:      	subs	w21, w21, w0
 1b85694:      	b.ne	0x1b856d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x385850>
 1b85698:      	add	x0, x19, #0x8, lsl #12  // =0x8000
 1b8569c:      	ldr	x0, [x0, #0x688]
 1b856a0:      	ldrb	w1, [x0, #0xc1]
 1b856a4:      	cbnz	w1, 0x1b8573c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3858b4>
 1b856a8:      	ldp	w5, w3, [x19, #0x88]
 1b856ac:      	mov	x1, x23
 1b856b0:      	mov	x0, x20
 1b856b4:      	mov	w4, #0x0                // =0
 1b856b8:      	mov	w2, #0x0                // =0
 1b856bc:      	add	w3, w5, w3
 1b856c0:      	bl	0x23b05e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b1c0>
 1b856c4:      	ldp	x19, x20, [sp, #0x10]
 1b856c8:      	ldp	x21, x22, [sp, #0x20]
 1b856cc:      	ldr	x23, [sp, #0x30]
 1b856d0:      	ldp	x29, x30, [sp], #0x60
 1b856d4:      	ret
 1b856d8:      	add	x0, sp, #0x48
 1b856dc:      	adrp	x1, 0x3bd7000 <stdout+0x95f40>
 1b856e0:      	add	x1, x1, #0x948
 1b856e4:      	bl	0x23a5010 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbf0>
 1b856e8:      	add	x1, sp, #0x48
 1b856ec:      	mov	x0, x20
 1b856f0:      	bl	0x23af140 <_ZNSt8functionIFvvEEC2ERKS1_+0x39d20>
 1b856f4:      	add	x0, sp, #0x48
 1b856f8:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1b856fc:      	mov	x0, x22
 1b85700:      	ldr	w22, [x19, #0x88]
 1b85704:      	bl	0x23b1530 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c110>
 1b85708:      	ldr	x3, [x19]
 1b8570c:      	add	w2, w22, w0
 1b85710:      	mov	w1, #0x0                // =0
 1b85714:      	mov	x0, x20
 1b85718:      	mov	w4, w21
 1b8571c:      	ldur	x3, [x3, #-0x18]
 1b85720:      	add	x3, x19, x3
 1b85724:      	ldr	w3, [x3, #0x28]
 1b85728:      	bl	0x23af680 <_ZNSt8functionIFvvEEC2ERKS1_+0x3a260>
 1b8572c:      	add	x0, x19, #0x8, lsl #12  // =0x8000
 1b85730:      	ldr	x0, [x0, #0x688]
 1b85734:      	ldrb	w1, [x0, #0xc1]
 1b85738:      	cbz	w1, 0x1b856a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x385820>
 1b8573c:      	add	x0, x0, #0x10
 1b85740:      	bl	0x1b84df0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x384f68>
 1b85744:      	tst	w0, #0xff
 1b85748:      	b.eq	0x1b856a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x385820>
 1b8574c:      	ldp	w1, w2, [x19, #0x88]
 1b85750:      	movi	v3.2s, #0x0
 1b85754:      	fmov	s4, #-1.00000000
 1b85758:      	fmov	s0, #1.00000000
 1b8575c:      	add	x0, sp, #0x48
 1b85760:      	add	w1, w2, w1, lsl #1
 1b85764:      	fmov	s2, s3
 1b85768:      	fmov	s1, s3
 1b8576c:      	scvtf	s5, w1
 1b85770:      	bl	0x23a89a0 <_ZNSt8functionIFvvEEC2ERKS1_+0x33580>
 1b85774:      	add	x2, sp, #0x48
 1b85778:      	mov	x1, x23
 1b8577c:      	mov	x0, x20
 1b85780:      	mov	w3, #0x0                // =0
 1b85784:      	bl	0x23b04e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b0c0>
 1b85788:      	ldp	x19, x20, [sp, #0x10]
 1b8578c:      	ldp	x21, x22, [sp, #0x20]
 1b85790:      	ldr	x23, [sp, #0x30]
 1b85794:      	ldp	x29, x30, [sp], #0x60
 1b85798:      	ret
 1b8579c:      	mov	x19, x0
 1b857a0:      	add	x0, sp, #0x48
 1b857a4:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1b857a8:      	mov	x0, x19
 1b857ac:      	bl	0x424d10 <_Unwind_Resume@plt>
 1b857b0:      	stp	x29, x30, [sp, #-0x60]!
 1b857b4:      	mov	w4, #0x0                // =0
 1b857b8:      	mov	w3, #0x0                // =0
 1b857bc:      	mov	x29, sp
 1b857c0:      	stp	x19, x20, [sp, #0x10]
 1b857c4:      	mov	x19, x0
 1b857c8:      	mov	x20, x1
 1b857cc:      	str	x23, [sp, #0x30]
 1b857d0:      	add	x23, x0, #0x110
 1b857d4:      	mov	w2, #0x0                // =0
 1b857d8:      	stp	x21, x22, [sp, #0x20]
 1b857dc:      	add	x22, x0, #0x108
 1b857e0:      	mov	x0, x1
 1b857e4:      	mov	x1, x23
 1b857e8:      	bl	0x23b05e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b1c0>
 1b857ec:      	ldr	w3, [x19, #0x88]
 1b857f0:      	mov	x1, x22
 1b857f4:      	mov	x0, x20
 1b857f8:      	mov	w4, #0x0                // =0
 1b857fc:      	mov	w2, #0x0                // =0
 1b85800:      	bl	0x23b05e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b1c0>
 1b85804:      	ldr	w21, [x19, #0x8c]
 1b85808:      	mov	x0, x22
 1b8580c:      	bl	0x23b1530 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c110>
 1b85810:      	subs	w21, w21, w0
 1b85814:      	b.ne	0x1b85858 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3859d0>
 1b85818:      	add	x0, x19, #0x8, lsl #12  // =0x8000
 1b8581c:      	ldr	x0, [x0, #0x688]
 1b85820:      	ldrb	w1, [x0, #0xc1]
 1b85824:      	cbnz	w1, 0x1b858bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x385a34>
 1b85828:      	ldp	w5, w3, [x19, #0x88]
 1b8582c:      	mov	x1, x23
 1b85830:      	mov	x0, x20
 1b85834:      	mov	w4, #0x0                // =0
 1b85838:      	mov	w2, #0x0                // =0
 1b8583c:      	add	w3, w5, w3
 1b85840:      	bl	0x23b05e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b1c0>
 1b85844:      	ldp	x19, x20, [sp, #0x10]
 1b85848:      	ldp	x21, x22, [sp, #0x20]
 1b8584c:      	ldr	x23, [sp, #0x30]
 1b85850:      	ldp	x29, x30, [sp], #0x60
 1b85854:      	ret
 1b85858:      	add	x0, sp, #0x48
 1b8585c:      	adrp	x1, 0x3bd7000 <stdout+0x95f40>
 1b85860:      	add	x1, x1, #0x948
 1b85864:      	bl	0x23a5010 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbf0>
 1b85868:      	add	x1, sp, #0x48
 1b8586c:      	mov	x0, x20
 1b85870:      	bl	0x23af140 <_ZNSt8functionIFvvEEC2ERKS1_+0x39d20>
 1b85874:      	add	x0, sp, #0x48
 1b85878:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1b8587c:      	mov	x0, x22
 1b85880:      	ldr	w22, [x19, #0x88]
 1b85884:      	bl	0x23b1530 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c110>
 1b85888:      	ldr	x3, [x19]
 1b8588c:      	add	w2, w22, w0
 1b85890:      	mov	w1, #0x0                // =0
 1b85894:      	mov	x0, x20
 1b85898:      	mov	w4, w21
 1b8589c:      	ldur	x3, [x3, #-0x18]
 1b858a0:      	add	x3, x19, x3
 1b858a4:      	ldr	w3, [x3, #0x28]
 1b858a8:      	bl	0x23af680 <_ZNSt8functionIFvvEEC2ERKS1_+0x3a260>
 1b858ac:      	add	x0, x19, #0x8, lsl #12  // =0x8000
 1b858b0:      	ldr	x0, [x0, #0x688]
 1b858b4:      	ldrb	w1, [x0, #0xc1]
 1b858b8:      	cbz	w1, 0x1b85828 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3859a0>
 1b858bc:      	add	x0, x0, #0x10
 1b858c0:      	bl	0x1b84df0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x384f68>
 1b858c4:      	tst	w0, #0xff
 1b858c8:      	b.eq	0x1b85828 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3859a0>
 1b858cc:      	ldp	w1, w2, [x19, #0x88]
 1b858d0:      	movi	v3.2s, #0x0
 1b858d4:      	fmov	s4, #-1.00000000
 1b858d8:      	fmov	s0, #1.00000000
 1b858dc:      	add	x0, sp, #0x48
 1b858e0:      	add	w1, w2, w1, lsl #1
 1b858e4:      	fmov	s2, s3
 1b858e8:      	fmov	s1, s3
 1b858ec:      	scvtf	s5, w1
 1b858f0:      	bl	0x23a89a0 <_ZNSt8functionIFvvEEC2ERKS1_+0x33580>
 1b858f4:      	add	x2, sp, #0x48
 1b858f8:      	mov	x1, x23
 1b858fc:      	mov	x0, x20
 1b85900:      	mov	w3, #0x0                // =0
 1b85904:      	bl	0x23b04e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3b0c0>
 1b85908:      	ldp	x19, x20, [sp, #0x10]
 1b8590c:      	ldp	x21, x22, [sp, #0x20]
 1b85910:      	ldr	x23, [sp, #0x30]
 1b85914:      	ldp	x29, x30, [sp], #0x60
 1b85918:      	ret
 1b8591c:      	mov	x19, x0
 1b85920:      	add	x0, sp, #0x48
 1b85924:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1b85928:      	mov	x0, x19
 1b8592c:      	bl	0x424d10 <_Unwind_Resume@plt>
 1b85930:      	stp	x29, x30, [sp, #-0x40]!
 1b85934:      	adrp	x1, 0x2b68000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5a51a8>
 1b85938:      	add	x1, x1, #0x278
 1b8593c:      	mov	x29, sp
