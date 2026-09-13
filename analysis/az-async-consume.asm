
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002210050 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x87f38>:
 2210050:	a9af7bfd 	stp	x29, x30, [sp,#-272]!
 2210054:	910003fd 	mov	x29, sp
 2210058:	a90153f3 	stp	x19, x20, [sp,#16]
 221005c:	a90573fb 	stp	x27, x28, [sp,#80]
 2210060:	aa0003fc 	mov	x28, x0
 2210064:	9400442f 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 2210068:	72001c00 	ands	w0, w0, #0xff
 221006c:	b9007be0 	str	w0, [sp,#120]
 2210070:	540000a0 	b.eq	2210084 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x87f6c>
 2210074:	f000ce20 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 2210078:	394de000 	ldrb	w0, [x0,#888]
 221007c:	52000000 	eor	w0, w0, #0x1
 2210080:	b9007be0 	str	w0, [sp,#120]
 2210084:	d000ce20 	adrp	x0, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 2210088:	9139c000 	add	x0, x0, #0xe70
 221008c:	f90043e0 	str	x0, [sp,#128]
 2210090:	9110a000 	add	x0, x0, #0x428
 2210094:	08dffc01 	ldarb	w1, [x0]
 2210098:	37000061 	tbnz	w1, #0, 22100a4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x87f8c>
 221009c:	97885871 	bl	426260 <__cxa_guard_acquire@plt>
 22100a0:	350025a0 	cbnz	w0, 2210554 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8843c>
 22100a4:	a9025bf5 	stp	x21, x22, [sp,#32]
 22100a8:	a90363f7 	stp	x23, x24, [sp,#48]
 22100ac:	a9046bf9 	stp	x25, x26, [sp,#64]
 22100b0:	9400440c 	bl	22210e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98fc8>
 22100b4:	b00062c1 	adrp	x1, 2e69000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a61a8>
 22100b8:	9101c021 	add	x1, x1, #0x70
 22100bc:	12001c00 	and	w0, w0, #0xff
 22100c0:	b000343a 	adrp	x26, 2895000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2d21a8>
 22100c4:	911c435a 	add	x26, x26, #0x710
 22100c8:	91124039 	add	x25, x1, #0x490
 22100cc:	9100e39b 	add	x27, x28, #0x38
 22100d0:	b90077ff 	str	wzr, [sp,#116]
 22100d4:	b9007fe0 	str	w0, [sp,#124]
 22100d8:	f90047e1 	str	x1, [sp,#136]
 22100dc:	f90053ff 	str	xzr, [sp,#160]
 22100e0:	1400003c 	b	22101d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x880b8>
 22100e4:	d000c9d4 	adrp	x20, 3b4a000 <stdout@@GLIBC_2.17+0x8f40>
 22100e8:	91224294 	add	x20, x20, #0x890
 22100ec:	aa1403e0 	mov	x0, x20
 22100f0:	aa1a03e2 	mov	x2, x26
 22100f4:	aa1903e1 	mov	x1, x25
 22100f8:	94002086 	bl	2218310 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x901f8>
 22100fc:	f94053e2 	ldr	x2, [sp,#160]
 2210100:	90001d80 	adrp	x0, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 2210104:	912a7000 	add	x0, x0, #0xa9c
 2210108:	91002041 	add	x1, x2, #0x8
 221010c:	eb00003f 	cmp	x1, x0
 2210110:	54000103 	b.cc	2210130 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x88018>
 2210114:	f240043f 	tst	x1, #0x3
 2210118:	540000c1 	b.ne	2210130 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x88018>
 221011c:	b9400853 	ldr	w19, [x2,#8]
 2210120:	97937ad8 	bl	6eec80 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x5e0f0>
 2210124:	6b00027f 	cmp	w19, w0
 2210128:	54000740 	b.eq	2210210 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x880f8>
 221012c:	d503201f 	nop
 2210130:	9102c3f5 	add	x21, sp, #0xb0
 2210134:	b0001d81 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 2210138:	aa1503e0 	mov	x0, x21
 221013c:	9136a021 	add	x1, x1, #0xda8
 2210140:	9102e3f6 	add	x22, sp, #0xb8
 2210144:	94048ee7 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2210148:	aa1503e0 	mov	x0, x21
 221014c:	aa1603e8 	mov	x8, x22
 2210150:	aa1903e1 	mov	x1, x25
 2210154:	94040ea7 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2210158:	910303f7 	add	x23, sp, #0xc0
 221015c:	f0002dc1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 2210160:	aa1703e8 	mov	x8, x23
 2210164:	91366021 	add	x1, x1, #0xd98
 2210168:	aa1603e0 	mov	x0, x22
 221016c:	94040ea1 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 2210170:	910323f8 	add	x24, sp, #0xc8
 2210174:	b00062c1 	adrp	x1, 2e69000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a61a8>
 2210178:	aa1803e0 	mov	x0, x24
 221017c:	91340021 	add	x1, x1, #0xd00
 2210180:	94048ed8 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 2210184:	910363f3 	add	x19, sp, #0xd8
 2210188:	aa1803e1 	mov	x1, x24
 221018c:	aa1303e8 	mov	x8, x19
 2210190:	aa1703e0 	mov	x0, x23
 2210194:	94040e3f 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 2210198:	52800022 	mov	w2, #0x1                   	// #1
 221019c:	52800001 	mov	w1, #0x0                   	// #0
 22101a0:	aa1303e0 	mov	x0, x19
 22101a4:	97ffc08f 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 22101a8:	aa1303e0 	mov	x0, x19
 22101ac:	9403b115 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 22101b0:	aa1803e0 	mov	x0, x24
 22101b4:	9403b113 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 22101b8:	aa1703e0 	mov	x0, x23
 22101bc:	9403b111 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 22101c0:	aa1603e0 	mov	x0, x22
 22101c4:	9403b10f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 22101c8:	aa1503e0 	mov	x0, x21
 22101cc:	9403b10d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 22101d0:	910283e1 	add	x1, sp, #0xa0
 22101d4:	aa1b03e0 	mov	x0, x27
 22101d8:	940008a2 	bl	2212460 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a348>
 22101dc:	72001c1f 	tst	w0, #0xff
 22101e0:	54fff821 	b.ne	22100e4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x87fcc>
 22101e4:	f9406780 	ldr	x0, [x28,#200]
 22101e8:	b4000040 	cbz	x0, 22101f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x880d8>
 22101ec:	b900981f 	str	wzr, [x0,#152]
 22101f0:	b94077e0 	ldr	w0, [sp,#116]
 22101f4:	a94153f3 	ldp	x19, x20, [sp,#16]
 22101f8:	a9425bf5 	ldp	x21, x22, [sp,#32]
 22101fc:	a94363f7 	ldp	x23, x24, [sp,#48]
 2210200:	a9446bf9 	ldp	x25, x26, [sp,#64]
 2210204:	a94573fb 	ldp	x27, x28, [sp,#80]
 2210208:	a8d17bfd 	ldp	x29, x30, [sp],#272
 221020c:	d65f03c0 	ret
 2210210:	f9406795 	ldr	x21, [x28,#200]
 2210214:	f94053f3 	ldr	x19, [sp,#160]
 2210218:	b4000755 	cbz	x21, 2210300 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x881e8>
 221021c:	910102b6 	add	x22, x21, #0x40
 2210220:	910222b7 	add	x23, x21, #0x88
 2210224:	910202b8 	add	x24, x21, #0x80
 2210228:	f9400a63 	ldr	x3, [x19,#16]
 221022c:	fd0033e8 	str	d8, [sp,#96]
 2210230:	c8dffea0 	ldar	x0, [x21]
 2210234:	f90063e0 	str	x0, [sp,#192]
 2210238:	f94063e0 	ldr	x0, [sp,#192]
 221023c:	c8dffec1 	ldar	x1, [x22]
 2210240:	9240bc00 	and	x0, x0, #0xffffffffffff
 2210244:	f90067e1 	str	x1, [sp,#200]
 2210248:	c8dffc00 	ldar	x0, [x0]
 221024c:	9240bc00 	and	x0, x0, #0xffffffffffff
 2210250:	c8dffea1 	ldar	x1, [x21]
 2210254:	f94063e2 	ldr	x2, [sp,#192]
 2210258:	eb01005f 	cmp	x2, x1
 221025c:	54fffea1 	b.ne	2210230 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x88118>
 2210260:	f94063e2 	ldr	x2, [sp,#192]
 2210264:	f94067e1 	ldr	x1, [sp,#200]
 2210268:	9240bc42 	and	x2, x2, #0xffffffffffff
 221026c:	9240bc21 	and	x1, x1, #0xffffffffffff
 2210270:	eb01005f 	cmp	x2, x1
 2210274:	54001300 	b.eq	22104d4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x883bc>
 2210278:	b4fffdc0 	cbz	x0, 2210230 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x88118>
 221027c:	f94063e1 	ldr	x1, [sp,#192]
