
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 19bd488: a9b87bfd     	stp	x29, x30, [sp, #-0x80]!
 19bd48c: 910003fd     	mov	x29, sp
 19bd490: a9025bf5     	stp	x21, x22, [sp, #0x20]
 19bd494: aa0103f5     	mov	x21, x1
 19bd498: 9282e3e1     	mov	x1, #-0x1720            // =-5920
 19bd49c: a90153f3     	stp	x19, x20, [sp, #0x10]
 19bd4a0: aa0003f3     	mov	x19, x0
 19bd4a4: 8b010000     	add	x0, x0, x1
 19bd4a8: 942b148a     	bl	0x24826d0 <_ZNSt8functionIFvvEEC2ERKS1_+0x10d2b0>
 19bd4ac: 72001c1f     	tst	w0, #0xff
 19bd4b0: 540000a1     	b.ne	0x19bd4c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1bd63c>
 19bd4b4: a94153f3     	ldp	x19, x20, [sp, #0x10]
 19bd4b8: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 19bd4bc: a8c87bfd     	ldp	x29, x30, [sp], #0x80
 19bd4c0: d65f03c0     	ret
 19bd4c4: f9400e74     	ldr	x20, [x19, #0x18]
 19bd4c8: b4000154     	cbz	x20, 0x19bd4f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1bd668>
 19bd4cc: f9400282     	ldr	x2, [x20]
 19bd4d0: aa1503e1     	mov	x1, x21
 19bd4d4: aa1403e0     	mov	x0, x20
 19bd4d8: f9400842     	ldr	x2, [x2, #0x10]
 19bd4dc: d63f0040     	blr	x2
 19bd4e0: a94153f3     	ldp	x19, x20, [sp, #0x10]
 19bd4e4: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 19bd4e8: a8c87bfd     	ldp	x29, x30, [sp], #0x80
 19bd4ec: d65f03c0     	ret
 19bd4f0: f9401260     	ldr	x0, [x19, #0x20]
 19bd4f4: b4fffec0     	cbz	x0, 0x19bd4cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1bd644>
 19bd4f8: a90363f7     	stp	x23, x24, [sp, #0x30]
 19bd4fc: 90010c37     	adrp	x23, 0x3b41000 <_ZSt4cerr+0x68>
 19bd500: 9123e2f7     	add	x23, x23, #0x8f8
 19bd504: 08dffee0     	ldarb	w0, [x23]
 19bd508: 36000e20     	tbz	w0, #0x0, 0x19bd6cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1bd844>
 19bd50c: 90010c36     	adrp	x22, 0x3b41000 <_ZSt4cerr+0x68>
 19bd510: 912402d6     	add	x22, x22, #0x900
 19bd514: b9801ac1     	ldrsw	x1, [x22, #0x18]
 19bd518: f9401262     	ldr	x2, [x19, #0x20]
 19bd51c: f94006c3     	ldr	x3, [x22, #0x8]
 19bd520: 9ac10840     	udiv	x0, x2, x1
 19bd524: 9b018800     	msub	x0, x0, x1, x2
 19bd528: f860d860     	ldr	x0, [x3, w0, sxtw #3]
 19bd52c: b4000140     	cbz	x0, 0x19bd554 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1bd6cc>
 19bd530: f9400001     	ldr	x1, [x0]
 19bd534: eb02003f     	cmp	x1, x2
 19bd538: 540000a1     	b.ne	0x19bd54c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1bd6c4>
 19bd53c: 14000035     	b	0x19bd610 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1bd788>
 19bd540: f9400001     	ldr	x1, [x0]
 19bd544: eb01005f     	cmp	x2, x1
 19bd548: 54000640     	b.eq	0x19bd610 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1bd788>
 19bd54c: f9400800     	ldr	x0, [x0, #0x10]
 19bd550: b5ffff80     	cbnz	x0, 0x19bd540 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1bd6b8>
 19bd554: 910183f6     	add	x22, sp, #0x60
 19bd558: 90006021     	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 19bd55c: aa1603e0     	mov	x0, x22
 19bd560: 9136a021     	add	x1, x1, #0xda8
 19bd564: 9425d9df     	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 19bd568: 9101a3f7     	add	x23, sp, #0x68
 19bd56c: d00080e1     	adrp	x1, 0x29db000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4181a8>
 19bd570: 91148021     	add	x1, x1, #0x520
 19bd574: 9100a021     	add	x1, x1, #0x28
 19bd578: aa1603e0     	mov	x0, x22
 19bd57c: aa1703e8     	mov	x8, x23
 19bd580: 9425599c     	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 19bd584: 9101c3f8     	add	x24, sp, #0x70
 19bd588: d0007061     	adrp	x1, 0x27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x2081a8>
 19bd58c: aa1803e8     	mov	x8, x24
 19bd590: 91366021     	add	x1, x1, #0xd98
 19bd594: aa1703e0     	mov	x0, x23
 19bd598: 94255996     	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 19bd59c: a9046bf9     	stp	x25, x26, [sp, #0x40]
 19bd5a0: 910163f9     	add	x25, sp, #0x58
 19bd5a4: b0006021     	adrp	x1, 0x25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x14d0>
 19bd5a8: aa1903e0     	mov	x0, x25
 19bd5ac: 912e6021     	add	x1, x1, #0xb98
 19bd5b0: 9425d9cc     	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 19bd5b4: 9101e3fa     	add	x26, sp, #0x78
 19bd5b8: aa1903e1     	mov	x1, x25
 19bd5bc: aa1a03e8     	mov	x8, x26
 19bd5c0: aa1803e0     	mov	x0, x24
 19bd5c4: 94255933     	bl	0x2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18b978>
 19bd5c8: 52800022     	mov	w2, #0x1                // =1
 19bd5cc: 52800001     	mov	w1, #0x0                // =0
 19bd5d0: aa1a03e0     	mov	x0, x26
 19bd5d4: 94210b83     	bl	0x22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x782c8>
 19bd5d8: aa1a03e0     	mov	x0, x26
 19bd5dc: 9424fc09     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 19bd5e0: aa1903e0     	mov	x0, x25
 19bd5e4: 9424fc07     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 19bd5e8: aa1803e0     	mov	x0, x24
 19bd5ec: 9424fc05     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 19bd5f0: aa1703e0     	mov	x0, x23
 19bd5f4: 9424fc03     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 19bd5f8: aa1603e0     	mov	x0, x22
 19bd5fc: 9424fc01     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 19bd600: f9400e74     	ldr	x20, [x19, #0x18]
 19bd604: a94363f7     	ldp	x23, x24, [sp, #0x30]
 19bd608: a9446bf9     	ldp	x25, x26, [sp, #0x40]
 19bd60c: 17ffffb0     	b	0x19bd4cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1bd644>
 19bd610: f9400416     	ldr	x22, [x0, #0x8]
 19bd614: b4fffa16     	cbz	x22, 0x19bd554 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1bd6cc>
 19bd618: f0010e37     	adrp	x23, 0x3b84000 <stdout+0x42f40>
 19bd61c: 9121c2f7     	add	x23, x23, #0x870
 19bd620: 08dffee0     	ldarb	w0, [x23]
 19bd624: 36000860     	tbz	w0, #0x0, 0x19bd730 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1bd8a8>
 19bd628: 08dffee0     	ldarb	w0, [x23]
 19bd62c: 36000b60     	tbz	w0, #0x0, 0x19bd798 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1bd910>
