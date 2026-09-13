
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1eefbb8: a9b07bfd     	stp	x29, x30, [sp, #-0x100]!
 1eefbbc: 910003fd     	mov	x29, sp
 1eefbc0: a90153f3     	stp	x19, x20, [sp, #0x10]
 1eefbc4: aa0003f3     	mov	x19, x0
 1eefbc8: 910223e0     	add	x0, sp, #0x88
 1eefbcc: a9025bf5     	stp	x21, x22, [sp, #0x20]
 1eefbd0: f90043f3     	str	x19, [sp, #0x80]
 1eefbd4: 94107e57     	bl	0x230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x187418>
 1eefbd8: 9410f81e     	bl	0x232dc50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a5b38>
 1eefbdc: aa0003f4     	mov	x20, x0
 1eefbe0: 94129804     	bl	0x2395bf0 <_ZNSt8functionIFvvEEC2ERKS1_+0x207d0>
 1eefbe4: b4000040     	cbz	x0, 0x1eefbec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6efd64>
 1eefbe8: f9400800     	ldr	x0, [x0, #0x10]
 1eefbec: eb00029f     	cmp	x20, x0
 1eefbf0: 54000261     	b.ne	0x1eefc3c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6efdb4>
 1eefbf4: f94043e0     	ldr	x0, [sp, #0x80]
 1eefbf8: f9402c13     	ldr	x19, [x0, #0x58]
 1eefbfc: b4000153     	cbz	x19, 0x1eefc24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6efd9c>
 1eefc00: 9101e3f4     	add	x20, sp, #0x78
 1eefc04: 910223e1     	add	x1, sp, #0x88
 1eefc08: aa1403e0     	mov	x0, x20
 1eefc0c: 94107e49     	bl	0x230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x187418>
 1eefc10: aa1403e1     	mov	x1, x20
 1eefc14: aa1303e0     	mov	x0, x19
 1eefc18: 97ff1548     	bl	0x1eb5138 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6b52b0>
 1eefc1c: aa1403e0     	mov	x0, x20
 1eefc20: 94103278     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1eefc24: 910223e0     	add	x0, sp, #0x88
 1eefc28: 94103276     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1eefc2c: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1eefc30: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 1eefc34: a8d07bfd     	ldp	x29, x30, [sp], #0x100
 1eefc38: d65f03c0     	ret
 1eefc3c: 940cc539     	bl	0x2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x99008>
 1eefc40: 1e6c1000     	fmov	d0, #0.50000000
 1eefc44: 90003721     	adrp	x1, 0x25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x101a8>
 1eefc48: 9118e021     	add	x1, x1, #0x638
 1eefc4c: f90067e1     	str	x1, [sp, #0xc8]
 1eefc50: fd006be0     	str	d0, [sp, #0xd0]
 1eefc54: 72001c1f     	tst	w0, #0xff
 1eefc58: 2f00e400     	movi	d0, #0000000000000000
 1eefc5c: 54000080     	b.eq	0x1eefc6c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6efde4>
 1eefc60: 9000e740     	adrp	x0, 0x3bd7000 <stdout+0x95f40>
 1eefc64: 394de000     	ldrb	w0, [x0, #0x378]
 1eefc68: 34000b20     	cbz	w0, 0x1eefdcc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6eff44>
 1eefc6c: f9400a63     	ldr	x3, [x19, #0x10]
 1eefc70: f9007bff     	str	xzr, [sp, #0xf0]
 1eefc74: d2800102     	mov	x2, #0x8                // =8
 1eefc78: d2800601     	mov	x1, #0x30               // =48
 1eefc7c: aa0303e0     	mov	x0, x3
 1eefc80: fd006fe0     	str	d0, [sp, #0xd8]
 1eefc84: f9400063     	ldr	x3, [x3]
 1eefc88: f9400863     	ldr	x3, [x3, #0x10]
 1eefc8c: d63f0060     	blr	x3
 1eefc90: aa0003f5     	mov	x21, x0
 1eefc94: b4001740     	cbz	x0, 0x1eeff7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6f00f4>
 1eefc98: 9100a260     	add	x0, x19, #0x28
 1eefc9c: a90363f7     	stp	x23, x24, [sp, #0x30]
 1eefca0: c85ffc17     	ldaxr	x23, [x0]
 1eefca4: 910006f7     	add	x23, x23, #0x1
 1eefca8: c801fc17     	stlxr	w1, x23, [x0]
 1eefcac: 35ffffa1     	cbnz	w1, 0x1eefca0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6efe18>
 1eefcb0: d000e2b4     	adrp	x20, 0x3b45000 <stdout+0x3f40>
 1eefcb4: 91130294     	add	x20, x20, #0x4c0
 1eefcb8: 08dffe80     	ldarb	w0, [x20]
 1eefcbc: d000e2b6     	adrp	x22, 0x3b45000 <stdout+0x3f40>
 1eefcc0: 36000d20     	tbz	w0, #0x0, 0x1eefe64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6effdc>
 1eefcc4: b0007660     	adrp	x0, 0x2dbc000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7f91a8>
 1eefcc8: 91128000     	add	x0, x0, #0x4a0
 1eefccc: 91018000     	add	x0, x0, #0x60
 1eefcd0: b944cac1     	ldr	w1, [x22, #0x4c8]
 1eefcd4: f94043e2     	ldr	x2, [sp, #0x80]
 1eefcd8: f90002a0     	str	x0, [x21]
 1eefcdc: 910082a0     	add	x0, x21, #0x20
 1eefce0: b9000aa1     	str	w1, [x21, #0x8]
 1eefce4: a9010ab7     	stp	x23, x2, [x21, #0x10]
 1eefce8: 910223e1     	add	x1, sp, #0x88
 1eefcec: d000e5b4     	adrp	x20, 0x3ba5000 <stdout+0x63f40>
 1eefcf0: 94107e10     	bl	0x230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x187418>
 1eefcf4: 91186294     	add	x20, x20, #0x618
 1eefcf8: 08dffe80     	ldarb	w0, [x20]
 1eefcfc: 36000980     	tbz	w0, #0x0, 0x1eefe2c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6effa4>
 1eefd00: 91002294     	add	x20, x20, #0x8
 1eefd04: 885ffe80     	ldaxr	w0, [x20]
 1eefd08: 11000400     	add	w0, w0, #0x1
 1eefd0c: 8801fe80     	stlxr	w1, w0, [x20]
 1eefd10: 35ffffa1     	cbnz	w1, 0x1eefd04 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6efe7c>
 1eefd14: a94363f7     	ldp	x23, x24, [sp, #0x30]
 1eefd18: fd406fe0     	ldr	d0, [sp, #0xd8]
 1eefd1c: 1e602008     	fcmp	d0, #0.0
 1eefd20: 540005a1     	b.ne	0x1eefdd4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6eff4c>
 1eefd24: f9407be3     	ldr	x3, [sp, #0xf0]
 1eefd28: b40000a3     	cbz	x3, 0x1eefd3c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6efeb4>
 1eefd2c: 910383e1     	add	x1, sp, #0xe0
 1eefd30: 52800062     	mov	w2, #0x3                // =3
 1eefd34: aa0103e0     	mov	x0, x1
 1eefd38: d63f0060     	blr	x3
 1eefd3c: 91002273     	add	x19, x19, #0x8
 1eefd40: aa1503e1     	mov	x1, x21
 1eefd44: aa1303e0     	mov	x0, x19
 1eefd48: 940c6852     	bl	0x2209e90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x81d78>
 1eefd4c: b4fff6c0     	cbz	x0, 0x1eefc24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6efd9c>
 1eefd50: f9400e60     	ldr	x0, [x19, #0x18]
 1eefd54: b4fff680     	cbz	x0, 0x1eefc24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6efd9c>
 1eefd58: 940cc4f2     	bl	0x2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x99008>
 1eefd5c: 1e6c1000     	fmov	d0, #0.50000000
 1eefd60: 90003721     	adrp	x1, 0x25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x101a8>
 1eefd64: 91196021     	add	x1, x1, #0x658
 1eefd68: f9004be1     	str	x1, [sp, #0x90]
 1eefd6c: fd004fe0     	str	d0, [sp, #0x98]
 1eefd70: 72001c1f     	tst	w0, #0xff
 1eefd74: 2f00e400     	movi	d0, #0000000000000000
 1eefd78: 54000080     	b.eq	0x1eefd88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6eff00>
 1eefd7c: 9000e740     	adrp	x0, 0x3bd7000 <stdout+0x95f40>
 1eefd80: 394de000     	ldrb	w0, [x0, #0x378]
 1eefd84: 34000cc0     	cbz	w0, 0x1eeff1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6f0094>
 1eefd88: f9400e61     	ldr	x1, [x19, #0x18]
 1eefd8c: f9005fff     	str	xzr, [sp, #0xb8]
 1eefd90: fd0053e0     	str	d0, [sp, #0xa0]
 1eefd94: aa0103e0     	mov	x0, x1
 1eefd98: f9400021     	ldr	x1, [x1]
 1eefd9c: f9400821     	ldr	x1, [x1, #0x10]
 1eefda0: d63f0020     	blr	x1
 1eefda4: fd4053e0     	ldr	d0, [sp, #0xa0]
 1eefda8: 1e602008     	fcmp	d0, #0.0
 1eefdac: 54000bc1     	b.ne	0x1eeff24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6f009c>
 1eefdb0: f9405fe3     	ldr	x3, [sp, #0xb8]
 1eefdb4: b4fff383     	cbz	x3, 0x1eefc24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6efd9c>
 1eefdb8: 9102a3e1     	add	x1, sp, #0xa8
 1eefdbc: 52800062     	mov	w2, #0x3                // =3
 1eefdc0: aa0103e0     	mov	x0, x1
 1eefdc4: d63f0060     	blr	x3
 1eefdc8: 17ffff97     	b	0x1eefc24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6efd9c>
 1eefdcc: 9410fa49     	bl	0x232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a65d8>
 1eefdd0: 17ffffa7     	b	0x1eefc6c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6efde4>
 1eefdd4: fd0023e8     	str	d8, [sp, #0x40]
 1eefdd8: 9410fa46     	bl	0x232e6f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a65d8>
 1eefddc: 6d4d23e1     	ldp	d1, d8, [sp, #0xd0]
 1eefde0: 1e683808     	fsub	d8, d0, d8
 1eefde4: 1e612110     	fcmpe	d8, d1
 1eefde8: 5400064d     	b.le	0x1eefeb0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6f0028>
 1eefdec: f94067f4     	ldr	x20, [sp, #0xc8]
 1eefdf0: b4000654     	cbz	x20, 0x1eefeb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6f0030>
 1eefdf4: 910243e8     	add	x8, sp, #0x90
 1eefdf8: 940cba7e     	bl	0x221e7f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x966d8>
 1eefdfc: 910243e0     	add	x0, sp, #0x90
 1eefe00: 9410a770     	bl	0x2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x191aa8>
 1eefe04: 1e604100     	fmov	d0, d8
 1eefe08: aa0003e2     	mov	x2, x0
 1eefe0c: aa1403e1     	mov	x1, x20
 1eefe10: 90003720     	adrp	x0, 0x25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x101a8>
 1eefe14: 91186000     	add	x0, x0, #0x618
 1eefe18: 940c41ee     	bl	0x22005d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x784b8>
 1eefe1c: 910243e0     	add	x0, sp, #0x90
