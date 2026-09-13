
runtime-lab/cdj3000x/rootfs/home/root/pdj/EP145:     file format elf64-littleaarch64


Disassembly of section .text:

000000000225b460 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928090>:
 225b460:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
 225b464:	aa0103e2 	mov	x2, x1
 225b468:	52800021 	mov	w1, #0x1                   	// #1
 225b46c:	910003fd 	mov	x29, sp
 225b470:	a9025bf5 	stp	x21, x22, [sp,#32]
 225b474:	aa0003f5 	mov	x21, x0
 225b478:	aa0203e0 	mov	x0, x2
 225b47c:	940010e1 	bl	225f800 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92c430>
 225b480:	b4001b40 	cbz	x0, 225b7e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928418>
 225b484:	a90153f3 	stp	x19, x20, [sp,#16]
 225b488:	aa0003f3 	mov	x19, x0
 225b48c:	79400000 	ldrh	w0, [x0]
 225b490:	34000d80 	cbz	w0, 225b640 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928270>
 225b494:	b0076dd4 	adrp	x20, 11014000 <stdout@@GLIBC_2.17+0xd01c430>
 225b498:	91346294 	add	x20, x20, #0xd18
 225b49c:	790372a0 	strh	w0, [x21,#440]
 225b4a0:	08dffe80 	ldarb	w0, [x20]
 225b4a4:	36001340 	tbz	w0, #0, 225b70c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92833c>
 225b4a8:	f9400694 	ldr	x20, [x20,#8]
 225b4ac:	b4000bb4 	cbz	x20, 225b620 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928250>
 225b4b0:	b9434680 	ldr	w0, [x20,#836]
 225b4b4:	7100041f 	cmp	w0, #0x1
 225b4b8:	54001a00 	b.eq	225b7f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928428>
 225b4bc:	a90363f7 	stp	x23, x24, [sp,#48]
 225b4c0:	910d8297 	add	x23, x20, #0x360
 225b4c4:	f9400ee0 	ldr	x0, [x23,#24]
 225b4c8:	b9400400 	ldr	w0, [x0,#4]
 225b4cc:	7100081f 	cmp	w0, #0x2
 225b4d0:	54001881 	b.ne	225b7e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928410>
 225b4d4:	f941b283 	ldr	x3, [x20,#864]
 225b4d8:	aa1303e1 	mov	x1, x19
 225b4dc:	f94022e2 	ldr	x2, [x23,#64]
 225b4e0:	aa1703e0 	mov	x0, x23
 225b4e4:	f9402063 	ldr	x3, [x3,#64]
 225b4e8:	d63f0060 	blr	x3
 225b4ec:	f94022e0 	ldr	x0, [x23,#64]
 225b4f0:	f9400261 	ldr	x1, [x19]
 225b4f4:	f9400002 	ldr	x2, [x0]
 225b4f8:	eb01005f 	cmp	x2, x1
 225b4fc:	54001380 	b.eq	225b76c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92839c>
 225b500:	910223f6 	add	x22, sp, #0x88
 225b504:	a9046bf9 	stp	x25, x26, [sp,#64]
 225b508:	9407cc1e 	bl	244e580 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a42b0>
 225b50c:	910203f8 	add	x24, sp, #0x80
 225b510:	aa1603e0 	mov	x0, x22
 225b514:	94078aef 	bl	243e0d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x193e00>
 225b518:	910e2281 	add	x1, x20, #0x388
 225b51c:	aa1803e0 	mov	x0, x24
 225b520:	94078af0 	bl	243e0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x193e10>
 225b524:	aa1803e1 	mov	x1, x24
 225b528:	910183e8 	add	x8, sp, #0x60
 225b52c:	aa1603e0 	mov	x0, x22
 225b530:	94078b7c 	bl	243e320 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x194050>
 225b534:	aa1803e0 	mov	x0, x24
 225b538:	94078aee 	bl	243e0f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x193e20>
 225b53c:	aa1603e0 	mov	x0, x22
