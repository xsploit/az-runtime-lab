
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 20eb300: a94363f7     	ldp	x23, x24, [sp, #0x30]
 20eb304: a8c67bfd     	ldp	x29, x30, [sp], #0x60
 20eb308: d65f03c0     	ret
 20eb30c: 91002273     	add	x19, x19, #0x8
 20eb310: eb1a027f     	cmp	x19, x26
 20eb314: 54fffd21     	b.ne	0x20eb2b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb430>
 20eb318: 17fffff1     	b	0x20eb2dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb454>
 20eb31c: 92fc0000     	mov	x0, #0x1fffffffffffffff // =2305843009213693951
 20eb320: eb00003f     	cmp	x1, x0
 20eb324: 54fff3a8     	b.hi	0x20eb198 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb310>
 20eb328: b50000c1     	cbnz	x1, 0x20eb340 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb4b8>
 20eb32c: d2800115     	mov	x21, #0x8               // =8
 20eb330: d2800018     	mov	x24, #0x0               // =0
 20eb334: d2800016     	mov	x22, #0x0               // =0
 20eb338: 17ffff9d     	b	0x20eb1ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb324>
 20eb33c: d2800021     	mov	x1, #0x1                // =1
 20eb340: d37df038     	lsl	x24, x1, #3
 20eb344: 17ffff95     	b	0x20eb198 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb310>
 20eb348: aa1603e0     	mov	x0, x22
 20eb34c: d503201f     	nop
 20eb350: f9400022     	ldr	x2, [x1]
 20eb354: f800843f     	str	xzr, [x1], #0x8
 20eb358: f8008402     	str	x2, [x0], #0x8
 20eb35c: eb01027f     	cmp	x19, x1
 20eb360: 54ffff81     	b.ne	0x20eb350 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb4c8>
 20eb364: 17ffffb3     	b	0x20eb230 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb3a8>
 20eb368: aa1503e0     	mov	x0, x21
 20eb36c: 17ffffcb     	b	0x20eb298 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb410>
 20eb370: 88dffc01     	ldar	w1, [x0]
 20eb374: 37f80141     	tbnz	w1, #0x1f, 0x20eb39c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb514>
 20eb378: 11000422     	add	w2, w1, #0x1
 20eb37c: 885ffc03     	ldaxr	w3, [x0]
 20eb380: 6b01007f     	cmp	w3, w1
 20eb384: 54000061     	b.ne	0x20eb390 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb508>
 20eb388: 8804fc02     	stlxr	w4, w2, [x0]
 20eb38c: 35ffff84     	cbnz	w4, 0x20eb37c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb4f4>
 20eb390: 54ffff01     	b.ne	0x20eb370 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb4e8>
 20eb394: 52800020     	mov	w0, #0x1                // =1
 20eb398: d65f03c0     	ret
 20eb39c: 52800000     	mov	w0, #0x0                // =0
 20eb3a0: d65f03c0     	ret
 20eb3a4: d503201f     	nop
 20eb3a8: f9400c00     	ldr	x0, [x0, #0x18]
 20eb3ac: 17fe410d     	b	0x207b7e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x87b958>
 20eb3b0: a9af7bfd     	stp	x29, x30, [sp, #-0x110]!
 20eb3b4: 900043e1     	adrp	x1, 0x2967000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x3a41a8>
 20eb3b8: 911bc021     	add	x1, x1, #0x6f0
 20eb3bc: 910003fd     	mov	x29, sp
 20eb3c0: a90153f3     	stp	x19, x20, [sp, #0x10]
 20eb3c4: aa0003f3     	mov	x19, x0
 20eb3c8: d2800080     	mov	x0, #0x4                // =4
 20eb3cc: fd001fe8     	str	d8, [sp, #0x38]
 20eb3d0: a9007e61     	stp	x1, xzr, [x19]
 20eb3d4: a9017e7f     	stp	xzr, xzr, [x19, #0x10]
 20eb3d8: f900127f     	str	xzr, [x19, #0x20]
 20eb3dc: a9057fff     	stp	xzr, xzr, [sp, #0x50]
 20eb3e0: f90033ff     	str	xzr, [sp, #0x60]
 20eb3e4: 978ce657     	bl	0x424d40 <_Znwm@plt>
 20eb3e8: aa0003e3     	mov	x3, x0
 20eb3ec: 90006a20     	adrp	x0, 0x2e2f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x86c1a8>
 20eb3f0: 91106000     	add	x0, x0, #0x418
 20eb3f4: a9025bf5     	stp	x21, x22, [sp, #0x20]
 20eb3f8: 90006a36     	adrp	x22, 0x2e2f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x86c1a8>
 20eb3fc: 911022d6     	add	x22, x22, #0x408
 20eb400: 90006a21     	adrp	x1, 0x2e2f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x86c1a8>
 20eb404: 910383e5     	add	x5, sp, #0xe0
 20eb408: 910403e4     	add	x4, sp, #0x100
 20eb40c: b943f829     	ldr	w9, [x1, #0x3f8]
 20eb410: 91001066     	add	x6, x3, #0x4
 20eb414: b8407008     	ldur	w8, [x0, #0x7]
 20eb418: 910303ed     	add	x13, sp, #0xc0
 20eb41c: 794012c7     	ldrh	w7, [x22, #0x8]
 20eb420: d280014b     	mov	x11, #0xa               // =10
 20eb424: f9400002     	ldr	x2, [x0]
 20eb428: f90073e2     	str	x2, [sp, #0xe0]
 20eb42c: f94002ca     	ldr	x10, [x22]
 20eb430: 3903afff     	strb	wzr, [sp, #0xeb]
 20eb434: a90f2fe4     	stp	x4, x11, [sp, #0xf0]
 20eb438: d280016c     	mov	x12, #0xb               // =11
 20eb43c: d280020e     	mov	x14, #0x10              // =16
 20eb440: f90083ea     	str	x10, [sp, #0x100]
 20eb444: 9102c3e1     	add	x1, sp, #0xb0
 20eb448: 39042bff     	strb	wzr, [sp, #0x10a]
 20eb44c: aa0103e0     	mov	x0, x1
 20eb450: b9000069     	str	w9, [x3]
 20eb454: 910243e1     	add	x1, sp, #0x90
 20eb458: b80070a8     	stur	w8, [x5, #0x7]
 20eb45c: d2800002     	mov	x2, #0x0                // =0
 20eb460: 79001087     	strh	w7, [x4, #0x8]
 20eb464: a9051be3     	stp	x3, x6, [sp, #0x50]
 20eb468: f90033e6     	str	x6, [sp, #0x60]
 20eb46c: f9004bee     	str	x14, [sp, #0x90]
 20eb470: f9005bed     	str	x13, [sp, #0xb0]
 20eb474: a90d33e5     	stp	x5, x12, [sp, #0xd0]
 20eb478: 978ce6be     	bl	0x424f70 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@plt>
 20eb47c: 90006a21     	adrp	x1, 0x2e2f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x86c1a8>
 20eb480: 9110a021     	add	x1, x1, #0x428
 20eb484: f9005be0     	str	x0, [sp, #0xb0]
 20eb488: f9404be2     	ldr	x2, [sp, #0x90]
 20eb48c: f90063e2     	str	x2, [sp, #0xc0]
 20eb490: a9400c22     	ldp	x2, x3, [x1]
 20eb494: a9000c02     	stp	x2, x3, [x0]
 20eb498: d28002c5     	mov	x5, #0x16               // =22
 20eb49c: f9404be4     	ldr	x4, [sp, #0x90]
 20eb4a0: 910283e3     	add	x3, sp, #0xa0
 20eb4a4: f9405be6     	ldr	x6, [sp, #0xb0]
 20eb4a8: f9005fe4     	str	x4, [sp, #0xb8]
 20eb4ac: 9101c3e1     	add	x1, sp, #0x70
 20eb4b0: 910243e0     	add	x0, sp, #0x90
 20eb4b4: d2800002     	mov	x2, #0x0                // =0
 20eb4b8: 382468df     	strb	wzr, [x6, x4]
 20eb4bc: f9003be5     	str	x5, [sp, #0x70]
 20eb4c0: f9004be3     	str	x3, [sp, #0x90]
 20eb4c4: 978ce6ab     	bl	0x424f70 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@plt>
 20eb4c8: 90006a21     	adrp	x1, 0x2e2f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x86c1a8>
 20eb4cc: 91110021     	add	x1, x1, #0x440
 20eb4d0: f9403be2     	ldr	x2, [sp, #0x70]
 20eb4d4: f9004be0     	str	x0, [sp, #0x90]
 20eb4d8: f90053e2     	str	x2, [sp, #0xa0]
 20eb4dc: d2800305     	mov	x5, #0x18               // =24
 20eb4e0: a9400c22     	ldp	x2, x3, [x1]
 20eb4e4: a9000c02     	stp	x2, x3, [x0]
 20eb4e8: f840e021     	ldur	x1, [x1, #0xe]
 20eb4ec: f800e001     	stur	x1, [x0, #0xe]
 20eb4f0: 910203e3     	add	x3, sp, #0x80
 20eb4f4: d2800002     	mov	x2, #0x0                // =0
 20eb4f8: f9403be4     	ldr	x4, [sp, #0x70]
 20eb4fc: f9004fe4     	str	x4, [sp, #0x98]
 20eb500: f9404be6     	ldr	x6, [sp, #0x90]
 20eb504: 910123e1     	add	x1, sp, #0x48
 20eb508: 9101c3e0     	add	x0, sp, #0x70
 20eb50c: 382468df     	strb	wzr, [x6, x4]
 20eb510: f90027e5     	str	x5, [sp, #0x48]
 20eb514: f9003be3     	str	x3, [sp, #0x70]
 20eb518: 978ce696     	bl	0x424f70 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@plt>
 20eb51c: 90006a21     	adrp	x1, 0x2e2f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x86c1a8>
 20eb520: 91116021     	add	x1, x1, #0x458
 20eb524: aa0003e2     	mov	x2, x0
 20eb528: f9003be2     	str	x2, [sp, #0x70]
 20eb52c: f94027e0     	ldr	x0, [sp, #0x48]
 20eb530: f90043e0     	str	x0, [sp, #0x80]
 20eb534: a9401424     	ldp	x4, x5, [x1]
 20eb538: a9001444     	stp	x4, x5, [x2]
 20eb53c: d2801800     	mov	x0, #0xc0               // =192
 20eb540: f9400821     	ldr	x1, [x1, #0x10]
 20eb544: f9000841     	str	x1, [x2, #0x10]
 20eb548: f94027e1     	ldr	x1, [sp, #0x48]
 20eb54c: f9003fe1     	str	x1, [sp, #0x78]
 20eb550: f9403be2     	ldr	x2, [sp, #0x70]
 20eb554: 3821685f     	strb	wzr, [x2, x1]
 20eb558: 978ce5fa     	bl	0x424d40 <_Znwm@plt>
 20eb55c: aa0003f5     	mov	x21, x0
 20eb560: 910143e6     	add	x6, sp, #0x50
 20eb564: 9101c3e5     	add	x5, sp, #0x70
 20eb568: 910243e4     	add	x4, sp, #0x90
 20eb56c: 9102c3e3     	add	x3, sp, #0xb0
 20eb570: 910343e2     	add	x2, sp, #0xd0
 20eb574: 9103c3e1     	add	x1, sp, #0xf0
 20eb578: 97fff5ec     	bl	0x20e8d28 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8e8ea0>
 20eb57c: f9403be0     	ldr	x0, [sp, #0x70]
 20eb580: 910203e1     	add	x1, sp, #0x80
 20eb584: eb01001f     	cmp	x0, x1
 20eb588: 54000040     	b.eq	0x20eb590 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb708>
 20eb58c: 978ce631     	bl	0x424e50 <_ZdlPv@plt>
 20eb590: f9404be0     	ldr	x0, [sp, #0x90]
 20eb594: 910283e1     	add	x1, sp, #0xa0
 20eb598: eb01001f     	cmp	x0, x1
 20eb59c: 54000040     	b.eq	0x20eb5a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x8eb71c>
