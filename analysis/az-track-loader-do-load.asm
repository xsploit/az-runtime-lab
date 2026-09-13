
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000a6de20 <_ZSt20__throw_bad_weak_ptrv@@Base+0x163208>:
  a6de20:	d10a43ff 	sub	sp, sp, #0x290
  a6de24:	a9007bfd 	stp	x29, x30, [sp]
  a6de28:	910003fd 	mov	x29, sp
  a6de2c:	a9025bf5 	stp	x21, x22, [sp,#32]
  a6de30:	aa0003f6 	mov	x22, x0
  a6de34:	79420800 	ldrh	w0, [x0,#260]
  a6de38:	a90153f3 	stp	x19, x20, [sp,#16]
  a6de3c:	12001001 	and	w1, w0, #0x1f
  a6de40:	f9001bf7 	str	x23, [sp,#48]
  a6de44:	7100103f 	cmp	w1, #0x4
  a6de48:	540000a0 	b.eq	a6de5c <_ZSt20__throw_bad_weak_ptrv@@Base+0x163244>
  a6de4c:	11006800 	add	w0, w0, #0x1a
  a6de50:	12001000 	and	w0, w0, #0x1f
  a6de54:	7100081f 	cmp	w0, #0x2
  a6de58:	54000068 	b.hi	a6de64 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16324c>
  a6de5c:	b20003e0 	mov	x0, #0x100000001           	// #4294967297
  a6de60:	f9009ec0 	str	x0, [x22,#312]
  a6de64:	d2802002 	mov	x2, #0x100                 	// #256
  a6de68:	52800023 	mov	w3, #0x1                   	// #1
  a6de6c:	f2a00c82 	movk	x2, #0x64, lsl #16
  a6de70:	92f00201 	mov	x1, #0x7fefffffffffffff    	// #9218868437227405311
  a6de74:	12800014 	mov	w20, #0xffffffff            	// #-1
  a6de78:	12800015 	mov	w21, #0xffffffff            	// #-1
  a6de7c:	52800020 	mov	w0, #0x1                   	// #1
  a6de80:	3901c3e0 	strb	w0, [sp,#112]
  a6de84:	3901d3ff 	strb	wzr, [sp,#116]
  a6de88:	92f00013 	mov	x19, #0x7fffffffffffffff    	// #9223372036854775807
  a6de8c:	b9007bff 	str	wzr, [sp,#120]
  a6de90:	9106c3e0 	add	x0, sp, #0x1b0
  a6de94:	b90083ff 	str	wzr, [sp,#128]
  a6de98:	12b00017 	mov	w23, #0x7fffffff            	// #2147483647
  a6de9c:	f9004bff 	str	xzr, [sp,#144]
  a6dea0:	b9009bff 	str	wzr, [sp,#152]
  a6dea4:	790143f4 	strh	w20, [sp,#160]
  a6dea8:	a90affff 	stp	xzr, xzr, [sp,#168]
  a6deac:	f9005fff 	str	xzr, [sp,#184]
  a6deb0:	b900c3f5 	str	w21, [sp,#192]
  a6deb4:	390313ff 	strb	wzr, [sp,#196]
  a6deb8:	f90067ff 	str	xzr, [sp,#200]
  a6debc:	b900d3e3 	str	w3, [sp,#208]
  a6dec0:	390353ff 	strb	wzr, [sp,#212]
  a6dec4:	f9006fff 	str	xzr, [sp,#216]
  a6dec8:	390383ff 	strb	wzr, [sp,#224]
  a6decc:	f80e43e2 	stur	x2, [sp,#228]
  a6ded0:	f9007be1 	str	x1, [sp,#240]
  a6ded4:	b900fbe2 	str	w2, [sp,#248]
  a6ded8:	f90083ff 	str	xzr, [sp,#256]
  a6dedc:	b9010bff 	str	wzr, [sp,#264]
  a6dee0:	790223f5 	strh	w21, [sp,#272]
  a6dee4:	a911ffff 	stp	xzr, xzr, [sp,#280]
  a6dee8:	f90097ff 	str	xzr, [sp,#296]
  a6deec:	b90133f5 	str	w21, [sp,#304]
  a6def0:	3904d3ff 	strb	wzr, [sp,#308]
  a6def4:	a9147fff 	stp	xzr, xzr, [sp,#320]
  a6def8:	a9167fff 	stp	xzr, xzr, [sp,#352]
  a6defc:	a9177fff 	stp	xzr, xzr, [sp,#368]
  a6df00:	a9187fff 	stp	xzr, xzr, [sp,#384]
  a6df04:	a9197fff 	stp	xzr, xzr, [sp,#400]
  a6df08:	f9009fff 	str	xzr, [sp,#312]
  a6df0c:	390503f4 	strb	w20, [sp,#320]
  a6df10:	b90147f7 	str	w23, [sp,#324]
  a6df14:	a914cff3 	stp	x19, x19, [sp,#328]
  a6df18:	a915cff3 	stp	x19, x19, [sp,#344]
  a6df1c:	a91a7fff 	stp	xzr, xzr, [sp,#416]
  a6df20:	a91b7fff 	stp	xzr, xzr, [sp,#432]
  a6df24:	9462857b 	bl	230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1873f8>
  a6df28:	9106e3e0 	add	x0, sp, #0x1b8
  a6df2c:	9464dc35 	bl	23a5000 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2fbe0>
  a6df30:	3906f3ff 	strb	wzr, [sp,#444]
  a6df34:	910803e0 	add	x0, sp, #0x200
  a6df38:	910803e1 	add	x1, sp, #0x200
  a6df3c:	790383ff 	strh	wzr, [sp,#448]
  a6df40:	39070bff 	strb	wzr, [sp,#450]
  a6df44:	a900fc1f 	stp	xzr, xzr, [x0,#8]
  a6df48:	9109e3e0 	add	x0, sp, #0x278
  a6df4c:	a902fc3f 	stp	xzr, xzr, [x1,#40]
  a6df50:	a903fc3f 	stp	xzr, xzr, [x1,#56]
  a6df54:	a904fc3f 	stp	xzr, xzr, [x1,#72]
  a6df58:	a905fc3f 	stp	xzr, xzr, [x1,#88]
  a6df5c:	a906fc3f 	stp	xzr, xzr, [x1,#104]
  a6df60:	a907fc3f 	stp	xzr, xzr, [x1,#120]
  a6df64:	910803e1 	add	x1, sp, #0x200
  a6df68:	f900e7ff 	str	xzr, [sp,#456]
  a6df6c:	b901d3ff 	str	wzr, [sp,#464]
  a6df70:	7903b3f4 	strh	w20, [sp,#472]
  a6df74:	a91e7fff 	stp	xzr, xzr, [sp,#480]
  a6df78:	f900fbff 	str	xzr, [sp,#496]
  a6df7c:	b901fbf5 	str	w21, [sp,#504]
  a6df80:	3907f3ff 	strb	wzr, [sp,#508]
  a6df84:	f90103ff 	str	xzr, [sp,#512]
  a6df88:	390823f4 	strb	w20, [sp,#520]
  a6df8c:	b9020ff7 	str	w23, [sp,#524]
  a6df90:	a9014c33 	stp	x19, x19, [x1,#16]
  a6df94:	a9024c33 	stp	x19, x19, [x1,#32]
  a6df98:	9462855e 	bl	230f510 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1873f8>
  a6df9c:	910a03e0 	add	x0, sp, #0x280
  a6dfa0:	9464dc18 	bl	23a5000 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x2fbe0>
  a6dfa4:	f94076c0 	ldr	x0, [x22,#232]
  a6dfa8:	390a13ff 	strb	wzr, [sp,#644]
  a6dfac:	790513ff 	strh	wzr, [sp,#648]
  a6dfb0:	390a2bff 	strb	wzr, [sp,#650]
  a6dfb4:	b4000180 	cbz	x0, a6dfe4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1633cc>
  a6dfb8:	910402c1 	add	x1, x22, #0x100
  a6dfbc:	9101c3e2 	add	x2, sp, #0x70
  a6dfc0:	97ff248c 	bl	a371f0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x12c5d8>
  a6dfc4:	910203e0 	add	x0, sp, #0x80
  a6dfc8:	97fe6a7c 	bl	a089b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0xfdda0>
  a6dfcc:	a9407bfd 	ldp	x29, x30, [sp]
  a6dfd0:	a94153f3 	ldp	x19, x20, [sp,#16]
  a6dfd4:	a9425bf5 	ldp	x21, x22, [sp,#32]
  a6dfd8:	f9401bf7 	ldr	x23, [sp,#48]
  a6dfdc:	910a43ff 	add	sp, sp, #0x290
  a6dfe0:	d65f03c0 	ret
  a6dfe4:	9000daa1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  a6dfe8:	910123e0 	add	x0, sp, #0x48
  a6dfec:	9136a021 	add	x1, x1, #0xda8
  a6dff0:	9463173c 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a6dff4:	f000e2e1 	adrp	x1, 26cc000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1091a8>
  a6dff8:	9111c021 	add	x1, x1, #0x470
  a6dffc:	910143e8 	add	x8, sp, #0x50
  a6e000:	91202021 	add	x1, x1, #0x808
  a6e004:	910123e0 	add	x0, sp, #0x48
  a6e008:	946296fa 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a6e00c:	b000eae1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  a6e010:	910163e8 	add	x8, sp, #0x58
  a6e014:	91366021 	add	x1, x1, #0xd98
  a6e018:	910143e0 	add	x0, sp, #0x50
  a6e01c:	946296f5 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  a6e020:	f000e2e1 	adrp	x1, 26cd000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x10a1a8>
  a6e024:	910183e0 	add	x0, sp, #0x60
  a6e028:	91110021 	add	x1, x1, #0x440
  a6e02c:	9463172d 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  a6e030:	910183e1 	add	x1, sp, #0x60
  a6e034:	9101a3e8 	add	x8, sp, #0x68
  a6e038:	910163e0 	add	x0, sp, #0x58
  a6e03c:	94629695 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  a6e040:	52800022 	mov	w2, #0x1                   	// #1
  a6e044:	52800001 	mov	w1, #0x0                   	// #0
  a6e048:	9101a3e0 	add	x0, sp, #0x68
  a6e04c:	945e48e5 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
  a6e050:	9101a3e0 	add	x0, sp, #0x68
  a6e054:	9462396b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6e058:	910183e0 	add	x0, sp, #0x60
  a6e05c:	94623969 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6e060:	910163e0 	add	x0, sp, #0x58
  a6e064:	94623967 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6e068:	910143e0 	add	x0, sp, #0x50
  a6e06c:	94623965 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6e070:	910123e0 	add	x0, sp, #0x48
  a6e074:	94623963 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6e078:	910203e0 	add	x0, sp, #0x80
  a6e07c:	97fe6a4f 	bl	a089b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0xfdda0>
  a6e080:	a9407bfd 	ldp	x29, x30, [sp]
  a6e084:	a94153f3 	ldp	x19, x20, [sp,#16]
  a6e088:	a9425bf5 	ldp	x21, x22, [sp,#32]
  a6e08c:	f9401bf7 	ldr	x23, [sp,#48]
  a6e090:	910a43ff 	add	sp, sp, #0x290
  a6e094:	d65f03c0 	ret
  a6e098:	aa0003f3 	mov	x19, x0
  a6e09c:	910123e0 	add	x0, sp, #0x48
  a6e0a0:	94623958 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6e0a4:	910203e0 	add	x0, sp, #0x80
  a6e0a8:	97fe6a44 	bl	a089b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0xfdda0>
  a6e0ac:	aa1303e0 	mov	x0, x19
  a6e0b0:	97e6db18 	bl	424d10 <_Unwind_Resume@plt>
  a6e0b4:	aa0003f3 	mov	x19, x0
  a6e0b8:	17fffffb 	b	a6e0a4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x16348c>
  a6e0bc:	aa0003f3 	mov	x19, x0
  a6e0c0:	9101a3e0 	add	x0, sp, #0x68
  a6e0c4:	9462394f 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6e0c8:	910183e0 	add	x0, sp, #0x60
  a6e0cc:	9462394d 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6e0d0:	910163e0 	add	x0, sp, #0x58
  a6e0d4:	9462394b 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6e0d8:	910143e0 	add	x0, sp, #0x50
  a6e0dc:	94623949 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
  a6e0e0:	17ffffef 	b	a6e09c <_ZSt20__throw_bad_weak_ptrv@@Base+0x163484>
  a6e0e4:	aa0003f3 	mov	x19, x0
  a6e0e8:	17fffff8 	b	a6e0c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1634b0>
  a6e0ec:	aa0003f3 	mov	x19, x0
  a6e0f0:	17fffff8 	b	a6e0d0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1634b8>
  a6e0f4:	aa0003f3 	mov	x19, x0
  a6e0f8:	17fffff8 	b	a6e0d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1634c0>
  a6e0fc:	d503201f 	nop
