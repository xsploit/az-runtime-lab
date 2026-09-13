
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000009831a8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78590>:
  9831a8:	a9b07bfd 	stp	x29, x30, [sp,#-256]!
  9831ac:	12001c21 	and	w1, w1, #0xff
  9831b0:	7100043f 	cmp	w1, #0x1
  9831b4:	910003fd 	mov	x29, sp
  9831b8:	540000c0 	b.eq	9831d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x785b8>
  9831bc:	34000881 	cbz	w1, 9832cc <_ZSt20__throw_bad_weak_ptrv@@Base+0x786b4>
  9831c0:	71000c3f 	cmp	w1, #0x3
  9831c4:	54000060 	b.eq	9831d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x785b8>
  9831c8:	a8d07bfd 	ldp	x29, x30, [sp],#256
  9831cc:	d65f03c0 	ret
  9831d0:	a90153f3 	stp	x19, x20, [sp,#16]
  9831d4:	52800021 	mov	w1, #0x1                   	// #1
  9831d8:	f9402c13 	ldr	x19, [x0,#88]
  9831dc:	b90047e1 	str	w1, [sp,#68]
  9831e0:	f9400a74 	ldr	x20, [x19,#16]
  9831e4:	b40007f4 	cbz	x20, 9832e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x786c8>
  9831e8:	a9025bf5 	stp	x21, x22, [sp,#32]
  9831ec:	b0fff660 	adrp	x0, 850000 <_ZNSt5mutex4lockEv@@Base+0x1bd50>
  9831f0:	91392000 	add	x0, x0, #0xe48
  9831f4:	f9400261 	ldr	x1, [x19]
  9831f8:	f9400c22 	ldr	x2, [x1,#24]
  9831fc:	eb00005f 	cmp	x2, x0
  983200:	54000861 	b.ne	98330c <_ZSt20__throw_bad_weak_ptrv@@Base+0x786f4>
  983204:	f9400695 	ldr	x21, [x20,#8]
  983208:	910243f6 	add	x22, sp, #0x90
  98320c:	91008261 	add	x1, x19, #0x20
  983210:	aa1603e0 	mov	x0, x22
  983214:	94662c73 	bl	230e3e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1862c8>
  983218:	f94002a1 	ldr	x1, [x21]
  98321c:	52800020 	mov	w0, #0x1                   	// #1
  983220:	b94047e2 	ldr	w2, [sp,#68]
  983224:	390263e0 	strb	w0, [sp,#152]
  983228:	aa1503e0 	mov	x0, x21
  98322c:	f9401421 	ldr	x1, [x1,#40]
  983230:	f90053f4 	str	x20, [sp,#160]
  983234:	b900abe2 	str	w2, [sp,#168]
  983238:	f9005bff 	str	xzr, [sp,#176]
  98323c:	d63f0020 	blr	x1
  983240:	72001c1f 	tst	w0, #0xff
  983244:	54000540 	b.eq	9832ec <_ZSt20__throw_bad_weak_ptrv@@Base+0x786d4>
  983248:	f94002a2 	ldr	x2, [x21]
  98324c:	aa1603e1 	mov	x1, x22
  983250:	aa1503e0 	mov	x0, x21
  983254:	f9401853 	ldr	x19, [x2,#48]
  983258:	97fc6eda 	bl	89edc0 <_ZNSt5mutex4lockEv@@Base+0x6ab10>
  98325c:	aa0003e1 	mov	x1, x0
  983260:	aa1503e0 	mov	x0, x21
  983264:	d63f0260 	blr	x19
  983268:	b4000460 	cbz	x0, 9832f4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x786dc>
  98326c:	f9400ea0 	ldr	x0, [x21,#24]
  983270:	b4000420 	cbz	x0, 9832f4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x786dc>
  983274:	946277ab 	bl	2221120 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x99008>
  983278:	1e6c1000 	fmov	d0, #5.000000000000000000e-01
  98327c:	9000e281 	adrp	x1, 25d3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x101a8>
  983280:	91196021 	add	x1, x1, #0x658
  983284:	f90067e1 	str	x1, [sp,#200]
  983288:	fd006be0 	str	d0, [sp,#208]
  98328c:	72001c1f 	tst	w0, #0xff
  983290:	2f00e400 	movi	d0, #0x0
  983294:	54000080 	b.eq	9832a4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x7868c>
  983298:	900192a0 	adrp	x0, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
  98329c:	394de000 	ldrb	w0, [x0,#888]
  9832a0:	34001c20 	cbz	w0, 983624 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78a0c>
  9832a4:	f9007bff 	str	xzr, [sp,#240]
  9832a8:	fd006fe0 	str	d0, [sp,#216]
  9832ac:	f9400ea1 	ldr	x1, [x21,#24]
  9832b0:	aa0103e0 	mov	x0, x1
  9832b4:	f9400021 	ldr	x1, [x1]
  9832b8:	f9400821 	ldr	x1, [x1,#16]
  9832bc:	d63f0020 	blr	x1
