
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1b976f0:      	sub	sp, sp, #0x100
 1b976f4:      	stp	x29, x30, [sp, #0x10]
 1b976f8:      	add	x29, sp, #0x10
 1b976fc:      	stp	x19, x20, [sp, #0x20]
 1b97700:      	mov	x19, x0
 1b97704:      	ldrb	w0, [sp, #0x100]
 1b97708:      	str	w0, [sp, #0xb0]
 1b9770c:      	ldrb	w0, [sp, #0x108]
 1b97710:      	stp	x21, x22, [sp, #0x30]
 1b97714:      	adrp	x22, 0x3b8d000 <stdout+0x4bf40>
 1b97718:      	add	x22, x22, #0xf60
 1b9771c:      	stp	x23, x24, [sp, #0x40]
 1b97720:      	mov	w23, w5
 1b97724:      	stp	x25, x26, [sp, #0x50]
 1b97728:      	mov	w25, w3
 1b9772c:      	mov	x26, x6
 1b97730:      	stp	x27, x28, [sp, #0x60]
 1b97734:      	mov	w27, w4
 1b97738:      	ldr	w28, [sp, #0x110]
 1b9773c:      	stp	d8, d9, [sp, #0x70]
 1b97740:      	fmov	s9, s0
 1b97744:      	stp	d10, d11, [sp, #0x80]
 1b97748:      	fmov	d10, x2
 1b9774c:      	fmov	d11, x7
 1b97750:      	str	x1, [sp, #0xa8]
 1b97754:      	str	w0, [sp, #0xbc]
 1b97758:      	ldr	x24, [sp, #0x118]
 1b9775c:      	ldarb	w0, [x22]
 1b97760:      	tbnz	w0, #0x0, 0x1b97770 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3978e8>
 1b97764:      	mov	x0, x22
 1b97768:      	bl	0x426260 <__cxa_guard_acquire@plt>
 1b9776c:      	cbnz	w0, 0x1b97c9c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397e14>
 1b97770:      	adrp	x1, 0x3b8d000 <stdout+0x4bf40>
 1b97774:      	add	x20, sp, #0xe8
 1b97778:      	add	x21, x1, #0xf68
 1b9777c:      	str	d12, [sp, #0x90]
 1b97780:      	mov	x2, #0x7d0              // =2000
 1b97784:      	mov	x0, x21
 1b97788:      	adrp	x1, 0x2b72000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5af1a8>
 1b9778c:      	add	x1, x1, #0xff8
 1b97790:      	bl	0x1b97578 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3976f0>
 1b97794:      	ldr	x0, [x19]
 1b97798:      	mov	x8, x20
 1b9779c:      	ldur	x0, [x0, #-0x18]
 1b977a0:      	str	w28, [x19, #0x88]
 1b977a4:      	add	x0, x19, x0
 1b977a8:      	bl	0x24841a0 <_ZNSt8functionIFvvEEC2ERKS1_+0x10ed80>
 1b977ac:      	ldp	w28, w22, [sp, #0xf0]
 1b977b0:      	mov	x11, #0x0               // =0
 1b977b4:      	mov	x0, #0x0                // =0
 1b977b8:      	cmp	w28, #0x0
 1b977bc:      	ccmp	w22, #0x0, #0x4, gt
 1b977c0:      	b.le	0x1b977e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397960>
 1b977c4:      	ldp	s8, s12, [sp, #0xe8]
 1b977c8:      	mov	x0, #0x80               // =128
 1b977cc:      	bl	0x424fd0 <malloc@plt>
 1b977d0:      	dup	v0.4s, v8.s[0]
 1b977d4:      	mov	x11, #0x10              // =16
 1b977d8:      	mov	v0.s[1], v12.s[0]
 1b977dc:      	mov	v0.s[2], w28
 1b977e0:      	mov	v0.s[3], w22
 1b977e4:      	str	q0, [x0]
 1b977e8:      	ldrsw	x15, [x24, #0x10]
 1b977ec:      	ldr	x1, [x24]
 1b977f0:      	add	x15, x1, x15, lsl #4
 1b977f4:      	cmp	x1, x15
 1b977f8:      	b.eq	0x1b97880 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3979f8>
 1b977fc:      	add	x11, x0, x11
 1b97800:      	cmp	x11, x0
 1b97804:      	ldp	w6, w4, [x1]
 1b97808:      	ldp	w5, w3, [x1, #0x8]
 1b9780c:      	b.eq	0x1b97874 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3979ec>
 1b97810:      	mov	x2, x0
 1b97814:      	add	w13, w6, w5
 1b97818:      	add	w12, w4, w3
 1b9781c:      	nop
 1b97820:      	ldr	w10, [x2]
 1b97824:      	ldr	w9, [x2, #0x8]
 1b97828:      	add	w7, w10, w9
 1b9782c:      	cmp	w6, w7
 1b97830:      	b.ge	0x1b97868 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3979e0>
 1b97834:      	ldr	w8, [x2, #0x4]
 1b97838:      	ldr	w7, [x2, #0xc]
 1b9783c:      	add	w14, w8, w7
 1b97840:      	cmp	w4, w14
 1b97844:      	b.ge	0x1b97868 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3979e0>
 1b97848:      	cmp	w10, w13
 1b9784c:      	b.ge	0x1b97868 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x3979e0>
 1b97850:      	cmp	w9, #0x0
 1b97854:      	ccmp	w8, w12, #0x0, gt
 1b97858:      	ccmp	w7, #0x0, #0x4, lt
 1b9785c:      	ccmp	w5, #0x0, #0x4, gt
 1b97860:      	ccmp	w3, #0x0, #0x4, gt
 1b97864:      	b.gt	0x1b97b74 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397cec>
 1b97868:      	add	x2, x2, #0x10
 1b9786c:      	cmp	x11, x2
 1b97870:      	b.ne	0x1b97820 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397998>
 1b97874:      	add	x1, x1, #0x10
 1b97878:      	cmp	x15, x1
 1b9787c:      	b.ne	0x1b97800 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397978>
 1b97880:      	bl	0x424af0 <free@plt>
 1b97884:      	ldr	x0, [x19]
 1b97888:      	ldur	x0, [x0, #-0x18]
 1b9788c:      	add	x0, x19, x0
 1b97890:      	bl	0x2488570 <_ZNSt8functionIFvvEEC2ERKS1_+0x113150>
 1b97894:      	ldr	w0, [x19, #0x88]
 1b97898:      	adrp	x1, 0x2b72000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5af1a8>
 1b9789c:      	add	x28, x1, #0xf00
 1b978a0:      	str	x28, [sp, #0xe8]
 1b978a4:      	sub	w27, w27, w0, lsl #1
 1b978a8:      	str	w27, [x19, #0x8c]
 1b978ac:      	ldr	x0, [sp, #0xa8]
 1b978b0:      	ldar	x1, [x0]
 1b978b4:      	add	x1, x1, #0x28
 1b978b8:      	add	x0, x20, #0x8
 1b978bc:      	bl	0xc426a8 <_ZSt20__throw_bad_weak_ptrv+0x337a90>
 1b978c0:      	add	x0, sp, #0xf0
 1b978c4:      	ldar	x1, [x0]
 1b978c8:      	mov	w0, #0x0                // =0
 1b978cc:      	cbnz	x1, 0x1b97c60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397dd8>
 1b978d0:      	strb	w0, [sp, #0xf8]
 1b978d4:      	add	x0, sp, #0xf0
 1b978d8:      	ldar	x0, [x0]
 1b978dc:      	mov	w1, #0x0                // =0
 1b978e0:      	cbnz	x0, 0x1b97c4c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397dc4>
 1b978e4:      	add	x22, x19, #0x8, lsl #12 // =0x8000
 1b978e8:      	ldr	w2, [x19, #0x8c]
 1b978ec:      	stp	w25, w23, [sp, #0xc0]
 1b978f0:      	str	w2, [sp, #0xc8]
 1b978f4:      	ldr	x0, [x22, #0x688]
 1b978f8:      	str	s9, [sp, #0xcc]
 1b978fc:      	ldrb	w24, [x0, #0xc1]
 1b97900:      	str	w1, [sp, #0xfc]
 1b97904:      	ldrb	w1, [sp, #0xb0]
 1b97908:      	strb	w1, [x22, #0x698]
 1b9790c:      	ldrb	w1, [sp, #0xbc]
 1b97910:      	strb	w1, [x22, #0x699]
 1b97914:      	cbnz	w24, 0x1b97c7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397df4>
 1b97918:      	adrp	x1, 0x2b73000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5b01a8>
 1b9791c:      	mov	x2, #0x7d0              // =2000
 1b97920:      	add	x1, x1, #0x38
 1b97924:      	mov	x0, x21
 1b97928:      	bl	0x1b97400 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397578>
 1b9792c:      	ldr	x0, [x26]
