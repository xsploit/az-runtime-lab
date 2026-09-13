
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f8520 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x70408>:
 21f8520:	f0006341 	adrp	x1, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f8524:	91070021 	add	x1, x1, #0x1c0
 21f8528:	f9000001 	str	x1, [x0]
 21f852c:	1792d1bf 	b	6acc28 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1c098>
 21f8530:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 21f8534:	f0006341 	adrp	x1, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f8538:	91070021 	add	x1, x1, #0x1c0
 21f853c:	910003fd 	mov	x29, sp
 21f8540:	f9000bf3 	str	x19, [sp,#16]
 21f8544:	aa0003f3 	mov	x19, x0
 21f8548:	f9000001 	str	x1, [x0]
 21f854c:	9792d1b7 	bl	6acc28 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x1c098>
 21f8550:	aa1303e0 	mov	x0, x19
 21f8554:	d2800301 	mov	x1, #0x18                  	// #24
 21f8558:	f9400bf3 	ldr	x19, [sp,#16]
 21f855c:	a8c27bfd 	ldp	x29, x30, [sp],#32
 21f8560:	1788b840 	b	426660 <_ZdlPvm@plt>
	...
 21f8570:	aa0003e3 	mov	x3, x0
 21f8574:	aa0103e0 	mov	x0, x1
 21f8578:	b9810062 	ldrsw	x2, [x3,#256]
 21f857c:	f9407c61 	ldr	x1, [x3,#248]
 21f8580:	1788b100 	b	424980 <memcpy@plt>
 21f8584:	d503201f 	nop
 21f8588:	d503201f 	nop
 21f858c:	d503201f 	nop
 21f8590:	d1030003 	sub	x3, x0, #0xc0
 21f8594:	aa0103e0 	mov	x0, x1
 21f8598:	b9810062 	ldrsw	x2, [x3,#256]
 21f859c:	f9407c61 	ldr	x1, [x3,#248]
 21f85a0:	1788b0f8 	b	424980 <memcpy@plt>
	...
 21f85b0:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21f85b4:	910003fd 	mov	x29, sp
 21f85b8:	a90153f3 	stp	x19, x20, [sp,#16]
 21f85bc:	9100a014 	add	x20, x0, #0x28
 21f85c0:	aa0103f3 	mov	x19, x1
 21f85c4:	f90013f5 	str	x21, [sp,#32]
 21f85c8:	aa0003f5 	mov	x21, x0
 21f85cc:	aa1403e0 	mov	x0, x20
 21f85d0:	9404cec4 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 21f85d4:	b9404283 	ldr	w3, [x20,#64]
 21f85d8:	f9402ea0 	ldr	x0, [x21,#88]
 21f85dc:	7100007f 	cmp	w3, #0x0
 21f85e0:	540001cd 	b.le	21f8618 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x70500>
 21f85e4:	f9400001 	ldr	x1, [x0]
 21f85e8:	91002004 	add	x4, x0, #0x8
 21f85ec:	52800002 	mov	w2, #0x0                   	// #0
 21f85f0:	eb01027f 	cmp	x19, x1
 21f85f4:	540000a1 	b.ne	21f8608 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x704f0>
 21f85f8:	1400000d 	b	21f862c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x70514>
 21f85fc:	f8408481 	ldr	x1, [x4],#8
