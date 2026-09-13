
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000001a03a70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x203be8>:
 1a03a70:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 1a03a74:	f0010c02 	adrp	x2, 3b86000 <stdout@@GLIBC_2.17+0x44f40>
 1a03a78:	910003fd 	mov	x29, sp
 1a03a7c:	f9431842 	ldr	x2, [x2,#1584]
 1a03a80:	f9400021 	ldr	x1, [x1]
 1a03a84:	eb01005f 	cmp	x2, x1
 1a03a88:	540000e0 	b.eq	1a03aa4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x203c1c>
 1a03a8c:	f0010c02 	adrp	x2, 3b86000 <stdout@@GLIBC_2.17+0x44f40>
 1a03a90:	f9431c42 	ldr	x2, [x2,#1592]
 1a03a94:	eb02003f 	cmp	x1, x2
 1a03a98:	54000160 	b.eq	1a03ac4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x203c3c>
 1a03a9c:	a8c27bfd 	ldp	x29, x30, [sp],#32
 1a03aa0:	d65f03c0 	ret
 1a03aa4:	f9401400 	ldr	x0, [x0,#40]
 1a03aa8:	52800023 	mov	w3, #0x1                   	// #1
 1a03aac:	910073e1 	add	x1, sp, #0x1c
 1a03ab0:	d2800002 	mov	x2, #0x0                   	// #0
 1a03ab4:	b9001fe3 	str	w3, [sp,#28]
 1a03ab8:	97c3ae64 	bl	aef448 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1e4830>
 1a03abc:	a8c27bfd 	ldp	x29, x30, [sp],#32
 1a03ac0:	d65f03c0 	ret
 1a03ac4:	f9401400 	ldr	x0, [x0,#40]
 1a03ac8:	910073e1 	add	x1, sp, #0x1c
 1a03acc:	d2800002 	mov	x2, #0x0                   	// #0
 1a03ad0:	b9001fff 	str	wzr, [sp,#28]
 1a03ad4:	97c3ae5d 	bl	aef448 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1e4830>
 1a03ad8:	a8c27bfd 	ldp	x29, x30, [sp],#32
 1a03adc:	d65f03c0 	ret
 1a03ae0:	d65f03c0 	ret
 1a03ae4:	d503201f 	nop
 1a03ae8:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 1a03aec:	910003fd 	mov	x29, sp
 1a03af0:	9100a3e0 	add	x0, sp, #0x28
 1a03af4:	f9000bf3 	str	x19, [sp,#16]
 1a03af8:	aa0103f3 	mov	x19, x1
 1a03afc:	90010ea1 	adrp	x1, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 1a03b00:	91252021 	add	x1, x1, #0x948
 1a03b04:	94268543 	bl	23a5010 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2fbf0>
 1a03b08:	9100a3e1 	add	x1, sp, #0x28
 1a03b0c:	aa1303e0 	mov	x0, x19
 1a03b10:	9426af30 	bl	23af7d0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x3a3b0>
 1a03b14:	9100a3e0 	add	x0, sp, #0x28
 1a03b18:	942670f6 	bl	239fef0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2aad0>
 1a03b1c:	f9400bf3 	ldr	x19, [sp,#16]
 1a03b20:	a8c37bfd 	ldp	x29, x30, [sp],#48
 1a03b24:	d65f03c0 	ret
 1a03b28:	aa0003f3 	mov	x19, x0
 1a03b2c:	9100a3e0 	add	x0, sp, #0x28
 1a03b30:	942670f0 	bl	239fef0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2aad0>
 1a03b34:	aa1303e0 	mov	x0, x19
 1a03b38:	97a88476 	bl	424d10 <_Unwind_Resume@plt>
 1a03b3c:	d503201f 	nop
 1a03b40:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
 1a03b44:	910003fd 	mov	x29, sp
 1a03b48:	a90153f3 	stp	x19, x20, [sp,#16]
 1a03b4c:	aa0003f3 	mov	x19, x0
 1a03b50:	f0007fe0 	adrp	x0, 2a02000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x43f1a8>
 1a03b54:	a9025bf5 	stp	x21, x22, [sp,#32]
 1a03b58:	9134c000 	add	x0, x0, #0xd30
 1a03b5c:	f9406674 	ldr	x20, [x19,#200]
