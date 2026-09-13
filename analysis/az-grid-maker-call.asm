
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1b97910:      	strb	w1, [x22, #0x699]
 1b97914:      	cbnz	w24, 0x1b97c7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397df4>
 1b97918:      	adrp	x1, 0x2b73000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5b01a8>
 1b9791c:      	mov	x2, #0x7d0              // =2000
 1b97920:      	add	x1, x1, #0x38
 1b97924:      	mov	x0, x21
 1b97928:      	bl	0x1b97400 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397578>
 1b9792c:      	ldr	x0, [x26]
 1b97930:      	mov	w1, #0x999a             // =39322
 1b97934:      	movk	w1, #0x3e19, lsl #16
 1b97938:      	fmov	s1, w1
 1b9793c:      	scvtf	s0, x0
 1b97940:      	adrp	x1, 0x2b73000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5b01a8>
 1b97944:      	mov	x2, #0x7d0              // =2000
 1b97948:      	add	x1, x1, #0x80
 1b9794c:      	mov	x0, x21
 1b97950:      	fmul	s0, s0, s1
 1b97954:      	fmul	s0, s0, s9
 1b97958:      	fcvtzs	w3, s0
 1b9795c:      	sub	w23, w3, w23
 1b97960:      	bl	0x1b97288 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397400>
 1b97964:      	fmov	s0, s9
 1b97968:      	ldrb	w4, [x22, #0x699]
 1b9796c:      	fmov	x1, d10
 1b97970:      	ldr	w3, [x19, #0x88]
 1b97974:      	add	x27, x19, #0x110
 1b97978:      	mov	w5, w24
 1b9797c:      	mov	w2, w23
 1b97980:      	add	x0, x19, #0x90
 1b97984:      	bl	0x1dffe10 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5fff88>
 1b97988:      	mov	x1, x0
 1b9798c:      	mov	x0, x27
 1b97990:      	bl	0x23b1440 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c020>
 1b97994:      	fmov	s0, s9
 1b97998:      	fmov	x3, d11
 1b9799c:      	add	x27, x19, #0x70
 1b979a0:      	mov	w2, w23
 1b979a4:      	mov	x1, x27
 1b979a8:      	add	x0, x19, #0x38
 1b979ac:      	bl	0x1e00c70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600de8>
 1b979b0:      	adrp	x1, 0x2b73000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5b01a8>
 1b979b4:      	mov	x2, #0x7d0              // =2000
 1b979b8:      	add	x1, x1, #0xd0
 1b979bc:      	mov	x0, x21
 1b979c0:      	bl	0x1b97110 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397288>
 1b979c4:      	ldp	x4, x1, [x19, #0xa0]
 1b979c8:      	add	x0, x19, #0x30
 1b979cc:      	str	x0, [sp, #0xb0]
 1b979d0:      	add	x0, x19, #0x118
 1b979d4:      	mov	x2, #-0x5555555555555556 // =-6148914691236517206
 1b979d8:      	str	x0, [sp, #0xa8]
 1b979dc:      	movk	x2, #0xaaab
 1b979e0:      	stp	xzr, xzr, [sp, #0xd0]
 1b979e4:      	mov	x8, #0x0                // =0
 1b979e8:      	sub	x23, x1, x4
 1b979ec:      	str	xzr, [sp, #0xe0]
 1b979f0:      	asr	x0, x23, #2
 1b979f4:      	mul	x0, x0, x2
 1b979f8:      	cbz	x0, 0x1b97a1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397b94>
 1b979fc:      	mov	x1, #0x5555555555555555 // =6148914691236517205
 1b97a00:      	movk	x1, #0x1555, lsl #48
 1b97a04:      	cmp	x0, x1
 1b97a08:      	b.hi	0x1b97d14 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397e8c>
 1b97a0c:      	mov	x0, x23
 1b97a10:      	bl	0x424d40 <_Znwm@plt>
 1b97a14:      	ldp	x4, x1, [x19, #0xa0]
 1b97a18:      	mov	x8, x0
 1b97a1c:      	dup	v0.2d, x8
 1b97a20:      	add	x23, x8, x23
 1b97a24:      	str	x23, [sp, #0xe0]
 1b97a28:      	cmp	x1, x4
 1b97a2c:      	str	q0, [sp, #0xd0]
 1b97a30:      	b.eq	0x1b97a90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397c08>
 1b97a34:      	mov	x0, x4
 1b97a38:      	mov	x2, x8
 1b97a3c:      	nop
 1b97a40:      	ldr	x3, [x0]
 1b97a44:      	str	x3, [x2]
 1b97a48:      	add	x0, x0, #0xc
 1b97a4c:      	add	x2, x2, #0xc
 1b97a50:      	ldur	w3, [x0, #-0x4]
 1b97a54:      	cmp	x1, x0
 1b97a58:      	stur	w3, [x2, #-0x4]
 1b97a5c:      	b.ne	0x1b97a40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397bb8>
 1b97a60:      	sub	x0, x1, #0xc
 1b97a64:      	mov	x1, #0xaaab             // =43691
 1b97a68:      	sub	x0, x0, x4
 1b97a6c:      	movk	x1, #0xaaaa, lsl #16
 1b97a70:      	movk	x1, #0xaaaa, lsl #32
 1b97a74:      	lsr	x0, x0, #2
 1b97a78:      	movk	x1, #0x2aaa, lsl #48
 1b97a7c:      	mul	x0, x0, x1
 1b97a80:      	and	x0, x0, #0x3fffffffffffffff
 1b97a84:      	add	x0, x0, #0x1
 1b97a88:      	add	x0, x0, x0, lsl #1
 1b97a8c:      	add	x8, x8, x0, lsl #2
 1b97a90:      	ldrb	w0, [x22, #0x698]
 1b97a94:      	add	x22, sp, #0xd0
 1b97a98:      	strb	w0, [sp]
 1b97a9c:      	mov	x5, x26
 1b97aa0:      	ldp	x1, x0, [sp, #0xa8]
 1b97aa4:      	strb	w24, [sp, #0x8]
 1b97aa8:      	mov	x2, x27
 1b97aac:      	mov	x7, x22
 1b97ab0:      	mov	w6, w25
 1b97ab4:      	add	x4, sp, #0xc0
 1b97ab8:      	mov	x3, x20
 1b97abc:      	str	x8, [sp, #0xd8]
 1b97ac0:      	bl	0x1e00dd0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600f48>
 1b97ac4:      	ldr	x0, [sp, #0xd0]
 1b97ac8:      	cbz	x0, 0x1b97ad0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397c48>
 1b97acc:      	bl	0x424e50 <_ZdlPv@plt>
 1b97ad0:      	adrp	x1, 0x2b73000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x5b01a8>
 1b97ad4:      	mov	x2, #0x7d0              // =2000
 1b97ad8:      	add	x1, x1, #0x120
 1b97adc:      	mov	x0, x21
 1b97ae0:      	bl	0x1b96f98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x397110>
 1b97ae4:      	ldr	w3, [x19, #0x8c]
 1b97ae8:      	mov	w2, w25
 1b97aec:      	ldr	x1, [sp, #0xa8]
 1b97af0:      	add	x23, x19, #0x108
 1b97af4:      	add	x0, x19, #0x40
 1b97af8:      	mov	x8, x22
 1b97afc:      	bl	0x1dfed18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5fee90>
 1b97b00:      	mov	x1, x22
 1b97b04:      	mov	x0, x23
 1b97b08:      	bl	0x23b14d0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c0b0>
 1b97b0c:      	mov	x0, x22
