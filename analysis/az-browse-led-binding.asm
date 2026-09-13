
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002042634 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8427ac>:
 2042634:	d29ecae1 	mov	x1, #0xf657                	// #63063
 2042638:	f2b249c1 	movk	x1, #0x924e, lsl #16
 204263c:	12800003 	mov	w3, #0xffffffff            	// #-1
 2042640:	f2d65de1 	movk	x1, #0xb2ef, lsl #32
 2042644:	52800002 	mov	w2, #0x0                   	// #0
 2042648:	f9400004 	ldr	x4, [x0]
 204264c:	f2e032a1 	movk	x1, #0x195, lsl #48
 2042650:	f90013e1 	str	x1, [sp,#32]
 2042654:	aa1303e0 	mov	x0, x19
 2042658:	528000c1 	mov	w1, #0x6                   	// #6
 204265c:	d63f0080 	blr	x4
 2042660:	aa0003e1 	mov	x1, x0
 2042664:	9100a3e8 	add	x8, sp, #0x28
 2042668:	910083e0 	add	x0, sp, #0x20
 204266c:	97ffff23 	bl	20422f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x842470>
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
