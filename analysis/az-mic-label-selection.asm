
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000001ceaee0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4eb058>:
 1ceaee0:	aa0203e0 	mov	x0, x2
 1ceaee4:	941e75a3 	bl	2488570 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x113150>
 1ceaee8:	f9400260 	ldr	x0, [x19]
 1ceaeec:	f9409800 	ldr	x0, [x0,#304]
 1ceaef0:	17ffffd6 	b	1ceae48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4eafc0>
 1ceaef4:	aa0003f3 	mov	x19, x0
 1ceaef8:	9100a3e0 	add	x0, sp, #0x28
 1ceaefc:	941845c1 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1ceaf00:	aa1303e0 	mov	x0, x19
 1ceaf04:	979ce783 	bl	424d10 <_Unwind_Resume@plt>
 1ceaf08:	91008001 	add	x1, x0, #0x20
 1ceaf0c:	91006000 	add	x0, x0, #0x18
 1ceaf10:	17ffffa8 	b	1ceadb0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4eaf28>
 1ceaf14:	d503201f 	nop
 1ceaf18:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 1ceaf1c:	910003fd 	mov	x29, sp
 1ceaf20:	a90153f3 	stp	x19, x20, [sp,#16]
 1ceaf24:	aa0003f4 	mov	x20, x0
 1ceaf28:	aa0103f3 	mov	x19, x1
 1ceaf2c:	910083e0 	add	x0, sp, #0x20
 1ceaf30:	f00046a1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 1ceaf34:	91352021 	add	x1, x1, #0xd48
 1ceaf38:	9419236a 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 1ceaf3c:	b9400280 	ldr	w0, [x20]
 1ceaf40:	7100041f 	cmp	w0, #0x1
 1ceaf44:	54000560 	b.eq	1ceaff0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4eb168>
 1ceaf48:	7100081f 	cmp	w0, #0x2
 1ceaf4c:	540003e0 	b.eq	1ceafc8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4eb140>
 1ceaf50:	34000280 	cbz	w0, 1ceafa0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4eb118>
 1ceaf54:	f9400260 	ldr	x0, [x19]
 1ceaf58:	394b8001 	ldrb	w1, [x0,#736]
 1ceaf5c:	f9409800 	ldr	x0, [x0,#304]
 1ceaf60:	35000121 	cbnz	w1, 1ceaf84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4eb0fc>
 1ceaf64:	910083e2 	add	x2, sp, #0x20
 1ceaf68:	52800281 	mov	w1, #0x14                  	// #20
 1ceaf6c:	9401057f 	bl	1d2c568 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x52c6e0>
 1ceaf70:	f9400261 	ldr	x1, [x19]
 1ceaf74:	a9528022 	ldp	x2, x0, [x1,#296]
 1ceaf78:	f940a041 	ldr	x1, [x2,#320]
 1ceaf7c:	eb00003f 	cmp	x1, x0
 1ceaf80:	540004c0 	b.eq	1ceb018 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4eb190>
 1ceaf84:	910083e1 	add	x1, sp, #0x20
 1ceaf88:	9401057a 	bl	1d2c570 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x52c6e8>
 1ceaf8c:	910083e0 	add	x0, sp, #0x20
 1ceaf90:	9418459c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1ceaf94:	a94153f3 	ldp	x19, x20, [sp,#16]
 1ceaf98:	a8c47bfd 	ldp	x29, x30, [sp],#64
 1ceaf9c:	d65f03c0 	ret
 1ceafa0:	b0007d41 	adrp	x1, 2c93000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x6d01a8>
 1ceafa4:	9100e3e0 	add	x0, sp, #0x38
 1ceafa8:	91166021 	add	x1, x1, #0x598
 1ceafac:	9419234d 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 1ceafb0:	9100e3e1 	add	x1, sp, #0x38
 1ceafb4:	910083e0 	add	x0, sp, #0x20
 1ceafb8:	941893b6 	bl	230fe90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187d78>
 1ceafbc:	9100e3e0 	add	x0, sp, #0x38
 1ceafc0:	94184590 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1ceafc4:	17ffffe4 	b	1ceaf54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4eb0cc>
 1ceafc8:	b0007d41 	adrp	x1, 2c93000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x6d01a8>
 1ceafcc:	9100a3e0 	add	x0, sp, #0x28
 1ceafd0:	9116a021 	add	x1, x1, #0x5a8
 1ceafd4:	94192343 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 1ceafd8:	9100a3e1 	add	x1, sp, #0x28
 1ceafdc:	910083e0 	add	x0, sp, #0x20
 1ceafe0:	941893ac 	bl	230fe90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187d78>
 1ceafe4:	9100a3e0 	add	x0, sp, #0x28
 1ceafe8:	94184586 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1ceafec:	17ffffda 	b	1ceaf54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4eb0cc>
 1ceaff0:	b0007d41 	adrp	x1, 2c93000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x6d01a8>
 1ceaff4:	9100c3e0 	add	x0, sp, #0x30
 1ceaff8:	91168021 	add	x1, x1, #0x5a0
 1ceaffc:	94192339 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 1ceb000:	9100c3e1 	add	x1, sp, #0x30
 1ceb004:	910083e0 	add	x0, sp, #0x20
 1ceb008:	941893a2 	bl	230fe90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187d78>
 1ceb00c:	9100c3e0 	add	x0, sp, #0x30
 1ceb010:	9418457c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 1ceb014:	17ffffd0 	b	1ceaf54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4eb0cc>
 1ceb018:	aa0203e0 	mov	x0, x2
 1ceb01c:	941e7555 	bl	2488570 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x113150>
 1ceb020:	f9400260 	ldr	x0, [x19]
 1ceb024:	f9409800 	ldr	x0, [x0,#304]
 1ceb028:	17ffffd7 	b	1ceaf84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x4eb0fc>
 1ceb02c:	aa0003f3 	mov	x19, x0
