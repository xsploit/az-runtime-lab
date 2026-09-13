
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 20125b0: f940d261     	ldr	x1, [x19, #0x1a0]
 20125b4: b2400002     	orr	x2, x0, #0x1
 20125b8: 910663e0     	add	x0, sp, #0x198
 20125bc: f900cfe2     	str	x2, [sp, #0x198]
 20125c0: 940009b4     	bl	0x2014c90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x814e08>
 20125c4: f940b660     	ldr	x0, [x19, #0x168]
 20125c8: f9402414     	ldr	x20, [x0, #0x48]
 20125cc: f9402000     	ldr	x0, [x0, #0x40]
 20125d0: b4000134     	cbz	x20, 0x20125f4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x81276c>
 20125d4: f0006f41     	adrp	x1, 0x2dfd000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x83a1a8>
 20125d8: f9461021     	ldr	x1, [x1, #0xc20]
 20125dc: b4000b61     	cbz	x1, 0x2012748 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8128c0>
 20125e0: 91002281     	add	x1, x20, #0x8
 20125e4: 885ffc22     	ldaxr	w2, [x1]
 20125e8: 11000442     	add	w2, w2, #0x1
 20125ec: 8803fc22     	stlxr	w3, w2, [x1]
 20125f0: 35ffffa3     	cbnz	w3, 0x20125e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x81275c>
 20125f4: f940ce61     	ldr	x1, [x19, #0x198]
 20125f8: f100003f     	cmp	x1, #0x0
 20125fc: 91002022     	add	x2, x1, #0x8
 2012600: 9a811041     	csel	x1, x2, x1, ne
 2012604: 97fdd209     	bl	0x1f86e28 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x786fa0>
 2012608: b4000074     	cbz	x20, 0x2012614 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x81278c>
 201260c: aa1403e0     	mov	x0, x20
 2012610: 97998732     	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 2012614: f940b660     	ldr	x0, [x19, #0x168]
 2012618: f9402414     	ldr	x20, [x0, #0x48]
 201261c: f9402000     	ldr	x0, [x0, #0x40]
 2012620: b4000134     	cbz	x20, 0x2012644 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8127bc>
 2012624: f0006f41     	adrp	x1, 0x2dfd000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x83a1a8>
 2012628: f9461021     	ldr	x1, [x1, #0xc20]
 201262c: b40009e1     	cbz	x1, 0x2012768 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8128e0>
 2012630: 91002281     	add	x1, x20, #0x8
 2012634: 885ffc22     	ldaxr	w2, [x1]
 2012638: 11000442     	add	w2, w2, #0x1
 201263c: 8803fc22     	stlxr	w3, w2, [x1]
 2012640: 35ffffa3     	cbnz	w3, 0x2012634 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8127ac>
 2012644: f940d261     	ldr	x1, [x19, #0x1a0]
 2012648: f100003f     	cmp	x1, #0x0
 201264c: 91002022     	add	x2, x1, #0x8
 2012650: 9a811041     	csel	x1, x2, x1, ne
 2012654: 97fdd1f5     	bl	0x1f86e28 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x786fa0>
 2012658: b4000074     	cbz	x20, 0x2012664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8127dc>
 201265c: aa1403e0     	mov	x0, x20
 2012660: 9799871e     	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 2012664: d2801800     	mov	x0, #0xc0               // =192
 2012668: f9400675     	ldr	x21, [x19, #0x8]
 201266c: a942de76     	ldp	x22, x23, [x19, #0x28]
 2012670: 979049b4     	bl	0x424d40 <_Znwm@plt>
 2012674: f9406fe3     	ldr	x3, [sp, #0xd8]
 2012678: aa0003f4     	mov	x20, x0
 201267c: aa1703e5     	mov	x5, x23
 2012680: aa1603e4     	mov	x4, x22
 2012684: aa1503e2     	mov	x2, x21
 2012688: aa1c03e1     	mov	x1, x28
 201268c: 97e5efe5     	bl	0x198e620 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18e798>
 2012690: f940ca60     	ldr	x0, [x19, #0x190]
 2012694: f900ca74     	str	x20, [x19, #0x190]
 2012698: b4000080     	cbz	x0, 0x20126a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x812820>
 201269c: f9400001     	ldr	x1, [x0]
 20126a0: f9400421     	ldr	x1, [x1, #0x8]
 20126a4: d63f0020     	blr	x1
 20126a8: f940b3e0     	ldr	x0, [sp, #0x160]
 20126ac: b4000040     	cbz	x0, 0x20126b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x81282c>
 20126b0: 979049e8     	bl	0x424e50 <_ZdlPv@plt>
 20126b4: 910483e0     	add	x0, sp, #0x120
 20126b8: 97e1e4f4     	bl	0x188ba88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8bc00>
 20126bc: 910443e0     	add	x0, sp, #0x110
 20126c0: 940013f0     	bl	0x2017680 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8177f8>
 20126c4: 910403e0     	add	x0, sp, #0x100
 20126c8: 94001300     	bl	0x20172c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x817440>
 20126cc: 9103c3e0     	add	x0, sp, #0xf0
 20126d0: 9400125a     	bl	0x2017038 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8171b0>
 20126d4: a94153f3     	ldp	x19, x20, [sp, #0x10]
 20126d8: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 20126dc: a94363f7     	ldp	x23, x24, [sp, #0x30]
 20126e0: a9446bf9     	ldp	x25, x26, [sp, #0x40]
 20126e4: a94573fb     	ldp	x27, x28, [sp, #0x50]
 20126e8: 6d4627e8     	ldp	d8, d9, [sp, #0x60]
 20126ec: fd403bea     	ldr	d10, [sp, #0x70]
 20126f0: a8db7bfd     	ldp	x29, x30, [sp], #0x1b0
 20126f4: d65f03c0     	ret
