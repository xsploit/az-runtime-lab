
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
