
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000a6de18 <_ZSt20__throw_bad_weak_ptrv@@Base+0x163200>:
  a6de18:	d1036000 	sub	x0, x0, #0xd8
  a6de1c:	17fffd3b 	b	a6d308 <_ZSt20__throw_bad_weak_ptrv@@Base+0x1626f0>
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
