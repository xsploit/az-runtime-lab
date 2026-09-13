
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000231e850 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x196738>:
 231e850:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 231e854:	52800020 	mov	w0, #0x1                   	// #1
 231e858:	910003fd 	mov	x29, sp
 231e85c:	910043e1 	add	x1, sp, #0x10
 231e860:	978417a8 	bl	424700 <clock_gettime@plt>
 231e864:	a9410fe4 	ldp	x4, x3, [sp,#16]
 231e868:	d2869b62 	mov	x2, #0x34db                	// #13531
 231e86c:	f2baf6c2 	movk	x2, #0xd7b6, lsl #16
 231e870:	52807d00 	mov	w0, #0x3e8                 	// #1000
 231e874:	f2dbd042 	movk	x2, #0xde82, lsl #32
 231e878:	f2e86362 	movk	x2, #0x431b, lsl #48
 231e87c:	b000c5c1 	adrp	x1, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 231e880:	9114a021 	add	x1, x1, #0x528
 231e884:	91024021 	add	x1, x1, #0x90
 231e888:	9b427c62 	smulh	x2, x3, x2
 231e88c:	9352fc42 	asr	x2, x2, #18
 231e890:	cb83fc42 	sub	x2, x2, x3, asr #63
 231e894:	1b040800 	madd	w0, w0, w4, w2
 231e898:	88dffc22 	ldar	w2, [x1]
 231e89c:	6b00005f 	cmp	w2, w0
 231e8a0:	540000e9 	b.ls	231e8bc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1967a4>
 231e8a4:	88dffc22 	ldar	w2, [x1]
 231e8a8:	510fa042 	sub	w2, w2, #0x3e8
 231e8ac:	6b00005f 	cmp	w2, w0
 231e8b0:	54000068 	b.hi	231e8bc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1967a4>
 231e8b4:	a8c27bfd 	ldp	x29, x30, [sp],#32
 231e8b8:	d65f03c0 	ret
 231e8bc:	889ffc20 	stlr	w0, [x1]
