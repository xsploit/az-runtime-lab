
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021024a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x902618>:
 21024a0:	aa0003f7 	mov	x23, x0
 21024a4:	aa1403e2 	mov	x2, x20
 21024a8:	9101a3e1 	add	x1, sp, #0x68
 21024ac:	940145b1 	bl	2153b70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x953ce8>
 21024b0:	f94002c2 	ldr	x2, [x22]
 21024b4:	aa1403e1 	mov	x1, x20
 21024b8:	aa1603e0 	mov	x0, x22
 21024bc:	f9401042 	ldr	x2, [x2,#32]
 21024c0:	d63f0040 	blr	x2
 21024c4:	d2800f00 	mov	x0, #0x78                  	// #120
 21024c8:	a905cff7 	stp	x23, x19, [sp,#88]
 21024cc:	978c8a1d 	bl	424d40 <_Znwm@plt>
 21024d0:	aa0003f3 	mov	x19, x0
 21024d4:	910183e5 	add	x5, sp, #0x60
 21024d8:	aa1903e3 	mov	x3, x25
 21024dc:	aa1803e2 	mov	x2, x24
 21024e0:	910163e4 	add	x4, sp, #0x58
 21024e4:	9101e3e1 	add	x1, sp, #0x78
 21024e8:	94030c5e 	bl	21c5660 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3d548>
 21024ec:	f9401ea0 	ldr	x0, [x21,#56]
 21024f0:	f9001eb3 	str	x19, [x21,#56]
 21024f4:	b4000080 	cbz	x0, 2102504 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x90267c>
 21024f8:	f9400001 	ldr	x1, [x0]
 21024fc:	f9400421 	ldr	x1, [x1,#8]
 2102500:	d63f0020 	blr	x1
 2102504:	f94033e0 	ldr	x0, [sp,#96]
 2102508:	b4000080 	cbz	x0, 2102518 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x902690>
 210250c:	f9400001 	ldr	x1, [x0]
 2102510:	f9400421 	ldr	x1, [x1,#8]
 2102514:	d63f0020 	blr	x1
 2102518:	f9402fe0 	ldr	x0, [sp,#88]
 210251c:	b4000080 	cbz	x0, 210252c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9026a4>
 2102520:	f9400001 	ldr	x1, [x0]
 2102524:	f9400421 	ldr	x1, [x1,#8]
 2102528:	d63f0020 	blr	x1
 210252c:	f9401ea0 	ldr	x0, [x21,#56]
 2102530:	94030c2c 	bl	21c55e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3d4c8>
 2102534:	f9403bf3 	ldr	x19, [sp,#112]
 2102538:	b4000173 	cbz	x19, 2102564 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9026dc>
 210253c:	b0006980 	adrp	x0, 2e33000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8701a8>
