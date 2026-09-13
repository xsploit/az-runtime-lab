
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000020423c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x842538>:
 20423c0:	f9001281 	str	x1, [x20,#32]
 20423c4:	f90017ff 	str	xzr, [sp,#40]
 20423c8:	b4000120 	cbz	x0, 20423ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x842564>
 20423cc:	f9400001 	ldr	x1, [x0]
 20423d0:	f9400421 	ldr	x1, [x1,#8]
 20423d4:	d63f0020 	blr	x1
 20423d8:	f94017e0 	ldr	x0, [sp,#40]
 20423dc:	b4000080 	cbz	x0, 20423ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x842564>
 20423e0:	f9400001 	ldr	x1, [x0]
 20423e4:	f9400421 	ldr	x1, [x1,#8]
 20423e8:	d63f0020 	blr	x1
 20423ec:	f9400260 	ldr	x0, [x19]
 20423f0:	d280bfe1 	mov	x1, #0x5ff                 	// #1535
 20423f4:	f2be49a1 	movk	x1, #0xf24d, lsl #16
 20423f8:	12800003 	mov	w3, #0xffffffff            	// #-1
 20423fc:	f2cddee1 	movk	x1, #0x6ef7, lsl #32
 2042400:	52800002 	mov	w2, #0x0                   	// #0
 2042404:	f9400004 	ldr	x4, [x0]
 2042408:	f2e03161 	movk	x1, #0x18b, lsl #48
 204240c:	f90013e1 	str	x1, [sp,#32]
 2042410:	aa1303e0 	mov	x0, x19
 2042414:	52800021 	mov	w1, #0x1                   	// #1
 2042418:	d63f0080 	blr	x4
 204241c:	aa0003e1 	mov	x1, x0
 2042420:	9100a3e8 	add	x8, sp, #0x28
 2042424:	910083e0 	add	x0, sp, #0x20
 2042428:	97ffffb4 	bl	20422f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x842470>
 204242c:	f9401680 	ldr	x0, [x20,#40]
 2042430:	f94017e1 	ldr	x1, [sp,#40]
 2042434:	f9001681 	str	x1, [x20,#40]
 2042438:	f90017ff 	str	xzr, [sp,#40]
 204243c:	b4000120 	cbz	x0, 2042460 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8425d8>
 2042440:	f9400001 	ldr	x1, [x0]
 2042444:	f9400421 	ldr	x1, [x1,#8]
 2042448:	d63f0020 	blr	x1
 204244c:	f94017e0 	ldr	x0, [sp,#40]
 2042450:	b4000080 	cbz	x0, 2042460 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8425d8>
 2042454:	f9400001 	ldr	x1, [x0]
 2042458:	f9400421 	ldr	x1, [x1,#8]
 204245c:	d63f0020 	blr	x1
 2042460:	f9400260 	ldr	x0, [x19]
 2042464:	d28b13c1 	mov	x1, #0x589e                	// #22686
 2042468:	f2b37b41 	movk	x1, #0x9bda, lsl #16
 204246c:	12800003 	mov	w3, #0xffffffff            	// #-1
 2042470:	f2de7e41 	movk	x1, #0xf3f2, lsl #32
 2042474:	52800002 	mov	w2, #0x0                   	// #0
 2042478:	f9400004 	ldr	x4, [x0]
 204247c:	f2e02ca1 	movk	x1, #0x165, lsl #48
 2042480:	f90013e1 	str	x1, [sp,#32]
 2042484:	aa1303e0 	mov	x0, x19
 2042488:	52800041 	mov	w1, #0x2                   	// #2
 204248c:	d63f0080 	blr	x4
