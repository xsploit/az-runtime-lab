
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002147518 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947690>:
 2147518:	12001c21 	and	w1, w1, #0xff
 214751c:	f9400013 	ldr	x19, [x0]
 2147520:	34000fe1 	cbz	w1, 214771c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947894>
 2147524:	a9025bf5 	stp	x21, x22, [sp,#32]
 2147528:	9101c3f4 	add	x20, sp, #0x70
 214752c:	52800383 	mov	w3, #0x1c                  	// #28
 2147530:	a90363f7 	stp	x23, x24, [sp,#48]
 2147534:	b4001c73 	cbz	x19, 21478c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947a38>
 2147538:	b00038e2 	adrp	x2, 2864000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a11a8>
 214753c:	aa1403e0 	mov	x0, x20
 2147540:	4f000506 	movi	v6.4s, #0x8
 2147544:	9109c3e1 	add	x1, sp, #0x270
 2147548:	3dc1a043 	ldr	q3, [x2,#1664]
 214754c:	d0004222 	adrp	x2, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 2147550:	4f000485 	movi	v5.4s, #0x4
 2147554:	4f008422 	movi	v2.8h, #0x1
 2147558:	3dc23841 	ldr	q1, [x2,#2272]
 214755c:	d503201f 	nop
 2147560:	4ea58464 	add	v4.4s, v3.4s, v5.4s
 2147564:	4f3f0471 	sshr	v17.4s, v3.4s, #1
 2147568:	4f3f0490 	sshr	v16.4s, v4.4s, #1
 214756c:	0e612860 	xtn	v0.4h, v3.4s
 2147570:	4e612880 	xtn2	v0.8h, v4.4s
 2147574:	4ea68463 	add	v3.4s, v3.4s, v6.4s
 2147578:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 214757c:	0e612a27 	xtn	v7.4h, v17.4s
 2147580:	4e612a07 	xtn2	v7.8h, v16.4s
 2147584:	4e609800 	cmeq	v0.8h, v0.8h, #0
 2147588:	6e211ce4 	eor	v4.16b, v7.16b, v1.16b
 214758c:	6e641ce0 	bsl	v0.16b, v7.16b, v4.16b
 2147590:	2f10a407 	uxtl	v7.4s, v0.4h
 2147594:	6f10a404 	uxtl2	v4.4s, v0.8h
 2147598:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 214759c:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 21475a0:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 21475a4:	4e609800 	cmeq	v0.8h, v0.8h, #0
 21475a8:	0e6128f0 	xtn	v16.4h, v7.4s
 21475ac:	4e612890 	xtn2	v16.8h, v4.4s
 21475b0:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 21475b4:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 21475b8:	2f10a407 	uxtl	v7.4s, v0.4h
 21475bc:	6f10a404 	uxtl2	v4.4s, v0.8h
 21475c0:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 21475c4:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 21475c8:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 21475cc:	4e609800 	cmeq	v0.8h, v0.8h, #0
 21475d0:	0e6128f0 	xtn	v16.4h, v7.4s
 21475d4:	4e612890 	xtn2	v16.8h, v4.4s
 21475d8:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 21475dc:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 21475e0:	2f10a407 	uxtl	v7.4s, v0.4h
 21475e4:	6f10a404 	uxtl2	v4.4s, v0.8h
 21475e8:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 21475ec:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 21475f0:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 21475f4:	4e609800 	cmeq	v0.8h, v0.8h, #0
 21475f8:	0e6128f0 	xtn	v16.4h, v7.4s
 21475fc:	4e612890 	xtn2	v16.8h, v4.4s
 2147600:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 2147604:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 2147608:	2f10a407 	uxtl	v7.4s, v0.4h
 214760c:	6f10a404 	uxtl2	v4.4s, v0.8h
 2147610:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 2147614:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 2147618:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 214761c:	4e609800 	cmeq	v0.8h, v0.8h, #0
 2147620:	0e6128f0 	xtn	v16.4h, v7.4s
 2147624:	4e612890 	xtn2	v16.8h, v4.4s
 2147628:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 214762c:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
