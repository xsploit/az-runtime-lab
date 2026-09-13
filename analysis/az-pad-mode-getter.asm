
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000001fa7a28 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x7a7ba0>:
 1fa7a28:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
 1fa7a2c:	910003fd 	mov	x29, sp
 1fa7a30:	a90153f3 	stp	x19, x20, [sp,#16]
 1fa7a34:	aa0003f4 	mov	x20, x0
 1fa7a38:	f9400413 	ldr	x19, [x0,#8]
 1fa7a3c:	a9025bf5 	stp	x21, x22, [sp,#32]
 1fa7a40:	9101c3f5 	add	x21, sp, #0x70
 1fa7a44:	b40006d3 	cbz	x19, 1fa7b1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x7a7c94>
 1fa7a48:	f9400261 	ldr	x1, [x19]
 1fa7a4c:	aa1303e0 	mov	x0, x19
 1fa7a50:	aa1503e8 	mov	x8, x21
 1fa7a54:	f9400c21 	ldr	x1, [x1,#24]
 1fa7a58:	d63f0020 	blr	x1
 1fa7a5c:	3941e3e0 	ldrb	w0, [sp,#120]
 1fa7a60:	35000220 	cbnz	w0, 1fa7aa4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x7a7c1c>
 1fa7a64:	b940ae80 	ldr	w0, [x20,#172]
 1fa7a68:	71001c1f 	cmp	w0, #0x7
 1fa7a6c:	540000c9 	b.ls	1fa7a84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x7a7bfc>
 1fa7a70:	52800000 	mov	w0, #0x0                   	// #0
 1fa7a74:	a94153f3 	ldp	x19, x20, [sp,#16]
 1fa7a78:	a9425bf5 	ldp	x21, x22, [sp,#32]
 1fa7a7c:	a8c87bfd 	ldp	x29, x30, [sp],#128
 1fa7a80:	d65f03c0 	ret
 1fa7a84:	b00071c1 	adrp	x1, 2de0000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x81d1a8>
 1fa7a88:	9123c021 	add	x1, x1, #0x8f0
 1fa7a8c:	91146021 	add	x1, x1, #0x518
 1fa7a90:	a94153f3 	ldp	x19, x20, [sp,#16]
 1fa7a94:	b8605820 	ldr	w0, [x1,w0,uxtw #2]
 1fa7a98:	a9425bf5 	ldp	x21, x22, [sp,#32]
 1fa7a9c:	a8c87bfd 	ldp	x29, x30, [sp],#128
 1fa7aa0:	d65f03c0 	ret
 1fa7aa4:	f9401e93 	ldr	x19, [x20,#56]
 1fa7aa8:	b4001593 	cbz	x19, 1fa7d58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x7a7ed0>
 1fa7aac:	f9400261 	ldr	x1, [x19]
 1fa7ab0:	aa1303e0 	mov	x0, x19
 1fa7ab4:	f9400821 	ldr	x1, [x1,#16]
 1fa7ab8:	d63f0020 	blr	x1
 1fa7abc:	12001c00 	and	w0, w0, #0xff
 1fa7ac0:	7100101f 	cmp	w0, #0x4
 1fa7ac4:	54fffd00 	b.eq	1fa7a64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x7a7bdc>
 1fa7ac8:	f9401e93 	ldr	x19, [x20,#56]
 1fa7acc:	b4000b93 	cbz	x19, 1fa7c3c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x7a7db4>
 1fa7ad0:	f9400261 	ldr	x1, [x19]
 1fa7ad4:	aa1303e0 	mov	x0, x19
 1fa7ad8:	f9400821 	ldr	x1, [x1,#16]
 1fa7adc:	d63f0020 	blr	x1
 1fa7ae0:	12001c00 	and	w0, w0, #0xff
 1fa7ae4:	71000c1f 	cmp	w0, #0x3
 1fa7ae8:	54fffbe0 	b.eq	1fa7a64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x7a7bdc>
 1fa7aec:	3942c280 	ldrb	w0, [x20,#176]
 1fa7af0:	71003c1f 	cmp	w0, #0xf
 1fa7af4:	54fffbe8 	b.hi	1fa7a70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x7a7be8>
 1fa7af8:	b00071c1 	adrp	x1, 2de0000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x81d1a8>
 1fa7afc:	9123c021 	add	x1, x1, #0x8f0
 1fa7b00:	91136021 	add	x1, x1, #0x4d8
 1fa7b04:	92401c00 	and	x0, x0, #0xff
 1fa7b08:	a94153f3 	ldp	x19, x20, [sp,#16]
 1fa7b0c:	b8607820 	ldr	w0, [x1,x0,lsl #2]
