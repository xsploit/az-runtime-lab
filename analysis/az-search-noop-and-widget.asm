
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1c6c240: d65f03c0     	ret
 1c6c244: 00000000     	udf	#0x0
 1c6c248: d65f03c0     	ret
 1c6c24c: d503201f     	nop
 1c6c250: d65f03c0     	ret
 1c6c254: d503201f     	nop
 1c6c258: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 1c6c25c: f0007f01     	adrp	x1, 0x2c4f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x68c1a8>
 1c6c260: 91114021     	add	x1, x1, #0x450
 1c6c264: 910003fd     	mov	x29, sp
 1c6c268: f9000bf3     	str	x19, [sp, #0x10]
 1c6c26c: aa0003f3     	mov	x19, x0
 1c6c270: f9406400     	ldr	x0, [x0, #0xc8]
 1c6c274: f9000261     	str	x1, [x19]
 1c6c278: f900667f     	str	xzr, [x19, #0xc8]
 1c6c27c: b4000080     	cbz	x0, 0x1c6c28c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c404>
 1c6c280: f9400001     	ldr	x1, [x0]
 1c6c284: f9400421     	ldr	x1, [x1, #0x8]
 1c6c288: d63f0020     	blr	x1
 1c6c28c: f9406a60     	ldr	x0, [x19, #0xd0]
 1c6c290: f9006a7f     	str	xzr, [x19, #0xd0]
 1c6c294: b4000120     	cbz	x0, 0x1c6c2b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c430>
 1c6c298: f9400001     	ldr	x1, [x0]
 1c6c29c: f9400421     	ldr	x1, [x1, #0x8]
 1c6c2a0: d63f0020     	blr	x1
 1c6c2a4: f9406a60     	ldr	x0, [x19, #0xd0]
 1c6c2a8: b4000080     	cbz	x0, 0x1c6c2b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c430>
 1c6c2ac: f9400001     	ldr	x1, [x0]
 1c6c2b0: f9400421     	ldr	x1, [x1, #0x8]
 1c6c2b4: d63f0020     	blr	x1
 1c6c2b8: f9406660     	ldr	x0, [x19, #0xc8]
 1c6c2bc: b4000080     	cbz	x0, 0x1c6c2cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c444>
 1c6c2c0: f9400001     	ldr	x1, [x0]
 1c6c2c4: f9400421     	ldr	x1, [x1, #0x8]
 1c6c2c8: d63f0020     	blr	x1
 1c6c2cc: aa1303e0     	mov	x0, x19
 1c6c2d0: f9400bf3     	ldr	x19, [sp, #0x10]
 1c6c2d4: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 1c6c2d8: 142096fe     	b	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1c6c2dc: d503201f     	nop
 1c6c2e0: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 1c6c2e4: 910003fd     	mov	x29, sp
 1c6c2e8: f9000bf3     	str	x19, [sp, #0x10]
 1c6c2ec: aa0003f3     	mov	x19, x0
 1c6c2f0: 97ffffda     	bl	0x1c6c258 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c3d0>
 1c6c2f4: aa1303e0     	mov	x0, x19
 1c6c2f8: d2801b01     	mov	x1, #0xd8               // =216
 1c6c2fc: f9400bf3     	ldr	x19, [sp, #0x10]
 1c6c300: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 1c6c304: 179ee8d7     	b	0x426660 <_ZdlPvm@plt>
 1c6c308: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 1c6c30c: 910003fd     	mov	x29, sp
 1c6c310: f9000bf3     	str	x19, [sp, #0x10]
 1c6c314: aa0003f3     	mov	x19, x0
 1c6c318: 39400400     	ldrb	w0, [x0, #0x1]
 1c6c31c: 35000200     	cbnz	w0, 0x1c6c35c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c4d4>
 1c6c320: d2800000     	mov	x0, #0x0                // =0
 1c6c324: 39400262     	ldrb	w2, [x19]
 1c6c328: d2801661     	mov	x1, #0xb3               // =179
 1c6c32c: f2f12001     	movk	x1, #0x8900, lsl #48
 1c6c330: d28d1443     	mov	x3, #0x68a2             // =26786
 1c6c334: 8b000040     	add	x0, x2, x0
 1c6c338: f2a7f103     	movk	x3, #0x3f88, lsl #16
 1c6c33c: f2cbadc3     	movk	x3, #0x5d6e, lsl #32
 1c6c340: f2e03bc3     	movk	x3, #0x1de, lsl #48
 1c6c344: 9bc17c01     	umulh	x1, x0, x1
 1c6c348: f9400bf3     	ldr	x19, [sp, #0x10]
 1c6c34c: d378fc21     	lsr	x1, x1, #56
 1c6c350: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 1c6c354: 9b038020     	msub	x0, x1, x3, x0
 1c6c358: d65f03c0     	ret
 1c6c35c: 91000660     	add	x0, x19, #0x1
 1c6c360: 97ffffea     	bl	0x1c6c308 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c480>
 1c6c364: 8b001001     	add	x1, x0, x0, lsl #4
 1c6c368: 8b010c00     	add	x0, x0, x1, lsl #3
 1c6c36c: 17ffffee     	b	0x1c6c324 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c49c>
 1c6c370: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
 1c6c374: 910003fd     	mov	x29, sp
 1c6c378: a90153f3     	stp	x19, x20, [sp, #0x10]
 1c6c37c: aa0003f3     	mov	x19, x0
 1c6c380: f90013f5     	str	x21, [sp, #0x20]
 1c6c384: 941f431b     	bl	0x243cff0 <_ZNSt8functionIFvvEEC2ERKS1_+0xc7bd0>
 1c6c388: f0007f01     	adrp	x1, 0x2c4f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x68c1a8>
 1c6c38c: 91114021     	add	x1, x1, #0x450
 1c6c390: f9000261     	str	x1, [x19]
 1c6c394: f0006aa0     	adrp	x0, 0x29c3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4001a8>
 1c6c398: a90cfe7f     	stp	xzr, xzr, [x19, #0xc8]
 1c6c39c: 913c7c00     	add	x0, x0, #0xf1f
 1c6c3a0: 97ffffda     	bl	0x1c6c308 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c480>
 1c6c3a4: 8b001003     	add	x3, x0, x0, lsl #4
 1c6c3a8: d2801661     	mov	x1, #0xb3               // =179
 1c6c3ac: d28d1442     	mov	x2, #0x68a2             // =26786
 1c6c3b0: 8b030c03     	add	x3, x0, x3, lsl #3
 1c6c3b4: f2f12001     	movk	x1, #0x8900, lsl #48
 1c6c3b8: 9101b864     	add	x4, x3, #0x6e
 1c6c3bc: f2a7f102     	movk	x2, #0x3f88, lsl #16
 1c6c3c0: f2cbadc2     	movk	x2, #0x5d6e, lsl #32
 1c6c3c4: d2801f00     	mov	x0, #0xf8               // =248
 1c6c3c8: f2e03bc2     	movk	x2, #0x1de, lsl #48
 1c6c3cc: 9bc17c83     	umulh	x3, x4, x1
 1c6c3d0: d378fc63     	lsr	x3, x3, #56
 1c6c3d4: 9b029063     	msub	x3, x3, x2, x4
 1c6c3d8: 8b031064     	add	x4, x3, x3, lsl #4
 1c6c3dc: 8b040c63     	add	x3, x3, x4, lsl #3
 1c6c3e0: 91018464     	add	x4, x3, #0x61
 1c6c3e4: 9bc17c83     	umulh	x3, x4, x1
 1c6c3e8: d378fc63     	lsr	x3, x3, #56
 1c6c3ec: 9b029063     	msub	x3, x3, x2, x4
 1c6c3f0: 8b031064     	add	x4, x3, x3, lsl #4
 1c6c3f4: 8b040c63     	add	x3, x3, x4, lsl #3
 1c6c3f8: 91013464     	add	x4, x3, #0x4d
 1c6c3fc: 9bc17c83     	umulh	x3, x4, x1
 1c6c400: d378fc63     	lsr	x3, x3, #56
 1c6c404: 9b029063     	msub	x3, x3, x2, x4
 1c6c408: 8b031064     	add	x4, x3, x3, lsl #4
 1c6c40c: 8b040c63     	add	x3, x3, x4, lsl #3
 1c6c410: 9101d064     	add	x4, x3, #0x74
 1c6c414: 9bc17c83     	umulh	x3, x4, x1
 1c6c418: d378fc63     	lsr	x3, x3, #56
 1c6c41c: 9b029063     	msub	x3, x3, x2, x4
 1c6c420: 8b031064     	add	x4, x3, x3, lsl #4
 1c6c424: 8b040c63     	add	x3, x3, x4, lsl #3
 1c6c428: 9101b864     	add	x4, x3, #0x6e
 1c6c42c: 9bc17c83     	umulh	x3, x4, x1
 1c6c430: d378fc63     	lsr	x3, x3, #56
 1c6c434: 9b029063     	msub	x3, x3, x2, x4
 1c6c438: 8b031064     	add	x4, x3, x3, lsl #4
 1c6c43c: 8b040c63     	add	x3, x3, x4, lsl #3
 1c6c440: 9101bc64     	add	x4, x3, #0x6f
 1c6c444: 9bc17c83     	umulh	x3, x4, x1
 1c6c448: d378fc63     	lsr	x3, x3, #56
 1c6c44c: 9b029063     	msub	x3, x3, x2, x4
