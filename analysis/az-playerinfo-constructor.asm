
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002130c00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930d78>:
 2130c00:	910a0278 	add	x24, x19, #0x280
 2130c04:	d0006895 	adrp	x21, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130c08:	910ba2b5 	add	x21, x21, #0x2e8
 2130c0c:	91008274 	add	x20, x19, #0x20
 2130c10:	d0006881 	adrp	x1, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130c14:	d0006880 	adrp	x0, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130c18:	91082021 	add	x1, x1, #0x208
 2130c1c:	910b0000 	add	x0, x0, #0x2c0
 2130c20:	52802002 	mov	w2, #0x100                 	// #256
 2130c24:	a9000261 	stp	x1, x0, [x19]
 2130c28:	b9001263 	str	w3, [x19,#16]
 2130c2c:	b9001662 	str	w2, [x19,#20]
 2130c30:	7900327f 	strh	wzr, [x19,#24]
 2130c34:	f90043f4 	str	x20, [sp,#128]
 2130c38:	f9000295 	str	x21, [x20]
 2130c3c:	91008280 	add	x0, x20, #0x20
 2130c40:	3900229f 	strb	wzr, [x20,#8]
 2130c44:	3900329f 	strb	wzr, [x20,#12]
 2130c48:	9407ec36 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 2130c4c:	3901429f 	strb	wzr, [x20,#80]
 2130c50:	9101a280 	add	x0, x20, #0x68
 2130c54:	91026294 	add	x20, x20, #0x98
 2130c58:	9407ec32 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 2130c5c:	eb18029f 	cmp	x20, x24
 2130c60:	54fffec1 	b.ne	2130c38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930db0>
 2130c64:	52806014 	mov	w20, #0x300                 	// #768
 2130c68:	d0006896 	adrp	x22, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130c6c:	910e02d6 	add	x22, x22, #0x380
 2130c70:	f9014276 	str	x22, [x19,#640]
 2130c74:	79051274 	strh	w20, [x19,#648]
 2130c78:	910a4260 	add	x0, x19, #0x290
 2130c7c:	b9000f1f 	str	wzr, [x24,#12]
 2130c80:	5280003b 	mov	w27, #0x1                   	// #1
 2130c84:	52800055 	mov	w21, #0x2                   	// #2
 2130c88:	5280007c 	mov	w28, #0x3                   	// #3
 2130c8c:	9407ec25 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 2130c90:	f9016a7f 	str	xzr, [x19,#720]
 2130c94:	910b0263 	add	x3, x19, #0x2c0
 2130c98:	390b627f 	strb	wzr, [x19,#728]
 2130c9c:	f9017276 	str	x22, [x19,#736]
 2130ca0:	9111c262 	add	x2, x19, #0x470
 2130ca4:	7905d274 	strh	w20, [x19,#744]
 2130ca8:	91104261 	add	x1, x19, #0x410
 2130cac:	b902ee7b 	str	w27, [x19,#748]
 2130cb0:	910bc260 	add	x0, x19, #0x2f0
 2130cb4:	a9007c7f 	stp	xzr, xzr, [x3]
 2130cb8:	9115c263 	add	x3, x19, #0x570
 2130cbc:	b000d0ba 	adrp	x26, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 2130cc0:	a9090be1 	stp	x1, x2, [sp,#144]
 2130cc4:	91180357 	add	x23, x26, #0x600
 2130cc8:	f90057e3 	str	x3, [sp,#168]
 2130ccc:	9407ec15 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 2130cd0:	910c8267 	add	x7, x19, #0x320
 2130cd4:	91150264 	add	x4, x19, #0x540
 2130cd8:	9117c265 	add	x5, x19, #0x5f0
 2130cdc:	91170266 	add	x6, x19, #0x5c0
 2130ce0:	91100261 	add	x1, x19, #0x400
 2130ce4:	f9019a7f 	str	xzr, [x19,#816]
 2130ce8:	390ce27f 	strb	wzr, [x19,#824]
 2130cec:	910d4260 	add	x0, x19, #0x350
