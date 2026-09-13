
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000019ebcc0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebe38>:
 19ebcc0:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 19ebcc4:	f0010cc2 	adrp	x2, 3b86000 <stdout@@GLIBC_2.17+0x44f40>
 19ebcc8:	910003fd 	mov	x29, sp
 19ebccc:	f9422c42 	ldr	x2, [x2,#1112]
 19ebcd0:	f9400021 	ldr	x1, [x1]
 19ebcd4:	eb01005f 	cmp	x2, x1
 19ebcd8:	54000160 	b.eq	19ebd04 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebe7c>
 19ebcdc:	f0010cc2 	adrp	x2, 3b86000 <stdout@@GLIBC_2.17+0x44f40>
 19ebce0:	f9423042 	ldr	x2, [x2,#1120]
 19ebce4:	eb01005f 	cmp	x2, x1
 19ebce8:	540001c0 	b.eq	19ebd20 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebe98>
 19ebcec:	f0010cc2 	adrp	x2, 3b86000 <stdout@@GLIBC_2.17+0x44f40>
 19ebcf0:	f9423442 	ldr	x2, [x2,#1128]
 19ebcf4:	eb02003f 	cmp	x1, x2
 19ebcf8:	54000240 	b.eq	19ebd40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebeb8>
 19ebcfc:	a8c27bfd 	ldp	x29, x30, [sp],#32
 19ebd00:	d65f03c0 	ret
 19ebd04:	f9401400 	ldr	x0, [x0,#40]
 19ebd08:	910073e1 	add	x1, sp, #0x1c
 19ebd0c:	d2800002 	mov	x2, #0x0                   	// #0
 19ebd10:	b9001fff 	str	wzr, [sp,#28]
 19ebd14:	94000017 	bl	19ebd70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebee8>
 19ebd18:	a8c27bfd 	ldp	x29, x30, [sp],#32
 19ebd1c:	d65f03c0 	ret
 19ebd20:	f9401400 	ldr	x0, [x0,#40]
 19ebd24:	52800023 	mov	w3, #0x1                   	// #1
 19ebd28:	910073e1 	add	x1, sp, #0x1c
 19ebd2c:	d2800002 	mov	x2, #0x0                   	// #0
 19ebd30:	b9001fe3 	str	w3, [sp,#28]
 19ebd34:	9400000f 	bl	19ebd70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebee8>
 19ebd38:	a8c27bfd 	ldp	x29, x30, [sp],#32
 19ebd3c:	d65f03c0 	ret
 19ebd40:	f9401400 	ldr	x0, [x0,#40]
 19ebd44:	52800043 	mov	w3, #0x2                   	// #2
 19ebd48:	910073e1 	add	x1, sp, #0x1c
 19ebd4c:	d2800002 	mov	x2, #0x0                   	// #0
 19ebd50:	b9001fe3 	str	w3, [sp,#28]
 19ebd54:	94000007 	bl	19ebd70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebee8>
 19ebd58:	a8c27bfd 	ldp	x29, x30, [sp],#32
 19ebd5c:	d65f03c0 	ret
 19ebd60:	d65f03c0 	ret
 19ebd64:	00000000 	.inst	0x00000000 ; undefined
 19ebd68:	d2800101 	mov	x1, #0x8                   	// #8
 19ebd6c:	17a8ea3d 	b	426660 <_ZdlPvm@plt>
 19ebd70:	a9ae7bfd 	stp	x29, x30, [sp,#-288]!
 19ebd74:	910003fd 	mov	x29, sp
 19ebd78:	a90153f3 	stp	x19, x20, [sp,#16]
 19ebd7c:	a9046bf9 	stp	x25, x26, [sp,#64]
 19ebd80:	f9400814 	ldr	x20, [x0,#16]
 19ebd84:	b4001094 	cbz	x20, 19ebf94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec10c>
 19ebd88:	a9025bf5 	stp	x21, x22, [sp,#32]
 19ebd8c:	aa0203f6 	mov	x22, x2
 19ebd90:	b0ff7322 	adrp	x2, 850000 <_ZNSt5mutex4lockEv@@Base+0x1bd50>
 19ebd94:	a90363f7 	stp	x23, x24, [sp,#48]
 19ebd98:	9138e042 	add	x2, x2, #0xe38
 19ebd9c:	aa0003f3 	mov	x19, x0
 19ebda0:	f9400003 	ldr	x3, [x0]
 19ebda4:	aa0103f5 	mov	x21, x1
 19ebda8:	f9400c63 	ldr	x3, [x3,#24]
 19ebdac:	eb02007f 	cmp	x3, x2
 19ebdb0:	54000fa1 	b.ne	19ebfa4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec11c>
 19ebdb4:	b9400020 	ldr	w0, [x1]
 19ebdb8:	aa1403f8 	mov	x24, x20
 19ebdbc:	7100081f 	cmp	w0, #0x2
 19ebdc0:	54000fa8 	b.hi	19ebfb4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec12c>
 19ebdc4:	f9400698 	ldr	x24, [x20,#8]
 19ebdc8:	910223f7 	add	x23, sp, #0x88
 19ebdcc:	91008261 	add	x1, x19, #0x20
 19ebdd0:	aa1703e0 	mov	x0, x23
 19ebdd4:	94248983 	bl	230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862c8>
 19ebdd8:	f9400301 	ldr	x1, [x24]
 19ebddc:	52800020 	mov	w0, #0x1                   	// #1
 19ebde0:	b94002a2 	ldr	w2, [x21]
 19ebde4:	390243e0 	strb	w0, [sp,#144]
 19ebde8:	aa1803e0 	mov	x0, x24
 19ebdec:	f9401421 	ldr	x1, [x1,#40]
 19ebdf0:	f9004ff4 	str	x20, [sp,#152]
 19ebdf4:	b900a3e2 	str	w2, [sp,#160]
 19ebdf8:	f90057f6 	str	x22, [sp,#168]
 19ebdfc:	d63f0020 	blr	x1
 19ebe00:	72001c1f 	tst	w0, #0xff
 19ebe04:	54000bc0 	b.eq	19ebf7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec0f4>
 19ebe08:	f9400300 	ldr	x0, [x24]
 19ebe0c:	f9401815 	ldr	x21, [x0,#48]
 19ebe10:	9420d4c4 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 19ebe14:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 19ebe18:	90005f41 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 19ebe1c:	9118e021 	add	x1, x1, #0x638
