
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000019e36b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1e3828>:
 19e36b0:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 19e36b4:	910003fd 	mov	x29, sp
 19e36b8:	a90153f3 	stp	x19, x20, [sp,#16]
 19e36bc:	aa0003f4 	mov	x20, x0
 19e36c0:	d0010af3 	adrp	x19, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 19e36c4:	9114c273 	add	x19, x19, #0x530
 19e36c8:	08dffe60 	ldarb	w0, [x19]
 19e36cc:	36000480 	tbz	w0, #0, 19e375c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1e38d4>
 19e36d0:	08dffe60 	ldarb	w0, [x19]
 19e36d4:	360007e0 	tbz	w0, #0, 19e37d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1e3948>
 19e36d8:	d0010ae0 	adrp	x0, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 19e36dc:	91158001 	add	x1, x0, #0x560
 19e36e0:	88dffc22 	ldar	w2, [x1]
 19e36e4:	37f80ae2 	tbnz	w2, #31, 19e3840 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1e39b8>
 19e36e8:	11000443 	add	w3, w2, #0x1
 19e36ec:	885ffc24 	ldaxr	w4, [x1]
 19e36f0:	6b02009f 	cmp	w4, w2
 19e36f4:	54000061 	b.ne	19e3700 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1e3878>
 19e36f8:	8805fc23 	stlxr	w5, w3, [x1]
 19e36fc:	35ffff85 	cbnz	w5, 19e36ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1e3864>
 19e3700:	54ffff01 	b.ne	19e36e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1e3858>
 19e3704:	d0010ae1 	adrp	x1, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
 19e3708:	9114e021 	add	x1, x1, #0x538
 19e370c:	f9400282 	ldr	x2, [x20]
 19e3710:	b9801823 	ldrsw	x3, [x1,#24]
 19e3714:	f9400424 	ldr	x4, [x1,#8]
 19e3718:	9ac30841 	udiv	x1, x2, x3
 19e371c:	9b038821 	msub	x1, x1, x3, x2
 19e3720:	f861d893 	ldr	x19, [x4,w1,sxtw #3]
 19e3724:	b5000093 	cbnz	x19, 19e3734 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1e38ac>
 19e3728:	14000007 	b	19e3744 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1e38bc>
 19e372c:	f9400a73 	ldr	x19, [x19,#16]
 19e3730:	b40000b3 	cbz	x19, 19e3744 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1e38bc>
 19e3734:	f9400261 	ldr	x1, [x19]
 19e3738:	eb01005f 	cmp	x2, x1
 19e373c:	54ffff81 	b.ne	19e372c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1e38a4>
 19e3740:	f9400673 	ldr	x19, [x19,#8]
 19e3744:	91158000 	add	x0, x0, #0x560
 19e3748:	97b2834e 	bl	684480 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x101a8>
 19e374c:	aa1303e0 	mov	x0, x19
 19e3750:	a94153f3 	ldp	x19, x20, [sp,#16]
 19e3754:	a8c37bfd 	ldp	x29, x30, [sp],#48
 19e3758:	d65f03c0 	ret
 19e375c:	aa1303e0 	mov	x0, x19
 19e3760:	97a90ac0 	bl	426260 <__cxa_guard_acquire@plt>
 19e3764:	34fffb60 	cbz	w0, 19e36d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1e3848>
 19e3768:	f90013f5 	str	x21, [sp,#32]
 19e376c:	d0010af5 	adrp	x21, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
