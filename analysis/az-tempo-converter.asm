
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000216bff8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c170>:
 216bff8:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
 216bffc:	910003fd 	mov	x29, sp
 216c000:	a90153f3 	stp	x19, x20, [sp,#16]
 216c004:	aa0003f3 	mov	x19, x0
 216c008:	39400020 	ldrb	w0, [x1]
 216c00c:	aa0103f4 	mov	x20, x1
 216c010:	34000960 	cbz	w0, 216c13c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c2b4>
 216c014:	39403262 	ldrb	w2, [x19,#12]
 216c018:	29408281 	ldp	w1, w0, [x20,#4]
 216c01c:	34000842 	cbz	w2, 216c124 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c29c>
 216c020:	b9402262 	ldr	w2, [x19,#32]
 216c024:	b9402a63 	ldr	w3, [x19,#40]
 216c028:	6b01005f 	cmp	w2, w1
 216c02c:	540001a3 	b.cc	216c060 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c1d8>
 216c030:	4b010044 	sub	w4, w2, w1
 216c034:	6b03009f 	cmp	w4, w3
 216c038:	54000cc2 	b.cs	216c1d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c348>
 216c03c:	b9402661 	ldr	w1, [x19,#36]
 216c040:	6b00003f 	cmp	w1, w0
 216c044:	540001e3 	b.cc	216c080 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c1f8>
 216c048:	4b000024 	sub	w4, w1, w0
 216c04c:	6b03009f 	cmp	w4, w3
 216c050:	540004a3 	b.cc	216c0e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c25c>
 216c054:	b9402e63 	ldr	w3, [x19,#44]
 216c058:	0b030003 	add	w3, w0, w3
 216c05c:	1400000e 	b	216c094 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c20c>
 216c060:	4b020024 	sub	w4, w1, w2
 216c064:	6b03009f 	cmp	w4, w3
 216c068:	54fffea3 	b.cc	216c03c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c1b4>
 216c06c:	b9402e62 	ldr	w2, [x19,#44]
 216c070:	4b020022 	sub	w2, w1, w2
 216c074:	b9402661 	ldr	w1, [x19,#36]
 216c078:	6b00003f 	cmp	w1, w0
 216c07c:	54fffe62 	b.cs	216c048 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c1c0>
 216c080:	4b010004 	sub	w4, w0, w1
 216c084:	6b03009f 	cmp	w4, w3
 216c088:	540002e3 	b.cc	216c0e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c25c>
 216c08c:	b9402e63 	ldr	w3, [x19,#44]
 216c090:	4b030003 	sub	w3, w0, w3
 216c094:	6b03003f 	cmp	w1, w3
 216c098:	54000a20 	b.eq	216c1dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c354>
 216c09c:	2a0303e0 	mov	w0, w3
 216c0a0:	2a0203e1 	mov	w1, w2
 216c0a4:	29030a63 	stp	w3, w2, [x19,#24]
 216c0a8:	29040e62 	stp	w2, w3, [x19,#32]
 216c0ac:	6b01001f 	cmp	w0, w1
 216c0b0:	54000208 	b.hi	216c0f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c268>
 216c0b4:	4b000020 	sub	w0, w1, w0
 216c0b8:	510c0021 	sub	w1, w1, #0x300
 216c0bc:	6b01001f 	cmp	w0, w1
 216c0c0:	bd401260 	ldr	s0, [x19,#16]
 216c0c4:	540000a8 	b.hi	216c0d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c250>
 216c0c8:	1e230002 	ucvtf	s2, w0
 216c0cc:	1e230023 	ucvtf	s3, w1
 216c0d0:	1e200840 	fmul	s0, s2, s0
 216c0d4:	1e231800 	fdiv	s0, s0, s3
 216c0d8:	a94153f3 	ldp	x19, x20, [sp,#16]
 216c0dc:	a8c57bfd 	ldp	x29, x30, [sp],#80
 216c0e0:	d65f03c0 	ret
 216c0e4:	2a0103e3 	mov	w3, w1
 216c0e8:	29430660 	ldp	w0, w1, [x19,#24]
 216c0ec:	17ffffef 	b	216c0a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c220>
 216c0f0:	4b010000 	sub	w0, w0, w1
 216c0f4:	529f9fe2 	mov	w2, #0xfcff                	// #64767
 216c0f8:	4b010041 	sub	w1, w2, w1
 216c0fc:	bd401660 	ldr	s0, [x19,#20]
 216c100:	6b01001f 	cmp	w0, w1
 216c104:	54fffea8 	b.hi	216c0d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c250>
 216c108:	1e230001 	ucvtf	s1, w0
 216c10c:	1e230022 	ucvtf	s2, w1
 216c110:	a94153f3 	ldp	x19, x20, [sp,#16]
 216c114:	a8c57bfd 	ldp	x29, x30, [sp],#80
 216c118:	1e200820 	fmul	s0, s1, s0
 216c11c:	1e221800 	fdiv	s0, s0, s2
 216c120:	d65f03c0 	ret
 216c124:	29040261 	stp	w1, w0, [x19,#32]
 216c128:	52800022 	mov	w2, #0x1                   	// #1
 216c12c:	b9400681 	ldr	w1, [x20,#4]
 216c130:	39003262 	strb	w2, [x19,#12]
 216c134:	29030660 	stp	w0, w1, [x19,#24]
 216c138:	17ffffdd 	b	216c0ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c224>
 216c13c:	9100a3e0 	add	x0, sp, #0x28
 216c140:	b00022a1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 216c144:	9136a021 	add	x1, x1, #0xda8
 216c148:	94071ee6 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 216c14c:	d0006701 	adrp	x1, 2e4e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x88b1a8>
 216c150:	9100a3e0 	add	x0, sp, #0x28
 216c154:	9100c3e8 	add	x8, sp, #0x30
 216c158:	9129a021 	add	x1, x1, #0xa68
 216c15c:	94069ea5 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 216c160:	f00032e1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 216c164:	9100e3e8 	add	x8, sp, #0x38
 216c168:	91366021 	add	x1, x1, #0xd98
 216c16c:	9100c3e0 	add	x0, sp, #0x30
 216c170:	94069ea0 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 216c174:	d0006701 	adrp	x1, 2e4e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x88b1a8>
 216c178:	910103e0 	add	x0, sp, #0x40
 216c17c:	913de021 	add	x1, x1, #0xf78
 216c180:	94071ed8 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 216c184:	910103e1 	add	x1, sp, #0x40
 216c188:	910123e8 	add	x8, sp, #0x48
 216c18c:	9100e3e0 	add	x0, sp, #0x38
 216c190:	94069e40 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 216c194:	52800022 	mov	w2, #0x1                   	// #1
 216c198:	52800001 	mov	w1, #0x0                   	// #0
 216c19c:	910123e0 	add	x0, sp, #0x48
 216c1a0:	94025090 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 216c1a4:	910123e0 	add	x0, sp, #0x48
 216c1a8:	94064116 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 216c1ac:	910103e0 	add	x0, sp, #0x40
 216c1b0:	94064114 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 216c1b4:	9100e3e0 	add	x0, sp, #0x38
 216c1b8:	94064112 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 216c1bc:	9100c3e0 	add	x0, sp, #0x30
 216c1c0:	94064110 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 216c1c4:	9100a3e0 	add	x0, sp, #0x28
 216c1c8:	9406410e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 216c1cc:	17ffff92 	b	216c014 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c18c>
 216c1d0:	b9402e62 	ldr	w2, [x19,#44]
 216c1d4:	0b020022 	add	w2, w1, w2
 216c1d8:	17ffff99 	b	216c03c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c1b4>
 216c1dc:	29430660 	ldp	w0, w1, [x19,#24]
 216c1e0:	17ffffb2 	b	216c0a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c220>
 216c1e4:	aa0003f3 	mov	x19, x0
 216c1e8:	1400000a 	b	216c210 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c388>
 216c1ec:	aa0003f3 	mov	x19, x0
 216c1f0:	14000006 	b	216c208 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x96c380>
 216c1f4:	aa0003f3 	mov	x19, x0
 216c1f8:	910123e0 	add	x0, sp, #0x48
 216c1fc:	94064101 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 216c200:	910103e0 	add	x0, sp, #0x40
 216c204:	940640ff 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 216c208:	9100e3e0 	add	x0, sp, #0x38
 216c20c:	940640fd 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 216c210:	9100c3e0 	add	x0, sp, #0x30
 216c214:	940640fb 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 216c218:	9100a3e0 	add	x0, sp, #0x28
 216c21c:	940640f9 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
