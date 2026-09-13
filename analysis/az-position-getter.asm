
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1b8e580:      	stp	x29, x30, [sp, #-0x20]!
 1b8e584:      	mov	w1, #0x9                // =9
 1b8e588:      	mov	x29, sp
 1b8e58c:      	str	x19, [sp, #0x10]
 1b8e590:      	add	x19, x0, #0x18, lsl #12 // =0x18000
 1b8e594:      	ldr	x0, [x19, #0x1828]
 1b8e598:      	bl	0x1f6b3e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x76b558>
 1b8e59c:      	ldr	w1, [x0, #0xc]
 1b8e5a0:      	cmp	w1, #0xb
 1b8e5a4:      	b.eq	0x1b8e5bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38e734>
 1b8e5a8:      	ldrb	w0, [x0, #0x10]
 1b8e5ac:      	cbz	w0, 0x1b8e5bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38e734>
 1b8e5b0:      	ldr	x0, [x19, #0x1858]
 1b8e5b4:      	ldrb	w0, [x0, #0x150]
 1b8e5b8:      	cbnz	w0, 0x1b8e608 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38e780>
 1b8e5bc:      	ldr	x1, [x19, #0x1848]
 1b8e5c0:      	ldr	w0, [x1, #0x1c8]
 1b8e5c4:      	cmp	w0, #0x1
 1b8e5c8:      	b.eq	0x1b8e5f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38e770>
 1b8e5cc:      	cmp	w0, #0x2
 1b8e5d0:      	b.ne	0x1b8e5e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38e75c>
 1b8e5d4:      	ldr	x19, [sp, #0x10]
 1b8e5d8:      	ldp	x29, x30, [sp], #0x20
 1b8e5dc:      	ldr	x0, [x1, #0x108]
 1b8e5e0:      	ret
 1b8e5e4:      	ldr	x0, [x19, #0x1808]
 1b8e5e8:      	ldr	x19, [sp, #0x10]
 1b8e5ec:      	ldp	x29, x30, [sp], #0x20
 1b8e5f0:      	ldr	x0, [x0, #0xf8]
 1b8e5f4:      	ret
 1b8e5f8:      	ldr	x19, [sp, #0x10]
 1b8e5fc:      	ldp	x29, x30, [sp], #0x20
 1b8e600:      	ldr	x0, [x1, #0xe0]
 1b8e604:      	ret
 1b8e608:      	ldr	x0, [x19, #0x1828]
 1b8e60c:      	mov	w1, #0x9                // =9
 1b8e610:      	bl	0x1f6b3e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x76b558>
 1b8e614:      	ldr	x19, [sp, #0x10]
 1b8e618:      	ldp	x29, x30, [sp], #0x20
 1b8e61c:      	ldr	x0, [x0, #0x30]
 1b8e620:      	ret
 1b8e624:      	nop
 1b8e628:      	stp	x29, x30, [sp, #-0x20]!
 1b8e62c:      	mov	w1, #0x9                // =9
 1b8e630:      	mov	x29, sp
 1b8e634:      	str	x19, [sp, #0x10]
 1b8e638:      	add	x19, x0, #0x18, lsl #12 // =0x18000
 1b8e63c:      	ldr	x0, [x19, #0x17f0]
 1b8e640:      	bl	0x1f6b3e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x76b558>
 1b8e644:      	ldr	w1, [x0, #0xc]
 1b8e648:      	cmp	w1, #0xb
 1b8e64c:      	b.eq	0x1b8e664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38e7dc>
 1b8e650:      	ldrb	w0, [x0, #0x10]
 1b8e654:      	cbz	w0, 0x1b8e664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38e7dc>
 1b8e658:      	ldr	x0, [x19, #0x1820]
 1b8e65c:      	ldrb	w0, [x0, #0x150]
 1b8e660:      	cbnz	w0, 0x1b8e6b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38e828>
 1b8e664:      	ldr	x1, [x19, #0x1810]
 1b8e668:      	ldr	w0, [x1, #0x1c8]
 1b8e66c:      	cmp	w0, #0x1
 1b8e670:      	b.eq	0x1b8e6a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38e818>
 1b8e674:      	cmp	w0, #0x2
 1b8e678:      	b.ne	0x1b8e68c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38e804>
 1b8e67c:      	ldr	x19, [sp, #0x10]
 1b8e680:      	ldp	x29, x30, [sp], #0x20
 1b8e684:      	ldr	x0, [x1, #0x108]
 1b8e688:      	ret
 1b8e68c:      	ldr	x0, [x19, #0x17d0]
 1b8e690:      	ldr	x19, [sp, #0x10]
 1b8e694:      	ldp	x29, x30, [sp], #0x20
 1b8e698:      	ldr	x0, [x0, #0xf8]
 1b8e69c:      	ret
 1b8e6a0:      	ldr	x19, [sp, #0x10]
 1b8e6a4:      	ldp	x29, x30, [sp], #0x20
 1b8e6a8:      	ldr	x0, [x1, #0xe0]
 1b8e6ac:      	ret
 1b8e6b0:      	ldr	x0, [x19, #0x17f0]
 1b8e6b4:      	mov	w1, #0x9                // =9
 1b8e6b8:      	bl	0x1f6b3e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x76b558>
 1b8e6bc:      	ldr	x19, [sp, #0x10]
 1b8e6c0:      	ldp	x29, x30, [sp], #0x20
 1b8e6c4:      	ldr	x0, [x0, #0x30]
 1b8e6c8:      	ret
 1b8e6cc:      	nop
 1b8e6d0:      	stp	x29, x30, [sp, #-0x70]!
 1b8e6d4:      	add	x0, x0, #0x18, lsl #12  // =0x18000
 1b8e6d8:      	mov	x29, sp
 1b8e6dc:      	stp	x19, x20, [sp, #0x10]
 1b8e6e0:      	ldr	x1, [x0, #0x17e8]
 1b8e6e4:      	ldrb	w19, [x1, #0x38]
 1b8e6e8:      	cbnz	w19, 0x1b8e6fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x38e874>
 1b8e6ec:      	mov	w0, w19
 1b8e6f0:      	ldp	x19, x20, [sp, #0x10]
 1b8e6f4:      	ldp	x29, x30, [sp], #0x70
 1b8e6f8:      	ret
 1b8e6fc:      	ldr	x0, [x0, #0x17f8]
