
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

00056e14 <mixerengine::MixerEngine::setDigitalTrim(djengine::EnMixerInput, float)>:
   56e14:	e52d4004 	push	{r4}		@ (str r4, [sp, #-4]!)
   56e18:	e1a03001 	mov	r3, r1
   56e1c:	e1a01002 	mov	r1, r2
   56e20:	e8900014 	ldm	r0, {r2, r4}
   56e24:	e1520004 	cmp	r2, r4
   56e28:	0a000008 	beq	56e50 <mixerengine::MixerEngine::setDigitalTrim(djengine::EnMixerInput, float)+0x3c>
   56e2c:	e4920004 	ldr	r0, [r2], #4
   56e30:	e3500000 	cmp	r0, #0
   56e34:	0afffffa 	beq	56e24 <mixerengine::MixerEngine::setDigitalTrim(djengine::EnMixerInput, float)+0x10>
   56e38:	e590c014 	ldr	ip, [r0, #20]
   56e3c:	e153000c 	cmp	r3, ip
   56e40:	1afffff7 	bne	56e24 <mixerengine::MixerEngine::setDigitalTrim(djengine::EnMixerInput, float)+0x10>
   56e44:	e2800028 	add	r0, r0, #40	@ 0x28
   56e48:	e8bd0010 	ldmfd	sp!, {r4}
   56e4c:	ea011739 	b	9cb38 <mixerengine::Trim::setValue(float)>
   56e50:	e8bd0010 	ldmfd	sp!, {r4}
   56e54:	e12fff1e 	bx	lr

00056e58 <mixerengine::MixerEngine::getDigitalTrim(djengine::EnMixerInput)>:
   56e58:	e8901008 	ldm	r0, {r3, ip}
   56e5c:	e153000c 	cmp	r3, ip
   56e60:	0a000007 	beq	56e84 <mixerengine::MixerEngine::getDigitalTrim(djengine::EnMixerInput)+0x2c>
   56e64:	e4932004 	ldr	r2, [r3], #4
   56e68:	e3520000 	cmp	r2, #0
   56e6c:	0afffffa 	beq	56e5c <mixerengine::MixerEngine::getDigitalTrim(djengine::EnMixerInput)+0x4>
   56e70:	e5920014 	ldr	r0, [r2, #20]
   56e74:	e1510000 	cmp	r1, r0
   56e78:	1afffff7 	bne	56e5c <mixerengine::MixerEngine::getDigitalTrim(djengine::EnMixerInput)+0x4>
   56e7c:	e5920028 	ldr	r0, [r2, #40]	@ 0x28
   56e80:	e12fff1e 	bx	lr
   56e84:	e3a00000 	mov	r0, #0
   56e88:	e12fff1e 	bx	lr

00056e8c <mixerengine::MixerEngine::setDigitalTrimforSim(djengine::EnMixerInput, float, int)>:
   56e8c:	e92d0030 	push	{r4, r5}
   56e90:	e1a0c001 	mov	ip, r1
   56e94:	e1a01002 	mov	r1, r2
   56e98:	e1a02003 	mov	r2, r3
   56e9c:	e8900028 	ldm	r0, {r3, r5}
   56ea0:	e1530005 	cmp	r3, r5
   56ea4:	0a000008 	beq	56ecc <mixerengine::MixerEngine::setDigitalTrimforSim(djengine::EnMixerInput, float, int)+0x40>
   56ea8:	e4930004 	ldr	r0, [r3], #4
   56eac:	e3500000 	cmp	r0, #0
   56eb0:	0afffffa 	beq	56ea0 <mixerengine::MixerEngine::setDigitalTrimforSim(djengine::EnMixerInput, float, int)+0x14>
   56eb4:	e5904014 	ldr	r4, [r0, #20]
   56eb8:	e15c0004 	cmp	ip, r4
   56ebc:	1afffff7 	bne	56ea0 <mixerengine::MixerEngine::setDigitalTrimforSim(djengine::EnMixerInput, float, int)+0x14>
   56ec0:	e2800028 	add	r0, r0, #40	@ 0x28
   56ec4:	e8bd0030 	pop	{r4, r5}
   56ec8:	ea011734 	b	9cba0 <mixerengine::Trim::setValueForSim(float, int)>
   56ecc:	e8bd0030 	pop	{r4, r5}
   56ed0:	e12fff1e 	bx	lr

00056ed4 <mixerengine::MixerEngine::setChannelFader(djengine::EnMixerInput, float)>:
   56ed4:	e52d4004 	push	{r4}		@ (str r4, [sp, #-4]!)
   56ed8:	e1a03001 	mov	r3, r1
   56edc:	e1a01002 	mov	r1, r2
   56ee0:	e8900014 	ldm	r0, {r2, r4}
   56ee4:	e1520004 	cmp	r2, r4
   56ee8:	0a000008 	beq	56f10 <mixerengine::MixerEngine::setChannelFader(djengine::EnMixerInput, float)+0x3c>
   56eec:	e4920004 	ldr	r0, [r2], #4
   56ef0:	e3500000 	cmp	r0, #0
   56ef4:	0afffffa 	beq	56ee4 <mixerengine::MixerEngine::setChannelFader(djengine::EnMixerInput, float)+0x10>
   56ef8:	e590c014 	ldr	ip, [r0, #20]
   56efc:	e153000c 	cmp	r3, ip
   56f00:	1afffff7 	bne	56ee4 <mixerengine::MixerEngine::setChannelFader(djengine::EnMixerInput, float)+0x10>
   56f04:	e2800060 	add	r0, r0, #96	@ 0x60
   56f08:	e8bd0010 	ldmfd	sp!, {r4}
   56f0c:	ea011310 	b	9bb54 <mixerengine::ChannelFader::setFader(float)>
   56f10:	e8bd0010 	ldmfd	sp!, {r4}
   56f14:	e12fff1e 	bx	lr
