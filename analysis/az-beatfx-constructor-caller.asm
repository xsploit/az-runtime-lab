
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000996050 <_ZSt20__throw_bad_weak_ptrv@@Base+0x8b438>:
  996050:	f000e800 	adrp	x0, 2699000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xd61a8>
  996054:	f9423417 	ldr	x23, [x0,#1128]
  996058:	b4000697 	cbz	x23, 996128 <_ZSt20__throw_bad_weak_ptrv@@Base+0x8b510>
  99605c:	91002281 	add	x1, x20, #0x8
  996060:	885ffc20 	ldaxr	w0, [x1]
  996064:	51000402 	sub	w2, w0, #0x1
  996068:	8803fc22 	stlxr	w3, w2, [x1]
  99606c:	35ffffa3 	cbnz	w3, 996060 <_ZSt20__throw_bad_weak_ptrv@@Base+0x8b448>
  996070:	7100041f 	cmp	w0, #0x1
  996074:	54000640 	b.eq	99613c <_ZSt20__throw_bad_weak_ptrv@@Base+0x8b524>
  996078:	910243e0 	add	x0, sp, #0x90
  99607c:	94659961 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  996080:	f000e803 	adrp	x3, 2699000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xd61a8>
  996084:	f000e802 	adrp	x2, 2699000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xd61a8>
  996088:	91008063 	add	x3, x3, #0x20
  99608c:	91026042 	add	x2, x2, #0x98
  996090:	f000e801 	adrp	x1, 2699000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xd61a8>
  996094:	f000e800 	adrp	x0, 2699000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xd61a8>
  996098:	91030021 	add	x1, x1, #0xc0
  99609c:	9103a000 	add	x0, x0, #0xe8
  9960a0:	f9000263 	str	x3, [x19]
  9960a4:	910b0277 	add	x23, x19, #0x2c0
  9960a8:	f9001662 	str	x2, [x19,#40]
  9960ac:	d2800014 	mov	x20, #0x0                   	// #0
  9960b0:	f9001e61 	str	x1, [x19,#56]
  9960b4:	f9015e60 	str	x0, [x19,#696]
  9960b8:	f94002a0 	ldr	x0, [x21]
  9960bc:	a90903ff 	stp	xzr, x0, [sp,#144]
  9960c0:	b5000600 	cbnz	x0, 996180 <_ZSt20__throw_bad_weak_ptrv@@Base+0x8b568>
  9960c4:	f9400281 	ldr	x1, [x20]
  9960c8:	aa1403e0 	mov	x0, x20
  9960cc:	f9404021 	ldr	x1, [x1,#128]
  9960d0:	d63f0020 	blr	x1
  9960d4:	aa0003f5 	mov	x21, x0
  9960d8:	d2800014 	mov	x20, #0x0                   	// #0
  9960dc:	f94002c0 	ldr	x0, [x22]
  9960e0:	a90a03ff 	stp	xzr, x0, [sp,#160]
  9960e4:	b5000d00 	cbnz	x0, 996284 <_ZSt20__throw_bad_weak_ptrv@@Base+0x8b66c>
  9960e8:	aa1403e2 	mov	x2, x20
  9960ec:	aa1503e1 	mov	x1, x21
  9960f0:	aa1703e0 	mov	x0, x23
  9960f4:	97ffb57d 	bl	9836e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78ad0>
  9960f8:	910283e0 	add	x0, sp, #0xa0
  9960fc:	97f61ceb 	bl	71d4a8 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x24700>
  996100:	910243e0 	add	x0, sp, #0x90
  996104:	97f4fecb 	bl	6d5c30 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x450a0>
  996108:	9100e260 	add	x0, x19, #0x38
  99610c:	94665e4d 	bl	232da40 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a5928>
  996110:	a94153f3 	ldp	x19, x20, [sp,#16]
  996114:	a9425bf5 	ldp	x21, x22, [sp,#32]
  996118:	a94363f7 	ldp	x23, x24, [sp,#48]
  99611c:	a9446bf9 	ldp	x25, x26, [sp,#64]
  996120:	a8cb7bfd 	ldp	x29, x30, [sp],#176
  996124:	d65f03c0 	ret
  996128:	b9400a80 	ldr	w0, [x20,#8]
  99612c:	51000401 	sub	w1, w0, #0x1
