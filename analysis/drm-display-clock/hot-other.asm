
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1dfee60:      	str	q4, [sp, #0x3990]
 1dfee64:      	str	q2, [sp, #0x39a0]
 1dfee68:      	str	q0, [sp, #0x39b0]
 1dfee6c:      	b.le	0x1dfef64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ff0dc>
 1dfee70:      	ldr	w0, [sp, #0x80]
 1dfee74:      	sub	w23, w27, #0x1
 1dfee78:      	cmp	w0, w23
 1dfee7c:      	b.le	0x1dfef58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ff0d0>
 1dfee80:      	ldr	w4, [sp, #0x74]
 1dfee84:      	cmp	w0, w27
 1dfee88:      	ldr	x3, [sp, #0x68]
 1dfee8c:      	mul	w1, w23, w4
 1dfee90:      	add	x1, x3, w1, sxtw
 1dfee94:      	b.le	0x1dfef58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ff0d0>
 1dfee98:      	sub	w19, w20, #0x1
 1dfee9c:      	add	w21, w20, w20, lsl #1
 1dfeea0:      	add	x19, x19, #0x1
 1dfeea4:      	mov	w2, w27
 1dfeea8:      	sxtw	x21, w21
 1dfeeac:      	mov	w26, #0x0               // =0
 1dfeeb0:      	add	x19, x19, x19, lsl #1
 1dfeeb4:      	nop
 1dfeeb8:      	mul	w0, w2, w4
 1dfeebc:      	cmp	w20, #0x0
 1dfeec0:      	mov	x2, x22
 1dfeec4:      	add	x6, x1, x19
 1dfeec8:      	mov	x4, x1
 1dfeecc:      	add	x0, x3, w0, sxtw
 1dfeed0:      	b.le	0x1dfef18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ff090>
 1dfeed4:      	nop
 1dfeed8:      	ldrb	w5, [x2, #0x7]
 1dfeedc:      	add	x3, x2, #0x8
 1dfeee0:      	cmp	w5, w26
 1dfeee4:      	b.le	0x1dfeef8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ff070>
 1dfeee8:      	ldrb	w5, [x2, #0x3]
 1dfeeec:      	add	x3, x2, #0x4
 1dfeef0:      	cmp	w5, w26
 1dfeef4:      	csel	x3, x3, x2, le
 1dfeef8:      	ldrh	w5, [x3]
 1dfeefc:      	add	x4, x4, #0x3
 1dfef00:      	ldrb	w3, [x3, #0x2]
 1dfef04:      	add	x2, x2, #0xc
 1dfef08:      	sturh	w5, [x4, #-0x3]
 1dfef0c:      	sturb	w3, [x4, #-0x1]
 1dfef10:      	cmp	x6, x4
 1dfef14:      	b.ne	0x1dfeed8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ff050>
 1dfef18:      	add	w26, w26, #0x1
 1dfef1c:      	mov	x2, x21
 1dfef20:      	bl	0x424980 <memcpy@plt>
 1dfef24:      	cmp	w27, w26
 1dfef28:      	b.eq	0x1dfef64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ff0dc>
 1dfef2c:      	ldr	w1, [sp, #0x80]
