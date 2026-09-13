
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000019f3b10 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1f3c88>:
 19f3b10:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 19f3b14:	f0010c82 	adrp	x2, 3b86000 <stdout@@GLIBC_2.17+0x44f40>
 19f3b18:	910003fd 	mov	x29, sp
 19f3b1c:	f9427442 	ldr	x2, [x2,#1256]
 19f3b20:	f9400021 	ldr	x1, [x1]
 19f3b24:	eb01005f 	cmp	x2, x1
 19f3b28:	54000160 	b.eq	19f3b54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1f3ccc>
 19f3b2c:	f0010c82 	adrp	x2, 3b86000 <stdout@@GLIBC_2.17+0x44f40>
 19f3b30:	f9427842 	ldr	x2, [x2,#1264]
 19f3b34:	eb01005f 	cmp	x2, x1
 19f3b38:	540001c0 	b.eq	19f3b70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1f3ce8>
 19f3b3c:	f0010c82 	adrp	x2, 3b86000 <stdout@@GLIBC_2.17+0x44f40>
 19f3b40:	f9427c42 	ldr	x2, [x2,#1272]
 19f3b44:	eb02003f 	cmp	x1, x2
 19f3b48:	54000240 	b.eq	19f3b90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1f3d08>
 19f3b4c:	a8c27bfd 	ldp	x29, x30, [sp],#32
 19f3b50:	d65f03c0 	ret
 19f3b54:	f9401400 	ldr	x0, [x0,#40]
 19f3b58:	910073e1 	add	x1, sp, #0x1c
 19f3b5c:	d2800002 	mov	x2, #0x0                   	// #0
 19f3b60:	b9001fff 	str	wzr, [sp,#28]
 19f3b64:	94000125 	bl	19f3ff8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1f4170>
 19f3b68:	a8c27bfd 	ldp	x29, x30, [sp],#32
 19f3b6c:	d65f03c0 	ret
 19f3b70:	f9401400 	ldr	x0, [x0,#40]
 19f3b74:	52800043 	mov	w3, #0x2                   	// #2
 19f3b78:	910073e1 	add	x1, sp, #0x1c
 19f3b7c:	d2800002 	mov	x2, #0x0                   	// #0
 19f3b80:	b9001fe3 	str	w3, [sp,#28]
 19f3b84:	9400011d 	bl	19f3ff8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1f4170>
 19f3b88:	a8c27bfd 	ldp	x29, x30, [sp],#32
 19f3b8c:	d65f03c0 	ret
 19f3b90:	f9401400 	ldr	x0, [x0,#40]
 19f3b94:	52800023 	mov	w3, #0x1                   	// #1
 19f3b98:	910073e1 	add	x1, sp, #0x1c
 19f3b9c:	d2800002 	mov	x2, #0x0                   	// #0
 19f3ba0:	b9001fe3 	str	w3, [sp,#28]
 19f3ba4:	94000115 	bl	19f3ff8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1f4170>
 19f3ba8:	a8c27bfd 	ldp	x29, x30, [sp],#32
 19f3bac:	d65f03c0 	ret
 19f3bb0:	a9b97bfd 	stp	x29, x30, [sp,#-112]!
 19f3bb4:	910003fd 	mov	x29, sp
 19f3bb8:	a90153f3 	stp	x19, x20, [sp,#16]
 19f3bbc:	f9400013 	ldr	x19, [x0]
 19f3bc0:	a9025bf5 	stp	x21, x22, [sp,#32]
 19f3bc4:	52800035 	mov	w21, #0x1                   	// #1
 19f3bc8:	b40000d3 	cbz	x19, 19f3be0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1f3d58>
 19f3bcc:	2a1503e0 	mov	w0, w21
 19f3bd0:	a94153f3 	ldp	x19, x20, [sp,#16]
 19f3bd4:	a9425bf5 	ldp	x21, x22, [sp,#32]
 19f3bd8:	a8c77bfd 	ldp	x29, x30, [sp],#112
 19f3bdc:	d65f03c0 	ret
 19f3be0:	12001c36 	and	w22, w1, #0xff
 19f3be4:	52800015 	mov	w21, #0x0                   	// #0
 19f3be8:	f9400401 	ldr	x1, [x0,#8]
 19f3bec:	b4ffff01 	cbz	x1, 19f3bcc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1f3d44>
 19f3bf0:	aa0003f4 	mov	x20, x0
 19f3bf4:	f9001bf7 	str	x23, [sp,#48]
 19f3bf8:	d0010a77 	adrp	x23, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 19f3bfc:	9123e2f7 	add	x23, x23, #0x8f8
