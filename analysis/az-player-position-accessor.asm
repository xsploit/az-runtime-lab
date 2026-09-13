
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

000000000148bba8 <_ZNSt15recursive_mutex4lockEv>:
 1493718:      	mov	x1, x0
 149371c:      	ldrb	w0, [x0, #0x31]
 1493720:      	cbz	w0, 0x149372c <_ZNSt15recursive_mutex4lockEv+0x7b84>
 1493724:      	ldrb	w0, [x1, #0x32]
 1493728:      	cbnz	w0, 0x1493794 <_ZNSt15recursive_mutex4lockEv+0x7bec>
 149372c:      	add	x0, x1, #0xd0
 1493730:      	ldr	x0, [x0, #0x18]
 1493734:      	mov	x2, #0x7fffffffffffffff // =9223372036854775807
 1493738:      	cmp	x0, x2
 149373c:      	b.eq	0x1493774 <_ZNSt15recursive_mutex4lockEv+0x7bcc>
 1493740:      	scvtf	d0, x0
 1493744:      	ldr	d1, [x1, #0x20]
 1493748:      	fmul	d0, d0, d1
 149374c:      	fcmpe	d0, #0.0
 1493750:      	b.lt	0x1493778 <_ZNSt15recursive_mutex4lockEv+0x7bd0>
 1493754:      	fcvtps	x1, d0
 1493758:      	cmp	x1, #0x0
 149375c:      	ccmp	x0, #0x0, #0x0, eq
 1493760:      	mov	x0, #-0x1               // =-1
 1493764:      	b.lt	0x1493774 <_ZNSt15recursive_mutex4lockEv+0x7bcc>
 1493768:      	cmp	x1, #0x1
 149376c:      	b.eq	0x149378c <_ZNSt15recursive_mutex4lockEv+0x7be4>
 1493770:      	mov	x0, x1
 1493774:      	ret
 1493778:      	fneg	d1, d0
 149377c:      	frintp	d1, d1
 1493780:      	fneg	d1, d1
 1493784:      	fcvtzs	x1, d1
 1493788:      	b	0x1493758 <_ZNSt15recursive_mutex4lockEv+0x7bb0>
 149378c:      	fcvtas	x0, d0
 1493790:      	ret
 1493794:      	add	x0, x1, #0x38
