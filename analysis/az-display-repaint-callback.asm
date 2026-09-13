
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1987038:      	stp	x29, x30, [sp, #-0xc0]!
 198703c:      	mov	x29, sp
 1987040:      	stp	x19, x20, [sp, #0x10]
 1987044:      	adrp	x19, 0x3b81000 <stdout+0x3ff40>
 1987048:      	add	x19, x19, #0xd80
 198704c:      	mov	x20, x0
 1987050:      	add	x0, x19, #0x400
 1987054:      	stp	x21, x22, [sp, #0x20]
 1987058:      	stp	x23, x24, [sp, #0x30]
 198705c:      	stp	x25, x26, [sp, #0x40]
 1987060:      	ldarb	w1, [x0]
 1987064:      	tbnz	w1, #0x0, 0x1987070 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1871e8>
 1987068:      	bl	0x426260 <__cxa_guard_acquire@plt>
 198706c:      	cbnz	w0, 0x1987858 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1879d0>
 1987070:      	ldrb	w0, [x19, #0x408]
 1987074:      	cbz	w0, 0x19870cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187244>
 1987078:      	ldr	x21, [x19, #0x410]
 198707c:      	cbz	x21, 0x19878b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187a2c>
 1987080:      	bl	0x2221520 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x99408>
 1987084:      	add	x0, x0, #0x7d0
 1987088:      	add	x1, x21, #0x138
 198708c:      	stlr	x0, [x1]
 1987090:      	ldr	w1, [x21, #0x128]
 1987094:      	add	x0, x21, #0x128
 1987098:      	eor	w1, w1, w1, asr #31
 198709c:      	cmp	w1, #0x3
 19870a0:      	b.gt	0x19873e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187560>
 19870a4:      	adrp	x2, 0x29ca000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4071a8>
 19870a8:      	add	x2, x2, #0x198
 19870ac:      	add	x1, sp, #0x60
 19870b0:      	str	wzr, [sp, #0x60]
 19870b4:      	str	x2, [sp, #0x68]
 19870b8:      	bl	0x1986b30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x186ca8>
 19870bc:      	ldr	w0, [sp, #0x60]
 19870c0:      	eor	w0, w0, w0, asr #31
 19870c4:      	cmp	w0, #0x3
 19870c8:      	b.gt	0x19873e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187560>
 19870cc:      	ldr	x0, [x20, #0x70]
 19870d0:      	bl	0x24826d0 <_ZNSt8functionIFvvEEC2ERKS1_+0x10d2b0>
 19870d4:      	tst	w0, #0xff
 19870d8:      	b.ne	0x1987458 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1875d0>
 19870dc:      	ldrb	w0, [x19, #0x408]
 19870e0:      	cbz	w0, 0x1987138 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1872b0>
 19870e4:      	ldr	x21, [x19, #0x410]
 19870e8:      	cbz	x21, 0x1987960 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187ad8>
 19870ec:      	bl	0x2221520 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x99408>
 19870f0:      	add	x0, x0, #0x7d0
 19870f4:      	add	x1, x21, #0x138
 19870f8:      	stlr	x0, [x1]
 19870fc:      	ldr	w1, [x21, #0x128]
 1987100:      	add	x0, x21, #0x128
 1987104:      	eor	w1, w1, w1, asr #31
 1987108:      	cmp	w1, #0x3
 198710c:      	b.gt	0x19873e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187560>
 1987110:      	adrp	x2, 0x29ca000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4071a8>
 1987114:      	add	x2, x2, #0x258
