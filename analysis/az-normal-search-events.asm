
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1c6b810: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
 1c6b814: 910003fd     	mov	x29, sp
 1c6b818: a90153f3     	stp	x19, x20, [sp, #0x10]
 1c6b81c: aa0003f4     	mov	x20, x0
 1c6b820: 9100a3e8     	add	x8, sp, #0x28
 1c6b824: aa0103e0     	mov	x0, x1
 1c6b828: 94219a06     	bl	0x24d2040 <_ZNSt8functionIFvvEEC2ERKS1_+0x15cc20>
 1c6b82c: b9402a93     	ldr	w19, [x20, #0x28]
 1c6b830: 2a1303e0     	mov	w0, w19
 1c6b834: 7100027f     	cmp	w19, #0x0
 1c6b838: 5400028d     	b.le	0x1c6b888 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46ba00>
 1c6b83c: 51000673     	sub	w19, w19, #0x1
 1c6b840: 6b00027f     	cmp	w19, w0
 1c6b844: 5400006b     	b.lt	0x1c6b850 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46b9c8>
 1c6b848: 71000413     	subs	w19, w0, #0x1
 1c6b84c: 540001e4     	b.mi	0x1c6b888 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46ba00>
 1c6b850: f9400e80     	ldr	x0, [x20, #0x18]
 1c6b854: 9100a3e1     	add	x1, sp, #0x28
 1c6b858: f873d802     	ldr	x2, [x0, w19, sxtw #3]
 1c6b85c: aa0203e0     	mov	x0, x2
 1c6b860: f9400042     	ldr	x2, [x2]
 1c6b864: f9400042     	ldr	x2, [x2]
 1c6b868: d63f0040     	blr	x2
 1c6b86c: 7100027f     	cmp	w19, #0x0
 1c6b870: 540000cd     	b.le	0x1c6b888 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46ba00>
 1c6b874: b9402a80     	ldr	w0, [x20, #0x28]
 1c6b878: 51000673     	sub	w19, w19, #0x1
 1c6b87c: 6b00027f     	cmp	w19, w0
 1c6b880: 54fffe4a     	b.ge	0x1c6b848 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46b9c0>
 1c6b884: 17fffff3     	b	0x1c6b850 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46b9c8>
 1c6b888: 9100a3e0     	add	x0, sp, #0x28
 1c6b88c: 941a435d     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1c6b890: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1c6b894: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 1c6b898: d65f03c0     	ret
 1c6b89c: aa0003f3     	mov	x19, x0
 1c6b8a0: 9100a3e0     	add	x0, sp, #0x28
 1c6b8a4: 941a4357     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1c6b8a8: aa1303e0     	mov	x0, x19
 1c6b8ac: 979ee519     	bl	0x424d10 <_Unwind_Resume@plt>
 1c6b8b0: d1002000     	sub	x0, x0, #0x8
 1c6b8b4: 17ffffd7     	b	0x1c6b810 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46b988>
 1c6b8b8: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 1c6b8bc: 910003fd     	mov	x29, sp
 1c6b8c0: a90153f3     	stp	x19, x20, [sp, #0x10]
 1c6b8c4: aa0003f4     	mov	x20, x0
 1c6b8c8: 90000013     	adrp	x19, 0x1c6b000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46b178>
 1c6b8cc: f9400800     	ldr	x0, [x0, #0x10]
 1c6b8d0: 911f4273     	add	x19, x19, #0x7d0
 1c6b8d4: f9400001     	ldr	x1, [x0]
 1c6b8d8: f940b421     	ldr	x1, [x1, #0x168]
 1c6b8dc: eb13003f     	cmp	x1, x19
 1c6b8e0: 54000361     	b.ne	0x1c6b94c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bac4>
 1c6b8e4: f9407400     	ldr	x0, [x0, #0xe8]
 1c6b8e8: 94205b7a     	bl	0x24826d0 <_ZNSt8functionIFvvEEC2ERKS1_+0x10d2b0>
 1c6b8ec: 72001c1f     	tst	w0, #0xff
 1c6b8f0: 54000280     	b.eq	0x1c6b940 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bab8>
 1c6b8f4: f9400a80     	ldr	x0, [x20, #0x10]
 1c6b8f8: f9400001     	ldr	x1, [x0]
 1c6b8fc: f940b421     	ldr	x1, [x1, #0x168]
 1c6b900: eb13003f     	cmp	x1, x19
 1c6b904: 540002c1     	b.ne	0x1c6b95c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bad4>
 1c6b908: f9407400     	ldr	x0, [x0, #0xe8]
 1c6b90c: 52800021     	mov	w1, #0x1                // =1
 1c6b910: 941f4aac     	bl	0x243e3c0 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8fa0>
 1c6b914: 72001c1f     	tst	w0, #0xff
 1c6b918: 54000141     	b.ne	0x1c6b940 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bab8>
 1c6b91c: f9400a80     	ldr	x0, [x20, #0x10]
 1c6b920: f9400001     	ldr	x1, [x0]
 1c6b924: f940b421     	ldr	x1, [x1, #0x168]
 1c6b928: eb13003f     	cmp	x1, x19
 1c6b92c: 54000141     	b.ne	0x1c6b954 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bacc>
 1c6b930: f9407400     	ldr	x0, [x0, #0xe8]
 1c6b934: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1c6b938: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 1c6b93c: 1420884d     	b	0x248da70 <_ZNSt8functionIFvvEEC2ERKS1_+0x118650>
 1c6b940: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1c6b944: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 1c6b948: d65f03c0     	ret
 1c6b94c: d63f0020     	blr	x1
 1c6b950: 17ffffe6     	b	0x1c6b8e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46ba60>
 1c6b954: d63f0020     	blr	x1
 1c6b958: 17fffff7     	b	0x1c6b934 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46baac>
 1c6b95c: d63f0020     	blr	x1
 1c6b960: 17ffffeb     	b	0x1c6b90c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46ba84>
 1c6b964: d503201f     	nop
 1c6b968: f9400800     	ldr	x0, [x0, #0x10]
 1c6b96c: 179ee461     	b	0x424af0 <free@plt>
 1c6b970: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 1c6b974: 910003fd     	mov	x29, sp
 1c6b978: f9000bf3     	str	x19, [sp, #0x10]
 1c6b97c: aa0003f3     	mov	x19, x0
 1c6b980: f9400800     	ldr	x0, [x0, #0x10]
 1c6b984: 979ee45b     	bl	0x424af0 <free@plt>
 1c6b988: d1002260     	sub	x0, x19, #0x8
 1c6b98c: d2800601     	mov	x1, #0x30               // =48
 1c6b990: f9400bf3     	ldr	x19, [sp, #0x10]
 1c6b994: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 1c6b998: 179eeb32     	b	0x426660 <_ZdlPvm@plt>
 1c6b99c: d503201f     	nop
 1c6b9a0: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
 1c6b9a4: 90000001     	adrp	x1, 0x1c6b000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46b178>
 1c6b9a8: 911f4021     	add	x1, x1, #0x7d0
 1c6b9ac: 910003fd     	mov	x29, sp
 1c6b9b0: f9400800     	ldr	x0, [x0, #0x10]
 1c6b9b4: f9400002     	ldr	x2, [x0]
 1c6b9b8: f940b442     	ldr	x2, [x2, #0x168]
 1c6b9bc: f9000bf3     	str	x19, [sp, #0x10]
 1c6b9c0: eb01005f     	cmp	x2, x1
 1c6b9c4: 540001e1     	b.ne	0x1c6ba00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bb78>
 1c6b9c8: f9407413     	ldr	x19, [x0, #0xe8]
 1c6b9cc: 9100a3e0     	add	x0, sp, #0x28
 1c6b9d0: d0004aa1     	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1c6b9d4: 91352021     	add	x1, x1, #0xd48
 1c6b9d8: 941b20c2     	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1c6b9dc: aa1303e0     	mov	x0, x19
 1c6b9e0: 9100a3e1     	add	x1, sp, #0x28
 1c6b9e4: 52800022     	mov	w2, #0x1                // =1
 1c6b9e8: 9421b9fa     	bl	0x24da1d0 <_ZNSt8functionIFvvEEC2ERKS1_+0x164db0>
 1c6b9ec: 9100a3e0     	add	x0, sp, #0x28
 1c6b9f0: 941a4304     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1c6b9f4: f9400bf3     	ldr	x19, [sp, #0x10]
 1c6b9f8: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 1c6b9fc: d65f03c0     	ret
 1c6ba00: d63f0040     	blr	x2
 1c6ba04: aa0003f3     	mov	x19, x0
 1c6ba08: 17fffff1     	b	0x1c6b9cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bb44>
 1c6ba0c: aa0003f3     	mov	x19, x0
 1c6ba10: 9100a3e0     	add	x0, sp, #0x28
 1c6ba14: 941a42fb     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1c6ba18: aa1303e0     	mov	x0, x19
 1c6ba1c: 979ee4bd     	bl	0x424d10 <_Unwind_Resume@plt>
 1c6ba20: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 1c6ba24: 910003fd     	mov	x29, sp
 1c6ba28: a90153f3     	stp	x19, x20, [sp, #0x10]
 1c6ba2c: d1002014     	sub	x20, x0, #0x8
 1c6ba30: 90000013     	adrp	x19, 0x1c6b000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46b178>
 1c6ba34: 911f4273     	add	x19, x19, #0x7d0
 1c6ba38: f9400a80     	ldr	x0, [x20, #0x10]
 1c6ba3c: f9400001     	ldr	x1, [x0]
 1c6ba40: f940b421     	ldr	x1, [x1, #0x168]
 1c6ba44: eb13003f     	cmp	x1, x19
 1c6ba48: 540003e0     	b.eq	0x1c6bac4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bc3c>
 1c6ba4c: d63f0020     	blr	x1
 1c6ba50: 94205b20     	bl	0x24826d0 <_ZNSt8functionIFvvEEC2ERKS1_+0x10d2b0>
 1c6ba54: 72001c1f     	tst	w0, #0xff
 1c6ba58: 54000280     	b.eq	0x1c6baa8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bc20>
 1c6ba5c: f9400a80     	ldr	x0, [x20, #0x10]
 1c6ba60: f9400001     	ldr	x1, [x0]
 1c6ba64: f940b421     	ldr	x1, [x1, #0x168]
 1c6ba68: eb13003f     	cmp	x1, x19
 1c6ba6c: 54000280     	b.eq	0x1c6babc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bc34>
 1c6ba70: d63f0020     	blr	x1
 1c6ba74: 52800021     	mov	w1, #0x1                // =1
 1c6ba78: 941f4a52     	bl	0x243e3c0 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8fa0>
 1c6ba7c: 72001c1f     	tst	w0, #0xff
 1c6ba80: 54000141     	b.ne	0x1c6baa8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bc20>
 1c6ba84: f9400a80     	ldr	x0, [x20, #0x10]
 1c6ba88: f9400001     	ldr	x1, [x0]
 1c6ba8c: f940b421     	ldr	x1, [x1, #0x168]
 1c6ba90: eb13003f     	cmp	x1, x19
 1c6ba94: 54000100     	b.eq	0x1c6bab4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bc2c>
 1c6ba98: d63f0020     	blr	x1
 1c6ba9c: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1c6baa0: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 1c6baa4: 142087f3     	b	0x248da70 <_ZNSt8functionIFvvEEC2ERKS1_+0x118650>
 1c6baa8: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1c6baac: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 1c6bab0: d65f03c0     	ret
 1c6bab4: f9407400     	ldr	x0, [x0, #0xe8]
 1c6bab8: 17fffff9     	b	0x1c6ba9c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bc14>
 1c6babc: f9407400     	ldr	x0, [x0, #0xe8]
 1c6bac0: 17ffffed     	b	0x1c6ba74 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bbec>
 1c6bac4: f9407400     	ldr	x0, [x0, #0xe8]
 1c6bac8: 17ffffe2     	b	0x1c6ba50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bbc8>
 1c6bacc: d503201f     	nop
 1c6bad0: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
 1c6bad4: 90007f23     	adrp	x3, 0x2c4f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x68c1a8>
 1c6bad8: 90007f22     	adrp	x2, 0x2c4f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x68c1a8>
 1c6badc: 910003fd     	mov	x29, sp
 1c6bae0: a90153f3     	stp	x19, x20, [sp, #0x10]
 1c6bae4: aa0003f3     	mov	x19, x0
 1c6bae8: 910de063     	add	x3, x3, #0x378
 1c6baec: a9025bf5     	stp	x21, x22, [sp, #0x20]
 1c6baf0: 910f2042     	add	x2, x2, #0x3c8
 1c6baf4: aa0103e0     	mov	x0, x1
 1c6baf8: a90363f7     	stp	x23, x24, [sp, #0x30]
 1c6bafc: a9000a63     	stp	x3, x2, [x19]
 1c6bb00: a9017e61     	stp	x1, xzr, [x19, #0x10]
 1c6bb04: b900227f     	str	wzr, [x19, #0x20]
 1c6bb08: b9002a7f     	str	wzr, [x19, #0x28]
 1c6bb0c: b4000801     	cbz	x1, 0x1c6bc0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bd84>
 1c6bb10: f9400002     	ldr	x2, [x0]
 1c6bb14: 90000001     	adrp	x1, 0x1c6b000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46b178>
 1c6bb18: 911f2021     	add	x1, x1, #0x7c8
 1c6bb1c: f940b042     	ldr	x2, [x2, #0x160]
 1c6bb20: eb01005f     	cmp	x2, x1
 1c6bb24: 54000801     	b.ne	0x1c6bc24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x46bd9c>
 1c6bb28: f9407015     	ldr	x21, [x0, #0xe0]
 1c6bb2c: 910822b6     	add	x22, x21, #0x208
 1c6bb30: b94012c2     	ldr	w2, [x22, #0x10]
 1c6bb34: f94106a0     	ldr	x0, [x21, #0x208]
 1c6bb38: 937d7c57     	sbfiz	x23, x2, #3, #32
 1c6bb3c: 8b170003     	add	x3, x0, x23
