
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000215c0b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c230>:
 215c0b8:	f9400033 	ldr	x19, [x1]
 215c0bc:	b4000973 	cbz	x19, 215c1e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c360>
 215c0c0:	f90013f5 	str	x21, [sp,#32]
 215c0c4:	52800000 	mov	w0, #0x0                   	// #0
 215c0c8:	a9007e7f 	stp	xzr, xzr, [x19]
 215c0cc:	a9017e7f 	stp	xzr, xzr, [x19,#16]
 215c0d0:	a9027e7f 	stp	xzr, xzr, [x19,#32]
 215c0d4:	a9037e7f 	stp	xzr, xzr, [x19,#48]
 215c0d8:	a9047e7f 	stp	xzr, xzr, [x19,#64]
 215c0dc:	a9057e7f 	stp	xzr, xzr, [x19,#80]
 215c0e0:	a9067e7f 	stp	xzr, xzr, [x19,#96]
 215c0e4:	a9077e7f 	stp	xzr, xzr, [x19,#112]
 215c0e8:	39429281 	ldrb	w1, [x20,#164]
 215c0ec:	33190020 	bfi	w0, w1, #7, #1
 215c0f0:	39000260 	strb	w0, [x19]
 215c0f4:	9400c50f 	bl	218d530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x5418>
 215c0f8:	39400261 	ldrb	w1, [x19]
 215c0fc:	52800043 	mov	w3, #0x2                   	// #2
 215c100:	39420282 	ldrb	w2, [x20,#128]
 215c104:	331b0001 	bfi	w1, w0, #5, #1
 215c108:	39000261 	strb	w1, [x19]
 215c10c:	39428280 	ldrb	w0, [x20,#160]
 215c110:	33000001 	bfxil	w1, w0, #0, #1
 215c114:	39000261 	strb	w1, [x19]
 215c118:	39428680 	ldrb	w0, [x20,#161]
 215c11c:	331e0001 	bfi	w1, w0, #2, #1
 215c120:	39000261 	strb	w1, [x19]
 215c124:	39428a80 	ldrb	w0, [x20,#162]
 215c128:	331c0001 	bfi	w1, w0, #4, #1
 215c12c:	39000261 	strb	w1, [x19]
 215c130:	34000562 	cbz	w2, 215c1dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c354>
 215c134:	39400662 	ldrb	w2, [x19,#1]
 215c138:	91001261 	add	x1, x19, #0x4
 215c13c:	aa1403e0 	mov	x0, x20
 215c140:	91009275 	add	x21, x19, #0x24
 215c144:	33000c62 	bfxil	w2, w3, #0, #4
 215c148:	39000662 	strb	w2, [x19,#1]
 215c14c:	97fff86b 	bl	215a2f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95a470>
 215c150:	f9403a82 	ldr	x2, [x20,#112]
 215c154:	91006261 	add	x1, x19, #0x18
 215c158:	aa1403e0 	mov	x0, x20
 215c15c:	9114c042 	add	x2, x2, #0x530
 215c160:	39402444 	ldrb	w4, [x2,#9]
 215c164:	39004264 	strb	w4, [x19,#16]
 215c168:	39402044 	ldrb	w4, [x2,#8]
 215c16c:	39004664 	strb	w4, [x19,#17]
 215c170:	39402842 	ldrb	w2, [x2,#10]
 215c174:	39004a62 	strb	w2, [x19,#18]
 215c178:	97fff8ca 	bl	215a4a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95a618>
 215c17c:	f9403a83 	ldr	x3, [x20,#112]
 215c180:	aa1503e1 	mov	x1, x21
 215c184:	39409a62 	ldrb	w2, [x19,#38]
 215c188:	aa1403e0 	mov	x0, x20
 215c18c:	39406463 	ldrb	w3, [x3,#25]
 215c190:	331e0062 	bfi	w2, w3, #2, #1
 215c194:	331d0062 	bfi	w2, w3, #3, #1
 215c198:	39009a62 	strb	w2, [x19,#38]
 215c19c:	97fffef7 	bl	215bd78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95bef0>
