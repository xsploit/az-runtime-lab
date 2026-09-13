
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002070700 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x870878>:
 2070700:	a90153f3 	stp	x19, x20, [sp,#16]
 2070704:	91036001 	add	x1, x0, #0xd8
 2070708:	08dffc21 	ldarb	w1, [x1]
 207070c:	72001c3f 	tst	w1, #0xff
 2070710:	54000561 	b.ne	20707bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x870934>
 2070714:	f9404413 	ldr	x19, [x0,#136]
 2070718:	aa0003f4 	mov	x20, x0
 207071c:	b40005b3 	cbz	x19, 20707d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x870948>
 2070720:	f9400262 	ldr	x2, [x19]
 2070724:	aa1303e0 	mov	x0, x19
 2070728:	9100d281 	add	x1, x20, #0x34
 207072c:	f9404042 	ldr	x2, [x2,#128]
 2070730:	d63f0040 	blr	x2
 2070734:	f9002be0 	str	x0, [sp,#80]
 2070738:	f9404e93 	ldr	x19, [x20,#152]
 207073c:	b4000d53 	cbz	x19, 20708e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x870a5c>
 2070740:	f9400263 	ldr	x3, [x19]
 2070744:	aa1303e0 	mov	x0, x19
 2070748:	52800002 	mov	w2, #0x0                   	// #0
 207074c:	910143e1 	add	x1, sp, #0x50
 2070750:	f9400863 	ldr	x3, [x3,#16]
 2070754:	d63f0060 	blr	x3
 2070758:	2a0003f3 	mov	w19, w0
 207075c:	71000c1f 	cmp	w0, #0x3
 2070760:	540014c0 	b.eq	20709f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x870b70>
 2070764:	5400014d 	b.le	207078c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x870904>
 2070768:	7100101f 	cmp	w0, #0x4
 207076c:	540001e0 	b.eq	20707a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x870920>
 2070770:	7100181f 	cmp	w0, #0x6
 2070774:	528000d3 	mov	w19, #0x6                   	// #6
 2070778:	1a9fd673 	csinc	w19, w19, wzr, le
 207077c:	2a1303e0 	mov	w0, w19
 2070780:	a94153f3 	ldp	x19, x20, [sp,#16]
 2070784:	a8c87bfd 	ldp	x29, x30, [sp],#128
