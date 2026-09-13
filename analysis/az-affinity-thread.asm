
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000022205e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x984c8>:
 22205e0:	35ffff84 	cbnz	w4, 22205d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x984b8>
 22205e4:	54ffff01 	b.ne	22205c4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x984ac>
 22205e8:	f000cda2 	adrp	x2, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 22205ec:	910ec042 	add	x2, x2, #0x3b0
 22205f0:	f94002a0 	ldr	x0, [x21]
 22205f4:	b9801843 	ldrsw	x3, [x2,#24]
 22205f8:	f9400444 	ldr	x4, [x2,#8]
 22205fc:	9ac30802 	udiv	x2, x0, x3
 2220600:	9b038042 	msub	x2, x2, x3, x0
 2220604:	f862d893 	ldr	x19, [x4,w2,sxtw #3]
 2220608:	b4000193 	cbz	x19, 2220638 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98520>
 222060c:	f9400262 	ldr	x2, [x19]
 2220610:	eb00005f 	cmp	x2, x0
 2220614:	540000a1 	b.ne	2220628 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98510>
 2220618:	14000007 	b	2220634 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x9851c>
 222061c:	f9400262 	ldr	x2, [x19]
 2220620:	eb02001f 	cmp	x0, x2
 2220624:	54000080 	b.eq	2220634 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x9851c>
 2220628:	f9400a73 	ldr	x19, [x19,#16]
 222062c:	b5ffff93 	cbnz	x19, 222061c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98504>
 2220630:	14000002 	b	2220638 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98520>
 2220634:	f9400673 	ldr	x19, [x19,#8]
 2220638:	88dffc20 	ldar	w0, [x1]
 222063c:	7100001f 	cmp	w0, #0x0
 2220640:	54001b0d 	b.le	22209a0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98888>
 2220644:	51000402 	sub	w2, w0, #0x1
 2220648:	885ffc23 	ldaxr	w3, [x1]
 222064c:	6b00007f 	cmp	w3, w0
 2220650:	54000061 	b.ne	222065c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98544>
 2220654:	8804fc22 	stlxr	w4, w2, [x1]
 2220658:	35ffff84 	cbnz	w4, 2220648 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98530>
 222065c:	54fffee1 	b.ne	2220638 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98520>
 2220660:	b4002033 	cbz	x19, 2220a64 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x9894c>
 2220664:	a9418660 	ldp	x0, x1, [x19,#24]
 2220668:	29450e62 	ldp	w2, w3, [x19,#40]
 222066c:	97fffadd 	bl	221f1e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x970c8>
 2220670:	394e02c0 	ldrb	w0, [x22,#896]
 2220674:	35000f20 	cbnz	w0, 2220858 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98740>
 2220678:	b9401260 	ldr	w0, [x19,#16]
 222067c:	9404357d 	bl	232dc70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5b58>
 2220680:	b9402a60 	ldr	w0, [x19,#40]
 2220684:	7100281f 	cmp	w0, #0xa
 2220688:	54fff2c1 	b.ne	22204e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x983c8>
 222068c:	94043571 	bl	232dc50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5b38>
 2220690:	f9000680 	str	x0, [x20,#8]
 2220694:	17ffff93 	b	22204e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x983c8>
 2220698:	aa1303e0 	mov	x0, x19
 222069c:	978816f1 	bl	426260 <__cxa_guard_acquire@plt>
 22206a0:	34fff320 	cbz	w0, 2220504 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x983ec>
 22206a4:	a90363f7 	stp	x23, x24, [sp,#48]
 22206a8:	f000cdb7 	adrp	x23, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 22206ac:	910fa2f7 	add	x23, x23, #0x3e8
 22206b0:	d2809800 	mov	x0, #0x4c0                 	// #1216
 22206b4:	b90022ff 	str	wzr, [x23,#32]
 22206b8:	97881246 	bl	424fd0 <malloc@plt>
 22206bc:	f90006e0 	str	x0, [x23,#8]
 22206c0:	52801304 	mov	w4, #0x98                  	// #152
 22206c4:	52800ca3 	mov	w3, #0x65                  	// #101
 22206c8:	b90012e4 	str	w4, [x23,#16]
 22206cc:	d2806502 	mov	x2, #0x328                 	// #808
 22206d0:	b9001ae3 	str	w3, [x23,#24]
 22206d4:	52800001 	mov	w1, #0x0                   	// #0
 22206d8:	97880fc6 	bl	4245f0 <memset@plt>
 22206dc:	b9002aff 	str	wzr, [x23,#40]
