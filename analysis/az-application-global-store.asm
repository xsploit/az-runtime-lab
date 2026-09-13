
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002188118 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_>:
 218cf40: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
 218cf44: 910003fd     	mov	x29, sp
 218cf48: a90153f3     	stp	x19, x20, [sp, #0x10]
 218cf4c: aa0003f3     	mov	x19, x0
 218cf50: 91012014     	add	x20, x0, #0x48
 218cf54: a9025bf5     	stp	x21, x22, [sp, #0x20]
 218cf58: 91024015     	add	x21, x0, #0x90
 218cf5c: 12001c56     	and	w22, w2, #0xff
 218cf60: f9001fe1     	str	x1, [sp, #0x38]
 218cf64: 940b4a8f     	bl	0x245f9a0 <_ZNSt8functionIFvvEEC2ERKS1_+0xea580>
 218cf68: 90006622     	adrp	x2, 0x2e50000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x88d1a8>
 218cf6c: 913f2042     	add	x2, x2, #0xfc8
 218cf70: b0006620     	adrp	x0, 0x2e51000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x88e1a8>
 218cf74: 91026000     	add	x0, x0, #0x98
 218cf78: f9000262     	str	x2, [x19]
 218cf7c: f9000e60     	str	x0, [x19, #0x18]
 218cf80: aa1403e0     	mov	x0, x20
 218cf84: b9002a7f     	str	wzr, [x19, #0x28]
 218cf88: 79005a7f     	strh	wzr, [x19, #0x2c]
 218cf8c: 3900ba7f     	strb	wzr, [x19, #0x2e]
 218cf90: f9001a7f     	str	xzr, [x19, #0x30]
 218cf94: b9003a7f     	str	wzr, [x19, #0x38]
 218cf98: b900427f     	str	wzr, [x19, #0x40]
 218cf9c: 94067b61     	bl	0x232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a3c08>
 218cfa0: f9003e7f     	str	xzr, [x19, #0x78]
 218cfa4: b9003a9f     	str	wzr, [x20, #0x38]
 218cfa8: aa1503e0     	mov	x0, x21
 218cfac: b900429f     	str	wzr, [x20, #0x40]
 218cfb0: 94060958     	bl	0x230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1873f8>
 218cfb4: b000d240     	adrp	x0, 0x3bd5000 <stdout+0x93f40>
 218cfb8: f906b813     	str	x19, [x0, #0xd70]
 218cfbc: 94071d49     	bl	0x23544e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1cc3c8>
