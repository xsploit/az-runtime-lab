
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000213bdd0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93bf48>:
 213bdd0:	d109c3ff 	sub	sp, sp, #0x270
 213bdd4:	12001c22 	and	w2, w1, #0xff
 213bdd8:	a9007bfd 	stp	x29, x30, [sp]
 213bddc:	910003fd 	mov	x29, sp
 213bde0:	b9400801 	ldr	w1, [x0,#8]
 213bde4:	a90153f3 	stp	x19, x20, [sp,#16]
 213bde8:	7102603f 	cmp	w1, #0x98
 213bdec:	540007c0 	b.eq	213bee4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93c05c>
 213bdf0:	9000cfe0 	adrp	x0, 3b37000 <_ZTISt11range_error@@GLIBCXX_3.4+0x12440>
 213bdf4:	d2800013 	mov	x19, #0x0                   	// #0
 213bdf8:	39784001 	ldrb	w1, [x0,#3600]
 213bdfc:	350000c1 	cbnz	w1, 213be14 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93bf8c>
 213be00:	aa1303e0 	mov	x0, x19
 213be04:	a9407bfd 	ldp	x29, x30, [sp]
 213be08:	a94153f3 	ldp	x19, x20, [sp,#16]
 213be0c:	9109c3ff 	add	sp, sp, #0x270
 213be10:	d65f03c0 	ret
 213be14:	a9025bf5 	stp	x21, x22, [sp,#32]
 213be18:	910143f5 	add	x21, sp, #0x50
 213be1c:	d0002421 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 213be20:	3938401f 	strb	wzr, [x0,#3600]
 213be24:	9136a021 	add	x1, x1, #0xda8
 213be28:	aa1503e0 	mov	x0, x21
 213be2c:	9407dfad 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 213be30:	910163f6 	add	x22, sp, #0x58
 213be34:	90006841 	adrp	x1, 2e43000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8801a8>
 213be38:	91254021 	add	x1, x1, #0x950
 213be3c:	aa1503e0 	mov	x0, x21
 213be40:	910be021 	add	x1, x1, #0x2f8
 213be44:	aa1603e8 	mov	x8, x22
 213be48:	94075f6a 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 213be4c:	a90363f7 	stp	x23, x24, [sp,#48]
 213be50:	910183f7 	add	x23, sp, #0x60
 213be54:	90003481 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 213be58:	aa1703e8 	mov	x8, x23
 213be5c:	91366021 	add	x1, x1, #0xd98
 213be60:	aa1603e0 	mov	x0, x22
 213be64:	94075f63 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 213be68:	9101a3f8 	add	x24, sp, #0x68
 213be6c:	b0006841 	adrp	x1, 2e44000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8811a8>
 213be70:	aa1803e0 	mov	x0, x24
 213be74:	9119c021 	add	x1, x1, #0x670
 213be78:	9407df9a 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 213be7c:	9101c3f4 	add	x20, sp, #0x70
 213be80:	aa1803e1 	mov	x1, x24
 213be84:	aa1403e8 	mov	x8, x20
 213be88:	aa1703e0 	mov	x0, x23
 213be8c:	94075f01 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 213be90:	52800022 	mov	w2, #0x1                   	// #1
 213be94:	52800001 	mov	w1, #0x0                   	// #0
 213be98:	aa1403e0 	mov	x0, x20
 213be9c:	94031151 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 213bea0:	aa1403e0 	mov	x0, x20
 213bea4:	940701d7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 213bea8:	aa1803e0 	mov	x0, x24
 213beac:	940701d5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 213beb0:	aa1703e0 	mov	x0, x23
 213beb4:	940701d3 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 213beb8:	aa1603e0 	mov	x0, x22
 213bebc:	940701d1 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 213bec0:	aa1503e0 	mov	x0, x21
 213bec4:	940701cf 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 213bec8:	aa1303e0 	mov	x0, x19
 213becc:	a9407bfd 	ldp	x29, x30, [sp]
 213bed0:	a94153f3 	ldp	x19, x20, [sp,#16]
 213bed4:	a9425bf5 	ldp	x21, x22, [sp,#32]
 213bed8:	a94363f7 	ldp	x23, x24, [sp,#48]
 213bedc:	9109c3ff 	add	sp, sp, #0x270
 213bee0:	d65f03c0 	ret
 213bee4:	f9400013 	ldr	x19, [x0]
 213bee8:	340010a2 	cbz	w2, 213c0fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93c274>
 213beec:	a9025bf5 	stp	x21, x22, [sp,#32]
 213bef0:	90006855 	adrp	x21, 2e43000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8801a8>
 213bef4:	912542b5 	add	x21, x21, #0x950
 213bef8:	911122a3 	add	x3, x21, #0x448
 213befc:	528004c2 	mov	w2, #0x26                  	// #38
 213bf00:	52800000 	mov	w0, #0x0                   	// #0
 213bf04:	a90363f7 	stp	x23, x24, [sp,#48]
 213bf08:	9795325c 	bl	688878 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x145a0>
 213bf0c:	f100027f 	cmp	x19, #0x0
 213bf10:	9101c3f4 	add	x20, sp, #0x70
 213bf14:	7a400804 	ccmp	w0, #0x0, #0x4, eq
 213bf18:	54001cc1 	b.ne	213c2b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93c428>
 213bf1c:	b0003943 	adrp	x3, 2864000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a11a8>
 213bf20:	aa1403e1 	mov	x1, x20
 213bf24:	4f000506 	movi	v6.4s, #0x8
 213bf28:	9109c3e2 	add	x2, sp, #0x270
 213bf2c:	3dc1a063 	ldr	q3, [x3,#1664]
 213bf30:	d0004283 	adrp	x3, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 213bf34:	4f000485 	movi	v5.4s, #0x4
 213bf38:	4f008422 	movi	v2.8h, #0x1
 213bf3c:	3dc23861 	ldr	q1, [x3,#2272]
 213bf40:	4ea58464 	add	v4.4s, v3.4s, v5.4s
 213bf44:	4f3f0471 	sshr	v17.4s, v3.4s, #1
 213bf48:	4f3f0490 	sshr	v16.4s, v4.4s, #1
 213bf4c:	0e612860 	xtn	v0.4h, v3.4s
 213bf50:	4e612880 	xtn2	v0.8h, v4.4s
 213bf54:	4ea68463 	add	v3.4s, v3.4s, v6.4s
 213bf58:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 213bf5c:	0e612a27 	xtn	v7.4h, v17.4s
 213bf60:	4e612a07 	xtn2	v7.8h, v16.4s
 213bf64:	4e609800 	cmeq	v0.8h, v0.8h, #0
 213bf68:	6e211ce4 	eor	v4.16b, v7.16b, v1.16b
 213bf6c:	6e641ce0 	bsl	v0.16b, v7.16b, v4.16b
 213bf70:	2f10a407 	uxtl	v7.4s, v0.4h
 213bf74:	6f10a404 	uxtl2	v4.4s, v0.8h
 213bf78:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 213bf7c:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 213bf80:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 213bf84:	4e609800 	cmeq	v0.8h, v0.8h, #0
 213bf88:	0e6128f0 	xtn	v16.4h, v7.4s
 213bf8c:	4e612890 	xtn2	v16.8h, v4.4s
 213bf90:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 213bf94:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 213bf98:	2f10a407 	uxtl	v7.4s, v0.4h
 213bf9c:	6f10a404 	uxtl2	v4.4s, v0.8h
 213bfa0:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 213bfa4:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 213bfa8:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 213bfac:	4e609800 	cmeq	v0.8h, v0.8h, #0
 213bfb0:	0e6128f0 	xtn	v16.4h, v7.4s
 213bfb4:	4e612890 	xtn2	v16.8h, v4.4s
 213bfb8:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 213bfbc:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 213bfc0:	2f10a407 	uxtl	v7.4s, v0.4h
 213bfc4:	6f10a404 	uxtl2	v4.4s, v0.8h
 213bfc8:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 213bfcc:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 213bfd0:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 213bfd4:	4e609800 	cmeq	v0.8h, v0.8h, #0
 213bfd8:	0e6128f0 	xtn	v16.4h, v7.4s
 213bfdc:	4e612890 	xtn2	v16.8h, v4.4s
 213bfe0:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 213bfe4:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 213bfe8:	2f10a407 	uxtl	v7.4s, v0.4h
 213bfec:	6f10a404 	uxtl2	v4.4s, v0.8h
 213bff0:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 213bff4:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 213bff8:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 213bffc:	4e609800 	cmeq	v0.8h, v0.8h, #0
 213c000:	0e6128f0 	xtn	v16.4h, v7.4s
 213c004:	4e612890 	xtn2	v16.8h, v4.4s
 213c008:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 213c00c:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 213c010:	2f10a407 	uxtl	v7.4s, v0.4h
 213c014:	6f10a404 	uxtl2	v4.4s, v0.8h
 213c018:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 213c01c:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 213c020:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 213c024:	4e609800 	cmeq	v0.8h, v0.8h, #0
 213c028:	0e6128f0 	xtn	v16.4h, v7.4s
 213c02c:	4e612890 	xtn2	v16.8h, v4.4s
 213c030:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 213c034:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 213c038:	2f10a407 	uxtl	v7.4s, v0.4h
 213c03c:	6f10a404 	uxtl2	v4.4s, v0.8h
 213c040:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 213c044:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 213c048:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 213c04c:	4e609800 	cmeq	v0.8h, v0.8h, #0
 213c050:	0e6128f0 	xtn	v16.4h, v7.4s
 213c054:	4e612890 	xtn2	v16.8h, v4.4s
 213c058:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 213c05c:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 213c060:	2f10a407 	uxtl	v7.4s, v0.4h
 213c064:	6f10a404 	uxtl2	v4.4s, v0.8h
 213c068:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 213c06c:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 213c070:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 213c074:	4e609800 	cmeq	v0.8h, v0.8h, #0
 213c078:	0e6128f0 	xtn	v16.4h, v7.4s
 213c07c:	4e612890 	xtn2	v16.8h, v4.4s
