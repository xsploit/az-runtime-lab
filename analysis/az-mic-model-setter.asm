
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000001d2d6e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x52d860>:
 1d2d6e8:	b9017001 	str	w1, [x0,#368]
 1d2d6ec:	d65f03c0 	ret
 1d2d6f0:	91044000 	add	x0, x0, #0x110
 1d2d6f4:	b861d800 	ldr	w0, [x0,w1,sxtw #2]
 1d2d6f8:	d65f03c0 	ret
 1d2d6fc:	d503201f 	nop
 1d2d700:	b9417000 	ldr	w0, [x0,#368]
 1d2d704:	d65f03c0 	ret
 1d2d708:	7100403f 	cmp	w1, #0x10
 1d2d70c:	54000160 	b.eq	1d2d738 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x52d8b0>
 1d2d710:	540000cc 	b.gt	1d2d728 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x52d8a0>
 1d2d714:	52800000 	mov	w0, #0x0                   	// #0
 1d2d718:	34000061 	cbz	w1, 1d2d724 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x52d89c>
 1d2d71c:	7100343f 	cmp	w1, #0xd
 1d2d720:	1a9f07e0 	cset	w0, ne
 1d2d724:	d65f03c0 	ret
 1d2d728:	51004821 	sub	w1, w1, #0x12
 1d2d72c:	7100043f 	cmp	w1, #0x1
 1d2d730:	1a9f97e0 	cset	w0, hi
 1d2d734:	d65f03c0 	ret
 1d2d738:	52800000 	mov	w0, #0x0                   	// #0
 1d2d73c:	d65f03c0 	ret
 1d2d740:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 1d2d744:	b0007c42 	adrp	x2, 2cb6000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x6f31a8>
 1d2d748:	d0007c41 	adrp	x1, 2cb7000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x6f41a8>
 1d2d74c:	910003fd 	mov	x29, sp
 1d2d750:	f9000bf3 	str	x19, [sp,#16]
 1d2d754:	aa0003f3 	mov	x19, x0
 1d2d758:	913c4042 	add	x2, x2, #0xf10
 1d2d75c:	9101c021 	add	x1, x1, #0x70
 1d2d760:	d0007c40 	adrp	x0, 2cb7000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x6f41a8>
 1d2d764:	9100e000 	add	x0, x0, #0x38
 1d2d768:	a9000262 	stp	x2, x0, [x19]
 1d2d76c:	9105e260 	add	x0, x19, #0x178
 1d2d770:	f9002e61 	str	x1, [x19,#88]
 1d2d774:	97ed7513 	bl	188abc0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8ad38>
 1d2d778:	f9407e60 	ldr	x0, [x19,#248]
 1d2d77c:	979bdcdd 	bl	424af0 <free@plt>
 1d2d780:	91038260 	add	x0, x19, #0xe0
 1d2d784:	94187977 	bl	234bd60 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1c3c48>
 1d2d788:	91034260 	add	x0, x19, #0xd0
 1d2d78c:	9419db99 	bl	23a45f0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2f1d0>
 1d2d790:	91032260 	add	x0, x19, #0xc8
 1d2d794:	9419db97 	bl	23a45f0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2f1d0>
 1d2d798:	91030260 	add	x0, x19, #0xc0
 1d2d79c:	9419db95 	bl	23a45f0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2f1d0>
