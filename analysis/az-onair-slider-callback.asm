
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000101d2b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x2495a8>:
 101d2b0:	d10ce000 	sub	x0, x0, #0x338
 101d2b4:	17fffea5 	b	101cd48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x249040>
 101d2b8:	a9b37bfd 	stp	x29, x30, [sp,#-208]!
 101d2bc:	d0ffb383 	adrp	x3, 68f000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base+0x1ad28>
 101d2c0:	9103a063 	add	x3, x3, #0xe8
 101d2c4:	910003fd 	mov	x29, sp
 101d2c8:	a9025bf5 	stp	x21, x22, [sp,#32]
 101d2cc:	2a0103f6 	mov	w22, w1
 101d2d0:	f9400001 	ldr	x1, [x0]
 101d2d4:	a90153f3 	stp	x19, x20, [sp,#16]
 101d2d8:	aa0003f3 	mov	x19, x0
 101d2dc:	a90363f7 	stp	x23, x24, [sp,#48]
 101d2e0:	2a0203f7 	mov	w23, w2
 101d2e4:	f9401421 	ldr	x1, [x1,#40]
 101d2e8:	eb03003f 	cmp	x1, x3
 101d2ec:	54001181 	b.ne	101d51c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x249814>
 101d2f0:	944c4258 	bl	232dc50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5b38>
 101d2f4:	aa0003f4 	mov	x20, x0
 101d2f8:	9100e260 	add	x0, x19, #0x38
 101d2fc:	944bfe39 	bl	231cbe0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x194ac8>
 101d300:	eb00029f 	cmp	x20, x0
 101d304:	1a9f07e0 	cset	w0, ne
 101d308:	35000400 	cbnz	w0, 101d388 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x249680>
 101d30c:	71000adf 	cmp	w22, #0x2
 101d310:	54001120 	b.eq	101d534 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x24982c>
 101d314:	71000edf 	cmp	w22, #0x3
 101d318:	540002e1 	b.ne	101d374 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x24966c>
 101d31c:	390eee77 	strb	w23, [x19,#955]
 101d320:	b9435260 	ldr	w0, [x19,#848]
 101d324:	7100001f 	cmp	w0, #0x0
 101d328:	5400026d 	b.le	101d374 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x24966c>
 101d32c:	d2800014 	mov	x20, #0x0                   	// #0
 101d330:	d2800035 	mov	x21, #0x1                   	// #1
 101d334:	d503201f 	nop
 101d338:	f941ae60 	ldr	x0, [x19,#856]
 101d33c:	d346fe81 	lsr	x1, x20, #6
 101d340:	f9400263 	ldr	x3, [x19]
 101d344:	9ad422a2 	lsl	x2, x21, x20
 101d348:	f8617800 	ldr	x0, [x0,x1,lsl #3]
 101d34c:	2a1403e1 	mov	w1, w20
 101d350:	f9404463 	ldr	x3, [x3,#136]
 101d354:	ea00005f 	tst	x2, x0
 101d358:	1a9f07e2 	cset	w2, ne
 101d35c:	aa1303e0 	mov	x0, x19
 101d360:	91000694 	add	x20, x20, #0x1
 101d364:	d63f0060 	blr	x3
 101d368:	b9435260 	ldr	w0, [x19,#848]
 101d36c:	6b14001f 	cmp	w0, w20
 101d370:	54fffe4c 	b.gt	101d338 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x249630>
 101d374:	a94153f3 	ldp	x19, x20, [sp,#16]
 101d378:	a9425bf5 	ldp	x21, x22, [sp,#32]
 101d37c:	a94363f7 	ldp	x23, x24, [sp,#48]
 101d380:	a8cd7bfd 	ldp	x29, x30, [sp],#208
 101d384:	d65f03c0 	ret
 101d388:	f9400260 	ldr	x0, [x19]
 101d38c:	f9401818 	ldr	x24, [x0,#48]
 101d390:	94480f64 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
 101d394:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
 101d398:	d000ada1 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
 101d39c:	9118e021 	add	x1, x1, #0x638
 101d3a0:	f9004fe1 	str	x1, [sp,#152]
 101d3a4:	fd0053e0 	str	d0, [sp,#160]
 101d3a8:	72001c1f 	tst	w0, #0xff
 101d3ac:	2f00e400 	movi	d0, #0x0
 101d3b0:	54000080 	b.eq	101d3c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x2496b8>
 101d3b4:	d0015dc0 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 101d3b8:	394de000 	ldrb	w0, [x0,#888]
 101d3bc:	34000b80 	cbz	w0, 101d52c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x249824>
 101d3c0:	f9400663 	ldr	x3, [x19,#8]
 101d3c4:	f90063ff 	str	xzr, [sp,#192]
 101d3c8:	d2800102 	mov	x2, #0x8                   	// #8
 101d3cc:	d2800701 	mov	x1, #0x38                  	// #56
 101d3d0:	aa0303e0 	mov	x0, x3
 101d3d4:	fd0057e0 	str	d0, [sp,#168]
 101d3d8:	f9400063 	ldr	x3, [x3]
 101d3dc:	f9400863 	ldr	x3, [x3,#16]
 101d3e0:	d63f0060 	blr	x3
 101d3e4:	aa0003f4 	mov	x20, x0
 101d3e8:	b4001820 	cbz	x0, 101d6ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_@@Base+0x2499e4>
 101d3ec:	91008260 	add	x0, x19, #0x20
 101d3f0:	a9046bf9 	stp	x25, x26, [sp,#64]
 101d3f4:	c85ffc1a 	ldaxr	x26, [x0]
 101d3f8:	9100075a 	add	x26, x26, #0x1
 101d3fc:	c801fc1a 	stlxr	w1, x26, [x0]
