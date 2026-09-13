
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000ce6050 <_ZSt20__throw_bad_weak_ptrv@@Base+0x3db438>:
  ce6050:	9119a000 	add	x0, x0, #0x668
  ce6054:	97fffbdb 	bl	ce4fc0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x3da3a8>
  ce6058:	aa0022a0 	orr	x0, x21, x0, lsl #8
  ce605c:	f9404a61 	ldr	x1, [x19,#144]
  ce6060:	f85f8021 	ldur	x1, [x1,#-8]
  ce6064:	f90117e0 	str	x0, [sp,#552]
  ce6068:	9108a3e0 	add	x0, sp, #0x228
  ce606c:	f100003f 	cmp	x1, #0x0
  ce6070:	9103c022 	add	x2, x1, #0xf0
  ce6074:	9a811041 	csel	x1, x2, x1, ne
  ce6078:	940029ca 	bl	cf07a0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x3e5b88>
  ce607c:	f000d540 	adrp	x0, 2791000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1ce1a8>
  ce6080:	911a0000 	add	x0, x0, #0x680
  ce6084:	97fffbcf 	bl	ce4fc0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x3da3a8>
  ce6088:	aa0022a0 	orr	x0, x21, x0, lsl #8
  ce608c:	f9404a61 	ldr	x1, [x19,#144]
  ce6090:	fc5f8028 	ldur	d8, [x1,#-8]
  ce6094:	f90123e0 	str	x0, [sp,#576]
  ce6098:	d2802800 	mov	x0, #0x140                 	// #320
  ce609c:	97dcfb29 	bl	424d40 <_Znwm@plt>
  ce60a0:	9e660101 	fmov	x1, d8
  ce60a4:	aa0003f9 	mov	x25, x0
  ce60a8:	97f62352 	bl	a6edf0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1641d8>
  ce60ac:	f94083e2 	ldr	x2, [sp,#256]
  ce60b0:	f901dff9 	str	x25, [sp,#952]
  ce60b4:	a9408440 	ldp	x0, x1, [x2,#8]
  ce60b8:	eb01001f 	cmp	x0, x1
  ce60bc:	54010b60 	b.eq	ce8228 <_ZSt20__throw_bad_weak_ptrv@@Base+0x3dd610>
  ce60c0:	91036321 	add	x1, x25, #0xd8
  ce60c4:	f8008401 	str	x1, [x0],#8
  ce60c8:	f9000440 	str	x0, [x2,#8]
  ce60cc:	910903e0 	add	x0, sp, #0x240
  ce60d0:	94002b08 	bl	cf0cf0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x3e60d8>
  ce60d4:	f000d540 	adrp	x0, 2791000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1ce1a8>
  ce60d8:	911a6000 	add	x0, x0, #0x698
  ce60dc:	97fffbb9 	bl	ce4fc0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x3da3a8>
