
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000b773d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26c7b8>:
  b773d0:	f9425a63 	ldr	x3, [x19,#1200]
  b773d4:	910283fa 	add	x26, sp, #0xa0
  b773d8:	2a1803e2 	mov	w2, w24
  b773dc:	aa1a03e1 	mov	x1, x26
  b773e0:	aa0303e0 	mov	x0, x3
  b773e4:	f9400063 	ldr	x3, [x3]
  b773e8:	f9404063 	ldr	x3, [x3,#128]
  b773ec:	d63f0060 	blr	x3
  b773f0:	3941a3e2 	ldrb	w2, [sp,#104]
  b773f4:	2a1403e1 	mov	w1, w20
  b773f8:	f9428e60 	ldr	x0, [x19,#1304]
  b773fc:	52800003 	mov	w3, #0x0                   	// #0
  b77400:	97ff3574 	bl	b449d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x239db8>
  b77404:	71000c1f 	cmp	w0, #0x3
  b77408:	54ffce21 	b.ne	b76dcc <_ZSt20__throw_bad_weak_ptrv@@Base+0x26c1b4>
  b7740c:	f9428e63 	ldr	x3, [x19,#1304]
  b77410:	aa1a03e1 	mov	x1, x26
  b77414:	52800002 	mov	w2, #0x0                   	// #0
  b77418:	aa0303e0 	mov	x0, x3
  b7741c:	f9400063 	ldr	x3, [x3]
  b77420:	f9400863 	ldr	x3, [x3,#16]
  b77424:	d63f0060 	blr	x3
  b77428:	3941a3e1 	ldrb	w1, [sp,#104]
  b7742c:	2a0003e2 	mov	w2, w0
  b77430:	aa1303e0 	mov	x0, x19
  b77434:	97ffef1b 	bl	b730a0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x268488>
  b77438:	17fffe65 	b	b76dcc <_ZSt20__throw_bad_weak_ptrv@@Base+0x26c1b4>
  b7743c:	3941a3e2 	ldrb	w2, [sp,#104]
  b77440:	aa0103e0 	mov	x0, x1
  b77444:	52800003 	mov	w3, #0x0                   	// #0
  b77448:	2a1403e1 	mov	w1, w20
  b7744c:	97ff44af 	bl	b48708 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23daf0>
  b77450:	f9419e63 	ldr	x3, [x19,#824]
  b77454:	52800022 	mov	w2, #0x1                   	// #1
  b77458:	2a1703e1 	mov	w1, w23
  b7745c:	910ce260 	add	x0, x19, #0x338
  b77460:	f9401063 	ldr	x3, [x3,#32]
  b77464:	d63f0060 	blr	x3
  b77468:	f9428e61 	ldr	x1, [x19,#1304]
  b7746c:	17ffff87 	b	b77288 <_ZSt20__throw_bad_weak_ptrv@@Base+0x26c670>
  b77470:	f9428e60 	ldr	x0, [x19,#1304]
  b77474:	52800003 	mov	w3, #0x0                   	// #0
  b77478:	2a1403e1 	mov	w1, w20
  b7747c:	97ff316d 	bl	b43a30 <_ZSt20__throw_bad_weak_ptrv@@Base+0x238e18>
