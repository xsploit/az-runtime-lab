
runtime-lab/cdj3000x/rootfs/home/root/pdj/EP145:     file format elf64-littleaarch64


Disassembly of section .text:

000000000225ae40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x927a70>:
 225ae40:	a9b47bfd 	stp	x29, x30, [sp,#-192]!
 225ae44:	d0006ee2 	adrp	x2, 3038000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x946410>
 225ae48:	910003fd 	mov	x29, sp
 225ae4c:	a90153f3 	stp	x19, x20, [sp,#16]
 225ae50:	aa0003f4 	mov	x20, x0
 225ae54:	a90573fb 	stp	x27, x28, [sp,#80]
 225ae58:	9107201b 	add	x27, x0, #0x1c8
 225ae5c:	f9472840 	ldr	x0, [x2,#3664]
 225ae60:	a9025bf5 	stp	x21, x22, [sp,#32]
 225ae64:	aa0103f5 	mov	x21, x1
 225ae68:	a90363f7 	stp	x23, x24, [sp,#48]
 225ae6c:	a9046bf9 	stp	x25, x26, [sp,#64]
 225ae70:	f90033e0 	str	x0, [sp,#96]
 225ae74:	b4000080 	cbz	x0, 225ae84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x927ab4>
 225ae78:	aa1b03e0 	mov	x0, x27
 225ae7c:	978732c1 	bl	427980 <pthread_mutex_lock@plt>
 225ae80:	35001e60 	cbnz	w0, 225b24c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x927e7c>
 225ae84:	b4000555 	cbz	x21, 225af2c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x927b5c>
 225ae88:	aa1503e1 	mov	x1, x21
 225ae8c:	aa1403e0 	mov	x0, x20
 225ae90:	78408422 	ldrh	w2, [x1],#8
 225ae94:	79037282 	strh	w2, [x20,#440]
 225ae98:	97fff2c4 	bl	22579a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9245d8>
 225ae9c:	aa1503e1 	mov	x1, x21
 225aea0:	aa1403e0 	mov	x0, x20
 225aea4:	97ffefbb 	bl	2256d90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9239c0>
 225aea8:	aa1503e1 	mov	x1, x21
 225aeac:	aa1403e0 	mov	x0, x20
 225aeb0:	97fff084 	bl	22570c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x923cf0>
 225aeb4:	f940d696 	ldr	x22, [x20,#424]
 225aeb8:	390283ff 	strb	wzr, [sp,#160]
 225aebc:	79403aa0 	ldrh	w0, [x21,#28]
 225aec0:	b900abe0 	str	w0, [sp,#168]
 225aec4:	f9405ec1 	ldr	x1, [x22,#184]
 225aec8:	b4001ae1 	cbz	x1, 225b224 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x927e54>
 225aecc:	f94002c3 	ldr	x3, [x22]
 225aed0:	910283e2 	add	x2, sp, #0xa0
 225aed4:	aa1603e0 	mov	x0, x22
 225aed8:	f9401063 	ldr	x3, [x3,#32]
 225aedc:	d63f0060 	blr	x3
 225aee0:	b940b2c0 	ldr	w0, [x22,#176]
 225aee4:	7100001f 	cmp	w0, #0x0
 225aee8:	54000e6c 	b.gt	225b0b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x927ce4>
 225aeec:	f940da94 	ldr	x20, [x20,#432]
 225aef0:	52800023 	mov	w3, #0x1                   	// #1
 225aef4:	794032a2 	ldrh	w2, [x21,#24]
 225aef8:	794036a0 	ldrh	w0, [x21,#26]
 225aefc:	f9405e81 	ldr	x1, [x20,#184]
 225af00:	3902c3e3 	strb	w3, [sp,#176]
 225af04:	291683e2 	stp	w2, w0, [sp,#180]
 225af08:	b4001861 	cbz	x1, 225b214 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x927e44>
 225af0c:	f9400283 	ldr	x3, [x20]
 225af10:	9102c3e2 	add	x2, sp, #0xb0
 225af14:	aa1403e0 	mov	x0, x20
 225af18:	f9401063 	ldr	x3, [x3,#32]
 225af1c:	d63f0060 	blr	x3
 225af20:	b940b280 	ldr	w0, [x20,#176]
 225af24:	7100001f 	cmp	w0, #0x0
 225af28:	5400018c 	b.gt	225af58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x927b88>
 225af2c:	f94033e0 	ldr	x0, [sp,#96]
 225af30:	b4000060 	cbz	x0, 225af3c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x927b6c>
 225af34:	aa1b03e0 	mov	x0, x27
 225af38:	97873146 	bl	427450 <pthread_mutex_unlock@plt>
 225af3c:	a94153f3 	ldp	x19, x20, [sp,#16]
