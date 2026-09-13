
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002188118 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_>:
 230f530: f9400021     	ldr	x1, [x1]
 230f534: f9000001     	str	x1, [x0]
 230f538: 90007102     	adrp	x2, 0x312f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xb6c1a8>
 230f53c: 91094042     	add	x2, x2, #0x250
 230f540: d1004020     	sub	x0, x1, #0x10
 230f544: eb00005f     	cmp	x2, x0
 230f548: 540000a0     	b.eq	0x230f55c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x187444>
 230f54c: 885ffc01     	ldaxr	w1, [x0]
 230f550: 11000421     	add	w1, w1, #0x1
 230f554: 8802fc01     	stlxr	w2, w1, [x0]
 230f558: 35ffffa2     	cbnz	w2, 0x230f54c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x187434>
 230f55c: d65f03c0     	ret
 230f560: f9400023     	ldr	x3, [x1]
 230f564: f9400002     	ldr	x2, [x0]
 230f568: f9000003     	str	x3, [x0]
 230f56c: f9000022     	str	x2, [x1]
 230f570: d65f03c0     	ret
 230f574: d503201f     	nop
 230f578: d503201f     	nop
 230f57c: d503201f     	nop
 230f580: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 230f584: 910003fd     	mov	x29, sp
 230f588: a90153f3     	stp	x19, x20, [sp, #0x10]
 230f58c: aa0003f4     	mov	x20, x0
 230f590: 90007113     	adrp	x19, 0x312f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xb6c1a8>
 230f594: 91094273     	add	x19, x19, #0x250
 230f598: f9400000     	ldr	x0, [x0]
 230f59c: d1004000     	sub	x0, x0, #0x10
 230f5a0: eb13001f     	cmp	x0, x19
 230f5a4: 54000040     	b.eq	0x230f5ac <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x187494>
 230f5a8: 97ffb40a     	bl	0x22fc5d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744b8>
 230f5ac: 91004273     	add	x19, x19, #0x10
 230f5b0: f9000293     	str	x19, [x20]
 230f5b4: a94153f3     	ldp	x19, x20, [sp, #0x10]
 230f5b8: a8c27bfd     	ldp	x29, x30, [sp], #0x20
 230f5bc: d65f03c0     	ret
 230f5c0: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
 230f5c4: 90007102     	adrp	x2, 0x312f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xb6c1a8>
 230f5c8: 91094042     	add	x2, x2, #0x250
 230f5cc: 910003fd     	mov	x29, sp
 230f5d0: f9400023     	ldr	x3, [x1]
 230f5d4: f9000bf3     	str	x19, [sp, #0x10]
 230f5d8: aa0003f3     	mov	x19, x0
 230f5dc: d1004060     	sub	x0, x3, #0x10
 230f5e0: eb00005f     	cmp	x2, x0
 230f5e4: 540000c0     	b.eq	0x230f5fc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1874e4>
 230f5e8: 885ffc03     	ldaxr	w3, [x0]
 230f5ec: 11000463     	add	w3, w3, #0x1
 230f5f0: 8804fc03     	stlxr	w4, w3, [x0]
 230f5f4: 35ffffa4     	cbnz	w4, 0x230f5e8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1874d0>
 230f5f8: f9400023     	ldr	x3, [x1]
 230f5fc: c85ffe60     	ldaxr	x0, [x19]
 230f600: c801fe63     	stlxr	w1, x3, [x19]
 230f604: 35ffffc1     	cbnz	w1, 0x230f5fc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1874e4>
 230f608: d1004000     	sub	x0, x0, #0x10
 230f60c: eb02001f     	cmp	x0, x2
