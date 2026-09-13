 1e236d0: d0007be0     	adrp	x0, 0x2da1000
 1e236d4: 912f6021     	add	x1, x1, #0xbd8
 1e236d8: 91300000     	add	x0, x0, #0xc00
 1e236dc: a9090381     	stp	x1, x0, [x28, #0x90]
 1e236e0: b9409fe1     	ldr	w1, [sp, #0x9c]
 1e236e4: f9005395     	str	x21, [x28, #0xa0]
 1e236e8: fd005788     	str	d8, [x28, #0xa8]
 1e236ec: 7100003f     	cmp	w1, #0x0
 1e236f0: a9177e7f     	stp	xzr, xzr, [x19, #0x170]
 1e236f4: b901827f     	str	wzr, [x19, #0x180]
 1e236f8: 5400006d     	b.le	0x1e23704
 1e236fc: aa1303e0     	mov	x0, x19
 1e23700: 9415e6f8     	bl	0x239d2e0
 1e23704: 910343e1     	add	x1, sp, #0xd0
