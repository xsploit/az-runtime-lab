
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002130548 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9306c0>:
 2130548:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 213054c:	910003fd 	mov	x29, sp
 2130550:	a90153f3 	stp	x19, x20, [sp,#16]
 2130554:	aa0003f3 	mov	x19, x0
 2130558:	9101a014 	add	x20, x0, #0x68
 213055c:	aa1403e0 	mov	x0, x20
 2130560:	f90013f5 	str	x21, [sp,#32]
 2130564:	aa0103f5 	mov	x21, x1
 2130568:	9407eede 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 213056c:	39414260 	ldrb	w0, [x19,#80]
 2130570:	b94002a1 	ldr	w1, [x21]
 2130574:	34000120 	cbz	w0, 2130598 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930710>
 2130578:	f94006a0 	ldr	x0, [x21,#8]
 213057c:	b9005a61 	str	w1, [x19,#88]
 2130580:	f9003260 	str	x0, [x19,#96]
 2130584:	aa1403e0 	mov	x0, x20
 2130588:	a94153f3 	ldp	x19, x20, [sp,#16]
 213058c:	f94013f5 	ldr	x21, [sp,#32]
 2130590:	a8c37bfd 	ldp	x29, x30, [sp],#48
 2130594:	1407eedf 	b	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 2130598:	f94006a0 	ldr	x0, [x21,#8]
 213059c:	52800022 	mov	w2, #0x1                   	// #1
 21305a0:	39014262 	strb	w2, [x19,#80]
 21305a4:	b9005a61 	str	w1, [x19,#88]
 21305a8:	f9003260 	str	x0, [x19,#96]
 21305ac:	aa1403e0 	mov	x0, x20
 21305b0:	a94153f3 	ldp	x19, x20, [sp,#16]
 21305b4:	f94013f5 	ldr	x21, [sp,#32]
 21305b8:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21305bc:	1407eed5 	b	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21305c0:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21305c4:	910003fd 	mov	x29, sp
 21305c8:	a90153f3 	stp	x19, x20, [sp,#16]
 21305cc:	aa0003f3 	mov	x19, x0
 21305d0:	aa0103f4 	mov	x20, x1
 21305d4:	f90013f5 	str	x21, [sp,#32]
 21305d8:	91008015 	add	x21, x0, #0x20
 21305dc:	aa1503e0 	mov	x0, x21
 21305e0:	9407eec0 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 21305e4:	39403260 	ldrb	w0, [x19,#12]
 21305e8:	34000140 	cbz	w0, 2130610 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930788>
 21305ec:	f9400280 	ldr	x0, [x20]
 21305f0:	f9000a60 	str	x0, [x19,#16]
 21305f4:	f8405280 	ldur	x0, [x20,#5]
 21305f8:	f8015260 	stur	x0, [x19,#21]
 21305fc:	aa1503e0 	mov	x0, x21
 2130600:	a94153f3 	ldp	x19, x20, [sp,#16]
 2130604:	f94013f5 	ldr	x21, [sp,#32]
 2130608:	a8c37bfd 	ldp	x29, x30, [sp],#48
 213060c:	1407eec1 	b	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 2130610:	b9400282 	ldr	w2, [x20]
 2130614:	52800021 	mov	w1, #0x1                   	// #1
 2130618:	39401284 	ldrb	w4, [x20,#4]
 213061c:	aa1503e0 	mov	x0, x21
 2130620:	b9400a83 	ldr	w3, [x20,#8]
 2130624:	b9001262 	str	w2, [x19,#16]
 2130628:	39403282 	ldrb	w2, [x20,#12]
 213062c:	39003261 	strb	w1, [x19,#12]
 2130630:	39005264 	strb	w4, [x19,#20]
 2130634:	b9001a63 	str	w3, [x19,#24]
 2130638:	39007262 	strb	w2, [x19,#28]
 213063c:	a94153f3 	ldp	x19, x20, [sp,#16]
 2130640:	f94013f5 	ldr	x21, [sp,#32]
 2130644:	a8c37bfd 	ldp	x29, x30, [sp],#48
 2130648:	1407eeb2 	b	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 213064c:	d503201f 	nop
 2130650:	d29d0001 	mov	x1, #0xe800                	// #59392
 2130654:	12001c63 	and	w3, w3, #0xff
 2130658:	f2b49001 	movk	x1, #0xa480, lsl #16
 213065c:	f2dd0f21 	movk	x1, #0xe879, lsl #32
