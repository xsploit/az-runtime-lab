
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

000b97c8 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)>:
   b97c8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   b97cc:	e3530001 	cmp	r3, #1
   b97d0:	e24dd034 	sub	sp, sp, #52	@ 0x34
   b97d4:	e1a04000 	mov	r4, r0
   b97d8:	e58d3014 	str	r3, [sp, #20]
   b97dc:	e58d1018 	str	r1, [sp, #24]
   b97e0:	e58d201c 	str	r2, [sp, #28]
   b97e4:	da000138 	ble	b9ccc <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x504>
   b97e8:	e3a0c001 	mov	ip, #1
   b97ec:	e58dc004 	str	ip, [sp, #4]
   b97f0:	e59fc514 	ldr	ip, [pc, #1300]	@ b9d0c <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x544>
   b97f4:	e3a06000 	mov	r6, #0
   b97f8:	e5909040 	ldr	r9, [r0, #64]	@ 0x40
   b97fc:	e1d034b4 	ldrh	r3, [r0, #68]	@ 0x44
   b9800:	e58dc00c 	str	ip, [sp, #12]
   b9804:	e28ccb05 	add	ip, ip, #5120	@ 0x1400
   b9808:	e58dc020 	str	ip, [sp, #32]
   b980c:	e59fc4fc 	ldr	ip, [pc, #1276]	@ b9d10 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x548>
   b9810:	e58d6008 	str	r6, [sp, #8]
   b9814:	e599b010 	ldr	fp, [r9, #16]
   b9818:	e590503c 	ldr	r5, [r0, #60]	@ 0x3c
   b981c:	e58dc024 	str	ip, [sp, #36]	@ 0x24
   b9820:	e590a038 	ldr	sl, [r0, #56]	@ 0x38
   b9824:	ea000009 	b	b9850 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x88>
   b9828:	e599b010 	ldr	fp, [r9, #16]
   b982c:	e1a03007 	mov	r3, r7
   b9830:	e59dc004 	ldr	ip, [sp, #4]
   b9834:	e59de014 	ldr	lr, [sp, #20]
   b9838:	e28cc001 	add	ip, ip, #1
   b983c:	e1dd22bc 	ldrh	r2, [sp, #44]	@ 0x2c
   b9840:	e15c000e 	cmp	ip, lr
   b9844:	e58dc004 	str	ip, [sp, #4]
   b9848:	e1c424b8 	strh	r2, [r4, #72]	@ 0x48
   b984c:	0a00008b 	beq	b9a80 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x2b8>
   b9850:	e1da71b0 	ldrh	r7, [sl, #16]
   b9854:	e6bf3073 	sxth	r3, r3
   b9858:	e1d581b0 	ldrh	r8, [r5, #16]
   b985c:	e6ffb07b 	uxth	fp, fp
   b9860:	e1cdb2bc 	strh	fp, [sp, #44]	@ 0x2c
   b9864:	e6bf2077 	sxth	r2, r7
   b9868:	e1520003 	cmp	r2, r3
   b986c:	e1cd82ba 	strh	r8, [sp, #42]	@ 0x2a
   b9870:	1a000002 	bne	b9880 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0xb8>
   b9874:	e1d424b6 	ldrh	r2, [r4, #70]	@ 0x46
   b9878:	e1580002 	cmp	r8, r2
   b987c:	0a00010d 	beq	b9cb8 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x4f0>
   b9880:	e59dc008 	ldr	ip, [sp, #8]
   b9884:	e0833103 	add	r3, r3, r3, lsl #2
   b9888:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   b988c:	e1a0518c 	lsl	r5, ip, #3
   b9890:	e08cc006 	add	ip, ip, r6
   b9894:	e58dc008 	str	ip, [sp, #8]
   b9898:	e59dc024 	ldr	ip, [sp, #36]	@ 0x24
   b989c:	e08c1103 	add	r1, ip, r3, lsl #2
   b98a0:	e5903000 	ldr	r3, [r0]
   b98a4:	e5933008 	ldr	r3, [r3, #8]
   b98a8:	e12fff33 	blx	r3
   b98ac:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   b98b0:	e1d414f6 	ldrsh	r1, [r4, #70]	@ 0x46
   b98b4:	e59dc00c 	ldr	ip, [sp, #12]
   b98b8:	e5903000 	ldr	r3, [r0]
   b98bc:	e0811101 	add	r1, r1, r1, lsl #2
   b98c0:	e5933008 	ldr	r3, [r3, #8]
   b98c4:	e08c1101 	add	r1, ip, r1, lsl #2
   b98c8:	e12fff33 	blx	r3
   b98cc:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   b98d0:	e1d414f8 	ldrsh	r1, [r4, #72]	@ 0x48
   b98d4:	e59dc020 	ldr	ip, [sp, #32]
   b98d8:	e5903000 	ldr	r3, [r0]
   b98dc:	e0811101 	add	r1, r1, r1, lsl #2
   b98e0:	e5933008 	ldr	r3, [r3, #8]
   b98e4:	e08c1101 	add	r1, ip, r1, lsl #2
   b98e8:	e12fff33 	blx	r3
   b98ec:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   b98f0:	e59dc018 	ldr	ip, [sp, #24]
   b98f4:	e1a03006 	mov	r3, r6
   b98f8:	e5942030 	ldr	r2, [r4, #48]	@ 0x30
   b98fc:	e08c1005 	add	r1, ip, r5
   b9900:	e590c000 	ldr	ip, [r0]
   b9904:	e0822005 	add	r2, r2, r5
   b9908:	e59cc014 	ldr	ip, [ip, #20]
   b990c:	e12fff3c 	blx	ip
   b9910:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   b9914:	e5941030 	ldr	r1, [r4, #48]	@ 0x30
   b9918:	e1a03006 	mov	r3, r6
   b991c:	e5942034 	ldr	r2, [r4, #52]	@ 0x34
   b9920:	e590c000 	ldr	ip, [r0]
   b9924:	e0811005 	add	r1, r1, r5
   b9928:	e0822005 	add	r2, r2, r5
   b992c:	e59cc014 	ldr	ip, [ip, #20]
   b9930:	e12fff3c 	blx	ip
   b9934:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   b9938:	e59dc01c 	ldr	ip, [sp, #28]
   b993c:	e1a03006 	mov	r3, r6
   b9940:	e5941034 	ldr	r1, [r4, #52]	@ 0x34
   b9944:	e3a06001 	mov	r6, #1
   b9948:	e08c2005 	add	r2, ip, r5
   b994c:	e590c000 	ldr	ip, [r0]
   b9950:	e0811005 	add	r1, r1, r5
   b9954:	e59cc014 	ldr	ip, [ip, #20]
   b9958:	e12fff3c 	blx	ip
   b995c:	e594a038 	ldr	sl, [r4, #56]	@ 0x38
   b9960:	e5949040 	ldr	r9, [r4, #64]	@ 0x40
   b9964:	e594503c 	ldr	r5, [r4, #60]	@ 0x3c
   b9968:	e5da3018 	ldrb	r3, [sl, #24]
   b996c:	e3530000 	cmp	r3, #0
   b9970:	1a000012 	bne	b99c0 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x1f8>
   b9974:	e59ab010 	ldr	fp, [sl, #16]
   b9978:	e59a200c 	ldr	r2, [sl, #12]
   b997c:	e152000b 	cmp	r2, fp
   b9980:	058a3014 	streq	r3, [sl, #20]
   b9984:	03a0e001 	moveq	lr, #1
   b9988:	05cae018 	strbeq	lr, [sl, #24]
   b998c:	0a00000b 	beq	b99c0 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x1f8>
   b9990:	e59a3014 	ldr	r3, [sl, #20]
   b9994:	e59a1008 	ldr	r1, [sl, #8]
   b9998:	e1a00003 	mov	r0, r3
   b999c:	e58d3000 	str	r3, [sp]
   b99a0:	ebfd55d8 	bl	f108 <__aeabi_idivmod@plt>
   b99a4:	e59d3000 	ldr	r3, [sp]
   b99a8:	e3510000 	cmp	r1, #0
   b99ac:	059a2000 	ldreq	r2, [sl]
   b99b0:	008b2002 	addeq	r2, fp, r2
   b99b4:	058a2010 	streq	r2, [sl, #16]
   b99b8:	e2833001 	add	r3, r3, #1
   b99bc:	e58a3014 	str	r3, [sl, #20]
   b99c0:	e5d53018 	ldrb	r3, [r5, #24]
   b99c4:	e58d5010 	str	r5, [sp, #16]
   b99c8:	e3530000 	cmp	r3, #0
   b99cc:	e1c474b4 	strh	r7, [r4, #68]	@ 0x44
   b99d0:	1a00000f 	bne	b9a14 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x24c>
   b99d4:	e595b010 	ldr	fp, [r5, #16]
   b99d8:	e595200c 	ldr	r2, [r5, #12]
   b99dc:	e152000b 	cmp	r2, fp
   b99e0:	0a0000af 	beq	b9ca4 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x4dc>
   b99e4:	e5953014 	ldr	r3, [r5, #20]
   b99e8:	e5951008 	ldr	r1, [r5, #8]
   b99ec:	e1a00003 	mov	r0, r3
   b99f0:	e58d3000 	str	r3, [sp]
   b99f4:	ebfd55c3 	bl	f108 <__aeabi_idivmod@plt>
   b99f8:	e59d3000 	ldr	r3, [sp]
   b99fc:	e3510000 	cmp	r1, #0
   b9a00:	05952000 	ldreq	r2, [r5]
   b9a04:	008b2002 	addeq	r2, fp, r2
   b9a08:	05852010 	streq	r2, [r5, #16]
   b9a0c:	e2833001 	add	r3, r3, #1
   b9a10:	e5853014 	str	r3, [r5, #20]
   b9a14:	e5d92018 	ldrb	r2, [r9, #24]
   b9a18:	e1c484b6 	strh	r8, [r4, #70]	@ 0x46
   b9a1c:	e3520000 	cmp	r2, #0
   b9a20:	1affff80 	bne	b9828 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x60>
   b9a24:	e599300c 	ldr	r3, [r9, #12]
   b9a28:	e599b010 	ldr	fp, [r9, #16]
   b9a2c:	e153000b 	cmp	r3, fp
   b9a30:	0a000095 	beq	b9c8c <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x4c4>
   b9a34:	e5998014 	ldr	r8, [r9, #20]
   b9a38:	e5991008 	ldr	r1, [r9, #8]
   b9a3c:	e1a00008 	mov	r0, r8
   b9a40:	ebfd55b0 	bl	f108 <__aeabi_idivmod@plt>
   b9a44:	e3510000 	cmp	r1, #0
   b9a48:	05993000 	ldreq	r3, [r9]
   b9a4c:	008bb003 	addeq	fp, fp, r3
   b9a50:	0589b010 	streq	fp, [r9, #16]
   b9a54:	e59dc004 	ldr	ip, [sp, #4]
   b9a58:	e2888001 	add	r8, r8, #1
   b9a5c:	e59de014 	ldr	lr, [sp, #20]
   b9a60:	e1a03007 	mov	r3, r7
   b9a64:	e28cc001 	add	ip, ip, #1
   b9a68:	e1dd22bc 	ldrh	r2, [sp, #44]	@ 0x2c
   b9a6c:	e15c000e 	cmp	ip, lr
   b9a70:	e5898014 	str	r8, [r9, #20]
   b9a74:	e58dc004 	str	ip, [sp, #4]
   b9a78:	e1c424b8 	strh	r2, [r4, #72]	@ 0x48
   b9a7c:	1affff73 	bne	b9850 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x88>
   b9a80:	e59dc008 	ldr	ip, [sp, #8]
   b9a84:	e2866001 	add	r6, r6, #1
   b9a88:	e59d2010 	ldr	r2, [sp, #16]
   b9a8c:	e59de024 	ldr	lr, [sp, #36]	@ 0x24
   b9a90:	e1a0518c 	lsl	r5, ip, #3
   b9a94:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   b9a98:	e6bf1073 	sxth	r1, r3
   b9a9c:	e592c010 	ldr	ip, [r2, #16]
   b9aa0:	e59a3010 	ldr	r3, [sl, #16]
   b9aa4:	e0811101 	add	r1, r1, r1, lsl #2
   b9aa8:	e5902000 	ldr	r2, [r0]
   b9aac:	e08e1101 	add	r1, lr, r1, lsl #2
   b9ab0:	e1cdc2ba 	strh	ip, [sp, #42]	@ 0x2a
   b9ab4:	e1cd32b8 	strh	r3, [sp, #40]	@ 0x28
   b9ab8:	e1cdb2bc 	strh	fp, [sp, #44]	@ 0x2c
   b9abc:	e5923008 	ldr	r3, [r2, #8]
   b9ac0:	e12fff33 	blx	r3
   b9ac4:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   b9ac8:	e1d434f6 	ldrsh	r3, [r4, #70]	@ 0x46
   b9acc:	e59dc00c 	ldr	ip, [sp, #12]
   b9ad0:	e5902000 	ldr	r2, [r0]
   b9ad4:	e0831103 	add	r1, r3, r3, lsl #2
   b9ad8:	e5923008 	ldr	r3, [r2, #8]
   b9adc:	e08c1101 	add	r1, ip, r1, lsl #2
   b9ae0:	e12fff33 	blx	r3
   b9ae4:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   b9ae8:	e1d434f8 	ldrsh	r3, [r4, #72]	@ 0x48
   b9aec:	e59dc020 	ldr	ip, [sp, #32]
   b9af0:	e5902000 	ldr	r2, [r0]
   b9af4:	e0831103 	add	r1, r3, r3, lsl #2
   b9af8:	e5923008 	ldr	r3, [r2, #8]
   b9afc:	e08c1101 	add	r1, ip, r1, lsl #2
   b9b00:	e12fff33 	blx	r3
   b9b04:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   b9b08:	e59dc018 	ldr	ip, [sp, #24]
   b9b0c:	e1a03006 	mov	r3, r6
   b9b10:	e5942030 	ldr	r2, [r4, #48]	@ 0x30
   b9b14:	e08c1005 	add	r1, ip, r5
   b9b18:	e590c000 	ldr	ip, [r0]
   b9b1c:	e0822005 	add	r2, r2, r5
   b9b20:	e59cc014 	ldr	ip, [ip, #20]
   b9b24:	e12fff3c 	blx	ip
   b9b28:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   b9b2c:	e5941030 	ldr	r1, [r4, #48]	@ 0x30
   b9b30:	e1a03006 	mov	r3, r6
   b9b34:	e5942034 	ldr	r2, [r4, #52]	@ 0x34
   b9b38:	e590c000 	ldr	ip, [r0]
   b9b3c:	e0811005 	add	r1, r1, r5
   b9b40:	e0822005 	add	r2, r2, r5
   b9b44:	e59cc014 	ldr	ip, [ip, #20]
   b9b48:	e12fff3c 	blx	ip
   b9b4c:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   b9b50:	e59dc01c 	ldr	ip, [sp, #28]
   b9b54:	e1a03006 	mov	r3, r6
   b9b58:	e5941034 	ldr	r1, [r4, #52]	@ 0x34
   b9b5c:	e08c2005 	add	r2, ip, r5
   b9b60:	e590c000 	ldr	ip, [r0]
   b9b64:	e0811005 	add	r1, r1, r5
   b9b68:	e59cc014 	ldr	ip, [ip, #20]
   b9b6c:	e12fff3c 	blx	ip
   b9b70:	e5945038 	ldr	r5, [r4, #56]	@ 0x38
   b9b74:	e5d53018 	ldrb	r3, [r5, #24]
   b9b78:	e3530000 	cmp	r3, #0
   b9b7c:	1a000010 	bne	b9bc4 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x3fc>
   b9b80:	e5956010 	ldr	r6, [r5, #16]
   b9b84:	e595200c 	ldr	r2, [r5, #12]
   b9b88:	e1520006 	cmp	r2, r6
   b9b8c:	05853014 	streq	r3, [r5, #20]
   b9b90:	03a03001 	moveq	r3, #1
   b9b94:	05c53018 	strbeq	r3, [r5, #24]
   b9b98:	0a000009 	beq	b9bc4 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x3fc>
   b9b9c:	e5957014 	ldr	r7, [r5, #20]
   b9ba0:	e5951008 	ldr	r1, [r5, #8]
   b9ba4:	e1a00007 	mov	r0, r7
   b9ba8:	ebfd5556 	bl	f108 <__aeabi_idivmod@plt>
   b9bac:	e3510000 	cmp	r1, #0
   b9bb0:	05953000 	ldreq	r3, [r5]
   b9bb4:	00866003 	addeq	r6, r6, r3
   b9bb8:	05856010 	streq	r6, [r5, #16]
   b9bbc:	e2877001 	add	r7, r7, #1
   b9bc0:	e5857014 	str	r7, [r5, #20]
   b9bc4:	e594503c 	ldr	r5, [r4, #60]	@ 0x3c
   b9bc8:	e1dd22b8 	ldrh	r2, [sp, #40]	@ 0x28
   b9bcc:	e5d53018 	ldrb	r3, [r5, #24]
   b9bd0:	e1c424b4 	strh	r2, [r4, #68]	@ 0x44
   b9bd4:	e3530000 	cmp	r3, #0
   b9bd8:	1a000010 	bne	b9c20 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x458>
   b9bdc:	e5956010 	ldr	r6, [r5, #16]
   b9be0:	e595200c 	ldr	r2, [r5, #12]
   b9be4:	e1520006 	cmp	r2, r6
   b9be8:	05853014 	streq	r3, [r5, #20]
   b9bec:	03a03001 	moveq	r3, #1
   b9bf0:	05c53018 	strbeq	r3, [r5, #24]
   b9bf4:	0a000009 	beq	b9c20 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x458>
   b9bf8:	e5957014 	ldr	r7, [r5, #20]
   b9bfc:	e5951008 	ldr	r1, [r5, #8]
   b9c00:	e1a00007 	mov	r0, r7
   b9c04:	ebfd553f 	bl	f108 <__aeabi_idivmod@plt>
   b9c08:	e3510000 	cmp	r1, #0
   b9c0c:	05953000 	ldreq	r3, [r5]
   b9c10:	00866003 	addeq	r6, r6, r3
   b9c14:	05856010 	streq	r6, [r5, #16]
   b9c18:	e2877001 	add	r7, r7, #1
   b9c1c:	e5857014 	str	r7, [r5, #20]
   b9c20:	e5945040 	ldr	r5, [r4, #64]	@ 0x40
   b9c24:	e1dd22ba 	ldrh	r2, [sp, #42]	@ 0x2a
   b9c28:	e5d53018 	ldrb	r3, [r5, #24]
   b9c2c:	e1c424b6 	strh	r2, [r4, #70]	@ 0x46
   b9c30:	e3530000 	cmp	r3, #0
   b9c34:	1a000010 	bne	b9c7c <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x4b4>
   b9c38:	e5956010 	ldr	r6, [r5, #16]
   b9c3c:	e595200c 	ldr	r2, [r5, #12]
   b9c40:	e1520006 	cmp	r2, r6
   b9c44:	05853014 	streq	r3, [r5, #20]
   b9c48:	03a03001 	moveq	r3, #1
   b9c4c:	05c53018 	strbeq	r3, [r5, #24]
   b9c50:	0a000009 	beq	b9c7c <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x4b4>
   b9c54:	e5957014 	ldr	r7, [r5, #20]
   b9c58:	e5951008 	ldr	r1, [r5, #8]
   b9c5c:	e1a00007 	mov	r0, r7
   b9c60:	e2877001 	add	r7, r7, #1
   b9c64:	ebfd5527 	bl	f108 <__aeabi_idivmod@plt>
   b9c68:	e5857014 	str	r7, [r5, #20]
   b9c6c:	e3510000 	cmp	r1, #0
   b9c70:	05953000 	ldreq	r3, [r5]
   b9c74:	00866003 	addeq	r6, r6, r3
   b9c78:	05856010 	streq	r6, [r5, #16]
   b9c7c:	e1dd32bc 	ldrh	r3, [sp, #44]	@ 0x2c
   b9c80:	e1c434b8 	strh	r3, [r4, #72]	@ 0x48
   b9c84:	e28dd034 	add	sp, sp, #52	@ 0x34
   b9c88:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
   b9c8c:	e1d434b4 	ldrh	r3, [r4, #68]	@ 0x44
   b9c90:	e3a01001 	mov	r1, #1
   b9c94:	e58d5010 	str	r5, [sp, #16]
   b9c98:	e5892014 	str	r2, [r9, #20]
   b9c9c:	e5c91018 	strb	r1, [r9, #24]
   b9ca0:	eafffee2 	b	b9830 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x68>
   b9ca4:	e3a00001 	mov	r0, #1
   b9ca8:	e1dd82ba 	ldrh	r8, [sp, #42]	@ 0x2a
   b9cac:	e5853014 	str	r3, [r5, #20]
   b9cb0:	e5c50018 	strb	r0, [r5, #24]
   b9cb4:	eaffff56 	b	b9a14 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x24c>
   b9cb8:	e1d424b8 	ldrh	r2, [r4, #72]	@ 0x48
   b9cbc:	e15b0002 	cmp	fp, r2
   b9cc0:	02866001 	addeq	r6, r6, #1
   b9cc4:	1afffeed 	bne	b9880 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0xb8>
   b9cc8:	eaffff26 	b	b9968 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x1a0>
   b9ccc:	e5902040 	ldr	r2, [r0, #64]	@ 0x40
   b9cd0:	e3a06001 	mov	r6, #1
   b9cd4:	e59fc030 	ldr	ip, [pc, #48]	@ b9d0c <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x544>
   b9cd8:	e3a05000 	mov	r5, #0
   b9cdc:	e1d034b4 	ldrh	r3, [r0, #68]	@ 0x44
   b9ce0:	e592b010 	ldr	fp, [r2, #16]
   b9ce4:	e58dc00c 	str	ip, [sp, #12]
   b9ce8:	e28ccb05 	add	ip, ip, #5120	@ 0x1400
   b9cec:	e590203c 	ldr	r2, [r0, #60]	@ 0x3c
   b9cf0:	e58dc020 	str	ip, [sp, #32]
   b9cf4:	e59fc014 	ldr	ip, [pc, #20]	@ b9d10 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x548>
   b9cf8:	e58d2010 	str	r2, [sp, #16]
   b9cfc:	e590a038 	ldr	sl, [r0, #56]	@ 0x38
   b9d00:	e58dc024 	str	ip, [sp, #36]	@ 0x24
   b9d04:	e1a0e00c 	mov	lr, ip
   b9d08:	eaffff61 	b	b9a94 <mixerengine::Equalizer::execute(common::Float2 const*, common::Float2*, int)+0x2cc>
   b9d0c:	00426a50 	.word	0x00426a50
   b9d10:	00425650 	.word	0x00425650

000b9d14 <mixerengine::Equalizer::assignReset()>:
   b9d14:	e92d4010 	push	{r4, lr}
   b9d18:	e1a04000 	mov	r4, r0
   b9d1c:	e5900024 	ldr	r0, [r0, #36]	@ 0x24
   b9d20:	e5903000 	ldr	r3, [r0]
   b9d24:	e5933018 	ldr	r3, [r3, #24]
   b9d28:	e12fff33 	blx	r3
   b9d2c:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   b9d30:	e5903000 	ldr	r3, [r0]
   b9d34:	e5933018 	ldr	r3, [r3, #24]
   b9d38:	e12fff33 	blx	r3
   b9d3c:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   b9d40:	e5903000 	ldr	r3, [r0]
   b9d44:	e5933018 	ldr	r3, [r3, #24]
   b9d48:	e12fff33 	blx	r3
   b9d4c:	e8bd8010 	pop	{r4, pc}

000b9d50 <mixerengine::Equalizer::getEqualizerDbValue(djengine::EnEqualizerBand) const>:
   b9d50:	eef67a00 	vmov.f32	s15, #96	@ 0x3f000000  0.5
   b9d54:	e0801101 	add	r1, r0, r1, lsl #2
   b9d58:	ed9f7a09 	vldr	s14, [pc, #36]	@ b9d84 <mixerengine::Equalizer::getEqualizerDbValue(djengine::EnEqualizerBand) const+0x34>
   b9d5c:	edd16a06 	vldr	s13, [r1, #24]
   b9d60:	e3093640 	movw	r3, #38464	@ 0x9640
   b9d64:	e3403042 	movt	r3, #66	@ 0x42
   b9d68:	ee467a87 	vmla.f32	s15, s13, s14
   b9d6c:	eefc7ae7 	vcvt.u32.f32	s15, s15
   b9d70:	ee172a90 	vmov	r2, s15
   b9d74:	e6ff2072 	uxth	r2, r2
   b9d78:	e0833102 	add	r3, r3, r2, lsl #2
   b9d7c:	e51303f0 	ldr	r0, [r3, #-1008]	@ 0xfffffc10
   b9d80:	e12fff1e 	bx	lr
   b9d84:	437f0000 	.word	0x437f0000

000b9d88 <mixerengine::Equalizer::volumeConvert(djengine::EnEqualizerBand, float)>:
   b9d88:	eef67a00 	vmov.f32	s15, #96	@ 0x3f000000  0.5
   b9d8c:	ee062a90 	vmov	s13, r2
   b9d90:	ed9f7a12 	vldr	s14, [pc, #72]	@ b9de0 <mixerengine::Equalizer::volumeConvert(djengine::EnEqualizerBand, float)+0x58>
   b9d94:	e281100e 	add	r1, r1, #14
   b9d98:	e7903101 	ldr	r3, [r0, r1, lsl #2]
   b9d9c:	e593100c 	ldr	r1, [r3, #12]
   b9da0:	ee467a87 	vmla.f32	s15, s13, s14
   b9da4:	eefc7ae7 	vcvt.u32.f32	s15, s15
   b9da8:	ee172a90 	vmov	r2, s15
   b9dac:	e6ff2072 	uxth	r2, r2
   b9db0:	e1520001 	cmp	r2, r1
   b9db4:	012fff1e 	bxeq	lr
   b9db8:	e5931010 	ldr	r1, [r3, #16]
   b9dbc:	e583200c 	str	r2, [r3, #12]
   b9dc0:	e1520001 	cmp	r2, r1
   b9dc4:	e5931004 	ldr	r1, [r3, #4]
   b9dc8:	e3a02000 	mov	r2, #0
   b9dcc:	e5832014 	str	r2, [r3, #20]
   b9dd0:	d2611000 	rsble	r1, r1, #0
   b9dd4:	e5c32018 	strb	r2, [r3, #24]
   b9dd8:	e5831000 	str	r1, [r3]
   b9ddc:	e12fff1e 	bx	lr
   b9de0:	437f0000 	.word	0x437f0000

000b9de4 <mixerengine::Equalizer::~Equalizer()>:
   b9de4:	e92d4010 	push	{r4, lr}
   b9de8:	e1a04000 	mov	r4, r0
   b9dec:	e5900024 	ldr	r0, [r0, #36]	@ 0x24
   b9df0:	e59f30c0 	ldr	r3, [pc, #192]	@ b9eb8 <mixerengine::Equalizer::~Equalizer()+0xd4>
   b9df4:	e3500000 	cmp	r0, #0
   b9df8:	e5843000 	str	r3, [r4]
   b9dfc:	0a000002 	beq	b9e0c <mixerengine::Equalizer::~Equalizer()+0x28>
   b9e00:	e5903000 	ldr	r3, [r0]
   b9e04:	e5933004 	ldr	r3, [r3, #4]
   b9e08:	e12fff33 	blx	r3
   b9e0c:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   b9e10:	e3500000 	cmp	r0, #0
   b9e14:	0a000000 	beq	b9e1c <mixerengine::Equalizer::~Equalizer()+0x38>
   b9e18:	ebfd53ac 	bl	ecd0 <operator delete(void*)@plt>
   b9e1c:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   b9e20:	e3500000 	cmp	r0, #0
   b9e24:	0a000002 	beq	b9e34 <mixerengine::Equalizer::~Equalizer()+0x50>
   b9e28:	e5903000 	ldr	r3, [r0]
   b9e2c:	e5933004 	ldr	r3, [r3, #4]
   b9e30:	e12fff33 	blx	r3
   b9e34:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   b9e38:	e3500000 	cmp	r0, #0
   b9e3c:	0a000000 	beq	b9e44 <mixerengine::Equalizer::~Equalizer()+0x60>
   b9e40:	ebfd53a2 	bl	ecd0 <operator delete(void*)@plt>
   b9e44:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   b9e48:	e3500000 	cmp	r0, #0
   b9e4c:	0a000002 	beq	b9e5c <mixerengine::Equalizer::~Equalizer()+0x78>
   b9e50:	e5903000 	ldr	r3, [r0]
   b9e54:	e5933004 	ldr	r3, [r3, #4]
   b9e58:	e12fff33 	blx	r3
   b9e5c:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   b9e60:	e3500000 	cmp	r0, #0
   b9e64:	0a000000 	beq	b9e6c <mixerengine::Equalizer::~Equalizer()+0x88>
   b9e68:	ebfd5398 	bl	ecd0 <operator delete(void*)@plt>
   b9e6c:	e5940030 	ldr	r0, [r4, #48]	@ 0x30
   b9e70:	e3500000 	cmp	r0, #0
   b9e74:	0a000002 	beq	b9e84 <mixerengine::Equalizer::~Equalizer()+0xa0>
   b9e78:	ebfd547b 	bl	f06c <operator delete[](void*)@plt>
   b9e7c:	e3a03000 	mov	r3, #0
   b9e80:	e5843030 	str	r3, [r4, #48]	@ 0x30
   b9e84:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   b9e88:	e3500000 	cmp	r0, #0
   b9e8c:	0a000002 	beq	b9e9c <mixerengine::Equalizer::~Equalizer()+0xb8>
   b9e90:	ebfd5475 	bl	f06c <operator delete[](void*)@plt>
   b9e94:	e3a03000 	mov	r3, #0
   b9e98:	e5843034 	str	r3, [r4, #52]	@ 0x34
   b9e9c:	e59f3018 	ldr	r3, [pc, #24]	@ b9ebc <mixerengine::Equalizer::~Equalizer()+0xd8>
   b9ea0:	e1a00004 	mov	r0, r4
   b9ea4:	e5843000 	str	r3, [r4]
   b9ea8:	e8bd8010 	pop	{r4, pc}
   b9eac:	e59f3008 	ldr	r3, [pc, #8]	@ b9ebc <mixerengine::Equalizer::~Equalizer()+0xd8>
   b9eb0:	e5843000 	str	r3, [r4]
   b9eb4:	ebfd5400 	bl	eebc <__cxa_end_cleanup@plt>
   b9eb8:	00429a58 	.word	0x00429a58
   b9ebc:	0041db60 	.word	0x0041db60

000b9ec0 <mixerengine::Equalizer::~Equalizer()>:
   b9ec0:	e92d4010 	push	{r4, lr}
   b9ec4:	e1a04000 	mov	r4, r0
   b9ec8:	e5900024 	ldr	r0, [r0, #36]	@ 0x24
   b9ecc:	e59f30c8 	ldr	r3, [pc, #200]	@ b9f9c <mixerengine::Equalizer::~Equalizer()+0xdc>
   b9ed0:	e3500000 	cmp	r0, #0
   b9ed4:	e5843000 	str	r3, [r4]
   b9ed8:	0a000002 	beq	b9ee8 <mixerengine::Equalizer::~Equalizer()+0x28>
   b9edc:	e5903000 	ldr	r3, [r0]
   b9ee0:	e5933004 	ldr	r3, [r3, #4]
   b9ee4:	e12fff33 	blx	r3
   b9ee8:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   b9eec:	e3500000 	cmp	r0, #0
   b9ef0:	0a000000 	beq	b9ef8 <mixerengine::Equalizer::~Equalizer()+0x38>
   b9ef4:	ebfd5375 	bl	ecd0 <operator delete(void*)@plt>
   b9ef8:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   b9efc:	e3500000 	cmp	r0, #0
   b9f00:	0a000002 	beq	b9f10 <mixerengine::Equalizer::~Equalizer()+0x50>
   b9f04:	e5903000 	ldr	r3, [r0]
   b9f08:	e5933004 	ldr	r3, [r3, #4]
   b9f0c:	e12fff33 	blx	r3
   b9f10:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   b9f14:	e3500000 	cmp	r0, #0
   b9f18:	0a000000 	beq	b9f20 <mixerengine::Equalizer::~Equalizer()+0x60>
   b9f1c:	ebfd536b 	bl	ecd0 <operator delete(void*)@plt>
   b9f20:	e594002c 	ldr	r0, [r4, #44]	@ 0x2c
   b9f24:	e3500000 	cmp	r0, #0
   b9f28:	0a000002 	beq	b9f38 <mixerengine::Equalizer::~Equalizer()+0x78>
   b9f2c:	e5903000 	ldr	r3, [r0]
   b9f30:	e5933004 	ldr	r3, [r3, #4]
   b9f34:	e12fff33 	blx	r3
   b9f38:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   b9f3c:	e3500000 	cmp	r0, #0
   b9f40:	0a000000 	beq	b9f48 <mixerengine::Equalizer::~Equalizer()+0x88>
   b9f44:	ebfd5361 	bl	ecd0 <operator delete(void*)@plt>
   b9f48:	e5940030 	ldr	r0, [r4, #48]	@ 0x30
   b9f4c:	e3500000 	cmp	r0, #0
   b9f50:	0a000002 	beq	b9f60 <mixerengine::Equalizer::~Equalizer()+0xa0>
   b9f54:	ebfd5444 	bl	f06c <operator delete[](void*)@plt>
   b9f58:	e3a03000 	mov	r3, #0
   b9f5c:	e5843030 	str	r3, [r4, #48]	@ 0x30
   b9f60:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   b9f64:	e3500000 	cmp	r0, #0
   b9f68:	0a000002 	beq	b9f78 <mixerengine::Equalizer::~Equalizer()+0xb8>
   b9f6c:	ebfd543e 	bl	f06c <operator delete[](void*)@plt>
   b9f70:	e3a03000 	mov	r3, #0
   b9f74:	e5843034 	str	r3, [r4, #52]	@ 0x34
   b9f78:	e59f3020 	ldr	r3, [pc, #32]	@ b9fa0 <mixerengine::Equalizer::~Equalizer()+0xe0>
   b9f7c:	e1a00004 	mov	r0, r4
   b9f80:	e5843000 	str	r3, [r4]
   b9f84:	ebfd5351 	bl	ecd0 <operator delete(void*)@plt>
   b9f88:	e1a00004 	mov	r0, r4
   b9f8c:	e8bd8010 	pop	{r4, pc}
   b9f90:	e59f3008 	ldr	r3, [pc, #8]	@ b9fa0 <mixerengine::Equalizer::~Equalizer()+0xe0>
   b9f94:	e5843000 	str	r3, [r4]
   b9f98:	ebfd53c7 	bl	eebc <__cxa_end_cleanup@plt>
   b9f9c:	00429a58 	.word	0x00429a58
   b9fa0:	0041db60 	.word	0x0041db60

000b9fa4 <mixerengine::Equalizer::initialize()>:
   b9fa4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   b9fa8:	ed2d8b02 	vpush	{d8}
   b9fac:	e1a04000 	mov	r4, r0
   b9fb0:	e5900030 	ldr	r0, [r0, #48]	@ 0x30
   b9fb4:	e3500000 	cmp	r0, #0
   b9fb8:	0a000002 	beq	b9fc8 <mixerengine::Equalizer::initialize()+0x24>
   b9fbc:	ebfd542a 	bl	f06c <operator delete[](void*)@plt>
   b9fc0:	e3a03000 	mov	r3, #0
   b9fc4:	e5843030 	str	r3, [r4, #48]	@ 0x30
   b9fc8:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   b9fcc:	e3500000 	cmp	r0, #0
   b9fd0:	0a000002 	beq	b9fe0 <mixerengine::Equalizer::initialize()+0x3c>
   b9fd4:	ebfd5424 	bl	f06c <operator delete[](void*)@plt>
   b9fd8:	e3a03000 	mov	r3, #0
   b9fdc:	e5843034 	str	r3, [r4, #52]	@ 0x34
   b9fe0:	e5945010 	ldr	r5, [r4, #16]
   b9fe4:	e3a06000 	mov	r6, #0
   b9fe8:	ed9f8b1c 	vldr	d8, [pc, #112]	@ ba060 <mixerengine::Equalizer::initialize()+0xbc>
   b9fec:	e2457001 	sub	r7, r5, #1
   b9ff0:	e1a08185 	lsl	r8, r5, #3
   b9ff4:	e1a00008 	mov	r0, r8
   b9ff8:	ebfd52aa 	bl	eaa8 <operator new[](unsigned int)@plt>
   b9ffc:	e3770001 	cmn	r7, #1
   ba000:	0a000005 	beq	ba01c <mixerengine::Equalizer::initialize()+0x78>
   ba004:	e1a02000 	mov	r2, r0
   ba008:	e1a03007 	mov	r3, r7
   ba00c:	e2433001 	sub	r3, r3, #1
   ba010:	eca28b02 	vstmia	r2!, {d8}
   ba014:	e3730001 	cmn	r3, #1
   ba018:	1afffffb 	bne	ba00c <mixerengine::Equalizer::initialize()+0x68>
   ba01c:	e3550000 	cmp	r5, #0
   ba020:	e5840030 	str	r0, [r4, #48]	@ 0x30
   ba024:	da000007 	ble	ba048 <mixerengine::Equalizer::initialize()+0xa4>
   ba028:	e3a03000 	mov	r3, #0
   ba02c:	ea000000 	b	ba034 <mixerengine::Equalizer::initialize()+0x90>
   ba030:	e5940030 	ldr	r0, [r4, #48]	@ 0x30
   ba034:	e0800183 	add	r0, r0, r3, lsl #3
   ba038:	e2833001 	add	r3, r3, #1
   ba03c:	e1530005 	cmp	r3, r5
   ba040:	ed808b00 	vstr	d8, [r0]
   ba044:	1afffff9 	bne	ba030 <mixerengine::Equalizer::initialize()+0x8c>
   ba048:	e2866001 	add	r6, r6, #1
   ba04c:	e2844004 	add	r4, r4, #4
   ba050:	e3560002 	cmp	r6, #2
   ba054:	1affffe6 	bne	b9ff4 <mixerengine::Equalizer::initialize()+0x50>
   ba058:	ecbd8b02 	vpop	{d8}
   ba05c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
	...

000ba068 <mixerengine::Equalizer::Equalizer()>:
   ba068:	e59f32b0 	ldr	r3, [pc, #688]	@ ba320 <mixerengine::Equalizer::Equalizer()+0x2b8>
   ba06c:	f2c00010 	vmov.i32	d16, #0	@ 0x00000000
   ba070:	e2802010 	add	r2, r0, #16
   ba074:	e59f12a8 	ldr	r1, [pc, #680]	@ ba324 <mixerengine::Equalizer::Equalizer()+0x2bc>
   ba078:	e92d4070 	push	{r4, r5, r6, lr}
   ba07c:	e24dd018 	sub	sp, sp, #24
   ba080:	e5933000 	ldr	r3, [r3]
   ba084:	ee073a10 	vmov	s14, r3
   ba088:	eef87a47 	vcvt.f32.u32	s15, s14
   ba08c:	e28d6004 	add	r6, sp, #4
   ba090:	f442078f 	vst1.32	{d16}, [r2]
   ba094:	e1a04000 	mov	r4, r0
   ba098:	e59f2288 	ldr	r2, [pc, #648]	@ ba328 <mixerengine::Equalizer::Equalizer()+0x2c0>
   ba09c:	e1a00006 	mov	r0, r6
   ba0a0:	e5843008 	str	r3, [r4, #8]
   ba0a4:	e884000c 	stm	r4, {r2, r3}
   ba0a8:	e3a0343f 	mov	r3, #1056964608	@ 0x3f000000
   ba0ac:	e5843018 	str	r3, [r4, #24]
   ba0b0:	eeb77a00 	vmov.f32	s14, #112	@ 0x3f800000  1.0
   ba0b4:	e584301c 	str	r3, [r4, #28]
   ba0b8:	e5843020 	str	r3, [r4, #32]
   ba0bc:	eec77a27 	vdiv.f32	s15, s14, s15
   ba0c0:	edc47a03 	vstr	s15, [r4, #12]
   ba0c4:	eb0bdc2f 	bl	3b1188 <juce::String::String(char const*)>
   ba0c8:	e59f125c 	ldr	r1, [pc, #604]	@ ba32c <mixerengine::Equalizer::Equalizer()+0x2c4>
   ba0cc:	e28d0008 	add	r0, sp, #8
   ba0d0:	eb0bdc2c 	bl	3b1188 <juce::String::String(char const*)>
   ba0d4:	e59f1254 	ldr	r1, [pc, #596]	@ ba330 <mixerengine::Equalizer::Equalizer()+0x2c8>
   ba0d8:	e28d000c 	add	r0, sp, #12
   ba0dc:	eb0bdc29 	bl	3b1188 <juce::String::String(char const*)>
   ba0e0:	e3a00048 	mov	r0, #72	@ 0x48
   ba0e4:	ebfd508f 	bl	e328 <operator new(unsigned int)@plt>
   ba0e8:	e1a05000 	mov	r5, r0
   ba0ec:	ebff84f7 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   ba0f0:	e1a01006 	mov	r1, r6
   ba0f4:	e5845024 	str	r5, [r4, #36]	@ 0x24
   ba0f8:	e28d0014 	add	r0, sp, #20
   ba0fc:	eb0bdbbd 	bl	3b0ff8 <juce::String::String(juce::String const&)>
   ba100:	e28d0010 	add	r0, sp, #16
   ba104:	e28d1014 	add	r1, sp, #20
   ba108:	e59f2224 	ldr	r2, [pc, #548]	@ ba334 <mixerengine::Equalizer::Equalizer()+0x2cc>
   ba10c:	eb0bdfc9 	bl	3b2038 <juce::operator+(juce::String, char const*)>
   ba110:	e3a0001c 	mov	r0, #28
   ba114:	ebfd5083 	bl	e328 <operator new(unsigned int)@plt>
   ba118:	e1a03000 	mov	r3, r0
   ba11c:	e3a02000 	mov	r2, #0
   ba120:	e3a01001 	mov	r1, #1
   ba124:	e5802000 	str	r2, [r0]
   ba128:	e5801004 	str	r1, [r0, #4]
   ba12c:	e3a0c00e 	mov	ip, #14
   ba130:	e580200c 	str	r2, [r0, #12]
   ba134:	e28d0010 	add	r0, sp, #16
   ba138:	e583c008 	str	ip, [r3, #8]
   ba13c:	e5832010 	str	r2, [r3, #16]
   ba140:	e5832014 	str	r2, [r3, #20]
   ba144:	e5c31018 	strb	r1, [r3, #24]
   ba148:	e5843038 	str	r3, [r4, #56]	@ 0x38
   ba14c:	eb0bdb07 	bl	3b0d70 <juce::String::~String()>
   ba150:	e28d0014 	add	r0, sp, #20
   ba154:	eb0bdb05 	bl	3b0d70 <juce::String::~String()>
   ba158:	e3a0307f 	mov	r3, #127	@ 0x7f
   ba15c:	e3a00048 	mov	r0, #72	@ 0x48
   ba160:	e1c434b4 	strh	r3, [r4, #68]	@ 0x44
   ba164:	ebfd506f 	bl	e328 <operator new(unsigned int)@plt>
   ba168:	e1a05000 	mov	r5, r0
   ba16c:	ebff84d7 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   ba170:	e28d1008 	add	r1, sp, #8
   ba174:	e5845028 	str	r5, [r4, #40]	@ 0x28
   ba178:	e28d0014 	add	r0, sp, #20
   ba17c:	eb0bdb9d 	bl	3b0ff8 <juce::String::String(juce::String const&)>
   ba180:	e28d0010 	add	r0, sp, #16
   ba184:	e28d1014 	add	r1, sp, #20
   ba188:	e59f21a4 	ldr	r2, [pc, #420]	@ ba334 <mixerengine::Equalizer::Equalizer()+0x2cc>
   ba18c:	eb0bdfa9 	bl	3b2038 <juce::operator+(juce::String, char const*)>
   ba190:	e3a0001c 	mov	r0, #28
   ba194:	ebfd5063 	bl	e328 <operator new(unsigned int)@plt>
   ba198:	e1a03000 	mov	r3, r0
   ba19c:	e3a02000 	mov	r2, #0
   ba1a0:	e3a01001 	mov	r1, #1
   ba1a4:	e5802000 	str	r2, [r0]
   ba1a8:	e5801004 	str	r1, [r0, #4]
   ba1ac:	e3a0c00e 	mov	ip, #14
   ba1b0:	e580200c 	str	r2, [r0, #12]
   ba1b4:	e28d0010 	add	r0, sp, #16
   ba1b8:	e583c008 	str	ip, [r3, #8]
   ba1bc:	e5832010 	str	r2, [r3, #16]
   ba1c0:	e5832014 	str	r2, [r3, #20]
   ba1c4:	e5c31018 	strb	r1, [r3, #24]
   ba1c8:	e584303c 	str	r3, [r4, #60]	@ 0x3c
   ba1cc:	eb0bdae7 	bl	3b0d70 <juce::String::~String()>
   ba1d0:	e28d0014 	add	r0, sp, #20
   ba1d4:	eb0bdae5 	bl	3b0d70 <juce::String::~String()>
   ba1d8:	e3a0307f 	mov	r3, #127	@ 0x7f
   ba1dc:	e3a00048 	mov	r0, #72	@ 0x48
   ba1e0:	e1c434b6 	strh	r3, [r4, #70]	@ 0x46
   ba1e4:	ebfd504f 	bl	e328 <operator new(unsigned int)@plt>
   ba1e8:	e1a05000 	mov	r5, r0
   ba1ec:	ebff84b7 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   ba1f0:	e28d100c 	add	r1, sp, #12
   ba1f4:	e584502c 	str	r5, [r4, #44]	@ 0x2c
   ba1f8:	e28d0014 	add	r0, sp, #20
   ba1fc:	eb0bdb7d 	bl	3b0ff8 <juce::String::String(juce::String const&)>
   ba200:	e28d0010 	add	r0, sp, #16
   ba204:	e28d1014 	add	r1, sp, #20
   ba208:	e59f2124 	ldr	r2, [pc, #292]	@ ba334 <mixerengine::Equalizer::Equalizer()+0x2cc>
   ba20c:	eb0bdf89 	bl	3b2038 <juce::operator+(juce::String, char const*)>
   ba210:	e3a0001c 	mov	r0, #28
   ba214:	ebfd5043 	bl	e328 <operator new(unsigned int)@plt>
   ba218:	e1a03000 	mov	r3, r0
   ba21c:	eddf0b3b 	vldr	d16, [pc, #236]	@ ba310 <mixerengine::Equalizer::Equalizer()+0x2a8>
   ba220:	e3a02001 	mov	r2, #1
   ba224:	f440078f 	vst1.32	{d16}, [r0]
   ba228:	e5c32018 	strb	r2, [r3, #24]
   ba22c:	e2832008 	add	r2, r3, #8
   ba230:	eddf0b38 	vldr	d16, [pc, #224]	@ ba318 <mixerengine::Equalizer::Equalizer()+0x2b0>
   ba234:	e28d0010 	add	r0, sp, #16
   ba238:	f442078f 	vst1.32	{d16}, [r2]
   ba23c:	f2c00010 	vmov.i32	d16, #0	@ 0x00000000
   ba240:	e2832010 	add	r2, r3, #16
   ba244:	f442078f 	vst1.32	{d16}, [r2]
   ba248:	e5843040 	str	r3, [r4, #64]	@ 0x40
   ba24c:	eb0bdac7 	bl	3b0d70 <juce::String::~String()>
   ba250:	e28d0014 	add	r0, sp, #20
   ba254:	eb0bdac5 	bl	3b0d70 <juce::String::~String()>
   ba258:	e3a03000 	mov	r3, #0
   ba25c:	e3a0207f 	mov	r2, #127	@ 0x7f
   ba260:	e5843030 	str	r3, [r4, #48]	@ 0x30
   ba264:	e1c424b8 	strh	r2, [r4, #72]	@ 0x48
   ba268:	e28d000c 	add	r0, sp, #12
   ba26c:	e5843034 	str	r3, [r4, #52]	@ 0x34
   ba270:	eb0bdabe 	bl	3b0d70 <juce::String::~String()>
   ba274:	e28d0008 	add	r0, sp, #8
   ba278:	eb0bdabc 	bl	3b0d70 <juce::String::~String()>
   ba27c:	e1a00006 	mov	r0, r6
   ba280:	eb0bdaba 	bl	3b0d70 <juce::String::~String()>
   ba284:	e1a00004 	mov	r0, r4
   ba288:	e28dd018 	add	sp, sp, #24
   ba28c:	e8bd8070 	pop	{r4, r5, r6, pc}
   ba290:	e3a03002 	mov	r3, #2
   ba294:	e2633002 	rsb	r3, r3, #2
   ba298:	e0865103 	add	r5, r6, r3, lsl #2
   ba29c:	e1550006 	cmp	r5, r6
   ba2a0:	0a00000d 	beq	ba2dc <mixerengine::Equalizer::Equalizer()+0x274>
   ba2a4:	e2455004 	sub	r5, r5, #4
   ba2a8:	e1a00005 	mov	r0, r5
   ba2ac:	eb0bdaaf 	bl	3b0d70 <juce::String::~String()>
   ba2b0:	eafffff9 	b	ba29c <mixerengine::Equalizer::Equalizer()+0x234>
   ba2b4:	e28d0010 	add	r0, sp, #16
   ba2b8:	eb0bdaac 	bl	3b0d70 <juce::String::~String()>
   ba2bc:	e28d0014 	add	r0, sp, #20
   ba2c0:	eb0bdaaa 	bl	3b0d70 <juce::String::~String()>
   ba2c4:	e2860008 	add	r0, r6, #8
   ba2c8:	eb0bdaa8 	bl	3b0d70 <juce::String::~String()>
   ba2cc:	e2860004 	add	r0, r6, #4
   ba2d0:	eb0bdaa6 	bl	3b0d70 <juce::String::~String()>
   ba2d4:	e1a00006 	mov	r0, r6
   ba2d8:	eb0bdaa4 	bl	3b0d70 <juce::String::~String()>
   ba2dc:	e59f3054 	ldr	r3, [pc, #84]	@ ba338 <mixerengine::Equalizer::Equalizer()+0x2d0>
   ba2e0:	e5843000 	str	r3, [r4]
   ba2e4:	ebfd52f4 	bl	eebc <__cxa_end_cleanup@plt>
   ba2e8:	eafffff3 	b	ba2bc <mixerengine::Equalizer::Equalizer()+0x254>
   ba2ec:	e1a00005 	mov	r0, r5
   ba2f0:	ebfd5276 	bl	ecd0 <operator delete(void*)@plt>
   ba2f4:	eafffff2 	b	ba2c4 <mixerengine::Equalizer::Equalizer()+0x25c>
   ba2f8:	eafffff1 	b	ba2c4 <mixerengine::Equalizer::Equalizer()+0x25c>
   ba2fc:	e3a03000 	mov	r3, #0
   ba300:	eaffffe3 	b	ba294 <mixerengine::Equalizer::Equalizer()+0x22c>
   ba304:	e3a03001 	mov	r3, #1
   ba308:	eaffffe1 	b	ba294 <mixerengine::Equalizer::Equalizer()+0x22c>
   ba30c:	e320f000 	nop	{0}
   ba310:	00000000 	.word	0x00000000
   ba314:	00000001 	.word	0x00000001
   ba318:	0000000e 	.word	0x0000000e
   ba31c:	00000000 	.word	0x00000000
   ba320:	004172c0 	.word	0x004172c0
   ba324:	00429aa8 	.word	0x00429aa8
   ba328:	00429a58 	.word	0x00429a58
   ba32c:	00429ab4 	.word	0x00429ab4
   ba330:	00429ac0 	.word	0x00429ac0
   ba334:	0041a040 	.word	0x0041a040
   ba338:	0041db60 	.word	0x0041db60

000ba33c <mixerengine::Equalizer::initResources(int)>:
   ba33c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   ba340:	ed2d8b02 	vpush	{d8}
   ba344:	e2417001 	sub	r7, r1, #1
   ba348:	ed9f8b1e 	vldr	d8, [pc, #120]	@ ba3c8 <mixerengine::Equalizer::initResources(int)+0x8c>
   ba34c:	e1a08181 	lsl	r8, r1, #3
   ba350:	e1a05001 	mov	r5, r1
   ba354:	e1a04000 	mov	r4, r0
   ba358:	e3a06000 	mov	r6, #0
   ba35c:	e1a00008 	mov	r0, r8
   ba360:	ebfd51d0 	bl	eaa8 <operator new[](unsigned int)@plt>
   ba364:	e3770001 	cmn	r7, #1
   ba368:	0a000005 	beq	ba384 <mixerengine::Equalizer::initResources(int)+0x48>
   ba36c:	e1a02000 	mov	r2, r0
   ba370:	e1a03007 	mov	r3, r7
   ba374:	e2433001 	sub	r3, r3, #1
   ba378:	eca28b02 	vstmia	r2!, {d8}
   ba37c:	e3730001 	cmn	r3, #1
   ba380:	1afffffb 	bne	ba374 <mixerengine::Equalizer::initResources(int)+0x38>
   ba384:	e3550000 	cmp	r5, #0
   ba388:	e5840030 	str	r0, [r4, #48]	@ 0x30
   ba38c:	da000007 	ble	ba3b0 <mixerengine::Equalizer::initResources(int)+0x74>
   ba390:	e3a03000 	mov	r3, #0
   ba394:	ea000000 	b	ba39c <mixerengine::Equalizer::initResources(int)+0x60>
   ba398:	e5940030 	ldr	r0, [r4, #48]	@ 0x30
   ba39c:	e0800183 	add	r0, r0, r3, lsl #3
   ba3a0:	e2833001 	add	r3, r3, #1
   ba3a4:	e1530005 	cmp	r3, r5
   ba3a8:	ed808b00 	vstr	d8, [r0]
   ba3ac:	1afffff9 	bne	ba398 <mixerengine::Equalizer::initResources(int)+0x5c>
   ba3b0:	e2866001 	add	r6, r6, #1
   ba3b4:	e2844004 	add	r4, r4, #4
   ba3b8:	e3560002 	cmp	r6, #2
   ba3bc:	1affffe6 	bne	ba35c <mixerengine::Equalizer::initResources(int)+0x20>
   ba3c0:	ecbd8b02 	vpop	{d8}
   ba3c4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
	...

000ba3d0 <mixerengine::Equalizer::finResources()>:
   ba3d0:	e92d4010 	push	{r4, lr}
   ba3d4:	e1a04000 	mov	r4, r0
   ba3d8:	e5900030 	ldr	r0, [r0, #48]	@ 0x30
   ba3dc:	e3500000 	cmp	r0, #0
   ba3e0:	0a000002 	beq	ba3f0 <mixerengine::Equalizer::finResources()+0x20>
   ba3e4:	ebfd5320 	bl	f06c <operator delete[](void*)@plt>
   ba3e8:	e3a03000 	mov	r3, #0
   ba3ec:	e5843030 	str	r3, [r4, #48]	@ 0x30
   ba3f0:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   ba3f4:	e3500000 	cmp	r0, #0
   ba3f8:	08bd8010 	popeq	{r4, pc}
   ba3fc:	ebfd531a 	bl	f06c <operator delete[](void*)@plt>
   ba400:	e3a03000 	mov	r3, #0
   ba404:	e5843034 	str	r3, [r4, #52]	@ 0x34
   ba408:	e8bd8010 	pop	{r4, pc}
   ba40c:	e320f000 	nop	{0}

000ba410 <mixerengine::AbstractEqualizer::~AbstractEqualizer()>:
   ba410:	e59f3004 	ldr	r3, [pc, #4]	@ ba41c <mixerengine::AbstractEqualizer::~AbstractEqualizer()+0xc>
   ba414:	e5803000 	str	r3, [r0]
   ba418:	e12fff1e 	bx	lr
   ba41c:	0041db60 	.word	0x0041db60

000ba420 <mixerengine::AbstractEqualizer::adjustParameter(mixerengine::EnEffectParameter, float)>:
   ba420:	e12fff1e 	bx	lr

000ba424 <mixerengine::AbstractEqualizer::getEqualizerDbValue(djengine::EnEqualizerBand) const>:
   ba424:	e3a00000 	mov	r0, #0
   ba428:	e12fff1e 	bx	lr

000ba42c <mixerengine::AbstractEqualizer::volumeConvert(djengine::EnEqualizerBand, float)>:
   ba42c:	e12fff1e 	bx	lr

000ba430 <mixerengine::AbstractEqualizer::~AbstractEqualizer()>:
   ba430:	e59f3014 	ldr	r3, [pc, #20]	@ ba44c <mixerengine::AbstractEqualizer::~AbstractEqualizer()+0x1c>
   ba434:	e92d4010 	push	{r4, lr}
   ba438:	e1a04000 	mov	r4, r0
   ba43c:	e5803000 	str	r3, [r0]
   ba440:	ebfd5222 	bl	ecd0 <operator delete(void*)@plt>
   ba444:	e1a00004 	mov	r0, r4
   ba448:	e8bd8010 	pop	{r4, pc}
   ba44c:	0041db60 	.word	0x0041db60

000ba450 <mixerengine::Isolator::assignReset()>:
   ba450:	e92d4010 	push	{r4, lr}
   ba454:	e1a04000 	mov	r4, r0
   ba458:	e5900034 	ldr	r0, [r0, #52]	@ 0x34
   ba45c:	e5903000 	ldr	r3, [r0]
   ba460:	e5933018 	ldr	r3, [r3, #24]
   ba464:	e12fff33 	blx	r3
   ba468:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   ba46c:	e5903000 	ldr	r3, [r0]
   ba470:	e5933018 	ldr	r3, [r3, #24]
   ba474:	e12fff33 	blx	r3
   ba478:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   ba47c:	e5903000 	ldr	r3, [r0]
   ba480:	e5933018 	ldr	r3, [r3, #24]
   ba484:	e12fff33 	blx	r3
   ba488:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   ba48c:	e5903000 	ldr	r3, [r0]
   ba490:	e5933018 	ldr	r3, [r3, #24]
   ba494:	e12fff33 	blx	r3
   ba498:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   ba49c:	e5903000 	ldr	r3, [r0]
   ba4a0:	e5933018 	ldr	r3, [r3, #24]
   ba4a4:	e12fff33 	blx	r3
   ba4a8:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   ba4ac:	e5903000 	ldr	r3, [r0]
   ba4b0:	e5933018 	ldr	r3, [r3, #24]
   ba4b4:	e12fff33 	blx	r3
   ba4b8:	e5940048 	ldr	r0, [r4, #72]	@ 0x48
   ba4bc:	e5903000 	ldr	r3, [r0]
   ba4c0:	e5933018 	ldr	r3, [r3, #24]
   ba4c4:	e12fff33 	blx	r3
   ba4c8:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   ba4cc:	e5903000 	ldr	r3, [r0]
   ba4d0:	e5933018 	ldr	r3, [r3, #24]
   ba4d4:	e12fff33 	blx	r3
   ba4d8:	e8bd8010 	pop	{r4, pc}

000ba4dc <mixerengine::Isolator::getEqualizerDbValue(djengine::EnEqualizerBand) const>:
   ba4dc:	eef67a00 	vmov.f32	s15, #96	@ 0x3f000000  0.5
   ba4e0:	e0801101 	add	r1, r0, r1, lsl #2
   ba4e4:	ed9f7a0a 	vldr	s14, [pc, #40]	@ ba514 <mixerengine::Isolator::getEqualizerDbValue(djengine::EnEqualizerBand) const+0x38>
   ba4e8:	edd16a06 	vldr	s13, [r1, #24]
   ba4ec:	e3093ad0 	movw	r3, #39632	@ 0x9ad0
   ba4f0:	e3403042 	movt	r3, #66	@ 0x42
   ba4f4:	ee467a87 	vmla.f32	s15, s13, s14
   ba4f8:	eefc7ae7 	vcvt.u32.f32	s15, s15
   ba4fc:	ee172a90 	vmov	r2, s15
   ba500:	e6ff2072 	uxth	r2, r2
   ba504:	e2822c01 	add	r2, r2, #256	@ 0x100
   ba508:	e0833102 	add	r3, r3, r2, lsl #2
   ba50c:	e5930000 	ldr	r0, [r3]
   ba510:	e12fff1e 	bx	lr
   ba514:	437f0000 	.word	0x437f0000

000ba518 <mixerengine::Isolator::execute(common::Float2 const*, common::Float2*, int)>:
   ba518:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
   ba51c:	e1a04000 	mov	r4, r0
   ba520:	e5900024 	ldr	r0, [r0, #36]	@ 0x24
   ba524:	e1a07002 	mov	r7, r2
   ba528:	e5942054 	ldr	r2, [r4, #84]	@ 0x54
   ba52c:	e1a05003 	mov	r5, r3
   ba530:	e1a06001 	mov	r6, r1
   ba534:	e590c000 	ldr	ip, [r0]
   ba538:	e59cc014 	ldr	ip, [ip, #20]
   ba53c:	e12fff3c 	blx	ip
   ba540:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   ba544:	e5941054 	ldr	r1, [r4, #84]	@ 0x54
   ba548:	e1a03005 	mov	r3, r5
   ba54c:	e594205c 	ldr	r2, [r4, #92]	@ 0x5c
   ba550:	e590c000 	ldr	ip, [r0]
   ba554:	e59cc014 	ldr	ip, [ip, #20]
   ba558:	e12fff3c 	blx	ip
   ba55c:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   ba560:	e1a01006 	mov	r1, r6
   ba564:	e5942054 	ldr	r2, [r4, #84]	@ 0x54
   ba568:	e1a03005 	mov	r3, r5
   ba56c:	e590c000 	ldr	ip, [r0]
   ba570:	e59cc014 	ldr	ip, [ip, #20]
   ba574:	e12fff3c 	blx	ip
   ba578:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   ba57c:	e5941054 	ldr	r1, [r4, #84]	@ 0x54
   ba580:	e1a03005 	mov	r3, r5
   ba584:	e5942058 	ldr	r2, [r4, #88]	@ 0x58
   ba588:	e590c000 	ldr	ip, [r0]
   ba58c:	e59cc014 	ldr	ip, [ip, #20]
   ba590:	e12fff3c 	blx	ip
   ba594:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   ba598:	e5941058 	ldr	r1, [r4, #88]	@ 0x58
   ba59c:	e1a03005 	mov	r3, r5
   ba5a0:	e5942054 	ldr	r2, [r4, #84]	@ 0x54
   ba5a4:	e590c000 	ldr	ip, [r0]
   ba5a8:	e59cc014 	ldr	ip, [ip, #20]
   ba5ac:	e12fff3c 	blx	ip
   ba5b0:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   ba5b4:	e5941054 	ldr	r1, [r4, #84]	@ 0x54
   ba5b8:	e1a03005 	mov	r3, r5
   ba5bc:	e5942060 	ldr	r2, [r4, #96]	@ 0x60
   ba5c0:	e590c000 	ldr	ip, [r0]
   ba5c4:	e59cc014 	ldr	ip, [ip, #20]
   ba5c8:	e12fff3c 	blx	ip
   ba5cc:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   ba5d0:	e1a01006 	mov	r1, r6
   ba5d4:	e5942054 	ldr	r2, [r4, #84]	@ 0x54
   ba5d8:	e1a03005 	mov	r3, r5
   ba5dc:	e590c000 	ldr	ip, [r0]
   ba5e0:	e59cc014 	ldr	ip, [ip, #20]
   ba5e4:	e12fff3c 	blx	ip
   ba5e8:	e5940048 	ldr	r0, [r4, #72]	@ 0x48
   ba5ec:	e5941054 	ldr	r1, [r4, #84]	@ 0x54
   ba5f0:	e1a03005 	mov	r3, r5
   ba5f4:	e5942064 	ldr	r2, [r4, #100]	@ 0x64
   ba5f8:	e590c000 	ldr	ip, [r0]
   ba5fc:	e59cc014 	ldr	ip, [ip, #20]
   ba600:	e12fff3c 	blx	ip
   ba604:	e3550000 	cmp	r5, #0
   ba608:	d8bd8ff8 	pople	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
   ba60c:	e284106c 	add	r1, r4, #108	@ 0x6c
   ba610:	e1a06007 	mov	r6, r7
   ba614:	e594a05c 	ldr	sl, [r4, #92]	@ 0x5c
   ba618:	e3a00000 	mov	r0, #0
   ba61c:	e5948060 	ldr	r8, [r4, #96]	@ 0x60
   ba620:	e3a0b001 	mov	fp, #1
   ba624:	e5947064 	ldr	r7, [r4, #100]	@ 0x64
   ba628:	e891000e 	ldm	r1, {r1, r2, r3}
   ba62c:	ea000008 	b	ba654 <mixerengine::Isolator::execute(common::Float2 const*, common::Float2*, int)+0x13c>
   ba630:	e5d2c024 	ldrb	ip, [r2, #36]	@ 0x24
   ba634:	e35c0000 	cmp	ip, #0
   ba638:	0a000027 	beq	ba6dc <mixerengine::Isolator::execute(common::Float2 const*, common::Float2*, int)+0x1c4>
   ba63c:	e5d3c024 	ldrb	ip, [r3, #36]	@ 0x24
   ba640:	e35c0000 	cmp	ip, #0
   ba644:	0a000033 	beq	ba718 <mixerengine::Isolator::execute(common::Float2 const*, common::Float2*, int)+0x200>
   ba648:	e2800001 	add	r0, r0, #1
   ba64c:	e1500005 	cmp	r0, r5
   ba650:	0a00003f 	beq	ba754 <mixerengine::Isolator::execute(common::Float2 const*, common::Float2*, int)+0x23c>
   ba654:	e1a0c180 	lsl	ip, r0, #3
   ba658:	edd24b04 	vldr	d20, [r2, #16]
   ba65c:	edd13b04 	vldr	d19, [r1, #16]
   ba660:	e08a900c 	add	r9, sl, ip
   ba664:	e088400c 	add	r4, r8, ip
   ba668:	edd95b00 	vldr	d21, [r9]
   ba66c:	edd42b00 	vldr	d18, [r4]
   ba670:	f3453db3 	vmul.f32	d19, d21, d19
   ba674:	f3421db4 	vmul.f32	d17, d18, d20
   ba678:	e087c00c 	add	ip, r7, ip
   ba67c:	edd32b04 	vldr	d18, [r3, #16]
   ba680:	eddc4b00 	vldr	d20, [ip]
   ba684:	f3442db2 	vmul.f32	d18, d20, d18
   ba688:	f2431da1 	vadd.f32	d17, d19, d17
   ba68c:	f2410da2 	vadd.f32	d16, d17, d18
   ba690:	ece60b02 	vstmia	r6!, {d16}
   ba694:	e5d1c024 	ldrb	ip, [r1, #36]	@ 0x24
   ba698:	e35c0000 	cmp	ip, #0
   ba69c:	1affffe3 	bne	ba630 <mixerengine::Isolator::execute(common::Float2 const*, common::Float2*, int)+0x118>
   ba6a0:	e591c018 	ldr	ip, [r1, #24]
   ba6a4:	edd11b04 	vldr	d17, [r1, #16]
   ba6a8:	e591401c 	ldr	r4, [r1, #28]
   ba6ac:	edd10b00 	vldr	d16, [r1]
   ba6b0:	f2410da0 	vadd.f32	d16, d17, d16
   ba6b4:	edc10b04 	vstr	d16, [r1, #16]
   ba6b8:	e15c0004 	cmp	ip, r4
   ba6bc:	2dd10b02 	vldrcs	d16, [r1, #8]
   ba6c0:	25c1b024 	strbcs	fp, [r1, #36]	@ 0x24
   ba6c4:	2dc10b04 	vstrcs	d16, [r1, #16]
   ba6c8:	e28cc001 	add	ip, ip, #1
   ba6cc:	e581c018 	str	ip, [r1, #24]
   ba6d0:	e5d2c024 	ldrb	ip, [r2, #36]	@ 0x24
   ba6d4:	e35c0000 	cmp	ip, #0
   ba6d8:	1affffd7 	bne	ba63c <mixerengine::Isolator::execute(common::Float2 const*, common::Float2*, int)+0x124>
   ba6dc:	e592c018 	ldr	ip, [r2, #24]
   ba6e0:	edd21b04 	vldr	d17, [r2, #16]
   ba6e4:	e592401c 	ldr	r4, [r2, #28]
   ba6e8:	edd20b00 	vldr	d16, [r2]
   ba6ec:	f2410da0 	vadd.f32	d16, d17, d16
   ba6f0:	edc20b04 	vstr	d16, [r2, #16]
   ba6f4:	e15c0004 	cmp	ip, r4
   ba6f8:	2dd20b02 	vldrcs	d16, [r2, #8]
   ba6fc:	25c2b024 	strbcs	fp, [r2, #36]	@ 0x24
   ba700:	2dc20b04 	vstrcs	d16, [r2, #16]
   ba704:	e28cc001 	add	ip, ip, #1
   ba708:	e582c018 	str	ip, [r2, #24]
   ba70c:	e5d3c024 	ldrb	ip, [r3, #36]	@ 0x24
   ba710:	e35c0000 	cmp	ip, #0
   ba714:	1affffcb 	bne	ba648 <mixerengine::Isolator::execute(common::Float2 const*, common::Float2*, int)+0x130>
   ba718:	e593c018 	ldr	ip, [r3, #24]
   ba71c:	edd31b04 	vldr	d17, [r3, #16]
   ba720:	e593401c 	ldr	r4, [r3, #28]
   ba724:	edd30b00 	vldr	d16, [r3]
   ba728:	f2410da0 	vadd.f32	d16, d17, d16
   ba72c:	edc30b04 	vstr	d16, [r3, #16]
   ba730:	e15c0004 	cmp	ip, r4
   ba734:	2dd30b02 	vldrcs	d16, [r3, #8]
   ba738:	25c3b024 	strbcs	fp, [r3, #36]	@ 0x24
   ba73c:	2dc30b04 	vstrcs	d16, [r3, #16]
   ba740:	e2800001 	add	r0, r0, #1
   ba744:	e28cc001 	add	ip, ip, #1
   ba748:	e1500005 	cmp	r0, r5
   ba74c:	e583c018 	str	ip, [r3, #24]
   ba750:	1affffbf 	bne	ba654 <mixerengine::Isolator::execute(common::Float2 const*, common::Float2*, int)+0x13c>
   ba754:	e8bd8ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}

000ba758 <mixerengine::Isolator::volumeConvert(djengine::EnEqualizerBand, float)>:
   ba758:	eef67a00 	vmov.f32	s15, #96	@ 0x3f000000  0.5
   ba75c:	ee062a90 	vmov	s13, r2
   ba760:	ed9f7a15 	vldr	s14, [pc, #84]	@ ba7bc <mixerengine::Isolator::volumeConvert(djengine::EnEqualizerBand, float)+0x64>
   ba764:	e590c068 	ldr	ip, [r0, #104]	@ 0x68
   ba768:	e0801101 	add	r1, r0, r1, lsl #2
   ba76c:	e3a00000 	mov	r0, #0
   ba770:	e591306c 	ldr	r3, [r1, #108]	@ 0x6c
   ba774:	edd31b00 	vldr	d17, [r3]
   ba778:	edd32b04 	vldr	d18, [r3, #16]
   ba77c:	f2421da1 	vadd.f32	d17, d18, d17
   ba780:	e5931020 	ldr	r1, [r3, #32]
   ba784:	ee467a87 	vmla.f32	s15, s13, s14
   ba788:	ee821b90 	vdup.32	d18, r1
   ba78c:	eefd7ae7 	vcvt.s32.f32	s15, s15
   ba790:	ee172a90 	vmov	r2, s15
   ba794:	e08cc102 	add	ip, ip, r2, lsl #2
   ba798:	e59c2000 	ldr	r2, [ip]
   ba79c:	e5830018 	str	r0, [r3, #24]
   ba7a0:	e5c30024 	strb	r0, [r3, #36]	@ 0x24
   ba7a4:	ee802b90 	vdup.32	d16, r2
   ba7a8:	edc30b02 	vstr	d16, [r3, #8]
   ba7ac:	f2601da1 	vsub.f32	d17, d16, d17
   ba7b0:	f3410db2 	vmul.f32	d16, d17, d18
   ba7b4:	edc30b00 	vstr	d16, [r3]
   ba7b8:	e12fff1e 	bx	lr
   ba7bc:	437f0000 	.word	0x437f0000

000ba7c0 <mixerengine::Isolator::~Isolator()>:
   ba7c0:	e92d4010 	push	{r4, lr}
   ba7c4:	e1a04000 	mov	r4, r0
   ba7c8:	e5900024 	ldr	r0, [r0, #36]	@ 0x24
   ba7cc:	e59f3180 	ldr	r3, [pc, #384]	@ ba954 <mixerengine::Isolator::~Isolator()+0x194>
   ba7d0:	e3500000 	cmp	r0, #0
   ba7d4:	e5843000 	str	r3, [r4]
   ba7d8:	0a000002 	beq	ba7e8 <mixerengine::Isolator::~Isolator()+0x28>
   ba7dc:	e5903000 	ldr	r3, [r0]
   ba7e0:	e5933004 	ldr	r3, [r3, #4]
   ba7e4:	e12fff33 	blx	r3
   ba7e8:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   ba7ec:	e3500000 	cmp	r0, #0
   ba7f0:	0a000002 	beq	ba800 <mixerengine::Isolator::~Isolator()+0x40>
   ba7f4:	e5903000 	ldr	r3, [r0]
   ba7f8:	e5933004 	ldr	r3, [r3, #4]
   ba7fc:	e12fff33 	blx	r3
   ba800:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   ba804:	e3500000 	cmp	r0, #0
   ba808:	0a000002 	beq	ba818 <mixerengine::Isolator::~Isolator()+0x58>
   ba80c:	e5903000 	ldr	r3, [r0]
   ba810:	e5933004 	ldr	r3, [r3, #4]
   ba814:	e12fff33 	blx	r3
   ba818:	e5940048 	ldr	r0, [r4, #72]	@ 0x48
   ba81c:	e3500000 	cmp	r0, #0
   ba820:	0a000002 	beq	ba830 <mixerengine::Isolator::~Isolator()+0x70>
   ba824:	e5903000 	ldr	r3, [r0]
   ba828:	e5933004 	ldr	r3, [r3, #4]
   ba82c:	e12fff33 	blx	r3
   ba830:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   ba834:	e3500000 	cmp	r0, #0
   ba838:	0a000002 	beq	ba848 <mixerengine::Isolator::~Isolator()+0x88>
   ba83c:	e5903000 	ldr	r3, [r0]
   ba840:	e5933004 	ldr	r3, [r3, #4]
   ba844:	e12fff33 	blx	r3
   ba848:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   ba84c:	e3500000 	cmp	r0, #0
   ba850:	0a000002 	beq	ba860 <mixerengine::Isolator::~Isolator()+0xa0>
   ba854:	e5903000 	ldr	r3, [r0]
   ba858:	e5933004 	ldr	r3, [r3, #4]
   ba85c:	e12fff33 	blx	r3
   ba860:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   ba864:	e3500000 	cmp	r0, #0
   ba868:	0a000002 	beq	ba878 <mixerengine::Isolator::~Isolator()+0xb8>
   ba86c:	e5903000 	ldr	r3, [r0]
   ba870:	e5933004 	ldr	r3, [r3, #4]
   ba874:	e12fff33 	blx	r3
   ba878:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   ba87c:	e3500000 	cmp	r0, #0
   ba880:	0a000002 	beq	ba890 <mixerengine::Isolator::~Isolator()+0xd0>
   ba884:	e5903000 	ldr	r3, [r0]
   ba888:	e5933004 	ldr	r3, [r3, #4]
   ba88c:	e12fff33 	blx	r3
   ba890:	e594006c 	ldr	r0, [r4, #108]	@ 0x6c
   ba894:	e3500000 	cmp	r0, #0
   ba898:	0a000000 	beq	ba8a0 <mixerengine::Isolator::~Isolator()+0xe0>
   ba89c:	ebfd510b 	bl	ecd0 <operator delete(void*)@plt>
   ba8a0:	e5940070 	ldr	r0, [r4, #112]	@ 0x70
   ba8a4:	e3500000 	cmp	r0, #0
   ba8a8:	0a000000 	beq	ba8b0 <mixerengine::Isolator::~Isolator()+0xf0>
   ba8ac:	ebfd5107 	bl	ecd0 <operator delete(void*)@plt>
   ba8b0:	e5940074 	ldr	r0, [r4, #116]	@ 0x74
   ba8b4:	e3500000 	cmp	r0, #0
   ba8b8:	0a000000 	beq	ba8c0 <mixerengine::Isolator::~Isolator()+0x100>
   ba8bc:	ebfd5103 	bl	ecd0 <operator delete(void*)@plt>
   ba8c0:	e594005c 	ldr	r0, [r4, #92]	@ 0x5c
   ba8c4:	e3500000 	cmp	r0, #0
   ba8c8:	0a000002 	beq	ba8d8 <mixerengine::Isolator::~Isolator()+0x118>
   ba8cc:	ebfd51e6 	bl	f06c <operator delete[](void*)@plt>
   ba8d0:	e3a03000 	mov	r3, #0
   ba8d4:	e584305c 	str	r3, [r4, #92]	@ 0x5c
   ba8d8:	e5940060 	ldr	r0, [r4, #96]	@ 0x60
   ba8dc:	e3500000 	cmp	r0, #0
   ba8e0:	0a000002 	beq	ba8f0 <mixerengine::Isolator::~Isolator()+0x130>
   ba8e4:	ebfd51e0 	bl	f06c <operator delete[](void*)@plt>
   ba8e8:	e3a03000 	mov	r3, #0
   ba8ec:	e5843060 	str	r3, [r4, #96]	@ 0x60
   ba8f0:	e5940064 	ldr	r0, [r4, #100]	@ 0x64
   ba8f4:	e3500000 	cmp	r0, #0
   ba8f8:	0a000002 	beq	ba908 <mixerengine::Isolator::~Isolator()+0x148>
   ba8fc:	ebfd51da 	bl	f06c <operator delete[](void*)@plt>
   ba900:	e3a03000 	mov	r3, #0
   ba904:	e5843064 	str	r3, [r4, #100]	@ 0x64
   ba908:	e5940054 	ldr	r0, [r4, #84]	@ 0x54
   ba90c:	e3500000 	cmp	r0, #0
   ba910:	0a000002 	beq	ba920 <mixerengine::Isolator::~Isolator()+0x160>
   ba914:	ebfd51d4 	bl	f06c <operator delete[](void*)@plt>
   ba918:	e3a03000 	mov	r3, #0
   ba91c:	e5843054 	str	r3, [r4, #84]	@ 0x54
   ba920:	e5940058 	ldr	r0, [r4, #88]	@ 0x58
   ba924:	e3500000 	cmp	r0, #0
   ba928:	0a000002 	beq	ba938 <mixerengine::Isolator::~Isolator()+0x178>
   ba92c:	ebfd51ce 	bl	f06c <operator delete[](void*)@plt>
   ba930:	e3a03000 	mov	r3, #0
   ba934:	e5843058 	str	r3, [r4, #88]	@ 0x58
   ba938:	e59f3018 	ldr	r3, [pc, #24]	@ ba958 <mixerengine::Isolator::~Isolator()+0x198>
   ba93c:	e1a00004 	mov	r0, r4
   ba940:	e5843000 	str	r3, [r4]
   ba944:	e8bd8010 	pop	{r4, pc}
   ba948:	e59f3008 	ldr	r3, [pc, #8]	@ ba958 <mixerengine::Isolator::~Isolator()+0x198>
   ba94c:	e5843000 	str	r3, [r4]
   ba950:	ebfd5159 	bl	eebc <__cxa_end_cleanup@plt>
   ba954:	0042a2d8 	.word	0x0042a2d8
   ba958:	0041db60 	.word	0x0041db60

000ba95c <mixerengine::Isolator::~Isolator()>:
   ba95c:	e92d4010 	push	{r4, lr}
   ba960:	e1a04000 	mov	r4, r0
   ba964:	ebffff95 	bl	ba7c0 <mixerengine::Isolator::~Isolator()>
   ba968:	e1a00004 	mov	r0, r4
   ba96c:	ebfd50d7 	bl	ecd0 <operator delete(void*)@plt>
   ba970:	e1a00004 	mov	r0, r4
   ba974:	e8bd8010 	pop	{r4, pc}

000ba978 <mixerengine::Isolator::Isolator()>:
   ba978:	e59f3478 	ldr	r3, [pc, #1144]	@ badf8 <mixerengine::Isolator::Isolator()+0x480>
   ba97c:	eef77a00 	vmov.f32	s15, #112	@ 0x3f800000  1.0
   ba980:	e92d4070 	push	{r4, r5, r6, lr}
   ba984:	ed2d8b02 	vpush	{d8}
   ba988:	f2c00010 	vmov.i32	d16, #0	@ 0x00000000
   ba98c:	e5933000 	ldr	r3, [r3]
   ba990:	ee073a10 	vmov	s14, r3
   ba994:	e59f2460 	ldr	r2, [pc, #1120]	@ badfc <mixerengine::Isolator::Isolator()+0x484>
   ba998:	e24dd018 	sub	sp, sp, #24
   ba99c:	e1a04000 	mov	r4, r0
   ba9a0:	e28d6004 	add	r6, sp, #4
   ba9a4:	e2800010 	add	r0, r0, #16
   ba9a8:	e2821020 	add	r1, r2, #32
   ba9ac:	f440078f 	vst1.32	{d16}, [r0]
   ba9b0:	e1a00006 	mov	r0, r6
   ba9b4:	e884000c 	stm	r4, {r2, r3}
   ba9b8:	eeb88a47 	vcvt.f32.u32	s16, s14
   ba9bc:	e5843008 	str	r3, [r4, #8]
   ba9c0:	e5841068 	str	r1, [r4, #104]	@ 0x68
   ba9c4:	e3a0343f 	mov	r3, #1056964608	@ 0x3f000000
   ba9c8:	e59f1430 	ldr	r1, [pc, #1072]	@ bae00 <mixerengine::Isolator::Isolator()+0x488>
   ba9cc:	e5843018 	str	r3, [r4, #24]
   ba9d0:	e584301c 	str	r3, [r4, #28]
   ba9d4:	e5843020 	str	r3, [r4, #32]
   ba9d8:	eec77a88 	vdiv.f32	s15, s15, s16
   ba9dc:	edc47a03 	vstr	s15, [r4, #12]
   ba9e0:	eb0bd9e8 	bl	3b1188 <juce::String::String(char const*)>
   ba9e4:	e59f1418 	ldr	r1, [pc, #1048]	@ bae04 <mixerengine::Isolator::Isolator()+0x48c>
   ba9e8:	e28d0008 	add	r0, sp, #8
   ba9ec:	eb0bd9e5 	bl	3b1188 <juce::String::String(char const*)>
   ba9f0:	e59f1410 	ldr	r1, [pc, #1040]	@ bae08 <mixerengine::Isolator::Isolator()+0x490>
   ba9f4:	e28d000c 	add	r0, sp, #12
   ba9f8:	eb0bd9e2 	bl	3b1188 <juce::String::String(char const*)>
   ba9fc:	e3a00048 	mov	r0, #72	@ 0x48
   baa00:	ebfd4e48 	bl	e328 <operator new(unsigned int)@plt>
   baa04:	e1a05000 	mov	r5, r0
   baa08:	ebff82b0 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   baa0c:	e5845024 	str	r5, [r4, #36]	@ 0x24
   baa10:	e3a00048 	mov	r0, #72	@ 0x48
   baa14:	ebfd4e43 	bl	e328 <operator new(unsigned int)@plt>
   baa18:	e1a05000 	mov	r5, r0
   baa1c:	ebff82ab 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   baa20:	e5845044 	str	r5, [r4, #68]	@ 0x44
   baa24:	e3a00048 	mov	r0, #72	@ 0x48
   baa28:	ebfd4e3e 	bl	e328 <operator new(unsigned int)@plt>
   baa2c:	e1a05000 	mov	r5, r0
   baa30:	ebff82a6 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   baa34:	e5845028 	str	r5, [r4, #40]	@ 0x28
   baa38:	e3a00048 	mov	r0, #72	@ 0x48
   baa3c:	ebfd4e39 	bl	e328 <operator new(unsigned int)@plt>
   baa40:	e1a05000 	mov	r5, r0
   baa44:	ebff82a1 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   baa48:	e5845048 	str	r5, [r4, #72]	@ 0x48
   baa4c:	e3a00048 	mov	r0, #72	@ 0x48
   baa50:	ebfd4e34 	bl	e328 <operator new(unsigned int)@plt>
   baa54:	e1a05000 	mov	r5, r0
   baa58:	ebff829c 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   baa5c:	e5845034 	str	r5, [r4, #52]	@ 0x34
   baa60:	e3a00048 	mov	r0, #72	@ 0x48
   baa64:	ebfd4e2f 	bl	e328 <operator new(unsigned int)@plt>
   baa68:	e1a05000 	mov	r5, r0
   baa6c:	ebff8297 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   baa70:	e5845038 	str	r5, [r4, #56]	@ 0x38
   baa74:	e3a00048 	mov	r0, #72	@ 0x48
   baa78:	ebfd4e2a 	bl	e328 <operator new(unsigned int)@plt>
   baa7c:	e1a05000 	mov	r5, r0
   baa80:	ebff8292 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   baa84:	e584503c 	str	r5, [r4, #60]	@ 0x3c
   baa88:	e3a00048 	mov	r0, #72	@ 0x48
   baa8c:	ebfd4e25 	bl	e328 <operator new(unsigned int)@plt>
   baa90:	e1a05000 	mov	r5, r0
   baa94:	ebff828d 	bl	9b4d0 <dsp::secondOrder_IIRFilter::secondOrder_IIRFilter()>
   baa98:	e1a01006 	mov	r1, r6
   baa9c:	e3a03000 	mov	r3, #0
   baaa0:	e5845040 	str	r5, [r4, #64]	@ 0x40
   baaa4:	e28d0014 	add	r0, sp, #20
   baaa8:	e584305c 	str	r3, [r4, #92]	@ 0x5c
   baaac:	eb0bd951 	bl	3b0ff8 <juce::String::String(juce::String const&)>
   baab0:	e28d0010 	add	r0, sp, #16
   baab4:	e28d1014 	add	r1, sp, #20
   baab8:	e59f234c 	ldr	r2, [pc, #844]	@ bae0c <mixerengine::Isolator::Isolator()+0x494>
   baabc:	eb0bdd5d 	bl	3b2038 <juce::operator+(juce::String, char const*)>
   baac0:	e3a00028 	mov	r0, #40	@ 0x28
   baac4:	ebfd4e17 	bl	e328 <operator new(unsigned int)@plt>
   baac8:	eddf7ac8 	vldr	s15, [pc, #800]	@ badf0 <mixerengine::Isolator::Isolator()+0x478>
   baacc:	ee287a27 	vmul.f32	s14, s16, s15
   baad0:	eddf7ac7 	vldr	s15, [pc, #796]	@ badf4 <mixerengine::Isolator::Isolator()+0x47c>
   baad4:	e3a01000 	mov	r1, #0
   baad8:	e1a03000 	mov	r3, r0
   baadc:	eddf0bbf 	vldr	d16, [pc, #764]	@ bade0 <mixerengine::Isolator::Isolator()+0x468>
   baae0:	edc00b00 	vstr	d16, [r0]
   baae4:	edc00b02 	vstr	d16, [r0, #8]
   baae8:	edc00b04 	vstr	d16, [r0, #16]
   baaec:	e3a02001 	mov	r2, #1
   baaf0:	e5801018 	str	r1, [r0, #24]
   baaf4:	eddf0bbb 	vldr	d16, [pc, #748]	@ bade8 <mixerengine::Isolator::Isolator()+0x470>
   baaf8:	e5c02024 	strb	r2, [r0, #36]	@ 0x24
   baafc:	eec77a27 	vdiv.f32	s15, s14, s15
   bab00:	eefc7ae7 	vcvt.u32.f32	s15, s15
   bab04:	ee175a90 	vmov	r5, s15
   bab08:	e1550001 	cmp	r5, r1
   bab0c:	edc37a07 	vstr	s15, [r3, #28]
   bab10:	1e075a10 	vmovne	s14, r5
   bab14:	1ef87a47 	vcvtne.f32.u32	s15, s14
   bab18:	0580201c 	streq	r2, [r0, #28]
   bab1c:	edc00b04 	vstr	d16, [r0, #16]
   bab20:	edc00b02 	vstr	d16, [r0, #8]
   bab24:	eddf0bad 	vldr	d16, [pc, #692]	@ bade0 <mixerengine::Isolator::Isolator()+0x468>
   bab28:	edc00b00 	vstr	d16, [r0]
   bab2c:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   bab30:	1ec77a27 	vdivne.f32	s15, s14, s15
   bab34:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   bab38:	edc07a08 	vstr	s15, [r0, #32]
   bab3c:	e584306c 	str	r3, [r4, #108]	@ 0x6c
   bab40:	e28d0010 	add	r0, sp, #16
   bab44:	eb0bd889 	bl	3b0d70 <juce::String::~String()>
   bab48:	e28d0014 	add	r0, sp, #20
   bab4c:	eb0bd887 	bl	3b0d70 <juce::String::~String()>
   bab50:	e3a03000 	mov	r3, #0
   bab54:	e28d1008 	add	r1, sp, #8
   bab58:	e28d0014 	add	r0, sp, #20
   bab5c:	e5843060 	str	r3, [r4, #96]	@ 0x60
   bab60:	eb0bd924 	bl	3b0ff8 <juce::String::String(juce::String const&)>
   bab64:	e28d0010 	add	r0, sp, #16
   bab68:	e28d1014 	add	r1, sp, #20
   bab6c:	e59f2298 	ldr	r2, [pc, #664]	@ bae0c <mixerengine::Isolator::Isolator()+0x494>
   bab70:	eb0bdd30 	bl	3b2038 <juce::operator+(juce::String, char const*)>
   bab74:	e3a00028 	mov	r0, #40	@ 0x28
   bab78:	ebfd4dea 	bl	e328 <operator new(unsigned int)@plt>
   bab7c:	e3550000 	cmp	r5, #0
   bab80:	1e075a10 	vmovne	s14, r5
   bab84:	e3a02001 	mov	r2, #1
   bab88:	e1a03000 	mov	r3, r0
   bab8c:	1ef87a47 	vcvtne.f32.u32	s15, s14
   bab90:	e5c02024 	strb	r2, [r0, #36]	@ 0x24
   bab94:	eddf0b91 	vldr	d16, [pc, #580]	@ bade0 <mixerengine::Isolator::Isolator()+0x468>
   bab98:	e3a01000 	mov	r1, #0
   bab9c:	edc00b00 	vstr	d16, [r0]
   baba0:	edc00b02 	vstr	d16, [r0, #8]
   baba4:	edc00b04 	vstr	d16, [r0, #16]
   baba8:	e5801018 	str	r1, [r0, #24]
   babac:	e580501c 	str	r5, [r0, #28]
   babb0:	eddf0b8c 	vldr	d16, [pc, #560]	@ bade8 <mixerengine::Isolator::Isolator()+0x470>
   babb4:	0580201c 	streq	r2, [r0, #28]
   babb8:	edc00b04 	vstr	d16, [r0, #16]
   babbc:	edc00b02 	vstr	d16, [r0, #8]
   babc0:	eddf0b86 	vldr	d16, [pc, #536]	@ bade0 <mixerengine::Isolator::Isolator()+0x468>
   babc4:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   babc8:	edc00b00 	vstr	d16, [r0]
   babcc:	1ec77a27 	vdivne.f32	s15, s14, s15
   babd0:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   babd4:	edc07a08 	vstr	s15, [r0, #32]
   babd8:	e5843070 	str	r3, [r4, #112]	@ 0x70
   babdc:	e28d0010 	add	r0, sp, #16
   babe0:	eb0bd862 	bl	3b0d70 <juce::String::~String()>
   babe4:	e28d0014 	add	r0, sp, #20
   babe8:	eb0bd860 	bl	3b0d70 <juce::String::~String()>
   babec:	e3a03000 	mov	r3, #0
   babf0:	e28d100c 	add	r1, sp, #12
   babf4:	e28d0014 	add	r0, sp, #20
   babf8:	e5843064 	str	r3, [r4, #100]	@ 0x64
   babfc:	eb0bd8fd 	bl	3b0ff8 <juce::String::String(juce::String const&)>
   bac00:	e28d0010 	add	r0, sp, #16
   bac04:	e28d1014 	add	r1, sp, #20
   bac08:	e59f21fc 	ldr	r2, [pc, #508]	@ bae0c <mixerengine::Isolator::Isolator()+0x494>
   bac0c:	eb0bdd09 	bl	3b2038 <juce::operator+(juce::String, char const*)>
   bac10:	e3a00028 	mov	r0, #40	@ 0x28
   bac14:	ebfd4dc3 	bl	e328 <operator new(unsigned int)@plt>
   bac18:	e3550000 	cmp	r5, #0
   bac1c:	1e075a10 	vmovne	s14, r5
   bac20:	e1a03000 	mov	r3, r0
   bac24:	e3a02001 	mov	r2, #1
   bac28:	1ef87a47 	vcvtne.f32.u32	s15, s14
   bac2c:	e5c02024 	strb	r2, [r0, #36]	@ 0x24
   bac30:	eddf0b6a 	vldr	d16, [pc, #424]	@ bade0 <mixerengine::Isolator::Isolator()+0x468>
   bac34:	e3a01000 	mov	r1, #0
   bac38:	edc00b00 	vstr	d16, [r0]
   bac3c:	edc00b02 	vstr	d16, [r0, #8]
   bac40:	edc00b04 	vstr	d16, [r0, #16]
   bac44:	e5801018 	str	r1, [r0, #24]
   bac48:	e580501c 	str	r5, [r0, #28]
   bac4c:	eddf0b65 	vldr	d16, [pc, #404]	@ bade8 <mixerengine::Isolator::Isolator()+0x470>
   bac50:	0580201c 	streq	r2, [r0, #28]
   bac54:	edc00b04 	vstr	d16, [r0, #16]
   bac58:	edc00b02 	vstr	d16, [r0, #8]
   bac5c:	eddf0b5f 	vldr	d16, [pc, #380]	@ bade0 <mixerengine::Isolator::Isolator()+0x468>
   bac60:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   bac64:	edc00b00 	vstr	d16, [r0]
   bac68:	1ec77a27 	vdivne.f32	s15, s14, s15
   bac6c:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   bac70:	edc07a08 	vstr	s15, [r0, #32]
   bac74:	e5843074 	str	r3, [r4, #116]	@ 0x74
   bac78:	e28d0010 	add	r0, sp, #16
   bac7c:	eb0bd83b 	bl	3b0d70 <juce::String::~String()>
   bac80:	e28d0014 	add	r0, sp, #20
   bac84:	eb0bd839 	bl	3b0d70 <juce::String::~String()>
   bac88:	e5940024 	ldr	r0, [r4, #36]	@ 0x24
   bac8c:	e3a03000 	mov	r3, #0
   bac90:	e59f1178 	ldr	r1, [pc, #376]	@ bae10 <mixerengine::Isolator::Isolator()+0x498>
   bac94:	e5843054 	str	r3, [r4, #84]	@ 0x54
   bac98:	e5902000 	ldr	r2, [r0]
   bac9c:	e5843058 	str	r3, [r4, #88]	@ 0x58
   baca0:	e5923008 	ldr	r3, [r2, #8]
   baca4:	e12fff33 	blx	r3
   baca8:	e5940028 	ldr	r0, [r4, #40]	@ 0x28
   bacac:	e59f115c 	ldr	r1, [pc, #348]	@ bae10 <mixerengine::Isolator::Isolator()+0x498>
   bacb0:	e5903000 	ldr	r3, [r0]
   bacb4:	e5933008 	ldr	r3, [r3, #8]
   bacb8:	e12fff33 	blx	r3
   bacbc:	e5940034 	ldr	r0, [r4, #52]	@ 0x34
   bacc0:	e59f114c 	ldr	r1, [pc, #332]	@ bae14 <mixerengine::Isolator::Isolator()+0x49c>
   bacc4:	e5903000 	ldr	r3, [r0]
   bacc8:	e5933008 	ldr	r3, [r3, #8]
   baccc:	e12fff33 	blx	r3
   bacd0:	e5940038 	ldr	r0, [r4, #56]	@ 0x38
   bacd4:	e59f1138 	ldr	r1, [pc, #312]	@ bae14 <mixerengine::Isolator::Isolator()+0x49c>
   bacd8:	e5903000 	ldr	r3, [r0]
   bacdc:	e5933008 	ldr	r3, [r3, #8]
   bace0:	e12fff33 	blx	r3
   bace4:	e594003c 	ldr	r0, [r4, #60]	@ 0x3c
   bace8:	e59f1128 	ldr	r1, [pc, #296]	@ bae18 <mixerengine::Isolator::Isolator()+0x4a0>
   bacec:	e5903000 	ldr	r3, [r0]
   bacf0:	e5933008 	ldr	r3, [r3, #8]
   bacf4:	e12fff33 	blx	r3
   bacf8:	e5940040 	ldr	r0, [r4, #64]	@ 0x40
   bacfc:	e59f1114 	ldr	r1, [pc, #276]	@ bae18 <mixerengine::Isolator::Isolator()+0x4a0>
   bad00:	e5903000 	ldr	r3, [r0]
   bad04:	e5933008 	ldr	r3, [r3, #8]
   bad08:	e12fff33 	blx	r3
   bad0c:	e5940044 	ldr	r0, [r4, #68]	@ 0x44
   bad10:	e59f1104 	ldr	r1, [pc, #260]	@ bae1c <mixerengine::Isolator::Isolator()+0x4a4>
   bad14:	e5903000 	ldr	r3, [r0]
   bad18:	e5933008 	ldr	r3, [r3, #8]
   bad1c:	e12fff33 	blx	r3
   bad20:	e5940048 	ldr	r0, [r4, #72]	@ 0x48
   bad24:	e59f10f0 	ldr	r1, [pc, #240]	@ bae1c <mixerengine::Isolator::Isolator()+0x4a4>
   bad28:	e5903000 	ldr	r3, [r0]
   bad2c:	e5933008 	ldr	r3, [r3, #8]
   bad30:	e12fff33 	blx	r3
   bad34:	e28d000c 	add	r0, sp, #12
   bad38:	eb0bd80c 	bl	3b0d70 <juce::String::~String()>
   bad3c:	e28d0008 	add	r0, sp, #8
   bad40:	eb0bd80a 	bl	3b0d70 <juce::String::~String()>
   bad44:	e1a00006 	mov	r0, r6
   bad48:	eb0bd808 	bl	3b0d70 <juce::String::~String()>
   bad4c:	e1a00004 	mov	r0, r4
   bad50:	e28dd018 	add	sp, sp, #24
   bad54:	ecbd8b02 	vpop	{d8}
   bad58:	e8bd8070 	pop	{r4, r5, r6, pc}
   bad5c:	e3a03002 	mov	r3, #2
   bad60:	e2633002 	rsb	r3, r3, #2
   bad64:	e0865103 	add	r5, r6, r3, lsl #2
   bad68:	e1550006 	cmp	r5, r6
   bad6c:	0a00000d 	beq	bada8 <mixerengine::Isolator::Isolator()+0x430>
   bad70:	e2455004 	sub	r5, r5, #4
   bad74:	e1a00005 	mov	r0, r5
   bad78:	eb0bd7fc 	bl	3b0d70 <juce::String::~String()>
   bad7c:	eafffff9 	b	bad68 <mixerengine::Isolator::Isolator()+0x3f0>
   bad80:	e28d0010 	add	r0, sp, #16
   bad84:	eb0bd7f9 	bl	3b0d70 <juce::String::~String()>
   bad88:	e28d0014 	add	r0, sp, #20
   bad8c:	eb0bd7f7 	bl	3b0d70 <juce::String::~String()>
   bad90:	e2860008 	add	r0, r6, #8
   bad94:	eb0bd7f5 	bl	3b0d70 <juce::String::~String()>
   bad98:	e2860004 	add	r0, r6, #4
   bad9c:	eb0bd7f3 	bl	3b0d70 <juce::String::~String()>
   bada0:	e1a00006 	mov	r0, r6
   bada4:	eb0bd7f1 	bl	3b0d70 <juce::String::~String()>
   bada8:	e59f3070 	ldr	r3, [pc, #112]	@ bae20 <mixerengine::Isolator::Isolator()+0x4a8>
   badac:	e5843000 	str	r3, [r4]
   badb0:	ebfd5041 	bl	eebc <__cxa_end_cleanup@plt>
   badb4:	e1a00005 	mov	r0, r5
   badb8:	ebfd4fc4 	bl	ecd0 <operator delete(void*)@plt>
   badbc:	eafffff3 	b	bad90 <mixerengine::Isolator::Isolator()+0x418>
   badc0:	eafffff2 	b	bad90 <mixerengine::Isolator::Isolator()+0x418>
   badc4:	e3a03000 	mov	r3, #0
   badc8:	eaffffe4 	b	bad60 <mixerengine::Isolator::Isolator()+0x3e8>
   badcc:	e3a03001 	mov	r3, #1
   badd0:	eaffffe2 	b	bad60 <mixerengine::Isolator::Isolator()+0x3e8>
   badd4:	eafffff6 	b	badb4 <mixerengine::Isolator::Isolator()+0x43c>
   badd8:	eaffffea 	b	bad88 <mixerengine::Isolator::Isolator()+0x410>
   baddc:	eafffff4 	b	badb4 <mixerengine::Isolator::Isolator()+0x43c>
	...
   bade8:	3eb5a965 	.word	0x3eb5a965
   badec:	3eb5a965 	.word	0x3eb5a965
   badf0:	40533333 	.word	0x40533333
   badf4:	447a0000 	.word	0x447a0000
   badf8:	004172c0 	.word	0x004172c0
   badfc:	0042a2d8 	.word	0x0042a2d8
   bae00:	0042a7c8 	.word	0x0042a7c8
   bae04:	0042a7dc 	.word	0x0042a7dc
   bae08:	0042a7ec 	.word	0x0042a7ec
   bae0c:	0041a040 	.word	0x0041a040
   bae10:	0042a6f8 	.word	0x0042a6f8
   bae14:	0042a70c 	.word	0x0042a70c
   bae18:	0042a720 	.word	0x0042a720
   bae1c:	0042a734 	.word	0x0042a734
   bae20:	0041db60 	.word	0x0041db60

000bae24 <mixerengine::Isolator::convertVolumeToGain(float)>:
   bae24:	eef67a00 	vmov.f32	s15, #96	@ 0x3f000000  0.5
   bae28:	ed9f7a07 	vldr	s14, [pc, #28]	@ bae4c <mixerengine::Isolator::convertVolumeToGain(float)+0x28>
   bae2c:	ee061a90 	vmov	s13, r1
   bae30:	e5903068 	ldr	r3, [r0, #104]	@ 0x68
   bae34:	ee467a87 	vmla.f32	s15, s13, s14
   bae38:	eefd7ae7 	vcvt.s32.f32	s15, s15
   bae3c:	ee172a90 	vmov	r2, s15
   bae40:	e0833102 	add	r3, r3, r2, lsl #2
   bae44:	e5930000 	ldr	r0, [r3]
   bae48:	e12fff1e 	bx	lr
   bae4c:	437f0000 	.word	0x437f0000

000bae50 <mixerengine::Isolator::initResources(int)>:
   bae50:	e92d45f8 	push	{r3, r4, r5, r6, r7, r8, sl, lr}
   bae54:	ed2d8b02 	vpush	{d8}
   bae58:	e1a08181 	lsl	r8, r1, #3
   bae5c:	ed9f8b45 	vldr	d8, [pc, #276]	@ baf78 <mixerengine::Isolator::initResources(int)+0x128>
   bae60:	e2414001 	sub	r4, r1, #1
   bae64:	e1a05001 	mov	r5, r1
   bae68:	e1a0a000 	mov	sl, r0
   bae6c:	e1a06000 	mov	r6, r0
   bae70:	e3a07000 	mov	r7, #0
   bae74:	e1a00008 	mov	r0, r8
   bae78:	ebfd4f0a 	bl	eaa8 <operator new[](unsigned int)@plt>
   bae7c:	e3740001 	cmn	r4, #1
   bae80:	0a000005 	beq	bae9c <mixerengine::Isolator::initResources(int)+0x4c>
   bae84:	e1a02000 	mov	r2, r0
   bae88:	e1a03004 	mov	r3, r4
   bae8c:	e2433001 	sub	r3, r3, #1
   bae90:	eca28b02 	vstmia	r2!, {d8}
   bae94:	e3730001 	cmn	r3, #1
   bae98:	1afffffb 	bne	bae8c <mixerengine::Isolator::initResources(int)+0x3c>
   bae9c:	e3550000 	cmp	r5, #0
   baea0:	e586005c 	str	r0, [r6, #92]	@ 0x5c
   baea4:	da000007 	ble	baec8 <mixerengine::Isolator::initResources(int)+0x78>
   baea8:	e3a03000 	mov	r3, #0
   baeac:	ea000000 	b	baeb4 <mixerengine::Isolator::initResources(int)+0x64>
   baeb0:	e596005c 	ldr	r0, [r6, #92]	@ 0x5c
   baeb4:	e0800183 	add	r0, r0, r3, lsl #3
   baeb8:	e2833001 	add	r3, r3, #1
   baebc:	e1530005 	cmp	r3, r5
   baec0:	ed808b00 	vstr	d8, [r0]
   baec4:	1afffff9 	bne	baeb0 <mixerengine::Isolator::initResources(int)+0x60>
   baec8:	e2877001 	add	r7, r7, #1
   baecc:	e2866004 	add	r6, r6, #4
   baed0:	e3570003 	cmp	r7, #3
   baed4:	1affffe6 	bne	bae74 <mixerengine::Isolator::initResources(int)+0x24>
   baed8:	e1a00008 	mov	r0, r8
   baedc:	ebfd4ef1 	bl	eaa8 <operator new[](unsigned int)@plt>
   baee0:	e3740001 	cmn	r4, #1
   baee4:	0a00001f 	beq	baf68 <mixerengine::Isolator::initResources(int)+0x118>
   baee8:	e1a02000 	mov	r2, r0
   baeec:	e1a03004 	mov	r3, r4
   baef0:	eddf0b20 	vldr	d16, [pc, #128]	@ baf78 <mixerengine::Isolator::initResources(int)+0x128>
   baef4:	e2433001 	sub	r3, r3, #1
   baef8:	ece20b02 	vstmia	r2!, {d16}
   baefc:	e3730001 	cmn	r3, #1
   baf00:	1afffffb 	bne	baef4 <mixerengine::Isolator::initResources(int)+0xa4>
   baf04:	e58a0054 	str	r0, [sl, #84]	@ 0x54
   baf08:	e1a00008 	mov	r0, r8
   baf0c:	ebfd4ee5 	bl	eaa8 <operator new[](unsigned int)@plt>
   baf10:	eddf0b18 	vldr	d16, [pc, #96]	@ baf78 <mixerengine::Isolator::initResources(int)+0x128>
   baf14:	e1a03000 	mov	r3, r0
   baf18:	e2444001 	sub	r4, r4, #1
   baf1c:	ece30b02 	vstmia	r3!, {d16}
   baf20:	e3740001 	cmn	r4, #1
   baf24:	1afffffb 	bne	baf18 <mixerengine::Isolator::initResources(int)+0xc8>
   baf28:	e3550000 	cmp	r5, #0
   baf2c:	e58a0058 	str	r0, [sl, #88]	@ 0x58
   baf30:	da00000a 	ble	baf60 <mixerengine::Isolator::initResources(int)+0x110>
   baf34:	e59ac054 	ldr	ip, [sl, #84]	@ 0x54
   baf38:	e3a03000 	mov	r3, #0
   baf3c:	eddf0b0d 	vldr	d16, [pc, #52]	@ baf78 <mixerengine::Isolator::initResources(int)+0x128>
   baf40:	e1a02183 	lsl	r2, r3, #3
   baf44:	e2833001 	add	r3, r3, #1
   baf48:	e1530005 	cmp	r3, r5
   baf4c:	e08c1002 	add	r1, ip, r2
   baf50:	e0802002 	add	r2, r0, r2
   baf54:	edc10b00 	vstr	d16, [r1]
   baf58:	edc20b00 	vstr	d16, [r2]
   baf5c:	1afffff7 	bne	baf40 <mixerengine::Isolator::initResources(int)+0xf0>
   baf60:	ecbd8b02 	vpop	{d8}
   baf64:	e8bd85f8 	pop	{r3, r4, r5, r6, r7, r8, sl, pc}
   baf68:	e58a0054 	str	r0, [sl, #84]	@ 0x54
   baf6c:	e1a00008 	mov	r0, r8
   baf70:	ebfd4ecc 	bl	eaa8 <operator new[](unsigned int)@plt>
   baf74:	eaffffeb 	b	baf28 <mixerengine::Isolator::initResources(int)+0xd8>
	...

000baf80 <mixerengine::Isolator::initialize()>:
   baf80:	e92d4010 	push	{r4, lr}
   baf84:	e1a04000 	mov	r4, r0
   baf88:	e590005c 	ldr	r0, [r0, #92]	@ 0x5c
   baf8c:	e3500000 	cmp	r0, #0
   baf90:	0a000002 	beq	bafa0 <mixerengine::Isolator::initialize()+0x20>
   baf94:	ebfd5034 	bl	f06c <operator delete[](void*)@plt>
   baf98:	e3a03000 	mov	r3, #0
   baf9c:	e584305c 	str	r3, [r4, #92]	@ 0x5c
   bafa0:	e5940060 	ldr	r0, [r4, #96]	@ 0x60
   bafa4:	e3500000 	cmp	r0, #0
   bafa8:	0a000002 	beq	bafb8 <mixerengine::Isolator::initialize()+0x38>
   bafac:	ebfd502e 	bl	f06c <operator delete[](void*)@plt>
   bafb0:	e3a03000 	mov	r3, #0
   bafb4:	e5843060 	str	r3, [r4, #96]	@ 0x60
   bafb8:	e5940064 	ldr	r0, [r4, #100]	@ 0x64
   bafbc:	e3500000 	cmp	r0, #0
   bafc0:	0a000002 	beq	bafd0 <mixerengine::Isolator::initialize()+0x50>
   bafc4:	ebfd5028 	bl	f06c <operator delete[](void*)@plt>
   bafc8:	e3a03000 	mov	r3, #0
   bafcc:	e5843064 	str	r3, [r4, #100]	@ 0x64
   bafd0:	e5940054 	ldr	r0, [r4, #84]	@ 0x54
   bafd4:	e3500000 	cmp	r0, #0
   bafd8:	0a000002 	beq	bafe8 <mixerengine::Isolator::initialize()+0x68>
   bafdc:	ebfd5022 	bl	f06c <operator delete[](void*)@plt>
   bafe0:	e3a03000 	mov	r3, #0
   bafe4:	e5843054 	str	r3, [r4, #84]	@ 0x54
   bafe8:	e5940058 	ldr	r0, [r4, #88]	@ 0x58
   bafec:	e3500000 	cmp	r0, #0
   baff0:	0a000002 	beq	bb000 <mixerengine::Isolator::initialize()+0x80>
   baff4:	ebfd501c 	bl	f06c <operator delete[](void*)@plt>
   baff8:	e3a03000 	mov	r3, #0
   baffc:	e5843058 	str	r3, [r4, #88]	@ 0x58
   bb000:	e1a00004 	mov	r0, r4
   bb004:	e5941010 	ldr	r1, [r4, #16]
   bb008:	e8bd4010 	pop	{r4, lr}
   bb00c:	eaffff8f 	b	bae50 <mixerengine::Isolator::initResources(int)>

000bb010 <mixerengine::Isolator::finResources()>:
   bb010:	e92d4010 	push	{r4, lr}
   bb014:	e1a04000 	mov	r4, r0
   bb018:	e590005c 	ldr	r0, [r0, #92]	@ 0x5c
   bb01c:	e3500000 	cmp	r0, #0
   bb020:	0a000002 	beq	bb030 <mixerengine::Isolator::finResources()+0x20>
   bb024:	ebfd5010 	bl	f06c <operator delete[](void*)@plt>
   bb028:	e3a03000 	mov	r3, #0
   bb02c:	e584305c 	str	r3, [r4, #92]	@ 0x5c
   bb030:	e5940060 	ldr	r0, [r4, #96]	@ 0x60
   bb034:	e3500000 	cmp	r0, #0
   bb038:	0a000002 	beq	bb048 <mixerengine::Isolator::finResources()+0x38>
   bb03c:	ebfd500a 	bl	f06c <operator delete[](void*)@plt>
   bb040:	e3a03000 	mov	r3, #0
   bb044:	e5843060 	str	r3, [r4, #96]	@ 0x60
   bb048:	e5940064 	ldr	r0, [r4, #100]	@ 0x64
   bb04c:	e3500000 	cmp	r0, #0
   bb050:	0a000002 	beq	bb060 <mixerengine::Isolator::finResources()+0x50>
   bb054:	ebfd5004 	bl	f06c <operator delete[](void*)@plt>
   bb058:	e3a03000 	mov	r3, #0
   bb05c:	e5843064 	str	r3, [r4, #100]	@ 0x64
   bb060:	e5940054 	ldr	r0, [r4, #84]	@ 0x54
   bb064:	e3500000 	cmp	r0, #0
   bb068:	0a000002 	beq	bb078 <mixerengine::Isolator::finResources()+0x68>
   bb06c:	ebfd4ffe 	bl	f06c <operator delete[](void*)@plt>
   bb070:	e3a03000 	mov	r3, #0
   bb074:	e5843054 	str	r3, [r4, #84]	@ 0x54
   bb078:	e5940058 	ldr	r0, [r4, #88]	@ 0x58
   bb07c:	e3500000 	cmp	r0, #0
   bb080:	08bd8010 	popeq	{r4, pc}
   bb084:	ebfd4ff8 	bl	f06c <operator delete[](void*)@plt>
