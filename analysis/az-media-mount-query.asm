
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000b46790 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bb78>:
  b46790:	a9b67bfd 	stp	x29, x30, [sp,#-160]!
  b46794:	910003fd 	mov	x29, sp
  b46798:	a90153f3 	stp	x19, x20, [sp,#16]
  b4679c:	aa0003f4 	mov	x20, x0
  b467a0:	f9400813 	ldr	x19, [x0,#16]
  b467a4:	a9025bf5 	stp	x21, x22, [sp,#32]
  b467a8:	aa0103f5 	mov	x21, x1
  b467ac:	12001c56 	and	w22, w2, #0xff
  b467b0:	b4000153 	cbz	x19, b467d8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bbc0>
  b467b4:	f9401a80 	ldr	x0, [x20,#48]
  b467b8:	b50009c0 	cbnz	x0, b468f0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bcd8>
  b467bc:	f9401e80 	ldr	x0, [x20,#56]
  b467c0:	b50014e0 	cbnz	x0, b46a5c <_ZSt20__throw_bad_weak_ptrv@@Base+0x23be44>
  b467c4:	12800000 	mov	w0, #0xffffffff            	// #-1
  b467c8:	a94153f3 	ldp	x19, x20, [sp,#16]
  b467cc:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b467d0:	a8ca7bfd 	ldp	x29, x30, [sp],#160
  b467d4:	d65f03c0 	ret
  b467d8:	f9400c00 	ldr	x0, [x0,#24]
  b467dc:	b4ffff40 	cbz	x0, b467c4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bbac>
  b467e0:	f0017fd3 	adrp	x19, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b467e4:	9123e273 	add	x19, x19, #0x8f8
  b467e8:	a90363f7 	stp	x23, x24, [sp,#48]
  b467ec:	08dffe60 	ldarb	w0, [x19]
  b467f0:	36001ac0 	tbz	w0, #0, b46b48 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bf30>
  b467f4:	f0017fd7 	adrp	x23, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b467f8:	912402f7 	add	x23, x23, #0x900
  b467fc:	b9801ae1 	ldrsw	x1, [x23,#24]
  b46800:	f9400e82 	ldr	x2, [x20,#24]
  b46804:	f94006e3 	ldr	x3, [x23,#8]
  b46808:	9ac10840 	udiv	x0, x2, x1
  b4680c:	9b018800 	msub	x0, x0, x1, x2
  b46810:	f860d860 	ldr	x0, [x3,w0,sxtw #3]
  b46814:	b5000080 	cbnz	x0, b46824 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bc0c>
  b46818:	14000059 	b	b4697c <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bd64>
  b4681c:	f9400800 	ldr	x0, [x0,#16]
  b46820:	b4000ae0 	cbz	x0, b4697c <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bd64>
  b46824:	f9400001 	ldr	x1, [x0]
  b46828:	eb01005f 	cmp	x2, x1
  b4682c:	54ffff81 	b.ne	b4681c <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bc04>
  b46830:	f9400417 	ldr	x23, [x0,#8]
  b46834:	b4000a57 	cbz	x23, b4697c <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bd64>
  b46838:	f0018018 	adrp	x24, 3b49000 <stdout@@GLIBC_2.17+0x7f40>
  b4683c:	91248318 	add	x24, x24, #0x920
  b46840:	08dfff00 	ldarb	w0, [x24]
  b46844:	36001b40 	tbz	w0, #0, b46bac <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bf94>
  b46848:	08dfff00 	ldarb	w0, [x24]
  b4684c:	36001e40 	tbz	w0, #0, b46c14 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bffc>
  b46850:	f0018001 	adrp	x1, 3b49000 <stdout@@GLIBC_2.17+0x7f40>
  b46854:	91254021 	add	x1, x1, #0x950
  b46858:	88dffc20 	ldar	w0, [x1]
  b4685c:	37f84100 	tbnz	w0, #31, b4707c <_ZSt20__throw_bad_weak_ptrv@@Base+0x23c464>
  b46860:	11000402 	add	w2, w0, #0x1
  b46864:	885ffc23 	ldaxr	w3, [x1]
  b46868:	6b00007f 	cmp	w3, w0
  b4686c:	54000061 	b.ne	b46878 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bc60>
  b46870:	8804fc22 	stlxr	w4, w2, [x1]
  b46874:	35ffff84 	cbnz	w4, b46864 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bc4c>
  b46878:	54ffff01 	b.ne	b46858 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bc40>
  b4687c:	f0018000 	adrp	x0, 3b49000 <stdout@@GLIBC_2.17+0x7f40>
  b46880:	9124a000 	add	x0, x0, #0x928
  b46884:	b9801802 	ldrsw	x2, [x0,#24]
  b46888:	f9400403 	ldr	x3, [x0,#8]
  b4688c:	9ac20ae0 	udiv	x0, x23, x2
  b46890:	9b02dc00 	msub	x0, x0, x2, x23
  b46894:	f860d873 	ldr	x19, [x3,w0,sxtw #3]
  b46898:	b5000093 	cbnz	x19, b468a8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bc90>
  b4689c:	14000007 	b	b468b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bca0>
  b468a0:	f9400a73 	ldr	x19, [x19,#16]
  b468a4:	b40000b3 	cbz	x19, b468b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bca0>
  b468a8:	f9400260 	ldr	x0, [x19]
  b468ac:	eb0002ff 	cmp	x23, x0
  b468b0:	54ffff81 	b.ne	b468a0 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bc88>
  b468b4:	f9400673 	ldr	x19, [x19,#8]
  b468b8:	88dffc20 	ldar	w0, [x1]
  b468bc:	7100001f 	cmp	w0, #0x0
  b468c0:	5400482d 	b.le	b471c4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23c5ac>
  b468c4:	51000402 	sub	w2, w0, #0x1
  b468c8:	885ffc23 	ldaxr	w3, [x1]
  b468cc:	6b00007f 	cmp	w3, w0
  b468d0:	54000061 	b.ne	b468dc <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bcc4>
  b468d4:	8804fc22 	stlxr	w4, w2, [x1]
  b468d8:	35ffff84 	cbnz	w4, b468c8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bcb0>
  b468dc:	54fffee1 	b.ne	b468b8 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bca0>
  b468e0:	a94363f7 	ldp	x23, x24, [sp,#48]
  b468e4:	f9000a93 	str	x19, [x20,#16]
  b468e8:	b4fff6f3 	cbz	x19, b467c4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bbac>
  b468ec:	17ffffb2 	b	b467b4 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23bb9c>
  b468f0:	3901dfff 	strb	wzr, [sp,#119]
  b468f4:	f9400263 	ldr	x3, [x19]
  b468f8:	aa1303e0 	mov	x0, x19
  b468fc:	aa1503e2 	mov	x2, x21
  b46900:	9101dfe1 	add	x1, sp, #0x77
  b46904:	f9404863 	ldr	x3, [x3,#144]
  b46908:	d63f0060 	blr	x3
  b4690c:	35000996 	cbnz	w22, b46a3c <_ZSt20__throw_bad_weak_ptrv@@Base+0x23be24>
