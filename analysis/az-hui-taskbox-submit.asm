
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f6230 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e118>:
 21f6230:	a9b97bfd 	stp	x29, x30, [sp,#-112]!
 21f6234:	91002022 	add	x2, x1, #0x8
 21f6238:	910003fd 	mov	x29, sp
 21f623c:	a90153f3 	stp	x19, x20, [sp,#16]
 21f6240:	d0001e53 	adrp	x19, 25c0000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0xf4e8>
 21f6244:	912a7273 	add	x19, x19, #0xa9c
 21f6248:	eb02027f 	cmp	x19, x2
 21f624c:	54000068 	b.hi	21f6258 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e140>
 21f6250:	f2400454 	ands	x20, x2, #0x3
 21f6254:	540000a0 	b.eq	21f6268 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e150>
 21f6258:	d2800000 	mov	x0, #0x0                   	// #0
 21f625c:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f6260:	a8c77bfd 	ldp	x29, x30, [sp],#112
 21f6264:	d65f03c0 	ret
 21f6268:	f9001bf7 	str	x23, [sp,#48]
 21f626c:	b9400837 	ldr	w23, [x1,#8]
 21f6270:	a9025bf5 	stp	x21, x22, [sp,#32]
 21f6274:	aa0003f6 	mov	x22, x0
 21f6278:	aa0103f5 	mov	x21, x1
 21f627c:	9793e281 	bl	6eec80 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x5e0f0>
 21f6280:	6b0002ff 	cmp	w23, w0
 21f6284:	54000080 	b.eq	21f6294 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e17c>
 21f6288:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21f628c:	f9401bf7 	ldr	x23, [sp,#48]
 21f6290:	17fffff2 	b	21f6258 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e140>
 21f6294:	9000cf00 	adrp	x0, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f6298:	f946dc00 	ldr	x0, [x0,#3512]
 21f629c:	b40004a0 	cbz	x0, 21f6330 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e218>
 21f62a0:	f9400401 	ldr	x1, [x0,#8]
 21f62a4:	b4000461 	cbz	x1, 21f6330 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e218>
 21f62a8:	f9400800 	ldr	x0, [x0,#16]
 21f62ac:	b4000420 	cbz	x0, 21f6330 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e218>
 21f62b0:	f9401800 	ldr	x0, [x0,#48]
 21f62b4:	eb00003f 	cmp	x1, x0
 21f62b8:	540003c1 	b.ne	21f6330 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e218>
 21f62bc:	d2800500 	mov	x0, #0x28                  	// #40
 21f62c0:	9788baa0 	bl	424d40 <_Znwm@plt>
 21f62c4:	aa0003f7 	mov	x23, x0
 21f62c8:	9792efb8 	bl	6b21a8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x21618>
 21f62cc:	5289eb02 	mov	w2, #0x4f58                	// #20312
 21f62d0:	72aa4862 	movk	w2, #0x5243, lsl #16
 21f62d4:	b0006361 	adrp	x1, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f62d8:	913ce021 	add	x1, x1, #0xf38
 21f62dc:	b9000ae0 	str	w0, [x23,#8]
 21f62e0:	910022e0 	add	x0, x23, #0x8
 21f62e4:	f90002e1 	str	x1, [x23]
 21f62e8:	eb00027f 	cmp	x19, x0
 21f62ec:	b9000eff 	str	wzr, [x23,#12]
 21f62f0:	b90012e2 	str	w2, [x23,#16]
 21f62f4:	a901d6ff 	stp	xzr, x21, [x23,#24]
 21f62f8:	54000668 	b.hi	21f63c4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e2ac>
 21f62fc:	f240041f 	tst	x0, #0x3
 21f6300:	54000621 	b.ne	21f63c4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e2ac>
 21f6304:	b9400af3 	ldr	w19, [x23,#8]
 21f6308:	9792efa8 	bl	6b21a8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x21618>
 21f630c:	6b00027f 	cmp	w19, w0
