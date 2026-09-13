
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002147690 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947808>:
 2147690:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 2147694:	4e609800 	cmeq	v0.8h, v0.8h, #0
 2147698:	0e6128f0 	xtn	v16.4h, v7.4s
 214769c:	4e612890 	xtn2	v16.8h, v4.4s
 21476a0:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 21476a4:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 21476a8:	3c810400 	str	q0, [x0],#16
 21476ac:	eb00003f 	cmp	x1, x0
 21476b0:	54fff581 	b.ne	2147560 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9476d8>
 21476b4:	340015e3 	cbz	w3, 2147970 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947ae8>
 21476b8:	51000460 	sub	w0, w3, #0x1
 21476bc:	91000663 	add	x3, x19, #0x1
 21476c0:	8b000063 	add	x3, x3, x0
 21476c4:	aa1303e2 	mov	x2, x19
 21476c8:	529fffe1 	mov	w1, #0xffff                	// #65535
 21476cc:	d503201f 	nop
 21476d0:	38401440 	ldrb	w0, [x2],#1
 21476d4:	4a010000 	eor	w0, w0, w1
 21476d8:	eb02007f 	cmp	x3, x2
 21476dc:	d37f1c00 	ubfiz	x0, x0, #1, #8
 21476e0:	78606a80 	ldrh	w0, [x20,x0]
 21476e4:	4a412001 	eor	w1, w0, w1, lsr #8
 21476e8:	54ffff41 	b.ne	21476d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x947848>
 21476ec:	2a2103e1 	mvn	w1, w1
 21476f0:	12003c21 	and	w1, w1, #0xffff
 21476f4:	79403a60 	ldrh	w0, [x19,#28]
 21476f8:	6b01001f 	cmp	w0, w1
 21476fc:	54000241 	b.ne	2147744 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9478bc>
 2147700:	aa1303e0 	mov	x0, x19
 2147704:	a9407bfd 	ldp	x29, x30, [sp]
 2147708:	a94153f3 	ldp	x19, x20, [sp,#16]
 214770c:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2147710:	a94363f7 	ldp	x23, x24, [sp,#48]
 2147714:	9109c3ff 	add	sp, sp, #0x270
 2147718:	d65f03c0 	ret
 214771c:	b4000873 	cbz	x19, 2147828 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9479a0>
 2147720:	a9007e7f 	stp	xzr, xzr, [x19]
 2147724:	a9017e7f 	stp	xzr, xzr, [x19,#16]
 2147728:	a9027e7f 	stp	xzr, xzr, [x19,#32]
 214772c:	a9037e7f 	stp	xzr, xzr, [x19,#48]
 2147730:	a9047e7f 	stp	xzr, xzr, [x19,#64]
 2147734:	a9057e7f 	stp	xzr, xzr, [x19,#80]
 2147738:	a9067e7f 	stp	xzr, xzr, [x19,#96]
 214773c:	a9077e7f 	stp	xzr, xzr, [x19,#112]
 2147740:	17ffff3d 	b	2147434 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9475ac>
 2147744:	d00067e1 	adrp	x1, 2e45000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8821a8>
 2147748:	911b4021 	add	x1, x1, #0x6d0
 214774c:	aa1403e0 	mov	x0, x20
