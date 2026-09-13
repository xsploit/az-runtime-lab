
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000232dbd0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5ab8>:
 232dbd0:	9783e4f0 	bl	426f90 <pthread_mutex_lock@plt>
 232dbd4:	91004280 	add	x0, x20, #0x10
 232dbd8:	c8dffc01 	ldar	x1, [x0]
 232dbdc:	b5fffd61 	cbnz	x1, 232db88 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5a70>
 232dbe0:	b9012296 	str	w22, [x20,#288]
 232dbe4:	aa1503e0 	mov	x0, x21
 232dbe8:	91002273 	add	x19, x19, #0x8
 232dbec:	9783e395 	bl	426a40 <pthread_mutex_unlock@plt>
 232dbf0:	eb1302ff 	cmp	x23, x19
 232dbf4:	54fffe01 	b.ne	232dbb4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5a9c>
 232dbf8:	2a1903e0 	mov	w0, w25
 232dbfc:	a94153f3 	ldp	x19, x20, [sp,#16]
 232dc00:	a9425bf5 	ldp	x21, x22, [sp,#32]
 232dc04:	a94363f7 	ldp	x23, x24, [sp,#48]
 232dc08:	f94023f9 	ldr	x25, [sp,#64]
 232dc0c:	a8c57bfd 	ldp	x29, x30, [sp],#80
 232dc10:	d65f03c0 	ret
 232dc14:	2a1603e1 	mov	w1, w22
 232dc18:	d2800000 	mov	x0, #0x0                   	// #0
 232dc1c:	97ffff25 	bl	232d8b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5798>
 232dc20:	72001c1f 	tst	w0, #0xff
 232dc24:	1a9f1339 	csel	w25, w25, wzr, ne
 232dc28:	17ffffe0 	b	232dba8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5a90>
 232dc2c:	52800039 	mov	w25, #0x1                   	// #1
 232dc30:	2a1903e0 	mov	w0, w25
 232dc34:	a94153f3 	ldp	x19, x20, [sp,#16]
 232dc38:	a94363f7 	ldp	x23, x24, [sp,#48]
 232dc3c:	f94023f9 	ldr	x25, [sp,#64]
 232dc40:	a8c57bfd 	ldp	x29, x30, [sp],#80
 232dc44:	d65f03c0 	ret
 232dc48:	d503201f 	nop
 232dc4c:	d503201f 	nop
 232dc50:	1783d880 	b	423e50 <pthread_self@plt>
 232dc54:	d503201f 	nop
 232dc58:	d503201f 	nop
 232dc5c:	d503201f 	nop
 232dc60:	1783e4d0 	b	426fa0 <sched_yield@plt>
 232dc64:	d503201f 	nop
 232dc68:	d503201f 	nop
 232dc6c:	d503201f 	nop
 232dc70:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
 232dc74:	52800007 	mov	w7, #0x0                   	// #0
 232dc78:	d2800004 	mov	x4, #0x0                   	// #0
 232dc7c:	910003fd 	mov	x29, sp
 232dc80:	52800001 	mov	w1, #0x0                   	// #0
 232dc84:	52800026 	mov	w6, #0x1                   	// #1
 232dc88:	d2800025 	mov	x5, #0x1                   	// #1
 232dc8c:	a9017fff 	stp	xzr, xzr, [sp,#16]
 232dc90:	a9027fff 	stp	xzr, xzr, [sp,#32]
 232dc94:	a9037fff 	stp	xzr, xzr, [sp,#48]
 232dc98:	a9047fff 	stp	xzr, xzr, [sp,#64]
 232dc9c:	a9057fff 	stp	xzr, xzr, [sp,#80]
 232dca0:	a9067fff 	stp	xzr, xzr, [sp,#96]
 232dca4:	a9077fff 	stp	xzr, xzr, [sp,#112]
 232dca8:	a9087fff 	stp	xzr, xzr, [sp,#128]
 232dcac:	d503201f 	nop
 232dcb0:	1ac120c2 	lsl	w2, w6, w1
 232dcb4:	9ac120a3 	lsl	x3, x5, x1
 232dcb8:	6a00005f 	tst	w2, w0
 232dcbc:	11000421 	add	w1, w1, #0x1
 232dcc0:	54000060 	b.eq	232dccc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5bb4>
 232dcc4:	aa030084 	orr	x4, x4, x3
 232dcc8:	52800027 	mov	w7, #0x1                   	// #1
 232dccc:	7100803f 	cmp	w1, #0x20
 232dcd0:	54ffff01 	b.ne	232dcb0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5b98>
 232dcd4:	34000047 	cbz	w7, 232dcdc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5bc4>
 232dcd8:	f9000be4 	str	x4, [sp,#16]
 232dcdc:	9783d85d 	bl	423e50 <pthread_self@plt>
 232dce0:	910043e2 	add	x2, sp, #0x10
 232dce4:	d2801001 	mov	x1, #0x80                  	// #128
 232dce8:	9783dc12 	bl	424d30 <pthread_setaffinity_np@plt>
 232dcec:	9783e4ad 	bl	426fa0 <sched_yield@plt>
 232dcf0:	a8c97bfd 	ldp	x29, x30, [sp],#144
 232dcf4:	d65f03c0 	ret
 232dcf8:	d503201f 	nop
 232dcfc:	d503201f 	nop
 232dd00:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 232dd04:	910003fd 	mov	x29, sp
 232dd08:	a90153f3 	stp	x19, x20, [sp,#16]
 232dd0c:	aa0003f3 	mov	x19, x0
 232dd10:	aa0103f4 	mov	x20, x1
 232dd14:	f9400000 	ldr	x0, [x0]
 232dd18:	b4000060 	cbz	x0, 232dd24 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5c0c>
 232dd1c:	9783deb1 	bl	4257e0 <dlclose@plt>
 232dd20:	f900027f 	str	xzr, [x19]
 232dd24:	f9400280 	ldr	x0, [x20]
 232dd28:	52800041 	mov	w1, #0x2                   	// #2
 232dd2c:	39400002 	ldrb	w2, [x0]
 232dd30:	7100005f 	cmp	w2, #0x0
 232dd34:	9a9f1000 	csel	x0, x0, xzr, ne
 232dd38:	9783e34e 	bl	426a70 <dlopen@plt>
 232dd3c:	f9000260 	str	x0, [x19]
 232dd40:	f100001f 	cmp	x0, #0x0
 232dd44:	1a9f07e0 	cset	w0, ne
 232dd48:	a94153f3 	ldp	x19, x20, [sp,#16]
 232dd4c:	a8c27bfd 	ldp	x29, x30, [sp],#32
