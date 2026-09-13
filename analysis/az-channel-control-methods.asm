
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021344c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x934640>:
 21344c8:	39002001 	strb	w1, [x0,#8]
 21344cc:	d65f03c0 	ret
 21344d0:	39002401 	strb	w1, [x0,#9]
 21344d4:	d65f03c0 	ret
 21344d8:	39002001 	strb	w1, [x0,#8]
 21344dc:	d65f03c0 	ret
 21344e0:	8b210000 	add	x0, x0, w1, uxtb
 21344e4:	39002402 	strb	w2, [x0,#9]
 21344e8:	d65f03c0 	ret
 21344ec:	00000000 	.inst	0x00000000 ; undefined
 21344f0:	39002001 	strb	w1, [x0,#8]
 21344f4:	d65f03c0 	ret
 21344f8:	39002c01 	strb	w1, [x0,#11]
 21344fc:	d65f03c0 	ret
 2134500:	39003001 	strb	w1, [x0,#12]
 2134504:	d65f03c0 	ret


runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021300b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930230>:
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


runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002132078 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9321f0>:
 2132078:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
 213207c:	910003fd 	mov	x29, sp
 2132080:	a90153f3 	stp	x19, x20, [sp,#16]
 2132084:	91010014 	add	x20, x0, #0x40
 2132088:	aa0003f3 	mov	x19, x0
 213208c:	f9001bf7 	str	x23, [sp,#48]
 2132090:	91004017 	add	x23, x0, #0x10
 2132094:	aa1703e0 	mov	x0, x23
 2132098:	a9025bf5 	stp	x21, x22, [sp,#32]
 213209c:	aa0103f5 	mov	x21, x1
 21320a0:	9407e810 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 21320a4:	a9408296 	ldp	x22, x0, [x20,#8]
 21320a8:	eb0002df 	cmp	x22, x0
 21320ac:	540006e0 	b.eq	2132188 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932300>
 21320b0:	910022c2 	add	x2, x22, #0x8
 21320b4:	9101e3e1 	add	x1, sp, #0x78
 21320b8:	aa1503e0 	mov	x0, x21
 21320bc:	f9003fe2 	str	x2, [sp,#120]
 21320c0:	940009ea 	bl	2134868 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9349e0>
 21320c4:	b94002a0 	ldr	w0, [x21]
 21320c8:	f9400681 	ldr	x1, [x20,#8]
 21320cc:	4a807c00 	eor	w0, w0, w0, asr #31
 21320d0:	b90002c0 	str	w0, [x22]
 21320d4:	91006020 	add	x0, x1, #0x18
 21320d8:	f9000680 	str	x0, [x20,#8]
 21320dc:	aa1703e0 	mov	x0, x23
 21320e0:	9407e80c 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 21320e4:	39416260 	ldrb	w0, [x19,#88]
 21320e8:	34000420 	cbz	w0, 213216c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9322e4>
 21320ec:	39416663 	ldrb	w3, [x19,#89]
 21320f0:	9101a3e2 	add	x2, sp, #0x68
 21320f4:	52800024 	mov	w4, #0x1                   	// #1
 21320f8:	9101e3e1 	add	x1, sp, #0x78
 21320fc:	aa1503e0 	mov	x0, x21
 2132100:	390123e4 	strb	w4, [sp,#72]
 2132104:	390127e3 	strb	w3, [sp,#73]
 2132108:	91003273 	add	x19, x19, #0xc
 213210c:	f9003fe2 	str	x2, [sp,#120]
 2132110:	940009d6 	bl	2134868 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9349e0>
 2132114:	b94002a0 	ldr	w0, [x21]
 2132118:	d2800204 	mov	x4, #0x10                  	// #16
 213211c:	d2800023 	mov	x3, #0x1                   	// #1
 2132120:	910143e2 	add	x2, sp, #0x50
 2132124:	910127e1 	add	x1, sp, #0x49
 2132128:	a9050fe4 	stp	x4, x3, [sp,#80]
 213212c:	4a807c00 	eor	w0, w0, w0, asr #31
 2132130:	b90063e0 	str	w0, [sp,#96]
 2132134:	7100041f 	cmp	w0, #0x1
 2132138:	a907cfe2 	stp	x2, x19, [sp,#120]
 213213c:	f90047e1 	str	x1, [sp,#136]
 2132140:	540000c0 	b.eq	2132158 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9322d0>
 2132144:	540001ed 	b.le	2132180 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9322f8>
 2132148:	7100081f 	cmp	w0, #0x2
 213214c:	54000280 	b.eq	213219c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932314>
 2132150:	71000c1f 	cmp	w0, #0x3
 2132154:	54000181 	b.ne	2132184 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9322fc>
 2132158:	f94037e1 	ldr	x1, [sp,#104]
 213215c:	b50004a1 	cbnz	x1, 21321f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932368>
 2132160:	9101e3e1 	add	x1, sp, #0x78
 2132164:	910183e0 	add	x0, sp, #0x60
 2132168:	97a58238 	bl	a92a48 <_ZSt20__throw_bad_weak_ptrv@@Base+0x187e30>
 213216c:	a94153f3 	ldp	x19, x20, [sp,#16]
 2132170:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2132174:	f9401bf7 	ldr	x23, [sp,#48]
 2132178:	a8c97bfd 	ldp	x29, x30, [sp],#144
 213217c:	d65f03c0 	ret
 2132180:	34ffff00 	cbz	w0, 2132160 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9322d8>
 2132184:	978bd217 	bl	4269e0 <abort@plt>


runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002132e38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932fb0>:
 2132e38:	a9b87bfd 	stp	x29, x30, [sp,#-128]!
 2132e3c:	910003fd 	mov	x29, sp
 2132e40:	a9025bf5 	stp	x21, x22, [sp,#32]
 2132e44:	aa0003f5 	mov	x21, x0
 2132e48:	91004016 	add	x22, x0, #0x10
 2132e4c:	aa1603e0 	mov	x0, x22
 2132e50:	a90153f3 	stp	x19, x20, [sp,#16]
 2132e54:	a90363f7 	stp	x23, x24, [sp,#48]
 2132e58:	f9002fe1 	str	x1, [sp,#88]
 2132e5c:	9407e4a1 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 2132e60:	a9445eb3 	ldp	x19, x23, [x21,#64]
 2132e64:	52800060 	mov	w0, #0x3                   	// #3
 2132e68:	b9006be0 	str	w0, [sp,#104]
 2132e6c:	b201f3e2 	mov	x2, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
 2132e70:	f2955562 	movk	x2, #0xaaab
 2132e74:	f9402fe1 	ldr	x1, [sp,#88]
 2132e78:	f9003be1 	str	x1, [sp,#112]
 2132e7c:	cb1302e0 	sub	x0, x23, x19
 2132e80:	9343fc00 	asr	x0, x0, #3
 2132e84:	9b027c00 	mul	x0, x0, x2
 2132e88:	9342fc14 	asr	x20, x0, #2
 2132e8c:	f100029f 	cmp	x20, #0x0
 2132e90:	540027cd 	b.le	2133388 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x933500>
 2132e94:	8b140694 	add	x20, x20, x20, lsl #1
 2132e98:	f90023f9 	str	x25, [sp,#64]
 2132e9c:	8b141674 	add	x20, x19, x20, lsl #5
 2132ea0:	b9400260 	ldr	w0, [x19]
 2132ea4:	4a807c00 	eor	w0, w0, w0, asr #31
 2132ea8:	7100041f 	cmp	w0, #0x1
 2132eac:	54000600 	b.eq	2132f6c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9330e4>
 2132eb0:	5400092d 	b.le	2132fd4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93314c>
 2132eb4:	7100081f 	cmp	w0, #0x2
 2132eb8:	54000561 	b.ne	2132f64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9330dc>
 2132ebc:	f9400a60 	ldr	x0, [x19,#16]
