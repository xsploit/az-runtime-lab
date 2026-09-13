
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021329e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932b58>:
 21329e0:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
 21329e4:	910003fd 	mov	x29, sp
 21329e8:	a9025bf5 	stp	x21, x22, [sp,#32]
 21329ec:	aa0003f5 	mov	x21, x0
 21329f0:	91004016 	add	x22, x0, #0x10
 21329f4:	aa1603e0 	mov	x0, x22
 21329f8:	a90153f3 	stp	x19, x20, [sp,#16]
 21329fc:	a90363f7 	stp	x23, x24, [sp,#48]
 2132a00:	f9002fe1 	str	x1, [sp,#88]
 2132a04:	9407e5b7 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 2132a08:	a9445eb3 	ldp	x19, x23, [x21,#64]
 2132a0c:	52800060 	mov	w0, #0x3                   	// #3
 2132a10:	b9007be0 	str	w0, [sp,#120]
 2132a14:	b201f3e2 	mov	x2, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
 2132a18:	f2955562 	movk	x2, #0xaaab
 2132a1c:	f9402fe1 	ldr	x1, [sp,#88]
 2132a20:	f90043e1 	str	x1, [sp,#128]
 2132a24:	cb1302e0 	sub	x0, x23, x19
 2132a28:	9343fc00 	asr	x0, x0, #3
 2132a2c:	9b027c00 	mul	x0, x0, x2
 2132a30:	9342fc14 	asr	x20, x0, #2
 2132a34:	f100029f 	cmp	x20, #0x0
 2132a38:	54001c6d 	b.le	2132dc4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932f3c>
 2132a3c:	8b140694 	add	x20, x20, x20, lsl #1
 2132a40:	f90023f9 	str	x25, [sp,#64]
 2132a44:	8b141674 	add	x20, x19, x20, lsl #5
 2132a48:	14000075 	b	2132c1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932d94>
 2132a4c:	9101a3e0 	add	x0, sp, #0x68
 2132a50:	91002261 	add	x1, x19, #0x8
 2132a54:	97fff711 	bl	2130698 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930810>
 2132a58:	a94683f8 	ldp	x24, x0, [sp,#104]
 2132a5c:	b4000060 	cbz	x0, 2132a68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932be0>
 2132a60:	9795061e 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 2132a64:	d503201f 	nop
 2132a68:	b9407be0 	ldr	w0, [sp,#120]
 2132a6c:	4a807c00 	eor	w0, w0, w0, asr #31
 2132a70:	7100041f 	cmp	w0, #0x1
 2132a74:	54000f20 	b.eq	2132c58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932dd0>
 2132a78:	540018ed 	b.le	2132d94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932f0c>
 2132a7c:	7100081f 	cmp	w0, #0x2
 2132a80:	54001841 	b.ne	2132d88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932f00>
 2132a84:	9101a3e0 	add	x0, sp, #0x68
 2132a88:	910203e1 	add	x1, sp, #0x80
 2132a8c:	97fff703 	bl	2130698 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930810>
 2132a90:	a94683f9 	ldp	x25, x0, [sp,#104]
 2132a94:	b4000060 	cbz	x0, 2132aa0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932c18>
 2132a98:	97950610 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 2132a9c:	d503201f 	nop
