
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000101cd48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x249040>:
 101cd48:	a9b27bfd 	stp	x29, x30, [sp,#-224]!
 101cd4c:	910003fd 	mov	x29, sp
 101cd50:	a9025bf5 	stp	x21, x22, [sp,#32]
 101cd54:	aa0003f5 	mov	x21, x0
 101cd58:	f9400060 	ldr	x0, [x3]
 101cd5c:	f90053e0 	str	x0, [sp,#160]
 101cd60:	f94002a0 	ldr	x0, [x21]
 101cd64:	a90153f3 	stp	x19, x20, [sp,#16]
 101cd68:	f9004be2 	str	x2, [sp,#144]
 101cd6c:	f9401816 	ldr	x22, [x0,#48]
 101cd70:	944810ec 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 101cd74:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 101cd78:	f000ada1 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 101cd7c:	9118e021 	add	x1, x1, #0x638
 101cd80:	f90057e1 	str	x1, [sp,#168]
 101cd84:	fd005be0 	str	d0, [sp,#176]
 101cd88:	72001c1f 	tst	w0, #0xff
 101cd8c:	2f00e400 	movi	d0, #0x0
 101cd90:	54000080 	b.eq	101cda0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x249098>
 101cd94:	f0015dc0 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 101cd98:	394de000 	ldrb	w0, [x0,#888]
 101cd9c:	34001260 	cbz	w0, 101cfe8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x2492e0>
 101cda0:	f94006a3 	ldr	x3, [x21,#8]
 101cda4:	f9006bff 	str	xzr, [sp,#208]
 101cda8:	d2800102 	mov	x2, #0x8                   	// #8
 101cdac:	d2800701 	mov	x1, #0x38                  	// #56
 101cdb0:	aa0303e0 	mov	x0, x3
 101cdb4:	fd005fe0 	str	d0, [sp,#184]
 101cdb8:	f9400063 	ldr	x3, [x3]
 101cdbc:	f9400863 	ldr	x3, [x3,#16]
 101cdc0:	d63f0060 	blr	x3
 101cdc4:	aa0003f4 	mov	x20, x0
 101cdc8:	b40014e0 	cbz	x0, 101d064 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x24935c>
 101cdcc:	910082a0 	add	x0, x21, #0x20
 101cdd0:	a90363f7 	stp	x23, x24, [sp,#48]
 101cdd4:	c85ffc18 	ldaxr	x24, [x0]
 101cdd8:	91000718 	add	x24, x24, #0x1
 101cddc:	c801fc18 	stlxr	w1, x24, [x0]
 101cde0:	35ffffa1 	cbnz	w1, 101cdd4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x2490cc>
 101cde4:	b0015953 	adrp	x19, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 101cde8:	91130273 	add	x19, x19, #0x4c0
 101cdec:	08dffe60 	ldarb	w0, [x19]
 101cdf0:	b0015957 	adrp	x23, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 101cdf4:	36000d00 	tbz	w0, #0, 101cf94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x24928c>
 101cdf8:	aa1403e1 	mov	x1, x20
 101cdfc:	b944cae2 	ldr	w2, [x23,#1224]
 101ce00:	f000bfe0 	adrp	x0, 281b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2581a8>
 101ce04:	91046000 	add	x0, x0, #0x118
 101ce08:	91042000 	add	x0, x0, #0x108
 101ce0c:	b9000a82 	str	w2, [x20,#8]
 101ce10:	f9000a98 	str	x24, [x20,#16]
 101ce14:	b0015a73 	adrp	x19, 3b69000 <stdout@@GLIBC_2.17+0x27f40>
 101ce18:	f8018420 	str	x0, [x1],#24
 101ce1c:	910b8273 	add	x19, x19, #0x2e0
 101ce20:	f9004ff5 	str	x21, [sp,#152]
 101ce24:	f94053e0 	ldr	x0, [sp,#160]
 101ce28:	a9490fe2 	ldp	x2, x3, [sp,#144]
 101ce2c:	a9018e82 	stp	x2, x3, [x20,#24]
 101ce30:	f9000820 	str	x0, [x1,#16]
 101ce34:	08dffe60 	ldarb	w0, [x19]
 101ce38:	36000920 	tbz	w0, #0, 101cf5c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x249254>
 101ce3c:	91002273 	add	x19, x19, #0x8
 101ce40:	885ffe60 	ldaxr	w0, [x19]
 101ce44:	11000400 	add	w0, w0, #0x1
 101ce48:	8801fe60 	stlxr	w1, w0, [x19]
 101ce4c:	35ffffa1 	cbnz	w1, 101ce40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x249138>
 101ce50:	a94363f7 	ldp	x23, x24, [sp,#48]
 101ce54:	fd405fe0 	ldr	d0, [sp,#184]
 101ce58:	1e602008 	fcmp	d0, #0.0
 101ce5c:	54000541 	b.ne	101cf04 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x2491fc>
 101ce60:	f9406be3 	ldr	x3, [sp,#208]
 101ce64:	b40000a3 	cbz	x3, 101ce78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x249170>
 101ce68:	910303e1 	add	x1, sp, #0xc0
 101ce6c:	52800062 	mov	w2, #0x3                   	// #3
 101ce70:	aa0103e0 	mov	x0, x1
 101ce74:	d63f0060 	blr	x3
 101ce78:	aa1403e1 	mov	x1, x20
 101ce7c:	aa1503e0 	mov	x0, x21
 101ce80:	d63f02c0 	blr	x22
 101ce84:	b4000380 	cbz	x0, 101cef4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x2491ec>
 101ce88:	f9400ea0 	ldr	x0, [x21,#24]
 101ce8c:	b4000340 	cbz	x0, 101cef4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x2491ec>
 101ce90:	944810a4 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 101ce94:	72001c1f 	tst	w0, #0xff
 101ce98:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 101ce9c:	f000ada1 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 101cea0:	91196021 	add	x1, x1, #0x658
 101cea4:	f90057e1 	str	x1, [sp,#168]
 101cea8:	fd005be0 	str	d0, [sp,#176]
 101ceac:	2f00e400 	movi	d0, #0x0
 101ceb0:	54000a41 	b.ne	101cff8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x2492f0>
 101ceb4:	f9400ea1 	ldr	x1, [x21,#24]
 101ceb8:	f9006bff 	str	xzr, [sp,#208]
 101cebc:	fd005fe0 	str	d0, [sp,#184]
 101cec0:	aa0103e0 	mov	x0, x1
 101cec4:	f9400021 	ldr	x1, [x1]
 101cec8:	f9400821 	ldr	x1, [x1,#16]
 101cecc:	d63f0020 	blr	x1
 101ced0:	fd405fe0 	ldr	d0, [sp,#184]
 101ced4:	1e602008 	fcmp	d0, #0.0
 101ced8:	540009a1 	b.ne	101d00c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x249304>
 101cedc:	f9406be3 	ldr	x3, [sp,#208]
 101cee0:	b40000a3 	cbz	x3, 101cef4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x2491ec>
 101cee4:	910303e1 	add	x1, sp, #0xc0
 101cee8:	52800062 	mov	w2, #0x3                   	// #3
 101ceec:	aa0103e0 	mov	x0, x1
 101cef0:	d63f0060 	blr	x3
 101cef4:	a94153f3 	ldp	x19, x20, [sp,#16]
 101cef8:	a9425bf5 	ldp	x21, x22, [sp,#32]
 101cefc:	a8ce7bfd 	ldp	x29, x30, [sp],#224
