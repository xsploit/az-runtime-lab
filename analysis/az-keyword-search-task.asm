
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1eef4d0: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
 1eef4d4: b0007661     	adrp	x1, 0x2dbc000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7f91a8>
 1eef4d8: 91128021     	add	x1, x1, #0x4a0
 1eef4dc: 91000421     	add	x1, x1, #0x1
 1eef4e0: 910003fd     	mov	x29, sp
 1eef4e4: 9100a3e0     	add	x0, sp, #0x28
 1eef4e8: f9000bf3     	str	x19, [sp, #0x10]
 1eef4ec: aa0803f3     	mov	x19, x8
 1eef4f0: 9410ab58     	bl	0x231a250 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x192138>
 1eef4f4: aa1303e8     	mov	x8, x19
 1eef4f8: 9100a3e0     	add	x0, sp, #0x28
 1eef4fc: 940c44d1     	bl	0x2200840 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x78728>
 1eef500: aa1303e0     	mov	x0, x19
 1eef504: f9400bf3     	ldr	x19, [sp, #0x10]
 1eef508: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 1eef50c: d65f03c0     	ret
 1eef510: 88dffc00     	ldar	w0, [x0]
 1eef514: 7100001f     	cmp	w0, #0x0
 1eef518: 5400004c     	b.gt	0x1eef520 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef698>
 1eef51c: d65f03c0     	ret
 1eef520: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
 1eef524: d2800001     	mov	x1, #0x0                // =0
 1eef528: 52800000     	mov	w0, #0x0                // =0
 1eef52c: 910003fd     	mov	x29, sp
 1eef530: 940c4464     	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1eef534: a8c17bfd     	ldp	x29, x30, [sp], #0x10
 1eef538: d65f03c0     	ret
 1eef53c: d503201f     	nop
 1eef540: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
 1eef544: b0007661     	adrp	x1, 0x2dbc000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7f91a8>
 1eef548: 91128021     	add	x1, x1, #0x4a0
 1eef54c: 910003fd     	mov	x29, sp
 1eef550: a90153f3     	stp	x19, x20, [sp, #0x10]
 1eef554: aa0003f4     	mov	x20, x0
 1eef558: d000e5a0     	adrp	x0, 0x3ba5000 <stdout+0x63f40>
 1eef55c: 91018021     	add	x1, x1, #0x60
 1eef560: 91186013     	add	x19, x0, #0x618
 1eef564: f9000281     	str	x1, [x20]
 1eef568: 08dffe60     	ldarb	w0, [x19]
 1eef56c: 360001e0     	tbz	w0, #0x0, 0x1eef5a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef720>
 1eef570: 91002260     	add	x0, x19, #0x8
 1eef574: 885ffc01     	ldaxr	w1, [x0]
 1eef578: 51000421     	sub	w1, w1, #0x1
 1eef57c: 8802fc01     	stlxr	w2, w1, [x0]
 1eef580: 35ffffa2     	cbnz	w2, 0x1eef574 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef6ec>
 1eef584: 37f803c1     	tbnz	w1, #0x1f, 0x1eef5fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef774>
 1eef588: 91008280     	add	x0, x20, #0x20
 1eef58c: 9410341d     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1eef590: b9000a9f     	str	wzr, [x20, #0x8]
 1eef594: aa1403e0     	mov	x0, x20
 1eef598: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1eef59c: d2800601     	mov	x1, #0x30               // =48
 1eef5a0: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 1eef5a4: 1794dc2f     	b	0x426660 <_ZdlPvm@plt>
 1eef5a8: aa1303e0     	mov	x0, x19
 1eef5ac: 9794db2d     	bl	0x426260 <__cxa_guard_acquire@plt>
 1eef5b0: 34fffe00     	cbz	w0, 0x1eef570 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef6e8>
 1eef5b4: aa1303e0     	mov	x0, x19
 1eef5b8: b9000a7f     	str	wzr, [x19, #0x8]
 1eef5bc: f90013f5     	str	x21, [sp, #0x20]
 1eef5c0: 9794dca0     	bl	0x426840 <__cxa_guard_release@plt>
 1eef5c4: 91002275     	add	x21, x19, #0x8
 1eef5c8: f000e1a2     	adrp	x2, 0x3b26000
 1eef5cc: aa1503e1     	mov	x1, x21
 1eef5d0: 90000000     	adrp	x0, 0x1eef000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef178>
 1eef5d4: 9135a042     	add	x2, x2, #0xd68
 1eef5d8: 91144000     	add	x0, x0, #0x510
 1eef5dc: 9794de35     	bl	0x426eb0 <__cxa_atexit@plt>
 1eef5e0: f94013f5     	ldr	x21, [sp, #0x20]
 1eef5e4: 91002260     	add	x0, x19, #0x8
 1eef5e8: 885ffc01     	ldaxr	w1, [x0]
 1eef5ec: 51000421     	sub	w1, w1, #0x1
 1eef5f0: 8802fc01     	stlxr	w2, w1, [x0]
 1eef5f4: 35ffffa2     	cbnz	w2, 0x1eef5e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef760>
 1eef5f8: 36fffc81     	tbz	w1, #0x1f, 0x1eef588 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef700>
 1eef5fc: d2800001     	mov	x1, #0x0                // =0
 1eef600: 52800000     	mov	w0, #0x0                // =0
 1eef604: 940c442f     	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1eef608: 91008280     	add	x0, x20, #0x20
 1eef60c: 941033fd     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1eef610: b9000a9f     	str	wzr, [x20, #0x8]
 1eef614: aa1403e0     	mov	x0, x20
 1eef618: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1eef61c: d2800601     	mov	x1, #0x30               // =48
 1eef620: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 1eef624: 1794dc0f     	b	0x426660 <_ZdlPvm@plt>
 1eef628: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
 1eef62c: 910003fd     	mov	x29, sp
 1eef630: f9400c01     	ldr	x1, [x0, #0x18]
 1eef634: f9000bf3     	str	x19, [sp, #0x10]
 1eef638: f9402c33     	ldr	x19, [x1, #0x58]
 1eef63c: b4000133     	cbz	x19, 0x1eef660 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef7d8>
 1eef640: 91008001     	add	x1, x0, #0x20
 1eef644: 9100a3e0     	add	x0, sp, #0x28
 1eef648: 94107fba     	bl	0x230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x187418>
 1eef64c: 9100a3e1     	add	x1, sp, #0x28
 1eef650: aa1303e0     	mov	x0, x19
 1eef654: 97ff16b9     	bl	0x1eb5138 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6b52b0>
 1eef658: 9100a3e0     	add	x0, sp, #0x28
 1eef65c: 941033e9     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1eef660: f9400bf3     	ldr	x19, [sp, #0x10]
 1eef664: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 1eef668: d65f03c0     	ret
 1eef66c: aa0003f3     	mov	x19, x0
 1eef670: 9100a3e0     	add	x0, sp, #0x28
 1eef674: 941033e3     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1eef678: aa1303e0     	mov	x0, x19
 1eef67c: 9794d5a5     	bl	0x424d10 <_Unwind_Resume@plt>
 1eef680: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
 1eef684: b0007661     	adrp	x1, 0x2dbc000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7f91a8>
 1eef688: 91128021     	add	x1, x1, #0x4a0
 1eef68c: 910003fd     	mov	x29, sp
 1eef690: a90153f3     	stp	x19, x20, [sp, #0x10]
 1eef694: aa0003f4     	mov	x20, x0
 1eef698: d000e5a0     	adrp	x0, 0x3ba5000 <stdout+0x63f40>
 1eef69c: 91018021     	add	x1, x1, #0x60
 1eef6a0: 91186013     	add	x19, x0, #0x618
 1eef6a4: f9000281     	str	x1, [x20]
 1eef6a8: 08dffe60     	ldarb	w0, [x19]
 1eef6ac: 360001a0     	tbz	w0, #0x0, 0x1eef6e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef858>
 1eef6b0: 91002260     	add	x0, x19, #0x8
 1eef6b4: 885ffc01     	ldaxr	w1, [x0]
 1eef6b8: 51000421     	sub	w1, w1, #0x1
 1eef6bc: 8802fc01     	stlxr	w2, w1, [x0]
 1eef6c0: 35ffffa2     	cbnz	w2, 0x1eef6b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef82c>
 1eef6c4: 37f80381     	tbnz	w1, #0x1f, 0x1eef734 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef8ac>
 1eef6c8: 91008280     	add	x0, x20, #0x20
 1eef6cc: 941033cd     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1eef6d0: b9000a9f     	str	wzr, [x20, #0x8]
 1eef6d4: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1eef6d8: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 1eef6dc: d65f03c0     	ret
 1eef6e0: aa1303e0     	mov	x0, x19
 1eef6e4: 9794dadf     	bl	0x426260 <__cxa_guard_acquire@plt>
 1eef6e8: 34fffe40     	cbz	w0, 0x1eef6b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef828>
 1eef6ec: aa1303e0     	mov	x0, x19
 1eef6f0: b9000a7f     	str	wzr, [x19, #0x8]
 1eef6f4: f90013f5     	str	x21, [sp, #0x20]
 1eef6f8: 9794dc52     	bl	0x426840 <__cxa_guard_release@plt>
 1eef6fc: 91002275     	add	x21, x19, #0x8
 1eef700: f000e1a2     	adrp	x2, 0x3b26000
 1eef704: aa1503e1     	mov	x1, x21
 1eef708: 90000000     	adrp	x0, 0x1eef000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef178>
 1eef70c: 9135a042     	add	x2, x2, #0xd68
 1eef710: 91144000     	add	x0, x0, #0x510
 1eef714: 9794dde7     	bl	0x426eb0 <__cxa_atexit@plt>
 1eef718: f94013f5     	ldr	x21, [sp, #0x20]
 1eef71c: 91002260     	add	x0, x19, #0x8
 1eef720: 885ffc01     	ldaxr	w1, [x0]
 1eef724: 51000421     	sub	w1, w1, #0x1
 1eef728: 8802fc01     	stlxr	w2, w1, [x0]
 1eef72c: 35ffffa2     	cbnz	w2, 0x1eef720 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef898>
 1eef730: 36fffcc1     	tbz	w1, #0x1f, 0x1eef6c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6ef840>
 1eef734: d2800001     	mov	x1, #0x0                // =0
 1eef738: 52800000     	mov	w0, #0x0                // =0
 1eef73c: 940c43e1     	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1eef740: 91008280     	add	x0, x20, #0x20
 1eef744: 941033af     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1eef748: b9000a9f     	str	wzr, [x20, #0x8]
 1eef74c: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1eef750: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 1eef754: d65f03c0     	ret
