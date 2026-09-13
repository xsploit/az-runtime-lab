
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000001a12b20 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x212c98>:
 1a12b20:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 1a12b24:	90010ba2 	adrp	x2, 3b86000 <stdout@@GLIBC_2.17+0x44f40>
 1a12b28:	910003fd 	mov	x29, sp
 1a12b2c:	f9437042 	ldr	x2, [x2,#1760]
 1a12b30:	f9400021 	ldr	x1, [x1]
 1a12b34:	eb01005f 	cmp	x2, x1
 1a12b38:	540002c0 	b.eq	1a12b90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x212d08>
 1a12b3c:	90010ba2 	adrp	x2, 3b86000 <stdout@@GLIBC_2.17+0x44f40>
 1a12b40:	f9437442 	ldr	x2, [x2,#1768]
 1a12b44:	eb01005f 	cmp	x2, x1
 1a12b48:	54000320 	b.eq	1a12bac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x212d24>
 1a12b4c:	90010ba2 	adrp	x2, 3b86000 <stdout@@GLIBC_2.17+0x44f40>
 1a12b50:	f9437842 	ldr	x2, [x2,#1776]
 1a12b54:	eb02003f 	cmp	x1, x2
 1a12b58:	540003a0 	b.eq	1a12bcc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x212d44>
 1a12b5c:	90010ba2 	adrp	x2, 3b86000 <stdout@@GLIBC_2.17+0x44f40>
 1a12b60:	f9437c42 	ldr	x2, [x2,#1784]
 1a12b64:	eb02003f 	cmp	x1, x2
 1a12b68:	54000060 	b.eq	1a12b74 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x212cec>
 1a12b6c:	a8c27bfd 	ldp	x29, x30, [sp],#32
 1a12b70:	d65f03c0 	ret
 1a12b74:	f9401400 	ldr	x0, [x0,#40]
 1a12b78:	52800063 	mov	w3, #0x3                   	// #3
 1a12b7c:	d2800002 	mov	x2, #0x0                   	// #0
 1a12b80:	910073e1 	add	x1, sp, #0x1c
 1a12b84:	b9001fe3 	str	w3, [sp,#28]
 1a12b88:	9400001a 	bl	1a12bf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x212d68>
 1a12b8c:	17fffff8 	b	1a12b6c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x212ce4>
 1a12b90:	f9401400 	ldr	x0, [x0,#40]
 1a12b94:	910073e1 	add	x1, sp, #0x1c
 1a12b98:	d2800002 	mov	x2, #0x0                   	// #0
 1a12b9c:	b9001fff 	str	wzr, [sp,#28]
 1a12ba0:	94000014 	bl	1a12bf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x212d68>
 1a12ba4:	a8c27bfd 	ldp	x29, x30, [sp],#32
 1a12ba8:	d65f03c0 	ret
 1a12bac:	f9401400 	ldr	x0, [x0,#40]
 1a12bb0:	52800023 	mov	w3, #0x1                   	// #1
 1a12bb4:	910073e1 	add	x1, sp, #0x1c
 1a12bb8:	d2800002 	mov	x2, #0x0                   	// #0
 1a12bbc:	b9001fe3 	str	w3, [sp,#28]
 1a12bc0:	9400000c 	bl	1a12bf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x212d68>
 1a12bc4:	a8c27bfd 	ldp	x29, x30, [sp],#32
 1a12bc8:	d65f03c0 	ret
 1a12bcc:	f9401400 	ldr	x0, [x0,#40]
 1a12bd0:	52800043 	mov	w3, #0x2                   	// #2
 1a12bd4:	910073e1 	add	x1, sp, #0x1c
 1a12bd8:	d2800002 	mov	x2, #0x0                   	// #0
 1a12bdc:	b9001fe3 	str	w3, [sp,#28]
 1a12be0:	94000004 	bl	1a12bf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x212d68>
 1a12be4:	a8c27bfd 	ldp	x29, x30, [sp],#32
 1a12be8:	d65f03c0 	ret
 1a12bec:	00000000 	.inst	0x00000000 ; undefined
 1a12bf0:	a9ae7bfd 	stp	x29, x30, [sp,#-288]!
 1a12bf4:	910003fd 	mov	x29, sp
 1a12bf8:	a90153f3 	stp	x19, x20, [sp,#16]
 1a12bfc:	a9046bf9 	stp	x25, x26, [sp,#64]
 1a12c00:	f9400814 	ldr	x20, [x0,#16]
 1a12c04:	b4001094 	cbz	x20, 1a12e14 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x212f8c>
 1a12c08:	a9025bf5 	stp	x21, x22, [sp,#32]
 1a12c0c:	aa0203f6 	mov	x22, x2
