
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002353ec0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cbda8>:
 2353ec0:	d1004000 	sub	x0, x0, #0x10
 2353ec4:	eb01001f 	cmp	x0, x1
 2353ec8:	1e602908 	fadd	d8, d8, d0
 2353ecc:	54000040 	b.eq	2353ed4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cbdbc>
 2353ed0:	97fea1c0 	bl	22fc5d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744b8>
 2353ed4:	1e260100 	fmov	w0, s8
 2353ed8:	fd400be8 	ldr	d8, [sp,#16]
 2353edc:	a8c37bfd 	ldp	x29, x30, [sp],#48
 2353ee0:	d65f03c0 	ret
 2353ee4:	d503201f 	nop
 2353ee8:	d503201f 	nop
 2353eec:	d503201f 	nop
 2353ef0:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
 2353ef4:	f0006f21 	adrp	x1, 313a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb771a8>
 2353ef8:	913f8021 	add	x1, x1, #0xfe0
 2353efc:	910003fd 	mov	x29, sp
 2353f00:	9100e3e8 	add	x8, sp, #0x38
 2353f04:	a9025bf5 	stp	x21, x22, [sp,#32]
 2353f08:	f0006f35 	adrp	x21, 313a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb771a8>
 2353f0c:	913ea2b5 	add	x21, x21, #0xfa8
 2353f10:	a90153f3 	stp	x19, x20, [sp,#16]
 2353f14:	aa0003f3 	mov	x19, x0
 2353f18:	aa1503e0 	mov	x0, x21
 2353f1c:	97fffef9 	bl	2353b00 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cb9e8>
 2353f20:	90006ef4 	adrp	x20, 312f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb6c1a8>
 2353f24:	91094294 	add	x20, x20, #0x250
 2353f28:	f0006f22 	adrp	x2, 313a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb771a8>
 2353f2c:	913fa042 	add	x2, x2, #0xfe8
 2353f30:	910123e1 	add	x1, sp, #0x48
 2353f34:	f9401fe3 	ldr	x3, [sp,#56]
 2353f38:	910103e0 	add	x0, sp, #0x40
 2353f3c:	a9040be3 	stp	x3, x2, [sp,#64]
 2353f40:	9400a5b0 	bl	237d600 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x81e0>
 2353f44:	2a2003e0 	mvn	w0, w0
 2353f48:	f9401fe3 	ldr	x3, [sp,#56]
 2353f4c:	f0006f22 	adrp	x2, 313a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb771a8>
 2353f50:	913fc042 	add	x2, x2, #0xff0
 2353f54:	531f7c00 	lsr	w0, w0, #31
 2353f58:	39002260 	strb	w0, [x19,#8]
 2353f5c:	910123e1 	add	x1, sp, #0x48
 2353f60:	910103e0 	add	x0, sp, #0x40
 2353f64:	a9040be3 	stp	x3, x2, [sp,#64]
 2353f68:	9400a5a6 	bl	237d600 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x81e0>
 2353f6c:	2a2003e0 	mvn	w0, w0
 2353f70:	f0006f22 	adrp	x2, 313a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb771a8>
 2353f74:	913fe042 	add	x2, x2, #0xff8
 2353f78:	910123e1 	add	x1, sp, #0x48
 2353f7c:	f9401fe3 	ldr	x3, [sp,#56]
 2353f80:	531f7c00 	lsr	w0, w0, #31
 2353f84:	39002660 	strb	w0, [x19,#9]
 2353f88:	910103e0 	add	x0, sp, #0x40
 2353f8c:	a9040be3 	stp	x3, x2, [sp,#64]
 2353f90:	9400a59c 	bl	237d600 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x81e0>
 2353f94:	2a2003e0 	mvn	w0, w0
 2353f98:	90006f42 	adrp	x2, 313b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb781a8>
 2353f9c:	91000042 	add	x2, x2, #0x0
 2353fa0:	910123e1 	add	x1, sp, #0x48
 2353fa4:	f9401fe3 	ldr	x3, [sp,#56]
 2353fa8:	531f7c00 	lsr	w0, w0, #31
 2353fac:	39002a60 	strb	w0, [x19,#10]
 2353fb0:	910103e0 	add	x0, sp, #0x40
 2353fb4:	a9040be3 	stp	x3, x2, [sp,#64]
 2353fb8:	9400a592 	bl	237d600 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x81e0>
 2353fbc:	2a2003e0 	mvn	w0, w0
 2353fc0:	90006f42 	adrp	x2, 313b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb781a8>
 2353fc4:	91002042 	add	x2, x2, #0x8
 2353fc8:	910123e1 	add	x1, sp, #0x48
 2353fcc:	f9401fe3 	ldr	x3, [sp,#56]
 2353fd0:	531f7c00 	lsr	w0, w0, #31
 2353fd4:	39002e60 	strb	w0, [x19,#11]
 2353fd8:	910103e0 	add	x0, sp, #0x40
 2353fdc:	a9040be3 	stp	x3, x2, [sp,#64]
 2353fe0:	9400a588 	bl	237d600 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x81e0>
 2353fe4:	2a2003e0 	mvn	w0, w0
 2353fe8:	90006f42 	adrp	x2, 313b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb781a8>
 2353fec:	91004042 	add	x2, x2, #0x10
 2353ff0:	910123e1 	add	x1, sp, #0x48
 2353ff4:	f9401fe3 	ldr	x3, [sp,#56]
 2353ff8:	531f7c00 	lsr	w0, w0, #31
 2353ffc:	39003260 	strb	w0, [x19,#12]
 2354000:	910103e0 	add	x0, sp, #0x40
 2354004:	a9040be3 	stp	x3, x2, [sp,#64]
 2354008:	9400a57e 	bl	237d600 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x81e0>
 235400c:	2a2003e0 	mvn	w0, w0
 2354010:	f0006f22 	adrp	x2, 313b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb781a8>
 2354014:	91006042 	add	x2, x2, #0x18
 2354018:	910123e1 	add	x1, sp, #0x48
 235401c:	f9401fe3 	ldr	x3, [sp,#56]
 2354020:	531f7c00 	lsr	w0, w0, #31
 2354024:	39003660 	strb	w0, [x19,#13]
 2354028:	910103e0 	add	x0, sp, #0x40
 235402c:	a9040be3 	stp	x3, x2, [sp,#64]
 2354030:	9400a574 	bl	237d600 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x81e0>
 2354034:	2a2003e0 	mvn	w0, w0
 2354038:	f0006f22 	adrp	x2, 313b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb781a8>
 235403c:	91008042 	add	x2, x2, #0x20
 2354040:	910123e1 	add	x1, sp, #0x48
 2354044:	f9401fe3 	ldr	x3, [sp,#56]
 2354048:	531f7c00 	lsr	w0, w0, #31
 235404c:	39003a60 	strb	w0, [x19,#14]
 2354050:	910103e0 	add	x0, sp, #0x40
 2354054:	a9040be3 	stp	x3, x2, [sp,#64]
 2354058:	9400a56a 	bl	237d600 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x81e0>
 235405c:	2a2003e0 	mvn	w0, w0
 2354060:	f0006f22 	adrp	x2, 313b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb781a8>
 2354064:	9100a042 	add	x2, x2, #0x28
 2354068:	910123e1 	add	x1, sp, #0x48
 235406c:	f9401fe3 	ldr	x3, [sp,#56]
 2354070:	531f7c00 	lsr	w0, w0, #31
 2354074:	39003e60 	strb	w0, [x19,#15]
 2354078:	910103e0 	add	x0, sp, #0x40
 235407c:	a9040be3 	stp	x3, x2, [sp,#64]
 2354080:	9400a560 	bl	237d600 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x81e0>
 2354084:	2a2003e0 	mvn	w0, w0
 2354088:	f0006f22 	adrp	x2, 313b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb781a8>
 235408c:	9100c042 	add	x2, x2, #0x30
 2354090:	910123e1 	add	x1, sp, #0x48
 2354094:	f9401fe3 	ldr	x3, [sp,#56]
 2354098:	531f7c00 	lsr	w0, w0, #31
 235409c:	39004260 	strb	w0, [x19,#16]
 23540a0:	910103e0 	add	x0, sp, #0x40
 23540a4:	a9040be3 	stp	x3, x2, [sp,#64]
 23540a8:	9400a556 	bl	237d600 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x81e0>
 23540ac:	2a2003e2 	mvn	w2, w0
 23540b0:	910123e8 	add	x8, sp, #0x48
 23540b4:	aa1503e0 	mov	x0, x21
 23540b8:	b0001ae1 	adrp	x1, 26b1000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xee1a8>
 23540bc:	531f7c42 	lsr	w2, w2, #31
 23540c0:	39004662 	strb	w2, [x19,#17]
 23540c4:	91150021 	add	x1, x1, #0x540
 23540c8:	97fffe8e 	bl	2353b00 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cb9e8>
 23540cc:	f94027e0 	ldr	x0, [sp,#72]
 23540d0:	d2800001 	mov	x1, #0x0                   	// #0
 23540d4:	52800142 	mov	w2, #0xa                   	// #10
 23540d8:	97834d66 	bl	427670 <strtol@plt>
 23540dc:	11000401 	add	w1, w0, #0x1
 23540e0:	f94027e0 	ldr	x0, [sp,#72]
 23540e4:	b9000261 	str	w1, [x19]
 23540e8:	d1004000 	sub	x0, x0, #0x10
 23540ec:	eb14001f 	cmp	x0, x20
 23540f0:	54000040 	b.eq	23540f8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cbfe0>
 23540f4:	97fea137 	bl	22fc5d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744b8>
 23540f8:	910103e8 	add	x8, sp, #0x40
 23540fc:	aa1503e0 	mov	x0, x21
 2354100:	f0006f21 	adrp	x1, 313b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb781a8>
 2354104:	9100e021 	add	x1, x1, #0x38
 2354108:	97fffe7e 	bl	2353b00 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cb9e8>
 235410c:	f94023e0 	ldr	x0, [sp,#64]
 2354110:	52800142 	mov	w2, #0xa                   	// #10
 2354114:	d2800001 	mov	x1, #0x0                   	// #0
 2354118:	97834d56 	bl	427670 <strtol@plt>
 235411c:	aa0003f6 	mov	x22, x0
 2354120:	910123e8 	add	x8, sp, #0x48
 2354124:	aa1503e0 	mov	x0, x21
 2354128:	f0006f21 	adrp	x1, 313b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xb781a8>
 235412c:	91012021 	add	x1, x1, #0x48
 2354130:	97fffe74 	bl	2353b00 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cb9e8>
 2354134:	f94027e0 	ldr	x0, [sp,#72]
 2354138:	52800142 	mov	w2, #0xa                   	// #10
 235413c:	d2800001 	mov	x1, #0x0                   	// #0
 2354140:	97834d4c 	bl	427670 <strtol@plt>
 2354144:	1b165816 	madd	w22, w0, w22, w22
 2354148:	f94027e0 	ldr	x0, [sp,#72]
 235414c:	b9000676 	str	w22, [x19,#4]
 2354150:	d1004000 	sub	x0, x0, #0x10
 2354154:	eb14001f 	cmp	x0, x20
 2354158:	54000040 	b.eq	2354160 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc048>
 235415c:	97fea11d 	bl	22fc5d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744b8>
