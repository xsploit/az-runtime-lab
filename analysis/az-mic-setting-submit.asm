
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000019ebd70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebee8>:
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
 19ebe20:	f90077e1 	str	x1, [sp,#232]
 19ebe24:	fd007be0 	str	d0, [sp,#240]
 19ebe28:	72001c1f 	tst	w0, #0xff
 19ebe2c:	2f00e400 	movi	d0, #0x0
 19ebe30:	54000080 	b.eq	19ebe40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebfb8>
 19ebe34:	90010f60 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 19ebe38:	394de000 	ldrb	w0, [x0,#888]
 19ebe3c:	34002020 	cbz	w0, 19ec240 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec3b8>
 19ebe40:	f9008bff 	str	xzr, [sp,#272]
 19ebe44:	d2800102 	mov	x2, #0x8                   	// #8
 19ebe48:	d2800901 	mov	x1, #0x48                  	// #72
 19ebe4c:	fd007fe0 	str	d0, [sp,#248]
 19ebe50:	f9400703 	ldr	x3, [x24,#8]
 19ebe54:	aa0303e0 	mov	x0, x3
 19ebe58:	f9400063 	ldr	x3, [x3]
 19ebe5c:	f9400863 	ldr	x3, [x3,#16]
 19ebe60:	d63f0060 	blr	x3
 19ebe64:	aa0003f4 	mov	x20, x0
 19ebe68:	b40024a0 	cbz	x0, 19ec2fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec474>
 19ebe6c:	91008300 	add	x0, x24, #0x20
 19ebe70:	c85ffc16 	ldaxr	x22, [x0]
 19ebe74:	910006d6 	add	x22, x22, #0x1
 19ebe78:	c801fc16 	stlxr	w1, x22, [x0]
 19ebe7c:	35ffffa1 	cbnz	w1, 19ebe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ebfe8>
 19ebe80:	d0010ad3 	adrp	x19, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 19ebe84:	91130273 	add	x19, x19, #0x4c0
 19ebe88:	08dffe60 	ldarb	w0, [x19]
 19ebe8c:	d0010ad9 	adrp	x25, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 19ebe90:	36001920 	tbz	w0, #0, 19ec1b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec32c>
 19ebe94:	aa1403f3 	mov	x19, x20
 19ebe98:	b944cb20 	ldr	w0, [x25,#1224]
 19ebe9c:	b9000a80 	str	w0, [x20,#8]
 19ebea0:	aa1703e1 	mov	x1, x23
 19ebea4:	f9000a96 	str	x22, [x20,#16]
 19ebea8:	f0006240 	adrp	x0, 2636000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x731a8>
 19ebeac:	910c0000 	add	x0, x0, #0x300
 19ebeb0:	f8018660 	str	x0, [x19],#24
 19ebeb4:	d0010b16 	adrp	x22, 3b4d000 <stdout@@GLIBC_2.17+0xbf40>
 19ebeb8:	913ca2d6 	add	x22, x22, #0xf28
 19ebebc:	aa1303e0 	mov	x0, x19
 19ebec0:	94248948 	bl	230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862c8>
 19ebec4:	f94057e0 	ldr	x0, [sp,#168]
 19ebec8:	394243e3 	ldrb	w3, [sp,#144]
 19ebecc:	b940a3e1 	ldr	w1, [sp,#160]
 19ebed0:	f9404fe2 	ldr	x2, [sp,#152]
 19ebed4:	39002263 	strb	w3, [x19,#8]
 19ebed8:	f9000a62 	str	x2, [x19,#16]
 19ebedc:	b9001a61 	str	w1, [x19,#24]
 19ebee0:	f9001260 	str	x0, [x19,#32]
 19ebee4:	08dffec0 	ldarb	w0, [x22]
 19ebee8:	36001480 	tbz	w0, #0, 19ec178 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec2f0>
 19ebeec:	d0010b13 	adrp	x19, 3b4d000 <stdout@@GLIBC_2.17+0xbf40>
 19ebef0:	913cc273 	add	x19, x19, #0xf30
 19ebef4:	885ffe60 	ldaxr	w0, [x19]
 19ebef8:	11000400 	add	w0, w0, #0x1
 19ebefc:	8801fe60 	stlxr	w1, w0, [x19]
 19ebf00:	35ffffa1 	cbnz	w1, 19ebef4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec06c>
 19ebf04:	9103a3e0 	add	x0, sp, #0xe8
 19ebf08:	97b35b9c 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 19ebf0c:	aa1403e1 	mov	x1, x20
 19ebf10:	aa1803e0 	mov	x0, x24
 19ebf14:	d63f02a0 	blr	x21
 19ebf18:	b4000360 	cbz	x0, 19ebf84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec0fc>
 19ebf1c:	f9400f00 	ldr	x0, [x24,#24]
 19ebf20:	b4000320 	cbz	x0, 19ebf84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec0fc>
 19ebf24:	9420d47f 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 19ebf28:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 19ebf2c:	90005f41 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 19ebf30:	91196021 	add	x1, x1, #0x658
 19ebf34:	f9005be1 	str	x1, [sp,#176]
 19ebf38:	fd005fe0 	str	d0, [sp,#184]
 19ebf3c:	72001c1f 	tst	w0, #0xff
 19ebf40:	2f00e400 	movi	d0, #0x0
 19ebf44:	54000080 	b.eq	19ebf54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec0cc>
 19ebf48:	90010f60 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 19ebf4c:	394de000 	ldrb	w0, [x0,#888]
 19ebf50:	34002340 	cbz	w0, 19ec3b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec530>
 19ebf54:	f9006fff 	str	xzr, [sp,#216]
 19ebf58:	fd0063e0 	str	d0, [sp,#192]
 19ebf5c:	f9400f01 	ldr	x1, [x24,#24]
 19ebf60:	aa0103e0 	mov	x0, x1
 19ebf64:	f9400021 	ldr	x1, [x1]
 19ebf68:	f9400821 	ldr	x1, [x1,#16]
 19ebf6c:	d63f0020 	blr	x1
 19ebf70:	9102c3e0 	add	x0, sp, #0xb0
 19ebf74:	97b35b81 	bl	6c2d78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x321e8>
 19ebf78:	14000003 	b	19ebf84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec0fc>
 19ebf7c:	aa1703e0 	mov	x0, x23
 19ebf80:	97bac63e 	bl	89d878 <_ZNSt5mutex4lockEv@@Base+0x695c8>
 19ebf84:	aa1703e0 	mov	x0, x23
 19ebf88:	94244202 	bl	22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x174678>
 19ebf8c:	a9425bf5 	ldp	x21, x22, [sp,#32]
 19ebf90:	a94363f7 	ldp	x23, x24, [sp,#48]
 19ebf94:	a94153f3 	ldp	x19, x20, [sp,#16]
 19ebf98:	a9446bf9 	ldp	x25, x26, [sp,#64]
 19ebf9c:	a8d27bfd 	ldp	x29, x30, [sp],#288
 19ebfa0:	d65f03c0 	ret
 19ebfa4:	d63f0060 	blr	x3
 19ebfa8:	72001c1f 	tst	w0, #0xff
 19ebfac:	54000e21 	b.ne	19ec170 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec2e8>
 19ebfb0:	f9400a78 	ldr	x24, [x19,#16]
 19ebfb4:	910223f7 	add	x23, sp, #0x88
 19ebfb8:	f9400714 	ldr	x20, [x24,#8]
 19ebfbc:	aa1703e0 	mov	x0, x23
 19ebfc0:	91008261 	add	x1, x19, #0x20
 19ebfc4:	94248907 	bl	230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862c8>
 19ebfc8:	b9402a62 	ldr	w2, [x19,#40]
 19ebfcc:	52800020 	mov	w0, #0x1                   	// #1
 19ebfd0:	f9400281 	ldr	x1, [x20]
 19ebfd4:	390243e0 	strb	w0, [sp,#144]
 19ebfd8:	aa1403e0 	mov	x0, x20
 19ebfdc:	f9401421 	ldr	x1, [x1,#40]
 19ebfe0:	f9004ff8 	str	x24, [sp,#152]
 19ebfe4:	b900a3e2 	str	w2, [sp,#160]
 19ebfe8:	f90057f6 	str	x22, [sp,#168]
 19ebfec:	d63f0020 	blr	x1
 19ebff0:	72001c1f 	tst	w0, #0xff
 19ebff4:	54000b80 	b.eq	19ec164 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec2dc>
 19ebff8:	f9400280 	ldr	x0, [x20]
 19ebffc:	f9401816 	ldr	x22, [x0,#48]
 19ec000:	9420d448 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 19ec004:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 19ec008:	f0005f21 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 19ec00c:	9118e021 	add	x1, x1, #0x638
 19ec010:	f90077e1 	str	x1, [sp,#232]
 19ec014:	fd007be0 	str	d0, [sp,#240]
 19ec018:	72001c1f 	tst	w0, #0xff
 19ec01c:	2f00e400 	movi	d0, #0x0
 19ec020:	54000080 	b.eq	19ec030 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec1a8>
 19ec024:	f0010f40 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 19ec028:	394de000 	ldrb	w0, [x0,#888]
 19ec02c:	34001060 	cbz	w0, 19ec238 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec3b0>
 19ec030:	f9008bff 	str	xzr, [sp,#272]
 19ec034:	d2800102 	mov	x2, #0x8                   	// #8
 19ec038:	d2800901 	mov	x1, #0x48                  	// #72
 19ec03c:	fd007fe0 	str	d0, [sp,#248]
 19ec040:	f9400683 	ldr	x3, [x20,#8]
 19ec044:	aa0303e0 	mov	x0, x3
 19ec048:	f9400063 	ldr	x3, [x3]
 19ec04c:	f9400863 	ldr	x3, [x3,#16]
 19ec050:	d63f0060 	blr	x3
 19ec054:	aa0003f5 	mov	x21, x0
 19ec058:	b4000f80 	cbz	x0, 19ec248 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec3c0>
 19ec05c:	91008280 	add	x0, x20, #0x20
 19ec060:	c85ffc18 	ldaxr	x24, [x0]
 19ec064:	91000718 	add	x24, x24, #0x1
 19ec068:	c801fc18 	stlxr	w1, x24, [x0]
 19ec06c:	35ffffa1 	cbnz	w1, 19ec060 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec1d8>
 19ec070:	b0010ad3 	adrp	x19, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 19ec074:	91130273 	add	x19, x19, #0x4c0
 19ec078:	08dffe60 	ldarb	w0, [x19]
 19ec07c:	b0010ad9 	adrp	x25, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 19ec080:	36000ca0 	tbz	w0, #0, 19ec214 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1ec38c>
 19ec084:	aa1503f3 	mov	x19, x21
 19ec088:	b944cb20 	ldr	w0, [x25,#1224]
 19ec08c:	b9000aa0 	str	w0, [x21,#8]
