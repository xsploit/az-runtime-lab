
runtime-lab/xdjaz/rootfs/usr/lib/libX11.so.6.3.0:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000028ed0 <XDrawImageString>:
   29a50:      	b.pl	0x29ab8 <XDrawImageString+0xbe8>
   29a54:      	ldr	w0, [x19, #0x18]
   29a58:      	cmp	w0, #0x1
   29a5c:      	b.ne	0x29a68 <XDrawImageString+0xb98>
   29a60:      	add	x0, sp, #0x58
   29a64:      	bl	0x291f8 <XDrawImageString+0x328>
   29a68:      	add	x3, sp, #0x58
   29a6c:      	mov	x0, #0x8                // =8
   29a70:      	mov	w2, #0x0                // =0
   29a74:      	mov	x1, #0x0                // =0
   29a78:      	str	xzr, [sp, #0x50]
   29a7c:      	sub	x0, x0, #0x1
   29a80:      	cmn	x0, #0x1
   29a84:      	b.ne	0x29ac8 <XDrawImageString+0xbf8>
   29a88:      	cbz	w2, 0x29a90 <XDrawImageString+0xbc0>
   29a8c:      	str	x1, [sp, #0x50]
   29a90:      	ldr	w0, [x19, #0x30]
   29a94:      	cmp	w0, #0x4
   29a98:      	b.ne	0x298e0 <XDrawImageString+0xa10>
   29a9c:      	ldr	x0, [sp, #0x50]
   29aa0:      	tst	x21, #0x1
   29aa4:      	and	x1, x0, #0xf
   29aa8:      	lsr	x0, x0, #4
   29aac:      	csel	x0, x0, x1, ne
   29ab0:      	str	x0, [sp, #0x50]
   29ab4:      	b	0x298e0 <XDrawImageString+0xa10>
   29ab8:      	ldrb	w4, [x20, x0]
   29abc:      	strb	w4, [x0, x3]
   29ac0:      	add	x0, x0, #0x1
   29ac4:      	b	0x29a4c <XDrawImageString+0xb7c>
   29ac8:      	ldrb	w2, [x0, x3]
   29acc:      	orr	x1, x2, x1, lsl #8
   29ad0:      	mov	w2, #0x1                // =1
   29ad4:      	b	0x29a7c <XDrawImageString+0xbac>
   29ad8:      	mov	x0, #0x0                // =0
   29adc:      	b	0x29908 <XDrawImageString+0xa38>

0000000000029ae0 <_XGetScanlinePad>:
   29ae0:      	ldr	w2, [x0, #0x60]
   29ae4:      	ldr	x3, [x0, #0x68]
   29ae8:      	add	w2, w2, #0x1
   29aec:      	subs	w2, w2, #0x1
   29af0:      	b.ne	0x29afc <_XGetScanlinePad+0x1c>
   29af4:      	ldr	w0, [x0, #0x58]
   29af8:      	b	0x29b0c <_XGetScanlinePad+0x2c>
   29afc:      	ldr	w4, [x3, #0x8]
   29b00:      	cmp	w4, w1
   29b04:      	b.ne	0x29b10 <_XGetScanlinePad+0x30>
   29b08:      	ldr	w0, [x3, #0x10]
   29b0c:      	ret
   29b10:      	add	x3, x3, #0x18
   29b14:      	b	0x29aec <_XGetScanlinePad+0xc>

0000000000029b18 <_XGetBitsPerPixel>:
   29b18:      	ldr	x2, [x0, #0x68]
   29b1c:      	ldr	w0, [x0, #0x60]
   29b20:      	add	w0, w0, #0x1
   29b24:      	subs	w0, w0, #0x1
   29b28:      	b.ne	0x29b50 <_XGetBitsPerPixel+0x38>
   29b2c:      	cmp	w1, #0x4
   29b30:      	b.le	0x29b6c <_XGetBitsPerPixel+0x54>
   29b34:      	cmp	w1, #0x8
   29b38:      	b.le	0x29b74 <_XGetBitsPerPixel+0x5c>
   29b3c:      	cmp	w1, #0x10
   29b40:      	mov	w0, #0x20               // =32
   29b44:      	mov	w1, #0x10               // =16
   29b48:      	csel	w0, w0, w1, gt
   29b4c:      	b	0x29b60 <_XGetBitsPerPixel+0x48>
   29b50:      	ldr	w3, [x2, #0x8]
   29b54:      	cmp	w3, w1
   29b58:      	b.ne	0x29b64 <_XGetBitsPerPixel+0x4c>
   29b5c:      	ldr	w0, [x2, #0xc]
   29b60:      	ret
   29b64:      	add	x2, x2, #0x18
   29b68:      	b	0x29b24 <_XGetBitsPerPixel+0xc>
   29b6c:      	mov	w0, #0x4                // =4
   29b70:      	b	0x29b60 <_XGetBitsPerPixel+0x48>
   29b74:      	mov	w0, #0x8                // =8
   29b78:      	b	0x29b60 <_XGetBitsPerPixel+0x48>

0000000000029b7c <_XInitImageFuncPtrs>:
   29b7c:      	adrp	x1, 0x128000
   29b80:      	ldr	w3, [x0, #0xc]
   29b84:      	ldr	x1, [x1, #0xfb8]
   29b88:      	str	x1, [x0, #0x58]
   29b8c:      	adrp	x1, 0x29000 <XDrawImageString+0x130>
   29b90:      	add	x1, x1, #0x1c0
   29b94:      	str	x1, [x0, #0x60]
   29b98:      	cmp	w3, #0x2
   29b9c:      	ldr	w1, [x0, #0x30]
   29ba0:      	b.ne	0x29be0 <_XInitImageFuncPtrs+0x64>
   29ba4:      	cmp	w1, #0x8
   29ba8:      	b.ne	0x29be0 <_XInitImageFuncPtrs+0x64>
   29bac:      	adrp	x1, 0x2a000 <_XInitImageFuncPtrs+0x484>
   29bb0:      	add	x1, x1, #0x20c
   29bb4:      	str	x1, [x0, #0x68]
   29bb8:      	adrp	x1, 0x2a000 <_XInitImageFuncPtrs+0x484>
   29bbc:      	add	x1, x1, #0x1a4
   29bc0:      	str	x1, [x0, #0x70]
   29bc4:      	adrp	x1, 0x29000 <XDrawImageString+0x130>
   29bc8:      	add	x1, x1, #0xc78
   29bcc:      	str	x1, [x0, #0x78]
   29bd0:      	adrp	x1, 0x29000 <XDrawImageString+0x130>
   29bd4:      	add	x1, x1, #0x274
   29bd8:      	str	x1, [x0, #0x80]
   29bdc:      	ret
   29be0:      	ldr	w2, [x0, #0x28]
   29be4:      	orr	w2, w1, w2
   29be8:      	cmp	w2, #0x1
   29bec:      	b.ne	0x29c18 <_XInitImageFuncPtrs+0x9c>
   29bf0:      	ldr	w4, [x0, #0x18]
   29bf4:      	ldr	w2, [x0, #0x20]
   29bf8:      	cmp	w4, w2
   29bfc:      	b.ne	0x29c18 <_XInitImageFuncPtrs+0x9c>
   29c00:      	adrp	x1, 0x2a000 <_XInitImageFuncPtrs+0x484>
   29c04:      	add	x1, x1, #0x108
   29c08:      	str	x1, [x0, #0x68]
   29c0c:      	adrp	x1, 0x2a000 <_XInitImageFuncPtrs+0x484>
   29c10:      	add	x1, x1, #0x50
   29c14:      	b	0x29bc0 <_XInitImageFuncPtrs+0x44>
   29c18:      	cmp	w3, #0x2
   29c1c:      	b.ne	0x29c60 <_XInitImageFuncPtrs+0xe4>
   29c20:      	cmp	w1, #0x20
   29c24:      	b.ne	0x29c40 <_XInitImageFuncPtrs+0xc4>
   29c28:      	adrp	x1, 0x29000 <XDrawImageString+0x130>
   29c2c:      	add	x1, x1, #0xfb0
   29c30:      	str	x1, [x0, #0x68]
   29c34:      	adrp	x1, 0x29000 <XDrawImageString+0x130>
   29c38:      	add	x1, x1, #0xf24
   29c3c:      	b	0x29bc0 <_XInitImageFuncPtrs+0x44>
   29c40:      	cmp	w1, #0x10
   29c44:      	b.ne	0x29c60 <_XInitImageFuncPtrs+0xe4>
   29c48:      	adrp	x1, 0x29000 <XDrawImageString+0x130>
   29c4c:      	add	x1, x1, #0xe88
   29c50:      	str	x1, [x0, #0x68]
   29c54:      	adrp	x1, 0x29000 <XDrawImageString+0x130>
   29c58:      	add	x1, x1, #0xe04
   29c5c:      	b	0x29bc0 <_XInitImageFuncPtrs+0x44>
   29c60:      	adrp	x1, 0x29000 <XDrawImageString+0x130>
   29c64:      	add	x1, x1, #0x818
   29c68:      	str	x1, [x0, #0x68]
   29c6c:      	adrp	x1, 0x29000 <XDrawImageString+0x130>
   29c70:      	add	x1, x1, #0x448
   29c74:      	b	0x29bc0 <_XInitImageFuncPtrs+0x44>
