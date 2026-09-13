
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002375420 <_ZNSt8functionIFvvEEC2ERKS1_>:
 24fb350:      	stp	x29, x30, [sp, #-0xf0]!
 24fb354:      	mov	x29, sp
 24fb358:      	stp	x19, x20, [sp, #0x10]
 24fb35c:      	mov	x19, x0
 24fb360:      	bl	0x21b59d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x2d8b8>
 24fb364:      	bl	0x21b59b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x2d898>
 24fb368:      	cbnz	w0, 0x24fb470 <_ZNSt8functionIFvvEEC2ERKS1_+0x186050>
 24fb36c:      	ldr	w0, [x19, #0x54]
 24fb370:      	cbnz	w0, 0x24fb3b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x185f90>
 24fb374:      	ldr	w0, [x19, #0x40]
 24fb378:      	cbnz	w0, 0x24fb488 <_ZNSt8functionIFvvEEC2ERKS1_+0x186068>
 24fb37c:      	bl	0x231f0d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x196fb8>
 24fb380:      	ldr	w1, [x19, #0x28]
 24fb384:      	add	w1, w1, #0xbb8
 24fb388:      	cmp	w0, w1
 24fb38c:      	b.hi	0x24fb4a4 <_ZNSt8functionIFvvEEC2ERKS1_+0x186084>
 24fb390:      	adrp	x1, 0x315e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xb9b1a8>
 24fb394:      	adrp	x0, 0x315e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xb9b1a8>
 24fb398:      	add	x1, x1, #0xd08
 24fb39c:      	add	x0, x0, #0xce0
 24fb3a0:      	bl	0x2539000 <_ZNSt8functionIFvvEEC2ERKS1_+0x1c3be0>
 24fb3a4:      	ldp	x19, x20, [sp, #0x10]
 24fb3a8:      	ldp	x29, x30, [sp], #0xf0
 24fb3ac:      	ret
 24fb3b0:      	ldr	x0, [x19, #0x48]
 24fb3b4:      	bl	0x2432ac0 <_ZNSt8functionIFvvEEC2ERKS1_+0xbd6a0>
 24fb3b8:      	tst	w0, #0xff
 24fb3bc:      	b.eq	0x24fb4cc <_ZNSt8functionIFvvEEC2ERKS1_+0x1860ac>
 24fb3c0:      	adrp	x0, 0x3bd7000 <stdout+0x95f40>
 24fb3c4:      	str	x21, [sp, #0x20]
 24fb3c8:      	ldr	x20, [x0, #0xea8]
 24fb3cc:      	cbz	x20, 0x24fb3d8 <_ZNSt8functionIFvvEEC2ERKS1_+0x185fb8>
 24fb3d0:      	mov	x0, x20
 24fb3d4:      	bl	0x425a30 <XLockDisplay@plt>
 24fb3d8:      	adrp	x21, 0x24e1000 <_ZNSt8functionIFvvEEC2ERKS1_+0x16bbe0>
 24fb3dc:      	add	x21, x21, #0xf70
 24fb3e0:      	stp	xzr, xzr, [sp, #0x30]
 24fb3e4:      	stp	xzr, xzr, [sp, #0x40]
 24fb3e8:      	stp	xzr, xzr, [sp, #0x50]
 24fb3ec:      	stp	xzr, xzr, [sp, #0x60]
 24fb3f0:      	stp	xzr, xzr, [sp, #0x70]
 24fb3f4:      	stp	xzr, xzr, [sp, #0x80]
 24fb3f8:      	stp	xzr, xzr, [sp, #0x90]
 24fb3fc:      	stp	xzr, xzr, [sp, #0xa0]
 24fb400:      	stp	xzr, xzr, [sp, #0xb0]
 24fb404:      	stp	xzr, xzr, [sp, #0xc0]
 24fb408:      	stp	xzr, xzr, [sp, #0xd0]
 24fb40c:      	stp	xzr, xzr, [sp, #0xe0]
 24fb410:      	b	0x24fb420 <_ZNSt8functionIFvvEEC2ERKS1_+0x186000>
 24fb414:      	ldr	w0, [x19, #0x54]
 24fb418:      	sub	w0, w0, #0x1
 24fb41c:      	str	w0, [x19, #0x54]
 24fb420:      	mov	x3, #0x0                // =0
 24fb424:      	mov	x2, x21
 24fb428:      	add	x1, sp, #0x30
 24fb42c:      	mov	x0, x20
 24fb430:      	bl	0x426880 <XCheckIfEvent@plt>
 24fb434:      	cbnz	w0, 0x24fb414 <_ZNSt8functionIFvvEEC2ERKS1_+0x185ff4>
 24fb438:      	cbz	x20, 0x24fb444 <_ZNSt8functionIFvvEEC2ERKS1_+0x186024>
 24fb43c:      	mov	x0, x20
