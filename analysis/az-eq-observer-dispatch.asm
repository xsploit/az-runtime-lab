
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000690b90 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv>:
  6c5330: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  6c5334: 910003fd     	mov	x29, sp
  6c5338: a90153f3     	stp	x19, x20, [sp, #0x10]
  6c533c: aa0103f4     	mov	x20, x1
  6c5340: 9001a413     	adrp	x19, 0x3b45000 <stdout+0x3f40>
  6c5344: 91158273     	add	x19, x19, #0x560
  6c5348: a9025bf5     	stp	x21, x22, [sp, #0x20]
  6c534c: aa0003f5     	mov	x21, x0
  6c5350: 08dffe60     	ldarb	w0, [x19]
  6c5354: 360006c0     	tbz	w0, #0x0, 0x6c542c <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x3489c>
  6c5358: 08dffe60     	ldarb	w0, [x19]
  6c535c: 360009e0     	tbz	w0, #0x0, 0x6c5498 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x34908>
  6c5360: 9001a400     	adrp	x0, 0x3b45000 <stdout+0x3f40>
  6c5364: 91164000     	add	x0, x0, #0x590
  6c5368: 88dffc01     	ldar	w1, [x0]
  6c536c: 37f80ca1     	tbnz	w1, #0x1f, 0x6c5500 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x34970>
  6c5370: 11000422     	add	w2, w1, #0x1
  6c5374: 885ffc03     	ldaxr	w3, [x0]
  6c5378: 6b01007f     	cmp	w3, w1
  6c537c: 54000061     	b.ne	0x6c5388 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x347f8>
  6c5380: 8804fc02     	stlxr	w4, w2, [x0]
  6c5384: 35ffff84     	cbnz	w4, 0x6c5374 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x347e4>
  6c5388: 54ffff01     	b.ne	0x6c5368 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x347d8>
  6c538c: 9001a402     	adrp	x2, 0x3b45000 <stdout+0x3f40>
  6c5390: 9115a042     	add	x2, x2, #0x568
  6c5394: f94002a1     	ldr	x1, [x21]
  6c5398: b9801843     	ldrsw	x3, [x2, #0x18]
  6c539c: f9400444     	ldr	x4, [x2, #0x8]
  6c53a0: 9ac30822     	udiv	x2, x1, x3
  6c53a4: 9b038442     	msub	x2, x2, x3, x1
  6c53a8: f862d893     	ldr	x19, [x4, w2, sxtw #3]
  6c53ac: b5000093     	cbnz	x19, 0x6c53bc <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x3482c>
  6c53b0: 14000007     	b	0x6c53cc <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x3483c>
  6c53b4: f9400a73     	ldr	x19, [x19, #0x10]
  6c53b8: b40000b3     	cbz	x19, 0x6c53cc <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x3483c>
  6c53bc: f9400262     	ldr	x2, [x19]
  6c53c0: eb02003f     	cmp	x1, x2
  6c53c4: 54ffff81     	b.ne	0x6c53b4 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x34824>
  6c53c8: f9400673     	ldr	x19, [x19, #0x8]
  6c53cc: 88dffc01     	ldar	w1, [x0]
  6c53d0: 7100003f     	cmp	w1, #0x0
  6c53d4: 54000a0d     	b.le	0x6c5514 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x34984>
  6c53d8: 51000422     	sub	w2, w1, #0x1
  6c53dc: 885ffc03     	ldaxr	w3, [x0]
  6c53e0: 6b01007f     	cmp	w3, w1
  6c53e4: 54000061     	b.ne	0x6c53f0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x34860>
  6c53e8: 8804fc02     	stlxr	w4, w2, [x0]
  6c53ec: 35ffff84     	cbnz	w4, 0x6c53dc <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x3484c>
  6c53f0: 54fffee1     	b.ne	0x6c53cc <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x3483c>
  6c53f4: b4000873     	cbz	x19, 0x6c5500 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x34970>
  6c53f8: f9400263     	ldr	x3, [x19]
  6c53fc: f100029f     	cmp	x20, #0x0
  6c5400: 9100c281     	add	x1, x20, #0x30
  6c5404: aa1303e0     	mov	x0, x19
  6c5408: 9a941021     	csel	x1, x1, x20, ne
  6c540c: 52800022     	mov	w2, #0x1                // =1
  6c5410: f9401863     	ldr	x3, [x3, #0x30]
  6c5414: d63f0060     	blr	x3
  6c5418: 52800020     	mov	w0, #0x1                // =1
  6c541c: a94153f3     	ldp	x19, x20, [sp, #0x10]
  6c5420: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  6c5424: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  6c5428: d65f03c0     	ret
  6c542c: aa1303e0     	mov	x0, x19
  6c5430: 97f5838c     	bl	0x426260 <__cxa_guard_acquire@plt>
  6c5434: 34fff920     	cbz	w0, 0x6c5358 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x347c8>
  6c5438: 9001a416     	adrp	x22, 0x3b45000 <stdout+0x3f40>
  6c543c: 9115a2d6     	add	x22, x22, #0x568
  6c5440: d2809800     	mov	x0, #0x4c0              // =1216
  6c5444: b90022df     	str	wzr, [x22, #0x20]
  6c5448: 97f57ee2     	bl	0x424fd0 <malloc@plt>
  6c544c: 52801304     	mov	w4, #0x98               // =152
  6c5450: 52800ca3     	mov	w3, #0x65               // =101
  6c5454: d2806502     	mov	x2, #0x328              // =808
  6c5458: 52800001     	mov	w1, #0x0                // =0
  6c545c: f90006c0     	str	x0, [x22, #0x8]
  6c5460: b90012c4     	str	w4, [x22, #0x10]
  6c5464: b9001ac3     	str	w3, [x22, #0x18]
  6c5468: 97f57c62     	bl	0x4245f0 <memset@plt>
  6c546c: aa1303e0     	mov	x0, x19
  6c5470: b9002adf     	str	wzr, [x22, #0x28]
  6c5474: 97f584f3     	bl	0x426840 <__cxa_guard_release@plt>
  6c5478: aa1603e1     	mov	x1, x22
  6c547c: b001a302     	adrp	x2, 0x3b26000
  6c5480: d0000020     	adrp	x0, 0x6cb000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x3a470>
  6c5484: 9135a042     	add	x2, x2, #0xd68
  6c5488: 9112c000     	add	x0, x0, #0x4b0
  6c548c: 97f58689     	bl	0x426eb0 <__cxa_atexit@plt>
  6c5490: 08dffe60     	ldarb	w0, [x19]
  6c5494: 3707f660     	tbnz	w0, #0x0, 0x6c5360 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x347d0>
  6c5498: aa1303e0     	mov	x0, x19
  6c549c: 97f58371     	bl	0x426260 <__cxa_guard_acquire@plt>
  6c54a0: 34fff600     	cbz	w0, 0x6c5360 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x347d0>
  6c54a4: 9001a416     	adrp	x22, 0x3b45000 <stdout+0x3f40>
  6c54a8: 9115a2d6     	add	x22, x22, #0x568
  6c54ac: d2809800     	mov	x0, #0x4c0              // =1216
  6c54b0: b90022df     	str	wzr, [x22, #0x20]
  6c54b4: 97f57ec7     	bl	0x424fd0 <malloc@plt>
  6c54b8: 52801304     	mov	w4, #0x98               // =152
  6c54bc: 52800ca3     	mov	w3, #0x65               // =101
  6c54c0: d2806502     	mov	x2, #0x328              // =808
  6c54c4: 52800001     	mov	w1, #0x0                // =0
  6c54c8: f90006c0     	str	x0, [x22, #0x8]
  6c54cc: b90012c4     	str	w4, [x22, #0x10]
  6c54d0: b9001ac3     	str	w3, [x22, #0x18]
  6c54d4: 97f57c47     	bl	0x4245f0 <memset@plt>
  6c54d8: aa1303e0     	mov	x0, x19
  6c54dc: b9002adf     	str	wzr, [x22, #0x28]
  6c54e0: 97f584d8     	bl	0x426840 <__cxa_guard_release@plt>
  6c54e4: b001a302     	adrp	x2, 0x3b26000
  6c54e8: aa1603e1     	mov	x1, x22
  6c54ec: 9135a042     	add	x2, x2, #0xd68
  6c54f0: d0000020     	adrp	x0, 0x6cb000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x3a470>
  6c54f4: 9112c000     	add	x0, x0, #0x4b0
  6c54f8: 97f5866e     	bl	0x426eb0 <__cxa_atexit@plt>
  6c54fc: 17ffff99     	b	0x6c5360 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x347d0>
  6c5500: 52800000     	mov	w0, #0x0                // =0
  6c5504: a94153f3     	ldp	x19, x20, [sp, #0x10]
  6c5508: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  6c550c: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  6c5510: d65f03c0     	ret
  6c5514: 910103e0     	add	x0, sp, #0x40
  6c5518: 9000f7e1     	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
  6c551c: 9136a021     	add	x1, x1, #0xda8


runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000690b90 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv>:
  6c4838: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  6c483c: 910003fd     	mov	x29, sp
  6c4840: a90153f3     	stp	x19, x20, [sp, #0x10]
  6c4844: a9025bf5     	stp	x21, x22, [sp, #0x20]
  6c4848: a9435813     	ldp	x19, x22, [x0, #0x30]
  6c484c: eb16027f     	cmp	x19, x22
  6c4850: 54000280     	b.eq	0x6c48a0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x33d10>
  6c4854: aa0303f4     	mov	x20, x3
  6c4858: aa0203f5     	mov	x21, x2
  6c485c: f9001bf7     	str	x23, [sp, #0x30]
  6c4860: f0000037     	adrp	x23, 0x6cb000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x3a470>
  6c4864: 911242f7     	add	x23, x23, #0x490
  6c4868: f9400264     	ldr	x4, [x19]
  6c486c: aa1503e1     	mov	x1, x21
  6c4870: b9400682     	ldr	w2, [x20, #0x4]
  6c4874: 91002273     	add	x19, x19, #0x8
  6c4878: aa0403e0     	mov	x0, x4
  6c487c: bd400280     	ldr	s0, [x20]
  6c4880: f9400083     	ldr	x3, [x4]
  6c4884: f9402064     	ldr	x4, [x3, #0x40]
  6c4888: eb17009f     	cmp	x4, x23
  6c488c: 54000040     	b.eq	0x6c4894 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x33d04>
  6c4890: d63f0080     	blr	x4
  6c4894: eb1302df     	cmp	x22, x19
  6c4898: 54fffe81     	b.ne	0x6c4868 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x33cd8>
  6c489c: f9401bf7     	ldr	x23, [sp, #0x30]
  6c48a0: a94153f3     	ldp	x19, x20, [sp, #0x10]
  6c48a4: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  6c48a8: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  6c48ac: d65f03c0     	ret


runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000690b90 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv>:
  6c4258: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  6c425c: 910003fd     	mov	x29, sp
  6c4260: a90153f3     	stp	x19, x20, [sp, #0x10]
  6c4264: a9025bf5     	stp	x21, x22, [sp, #0x20]
  6c4268: a9465413     	ldp	x19, x21, [x0, #0x60]
  6c426c: eb15027f     	cmp	x19, x21
  6c4270: 540002c0     	b.eq	0x6c42c8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x33738>
  6c4274: f0000034     	adrp	x20, 0x6cb000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x3a470>
  6c4278: aa0303f6     	mov	x22, x3
  6c427c: 91124294     	add	x20, x20, #0x490
  6c4280: f9001bf7     	str	x23, [sp, #0x30]
  6c4284: aa0203f7     	mov	x23, x2
  6c4288: 14000003     	b	0x6c4294 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x33704>
  6c428c: eb1302bf     	cmp	x21, x19
  6c4290: 540001a0     	b.eq	0x6c42c4 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x33734>
  6c4294: f9400260     	ldr	x0, [x19]
  6c4298: 91002273     	add	x19, x19, #0x8
  6c429c: f9400001     	ldr	x1, [x0]
  6c42a0: f9402024     	ldr	x4, [x1, #0x40]
  6c42a4: eb14009f     	cmp	x4, x20
  6c42a8: 54ffff20     	b.eq	0x6c428c <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x336fc>
  6c42ac: b94006c2     	ldr	w2, [x22, #0x4]
  6c42b0: aa1703e1     	mov	x1, x23
  6c42b4: bd4002c0     	ldr	s0, [x22]
  6c42b8: d63f0080     	blr	x4
  6c42bc: eb1302bf     	cmp	x21, x19
  6c42c0: 54fffea1     	b.ne	0x6c4294 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x33704>
  6c42c4: f9401bf7     	ldr	x23, [sp, #0x30]
  6c42c8: a94153f3     	ldp	x19, x20, [sp, #0x10]
  6c42cc: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  6c42d0: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  6c42d4: d65f03c0     	ret


runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000690b90 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv>:
  6c37b0: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  6c37b4: 910003fd     	mov	x29, sp
  6c37b8: f9401404     	ldr	x4, [x0, #0x28]
  6c37bc: a90153f3     	stp	x19, x20, [sp, #0x10]
  6c37c0: aa0103f4     	mov	x20, x1
  6c37c4: a9025bf5     	stp	x21, x22, [sp, #0x20]
  6c37c8: aa0003f5     	mov	x21, x0
  6c37cc: 9ac40833     	udiv	x19, x1, x4
  6c37d0: f9401000     	ldr	x0, [x0, #0x20]
  6c37d4: 9b048673     	msub	x19, x19, x4, x1
  6c37d8: f8737800     	ldr	x0, [x0, x19, lsl #3]
  6c37dc: f9001bf7     	str	x23, [sp, #0x30]
  6c37e0: fd001fe8     	str	d8, [sp, #0x38]
  6c37e4: 2a0203f7     	mov	w23, w2
  6c37e8: 1e204008     	fmov	s8, s0
  6c37ec: b40007c0     	cbz	x0, 0x6c38e4 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32d54>
  6c37f0: f9400000     	ldr	x0, [x0]
  6c37f4: f9400401     	ldr	x1, [x0, #0x8]
  6c37f8: eb01029f     	cmp	x20, x1
  6c37fc: 54000240     	b.eq	0x6c3844 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32cb4>
  6c3800: f9400000     	ldr	x0, [x0]
  6c3804: b4000700     	cbz	x0, 0x6c38e4 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32d54>
  6c3808: f9400402     	ldr	x2, [x0, #0x8]
  6c380c: 9ac40841     	udiv	x1, x2, x4
  6c3810: 9b048821     	msub	x1, x1, x4, x2
  6c3814: eb13003f     	cmp	x1, x19
  6c3818: 54000120     	b.eq	0x6c383c <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32cac>
  6c381c: 14000032     	b	0x6c38e4 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32d54>
  6c3820: f9400000     	ldr	x0, [x0]
  6c3824: b4000600     	cbz	x0, 0x6c38e4 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32d54>
  6c3828: f9400402     	ldr	x2, [x0, #0x8]
  6c382c: 9ac40843     	udiv	x3, x2, x4
  6c3830: 9b048863     	msub	x3, x3, x4, x2
  6c3834: eb03027f     	cmp	x19, x3
  6c3838: 54000561     	b.ne	0x6c38e4 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32d54>
  6c383c: eb02029f     	cmp	x20, x2
  6c3840: 54ffff01     	b.ne	0x6c3820 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32c90>
  6c3844: 91004000     	add	x0, x0, #0x10
  6c3848: f9400016     	ldr	x22, [x0]
  6c384c: d2991000     	mov	x0, #0xc880             // =51328
  6c3850: f2ac19c0     	movk	x0, #0x60ce, lsl #16
  6c3854: f2c38fa0     	movk	x0, #0x1c7d, lsl #32
  6c3858: f2e02880     	movk	x0, #0x144, lsl #48
  6c385c: eb0002df     	cmp	x22, x0
  6c3860: 54000100     	b.eq	0x6c3880 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32cf0>
  6c3864: b50001b6     	cbnz	x22, 0x6c3898 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32d08>
  6c3868: a94153f3     	ldp	x19, x20, [sp, #0x10]
  6c386c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  6c3870: f9401bf7     	ldr	x23, [sp, #0x30]
  6c3874: fd401fe8     	ldr	d8, [sp, #0x38]
  6c3878: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  6c387c: d65f03c0     	ret
  6c3880: 7103feff     	cmp	w23, #0xff
  6c3884: 54ffff20     	b.eq	0x6c3868 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32cd8>
  6c3888: d28fd336     	mov	x22, #0x7e99            // =32409
  6c388c: f2a30936     	movk	x22, #0x1849, lsl #16
  6c3890: f2d4e316     	movk	x22, #0xa718, lsl #32
  6c3894: f2e037f6     	movk	x22, #0x1bf, lsl #48
  6c3898: a940d6b3     	ldp	x19, x21, [x21, #0x8]
  6c389c: eb1302bf     	cmp	x21, x19
  6c38a0: 54fffe40     	b.eq	0x6c3868 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32cd8>
  6c38a4: 90000014     	adrp	x20, 0x6c3000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32470>
  6c38a8: 9138a294     	add	x20, x20, #0xe28
  6c38ac: 14000003     	b	0x6c38b8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32d28>
  6c38b0: eb1302bf     	cmp	x21, x19
  6c38b4: 54fffda0     	b.eq	0x6c3868 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32cd8>
  6c38b8: f9400260     	ldr	x0, [x19]
  6c38bc: 91002273     	add	x19, x19, #0x8
  6c38c0: f9400001     	ldr	x1, [x0]
  6c38c4: f9401423     	ldr	x3, [x1, #0x28]
  6c38c8: eb14007f     	cmp	x3, x20
  6c38cc: 54ffff20     	b.eq	0x6c38b0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32d20>
  6c38d0: 1e204100     	fmov	s0, s8
  6c38d4: 2a1703e2     	mov	w2, w23
  6c38d8: aa1603e1     	mov	x1, x22
  6c38dc: d63f0060     	blr	x3
  6c38e0: 17fffff4     	b	0x6c38b0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32d20>
  6c38e4: d2800300     	mov	x0, #0x18               // =24
  6c38e8: 97f58516     	bl	0x424d40 <_Znwm@plt>
  6c38ec: aa0003e5     	mov	x5, x0
  6c38f0: aa0003e3     	mov	x3, x0
  6c38f4: aa1403e2     	mov	x2, x20
  6c38f8: aa1303e1     	mov	x1, x19
  6c38fc: d2800024     	mov	x4, #0x1                // =1
  6c3900: 910082a0     	add	x0, x21, #0x20
  6c3904: a90050bf     	stp	xzr, x20, [x5]
  6c3908: f90008bf     	str	xzr, [x5, #0x10]
  6c390c: 94000193     	bl	0x6c3f58 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x333c8>
  6c3910: 91004000     	add	x0, x0, #0x10
  6c3914: 17ffffcd     	b	0x6c3848 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv+0x32cb8>
