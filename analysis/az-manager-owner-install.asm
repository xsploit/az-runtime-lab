AZ EP147 instruction excerpt; addresses authoritative, nearest-symbol labels are not function names.
 21f6bc0:	aa1303f4 	mov	x20, x19
 21f6bc4:	b94c52c0 	ldr	w0, [x22,#3152]
 21f6bc8:	b9000a60 	str	w0, [x19,#8]
 21f6bcc:	d2800002 	mov	x2, #0x0                   	// #0
 21f6bd0:	b0006360 	adrp	x0, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 21f6bd4:	9105c000 	add	x0, x0, #0x170
 21f6bd8:	f8010680 	str	x0, [x20],#16
 21f6bdc:	aa1403e0 	mov	x0, x20
 21f6be0:	9404d568 	bl	232c180 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a4068>
 21f6be4:	91068276 	add	x22, x19, #0x1a0
 21f6be8:	d0006362 	adrp	x2, 2e64000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a11a8>
 21f6bec:	910b6042 	add	x2, x2, #0x2d8
 21f6bf0:	d0006360 	adrp	x0, 2e64000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a11a8>
 21f6bf4:	910c4000 	add	x0, x0, #0x310
 21f6bf8:	f9000262 	str	x2, [x19]
 21f6bfc:	f9000a60 	str	x0, [x19,#16]
 21f6c00:	12800003 	mov	w3, #0xffffffff            	// #-1
 21f6c04:	a919fe7f 	stp	xzr, xzr, [x19,#408]
 21f6c08:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
 21f6c0c:	d2800400 	mov	x0, #0x20                  	// #32
 21f6c10:	b9000adf 	str	wzr, [x22,#8]
 21f6c14:	b90012df 	str	wzr, [x22,#16]
 21f6c18:	3907427f 	strb	wzr, [x19,#464]
 21f6c1c:	3907467f 	strb	wzr, [x19,#465]
 21f6c20:	b901d663 	str	w3, [x19,#468]
 21f6c24:	f900de7f 	str	xzr, [x19,#440]
 21f6c28:	f94002a1 	ldr	x1, [x21]
 21f6c2c:	b901c27f 	str	wzr, [x19,#448]
 21f6c30:	b901ca7f 	str	wzr, [x19,#456]
 21f6c34:	f900ee62 	str	x2, [x19,#472]
 21f6c38:	f900f261 	str	x1, [x19,#480]
 21f6c3c:	9788b841 	bl	424d40 <_Znwm@plt>
 21f6c40:	aa0003f5 	mov	x21, x0
 21f6c44:	97ffed03 	bl	21f2050 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x69f38>
 21f6c48:	f940ce60 	ldr	x0, [x19,#408]
 21f6c4c:	eb0002bf 	cmp	x21, x0
 21f6c50:	54000060 	b.eq	21f6c5c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6eb44>
 21f6c54:	f900ce75 	str	x21, [x19,#408]
 21f6c58:	9400167a 	bl	21fc640 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74528>
 21f6c5c:	52800140 	mov	w0, #0xa                   	// #10
