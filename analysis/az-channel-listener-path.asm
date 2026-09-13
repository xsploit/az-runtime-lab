
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
 2132188:	aa1603e1 	mov	x1, x22
 213218c:	aa1403e0 	mov	x0, x20
 2132190:	aa1503e2 	mov	x2, x21
 2132194:	94000e4f 	bl	2135ad0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x935c48>
 2132198:	17ffffd1 	b	21320dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932254>
 213219c:	f9403bf3 	ldr	x19, [sp,#112]
 21321a0:	b4fffe13 	cbz	x19, 2132160 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9322d8>
 21321a4:	91002260 	add	x0, x19, #0x8
 21321a8:	b9400001 	ldr	w1, [x0]
 21321ac:	34fffda1 	cbz	w1, 2132160 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9322d8>
 21321b0:	11000422 	add	w2, w1, #0x1
 21321b4:	885ffc03 	ldaxr	w3, [x0]
 21321b8:	6b01007f 	cmp	w3, w1
 21321bc:	54000061 	b.ne	21321c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932340>
 21321c0:	8804fc02 	stlxr	w4, w2, [x0]
 21321c4:	7100009f 	cmp	w4, #0x0
 21321c8:	540001a1 	b.ne	21321fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932374>
 21321cc:	b9400000 	ldr	w0, [x0]
 21321d0:	340000a0 	cbz	w0, 21321e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93235c>
 21321d4:	f94037e1 	ldr	x1, [sp,#104]
 21321d8:	b4000061 	cbz	x1, 21321e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93235c>
 21321dc:	9101e3e0 	add	x0, sp, #0x78
 21321e0:	94000980 	bl	21347e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x934958>
 21321e4:	aa1303e0 	mov	x0, x19
 21321e8:	9795083c 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 21321ec:	17ffffdd 	b	2132160 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9322d8>
 21321f0:	9101e3e0 	add	x0, sp, #0x78
 21321f4:	9400097b 	bl	21347e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x934958>
 21321f8:	17ffffda 	b	2132160 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9322d8>
 21321fc:	34fffb23 	cbz	w3, 2132160 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9322d8>
 2132200:	11000462 	add	w2, w3, #0x1
 2132204:	885ffc01 	ldaxr	w1, [x0]
 2132208:	6b03003f 	cmp	w1, w3
 213220c:	54000061 	b.ne	2132218 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x932390>
