
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f66dc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e5c4>:
 21f66dc:	b941d720 	ldr	w0, [x25,#468]
 21f66e0:	52800023 	mov	w3, #0x1                   	// #1
 21f66e4:	b9408fe2 	ldr	w2, [sp,#140]
 21f66e8:	f9403fe1 	ldr	x1, [sp,#120]
 21f66ec:	9788c031 	bl	4267b0 <epoll_wait@plt>
 21f66f0:	2a0003f4 	mov	w20, w0
 21f66f4:	37f80f20 	tbnz	w0, #31, 21f68d8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e7c0>
 21f66f8:	9000cf00 	adrp	x0, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f66fc:	f946d800 	ldr	x0, [x0,#3504]
 21f6700:	b4000040 	cbz	x0, 21f6708 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e5f0>
 21f6704:	97ffff4b 	bl	21f6430 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e318>
