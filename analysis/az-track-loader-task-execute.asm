
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000a6e100 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1634e8>:
  a6e100:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
  a6e104:	91010001 	add	x1, x0, #0x40
  a6e108:	910003fd 	mov	x29, sp
  a6e10c:	a90153f3 	stp	x19, x20, [sp,#16]
  a6e110:	aa0003f3 	mov	x19, x0
  a6e114:	a9025bf5 	stp	x21, x22, [sp,#32]
  a6e118:	91006016 	add	x22, x0, #0x18
  a6e11c:	f9400c00 	ldr	x0, [x0,#24]
  a6e120:	a90363f7 	stp	x23, x24, [sp,#48]
  a6e124:	f9401262 	ldr	x2, [x19,#32]
  a6e128:	f9008002 	str	x2, [x0,#256]
  a6e12c:	b9401ac3 	ldr	w3, [x22,#24]
  a6e130:	b9402a62 	ldr	w2, [x19,#40]
  a6e134:	b9013803 	str	w3, [x0,#312]
  a6e138:	b9010802 	str	w2, [x0,#264]
  a6e13c:	f9400e60 	ldr	x0, [x19,#24]
  a6e140:	b9401ec2 	ldr	w2, [x22,#28]
  a6e144:	b9013c02 	str	w2, [x0,#316]
  a6e148:	f9400e75 	ldr	x21, [x19,#24]
  a6e14c:	79407260 	ldrh	w0, [x19,#56]
  a6e150:	910462b7 	add	x23, x21, #0x118
  a6e154:	790222a0 	strh	w0, [x21,#272]
  a6e158:	eb0102ff 	cmp	x23, x1
  a6e15c:	54000980 	b.eq	a6e28c <_ZSt20__throw_bad_weak_ptrv@@Base+0x163674>
  a6e160:	a9446274 	ldp	x20, x24, [x19,#64]
  a6e164:	a9046bf9 	stp	x25, x26, [sp,#64]
  a6e168:	b201f3e5 	mov	x5, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
  a6e16c:	f9408ea0 	ldr	x0, [x21,#280]
  a6e170:	f2955565 	movk	x5, #0xaaab
  a6e174:	f94096a2 	ldr	x2, [x21,#296]
  a6e178:	cb140319 	sub	x25, x24, x20
  a6e17c:	cb000042 	sub	x2, x2, x0
  a6e180:	9342ff23 	asr	x3, x25, #2
  a6e184:	9342fc42 	asr	x2, x2, #2
  a6e188:	9b057c63 	mul	x3, x3, x5
  a6e18c:	9b057c42 	mul	x2, x2, x5
  a6e190:	eb02007f 	cmp	x3, x2
  a6e194:	54000448 	b.hi	a6e21c <_ZSt20__throw_bad_weak_ptrv@@Base+0x163604>
  a6e198:	f94092a1 	ldr	x1, [x21,#288]
  a6e19c:	8b190006 	add	x6, x0, x25
  a6e1a0:	cb000022 	sub	x2, x1, x0
  a6e1a4:	9342fc44 	asr	x4, x2, #2
  a6e1a8:	9b057c84 	mul	x4, x4, x5
  a6e1ac:	eb04007f 	cmp	x3, x4
  a6e1b0:	54000728 	b.hi	a6e294 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16367c>
  a6e1b4:	f100033f 	cmp	x25, #0x0
  a6e1b8:	5400016d 	b.le	a6e1e4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1635cc>
  a6e1bc:	d2800002 	mov	x2, #0x0                   	// #0
  a6e1c0:	8b020281 	add	x1, x20, x2
  a6e1c4:	8b020004 	add	x4, x0, x2
  a6e1c8:	f8626a85 	ldr	x5, [x20,x2]
  a6e1cc:	f8226805 	str	x5, [x0,x2]
  a6e1d0:	f1000463 	subs	x3, x3, #0x1
  a6e1d4:	91003042 	add	x2, x2, #0xc
  a6e1d8:	b9400821 	ldr	w1, [x1,#8]
  a6e1dc:	b9000881 	str	w1, [x4,#8]
  a6e1e0:	54ffff01 	b.ne	a6e1c0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1635a8>
  a6e1e4:	aa1503e1 	mov	x1, x21
  a6e1e8:	a9446bf9 	ldp	x25, x26, [sp,#64]
  a6e1ec:	f90006e6 	str	x6, [x23,#8]
  a6e1f0:	b94042c0 	ldr	w0, [x22,#64]
  a6e1f4:	b9013020 	str	w0, [x1,#304]
  a6e1f8:	f9400e60 	ldr	x0, [x19,#24]
  a6e1fc:	394112c1 	ldrb	w1, [x22,#68]
