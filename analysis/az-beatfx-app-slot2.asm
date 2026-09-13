
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000009836e0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78ac8>:
  9836e0:	d100e000 	sub	x0, x0, #0x38
  9836e4:	17fffeb1 	b	9831a8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78590>
  9836e8:	a9b07bfd 	stp	x29, x30, [sp,#-256]!
  9836ec:	910003fd 	mov	x29, sp
  9836f0:	a90153f3 	stp	x19, x20, [sp,#16]
  9836f4:	aa0003f3 	mov	x19, x0
  9836f8:	f000e860 	adrp	x0, 2692000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xcf1a8>
  9836fc:	910c2000 	add	x0, x0, #0x308
  983700:	a9025bf5 	stp	x21, x22, [sp,#32]
  983704:	aa0203f4 	mov	x20, x2
  983708:	a90363f7 	stp	x23, x24, [sp,#48]
  98370c:	f0018e55 	adrp	x21, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
  983710:	aa0103f7 	mov	x23, x1
  983714:	9110a2b5 	add	x21, x21, #0x428
  983718:	f9000260 	str	x0, [x19]
  98371c:	08dffea0 	ldarb	w0, [x21]
  983720:	f0018e56 	adrp	x22, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
  983724:	36003260 	tbz	w0, #0, 983d70 <_ZSt20__throw_bad_weak_ptrv@@Base+0x79158>
  983728:	f000e860 	adrp	x0, 2692000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xcf1a8>
  98372c:	910ca000 	add	x0, x0, #0x328
  983730:	b94432c1 	ldr	w1, [x22,#1072]
  983734:	f0018e55 	adrp	x21, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
  983738:	911022b5 	add	x21, x21, #0x408
  98373c:	f9000660 	str	x0, [x19,#8]
  983740:	b9001261 	str	w1, [x19,#16]
  983744:	08dffea0 	ldarb	w0, [x21]
  983748:	f0018e56 	adrp	x22, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
  98374c:	36003360 	tbz	w0, #0, 983db8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x791a0>
  983750:	f000e860 	adrp	x0, 2692000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xcf1a8>
  983754:	910d4000 	add	x0, x0, #0x350
  983758:	b94412c1 	ldr	w1, [x22,#1040]
  98375c:	f0018e55 	adrp	x21, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
  983760:	911062b5 	add	x21, x21, #0x418
  983764:	f9000e60 	str	x0, [x19,#24]
  983768:	b9002261 	str	w1, [x19,#32]
  98376c:	08dffea0 	ldarb	w0, [x21]
  983770:	f0018e56 	adrp	x22, 3b4e000 <stdout@@GLIBC_2.17+0xcf40>
  983774:	36003100 	tbz	w0, #0, 983d94 <_ZSt20__throw_bad_weak_ptrv@@Base+0x7917c>
  983778:	f9400282 	ldr	x2, [x20]
  98377c:	f000e865 	adrp	x5, 2692000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xcf1a8>
  983780:	b94422c1 	ldr	w1, [x22,#1056]
  983784:	910de0a5 	add	x5, x5, #0x378
  983788:	f000e864 	adrp	x4, 2692000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xcf1a8>
  98378c:	f000e863 	adrp	x3, 2692000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xcf1a8>
  983790:	f9409c46 	ldr	x6, [x2,#312]
  983794:	910f8084 	add	x4, x4, #0x3e0
  983798:	9110c063 	add	x3, x3, #0x430
  98379c:	f000e862 	adrp	x2, 2692000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xcf1a8>
  9837a0:	91116042 	add	x2, x2, #0x458
  9837a4:	f000e860 	adrp	x0, 2692000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xcf1a8>
  9837a8:	91102000 	add	x0, x0, #0x408
  9837ac:	a9001265 	stp	x5, x4, [x19]
  9837b0:	91012268 	add	x8, x19, #0x48
  9837b4:	f9000e60 	str	x0, [x19,#24]
  9837b8:	aa1403e0 	mov	x0, x20
  9837bc:	f9001663 	str	x3, [x19,#40]
  9837c0:	b9003261 	str	w1, [x19,#48]
  9837c4:	a903de62 	stp	x2, x23, [x19,#56]
  9837c8:	d63f00c0 	blr	x6
  9837cc:	f9400281 	ldr	x1, [x20]
  9837d0:	91016268 	add	x8, x19, #0x58
  9837d4:	aa1403e0 	mov	x0, x20
  9837d8:	f940a421 	ldr	x1, [x1,#328]
  9837dc:	d63f0020 	blr	x1
  9837e0:	f9400281 	ldr	x1, [x20]
  9837e4:	aa1403e0 	mov	x0, x20
  9837e8:	9101a268 	add	x8, x19, #0x68
  9837ec:	f940a021 	ldr	x1, [x1,#320]
  9837f0:	d63f0020 	blr	x1
  9837f4:	f9402674 	ldr	x20, [x19,#72]
  9837f8:	b4003274 	cbz	x20, 983e44 <_ZSt20__throw_bad_weak_ptrv@@Base+0x7922c>
  9837fc:	f9400a96 	ldr	x22, [x20,#16]
  983800:	b4000cb6 	cbz	x22, 983994 <_ZSt20__throw_bad_weak_ptrv@@Base+0x78d7c>
  983804:	91008298 	add	x24, x20, #0x20
  983808:	d2800400 	mov	x0, #0x20                  	// #32
  98380c:	97ea854d 	bl	424d40 <_Znwm@plt>
