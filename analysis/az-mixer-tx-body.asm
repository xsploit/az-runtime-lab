
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000215bfe0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c158>:
 215bfe0:	a9ba7bfd 	stp	x29, x30, [sp,#-96]!
 215bfe4:	910003fd 	mov	x29, sp
 215bfe8:	a90153f3 	stp	x19, x20, [sp,#16]
 215bfec:	aa0003f4 	mov	x20, x0
 215bff0:	b9400820 	ldr	w0, [x1,#8]
 215bff4:	7102001f 	cmp	w0, #0x80
 215bff8:	54000600 	b.eq	215c0b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c230>
 215bffc:	9000cee0 	adrp	x0, 3b37000 <_ZTISt11range_error@@GLIBCXX_3.4+0x12440>
 215c000:	39786001 	ldrb	w1, [x0,#3608]
 215c004:	350000c1 	cbnz	w1, 215c01c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c194>
 215c008:	52800001 	mov	w1, #0x0                   	// #0
 215c00c:	2a0103e0 	mov	w0, w1
 215c010:	a94153f3 	ldp	x19, x20, [sp,#16]
 215c014:	a8c67bfd 	ldp	x29, x30, [sp],#96
 215c018:	d65f03c0 	ret
 215c01c:	3938601f 	strb	wzr, [x0,#3608]
 215c020:	b0002321 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 215c024:	9100e3e0 	add	x0, sp, #0x38
 215c028:	9136a021 	add	x1, x1, #0xda8
 215c02c:	94075f2d 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 215c030:	d0006761 	adrp	x1, 2e4a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8871a8>
 215c034:	9112c021 	add	x1, x1, #0x4b0
 215c038:	9100e3e0 	add	x0, sp, #0x38
 215c03c:	9106a021 	add	x1, x1, #0x1a8
 215c040:	910103e8 	add	x8, sp, #0x40
 215c044:	9406deeb 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 215c048:	f0003361 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 215c04c:	910123e8 	add	x8, sp, #0x48
 215c050:	91366021 	add	x1, x1, #0xd98
 215c054:	910103e0 	add	x0, sp, #0x40
 215c058:	9406dee6 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 215c05c:	90006741 	adrp	x1, 2e44000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8811a8>
 215c060:	9100c3e0 	add	x0, sp, #0x30
 215c064:	9119c021 	add	x1, x1, #0x670
 215c068:	94075f1e 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 215c06c:	9100c3e1 	add	x1, sp, #0x30
 215c070:	910143e8 	add	x8, sp, #0x50
 215c074:	910123e0 	add	x0, sp, #0x48
 215c078:	9406de86 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 215c07c:	52800022 	mov	w2, #0x1                   	// #1
 215c080:	52800001 	mov	w1, #0x0                   	// #0
 215c084:	910143e0 	add	x0, sp, #0x50
 215c088:	940290d6 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 215c08c:	910143e0 	add	x0, sp, #0x50
 215c090:	9406815c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c094:	9100c3e0 	add	x0, sp, #0x30
 215c098:	9406815a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c09c:	910123e0 	add	x0, sp, #0x48
 215c0a0:	94068158 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c0a4:	910103e0 	add	x0, sp, #0x40
 215c0a8:	94068156 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c0ac:	9100e3e0 	add	x0, sp, #0x38
 215c0b0:	94068154 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c0b4:	17ffffd5 	b	215c008 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c180>
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
 215c1a0:	aa1503e1 	mov	x1, x21
 215c1a4:	aa1403e0 	mov	x0, x20
 215c1a8:	97ffff24 	bl	215be38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95bfb0>
 215c1ac:	f9002bf3 	str	x19, [sp,#80]
 215c1b0:	52800d01 	mov	w1, #0x68                  	// #104
 215c1b4:	910143e0 	add	x0, sp, #0x50
 215c1b8:	b9005be1 	str	w1, [sp,#88]
 215c1bc:	97fff7b7 	bl	215a098 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95a210>
 215c1c0:	7900d260 	strh	w0, [x19,#104]
 215c1c4:	52800021 	mov	w1, #0x1                   	// #1
 215c1c8:	2a0103e0 	mov	w0, w1
 215c1cc:	a94153f3 	ldp	x19, x20, [sp,#16]
 215c1d0:	f94013f5 	ldr	x21, [sp,#32]
 215c1d4:	a8c67bfd 	ldp	x29, x30, [sp],#96
 215c1d8:	d65f03c0 	ret
 215c1dc:	39428e83 	ldrb	w3, [x20,#163]
 215c1e0:	12000c63 	and	w3, w3, #0xf
 215c1e4:	17ffffd4 	b	215c134 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c2ac>
 215c1e8:	910123e0 	add	x0, sp, #0x48
 215c1ec:	b0002321 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 215c1f0:	9136a021 	add	x1, x1, #0xda8
 215c1f4:	94075ebb 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 215c1f8:	d0006761 	adrp	x1, 2e4a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8871a8>
 215c1fc:	9112c021 	add	x1, x1, #0x4b0
 215c200:	910123e0 	add	x0, sp, #0x48
 215c204:	910103e8 	add	x8, sp, #0x40
 215c208:	910c0021 	add	x1, x1, #0x300
 215c20c:	9406de79 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 215c210:	9100e3e8 	add	x8, sp, #0x38
 215c214:	910103e0 	add	x0, sp, #0x40
 215c218:	f0003361 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 215c21c:	91366021 	add	x1, x1, #0xd98
 215c220:	9406de74 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 215c224:	910143e0 	add	x0, sp, #0x50
 215c228:	f0002381 	adrp	x1, 25cf000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xc1a8>
 215c22c:	9124a021 	add	x1, x1, #0x928
 215c230:	94075eac 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 215c234:	9100c3e8 	add	x8, sp, #0x30
 215c238:	910143e1 	add	x1, sp, #0x50
 215c23c:	9100e3e0 	add	x0, sp, #0x38
 215c240:	9406de14 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 215c244:	52800022 	mov	w2, #0x1                   	// #1
 215c248:	52800001 	mov	w1, #0x0                   	// #0
 215c24c:	9100c3e0 	add	x0, sp, #0x30
 215c250:	94029064 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 215c254:	9100c3e0 	add	x0, sp, #0x30
 215c258:	940680ea 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c25c:	910143e0 	add	x0, sp, #0x50
 215c260:	940680e8 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c264:	9100e3e0 	add	x0, sp, #0x38
 215c268:	940680e6 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c26c:	910103e0 	add	x0, sp, #0x40
 215c270:	940680e4 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c274:	910123e0 	add	x0, sp, #0x48
 215c278:	940680e2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c27c:	17ffff63 	b	215c008 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c180>
 215c280:	aa0003f3 	mov	x19, x0
 215c284:	910143e0 	add	x0, sp, #0x50
 215c288:	940680de 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c28c:	9100c3e0 	add	x0, sp, #0x30
 215c290:	940680dc 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c294:	910123e0 	add	x0, sp, #0x48
 215c298:	940680da 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c29c:	910103e0 	add	x0, sp, #0x40
 215c2a0:	940680d8 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c2a4:	9100e3e0 	add	x0, sp, #0x38
 215c2a8:	f90013f5 	str	x21, [sp,#32]
 215c2ac:	940680d5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 215c2b0:	aa1303e0 	mov	x0, x19
 215c2b4:	978b2297 	bl	424d10 <_Unwind_Resume@plt>
 215c2b8:	aa0003f3 	mov	x19, x0
 215c2bc:	17fffffa 	b	215c2a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c41c>
 215c2c0:	aa0003f3 	mov	x19, x0
 215c2c4:	17fffff6 	b	215c29c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c414>
 215c2c8:	aa0003f3 	mov	x19, x0
 215c2cc:	17fffff2 	b	215c294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c40c>
 215c2d0:	aa0003f3 	mov	x19, x0
 215c2d4:	17ffffee 	b	215c28c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c404>
 215c2d8:	a9b57bfd 	stp	x29, x30, [sp,#-176]!
 215c2dc:	910003fd 	mov	x29, sp
 215c2e0:	a90363f7 	stp	x23, x24, [sp,#48]
 215c2e4:	aa0003f7 	mov	x23, x0
 215c2e8:	a90153f3 	stp	x19, x20, [sp,#16]
 215c2ec:	aa0003f3 	mov	x19, x0
 215c2f0:	aa0103f4 	mov	x20, x1
 215c2f4:	a9025bf5 	stp	x21, x22, [sp,#32]
 215c2f8:	d0006760 	adrp	x0, 2e4a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8871a8>
 215c2fc:	91124000 	add	x0, x0, #0x490
 215c300:	a9046bf9 	stp	x25, x26, [sp,#64]
 215c304:	12001c55 	and	w21, w2, #0xff
 215c308:	a90573fb 	stp	x27, x28, [sp,#80]
 215c30c:	f80086e0 	str	x0, [x23],#8
 215c310:	aa1703e0 	mov	x0, x23
 215c314:	94000793 	bl	215e160 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95e2d8>
 215c318:	a9400281 	ldp	x1, x0, [x20]
 215c31c:	a9070261 	stp	x1, x0, [x19,#112]
 215c320:	b4000120 	cbz	x0, 215c344 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c4bc>
 215c324:	d0006761 	adrp	x1, 2e4a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8871a8>
 215c328:	f944f021 	ldr	x1, [x1,#2528]
 215c32c:	b40017c1 	cbz	x1, 215c624 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c79c>
 215c330:	91002000 	add	x0, x0, #0x8
 215c334:	885ffc01 	ldaxr	w1, [x0]
 215c338:	11000421 	add	w1, w1, #0x1
 215c33c:	8802fc01 	stlxr	w2, w1, [x0]
 215c340:	35ffffa2 	cbnz	w2, 215c334 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c4ac>
 215c344:	91022279 	add	x25, x19, #0x88
 215c348:	d0006760 	adrp	x0, 2e4a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8871a8>
 215c34c:	91108000 	add	x0, x0, #0x420
 215c350:	39020275 	strb	w21, [x19,#128]
 215c354:	f9004660 	str	x0, [x19,#136]
 215c358:	d0006760 	adrp	x0, 2e4a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8871a8>
 215c35c:	9111a000 	add	x0, x0, #0x468
 215c360:	f9000720 	str	x0, [x25,#8]
 215c364:	f9004e7f 	str	xzr, [x19,#152]
 215c368:	b000d2b5 	adrp	x21, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 215c36c:	b900a27f 	str	wzr, [x19,#160]
 215c370:	912ca2b5 	add	x21, x21, #0xb28
 215c374:	3900733f 	strb	wzr, [x25,#28]
 215c378:	08dffea0 	ldarb	w0, [x21]
 215c37c:	360015c0 	tbz	w0, #0, 215c634 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c7ac>
 215c380:	b000d2bc 	adrp	x28, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 215c384:	912d6398 	add	x24, x28, #0xb58
 215c388:	52800156 	mov	w22, #0xa                   	// #10
 215c38c:	12800014 	mov	w20, #0xffffffff            	// #-1
 215c390:	885fff00 	ldaxr	w0, [x24]
 215c394:	35000060 	cbnz	w0, 215c3a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c518>
 215c398:	8801ff14 	stlxr	w1, w20, [x24]
 215c39c:	35ffffa1 	cbnz	w1, 215c390 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c508>
 215c3a0:	7100001f 	cmp	w0, #0x0
 215c3a4:	540025c1 	b.ne	215c85c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c9d4>
 215c3a8:	5280003b 	mov	w27, #0x1                   	// #1
 215c3ac:	08dffea0 	ldarb	w0, [x21]
 215c3b0:	36001760 	tbz	w0, #0, 215c69c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c814>
 215c3b4:	b000d2b4 	adrp	x20, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 215c3b8:	912cc294 	add	x20, x20, #0xb30
 215c3bc:	d29cebc0 	mov	x0, #0xe75e                	// #59230
 215c3c0:	b9801a81 	ldrsw	x1, [x20,#24]
 215c3c4:	f2bd07c0 	movk	x0, #0xe83e, lsl #16
 215c3c8:	f2c62e60 	movk	x0, #0x3173, lsl #32
 215c3cc:	f2e026e0 	movk	x0, #0x137, lsl #48
 215c3d0:	f9400682 	ldr	x2, [x20,#8]
 215c3d4:	9ac10816 	udiv	x22, x0, x1
 215c3d8:	9b0182d6 	msub	x22, x22, x1, x0
 215c3dc:	93407eda 	sxtw	x26, w22
 215c3e0:	f87a7855 	ldr	x21, [x2,x26,lsl #3]
 215c3e4:	b40002d5 	cbz	x21, 215c43c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c5b4>
 215c3e8:	f94002a1 	ldr	x1, [x21]
 215c3ec:	eb00003f 	cmp	x1, x0
 215c3f0:	54000620 	b.eq	215c4b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c62c>
 215c3f4:	aa1503e1 	mov	x1, x21
 215c3f8:	14000004 	b	215c408 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c580>
 215c3fc:	f9400022 	ldr	x2, [x1]
 215c400:	eb00005f 	cmp	x2, x0
 215c404:	54000580 	b.eq	215c4b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c62c>
 215c408:	f9400821 	ldr	x1, [x1,#16]
 215c40c:	b5ffff81 	cbnz	x1, 215c3fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c574>
 215c410:	d29cebc2 	mov	x2, #0xe75e                	// #59230
 215c414:	aa1503e0 	mov	x0, x21
 215c418:	f2bd07c2 	movk	x2, #0xe83e, lsl #16
 215c41c:	f2c62e62 	movk	x2, #0x3173, lsl #32
 215c420:	f2e026e2 	movk	x2, #0x137, lsl #48
 215c424:	14000004 	b	215c434 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c5ac>
 215c428:	f9400001 	ldr	x1, [x0]
 215c42c:	eb02003f 	cmp	x1, x2
 215c430:	540016a0 	b.eq	215c704 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c87c>
 215c434:	f9400800 	ldr	x0, [x0,#16]
 215c438:	b5ffff80 	cbnz	x0, 215c428 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c5a0>
 215c43c:	d2800300 	mov	x0, #0x18                  	// #24
 215c440:	978b2240 	bl	424d40 <_Znwm@plt>
 215c444:	aa0003f7 	mov	x23, x0
 215c448:	d0006760 	adrp	x0, 2e4a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8871a8>
 215c44c:	b9401a93 	ldr	w19, [x20,#24]
 215c450:	f944ec00 	ldr	x0, [x0,#2520]
 215c454:	a9007ee0 	stp	x0, xzr, [x23]
 215c458:	6b16027f 	cmp	w19, w22
 215c45c:	f9000af5 	str	x21, [x23,#16]
 215c460:	54001589 	b.ls	215c710 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c888>
 215c464:	f9400680 	ldr	x0, [x20,#8]
 215c468:	f83a7817 	str	x23, [x0,x26,lsl #3]
 215c46c:	531f7a76 	lsl	w22, w19, #1
 215c470:	b9402280 	ldr	w0, [x20,#32]
 215c474:	0b1302c1 	add	w1, w22, w19
 215c478:	11000400 	add	w0, w0, #0x1
 215c47c:	b9002280 	str	w0, [x20,#32]
 215c480:	0b417c22 	add	w2, w1, w1, lsr #31
 215c484:	6b82041f 	cmp	w0, w2, asr #1
 215c488:	5400176c 	b.gt	215c774 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c8ec>
 215c48c:	910022e0 	add	x0, x23, #0x8
 215c490:	f9000019 	str	x25, [x0]
 215c494:	3500067b 	cbnz	w27, 215c560 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95c6d8>
 215c498:	a94153f3 	ldp	x19, x20, [sp,#16]
 215c49c:	a9425bf5 	ldp	x21, x22, [sp,#32]
 215c4a0:	a94363f7 	ldp	x23, x24, [sp,#48]
 215c4a4:	a9446bf9 	ldp	x25, x26, [sp,#64]
 215c4a8:	a94573fb 	ldp	x27, x28, [sp,#80]
 215c4ac:	a8cb7bfd 	ldp	x29, x30, [sp],#176
 215c4b0:	d65f03c0 	ret
 215c4b4:	910243f5 	add	x21, sp, #0x90
 215c4b8:	b0002321 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 215c4bc:	aa1503e0 	mov	x0, x21
 215c4c0:	9136a021 	add	x1, x1, #0xda8
 215c4c4:	94075e07 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 215c4c8:	d0006761 	adrp	x1, 2e4a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8871a8>
 215c4cc:	910263f6 	add	x22, sp, #0x98
 215c4d0:	9112c021 	add	x1, x1, #0x4b0
 215c4d4:	aa1603e8 	mov	x8, x22
 215c4d8:	91112021 	add	x1, x1, #0x448
 215c4dc:	aa1503e0 	mov	x0, x21
 215c4e0:	9406ddc4 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 215c4e4:	910283f9 	add	x25, sp, #0xa0
 215c4e8:	f0003361 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 215c4ec:	aa1903e8 	mov	x8, x25
 215c4f0:	91366021 	add	x1, x1, #0xd98
 215c4f4:	aa1603e0 	mov	x0, x22
 215c4f8:	9406ddbe 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 215c4fc:	910223fa 	add	x26, sp, #0x88
