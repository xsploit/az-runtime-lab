
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000221dd50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x95c38>:
 221dd50:	910343e1 	add	x1, sp, #0xd0
 221dd54:	52800040 	mov	w0, #0x2                   	// #2
 221dd58:	9788251e 	bl	4271d0 <sigprocmask@plt>
 221dd5c:	f9401fe3 	ldr	x3, [sp,#56]
 221dd60:	b0003242 	adrp	x2, 2866000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a31a8>
 221dd64:	90003b81 	adrp	x1, 298d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x3ca1a8>
 221dd68:	913e0042 	add	x2, x2, #0xf80
 221dd6c:	9102e021 	add	x1, x1, #0xb8
 221dd70:	d2800004 	mov	x4, #0x0                   	// #0
 221dd74:	b0003240 	adrp	x0, 2866000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a31a8>
 221dd78:	913e2000 	add	x0, x0, #0xf88
 221dd7c:	97881dcd 	bl	4254b0 <execl@plt>
 221dd80:	52800fe0 	mov	w0, #0x7f                  	// #127
 221dd84:	97881fa7 	bl	425c20 <_exit@plt>
 221dd88:	d503201f 	nop
 221dd8c:	d503201f 	nop
 221dd90:	d000cdc1 	adrp	x1, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 221dd94:	394e0021 	ldrb	w1, [x1,#896]
 221dd98:	35000061 	cbnz	w1, 221dda4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x95c8c>
 221dd9c:	b9400000 	ldr	w0, [x0]
 221dda0:	d65f03c0 	ret
 221dda4:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 221dda8:	910003fd 	mov	x29, sp
 221ddac:	f9000bf3 	str	x19, [sp,#16]
 221ddb0:	aa0003f3 	mov	x19, x0
 221ddb4:	9404d91b 	bl	2354220 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc108>
 221ddb8:	2a0003e7 	mov	w7, w0
 221ddbc:	7100001f 	cmp	w0, #0x0
 221ddc0:	5400090d 	b.le	221dee0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x95dc8>
 221ddc4:	51000400 	sub	w0, w0, #0x1
 221ddc8:	bd400265 	ldr	s5, [x19]
 221ddcc:	7100501f 	cmp	w0, #0x14
 221ddd0:	540008c9 	b.ls	221dee8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x95dd0>
 221ddd4:	f0003222 	adrp	x2, 2864000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2a11a8>
 221ddd8:	4e040cf2 	dup	v18.4s, w7
 221dddc:	4e0404a7 	dup	v7.4s, v5.s[0]
 221dde0:	53027ce0 	lsr	w0, w7, #2
 221dde4:	4f000401 	movi	v1.4s, #0x0
 221dde8:	52800001 	mov	w1, #0x0                   	// #0
 221ddec:	3dc1a043 	ldr	q3, [x2,#1664]
 221ddf0:	4f000491 	movi	v17.4s, #0x4
 221ddf4:	4f000426 	movi	v6.4s, #0x1
 221ddf8:	4f215460 	shl	v0.4s, v3.4s, #1
 221ddfc:	11000421 	add	w1, w1, #0x1
 221de00:	4ea344d0 	sshl	v16.4s, v6.4s, v3.4s
 221de04:	6b00003f 	cmp	w1, w0
 221de08:	4eb18463 	add	v3.4s, v3.4s, v17.4s
 221de0c:	6eb28400 	sub	v0.4s, v0.4s, v18.4s
 221de10:	6e205802 	mvn	v2.16b, v0.16b
 221de14:	4ea68400 	add	v0.4s, v0.4s, v6.4s
 221de18:	6ea0b842 	neg	v2.4s, v2.4s
 221de1c:	4ea044e4 	sshl	v4.4s, v7.4s, v0.4s
 221de20:	4ea0a800 	cmlt	v0.4s, v0.4s, #0
 221de24:	6ea244e2 	ushl	v2.4s, v7.4s, v2.4s
 221de28:	6e641c40 	bsl	v0.16b, v2.16b, v4.16b
 221de2c:	4e301c00 	and	v0.16b, v0.16b, v16.16b
 221de30:	4ea01c21 	orr	v1.16b, v1.16b, v0.16b
 221de34:	54fffe21 	b.ne	221ddf8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x95ce0>
 221de38:	4f000400 	movi	v0.4s, #0x0
 221de3c:	121e74e3 	and	w3, w7, #0xfffffffc
 221de40:	6b0300ff 	cmp	w7, w3
 221de44:	6e004022 	ext	v2.16b, v1.16b, v0.16b, #8
 221de48:	4ea21c21 	orr	v1.16b, v1.16b, v2.16b
 221de4c:	6e002020 	ext	v0.16b, v1.16b, v0.16b, #4
 221de50:	4ea01c21 	orr	v1.16b, v1.16b, v0.16b
 221de54:	0e043c20 	mov	w0, v1.s[0]
 221de58:	54000240 	b.eq	221dea0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x95d88>
 221de5c:	531f7861 	lsl	w1, w3, #1
 221de60:	52800025 	mov	w5, #0x1                   	// #1
 221de64:	4b070021 	sub	w1, w1, w7
 221de68:	0b050021 	add	w1, w1, w5
 221de6c:	d503201f 	nop
 221de70:	1e2600a6 	fmov	w6, s5
 221de74:	1ac320a2 	lsl	w2, w5, w3
 221de78:	4b0103e4 	neg	w4, w1
 221de7c:	1ac120c6 	lsl	w6, w6, w1
 221de80:	0a060042 	and	w2, w2, w6
 221de84:	1ac320a6 	lsl	w6, w5, w3
 221de88:	37f80121 	tbnz	w1, #31, 221deac <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x95d94>
 221de8c:	11000463 	add	w3, w3, #0x1
 221de90:	2a020000 	orr	w0, w0, w2
 221de94:	6b0300ff 	cmp	w7, w3
 221de98:	11000821 	add	w1, w1, #0x2
 221de9c:	54fffeac 	b.gt	221de70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x95d58>
 221dea0:	f9400bf3 	ldr	x19, [sp,#16]
 221dea4:	a8c27bfd 	ldp	x29, x30, [sp],#32
 221dea8:	d65f03c0 	ret
 221deac:	0e010c80 	dup	v0.8b, w4
 221deb0:	11000463 	add	w3, w3, #0x1
 221deb4:	6b0300ff 	cmp	w7, w3
 221deb8:	11000821 	add	w1, w1, #0x2
 221debc:	7ee0b800 	neg	d0, d0
 221dec0:	2ea044a0 	ushl	v0.2s, v5.2s, v0.2s
 221dec4:	1e260002 	fmov	w2, s0
 221dec8:	0a060044 	and	w4, w2, w6
 221decc:	2a040000 	orr	w0, w0, w4
 221ded0:	54fffd0c 	b.gt	221de70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x95d58>
 221ded4:	f9400bf3 	ldr	x19, [sp,#16]
 221ded8:	a8c27bfd 	ldp	x29, x30, [sp],#32
 221dedc:	d65f03c0 	ret
 221dee0:	52800000 	mov	w0, #0x0                   	// #0
 221dee4:	17ffffef 	b	221dea0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x95d88>
 221dee8:	52800000 	mov	w0, #0x0                   	// #0
 221deec:	52800003 	mov	w3, #0x0                   	// #0
 221def0:	17ffffdb 	b	221de5c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x95d44>
 221def4:	d503201f 	nop
 221def8:	d503201f 	nop
 221defc:	d503201f 	nop
