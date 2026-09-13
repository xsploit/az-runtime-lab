
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002159b1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959c94>:
 2159b1c:	f9400013 	ldr	x19, [x0]
 2159b20:	340010a2 	cbz	w2, 2159d34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959eac>
 2159b24:	a9025bf5 	stp	x21, x22, [sp,#32]
 2159b28:	90006795 	adrp	x21, 2e49000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8861a8>
 2159b2c:	911382b5 	add	x21, x21, #0x4e0
 2159b30:	911402a3 	add	x3, x21, #0x500
 2159b34:	52800c02 	mov	w2, #0x60                  	// #96
 2159b38:	52800000 	mov	w0, #0x0                   	// #0
 2159b3c:	a90363f7 	stp	x23, x24, [sp,#48]
 2159b40:	9794bb4e 	bl	688878 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x145a0>
 2159b44:	f100027f 	cmp	x19, #0x0
 2159b48:	9101c3f4 	add	x20, sp, #0x70
 2159b4c:	7a400804 	ccmp	w0, #0x0, #0x4, eq
 2159b50:	54001c81 	b.ne	2159ee0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95a058>
 2159b54:	f0003843 	adrp	x3, 2864000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a11a8>
 2159b58:	aa1403e1 	mov	x1, x20
 2159b5c:	4f000506 	movi	v6.4s, #0x8
 2159b60:	9109c3e2 	add	x2, sp, #0x270
 2159b64:	3dc1a063 	ldr	q3, [x3,#1664]
 2159b68:	900041a3 	adrp	x3, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 2159b6c:	4f000485 	movi	v5.4s, #0x4
 2159b70:	4f008422 	movi	v2.8h, #0x1
 2159b74:	3dc23861 	ldr	q1, [x3,#2272]
 2159b78:	4ea58464 	add	v4.4s, v3.4s, v5.4s
 2159b7c:	4f3f0471 	sshr	v17.4s, v3.4s, #1
 2159b80:	4f3f0490 	sshr	v16.4s, v4.4s, #1
 2159b84:	0e612860 	xtn	v0.4h, v3.4s
 2159b88:	4e612880 	xtn2	v0.8h, v4.4s
 2159b8c:	4ea68463 	add	v3.4s, v3.4s, v6.4s
 2159b90:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 2159b94:	0e612a27 	xtn	v7.4h, v17.4s
 2159b98:	4e612a07 	xtn2	v7.8h, v16.4s
 2159b9c:	4e609800 	cmeq	v0.8h, v0.8h, #0
 2159ba0:	6e211ce4 	eor	v4.16b, v7.16b, v1.16b
 2159ba4:	6e641ce0 	bsl	v0.16b, v7.16b, v4.16b
 2159ba8:	2f10a407 	uxtl	v7.4s, v0.4h
 2159bac:	6f10a404 	uxtl2	v4.4s, v0.8h
 2159bb0:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 2159bb4:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 2159bb8:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 2159bbc:	4e609800 	cmeq	v0.8h, v0.8h, #0
 2159bc0:	0e6128f0 	xtn	v16.4h, v7.4s
 2159bc4:	4e612890 	xtn2	v16.8h, v4.4s
 2159bc8:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 2159bcc:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 2159bd0:	2f10a407 	uxtl	v7.4s, v0.4h
 2159bd4:	6f10a404 	uxtl2	v4.4s, v0.8h
 2159bd8:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 2159bdc:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 2159be0:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 2159be4:	4e609800 	cmeq	v0.8h, v0.8h, #0
 2159be8:	0e6128f0 	xtn	v16.4h, v7.4s
 2159bec:	4e612890 	xtn2	v16.8h, v4.4s
 2159bf0:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 2159bf4:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 2159bf8:	2f10a407 	uxtl	v7.4s, v0.4h
 2159bfc:	6f10a404 	uxtl2	v4.4s, v0.8h
 2159c00:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 2159c04:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 2159c08:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 2159c0c:	4e609800 	cmeq	v0.8h, v0.8h, #0
 2159c10:	0e6128f0 	xtn	v16.4h, v7.4s
 2159c14:	4e612890 	xtn2	v16.8h, v4.4s
 2159c18:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 2159c1c:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 2159c20:	2f10a407 	uxtl	v7.4s, v0.4h
 2159c24:	6f10a404 	uxtl2	v4.4s, v0.8h
 2159c28:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 2159c2c:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 2159c30:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 2159c34:	4e609800 	cmeq	v0.8h, v0.8h, #0
 2159c38:	0e6128f0 	xtn	v16.4h, v7.4s
 2159c3c:	4e612890 	xtn2	v16.8h, v4.4s
 2159c40:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 2159c44:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 2159c48:	2f10a407 	uxtl	v7.4s, v0.4h
 2159c4c:	6f10a404 	uxtl2	v4.4s, v0.8h
 2159c50:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 2159c54:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 2159c58:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 2159c5c:	4e609800 	cmeq	v0.8h, v0.8h, #0
 2159c60:	0e6128f0 	xtn	v16.4h, v7.4s
 2159c64:	4e612890 	xtn2	v16.8h, v4.4s
 2159c68:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 2159c6c:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 2159c70:	2f10a407 	uxtl	v7.4s, v0.4h
 2159c74:	6f10a404 	uxtl2	v4.4s, v0.8h
 2159c78:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 2159c7c:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 2159c80:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 2159c84:	4e609800 	cmeq	v0.8h, v0.8h, #0
 2159c88:	0e6128f0 	xtn	v16.4h, v7.4s
 2159c8c:	4e612890 	xtn2	v16.8h, v4.4s
 2159c90:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 2159c94:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 2159c98:	2f10a407 	uxtl	v7.4s, v0.4h
 2159c9c:	6f10a404 	uxtl2	v4.4s, v0.8h
 2159ca0:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 2159ca4:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 2159ca8:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 2159cac:	4e609800 	cmeq	v0.8h, v0.8h, #0
 2159cb0:	0e6128f0 	xtn	v16.4h, v7.4s
 2159cb4:	4e612890 	xtn2	v16.8h, v4.4s
 2159cb8:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 2159cbc:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 2159cc0:	3c810420 	str	q0, [x1],#16
 2159cc4:	eb02003f 	cmp	x1, x2
 2159cc8:	54fff581 	b.ne	2159b78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x959cf0>
 2159ccc:	7100001f 	cmp	w0, #0x0
 2159cd0:	5400104d 	b.le	2159ed8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95a050>
 2159cd4:	51000400 	sub	w0, w0, #0x1
 2159cd8:	91000663 	add	x3, x19, #0x1
 2159cdc:	8b030003 	add	x3, x0, x3
 2159ce0:	aa1303e2 	mov	x2, x19
 2159ce4:	529fffe1 	mov	w1, #0xffff                	// #65535
 2159ce8:	38401440 	ldrb	w0, [x2],#1
 2159cec:	4a010000 	eor	w0, w0, w1
 2159cf0:	eb02007f 	cmp	x3, x2
 2159cf4:	d37f1c00 	ubfiz	x0, x0, #1, #8
 2159cf8:	78606a80 	ldrh	w0, [x20,x0]
 2159cfc:	4a412001 	eor	w1, w0, w1, lsr #8
