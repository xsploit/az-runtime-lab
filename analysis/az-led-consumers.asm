
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002042670 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8427e8>:
 2042670:	f9402a80 	ldr	x0, [x20,#80]
 2042674:	f94017e1 	ldr	x1, [sp,#40]
 2042678:	f90017ff 	str	xzr, [sp,#40]
 204267c:	f9002a81 	str	x1, [x20,#80]
 2042680:	b4000120 	cbz	x0, 20426a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84281c>
 2042684:	f9400001 	ldr	x1, [x0]
 2042688:	f9400421 	ldr	x1, [x1,#8]
 204268c:	d63f0020 	blr	x1
 2042690:	f94017e0 	ldr	x0, [sp,#40]
 2042694:	b4000080 	cbz	x0, 20426a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84281c>
 2042698:	f9400001 	ldr	x1, [x0]
 204269c:	f9400421 	ldr	x1, [x1,#8]
 20426a0:	d63f0020 	blr	x1
 20426a4:	f9400260 	ldr	x0, [x19]
 20426a8:	d2939ba1 	mov	x1, #0x9cdd                	// #40157
 20426ac:	f2bc8c61 	movk	x1, #0xe463, lsl #16
 20426b0:	12800003 	mov	w3, #0xffffffff            	// #-1
 20426b4:	f2c278c1 	movk	x1, #0x13c6, lsl #32
 20426b8:	52800002 	mov	w2, #0x0                   	// #0
 20426bc:	f9400004 	ldr	x4, [x0]
 20426c0:	f2e03ba1 	movk	x1, #0x1dd, lsl #48
 20426c4:	f90013e1 	str	x1, [sp,#32]
 20426c8:	aa1303e0 	mov	x0, x19
 20426cc:	52800101 	mov	w1, #0x8                   	// #8
 20426d0:	d63f0080 	blr	x4
 20426d4:	aa0003e1 	mov	x1, x0
 20426d8:	9100a3e8 	add	x8, sp, #0x28
 20426dc:	910083e0 	add	x0, sp, #0x20
 20426e0:	97ffff06 	bl	20422f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x842470>
 20426e4:	f9402e80 	ldr	x0, [x20,#88]
 20426e8:	f94017e1 	ldr	x1, [sp,#40]
 20426ec:	f90017ff 	str	xzr, [sp,#40]
 20426f0:	f9002e81 	str	x1, [x20,#88]
 20426f4:	b4000120 	cbz	x0, 2042718 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x842890>
 20426f8:	f9400001 	ldr	x1, [x0]
 20426fc:	f9400421 	ldr	x1, [x1,#8]
 2042700:	d63f0020 	blr	x1
 2042704:	f94017e0 	ldr	x0, [sp,#40]
 2042708:	b4000080 	cbz	x0, 2042718 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x842890>
 204270c:	f9400001 	ldr	x1, [x0]
 2042710:	f9400421 	ldr	x1, [x1,#8]
 2042714:	d63f0020 	blr	x1
 2042718:	f9400260 	ldr	x0, [x19]
 204271c:	d2809ba1 	mov	x1, #0x4dd                 	// #1245
 2042720:	f2a00521 	movk	x1, #0x29, lsl #16
 2042724:	12800003 	mov	w3, #0xffffffff            	// #-1
 2042728:	f2d8ce61 	movk	x1, #0xc673, lsl #32
 204272c:	52800002 	mov	w2, #0x0                   	// #0
 2042730:	f9400004 	ldr	x4, [x0]
 2042734:	f2e00b41 	movk	x1, #0x5a, lsl #48
 2042738:	f90013e1 	str	x1, [sp,#32]
 204273c:	aa1303e0 	mov	x0, x19
 2042740:	528000e1 	mov	w1, #0x7                   	// #7
 2042744:	d63f0080 	blr	x4
 2042748:	aa0003e1 	mov	x1, x0
 204274c:	9100a3e8 	add	x8, sp, #0x28
 2042750:	910083e0 	add	x0, sp, #0x20
 2042754:	97fffee9 	bl	20422f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x842470>
 2042758:	f9403280 	ldr	x0, [x20,#96]
 204275c:	f94017e1 	ldr	x1, [sp,#40]
 2042760:	f90017ff 	str	xzr, [sp,#40]
 2042764:	f9003281 	str	x1, [x20,#96]
 2042768:	b4000120 	cbz	x0, 204278c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x842904>
 204276c:	f9400001 	ldr	x1, [x0]
 2042770:	f9400421 	ldr	x1, [x1,#8]
 2042774:	d63f0020 	blr	x1
 2042778:	f94017e0 	ldr	x0, [sp,#40]
 204277c:	b4000080 	cbz	x0, 204278c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x842904>
 2042780:	f9400001 	ldr	x1, [x0]
 2042784:	f9400421 	ldr	x1, [x1,#8]
 2042788:	d63f0020 	blr	x1
 204278c:	f9400260 	ldr	x0, [x19]
 2042790:	d28e1661 	mov	x1, #0x70b3                	// #28851
 2042794:	f2beee01 	movk	x1, #0xf770, lsl #16
 2042798:	12800003 	mov	w3, #0xffffffff            	// #-1
 204279c:	f2d661e1 	movk	x1, #0xb30f, lsl #32
