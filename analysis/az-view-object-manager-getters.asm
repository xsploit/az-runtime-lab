
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 198ca30: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 198ca34: 910003fd     	mov	x29, sp
 198ca38: f9400c00     	ldr	x0, [x0, #0x18]
 198ca3c: f9000bf3     	str	x19, [sp, #0x10]
 198ca40: aa0803f3     	mov	x19, x8
 198ca44: 940027d1     	bl	0x1996988 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x196b00>
 198ca48: aa1303e0     	mov	x0, x19
 198ca4c: f9400bf3     	ldr	x19, [sp, #0x10]
 198ca50: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 198ca54: d65f03c0     	ret
 198ca58: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 198ca5c: 910003fd     	mov	x29, sp
 198ca60: f9000bf3     	str	x19, [sp, #0x10]
 198ca64: aa0003f3     	mov	x19, x0
 198ca68: 39400400     	ldrb	w0, [x0, #0x1]
 198ca6c: 35000200     	cbnz	w0, 0x198caac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18cc24>
 198ca70: d2800000     	mov	x0, #0x0                // =0
 198ca74: 39400262     	ldrb	w2, [x19]
 198ca78: d2801661     	mov	x1, #0xb3               // =179
 198ca7c: f2f12001     	movk	x1, #0x8900, lsl #48
 198ca80: d28d1443     	mov	x3, #0x68a2             // =26786
 198ca84: 8b000040     	add	x0, x2, x0
 198ca88: f2a7f103     	movk	x3, #0x3f88, lsl #16
 198ca8c: f2cbadc3     	movk	x3, #0x5d6e, lsl #32
 198ca90: f2e03bc3     	movk	x3, #0x1de, lsl #48
 198ca94: 9bc17c01     	umulh	x1, x0, x1
 198ca98: f9400bf3     	ldr	x19, [sp, #0x10]
 198ca9c: d378fc21     	lsr	x1, x1, #56
 198caa0: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 198caa4: 9b038020     	msub	x0, x1, x3, x0
 198caa8: d65f03c0     	ret
 198caac: 91000660     	add	x0, x19, #0x1
 198cab0: 97ffffea     	bl	0x198ca58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18cbd0>
 198cab4: 8b001001     	add	x1, x0, x0, lsl #4
 198cab8: 8b010c00     	add	x0, x0, x1, lsl #3
 198cabc: 17ffffee     	b	0x198ca74 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18cbec>
 198cac0: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 198cac4: f0000001     	adrp	x1, 0x198f000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18f178>
 198cac8: 9111a021     	add	x1, x1, #0x468
 198cacc: 910003fd     	mov	x29, sp
 198cad0: f9400c00     	ldr	x0, [x0, #0x18]
 198cad4: f9400002     	ldr	x2, [x0]
 198cad8: f940f442     	ldr	x2, [x2, #0x1e8]
 198cadc: eb01005f     	cmp	x2, x1
 198cae0: 540001c1     	b.ne	0x198cb18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18cc90>
 198cae4: f940a800     	ldr	x0, [x0, #0x150]
 198cae8: f0011241     	adrp	x1, 0x3bd7000 <stdout+0x95f40>
 198caec: 911bc021     	add	x1, x1, #0x6f0
 198caf0: f9000fe8     	str	x8, [sp, #0x18]
 198caf4: f100001f     	cmp	x0, #0x0
 198caf8: 9103e000     	add	x0, x0, #0xf8
 198cafc: 9a800021     	csel	x1, x1, x0, eq
 198cb00: aa0803e0     	mov	x0, x8
 198cb04: 94260637     	bl	0x230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1862c8>
 198cb08: f9400fe8     	ldr	x8, [sp, #0x18]
 198cb0c: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 198cb10: aa0803e0     	mov	x0, x8
 198cb14: d65f03c0     	ret
 198cb18: f9000fe8     	str	x8, [sp, #0x18]
 198cb1c: d63f0040     	blr	x2
 198cb20: aa0003e1     	mov	x1, x0
 198cb24: f9400fe8     	ldr	x8, [sp, #0x18]
 198cb28: f9000fe8     	str	x8, [sp, #0x18]
 198cb2c: aa0803e0     	mov	x0, x8
 198cb30: 9426062c     	bl	0x230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1862c8>
 198cb34: f9400fe8     	ldr	x8, [sp, #0x18]
 198cb38: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 198cb3c: aa0803e0     	mov	x0, x8
 198cb40: d65f03c0     	ret
 198cb44: d503201f     	nop
 198cb48: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
 198cb4c: 90000001     	adrp	x1, 0x198c000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18c178>
 198cb50: 912b0021     	add	x1, x1, #0xac0
 198cb54: 910003fd     	mov	x29, sp
 198cb58: f9400003     	ldr	x3, [x0]
 198cb5c: f9400863     	ldr	x3, [x3, #0x10]
 198cb60: f9000bf3     	str	x19, [sp, #0x10]
 198cb64: eb01007f     	cmp	x3, x1
 198cb68: 54000381     	b.ne	0x198cbd8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18cd50>
 198cb6c: f9400c00     	ldr	x0, [x0, #0x18]
 198cb70: f0000001     	adrp	x1, 0x198f000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18f178>
 198cb74: 9111a021     	add	x1, x1, #0x468
 198cb78: f9400002     	ldr	x2, [x0]
 198cb7c: f940f442     	ldr	x2, [x2, #0x1e8]
 198cb80: eb01005f     	cmp	x2, x1
 198cb84: 54000321     	b.ne	0x198cbe8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18cd60>
 198cb88: f940a800     	ldr	x0, [x0, #0x150]
 198cb8c: f0011241     	adrp	x1, 0x3bd7000 <stdout+0x95f40>
 198cb90: 911bc021     	add	x1, x1, #0x6f0
 198cb94: f100001f     	cmp	x0, #0x0
 198cb98: 9103e000     	add	x0, x0, #0xf8
 198cb9c: 9a800021     	csel	x1, x1, x0, eq
 198cba0: 9100a3f3     	add	x19, sp, #0x28
 198cba4: aa1303e0     	mov	x0, x19
 198cba8: 9426060e     	bl	0x230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1862c8>
 198cbac: d0010fa2     	adrp	x2, 0x3b82000 <stdout+0x40f40>
 198cbb0: aa1303e0     	mov	x0, x19
 198cbb4: f94017e1     	ldr	x1, [sp, #0x28]
 198cbb8: f9413042     	ldr	x2, [x2, #0x260]
 198cbbc: eb01005f     	cmp	x2, x1
 198cbc0: 1a9f17f3     	cset	w19, eq
 198cbc4: 9425bef3     	bl	0x22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x174678>
 198cbc8: 2a1303e0     	mov	w0, w19
 198cbcc: f9400bf3     	ldr	x19, [sp, #0x10]
 198cbd0: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 198cbd4: d65f03c0     	ret
 198cbd8: 9100a3f3     	add	x19, sp, #0x28
 198cbdc: aa1303e8     	mov	x8, x19
 198cbe0: d63f0060     	blr	x3
 198cbe4: 17fffff2     	b	0x198cbac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18cd24>
 198cbe8: d63f0040     	blr	x2
 198cbec: aa0003e1     	mov	x1, x0
 198cbf0: 17ffffec     	b	0x198cba0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18cd18>
 198cbf4: d503201f     	nop
 198cbf8: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
 198cbfc: 910003fd     	mov	x29, sp
