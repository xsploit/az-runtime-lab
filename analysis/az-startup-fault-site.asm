
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000ab8790 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1adb78>:
  ab8790:	a90153f3 	stp	x19, x20, [sp,#16]
  ab8794:	aa0003f4 	mov	x20, x0
  ab8798:	9000e180 	adrp	x0, 26e8000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1251a8>
  ab879c:	a9025bf5 	stp	x21, x22, [sp,#32]
  ab87a0:	f9401813 	ldr	x19, [x0,#48]
  ab87a4:	f940ba95 	ldr	x21, [x20,#368]
  ab87a8:	9100c2b6 	add	x22, x21, #0x30
  ab87ac:	b4000093 	cbz	x19, ab87bc <_ZSt20__throw_bad_weak_ptrv@@Base+0x1adba4>
  ab87b0:	aa1603e0 	mov	x0, x22
  ab87b4:	97e5b9f7 	bl	426f90 <pthread_mutex_lock@plt>
  ab87b8:	35000660 	cbnz	w0, ab8884 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1adc6c>
  ab87bc:	b94062b5 	ldr	w21, [x21,#96]
  ab87c0:	b4000073 	cbz	x19, ab87cc <_ZSt20__throw_bad_weak_ptrv@@Base+0x1adbb4>
  ab87c4:	aa1603e0 	mov	x0, x22
  ab87c8:	97e5b89e 	bl	426a40 <pthread_mutex_unlock@plt>
  ab87cc:	340004d5 	cbz	w21, ab8864 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1adc4c>
  ab87d0:	f940ca81 	ldr	x1, [x20,#400]
  ab87d4:	aa0103e0 	mov	x0, x1
  ab87d8:	f9400021 	ldr	x1, [x1]
  ab87dc:	f9400821 	ldr	x1, [x1,#16]
  ab87e0:	d63f0020 	blr	x1
  ab87e4:	72001c1f 	tst	w0, #0xff
  ab87e8:	540003e1 	b.ne	ab8864 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1adc4c>
  ab87ec:	a959da93 	ldp	x19, x22, [x20,#408]
  ab87f0:	eb16027f 	cmp	x19, x22
  ab87f4:	54000440 	b.eq	ab887c <_ZSt20__throw_bad_weak_ptrv@@Base+0x1adc64>
  ab87f8:	f9400260 	ldr	x0, [x19]
  ab87fc:	b0000055 	adrp	x21, ac1000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1b63e8>
  ab8800:	911262b5 	add	x21, x21, #0x498
  ab8804:	52800054 	mov	w20, #0x2                   	// #2
  ab8808:	f9400001 	ldr	x1, [x0]
  ab880c:	f9400821 	ldr	x1, [x1,#16]
  ab8810:	eb15003f 	cmp	x1, x21
  ab8814:	54000241 	b.ne	ab885c <_ZSt20__throw_bad_weak_ptrv@@Base+0x1adc44>
  ab8818:	b9405000 	ldr	w0, [x0,#80]
  ab881c:	34000100 	cbz	w0, ab883c <_ZSt20__throw_bad_weak_ptrv@@Base+0x1adc24>
  ab8820:	7100041f 	cmp	w0, #0x1
  ab8824:	52800021 	mov	w1, #0x1                   	// #1
  ab8828:	54000060 	b.eq	ab8834 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1adc1c>
  ab882c:	52800001 	mov	w1, #0x0                   	// #0
  ab8830:	52800000 	mov	w0, #0x0                   	// #0
  ab8834:	6b01029f 	cmp	w20, w1
  ab8838:	1a80d294 	csel	w20, w20, w0, le
  ab883c:	91004273 	add	x19, x19, #0x10
