
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021c5660 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3d548>:
 21c5660:	a9b57bfd 	stp	x29, x30, [sp,#-176]!
 21c5664:	910003fd 	mov	x29, sp
 21c5668:	a90153f3 	stp	x19, x20, [sp,#16]
 21c566c:	aa0003f3 	mov	x19, x0
 21c5670:	aa0103f4 	mov	x20, x1
 21c5674:	a9025bf5 	stp	x21, x22, [sp,#32]
 21c5678:	aa0203f6 	mov	x22, x2
 21c567c:	b000d095 	adrp	x21, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21c5680:	9121c2b5 	add	x21, x21, #0x870
 21c5684:	a90363f7 	stp	x23, x24, [sp,#48]
 21c5688:	aa0403f8 	mov	x24, x4
 21c568c:	aa0503f7 	mov	x23, x5
 21c5690:	a9046bf9 	stp	x25, x26, [sp,#64]
 21c5694:	a90573fb 	stp	x27, x28, [sp,#80]
 21c5698:	aa0303fb 	mov	x27, x3
 21c569c:	08dffea0 	ldarb	w0, [x21]
 21c56a0:	b000d099 	adrp	x25, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21c56a4:	36001620 	tbz	w0, #0, 21c5968 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3d850>
 21c56a8:	aa1303f5 	mov	x21, x19
 21c56ac:	b9487b20 	ldr	w0, [x25,#2168]
 21c56b0:	b9000a60 	str	w0, [x19,#8]
 21c56b4:	91012279 	add	x25, x19, #0x48
 21c56b8:	b00064a0 	adrp	x0, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c56bc:	912ce000 	add	x0, x0, #0xb38
 21c56c0:	f80106a0 	str	x0, [x21],#16
 21c56c4:	9101627a 	add	x26, x19, #0x58
 21c56c8:	9101c27c 	add	x28, x19, #0x70
 21c56cc:	aa1503e0 	mov	x0, x21
 21c56d0:	9400ad3c 	bl	21f0bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68aa8>
 21c56d4:	b00064a0 	adrp	x0, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c56d8:	912da000 	add	x0, x0, #0xb68
 21c56dc:	b00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c56e0:	912e8021 	add	x1, x1, #0xba0
 21c56e4:	f9400302 	ldr	x2, [x24]
 21c56e8:	f9000260 	str	x0, [x19]
 21c56ec:	f9000a61 	str	x1, [x19,#16]
 21c56f0:	aa1c03e0 	mov	x0, x28
 21c56f4:	f9001a7b 	str	x27, [x19,#48]
 21c56f8:	aa1403e1 	mov	x1, x20
 21c56fc:	f900031f 	str	xzr, [x24]
 21c5700:	f9001e62 	str	x2, [x19,#56]
 21c5704:	f94002e2 	ldr	x2, [x23]
 21c5708:	f90002ff 	str	xzr, [x23]
 21c570c:	a9047e62 	stp	x2, xzr, [x19,#64]
 21c5710:	b9400e82 	ldr	w2, [x20,#12]
 21c5714:	b9000b3f 	str	wzr, [x25,#8]
 21c5718:	f9002e7f 	str	xzr, [x19,#88]
 21c571c:	b9000b5f 	str	wzr, [x26,#8]
 21c5720:	b9006a62 	str	w2, [x19,#104]
 21c5724:	94052783 	bl	230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x187418>
 21c5728:	f9401e60 	ldr	x0, [x19,#56]
 21c572c:	b4001440 	cbz	x0, 21c59b4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3d89c>
 21c5730:	f9402260 	ldr	x0, [x19,#64]
 21c5734:	b4001400 	cbz	x0, 21c59b4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3d89c>
 21c5738:	f9401a64 	ldr	x4, [x19,#48]
 21c573c:	aa1403e1 	mov	x1, x20
 21c5740:	b9400a82 	ldr	w2, [x20,#8]
 21c5744:	aa0403e0 	mov	x0, x4
 21c5748:	b9401283 	ldr	w3, [x20,#16]
 21c574c:	f9400084 	ldr	x4, [x4]
 21c5750:	f9400c84 	ldr	x4, [x4,#24]
 21c5754:	d63f0080 	blr	x4
 21c5758:	f9401a61 	ldr	x1, [x19,#48]
 21c575c:	aa0103e0 	mov	x0, x1
 21c5760:	f9400021 	ldr	x1, [x1]
 21c5764:	f9400821 	ldr	x1, [x1,#16]
 21c5768:	d63f0020 	blr	x1
 21c576c:	37f802a0 	tbnz	w0, #31, 21c57c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3d6a8>
 21c5770:	f9401a61 	ldr	x1, [x19,#48]
 21c5774:	f94002c2 	ldr	x2, [x22]
 21c5778:	aa0103e0 	mov	x0, x1
 21c577c:	f9400021 	ldr	x1, [x1]
 21c5780:	f9400857 	ldr	x23, [x2,#16]
 21c5784:	f9400821 	ldr	x1, [x1,#16]
 21c5788:	d63f0020 	blr	x1
 21c578c:	2a0003f8 	mov	w24, w0
 21c5790:	d2800600 	mov	x0, #0x30                  	// #48
 21c5794:	97897d6b 	bl	424d40 <_Znwm@plt>
 21c5798:	aa0003f4 	mov	x20, x0
 21c579c:	2a1803e1 	mov	w1, w24
 21c57a0:	52800005 	mov	w5, #0x0                   	// #0
 21c57a4:	aa1303e4 	mov	x4, x19
 21c57a8:	52800003 	mov	w3, #0x0                   	// #0
 21c57ac:	52800022 	mov	w2, #0x1                   	// #1
 21c57b0:	9400a9ac 	bl	21efe60 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67d48>
 21c57b4:	aa1403e1 	mov	x1, x20
 21c57b8:	aa1603e0 	mov	x0, x22
 21c57bc:	d63f02e0 	blr	x23
 21c57c0:	f9401e61 	ldr	x1, [x19,#56]
 21c57c4:	aa0103e0 	mov	x0, x1
 21c57c8:	f9400021 	ldr	x1, [x1]
 21c57cc:	f9400c21 	ldr	x1, [x1,#24]
 21c57d0:	d63f0020 	blr	x1
 21c57d4:	2a0003f4 	mov	w20, w0
 21c57d8:	37f82840 	tbnz	w0, #31, 21c5ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3dbc8>
 21c57dc:	11000816 	add	w22, w0, #0x2
