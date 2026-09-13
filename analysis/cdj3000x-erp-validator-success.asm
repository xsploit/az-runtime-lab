
runtime-lab/cdj3000x/rootfs/home/root/pdj/EP145:     file format elf64-littleaarch64


Disassembly of section .text:

000000000225f910 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92c540>:
 225f910:	12001c21 	and	w1, w1, #0xff
 225f914:	f9400013 	ldr	x19, [x0]
 225f918:	34000fe1 	cbz	w1, 225fb14 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92c744>
 225f91c:	a9025bf5 	stp	x21, x22, [sp,#32]
 225f920:	9101c3f4 	add	x20, sp, #0x70
 225f924:	528007c3 	mov	w3, #0x3e                  	// #62
 225f928:	a90363f7 	stp	x23, x24, [sp,#48]
 225f92c:	b4001bf3 	cbz	x19, 225fca8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92c8d8>
 225f930:	90003c02 	adrp	x2, 29df000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2ed410>
 225f934:	aa1403e0 	mov	x0, x20
 225f938:	4f000506 	movi	v6.4s, #0x8
 225f93c:	9109c3e1 	add	x1, sp, #0x270
 225f940:	3dc09c43 	ldr	q3, [x2,#624]
 225f944:	90006ec2 	adrp	x2, 3037000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x945410>
 225f948:	4f000485 	movi	v5.4s, #0x4
 225f94c:	4f008422 	movi	v2.8h, #0x1
 225f950:	3dc13c41 	ldr	q1, [x2,#1264]
 225f954:	d503201f 	nop
 225f958:	4ea58464 	add	v4.4s, v3.4s, v5.4s
 225f95c:	4f3f0471 	sshr	v17.4s, v3.4s, #1
 225f960:	4f3f0490 	sshr	v16.4s, v4.4s, #1
 225f964:	0e612860 	xtn	v0.4h, v3.4s
 225f968:	4e612880 	xtn2	v0.8h, v4.4s
 225f96c:	4ea68463 	add	v3.4s, v3.4s, v6.4s
 225f970:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 225f974:	0e612a27 	xtn	v7.4h, v17.4s
 225f978:	4e612a07 	xtn2	v7.8h, v16.4s
 225f97c:	4e609800 	cmeq	v0.8h, v0.8h, #0
 225f980:	6e211ce4 	eor	v4.16b, v7.16b, v1.16b
 225f984:	6e641ce0 	bsl	v0.16b, v7.16b, v4.16b
 225f988:	2f10a407 	uxtl	v7.4s, v0.4h
 225f98c:	6f10a404 	uxtl2	v4.4s, v0.8h
 225f990:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 225f994:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 225f998:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 225f99c:	4e609800 	cmeq	v0.8h, v0.8h, #0
 225f9a0:	0e6128f0 	xtn	v16.4h, v7.4s
 225f9a4:	4e612890 	xtn2	v16.8h, v4.4s
 225f9a8:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 225f9ac:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 225f9b0:	2f10a407 	uxtl	v7.4s, v0.4h
 225f9b4:	6f10a404 	uxtl2	v4.4s, v0.8h
 225f9b8:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 225f9bc:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 225f9c0:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 225f9c4:	4e609800 	cmeq	v0.8h, v0.8h, #0
 225f9c8:	0e6128f0 	xtn	v16.4h, v7.4s
 225f9cc:	4e612890 	xtn2	v16.8h, v4.4s
 225f9d0:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 225f9d4:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 225f9d8:	2f10a407 	uxtl	v7.4s, v0.4h
 225f9dc:	6f10a404 	uxtl2	v4.4s, v0.8h
 225f9e0:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 225f9e4:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 225f9e8:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 225f9ec:	4e609800 	cmeq	v0.8h, v0.8h, #0
 225f9f0:	0e6128f0 	xtn	v16.4h, v7.4s
 225f9f4:	4e612890 	xtn2	v16.8h, v4.4s
 225f9f8:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 225f9fc:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 225fa00:	2f10a407 	uxtl	v7.4s, v0.4h
 225fa04:	6f10a404 	uxtl2	v4.4s, v0.8h
 225fa08:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 225fa0c:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 225fa10:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 225fa14:	4e609800 	cmeq	v0.8h, v0.8h, #0
 225fa18:	0e6128f0 	xtn	v16.4h, v7.4s
 225fa1c:	4e612890 	xtn2	v16.8h, v4.4s
 225fa20:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 225fa24:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 225fa28:	2f10a407 	uxtl	v7.4s, v0.4h
 225fa2c:	6f10a404 	uxtl2	v4.4s, v0.8h
 225fa30:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 225fa34:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 225fa38:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 225fa3c:	4e609800 	cmeq	v0.8h, v0.8h, #0
 225fa40:	0e6128f0 	xtn	v16.4h, v7.4s
 225fa44:	4e612890 	xtn2	v16.8h, v4.4s
 225fa48:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 225fa4c:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 225fa50:	2f10a407 	uxtl	v7.4s, v0.4h
 225fa54:	6f10a404 	uxtl2	v4.4s, v0.8h
 225fa58:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 225fa5c:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 225fa60:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 225fa64:	4e609800 	cmeq	v0.8h, v0.8h, #0
 225fa68:	0e6128f0 	xtn	v16.4h, v7.4s
 225fa6c:	4e612890 	xtn2	v16.8h, v4.4s
 225fa70:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 225fa74:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 225fa78:	2f10a407 	uxtl	v7.4s, v0.4h
 225fa7c:	6f10a404 	uxtl2	v4.4s, v0.8h
 225fa80:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 225fa84:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 225fa88:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 225fa8c:	4e609800 	cmeq	v0.8h, v0.8h, #0
 225fa90:	0e6128f0 	xtn	v16.4h, v7.4s
 225fa94:	4e612890 	xtn2	v16.8h, v4.4s
 225fa98:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 225fa9c:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 225faa0:	3c810400 	str	q0, [x0],#16
 225faa4:	eb00003f 	cmp	x1, x0
 225faa8:	54fff581 	b.ne	225f958 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92c588>
 225faac:	34001563 	cbz	w3, 225fd58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92c988>
 225fab0:	51000460 	sub	w0, w3, #0x1
 225fab4:	91000663 	add	x3, x19, #0x1
 225fab8:	8b000063 	add	x3, x3, x0
 225fabc:	aa1303e2 	mov	x2, x19
 225fac0:	529fffe1 	mov	w1, #0xffff                	// #65535
 225fac4:	d503201f 	nop
 225fac8:	38401440 	ldrb	w0, [x2],#1
 225facc:	4a010000 	eor	w0, w0, w1
 225fad0:	eb02007f 	cmp	x3, x2
 225fad4:	d37f1c00 	ubfiz	x0, x0, #1, #8
 225fad8:	78606a80 	ldrh	w0, [x20,x0]
 225fadc:	4a412001 	eor	w1, w0, w1, lsr #8
 225fae0:	54ffff41 	b.ne	225fac8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92c6f8>
 225fae4:	2a2103e1 	mvn	w1, w1
 225fae8:	12003c21 	and	w1, w1, #0xffff
 225faec:	79407e60 	ldrh	w0, [x19,#62]
 225faf0:	6b01001f 	cmp	w0, w1
 225faf4:	540001c1 	b.ne	225fb2c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92c75c>
 225faf8:	aa1303e0 	mov	x0, x19
 225fafc:	a9407bfd 	ldp	x29, x30, [sp]
