
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1c6c598: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 1c6c59c: 910003fd     	mov	x29, sp
 1c6c5a0: a90153f3     	stp	x19, x20, [sp, #0x10]
 1c6c5a4: aa0003f4     	mov	x20, x0
 1c6c5a8: 34000341     	cbz	w1, 0x1c6c610 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c788>
 1c6c5ac: 7100043f     	cmp	w1, #0x1
 1c6c5b0: 540002a0     	b.eq	0x1c6c604 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c77c>
 1c6c5b4: d2800001     	mov	x1, #0x0                // =0
 1c6c5b8: 52800000     	mov	w0, #0x0                // =0
 1c6c5bc: 94165041     	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1c6c5c0: 52800013     	mov	w19, #0x0               // =0
 1c6c5c4: 52800001     	mov	w1, #0x0                // =0
 1c6c5c8: f9400680     	ldr	x0, [x20, #0x8]
 1c6c5cc: f9406402     	ldr	x2, [x0, #0xc8]
 1c6c5d0: aa0203e0     	mov	x0, x2
 1c6c5d4: f9400042     	ldr	x2, [x2]
 1c6c5d8: f9403042     	ldr	x2, [x2, #0x60]
 1c6c5dc: d63f0040     	blr	x2
 1c6c5e0: f9400680     	ldr	x0, [x20, #0x8]
 1c6c5e4: 2a1303e1     	mov	w1, w19
 1c6c5e8: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1c6c5ec: f9406802     	ldr	x2, [x0, #0xd0]
 1c6c5f0: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 1c6c5f4: aa0203e0     	mov	x0, x2
 1c6c5f8: f9400042     	ldr	x2, [x2]
 1c6c5fc: f9403042     	ldr	x2, [x2, #0x60]
 1c6c600: d61f0040     	br	x2
 1c6c604: 2a0103f3     	mov	w19, w1
 1c6c608: 52800001     	mov	w1, #0x0                // =0
 1c6c60c: 17ffffef     	b	0x1c6c5c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c740>
 1c6c610: 52800013     	mov	w19, #0x0               // =0
 1c6c614: 52800021     	mov	w1, #0x1                // =1
 1c6c618: 17ffffec     	b	0x1c6c5c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c740>
 1c6c61c: d503201f     	nop
 1c6c620: 91004002     	add	x2, x0, #0x10
 1c6c624: 91010003     	add	x3, x0, #0x40
 1c6c628: f9400400     	ldr	x0, [x0, #0x8]
 1c6c62c: f9406400     	ldr	x0, [x0, #0xc8]
 1c6c630: 39430000     	ldrb	w0, [x0, #0xc0]
 1c6c634: f27f001f     	tst	x0, #0x2
 1c6c638: 9a820060     	csel	x0, x3, x2, eq
 1c6c63c: 17fffdbb     	b	0x1c6bd28 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bea0>
 1c6c640: 91004001     	add	x1, x0, #0x10
 1c6c644: 91010002     	add	x2, x0, #0x40
 1c6c648: f9400400     	ldr	x0, [x0, #0x8]
 1c6c64c: f9406400     	ldr	x0, [x0, #0xc8]
 1c6c650: 39430000     	ldrb	w0, [x0, #0xc0]
 1c6c654: f27f001f     	tst	x0, #0x2
 1c6c658: 9a810040     	csel	x0, x2, x1, eq
 1c6c65c: 17fffde1     	b	0x1c6bde0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bf58>
 1c6c660: 91004001     	add	x1, x0, #0x10
 1c6c664: 91010002     	add	x2, x0, #0x40
 1c6c668: f9400400     	ldr	x0, [x0, #0x8]
 1c6c66c: f9406400     	ldr	x0, [x0, #0xc8]
 1c6c670: 39430000     	ldrb	w0, [x0, #0xc0]
 1c6c674: f27f001f     	tst	x0, #0x2
 1c6c678: 9a810040     	csel	x0, x2, x1, eq
 1c6c67c: 17fffe3f     	b	0x1c6bf78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c0f0>
 1c6c680: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 1c6c684: 52800021     	mov	w1, #0x1                // =1
 1c6c688: 910003fd     	mov	x29, sp
 1c6c68c: f9400402     	ldr	x2, [x0, #0x8]
 1c6c690: f9000bf3     	str	x19, [sp, #0x10]
 1c6c694: aa0003f3     	mov	x19, x0
 1c6c698: aa0203e0     	mov	x0, x2
 1c6c69c: f9400042     	ldr	x2, [x2]
 1c6c6a0: f9403042     	ldr	x2, [x2, #0x60]
 1c6c6a4: d63f0040     	blr	x2
 1c6c6a8: f9400660     	ldr	x0, [x19, #0x8]
 1c6c6ac: f9406400     	ldr	x0, [x0, #0xc8]
 1c6c6b0: 94205808     	bl	0x24826d0 <_ZNSt8functionIFvvEEC2ERKS1_+0x10d2b0>
 1c6c6b4: 72001c1f     	tst	w0, #0xff
 1c6c6b8: f9400660     	ldr	x0, [x19, #0x8]
 1c6c6bc: 540000a0     	b.eq	0x1c6c6d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c848>
 1c6c6c0: f9400bf3     	ldr	x19, [sp, #0x10]
 1c6c6c4: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 1c6c6c8: f9406400     	ldr	x0, [x0, #0xc8]
 1c6c6cc: 142084e9     	b	0x248da70 <_ZNSt8functionIFvvEEC2ERKS1_+0x118650>
 1c6c6d0: f9406800     	ldr	x0, [x0, #0xd0]
 1c6c6d4: 942057ff     	bl	0x24826d0 <_ZNSt8functionIFvvEEC2ERKS1_+0x10d2b0>
 1c6c6d8: 72001c1f     	tst	w0, #0xff
 1c6c6dc: 54000081     	b.ne	0x1c6c6ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c864>
 1c6c6e0: f9400bf3     	ldr	x19, [sp, #0x10]
 1c6c6e4: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 1c6c6e8: d65f03c0     	ret
 1c6c6ec: f9400660     	ldr	x0, [x19, #0x8]
 1c6c6f0: f9400bf3     	ldr	x19, [sp, #0x10]
 1c6c6f4: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 1c6c6f8: f9406800     	ldr	x0, [x0, #0xd0]
 1c6c6fc: 142084dd     	b	0x248da70 <_ZNSt8functionIFvvEEC2ERKS1_+0x118650>
 1c6c700: f9400402     	ldr	x2, [x0, #0x8]
 1c6c704: 52800001     	mov	w1, #0x0                // =0
 1c6c708: aa0203e0     	mov	x0, x2
 1c6c70c: f9400042     	ldr	x2, [x2]
 1c6c710: f9403042     	ldr	x2, [x2, #0x60]
 1c6c714: d61f0040     	br	x2
 1c6c718: 91004000     	add	x0, x0, #0x10
 1c6c71c: 17fffe37     	b	0x1c6bff8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c170>
 1c6c720: 91004000     	add	x0, x0, #0x10
 1c6c724: 17fffe79     	b	0x1c6c108 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46c280>
 1c6c728: 91010000     	add	x0, x0, #0x40
 1c6c72c: 1400060b     	b	0x1c6df58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46e0d0>
 1c6c730: 91010000     	add	x0, x0, #0x40
 1c6c734: 1400064d     	b	0x1c6e068 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46e1e0>
 1c6c738: 91004001     	add	x1, x0, #0x10
 1c6c73c: 91010002     	add	x2, x0, #0x40
 1c6c740: f9400400     	ldr	x0, [x0, #0x8]
 1c6c744: f9406400     	ldr	x0, [x0, #0xc8]
 1c6c748: 39430000     	ldrb	w0, [x0, #0xc0]
 1c6c74c: f27f001f     	tst	x0, #0x2
 1c6c750: 9a810040     	csel	x0, x2, x1, eq
 1c6c754: d65f03c0     	ret
 1c6c758: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
 1c6c75c: aa0103e2     	mov	x2, x1
 1c6c760: 910003fd     	mov	x29, sp
 1c6c764: a90153f3     	stp	x19, x20, [sp, #0x10]
 1c6c768: aa0003f3     	mov	x19, x0
 1c6c76c: f0007f00     	adrp	x0, 0x2c4f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x68c1a8>
 1c6c770: f9406421     	ldr	x1, [x1, #0xc8]
 1c6c774: f90013f5     	str	x21, [sp, #0x20]
 1c6c778: 911fc000     	add	x0, x0, #0x7f0
 1c6c77c: a9000a60     	stp	x0, x2, [x19]
