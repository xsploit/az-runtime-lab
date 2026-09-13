
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 20eb5f0: d0ffbca0     	adrp	x0, 0x1881000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x81178>
 20eb5f4: 9135e000     	add	x0, x0, #0xd78
 20eb5f8: f9400421     	ldr	x1, [x1, #0x8]
 20eb5fc: eb00003f     	cmp	x1, x0
 20eb600: 54000fc1     	b.ne	0x20eb7f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb970>
 20eb604: aa1403e0     	mov	x0, x20
 20eb608: f9001bf7     	str	x23, [sp, #0x30]
 20eb60c: d0006a01     	adrp	x1, 0x2e2d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x86a1a8>
 20eb610: 910da021     	add	x1, x1, #0x368
 20eb614: d0006a17     	adrp	x23, 0x2e2d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x86a1a8>
 20eb618: 910a42f7     	add	x23, x23, #0x290
 20eb61c: f8070401     	str	x1, [x0], #0x70
 20eb620: d0006a15     	adrp	x21, 0x2e2d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x86a1a8>
 20eb624: f9003a97     	str	x23, [x20, #0x70]
 20eb628: 910b02b5     	add	x21, x21, #0x2c0
 20eb62c: f9000415     	str	x21, [x0, #0x8]
 20eb630: 9103c3e1     	add	x1, sp, #0xf0
 20eb634: 9102c280     	add	x0, x20, #0xb0
 20eb638: 97a215ea     	bl	0x970de0 <_ZSt20__throw_bad_weak_ptrv+0x661c8>
 20eb63c: a9025697     	stp	x23, x21, [x20, #0x20]
 20eb640: 9103c3e1     	add	x1, sp, #0xf0
 20eb644: 91018280     	add	x0, x20, #0x60
 20eb648: 97a215e6     	bl	0x970de0 <_ZSt20__throw_bad_weak_ptrv+0x661c8>
 20eb64c: a940de95     	ldp	x21, x23, [x20, #0x8]
 20eb650: eb1702bf     	cmp	x21, x23
 20eb654: 54000140     	b.eq	0x20eb67c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb7f4>
 20eb658: f94002a0     	ldr	x0, [x21]
 20eb65c: b4000bc0     	cbz	x0, 0x20eb7d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb94c>
 20eb660: f9400001     	ldr	x1, [x0]
 20eb664: 910022b5     	add	x21, x21, #0x8
 20eb668: f9400421     	ldr	x1, [x1, #0x8]
 20eb66c: d63f0020     	blr	x1
 20eb670: eb1502ff     	cmp	x23, x21
 20eb674: 54ffff21     	b.ne	0x20eb658 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb7d0>
 20eb678: f9400697     	ldr	x23, [x20, #0x8]
 20eb67c: b4000077     	cbz	x23, 0x20eb688 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb800>
 20eb680: aa1703e0     	mov	x0, x23
 20eb684: 978ce5f3     	bl	0x424e50 <_ZdlPv@plt>
 20eb688: aa1403e0     	mov	x0, x20
 20eb68c: d2801801     	mov	x1, #0xc0               // =192
 20eb690: 978cebf4     	bl	0x426660 <_ZdlPvm@plt>
 20eb694: f9401bf7     	ldr	x23, [sp, #0x30]
 20eb698: d2803500     	mov	x0, #0x1a8              // =424
 20eb69c: 978ce5a9     	bl	0x424d40 <_Znwm@plt>
 20eb6a0: aa0003f5     	mov	x21, x0
 20eb6a4: 910143e1     	add	x1, sp, #0x50
 20eb6a8: 97fc967e     	bl	0x20110a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x811218>
 20eb6ac: f9400a74     	ldr	x20, [x19, #0x10]
 20eb6b0: f9000a75     	str	x21, [x19, #0x10]
 20eb6b4: b4000194     	cbz	x20, 0x20eb6e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb85c>
 20eb6b8: f9400281     	ldr	x1, [x20]
 20eb6bc: d0ffbf00     	adrp	x0, 0x18cd000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0xcd178>
 20eb6c0: 913c4000     	add	x0, x0, #0xf10
 20eb6c4: f9400421     	ldr	x1, [x1, #0x8]
 20eb6c8: eb00003f     	cmp	x1, x0
 20eb6cc: aa1403e0     	mov	x0, x20
