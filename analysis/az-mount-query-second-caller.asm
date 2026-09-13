
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000754a60 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x5bcb8>:
  754a60:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
  754a64:	12001c23 	and	w3, w1, #0xff
  754a68:	52800022 	mov	w2, #0x1                   	// #1
  754a6c:	910003fd 	mov	x29, sp
  754a70:	f9000bf3 	str	x19, [sp,#16]
  754a74:	aa0003f3 	mov	x19, x0
  754a78:	2a0203e1 	mov	w1, w2
  754a7c:	91032000 	add	x0, x0, #0xc8
  754a80:	b9002be2 	str	w2, [sp,#40]
  754a84:	79005be3 	strh	w3, [sp,#44]
  754a88:	94001eb2 	bl	75c550 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x637a8>
  754a8c:	f9406663 	ldr	x3, [x19,#200]
  754a90:	52800002 	mov	w2, #0x0                   	// #0
  754a94:	9100a3e1 	add	x1, sp, #0x28
  754a98:	aa0303e0 	mov	x0, x3
  754a9c:	f9400063 	ldr	x3, [x3]
  754aa0:	f9400863 	ldr	x3, [x3,#16]
  754aa4:	d63f0060 	blr	x3
  754aa8:	71000c1f 	cmp	w0, #0x3
  754aac:	54000100 	b.eq	754acc <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x5bd24>
  754ab0:	7100101f 	cmp	w0, #0x4
  754ab4:	52800081 	mov	w1, #0x4                   	// #4
  754ab8:	52800040 	mov	w0, #0x2                   	// #2
  754abc:	1a810000 	csel	w0, w0, w1, eq
  754ac0:	f9400bf3 	ldr	x19, [sp,#16]
  754ac4:	a8c37bfd 	ldp	x29, x30, [sp],#48
  754ac8:	d65f03c0 	ret
  754acc:	52800000 	mov	w0, #0x0                   	// #0
  754ad0:	f9400bf3 	ldr	x19, [sp,#16]
  754ad4:	a8c37bfd 	ldp	x29, x30, [sp],#48
  754ad8:	d65f03c0 	ret
  754adc:	d503201f 	nop
