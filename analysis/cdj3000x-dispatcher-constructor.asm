
runtime-lab/cdj3000x/rootfs/home/root/pdj/EP145:     file format elf64-littleaarch64


Disassembly of section .text:

000000000225bac0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9286f0>:
 225bac0:	aa0003f3 	mov	x19, x0
 225bac4:	17fffff2 	b	225ba8c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9286bc>
 225bac8:	aa0003f3 	mov	x19, x0
 225bacc:	17fffff2 	b	225ba94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9286c4>
 225bad0:	aa0003f3 	mov	x19, x0
 225bad4:	17fffff2 	b	225ba9c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9286cc>
 225bad8:	a9b47bfd 	stp	x29, x30, [sp,#-192]!
 225badc:	b0006ee1 	adrp	x1, 3038000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x946410>
 225bae0:	9111a021 	add	x1, x1, #0x468
 225bae4:	910003fd 	mov	x29, sp
 225bae8:	a90153f3 	stp	x19, x20, [sp,#16]
 225baec:	aa0003f3 	mov	x19, x0
 225baf0:	b0006ee0 	adrp	x0, 3038000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x946410>
 225baf4:	a9025bf5 	stp	x21, x22, [sp,#32]
 225baf8:	91108000 	add	x0, x0, #0x420
 225bafc:	d000ed34 	adrp	x20, 4001000 <stdout@@GLIBC_2.17+0x9430>
 225bb00:	a90363f7 	stp	x23, x24, [sp,#48]
 225bb04:	9125a294 	add	x20, x20, #0x968
 225bb08:	a9046bf9 	stp	x25, x26, [sp,#64]
 225bb0c:	91004279 	add	x25, x19, #0x10
 225bb10:	a90573fb 	stp	x27, x28, [sp,#80]
 225bb14:	a9000660 	stp	x0, x1, [x19]
 225bb18:	aa1903e0 	mov	x0, x25
 225bb1c:	94001361 	bl	22608a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d4d0>
 225bb20:	7903727f 	strh	wzr, [x19,#440]
 225bb24:	91072260 	add	x0, x19, #0x1c8
 225bb28:	3907127f 	strb	wzr, [x19,#452]
 225bb2c:	a9007c1f 	stp	xzr, xzr, [x0]
 225bb30:	a9017c1f 	stp	xzr, xzr, [x0,#16]
 225bb34:	a9027c1f 	stp	xzr, xzr, [x0,#32]
 225bb38:	08dffe80 	ldarb	w0, [x20]
 225bb3c:	36001900 	tbz	w0, #0, 225be5c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928a8c>
 225bb40:	d000ed3b 	adrp	x27, 4001000 <stdout@@GLIBC_2.17+0x9430>
 225bb44:	91266377 	add	x23, x27, #0x998
 225bb48:	52800156 	mov	w22, #0xa                   	// #10
 225bb4c:	12800015 	mov	w21, #0xffffffff            	// #-1
 225bb50:	885ffee0 	ldaxr	w0, [x23]
 225bb54:	35000060 	cbnz	w0, 225bb60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928790>
 225bb58:	8801fef5 	stlxr	w1, w21, [x23]
 225bb5c:	35ffffa1 	cbnz	w1, 225bb50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928780>
 225bb60:	7100001f 	cmp	w0, #0x0
 225bb64:	54002d41 	b.ne	225c10c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928d3c>
 225bb68:	5280003a 	mov	w26, #0x1                   	// #1
 225bb6c:	08dffe80 	ldarb	w0, [x20]
 225bb70:	36001aa0 	tbz	w0, #0, 225bec4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928af4>
 225bb74:	d000ed35 	adrp	x21, 4001000 <stdout@@GLIBC_2.17+0x9430>
 225bb78:	9125c2b5 	add	x21, x21, #0x970
 225bb7c:	d294dd60 	mov	x0, #0xa6eb                	// #42731
 225bb80:	b9801aa1 	ldrsw	x1, [x21,#24]
 225bb84:	f2b6eda0 	movk	x0, #0xb76d, lsl #16
 225bb88:	f2d28bc0 	movk	x0, #0x945e, lsl #32
 225bb8c:	f2e00040 	movk	x0, #0x2, lsl #48
 225bb90:	f94006a2 	ldr	x2, [x21,#8]
 225bb94:	9ac10816 	udiv	x22, x0, x1
 225bb98:	9b0182d6 	msub	x22, x22, x1, x0
 225bb9c:	93407ed8 	sxtw	x24, w22
 225bba0:	f8787854 	ldr	x20, [x2,x24,lsl #3]
 225bba4:	b40002d4 	cbz	x20, 225bbfc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92882c>
 225bba8:	f9400281 	ldr	x1, [x20]
 225bbac:	eb00003f 	cmp	x1, x0
 225bbb0:	54000740 	b.eq	225bc98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9288c8>
 225bbb4:	aa1403e1 	mov	x1, x20
 225bbb8:	14000004 	b	225bbc8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9287f8>
 225bbbc:	f9400022 	ldr	x2, [x1]
 225bbc0:	eb00005f 	cmp	x2, x0
 225bbc4:	540006a0 	b.eq	225bc98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9288c8>
 225bbc8:	f9400821 	ldr	x1, [x1,#16]
 225bbcc:	b5ffff81 	cbnz	x1, 225bbbc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9287ec>
 225bbd0:	d294dd62 	mov	x2, #0xa6eb                	// #42731
 225bbd4:	aa1403e0 	mov	x0, x20
 225bbd8:	f2b6eda2 	movk	x2, #0xb76d, lsl #16
 225bbdc:	f2d28bc2 	movk	x2, #0x945e, lsl #32
 225bbe0:	f2e00042 	movk	x2, #0x2, lsl #48
 225bbe4:	14000004 	b	225bbf4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928824>
 225bbe8:	f9400001 	ldr	x1, [x0]
 225bbec:	eb02003f 	cmp	x1, x2
 225bbf0:	540019e0 	b.eq	225bf2c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928b5c>
 225bbf4:	f9400800 	ldr	x0, [x0,#16]
 225bbf8:	b5ffff80 	cbnz	x0, 225bbe8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928818>
 225bbfc:	d2800300 	mov	x0, #0x18                  	// #24
 225bc00:	9787269c 	bl	425670 <_Znwm@plt>
 225bc04:	aa0003fb 	mov	x27, x0
 225bc08:	b0006ee0 	adrp	x0, 3038000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x946410>
 225bc0c:	b9401abc 	ldr	w28, [x21,#24]
 225bc10:	f9471000 	ldr	x0, [x0,#3616]
 225bc14:	a9007f60 	stp	x0, xzr, [x27]
 225bc18:	6b16039f 	cmp	w28, w22
 225bc1c:	f9000b74 	str	x20, [x27,#16]
 225bc20:	54001ae9 	b.ls	225bf7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928bac>
 225bc24:	f94006a0 	ldr	x0, [x21,#8]
 225bc28:	f838781b 	str	x27, [x0,x24,lsl #3]
 225bc2c:	531f7b96 	lsl	w22, w28, #1
 225bc30:	b94022a0 	ldr	w0, [x21,#32]
 225bc34:	0b1c02c1 	add	w1, w22, w28
 225bc38:	11000400 	add	w0, w0, #0x1
 225bc3c:	b90022a0 	str	w0, [x21,#32]
 225bc40:	0b417c22 	add	w2, w1, w1, lsr #31
 225bc44:	6b82041f 	cmp	w0, w2, asr #1
 225bc48:	54001eac 	b.gt	225c01c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928c4c>
 225bc4c:	91002360 	add	x0, x27, #0x8
 225bc50:	91002261 	add	x1, x19, #0x8
 225bc54:	f9000001 	str	x1, [x0]
 225bc58:	3500077a 	cbnz	w26, 225bd44 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928974>
 225bc5c:	b0076dd4 	adrp	x20, 11014000 <stdout@@GLIBC_2.17+0xd01c430>
 225bc60:	91346294 	add	x20, x20, #0xd18
 225bc64:	91004280 	add	x0, x20, #0x10
 225bc68:	08dffc01 	ldarb	w1, [x0]
 225bc6c:	36000ce1 	tbz	w1, #0, 225be08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928a38>
 225bc70:	f9400e80 	ldr	x0, [x20,#24]
 225bc74:	aa1303e1 	mov	x1, x19
 225bc78:	97ffbb04 	bl	224a888 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9174b8>
 225bc7c:	a94153f3 	ldp	x19, x20, [sp,#16]
 225bc80:	a9425bf5 	ldp	x21, x22, [sp,#32]
 225bc84:	a94363f7 	ldp	x23, x24, [sp,#48]
 225bc88:	a9446bf9 	ldp	x25, x26, [sp,#64]
 225bc8c:	a94573fb 	ldp	x27, x28, [sp,#80]
 225bc90:	a8cc7bfd 	ldp	x29, x30, [sp],#192
 225bc94:	d65f03c0 	ret
 225bc98:	910283f5 	add	x21, sp, #0xa0
 225bc9c:	f0002441 	adrp	x1, 26e6000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0x15c18>
 225bca0:	aa1503e0 	mov	x0, x21
 225bca4:	91146021 	add	x1, x1, #0x518
 225bca8:	9407dfb2 	bl	2453b70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a98a0>
 225bcac:	b0006ee1 	adrp	x1, 3038000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x946410>
 225bcb0:	9102a3f6 	add	x22, sp, #0xa8
 225bcb4:	9112c021 	add	x1, x1, #0x4b0
 225bcb8:	aa1603e8 	mov	x8, x22
 225bcbc:	91224021 	add	x1, x1, #0x890
 225bcc0:	aa1503e0 	mov	x0, x21
 225bcc4:	94075f6f 	bl	2433a80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1897b0>
 225bcc8:	9102c3f8 	add	x24, sp, #0xb0
 225bccc:	d00036e1 	adrp	x1, 2939000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x247410>
 225bcd0:	aa1803e8 	mov	x8, x24
 225bcd4:	91310021 	add	x1, x1, #0xc40
 225bcd8:	aa1603e0 	mov	x0, x22
 225bcdc:	94075f69 	bl	2433a80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1897b0>
 225bce0:	910263fc 	add	x28, sp, #0x98
 225bce4:	f0002441 	adrp	x1, 26e6000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0x15c18>
 225bce8:	aa1c03e0 	mov	x0, x28
 225bcec:	91152021 	add	x1, x1, #0x548
 225bcf0:	9407dfa0 	bl	2453b70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a98a0>
 225bcf4:	9102e3f4 	add	x20, sp, #0xb8
 225bcf8:	aa1c03e1 	mov	x1, x28
 225bcfc:	aa1403e8 	mov	x8, x20
 225bd00:	aa1803e0 	mov	x0, x24
 225bd04:	94075f07 	bl	2433920 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x189650>
 225bd08:	52800022 	mov	w2, #0x1                   	// #1
 225bd0c:	52800001 	mov	w1, #0x0                   	// #0
 225bd10:	aa1403e0 	mov	x0, x20
 225bd14:	9403124f 	bl	2320650 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x76380>
 225bd18:	aa1403e0 	mov	x0, x20
 225bd1c:	940701dd 	bl	241c490 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1721c0>
 225bd20:	aa1c03e0 	mov	x0, x28
 225bd24:	940701db 	bl	241c490 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1721c0>
 225bd28:	aa1803e0 	mov	x0, x24
 225bd2c:	940701d9 	bl	241c490 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1721c0>
 225bd30:	aa1603e0 	mov	x0, x22
 225bd34:	940701d7 	bl	241c490 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1721c0>
 225bd38:	aa1503e0 	mov	x0, x21
 225bd3c:	940701d5 	bl	241c490 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1721c0>
 225bd40:	34fff8fa 	cbz	w26, 225bc5c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92888c>
 225bd44:	12800001 	mov	w1, #0xffffffff            	// #-1
 225bd48:	885ffee0 	ldaxr	w0, [x23]
 225bd4c:	6b01001f 	cmp	w0, w1
 225bd50:	54000061 	b.ne	225bd5c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92898c>
 225bd54:	8802feff 	stlxr	w2, wzr, [x23]
 225bd58:	35ffff82 	cbnz	w2, 225bd48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928978>
 225bd5c:	54fff800 	b.eq	225bc5c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92888c>
 225bd60:	9102c3f8 	add	x24, sp, #0xb0
 225bd64:	f0002441 	adrp	x1, 26e6000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0x15c18>
 225bd68:	aa1803e0 	mov	x0, x24
 225bd6c:	91146021 	add	x1, x1, #0x518
 225bd70:	9102a3f6 	add	x22, sp, #0xa8
 225bd74:	9407df7f 	bl	2453b70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a98a0>
 225bd78:	b0006ee1 	adrp	x1, 3038000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x946410>
 225bd7c:	aa1803e0 	mov	x0, x24
