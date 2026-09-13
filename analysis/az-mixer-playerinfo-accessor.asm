
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002130088 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930200>:
 2130088:	39582001 	ldrb	w1, [x0,#1544]
 213008c:	34000041 	cbz	w1, 2130094 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93020c>
 2130090:	39582401 	ldrb	w1, [x0,#1545]
 2130094:	2a0103e0 	mov	w0, w1
 2130098:	d65f03c0 	ret
 213009c:	d503201f 	nop
 21300a0:	39002001 	strb	w1, [x0,#8]
 21300a4:	d65f03c0 	ret
 21300a8:	39002401 	strb	w1, [x0,#9]
 21300ac:	d65f03c0 	ret
 21300b0:	39002801 	strb	w1, [x0,#10]
 21300b4:	d65f03c0 	ret
 21300b8:	b9400c02 	ldr	w2, [x0,#12]
 21300bc:	12001c21 	and	w1, w1, #0xff
 21300c0:	7100045f 	cmp	w2, #0x1
 21300c4:	5400006d 	b.le	21300d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930248>
 21300c8:	39002401 	strb	w1, [x0,#9]
 21300cc:	d65f03c0 	ret
 21300d0:	7100003f 	cmp	w1, #0x0
 21300d4:	7a431824 	ccmp	w1, #0x3, #0x4, ne
 21300d8:	54ffff80 	b.eq	21300c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930240>
 21300dc:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
 21300e0:	b0002481 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 21300e4:	9136a021 	add	x1, x1, #0xda8
 21300e8:	910003fd 	mov	x29, sp
 21300ec:	9100a3e0 	add	x0, sp, #0x28
 21300f0:	94080efc 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21300f4:	b0006881 	adrp	x1, 2e41000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87e1a8>
 21300f8:	9100a3e0 	add	x0, sp, #0x28
 21300fc:	9100c3e8 	add	x8, sp, #0x30
 2130100:	911ec021 	add	x1, x1, #0x7b0
 2130104:	94078ebb 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2130108:	f00034c1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 213010c:	9100e3e8 	add	x8, sp, #0x38
 2130110:	91366021 	add	x1, x1, #0xd98
 2130114:	9100c3e0 	add	x0, sp, #0x30
 2130118:	94078eb6 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 213011c:	d0006881 	adrp	x1, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130120:	910103e0 	add	x0, sp, #0x40
 2130124:	91112021 	add	x1, x1, #0x448
 2130128:	94080eee 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 213012c:	910103e1 	add	x1, sp, #0x40
 2130130:	910123e8 	add	x8, sp, #0x48
 2130134:	9100e3e0 	add	x0, sp, #0x38
 2130138:	94078e56 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 213013c:	52800022 	mov	w2, #0x1                   	// #1
 2130140:	52800001 	mov	w1, #0x0                   	// #0
 2130144:	910123e0 	add	x0, sp, #0x48
 2130148:	940340a6 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 213014c:	910123e0 	add	x0, sp, #0x48
 2130150:	9407312c 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2130154:	910103e0 	add	x0, sp, #0x40
 2130158:	9407312a 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 213015c:	9100e3e0 	add	x0, sp, #0x38
 2130160:	94073128 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2130164:	9100c3e0 	add	x0, sp, #0x30
 2130168:	94073126 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 213016c:	9100a3e0 	add	x0, sp, #0x28
 2130170:	94073124 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2130174:	a8c57bfd 	ldp	x29, x30, [sp],#80
 2130178:	d65f03c0 	ret
 213017c:	f9000bf3 	str	x19, [sp,#16]
 2130180:	aa0003f3 	mov	x19, x0
 2130184:	1400000b 	b	21301b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930328>
 2130188:	f9000bf3 	str	x19, [sp,#16]
 213018c:	aa0003f3 	mov	x19, x0
 2130190:	910123e0 	add	x0, sp, #0x48
 2130194:	9407311b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2130198:	910103e0 	add	x0, sp, #0x40
 213019c:	94073119 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21301a0:	9100e3e0 	add	x0, sp, #0x38
 21301a4:	94073117 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21301a8:	9100c3e0 	add	x0, sp, #0x30
 21301ac:	94073115 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21301b0:	9100a3e0 	add	x0, sp, #0x28
 21301b4:	94073113 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21301b8:	aa1303e0 	mov	x0, x19
 21301bc:	978bd2d5 	bl	424d10 <_Unwind_Resume@plt>
 21301c0:	f9000bf3 	str	x19, [sp,#16]
 21301c4:	aa0003f3 	mov	x19, x0
 21301c8:	17fffff6 	b	21301a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930318>
 21301cc:	f9000bf3 	str	x19, [sp,#16]
 21301d0:	aa0003f3 	mov	x19, x0
 21301d4:	17fffff1 	b	2130198 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930310>
 21301d8:	f9000bf3 	str	x19, [sp,#16]
 21301dc:	aa0003f3 	mov	x19, x0
 21301e0:	17fffff2 	b	21301a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930320>
 21301e4:	d503201f 	nop
