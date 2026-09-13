
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002233060 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xaaf48>:
 2233060:	7100005f 	cmp	w2, #0x0
 2233064:	5400056d 	b.le	2233110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xaaff8>
 2233068:	91004023 	add	x3, x1, #0x10
 223306c:	91004004 	add	x4, x0, #0x10
 2233070:	eb03001f 	cmp	x0, x3
 2233074:	51000443 	sub	w3, w2, #0x1
 2233078:	fa443022 	ccmp	x1, x4, #0x2, cc
 223307c:	7a422860 	ccmp	w3, #0x2, #0x0, cs
 2233080:	540004a9 	b.ls	2233114 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xaaffc>
 2233084:	53027c44 	lsr	w4, w2, #2
 2233088:	d2800003 	mov	x3, #0x0                   	// #0
 223308c:	d37cec84 	lsl	x4, x4, #4
 2233090:	3ce36800 	ldr	q0, [x0,x3]
 2233094:	3ce36821 	ldr	q1, [x1,x3]
 2233098:	4e21d400 	fadd	v0.4s, v0.4s, v1.4s
 223309c:	3ca36800 	str	q0, [x0,x3]
 22330a0:	91004063 	add	x3, x3, #0x10
 22330a4:	eb04007f 	cmp	x3, x4
 22330a8:	54ffff41 	b.ne	2233090 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xaaf78>
 22330ac:	121e7443 	and	w3, w2, #0xfffffffc
 22330b0:	6b03005f 	cmp	w2, w3
 22330b4:	540002e0 	b.eq	2233110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xaaff8>
 22330b8:	2a0303e5 	mov	w5, w3
 22330bc:	11000464 	add	w4, w3, #0x1
 22330c0:	6b04005f 	cmp	w2, w4
 22330c4:	d37ef4a4 	lsl	x4, x5, #2
 22330c8:	bc657800 	ldr	s0, [x0,x5,lsl #2]
 22330cc:	bc657821 	ldr	s1, [x1,x5,lsl #2]
 22330d0:	1e212800 	fadd	s0, s0, s1
 22330d4:	bc257800 	str	s0, [x0,x5,lsl #2]
 22330d8:	540001cd 	b.le	2233110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xaaff8>
 22330dc:	91001085 	add	x5, x4, #0x4
 22330e0:	11000863 	add	w3, w3, #0x2
 22330e4:	6b03005f 	cmp	w2, w3
 22330e8:	bc656800 	ldr	s0, [x0,x5]
 22330ec:	bc656821 	ldr	s1, [x1,x5]
 22330f0:	1e212800 	fadd	s0, s0, s1
 22330f4:	bc256800 	str	s0, [x0,x5]
 22330f8:	540000cd 	b.le	2233110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xaaff8>
 22330fc:	91002082 	add	x2, x4, #0x8
 2233100:	bc626800 	ldr	s0, [x0,x2]
 2233104:	bc626821 	ldr	s1, [x1,x2]
 2233108:	1e212800 	fadd	s0, s0, s1
 223310c:	bc226800 	str	s0, [x0,x2]
 2233110:	d65f03c0 	ret
 2233114:	d2800003 	mov	x3, #0x0                   	// #0
 2233118:	bc637800 	ldr	s0, [x0,x3,lsl #2]
 223311c:	bc637821 	ldr	s1, [x1,x3,lsl #2]
