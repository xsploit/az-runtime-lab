
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000864950 <_ZNSt5mutex4lockEv@@Base+0x306a0>:
  864950:	f9400021 	ldr	x1, [x1]
  864954:	f9401003 	ldr	x3, [x0,#32]
  864958:	eb01007f 	cmp	x3, x1
  86495c:	54000040 	b.eq	864964 <_ZNSt5mutex4lockEv@@Base+0x306b4>
  864960:	d65f03c0 	ret
  864964:	b9406003 	ldr	w3, [x0,#96]
  864968:	b9400041 	ldr	w1, [x2]
  86496c:	6b01007f 	cmp	w3, w1
  864970:	54ffff80 	b.eq	864960 <_ZNSt5mutex4lockEv@@Base+0x306b0>
  864974:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
  864978:	910003fd 	mov	x29, sp
  86497c:	a90153f3 	stp	x19, x20, [sp,#16]
  864980:	aa0003f3 	mov	x19, x0
  864984:	b000ef40 	adrp	x0, 264d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a1a8>
  864988:	a9025bf5 	stp	x21, x22, [sp,#32]
  86498c:	aa0203f4 	mov	x20, x2
  864990:	9100c276 	add	x22, x19, #0x30
  864994:	f941e815 	ldr	x21, [x0,#976]
  864998:	b40000b5 	cbz	x21, 8649ac <_ZNSt5mutex4lockEv@@Base+0x306fc>
  86499c:	aa1603e0 	mov	x0, x22
  8649a0:	97ef097c 	bl	426f90 <pthread_mutex_lock@plt>
  8649a4:	35000280 	cbnz	w0, 8649f4 <_ZNSt5mutex4lockEv@@Base+0x30744>
  8649a8:	b9400281 	ldr	w1, [x20]
  8649ac:	b9006261 	str	w1, [x19,#96]
  8649b0:	b4000075 	cbz	x21, 8649bc <_ZNSt5mutex4lockEv@@Base+0x3070c>
  8649b4:	aa1603e0 	mov	x0, x22
  8649b8:	97ef0822 	bl	426a40 <pthread_mutex_unlock@plt>
  8649bc:	39419260 	ldrb	w0, [x19,#100]
  8649c0:	34000120 	cbz	w0, 8649e4 <_ZNSt5mutex4lockEv@@Base+0x30734>
  8649c4:	f9400e61 	ldr	x1, [x19,#24]
  8649c8:	a94153f3 	ldp	x19, x20, [sp,#16]
  8649cc:	aa0103e0 	mov	x0, x1
  8649d0:	f9400021 	ldr	x1, [x1]
  8649d4:	a9425bf5 	ldp	x21, x22, [sp,#32]
  8649d8:	a8c37bfd 	ldp	x29, x30, [sp],#48
  8649dc:	f9400821 	ldr	x1, [x1,#16]
  8649e0:	d61f0020 	br	x1
  8649e4:	a94153f3 	ldp	x19, x20, [sp,#16]
  8649e8:	a9425bf5 	ldp	x21, x22, [sp,#32]
  8649ec:	a8c37bfd 	ldp	x29, x30, [sp],#48
  8649f0:	d65f03c0 	ret
  8649f4:	97eeff8b 	bl	424820 <_ZSt20__throw_system_errori@plt>
  8649f8:	f9400021 	ldr	x1, [x1]
  8649fc:	f9401003 	ldr	x3, [x0,#32]
  864a00:	eb01007f 	cmp	x3, x1
  864a04:	54000040 	b.eq	864a0c <_ZNSt5mutex4lockEv@@Base+0x3075c>
  864a08:	d65f03c0 	ret
  864a0c:	b9406003 	ldr	w3, [x0,#96]
  864a10:	b9400041 	ldr	w1, [x2]
  864a14:	6b01007f 	cmp	w3, w1
  864a18:	54ffff80 	b.eq	864a08 <_ZNSt5mutex4lockEv@@Base+0x30758>
  864a1c:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
  864a20:	910003fd 	mov	x29, sp
  864a24:	a90153f3 	stp	x19, x20, [sp,#16]
  864a28:	aa0003f3 	mov	x19, x0
  864a2c:	b000ef40 	adrp	x0, 264d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a1a8>
  864a30:	a9025bf5 	stp	x21, x22, [sp,#32]
  864a34:	aa0203f4 	mov	x20, x2
  864a38:	9100c276 	add	x22, x19, #0x30
  864a3c:	f941e815 	ldr	x21, [x0,#976]
  864a40:	b40000b5 	cbz	x21, 864a54 <_ZNSt5mutex4lockEv@@Base+0x307a4>
  864a44:	aa1603e0 	mov	x0, x22
  864a48:	97ef0952 	bl	426f90 <pthread_mutex_lock@plt>
  864a4c:	35000280 	cbnz	w0, 864a9c <_ZNSt5mutex4lockEv@@Base+0x307ec>
  864a50:	b9400281 	ldr	w1, [x20]
  864a54:	b9006261 	str	w1, [x19,#96]
  864a58:	b4000075 	cbz	x21, 864a64 <_ZNSt5mutex4lockEv@@Base+0x307b4>
  864a5c:	aa1603e0 	mov	x0, x22
  864a60:	97ef07f8 	bl	426a40 <pthread_mutex_unlock@plt>
  864a64:	39419260 	ldrb	w0, [x19,#100]
  864a68:	34000120 	cbz	w0, 864a8c <_ZNSt5mutex4lockEv@@Base+0x307dc>
  864a6c:	f9400e61 	ldr	x1, [x19,#24]
  864a70:	a94153f3 	ldp	x19, x20, [sp,#16]
  864a74:	aa0103e0 	mov	x0, x1
  864a78:	f9400021 	ldr	x1, [x1]
  864a7c:	a9425bf5 	ldp	x21, x22, [sp,#32]
  864a80:	a8c37bfd 	ldp	x29, x30, [sp],#48
  864a84:	f9400821 	ldr	x1, [x1,#16]
  864a88:	d61f0020 	br	x1
  864a8c:	a94153f3 	ldp	x19, x20, [sp,#16]
  864a90:	a9425bf5 	ldp	x21, x22, [sp,#32]
  864a94:	a8c37bfd 	ldp	x29, x30, [sp],#48
  864a98:	d65f03c0 	ret
  864a9c:	97eeff61 	bl	424820 <_ZSt20__throw_system_errori@plt>
