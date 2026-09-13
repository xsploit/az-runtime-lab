
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>:
 232c0e0:	1783ebac 	b	426f90 <pthread_mutex_lock@plt>
 232c0e4:	d503201f 	nop
 232c0e8:	d503201f 	nop
 232c0ec:	d503201f 	nop
 232c0f0:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 232c0f4:	910003fd 	mov	x29, sp
 232c0f8:	9783e5ae 	bl	4257b0 <pthread_mutex_trylock@plt>
 232c0fc:	7100001f 	cmp	w0, #0x0
 232c100:	1a9f17e0 	cset	w0, eq
 232c104:	a8c17bfd 	ldp	x29, x30, [sp],#16
 232c108:	d65f03c0 	ret
 232c10c:	d503201f 	nop
 232c110:	1783ea4c 	b	426a40 <pthread_mutex_unlock@plt>
 232c114:	d503201f 	nop
 232c118:	d503201f 	nop
 232c11c:	d503201f 	nop
 232c120:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 232c124:	910003fd 	mov	x29, sp
 232c128:	f9000bf3 	str	x19, [sp,#16]
 232c12c:	aa0003f3 	mov	x19, x0
