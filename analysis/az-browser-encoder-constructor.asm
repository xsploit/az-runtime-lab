
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002156690 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x956808>:
 2156690:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 2156694:	910003fd 	mov	x29, sp
 2156698:	f90013f5 	str	x21, [sp,#32]
 215669c:	aa0103f5 	mov	x21, x1
 21566a0:	f9400021 	ldr	x1, [x1]
 21566a4:	a90153f3 	stp	x19, x20, [sp,#16]
 21566a8:	aa0003f4 	mov	x20, x0
 21566ac:	d2801c00 	mov	x0, #0xe0                  	// #224
 21566b0:	f9001fe1 	str	x1, [sp,#56]
 21566b4:	978b39a3 	bl	424d40 <_Znwm@plt>
 21566b8:	aa0003f3 	mov	x19, x0
 21566bc:	f9401fe1 	ldr	x1, [sp,#56]
 21566c0:	940275d4 	bl	21f3e10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6bcf8>
 21566c4:	f9400280 	ldr	x0, [x20]
 21566c8:	f9000293 	str	x19, [x20]
 21566cc:	b40000c0 	cbz	x0, 21566e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95685c>
 21566d0:	f9400001 	ldr	x1, [x0]
 21566d4:	f9400421 	ldr	x1, [x1,#8]
 21566d8:	d63f0020 	blr	x1
 21566dc:	f9400293 	ldr	x19, [x20]
 21566e0:	b4000053 	cbz	x19, 21566e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x956860>
 21566e4:	91030273 	add	x19, x19, #0xc0
 21566e8:	aa1303e1 	mov	x1, x19
 21566ec:	aa1503e0 	mov	x0, x21
 21566f0:	a94153f3 	ldp	x19, x20, [sp,#16]
 21566f4:	f94013f5 	ldr	x21, [sp,#32]
 21566f8:	a8c47bfd 	ldp	x29, x30, [sp],#64
 21566fc:	17ff8907 	b	2138b18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x938c90>
 2156700:	d2801c01 	mov	x1, #0xe0                  	// #224
 2156704:	aa0003f4 	mov	x20, x0
 2156708:	aa1303e0 	mov	x0, x19
 215670c:	978b3fd5 	bl	426660 <_ZdlPvm@plt>
 2156710:	aa1403e0 	mov	x0, x20
 2156714:	978b397f 	bl	424d10 <_Unwind_Resume@plt>
 2156718:	a9b57bfd 	stp	x29, x30, [sp,#-176]!
 215671c:	910003fd 	mov	x29, sp
 2156720:	a90153f3 	stp	x19, x20, [sp,#16]
 2156724:	f000d2d3 	adrp	x19, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 2156728:	912b8273 	add	x19, x19, #0xae0
 215672c:	a9025bf5 	stp	x21, x22, [sp,#32]
 2156730:	a90363f7 	stp	x23, x24, [sp,#48]
 2156734:	a9046bf9 	stp	x25, x26, [sp,#64]
 2156738:	aa0003f9 	mov	x25, x0
 215673c:	a90573fb 	stp	x27, x28, [sp,#80]
 2156740:	aa0103fb 	mov	x27, x1
 2156744:	08dffe60 	ldarb	w0, [x19]
 2156748:	36000ec0 	tbz	w0, #0, 2156920 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x956a98>
 215674c:	f000d2d5 	adrp	x21, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 2156750:	912ba2b5 	add	x21, x21, #0xae8
 2156754:	f000d2d7 	adrp	x23, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 2156758:	912c42f4 	add	x20, x23, #0xb10
 215675c:	12800016 	mov	w22, #0xffffffff            	// #-1
 2156760:	885ffe80 	ldaxr	w0, [x20]
 2156764:	35000060 	cbnz	w0, 2156770 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9568e8>
 2156768:	8801fe96 	stlxr	w1, w22, [x20]
 215676c:	35ffffa1 	cbnz	w1, 2156760 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9568d8>
 2156770:	7100001f 	cmp	w0, #0x0
 2156774:	540023c1 	b.ne	2156bec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x956d64>
 2156778:	52800038 	mov	w24, #0x1                   	// #1
 215677c:	08dffe60 	ldarb	w0, [x19]
 2156780:	36001040 	tbz	w0, #0, 2156988 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x956b00>
 2156784:	b9801aa0 	ldrsw	x0, [x21,#24]
 2156788:	f9400322 	ldr	x2, [x25]
 215678c:	f94006a1 	ldr	x1, [x21,#8]
 2156790:	9ac00856 	udiv	x22, x2, x0
 2156794:	9b008ad6 	msub	x22, x22, x0, x2
 2156798:	93407eda 	sxtw	x26, w22
 215679c:	f87a7833 	ldr	x19, [x1,x26,lsl #3]
