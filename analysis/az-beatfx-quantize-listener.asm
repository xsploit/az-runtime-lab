
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000982050 <_ZSt20__throw_bad_weak_ptrv@@Base+0x77438>:
  982050:	a9b97bfd 	stp	x29, x30, [sp,#-112]!
  982054:	910003fd 	mov	x29, sp
  982058:	a90363f7 	stp	x23, x24, [sp,#48]
  98205c:	aa0003f8 	mov	x24, x0
  982060:	f9402c00 	ldr	x0, [x0,#88]
  982064:	b4000fe0 	cbz	x0, 982260 <_ZSt20__throw_bad_weak_ptrv@@Base+0x77648>
  982068:	f9400021 	ldr	x1, [x1]
  98206c:	f9401000 	ldr	x0, [x0,#32]
  982070:	eb01001f 	cmp	x0, x1
  982074:	54000640 	b.eq	98213c <_ZSt20__throw_bad_weak_ptrv@@Base+0x77524>
  982078:	a90153f3 	stp	x19, x20, [sp,#16]
  98207c:	910123f3 	add	x19, sp, #0x48
  982080:	aa1303e0 	mov	x0, x19
  982084:	f000e1e1 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
  982088:	9136a021 	add	x1, x1, #0xda8
  98208c:	9466c715 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  982090:	910143f4 	add	x20, sp, #0x50
  982094:	9000e881 	adrp	x1, 2692000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xcf1a8>
  982098:	9112e021 	add	x1, x1, #0x4b8
  98209c:	9104a021 	add	x1, x1, #0x128
  9820a0:	aa1303e0 	mov	x0, x19
  9820a4:	aa1403e8 	mov	x8, x20
  9820a8:	946646d2 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  9820ac:	a9025bf5 	stp	x21, x22, [sp,#32]
  9820b0:	910163f5 	add	x21, sp, #0x58
  9820b4:	b000f241 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
  9820b8:	aa1503e8 	mov	x8, x21
  9820bc:	91366021 	add	x1, x1, #0xd98
  9820c0:	aa1403e0 	mov	x0, x20
  9820c4:	946646cb 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
  9820c8:	910183f6 	add	x22, sp, #0x60
  9820cc:	b000e881 	adrp	x1, 2693000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0xd01a8>
  9820d0:	aa1603e0 	mov	x0, x22
  9820d4:	913e4021 	add	x1, x1, #0xf90
  9820d8:	9466c702 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
  9820dc:	9101a3f7 	add	x23, sp, #0x68
  9820e0:	aa1603e1 	mov	x1, x22
  9820e4:	aa1703e8 	mov	x8, x23
  9820e8:	aa1503e0 	mov	x0, x21
  9820ec:	94664669 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
  9820f0:	52800022 	mov	w2, #0x1                   	// #1
  9820f4:	52800001 	mov	w1, #0x0                   	// #0
  9820f8:	aa1703e0 	mov	x0, x23
  9820fc:	9461f8b9 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
