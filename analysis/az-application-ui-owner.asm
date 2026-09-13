
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 18d8d18: a9b97bfd     	stp	x29, x30, [sp, #-0x70]!
 18d8d1c: 910003fd     	mov	x29, sp
 18d8d20: a90153f3     	stp	x19, x20, [sp, #0x10]
 18d8d24: aa0003f4     	mov	x20, x0
 18d8d28: d2800500     	mov	x0, #0x28               // =40
 18d8d2c: a9025bf5     	stp	x21, x22, [sp, #0x20]
 18d8d30: 97ad3004     	bl	0x424d40 <_Znwm@plt>
 18d8d34: aa0003f5     	mov	x21, x0
 18d8d38: 9420499e     	bl	0x20eb3b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb528>
 18d8d3c: f9408a93     	ldr	x19, [x20, #0x110]
 18d8d40: a9046bf9     	stp	x25, x26, [sp, #0x40]
 18d8d44: a90573fb     	stp	x27, x28, [sp, #0x50]
 18d8d48: f9008a95     	str	x21, [x20, #0x110]
 18d8d4c: b40001b3     	cbz	x19, 0x18d8d80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0xd8ef8>
 18d8d50: f9400261     	ldr	x1, [x19]
 18d8d54: b0000000     	adrp	x0, 0x18d9000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0xd9178>
 18d8d58: 91054000     	add	x0, x0, #0x150
 18d8d5c: f9400421     	ldr	x1, [x1, #0x8]
 18d8d60: eb00003f     	cmp	x1, x0
 18d8d64: aa1303e0     	mov	x0, x19
 18d8d68: 54001981     	b.ne	0x18d9098 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0xd9210>
 18d8d6c: 97fffe89     	bl	0x18d8790 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0xd8908>
 18d8d70: aa1303e0     	mov	x0, x19
 18d8d74: d2800501     	mov	x1, #0x28               // =40
 18d8d78: 97ad363a     	bl	0x426660 <_ZdlPvm@plt>
 18d8d7c: f9408a95     	ldr	x21, [x20, #0x110]
 18d8d80: 52800021     	mov	w1, #0x1                // =1
 18d8d84: f9400aa0     	ldr	x0, [x21, #0x10]
