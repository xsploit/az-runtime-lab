
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002146058 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9461d0>:
 2146058:	a9ba7bfd 	stp	x29, x30, [sp,#-96]!
 214605c:	910003fd 	mov	x29, sp
 2146060:	a90153f3 	stp	x19, x20, [sp,#16]
 2146064:	91048014 	add	x20, x0, #0x120
 2146068:	aa0003f3 	mov	x19, x0
 214606c:	a9025bf5 	stp	x21, x22, [sp,#32]
 2146070:	a9007c1f 	stp	xzr, xzr, [x0]
 2146074:	a9017c1f 	stp	xzr, xzr, [x0,#16]
 2146078:	a9027c1f 	stp	xzr, xzr, [x0,#32]
 214607c:	a9037c1f 	stp	xzr, xzr, [x0,#48]
 2146080:	a9047c1f 	stp	xzr, xzr, [x0,#64]
 2146084:	a9057c1f 	stp	xzr, xzr, [x0,#80]
 2146088:	a9067c1f 	stp	xzr, xzr, [x0,#96]
 214608c:	a9077c1f 	stp	xzr, xzr, [x0,#112]
 2146090:	a9087c1f 	stp	xzr, xzr, [x0,#128]
 2146094:	a9097c1f 	stp	xzr, xzr, [x0,#144]
 2146098:	a90a7c1f 	stp	xzr, xzr, [x0,#160]
 214609c:	a90b7c1f 	stp	xzr, xzr, [x0,#176]
 21460a0:	a90c7c1f 	stp	xzr, xzr, [x0,#192]
 21460a4:	a90d7c1f 	stp	xzr, xzr, [x0,#208]
 21460a8:	a90e7c1f 	stp	xzr, xzr, [x0,#224]
 21460ac:	a90f7c1f 	stp	xzr, xzr, [x0,#240]
 21460b0:	a9107c1f 	stp	xzr, xzr, [x0,#256]
 21460b4:	a9117c1f 	stp	xzr, xzr, [x0,#272]
 21460b8:	a9127c1f 	stp	xzr, xzr, [x0,#288]
 21460bc:	a9017e9f 	stp	xzr, xzr, [x20,#16]
 21460c0:	a9027e9f 	stp	xzr, xzr, [x20,#32]
 21460c4:	a9037e9f 	stp	xzr, xzr, [x20,#48]
 21460c8:	34000581 	cbz	w1, 2146178 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9462f0>
 21460cc:	2a0103f5 	mov	w21, w1
 21460d0:	7100043f 	cmp	w1, #0x1
 21460d4:	540005c0 	b.eq	214618c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x946304>
 21460d8:	f00023c1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 21460dc:	910143e0 	add	x0, sp, #0x50
 21460e0:	9136a021 	add	x1, x1, #0xda8
 21460e4:	9407b6ff 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21460e8:	f00067e1 	adrp	x1, 2e45000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8821a8>
 21460ec:	911dc021 	add	x1, x1, #0x770
 21460f0:	910123e8 	add	x8, sp, #0x48
 21460f4:	913c8021 	add	x1, x1, #0xf20
 21460f8:	910143e0 	add	x0, sp, #0x50
 21460fc:	940736bd 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2146100:	b0003421 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 2146104:	910103e8 	add	x8, sp, #0x40
 2146108:	91366021 	add	x1, x1, #0xd98
 214610c:	910123e0 	add	x0, sp, #0x48
 2146110:	940736b8 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2146114:	2a1503e1 	mov	w1, w21
 2146118:	910163e0 	add	x0, sp, #0x58
 214611c:	94072a7d 	bl	2310b10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1889f8>
 2146120:	910163e1 	add	x1, sp, #0x58
 2146124:	9100e3e8 	add	x8, sp, #0x38
 2146128:	910103e0 	add	x0, sp, #0x40
 214612c:	94073659 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 2146130:	52800022 	mov	w2, #0x1                   	// #1
 2146134:	52800001 	mov	w1, #0x0                   	// #0
 2146138:	9100e3e0 	add	x0, sp, #0x38
 214613c:	9402e8a9 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 2146140:	9100e3e0 	add	x0, sp, #0x38
 2146144:	9406d92f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2146148:	910163e0 	add	x0, sp, #0x58
 214614c:	9406d92d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2146150:	910103e0 	add	x0, sp, #0x40
 2146154:	9406d92b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2146158:	910123e0 	add	x0, sp, #0x48
 214615c:	9406d929 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2146160:	910143e0 	add	x0, sp, #0x50
 2146164:	9406d927 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 2146168:	a94153f3 	ldp	x19, x20, [sp,#16]
 214616c:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2146170:	a8c67bfd 	ldp	x29, x30, [sp],#96
 2146174:	d65f03c0 	ret
 2146178:	97fffb20 	bl	2144df8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944f70>
 214617c:	a94153f3 	ldp	x19, x20, [sp,#16]
 2146180:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2146184:	a8c67bfd 	ldp	x29, x30, [sp],#96
 2146188:	d65f03c0 	ret
 214618c:	97fffd65 	bl	2145720 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x945898>
 2146190:	a94153f3 	ldp	x19, x20, [sp,#16]
 2146194:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2146198:	a8c67bfd 	ldp	x29, x30, [sp],#96
 214619c:	d65f03c0 	ret
 21461a0:	aa0003f5 	mov	x21, x0
 21461a4:	9100e3e0 	add	x0, sp, #0x38
 21461a8:	9406d916 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21461ac:	910163e0 	add	x0, sp, #0x58
 21461b0:	9406d914 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21461b4:	910103e0 	add	x0, sp, #0x40
 21461b8:	9406d912 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21461bc:	910123e0 	add	x0, sp, #0x48
 21461c0:	9406d910 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21461c4:	91058276 	add	x22, x19, #0x160
 21461c8:	910143e0 	add	x0, sp, #0x50
 21461cc:	9406d90d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21461d0:	eb16029f 	cmp	x20, x22
 21461d4:	54000240 	b.eq	214621c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x946394>
 21461d8:	f85f8ec0 	ldr	x0, [x22,#-8]!
 21461dc:	b4ffffa0 	cbz	x0, 21461d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x946348>
 21461e0:	f9400001 	ldr	x1, [x0]
 21461e4:	f9400421 	ldr	x1, [x1,#8]
 21461e8:	d63f0020 	blr	x1
 21461ec:	17fffff9 	b	21461d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x946348>
 21461f0:	aa0003f5 	mov	x21, x0
 21461f4:	17ffffee 	b	21461ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x946324>
 21461f8:	aa0003f5 	mov	x21, x0
 21461fc:	17ffffee 	b	21461b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x94632c>
 2146200:	aa0003f5 	mov	x21, x0
 2146204:	17fffff0 	b	21461c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x94633c>
 2146208:	aa0003f5 	mov	x21, x0
 214620c:	91058276 	add	x22, x19, #0x160
 2146210:	17fffff0 	b	21461d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x946348>
 2146214:	aa0003f5 	mov	x21, x0
 2146218:	17ffffe9 	b	21461bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x946334>
 214621c:	f9408e60 	ldr	x0, [x19,#280]
 2146220:	b4000080 	cbz	x0, 2146230 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9463a8>
 2146224:	f9400001 	ldr	x1, [x0]
 2146228:	f9400421 	ldr	x1, [x1,#8]
 214622c:	d63f0020 	blr	x1
 2146230:	f9408a60 	ldr	x0, [x19,#272]
 2146234:	b4000080 	cbz	x0, 2146244 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9463bc>
 2146238:	f9400001 	ldr	x1, [x0]
 214623c:	f9400421 	ldr	x1, [x1,#8]
