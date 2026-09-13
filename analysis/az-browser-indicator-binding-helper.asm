
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000204d570 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d6e8>:
 204d570:	a9ba7bfd 	stp	x29, x30, [sp,#-96]!
 204d574:	910003fd 	mov	x29, sp
 204d578:	a90153f3 	stp	x19, x20, [sp,#16]
 204d57c:	aa0003f4 	mov	x20, x0
 204d580:	910123f3 	add	x19, sp, #0x48
 204d584:	aa1303e0 	mov	x0, x19
 204d588:	f90013f5 	str	x21, [sp,#32]
 204d58c:	aa0103f5 	mov	x21, x1
 204d590:	aa0303e1 	mov	x1, x3
 204d594:	f9001fe2 	str	x2, [sp,#56]
 204d598:	940b0392 	bl	230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862c8>
 204d59c:	39410284 	ldrb	w4, [x20,#64]
 204d5a0:	d2800025 	mov	x5, #0x1                   	// #1
 204d5a4:	f9401fe2 	ldr	x2, [sp,#56]
 204d5a8:	aa1503e1 	mov	x1, x21
 204d5ac:	aa1403e0 	mov	x0, x20
 204d5b0:	910143e3 	add	x3, sp, #0x50
 204d5b4:	a90517f3 	stp	x19, x5, [sp,#80]
 204d5b8:	97ffff2a 	bl	204d260 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d3d8>
 204d5bc:	aa1303e0 	mov	x0, x19
 204d5c0:	940abc74 	bl	22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x174678>
 204d5c4:	a94153f3 	ldp	x19, x20, [sp,#16]
 204d5c8:	f94013f5 	ldr	x21, [sp,#32]
 204d5cc:	a8c67bfd 	ldp	x29, x30, [sp],#96
 204d5d0:	d65f03c0 	ret
 204d5d4:	aa0003f4 	mov	x20, x0
 204d5d8:	aa1303e0 	mov	x0, x19
 204d5dc:	940abc6d 	bl	22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x174678>
 204d5e0:	aa1403e0 	mov	x0, x20
 204d5e4:	978f5dcb 	bl	424d10 <_Unwind_Resume@plt>
 204d5e8:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 204d5ec:	b0006de1 	adrp	x1, 2e0a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8471a8>
 204d5f0:	9110e021 	add	x1, x1, #0x438
 204d5f4:	910003fd 	mov	x29, sp
 204d5f8:	a90153f3 	stp	x19, x20, [sp,#16]
 204d5fc:	aa0003f3 	mov	x19, x0
 204d600:	f90013f5 	str	x21, [sp,#32]
 204d604:	f8048401 	str	x1, [x0],#72
 204d608:	97e4d36e 	bl	19823c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x182538>
 204d60c:	a942d674 	ldp	x20, x21, [x19,#40]
 204d610:	eb15029f 	cmp	x20, x21
 204d614:	540000e0 	b.eq	204d630 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d7a8>
 204d618:	aa1403e0 	mov	x0, x20
 204d61c:	91002294 	add	x20, x20, #0x8
 204d620:	940abc5c 	bl	22fc790 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x174678>
 204d624:	eb1402bf 	cmp	x21, x20
 204d628:	54ffff81 	b.ne	204d618 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d790>
 204d62c:	f9401675 	ldr	x21, [x19,#40]
 204d630:	b4000075 	cbz	x21, 204d63c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d7b4>
 204d634:	aa1503e0 	mov	x0, x21
 204d638:	978f5e06 	bl	424e50 <_ZdlPv@plt>
 204d63c:	f9400a60 	ldr	x0, [x19,#16]
 204d640:	b0006de1 	adrp	x1, 2e0a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8471a8>
 204d644:	91104021 	add	x1, x1, #0x410
 204d648:	f9000261 	str	x1, [x19]
 204d64c:	b40000a0 	cbz	x0, 204d660 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x84d7d8>
 204d650:	a94153f3 	ldp	x19, x20, [sp,#16]
 204d654:	f94013f5 	ldr	x21, [sp,#32]
 204d658:	a8c37bfd 	ldp	x29, x30, [sp],#48
 204d65c:	178f5dfd 	b	424e50 <_ZdlPv@plt>
 204d660:	a94153f3 	ldp	x19, x20, [sp,#16]
 204d664:	f94013f5 	ldr	x21, [sp,#32]
 204d668:	a8c37bfd 	ldp	x29, x30, [sp],#48
 204d66c:	d65f03c0 	ret
 204d670:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 204d674:	b0006de1 	adrp	x1, 2e0a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8471a8>
 204d678:	9110e021 	add	x1, x1, #0x438
 204d67c:	910003fd 	mov	x29, sp
 204d680:	a90153f3 	stp	x19, x20, [sp,#16]
 204d684:	aa0003f3 	mov	x19, x0
 204d688:	f90013f5 	str	x21, [sp,#32]
 204d68c:	f8048401 	str	x1, [x0],#72
