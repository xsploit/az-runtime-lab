
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000215a098 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95a210>:
 215a098:	f0004183 	adrp	x3, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 215a09c:	d0003841 	adrp	x1, 2864000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a11a8>
 215a0a0:	4f000506 	movi	v6.4s, #0x8
 215a0a4:	d10803ff 	sub	sp, sp, #0x200
 215a0a8:	4f000485 	movi	v5.4s, #0x4
 215a0ac:	910803e2 	add	x2, sp, #0x200
 215a0b0:	4f008422 	movi	v2.8h, #0x1
 215a0b4:	3dc23861 	ldr	q1, [x3,#2272]
 215a0b8:	3dc1a023 	ldr	q3, [x1,#1664]
 215a0bc:	910003e1 	mov	x1, sp
 215a0c0:	4ea58464 	add	v4.4s, v3.4s, v5.4s
 215a0c4:	4f3f0471 	sshr	v17.4s, v3.4s, #1
 215a0c8:	4f3f0490 	sshr	v16.4s, v4.4s, #1
 215a0cc:	0e612860 	xtn	v0.4h, v3.4s
 215a0d0:	4e612880 	xtn2	v0.8h, v4.4s
 215a0d4:	4ea68463 	add	v3.4s, v3.4s, v6.4s
 215a0d8:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 215a0dc:	0e612a27 	xtn	v7.4h, v17.4s
 215a0e0:	4e612a07 	xtn2	v7.8h, v16.4s
 215a0e4:	4e609800 	cmeq	v0.8h, v0.8h, #0
 215a0e8:	6e211ce4 	eor	v4.16b, v7.16b, v1.16b
 215a0ec:	6e641ce0 	bsl	v0.16b, v7.16b, v4.16b
 215a0f0:	2f10a407 	uxtl	v7.4s, v0.4h
 215a0f4:	6f10a404 	uxtl2	v4.4s, v0.8h
 215a0f8:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 215a0fc:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 215a100:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 215a104:	4e609800 	cmeq	v0.8h, v0.8h, #0
 215a108:	0e6128f0 	xtn	v16.4h, v7.4s
 215a10c:	4e612890 	xtn2	v16.8h, v4.4s
 215a110:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 215a114:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 215a118:	2f10a407 	uxtl	v7.4s, v0.4h
 215a11c:	6f10a404 	uxtl2	v4.4s, v0.8h
 215a120:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 215a124:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 215a128:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 215a12c:	4e609800 	cmeq	v0.8h, v0.8h, #0
 215a130:	0e6128f0 	xtn	v16.4h, v7.4s
 215a134:	4e612890 	xtn2	v16.8h, v4.4s
 215a138:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 215a13c:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 215a140:	2f10a407 	uxtl	v7.4s, v0.4h
 215a144:	6f10a404 	uxtl2	v4.4s, v0.8h
 215a148:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 215a14c:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 215a150:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 215a154:	4e609800 	cmeq	v0.8h, v0.8h, #0
 215a158:	0e6128f0 	xtn	v16.4h, v7.4s
 215a15c:	4e612890 	xtn2	v16.8h, v4.4s
 215a160:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 215a164:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 215a168:	2f10a407 	uxtl	v7.4s, v0.4h
 215a16c:	6f10a404 	uxtl2	v4.4s, v0.8h
 215a170:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 215a174:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 215a178:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 215a17c:	4e609800 	cmeq	v0.8h, v0.8h, #0
 215a180:	0e6128f0 	xtn	v16.4h, v7.4s
 215a184:	4e612890 	xtn2	v16.8h, v4.4s
 215a188:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 215a18c:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 215a190:	2f10a407 	uxtl	v7.4s, v0.4h
 215a194:	6f10a404 	uxtl2	v4.4s, v0.8h
 215a198:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 215a19c:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 215a1a0:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 215a1a4:	4e609800 	cmeq	v0.8h, v0.8h, #0
 215a1a8:	0e6128f0 	xtn	v16.4h, v7.4s
 215a1ac:	4e612890 	xtn2	v16.8h, v4.4s
 215a1b0:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 215a1b4:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 215a1b8:	2f10a407 	uxtl	v7.4s, v0.4h
 215a1bc:	6f10a404 	uxtl2	v4.4s, v0.8h
 215a1c0:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 215a1c4:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 215a1c8:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 215a1cc:	4e609800 	cmeq	v0.8h, v0.8h, #0
 215a1d0:	0e6128f0 	xtn	v16.4h, v7.4s
 215a1d4:	4e612890 	xtn2	v16.8h, v4.4s
 215a1d8:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 215a1dc:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 215a1e0:	2f10a407 	uxtl	v7.4s, v0.4h
 215a1e4:	6f10a404 	uxtl2	v4.4s, v0.8h
 215a1e8:	4e221c00 	and	v0.16b, v0.16b, v2.16b
 215a1ec:	4f3f04e7 	sshr	v7.4s, v7.4s, #1
 215a1f0:	4f3f0484 	sshr	v4.4s, v4.4s, #1
 215a1f4:	4e609800 	cmeq	v0.8h, v0.8h, #0
 215a1f8:	0e6128f0 	xtn	v16.4h, v7.4s
 215a1fc:	4e612890 	xtn2	v16.8h, v4.4s
 215a200:	6e211e04 	eor	v4.16b, v16.16b, v1.16b
 215a204:	6e641e00 	bsl	v0.16b, v16.16b, v4.16b
 215a208:	3c810420 	str	q0, [x1],#16
 215a20c:	eb02003f 	cmp	x1, x2
 215a210:	54fff581 	b.ne	215a0c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95a238>
 215a214:	b9400802 	ldr	w2, [x0,#8]
 215a218:	f9400001 	ldr	x1, [x0]
 215a21c:	7100005f 	cmp	w2, #0x0
 215a220:	5400022d 	b.le	215a264 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95a3dc>
 215a224:	51000442 	sub	w2, w2, #0x1
 215a228:	91000423 	add	x3, x1, #0x1
 215a22c:	8b030042 	add	x2, x2, x3
 215a230:	529fffe0 	mov	w0, #0xffff                	// #65535
 215a234:	d503201f 	nop
 215a238:	38401423 	ldrb	w3, [x1],#1
 215a23c:	4a000063 	eor	w3, w3, w0
 215a240:	eb01005f 	cmp	x2, x1
 215a244:	d37f1c63 	ubfiz	x3, x3, #1, #8
 215a248:	78636be3 	ldrh	w3, [sp,x3]
 215a24c:	4a402060 	eor	w0, w3, w0, lsr #8
 215a250:	54ffff41 	b.ne	215a238 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95a3b0>
 215a254:	2a2003e0 	mvn	w0, w0
 215a258:	12003c00 	and	w0, w0, #0xffff
 215a25c:	910803ff 	add	sp, sp, #0x200
 215a260:	d65f03c0 	ret
 215a264:	52800000 	mov	w0, #0x0                   	// #0
 215a268:	910803ff 	add	sp, sp, #0x200
 215a26c:	d65f03c0 	ret
 215a270:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 215a274:	910003fd 	mov	x29, sp
 215a278:	a90153f3 	stp	x19, x20, [sp,#16]
 215a27c:	aa0103f3 	mov	x19, x1
 215a280:	aa0003f4 	mov	x20, x0
 215a284:	39429001 	ldrb	w1, [x0,#164]
 215a288:	39400260 	ldrb	w0, [x19]
 215a28c:	33190020 	bfi	w0, w1, #7, #1
 215a290:	39000260 	strb	w0, [x19]
 215a294:	9400cca7 	bl	218d530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x5418>
 215a298:	39400262 	ldrb	w2, [x19]
 215a29c:	52800041 	mov	w1, #0x2                   	// #2
 215a2a0:	39420283 	ldrb	w3, [x20,#128]
 215a2a4:	331b0002 	bfi	w2, w0, #5, #1
 215a2a8:	39000262 	strb	w2, [x19]
 215a2ac:	39428280 	ldrb	w0, [x20,#160]
 215a2b0:	33000002 	bfxil	w2, w0, #0, #1
 215a2b4:	39000262 	strb	w2, [x19]
 215a2b8:	39428680 	ldrb	w0, [x20,#161]
 215a2bc:	331e0002 	bfi	w2, w0, #2, #1
 215a2c0:	39000262 	strb	w2, [x19]
 215a2c4:	39428a80 	ldrb	w0, [x20,#162]
 215a2c8:	331c0002 	bfi	w2, w0, #4, #1
 215a2cc:	39000262 	strb	w2, [x19]
 215a2d0:	35000063 	cbnz	w3, 215a2dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95a454>
 215a2d4:	39428e81 	ldrb	w1, [x20,#163]
 215a2d8:	12000c21 	and	w1, w1, #0xf
 215a2dc:	39400660 	ldrb	w0, [x19,#1]
 215a2e0:	33000c20 	bfxil	w0, w1, #0, #4
 215a2e4:	39000660 	strb	w0, [x19,#1]
 215a2e8:	a94153f3 	ldp	x19, x20, [sp,#16]
 215a2ec:	a8c27bfd 	ldp	x29, x30, [sp],#32
 215a2f0:	d65f03c0 	ret
 215a2f4:	d503201f 	nop
