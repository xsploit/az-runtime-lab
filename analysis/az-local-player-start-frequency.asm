
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1e236d0:      	adrp	x0, 0x2da1000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7de1a8>
 1e236d4:      	add	x1, x1, #0xbd8
 1e236d8:      	add	x0, x0, #0xc00
 1e236dc:      	stp	x1, x0, [x28, #0x90]
 1e236e0:      	ldr	w1, [sp, #0x9c]
 1e236e4:      	str	x21, [x28, #0xa0]
 1e236e8:      	str	d8, [x28, #0xa8]
 1e236ec:      	cmp	w1, #0x0
 1e236f0:      	stp	xzr, xzr, [x19, #0x170]
 1e236f4:      	str	wzr, [x19, #0x180]
 1e236f8:      	b.le	0x1e23704 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x62387c>
 1e236fc:      	mov	x0, x19
 1e23700:      	bl	0x239d2e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x27ec0>
