
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002021258 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8213d0>:
 2021258:	a9b97bfd 	stp	x29, x30, [sp,#-112]!
 202125c:	910003fd 	mov	x29, sp
 2021260:	a90153f3 	stp	x19, x20, [sp,#16]
 2021264:	a9025bf5 	stp	x21, x22, [sp,#32]
 2021268:	a90363f7 	stp	x23, x24, [sp,#48]
 202126c:	91006001 	add	x1, x0, #0x18
 2021270:	c8dffc34 	ldar	x20, [x1]
 2021274:	b4000814 	cbz	x20, 2021374 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8214ec>
 2021278:	f9400281 	ldr	x1, [x20]
 202127c:	aa0003f3 	mov	x19, x0
 2021280:	aa1403e0 	mov	x0, x20
 2021284:	f9400c21 	ldr	x1, [x1,#24]
 2021288:	f90023f9 	str	x25, [sp,#64]
 202128c:	d63f0020 	blr	x1
 2021290:	f90033e0 	str	x0, [sp,#96]
 2021294:	f9400281 	ldr	x1, [x20]
 2021298:	2a0003f8 	mov	w24, w0
 202129c:	d3609c16 	ubfx	x22, x0, #32, #8
 20212a0:	d368bc19 	ubfx	x25, x0, #40, #8
 20212a4:	d370dc15 	ubfx	x21, x0, #48, #8
 20212a8:	aa1403e0 	mov	x0, x20
 20212ac:	f9401021 	ldr	x1, [x1,#32]
 20212b0:	d63f0020 	blr	x1
 20212b4:	12001c17 	and	w23, w0, #0xff
 20212b8:	39408263 	ldrb	w3, [x19,#32]
 20212bc:	340002c3 	cbz	w3, 2021314 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x82148c>
 20212c0:	2a1902d3 	orr	w19, w22, w25
 20212c4:	2a1302b3 	orr	w19, w21, w19
 20212c8:	340007f3 	cbz	w19, 20213c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x82153c>
 20212cc:	2a1503e3 	mov	w3, w21
 20212d0:	2a1603e1 	mov	w1, w22
 20212d4:	2a1903e2 	mov	w2, w25
 20212d8:	910163e0 	add	x0, sp, #0x58
 20212dc:	940e0f69 	bl	23a5080 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2fc60>
 20212e0:	52800033 	mov	w19, #0x1                   	// #1
 20212e4:	7100071f 	cmp	w24, #0x1
 20212e8:	39416bf6 	ldrb	w22, [sp,#90]
 20212ec:	394167f5 	ldrb	w21, [sp,#89]
 20212f0:	394163f4 	ldrb	w20, [sp,#88]
 20212f4:	54000080 	b.eq	2021304 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x82147c>
 20212f8:	71000b1f 	cmp	w24, #0x2
 20212fc:	1a9f17f3 	cset	w19, eq
 2021300:	531f7a73 	lsl	w19, w19, #1
 2021304:	910163e0 	add	x0, sp, #0x58
 2021308:	940dfafa 	bl	239fef0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2aad0>
 202130c:	f94023f9 	ldr	x25, [sp,#64]
 2021310:	1400000a 	b	2021338 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8214b0>
 2021314:	7100071f 	cmp	w24, #0x1
 2021318:	540004a0 	b.eq	20213ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821524>
 202131c:	71000b1f 	cmp	w24, #0x2
 2021320:	52800053 	mov	w19, #0x2                   	// #2
 2021324:	f94023f9 	ldr	x25, [sp,#64]
 2021328:	1a9f0273 	csel	w19, w19, wzr, eq
 202132c:	52800014 	mov	w20, #0x0                   	// #0
 2021330:	52800015 	mov	w21, #0x0                   	// #0
 2021334:	52800016 	mov	w22, #0x0                   	// #0
 2021338:	390183f3 	strb	w19, [sp,#96]
 202133c:	d2800000 	mov	x0, #0x0                   	// #0
 2021340:	390187f6 	strb	w22, [sp,#97]
 2021344:	92401ee1 	and	x1, x23, #0xff
 2021348:	39018bf5 	strb	w21, [sp,#98]
 202134c:	39018ff4 	strb	w20, [sp,#99]
 2021350:	390193ff 	strb	wzr, [sp,#100]
 2021354:	a94153f3 	ldp	x19, x20, [sp,#16]
 2021358:	294c0be3 	ldp	w3, w2, [sp,#96]
 202135c:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2021360:	b3407c60 	bfxil	x0, x3, #0, #32
 2021364:	a94363f7 	ldp	x23, x24, [sp,#48]
 2021368:	b3607c40 	bfi	x0, x2, #32, #32
 202136c:	a8c77bfd 	ldp	x29, x30, [sp],#112
 2021370:	d65f03c0 	ret
 2021374:	39408000 	ldrb	w0, [x0,#32]
 2021378:	350000e0 	cbnz	w0, 2021394 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x82150c>
 202137c:	52800017 	mov	w23, #0x0                   	// #0
 2021380:	52800014 	mov	w20, #0x0                   	// #0
 2021384:	52800015 	mov	w21, #0x0                   	// #0
 2021388:	52800016 	mov	w22, #0x0                   	// #0
 202138c:	52800013 	mov	w19, #0x0                   	// #0
 2021390:	17ffffea 	b	2021338 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8214b0>
 2021394:	52801ff4 	mov	w20, #0xff                  	// #255
 2021398:	52800017 	mov	w23, #0x0                   	// #0
 202139c:	2a1403f5 	mov	w21, w20
 20213a0:	2a1403f6 	mov	w22, w20
 20213a4:	52800013 	mov	w19, #0x0                   	// #0
 20213a8:	17ffffe4 	b	2021338 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8214b0>
 20213ac:	2a1803f3 	mov	w19, w24
 20213b0:	52800014 	mov	w20, #0x0                   	// #0
 20213b4:	52800015 	mov	w21, #0x0                   	// #0
 20213b8:	52800016 	mov	w22, #0x0                   	// #0
 20213bc:	f94023f9 	ldr	x25, [sp,#64]
 20213c0:	17ffffde 	b	2021338 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8214b0>
 20213c4:	7100071f 	cmp	w24, #0x1
 20213c8:	54000100 	b.eq	20213e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821560>
 20213cc:	71000b1f 	cmp	w24, #0x2
 20213d0:	540000c0 	b.eq	20213e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821560>
 20213d4:	52801ff4 	mov	w20, #0xff                  	// #255
 20213d8:	2a1403f5 	mov	w21, w20
 20213dc:	2a1403f6 	mov	w22, w20
 20213e0:	f94023f9 	ldr	x25, [sp,#64]
 20213e4:	17ffffd5 	b	2021338 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8214b0>
 20213e8:	2a1803f3 	mov	w19, w24
 20213ec:	17fffffa 	b	20213d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x82154c>
