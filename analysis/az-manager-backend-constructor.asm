
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000220c9d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x848b8>:
 220c9d0:	a9b97bfd 	stp	x29, x30, [sp,#-112]!
 220c9d4:	910003fd 	mov	x29, sp
 220c9d8:	a90573fb 	stp	x27, x28, [sp,#80]
 220c9dc:	aa0103fb 	mov	x27, x1
 220c9e0:	aa0303fc 	mov	x28, x3
 220c9e4:	f9400081 	ldr	x1, [x4]
 220c9e8:	a90153f3 	stp	x19, x20, [sp,#16]
 220c9ec:	a9025bf5 	stp	x21, x22, [sp,#32]
 220c9f0:	aa0003f5 	mov	x21, x0
 220c9f4:	a90363f7 	stp	x23, x24, [sp,#48]
 220c9f8:	2a0203f7 	mov	w23, w2
 220c9fc:	a9046bf9 	stp	x25, x26, [sp,#64]
 220ca00:	f0001dd9 	adrp	x25, 25c7000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x41a8>
 220ca04:	910ca339 	add	x25, x25, #0x328
 220ca08:	f9000019 	str	x25, [x0]
 220ca0c:	aa0403fa 	mov	x26, x4
 220ca10:	b4000ce1 	cbz	x1, 220cbac <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84a94>
 220ca14:	f9400480 	ldr	x0, [x4,#8]
 220ca18:	a90082a1 	stp	x1, x0, [x21,#8]
 220ca1c:	b4000120 	cbz	x0, 220ca40 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84928>
 220ca20:	b00062e1 	adrp	x1, 2e69000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a61a8>
 220ca24:	f9455421 	ldr	x1, [x1,#2728]
 220ca28:	b4000ee1 	cbz	x1, 220cc04 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84aec>
 220ca2c:	91002000 	add	x0, x0, #0x8
 220ca30:	885ffc01 	ldaxr	w1, [x0]
 220ca34:	11000421 	add	w1, w1, #0x1
 220ca38:	8802fc01 	stlxr	w2, w1, [x0]
 220ca3c:	35ffffa2 	cbnz	w2, 220ca30 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84918>
 220ca40:	9100e2b6 	add	x22, x21, #0x38
 220ca44:	2a1703f8 	mov	w24, w23
 220ca48:	9102e2b4 	add	x20, x21, #0xb8
 220ca4c:	f00062c0 	adrp	x0, 2e67000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a41a8>
 220ca50:	912b2000 	add	x0, x0, #0xac8
 220ca54:	d2800013 	mov	x19, #0x0                   	// #0
 220ca58:	f90002a0 	str	x0, [x21]
 220ca5c:	a901febf 	stp	xzr, xzr, [x21,#24]
 220ca60:	a902febf 	stp	xzr, xzr, [x21,#40]
 220ca64:	f9001ebf 	str	xzr, [x21,#56]
 220ca68:	f9003ebf 	str	xzr, [x21,#120]
 220ca6c:	f9005ebf 	str	xzr, [x21,#184]
 220ca70:	d2800800 	mov	x0, #0x40                  	// #64
 220ca74:	978860b3 	bl	424d40 <_Znwm@plt>
 220ca78:	f9400281 	ldr	x1, [x20]
 220ca7c:	d370fc22 	lsr	x2, x1, #48
 220ca80:	9240bc21 	and	x1, x1, #0xffffffffffff
 220ca84:	b3503c40 	bfi	x0, x2, #48, #16
 220ca88:	9240bc03 	and	x3, x0, #0xffffffffffff
 220ca8c:	f9400062 	ldr	x2, [x3]
 220ca90:	d370fc42 	lsr	x2, x2, #48
 220ca94:	b3503c41 	bfi	x1, x2, #48, #16
 220ca98:	f9000061 	str	x1, [x3]
 220ca9c:	f9000280 	str	x0, [x20]
 220caa0:	eb13031f 	cmp	x24, x19
 220caa4:	91000673 	add	x19, x19, #0x1
 220caa8:	54fffe41 	b.ne	220ca70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84958>
 220caac:	c8dffe80 	ldar	x0, [x20]
 220cab0:	f90037e0 	str	x0, [sp,#104]
 220cab4:	f94037e0 	ldr	x0, [sp,#104]
 220cab8:	f240bc1f 	tst	x0, #0xffffffffffff
 220cabc:	54000be0 	b.eq	220cc38 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84b20>
 220cac0:	f94037e0 	ldr	x0, [sp,#104]
 220cac4:	f94037e2 	ldr	x2, [sp,#104]
 220cac8:	9240bc00 	and	x0, x0, #0xffffffffffff
 220cacc:	f9400001 	ldr	x1, [x0]
 220cad0:	f94037e0 	ldr	x0, [sp,#104]
 220cad4:	9240bc21 	and	x1, x1, #0xffffffffffff
 220cad8:	d370fc00 	lsr	x0, x0, #48
 220cadc:	11000400 	add	w0, w0, #0x1
 220cae0:	b3503c01 	bfi	x1, x0, #48, #16
 220cae4:	c85ffe80 	ldaxr	x0, [x20]
 220cae8:	eb02001f 	cmp	x0, x2
 220caec:	54000061 	b.ne	220caf8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x849e0>
 220caf0:	c803fe81 	stlxr	w3, x1, [x20]
 220caf4:	7100007f 	cmp	w3, #0x0
 220caf8:	54fffdc1 	b.ne	220cab0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84998>
 220cafc:	f94037e1 	ldr	x1, [sp,#104]
 220cb00:	9240bc21 	and	x1, x1, #0xffffffffffff
 220cb04:	aa0103e0 	mov	x0, x1
 220cb08:	b4000041 	cbz	x1, 220cb10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x849f8>
 220cb0c:	f900001f 	str	xzr, [x0]
 220cb10:	9240bc21 	and	x1, x1, #0xffffffffffff
 220cb14:	f90002c1 	str	x1, [x22]
 220cb18:	9101e2a0 	add	x0, x21, #0x78
 220cb1c:	c89ffc01 	stlr	x1, [x0]
 220cb20:	f9400340 	ldr	x0, [x26]
 220cb24:	a90c7ebf 	stp	xzr, xzr, [x21,#192]
 220cb28:	b40002c0 	cbz	x0, 220cb80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84a68>
 220cb2c:	52800013 	mov	w19, #0x0                   	// #0
 220cb30:	35000077 	cbnz	w23, 220cb3c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84a24>
 220cb34:	14000013 	b	220cb80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84a68>
 220cb38:	2a0003f3 	mov	w19, w0
 220cb3c:	9101a3e1 	add	x1, sp, #0x68
 220cb40:	aa1603e0 	mov	x0, x22
 220cb44:	f90037ff 	str	xzr, [sp,#104]
 220cb48:	940015e2 	bl	22122d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a1b8>
 220cb4c:	11000660 	add	w0, w19, #0x1
 220cb50:	6b0002ff 	cmp	w23, w0
 220cb54:	54ffff21 	b.ne	220cb38 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84a20>
 220cb58:	52800014 	mov	w20, #0x0                   	// #0
 220cb5c:	f90037ff 	str	xzr, [sp,#104]
 220cb60:	14000002 	b	220cb68 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84a50>
 220cb64:	2a0003f4 	mov	w20, w0
 220cb68:	9101a3e1 	add	x1, sp, #0x68
 220cb6c:	aa1603e0 	mov	x0, x22
 220cb70:	9400163c 	bl	2212460 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x8a348>
 220cb74:	11000680 	add	w0, w20, #0x1
 220cb78:	6b14027f 	cmp	w19, w20
 220cb7c:	54ffff41 	b.ne	220cb64 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x84a4c>
 220cb80:	aa1b03e2 	mov	x2, x27
 220cb84:	aa1c03e1 	mov	x1, x28
 220cb88:	aa1503e0 	mov	x0, x21
 220cb8c:	97fff791 	bl	220a9d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x828b8>
