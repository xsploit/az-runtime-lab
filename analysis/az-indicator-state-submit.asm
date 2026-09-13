
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000207a1e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87a360>:
 207a1e8:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 207a1ec:	b0006cc3 	adrp	x3, 2e13000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8501a8>
 207a1f0:	910003fd 	mov	x29, sp
 207a1f4:	a9025bf5 	stp	x21, x22, [sp,#32]
 207a1f8:	aa0103f6 	mov	x22, x1
 207a1fc:	f9473475 	ldr	x21, [x3,#3688]
 207a200:	a90153f3 	stp	x19, x20, [sp,#16]
 207a204:	aa0003f3 	mov	x19, x0
 207a208:	f9001bf7 	str	x23, [sp,#48]
 207a20c:	aa0203f4 	mov	x20, x2
 207a210:	91002017 	add	x23, x0, #0x8
 207a214:	b4000095 	cbz	x21, 207a224 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87a39c>
 207a218:	aa1703e0 	mov	x0, x23
 207a21c:	978eb35d 	bl	426f90 <pthread_mutex_lock@plt>
 207a220:	35000b20 	cbnz	w0, 207a384 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87a4fc>
 207a224:	b0006cc0 	adrp	x0, 2e13000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8501a8>
 207a228:	91398003 	add	x3, x0, #0xe60
 207a22c:	b94002c2 	ldr	w2, [x22]
 207a230:	795cc001 	ldrh	w1, [x0,#3680]
 207a234:	39400860 	ldrb	w0, [x3,#2]
 207a238:	b9003a62 	str	w2, [x19,#56]
 207a23c:	79007a61 	strh	w1, [x19,#60]
 207a240:	3900fa60 	strb	w0, [x19,#62]
 207a244:	f9403276 	ldr	x22, [x19,#96]
 207a248:	a9405280 	ldp	x0, x20, [x20]
 207a24c:	f9002e60 	str	x0, [x19,#88]
 207a250:	eb16029f 	cmp	x20, x22
 207a254:	54000260 	b.eq	207a2a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87a418>
 207a258:	b4000114 	cbz	x20, 207a278 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87a3f0>
 207a25c:	b40003b5 	cbz	x21, 207a2d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87a448>
 207a260:	91002280 	add	x0, x20, #0x8
 207a264:	885ffc01 	ldaxr	w1, [x0]
 207a268:	11000421 	add	w1, w1, #0x1
 207a26c:	8802fc01 	stlxr	w2, w1, [x0]
 207a270:	35ffffa2 	cbnz	w2, 207a264 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87a3dc>
 207a274:	f9403276 	ldr	x22, [x19,#96]
 207a278:	b4000136 	cbz	x22, 207a29c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87a414>
 207a27c:	b4000675 	cbz	x21, 207a348 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87a4c0>
