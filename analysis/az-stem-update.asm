
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000001df69f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6b70>:
 1df69f8:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
 1df69fc:	910003fd 	mov	x29, sp
 1df6a00:	a90153f3 	stp	x19, x20, [sp,#16]
 1df6a04:	aa0003f3 	mov	x19, x0
 1df6a08:	f9406814 	ldr	x20, [x0,#208]
 1df6a0c:	39430680 	ldrb	w0, [x20,#193]
 1df6a10:	350002a0 	cbnz	w0, 1df6a64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6bdc>
 1df6a14:	b940ca61 	ldr	w1, [x19,#200]
 1df6a18:	71000c3f 	cmp	w1, #0x3
 1df6a1c:	5400016d 	b.le	1df6a48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6bc0>
 1df6a20:	52800121 	mov	w1, #0x9                   	// #9
 1df6a24:	f9407a60 	ldr	x0, [x19,#240]
 1df6a28:	b940c802 	ldr	w2, [x0,#200]
 1df6a2c:	6b01005f 	cmp	w2, w1
 1df6a30:	54000060 	b.eq	1df6a3c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6bb4>
 1df6a34:	b900c801 	str	w1, [x0,#200]
 1df6a38:	941a46ce 	bl	2488570 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x113150>
 1df6a3c:	a94153f3 	ldp	x19, x20, [sp,#16]
 1df6a40:	a8c87bfd 	ldp	x29, x30, [sp],#128
 1df6a44:	d65f03c0 	ret
 1df6a48:	531f7821 	lsl	w1, w1, #1
 1df6a4c:	11000421 	add	w1, w1, #0x1
 1df6a50:	7100643f 	cmp	w1, #0x19
 1df6a54:	54fffe89 	b.ls	1df6a24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6b9c>
 1df6a58:	a94153f3 	ldp	x19, x20, [sp,#16]
 1df6a5c:	a8c87bfd 	ldp	x29, x30, [sp],#128
 1df6a60:	d65f03c0 	ret
 1df6a64:	a9025bf5 	stp	x21, x22, [sp,#32]
 1df6a68:	9101c3f6 	add	x22, sp, #0x70
 1df6a6c:	f9400a95 	ldr	x21, [x20,#16]
 1df6a70:	b4000315 	cbz	x21, 1df6ad0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6c48>
 1df6a74:	f94002a1 	ldr	x1, [x21]
 1df6a78:	aa1503e0 	mov	x0, x21
 1df6a7c:	aa1603e8 	mov	x8, x22
 1df6a80:	f9400c21 	ldr	x1, [x1,#24]
 1df6a84:	d63f0020 	blr	x1
 1df6a88:	3941e3e0 	ldrb	w0, [sp,#120]
 1df6a8c:	35000060 	cbnz	w0, 1df6a98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6c10>
 1df6a90:	a9425bf5 	ldp	x21, x22, [sp,#32]
 1df6a94:	17ffffe0 	b	1df6a14 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6b8c>
 1df6a98:	f9402295 	ldr	x21, [x20,#64]
 1df6a9c:	b4000ab5 	cbz	x21, 1df6bf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6d68>
 1df6aa0:	f94002a1 	ldr	x1, [x21]
 1df6aa4:	aa1503e0 	mov	x0, x21
 1df6aa8:	f9400821 	ldr	x1, [x1,#16]
 1df6aac:	d63f0020 	blr	x1
 1df6ab0:	12001c00 	and	w0, w0, #0xff
 1df6ab4:	7100041f 	cmp	w0, #0x1
 1df6ab8:	54fffec1 	b.ne	1df6a90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6c08>
 1df6abc:	b940ca61 	ldr	w1, [x19,#200]
 1df6ac0:	a9425bf5 	ldp	x21, x22, [sp,#32]
 1df6ac4:	531f7821 	lsl	w1, w1, #1
 1df6ac8:	11002c21 	add	w1, w1, #0xb
 1df6acc:	17ffffe1 	b	1df6a50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6bc8>
 1df6ad0:	f9400e80 	ldr	x0, [x20,#24]
 1df6ad4:	b4fffd00 	cbz	x0, 1df6a74 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6bec>
 1df6ad8:	f000ea56 	adrp	x22, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 1df6adc:	9123e2d6 	add	x22, x22, #0x8f8
 1df6ae0:	a90363f7 	stp	x23, x24, [sp,#48]
 1df6ae4:	08dffec0 	ldarb	w0, [x22]
 1df6ae8:	36001720 	tbz	w0, #0, 1df6dcc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6f44>
 1df6aec:	f000ea57 	adrp	x23, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 1df6af0:	912402f7 	add	x23, x23, #0x900
 1df6af4:	b9801ae1 	ldrsw	x1, [x23,#24]
 1df6af8:	f9400e82 	ldr	x2, [x20,#24]
 1df6afc:	f94006e3 	ldr	x3, [x23,#8]
 1df6b00:	9ac10840 	udiv	x0, x2, x1
 1df6b04:	9b018800 	msub	x0, x0, x1, x2
 1df6b08:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
 1df6b0c:	b4000140 	cbz	x0, 1df6b34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6cac>
 1df6b10:	f9400001 	ldr	x1, [x0]
 1df6b14:	eb02003f 	cmp	x1, x2
 1df6b18:	540000a1 	b.ne	1df6b2c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6ca4>
 1df6b1c:	1400007c 	b	1df6d0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6e84>
 1df6b20:	f9400001 	ldr	x1, [x0]
 1df6b24:	eb01005f 	cmp	x2, x1
 1df6b28:	54000f20 	b.eq	1df6d0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6e84>
 1df6b2c:	f9400800 	ldr	x0, [x0,#16]
 1df6b30:	b5ffff80 	cbnz	x0, 1df6b20 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6c98>
 1df6b34:	910163f7 	add	x23, sp, #0x58
 1df6b38:	f0003e41 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 1df6b3c:	aa1703e0 	mov	x0, x23
