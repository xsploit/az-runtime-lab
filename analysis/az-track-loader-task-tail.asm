
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000a6e1f0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1635d8>:
  a6e1f0:	b94042c0 	ldr	w0, [x22,#64]
  a6e1f4:	b9013020 	str	w0, [x1,#304]
  a6e1f8:	f9400e60 	ldr	x0, [x19,#24]
  a6e1fc:	394112c1 	ldrb	w1, [x22,#68]
  a6e200:	3904d001 	strb	w1, [x0,#308]
  a6e204:	f9400e60 	ldr	x0, [x19,#24]
  a6e208:	a94153f3 	ldp	x19, x20, [sp,#16]
  a6e20c:	a9425bf5 	ldp	x21, x22, [sp,#32]
  a6e210:	a94363f7 	ldp	x23, x24, [sp,#48]
  a6e214:	a8c57bfd 	ldp	x29, x30, [sp],#80
  a6e218:	17ffff02 	b	a6de20 <_ZSt20__throw_bad_weak_ptrv@@Base+0x163208>
  a6e21c:	d280001a 	mov	x26, #0x0                   	// #0
  a6e220:	b4000123 	cbz	x3, a6e244 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16362c>
  a6e224:	b200f3e0 	mov	x0, #0x5555555555555555    	// #6148914691236517205
  a6e228:	f2e2aaa0 	movk	x0, #0x1555, lsl #48
  a6e22c:	eb00007f 	cmp	x3, x0
  a6e230:	54000668 	b.hi	a6e2fc <_ZSt20__throw_bad_weak_ptrv@@Base+0x1636e4>
  a6e234:	aa1903e0 	mov	x0, x25
  a6e238:	97e6dac2 	bl	424d40 <_Znwm@plt>
  a6e23c:	aa0003fa 	mov	x26, x0
  a6e240:	f9408ea0 	ldr	x0, [x21,#280]
  a6e244:	eb18029f 	cmp	x20, x24
  a6e248:	aa1a03e1 	mov	x1, x26
  a6e24c:	54000120 	b.eq	a6e270 <_ZSt20__throw_bad_weak_ptrv@@Base+0x163658>
  a6e250:	f9400282 	ldr	x2, [x20]
  a6e254:	f9000022 	str	x2, [x1]
  a6e258:	91003294 	add	x20, x20, #0xc
  a6e25c:	91003021 	add	x1, x1, #0xc
  a6e260:	b85fc282 	ldur	w2, [x20,#-4]
  a6e264:	eb14031f 	cmp	x24, x20
  a6e268:	b81fc022 	stur	w2, [x1,#-4]
  a6e26c:	54ffff21 	b.ne	a6e250 <_ZSt20__throw_bad_weak_ptrv@@Base+0x163638>
  a6e270:	b4000040 	cbz	x0, a6e278 <_ZSt20__throw_bad_weak_ptrv@@Base+0x163660>
  a6e274:	97e6daf7 	bl	424e50 <_ZdlPv@plt>
  a6e278:	f9400e61 	ldr	x1, [x19,#24]
  a6e27c:	f9008eba 	str	x26, [x21,#280]
  a6e280:	8b190346 	add	x6, x26, x25
  a6e284:	f9000ae6 	str	x6, [x23,#16]
  a6e288:	17ffffd8 	b	a6e1e8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1635d0>
  a6e28c:	aa1503e1 	mov	x1, x21
  a6e290:	17ffffd8 	b	a6e1f0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1635d8>
  a6e294:	f100005f 	cmp	x2, #0x0
