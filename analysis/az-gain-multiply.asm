
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002233eb0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xabd98>:
 2233eb0:	7100007f 	cmp	w3, #0x0
 2233eb4:	5400066d 	b.le	2233f80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xabe68>
 2233eb8:	91004025 	add	x5, x1, #0x10
 2233ebc:	91004004 	add	x4, x0, #0x10
 2233ec0:	eb05001f 	cmp	x0, x5
 2233ec4:	91004047 	add	x7, x2, #0x10
 2233ec8:	fa443022 	ccmp	x1, x4, #0x2, cc
 2233ecc:	51000466 	sub	w6, w3, #0x1
 2233ed0:	1a9f37e5 	cset	w5, cs
 2233ed4:	eb07001f 	cmp	x0, x7
 2233ed8:	fa443042 	ccmp	x2, x4, #0x2, cc
 2233edc:	1a9f37e4 	cset	w4, cs
 2233ee0:	710008df 	cmp	w6, #0x2
 2233ee4:	0a0400a4 	and	w4, w5, w4
 2233ee8:	1a9f97e5 	cset	w5, hi
 2233eec:	6a0400bf 	tst	w5, w4
 2233ef0:	540004a0 	b.eq	2233f84 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xabe6c>
 2233ef4:	53027c65 	lsr	w5, w3, #2
 2233ef8:	d2800004 	mov	x4, #0x0                   	// #0
 2233efc:	d37ceca5 	lsl	x5, x5, #4
 2233f00:	3ce46820 	ldr	q0, [x1,x4]
 2233f04:	3ce46841 	ldr	q1, [x2,x4]
 2233f08:	6e21dc00 	fmul	v0.4s, v0.4s, v1.4s
 2233f0c:	3ca46800 	str	q0, [x0,x4]
 2233f10:	91004084 	add	x4, x4, #0x10
 2233f14:	eb05009f 	cmp	x4, x5
 2233f18:	54ffff41 	b.ne	2233f00 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xabde8>
 2233f1c:	121e7464 	and	w4, w3, #0xfffffffc
 2233f20:	6b04007f 	cmp	w3, w4
 2233f24:	540002e0 	b.eq	2233f80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xabe68>
 2233f28:	2a0403e6 	mov	w6, w4
 2233f2c:	11000485 	add	w5, w4, #0x1
 2233f30:	6b05007f 	cmp	w3, w5
 2233f34:	d37ef4c5 	lsl	x5, x6, #2
 2233f38:	bc667820 	ldr	s0, [x1,x6,lsl #2]
 2233f3c:	bc667841 	ldr	s1, [x2,x6,lsl #2]
 2233f40:	1e210800 	fmul	s0, s0, s1
 2233f44:	bc267800 	str	s0, [x0,x6,lsl #2]
 2233f48:	540001cd 	b.le	2233f80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xabe68>
 2233f4c:	910010a6 	add	x6, x5, #0x4
 2233f50:	11000884 	add	w4, w4, #0x2
 2233f54:	6b04007f 	cmp	w3, w4
 2233f58:	bc666820 	ldr	s0, [x1,x6]
 2233f5c:	bc666841 	ldr	s1, [x2,x6]
