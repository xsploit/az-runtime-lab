
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000221fc70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97b58>:
 221fc70:	b9400801 	ldr	w1, [x0,#8]
 221fc74:	7100003f 	cmp	w1, #0x0
 221fc78:	54002f4d 	b.le	2220260 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98148>
 221fc7c:	a9b37bfd 	stp	x29, x30, [sp,#-208]!
 221fc80:	910003fd 	mov	x29, sp
 221fc84:	a90363f7 	stp	x23, x24, [sp,#48]
 221fc88:	aa0003f7 	mov	x23, x0
 221fc8c:	90006260 	adrp	x0, 2e6b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a81a8>
 221fc90:	91090000 	add	x0, x0, #0x240
 221fc94:	a90153f3 	stp	x19, x20, [sp,#16]
 221fc98:	9000cdd3 	adrp	x19, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 221fc9c:	910fa273 	add	x19, x19, #0x3e8
 221fca0:	a9025bf5 	stp	x21, x22, [sp,#32]
 221fca4:	9000cdd5 	adrp	x21, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 221fca8:	910f82b5 	add	x21, x21, #0x3e0
 221fcac:	f9004fe0 	str	x0, [sp,#152]
 221fcb0:	91096000 	add	x0, x0, #0x258
 221fcb4:	d2800014 	mov	x20, #0x0                   	// #0
 221fcb8:	52800016 	mov	w22, #0x0                   	// #0
 221fcbc:	a9046bf9 	stp	x25, x26, [sp,#64]
 221fcc0:	a90573fb 	stp	x27, x28, [sp,#80]
 221fcc4:	f90037e0 	str	x0, [sp,#104]
 221fcc8:	f000c820 	adrp	x0, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
 221fccc:	9135a000 	add	x0, x0, #0xd68
 221fcd0:	f9003be0 	str	x0, [sp,#112]
 221fcd4:	d503201f 	nop
 221fcd8:	f94002f8 	ldr	x24, [x23]
 221fcdc:	8b14031b 	add	x27, x24, x20
 221fce0:	aa1b03e0 	mov	x0, x27
 221fce4:	97fff8d3 	bl	221e030 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x95f18>
 221fce8:	f8746b18 	ldr	x24, [x24,x20]
 221fcec:	08dffea0 	ldarb	w0, [x21]
 221fcf0:	36001480 	tbz	w0, #0, 221ff80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97e68>
 221fcf4:	9000cdc0 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 221fcf8:	91104001 	add	x1, x0, #0x410
 221fcfc:	12800019 	mov	w25, #0xffffffff            	// #-1
 221fd00:	885ffc20 	ldaxr	w0, [x1]
 221fd04:	35000060 	cbnz	w0, 221fd10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97bf8>
 221fd08:	8802fc39 	stlxr	w2, w25, [x1]
 221fd0c:	35ffffa2 	cbnz	w2, 221fd00 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97be8>
 221fd10:	7100001f 	cmp	w0, #0x0
 221fd14:	54002ca1 	b.ne	22202a8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x98190>
 221fd18:	52800020 	mov	w0, #0x1                   	// #1
 221fd1c:	b90067e0 	str	w0, [sp,#100]
 221fd20:	08dffea0 	ldarb	w0, [x21]
 221fd24:	360015c0 	tbz	w0, #0, 221ffdc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97ec4>
 221fd28:	b9801a60 	ldrsw	x0, [x19,#24]
 221fd2c:	f9400661 	ldr	x1, [x19,#8]
 221fd30:	9ac00b1a 	udiv	x26, x24, x0
 221fd34:	9b00e35a 	msub	x26, x26, x0, x24
 221fd38:	93407f5c 	sxtw	x28, w26
 221fd3c:	f87c7839 	ldr	x25, [x1,x28,lsl #3]
 221fd40:	b4000259 	cbz	x25, 221fd88 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97c70>
 221fd44:	f9400320 	ldr	x0, [x25]
 221fd48:	eb00031f 	cmp	x24, x0
 221fd4c:	54000ae0 	b.eq	221fea8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97d90>
 221fd50:	aa1903e0 	mov	x0, x25
 221fd54:	14000004 	b	221fd64 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97c4c>
 221fd58:	f9400001 	ldr	x1, [x0]
 221fd5c:	eb01031f 	cmp	x24, x1
 221fd60:	54000a40 	b.eq	221fea8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97d90>
 221fd64:	f9400800 	ldr	x0, [x0,#16]
 221fd68:	b5ffff80 	cbnz	x0, 221fd58 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97c40>
 221fd6c:	aa1903e0 	mov	x0, x25
 221fd70:	14000004 	b	221fd80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97c68>
 221fd74:	f9400001 	ldr	x1, [x0]
 221fd78:	eb01031f 	cmp	x24, x1
 221fd7c:	540015e0 	b.eq	2220038 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97f20>
 221fd80:	f9400800 	ldr	x0, [x0,#16]
 221fd84:	b5ffff80 	cbnz	x0, 221fd74 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97c5c>
 221fd88:	d2800300 	mov	x0, #0x18                  	// #24
 221fd8c:	978813ed 	bl	424d40 <_Znwm@plt>
 221fd90:	b9401a65 	ldr	w5, [x19,#24]
 221fd94:	aa0003e3 	mov	x3, x0
 221fd98:	a9007c18 	stp	x24, xzr, [x0]
 221fd9c:	6b1a00bf 	cmp	w5, w26
 221fda0:	f9000819 	str	x25, [x0,#16]
 221fda4:	54001508 	b.hi	2220044 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97f2c>
 221fda8:	36f8229a 	tbz	w26, #31, 22201f8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x980e0>
 221fdac:	531f78ba 	lsl	w26, w5, #1
 221fdb0:	b9402260 	ldr	w0, [x19,#32]
 221fdb4:	0b050341 	add	w1, w26, w5
 221fdb8:	11000400 	add	w0, w0, #0x1
 221fdbc:	b9002260 	str	w0, [x19,#32]
 221fdc0:	0b417c22 	add	w2, w1, w1, lsr #31
 221fdc4:	6b82041f 	cmp	w0, w2, asr #1
 221fdc8:	5400152c 	b.gt	222006c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97f54>
 221fdcc:	91002060 	add	x0, x3, #0x8
 221fdd0:	f900001b 	str	x27, [x0]
 221fdd4:	b94067e0 	ldr	w0, [sp,#100]
 221fdd8:	34000bc0 	cbz	w0, 221ff50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x97e38>
 221fddc:	9000cdc0 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 221fde0:	91104001 	add	x1, x0, #0x410
 221fde4:	12800002 	mov	w2, #0xffffffff            	// #-1
 221fde8:	885ffc20 	ldaxr	w0, [x1]
 221fdec:	6b02001f 	cmp	w0, w2
