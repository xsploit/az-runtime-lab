
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000a318a0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126c88>:
  a318a0:	a9ba7bfd 	stp	x29, x30, [sp,#-96]!
  a318a4:	910003fd 	mov	x29, sp
  a318a8:	a90153f3 	stp	x19, x20, [sp,#16]
  a318ac:	aa0003f3 	mov	x19, x0
  a318b0:	39400000 	ldrb	w0, [x0]
  a318b4:	f9411274 	ldr	x20, [x19,#544]
  a318b8:	7100081f 	cmp	w0, #0x2
  a318bc:	54000081 	b.ne	a318cc <_ZSt20__throw_bad_weak_ptrv@@Base+0x126cb4>
  a318c0:	390a029f 	strb	wzr, [x20,#640]
  a318c4:	39400260 	ldrb	w0, [x19]
  a318c8:	f9411274 	ldr	x20, [x19,#544]
  a318cc:	71000c1f 	cmp	w0, #0x3
  a318d0:	54000221 	b.ne	a31914 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126cfc>
  a318d4:	a9025bf5 	stp	x21, x22, [sp,#32]
  a318d8:	39477280 	ldrb	w0, [x20,#476]
  a318dc:	9108a275 	add	x21, x19, #0x228
  a318e0:	34000080 	cbz	w0, a318f0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126cd8>
  a318e4:	b94d2e80 	ldr	w0, [x20,#3372]
  a318e8:	7100041f 	cmp	w0, #0x1
  a318ec:	540009a0 	b.eq	a31a20 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126e08>
  a318f0:	aa1503e1 	mov	x1, x21
  a318f4:	aa1303e2 	mov	x2, x19
  a318f8:	9104c283 	add	x3, x20, #0x130
  a318fc:	91186280 	add	x0, x20, #0x618
  a31900:	97ffcdba 	bl	a24fe8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x11a3d0>
  a31904:	a9425bf5 	ldp	x21, x22, [sp,#32]
  a31908:	a94153f3 	ldp	x19, x20, [sp,#16]
  a3190c:	a8c67bfd 	ldp	x29, x30, [sp],#96
  a31910:	d65f03c0 	ret
  a31914:	9117a280 	add	x0, x20, #0x5e8
  a31918:	52800021 	mov	w1, #0x1                   	// #1
  a3191c:	97f4ab0d 	bl	75c550 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x637a8>
  a31920:	72001c1f 	tst	w0, #0xff
  a31924:	540002e0 	b.eq	a31980 <_ZSt20__throw_bad_weak_ptrv@@Base+0x126d68>
  a31928:	f9411274 	ldr	x20, [x19,#544]
  a3192c:	52800021 	mov	w1, #0x1                   	// #1
  a31930:	9117a280 	add	x0, x20, #0x5e8
  a31934:	97f4ab07 	bl	75c550 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x637a8>
  a31938:	f942f682 	ldr	x2, [x20,#1512]
  a3193c:	d2800004 	mov	x4, #0x0                   	// #0
  a31940:	f9411661 	ldr	x1, [x19,#552]
  a31944:	aa0203e0 	mov	x0, x2
