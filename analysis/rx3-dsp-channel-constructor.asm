
rx3-research/pi-runtime/rbp:     file format elf32-littlearm


Disassembly of section .text:

0009df8c <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)>:
   9df8c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   9df90:	ed2d8b02 	vpush	{d8}
   9df94:	e24dd020 	sub	sp, sp, #32
   9df98:	e1a04000 	mov	r4, r0
   9df9c:	e1a06001 	mov	r6, r1
   9dfa0:	e1a07002 	mov	r7, r2
   9dfa4:	e1a08003 	mov	r8, r3
   9dfa8:	ebfffd5a 	bl	9d518 <mixerengine::InputChannel::InputChannel(djengine::EnMixerInput)>
   9dfac:	e59f23dc 	ldr	r2, [pc, #988]	@ 9e390 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x404>
   9dfb0:	e3a03000 	mov	r3, #0
   9dfb4:	e59f13d8 	ldr	r1, [pc, #984]	@ 9e394 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x408>
   9dfb8:	e58430c8 	str	r3, [r4, #200]	@ 0xc8
   9dfbc:	e28d0010 	add	r0, sp, #16
   9dfc0:	e5842000 	str	r2, [r4]
   9dfc4:	e58430cc 	str	r3, [r4, #204]	@ 0xcc
   9dfc8:	e58430d0 	str	r3, [r4, #208]	@ 0xd0
   9dfcc:	eb0c4c6d 	bl	3b1188 <juce::String::String(char const*)>
   9dfd0:	e3a03000 	mov	r3, #0
   9dfd4:	e58430f0 	str	r3, [r4, #240]	@ 0xf0
   9dfd8:	e59f33b8 	ldr	r3, [pc, #952]	@ 9e398 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x40c>
   9dfdc:	eddf7ae3 	vldr	s15, [pc, #908]	@ 9e370 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3e4>
   9dfe0:	eddf0be0 	vldr	d16, [pc, #896]	@ 9e368 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3dc>
   9dfe4:	e3a02001 	mov	r2, #1
   9dfe8:	edc40b36 	vstr	d16, [r4, #216]	@ 0xd8
   9dfec:	edc40b38 	vstr	d16, [r4, #224]	@ 0xe0
   9dff0:	e5933000 	ldr	r3, [r3]
   9dff4:	ee073a10 	vmov	s14, r3
   9dff8:	eeb88a47 	vcvt.f32.u32	s16, s14
   9dffc:	edc40b3a 	vstr	d16, [r4, #232]	@ 0xe8
   9e000:	e5c420fc 	strb	r2, [r4, #252]	@ 0xfc
   9e004:	eddf0bd7 	vldr	d16, [pc, #860]	@ 9e368 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3dc>
   9e008:	e28d0010 	add	r0, sp, #16
   9e00c:	edc40b3a 	vstr	d16, [r4, #232]	@ 0xe8
   9e010:	edc40b38 	vstr	d16, [r4, #224]	@ 0xe0
   9e014:	edc40b36 	vstr	d16, [r4, #216]	@ 0xd8
   9e018:	ee287a27 	vmul.f32	s14, s16, s15
   9e01c:	eddf7ad4 	vldr	s15, [pc, #848]	@ 9e374 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3e8>
   9e020:	eec77a27 	vdiv.f32	s15, s14, s15
   9e024:	eefc7ae7 	vcvt.u32.f32	s15, s15
   9e028:	ee173a90 	vmov	r3, s15
   9e02c:	e3530000 	cmp	r3, #0
   9e030:	edc47a3d 	vstr	s15, [r4, #244]	@ 0xf4
   9e034:	058420f4 	streq	r2, [r4, #244]	@ 0xf4
   9e038:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   9e03c:	1ef87a67 	vcvtne.f32.u32	s15, s15
   9e040:	1ec77a27 	vdivne.f32	s15, s14, s15
   9e044:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   9e048:	edc47a3e 	vstr	s15, [r4, #248]	@ 0xf8
   9e04c:	eb0c4b47 	bl	3b0d70 <juce::String::~String()>
   9e050:	e3a03001 	mov	r3, #1
   9e054:	e28d0014 	add	r0, sp, #20
   9e058:	e5843100 	str	r3, [r4, #256]	@ 0x100
   9e05c:	e5843104 	str	r3, [r4, #260]	@ 0x104
   9e060:	e3a03000 	mov	r3, #0
   9e064:	e59f1330 	ldr	r1, [pc, #816]	@ 9e39c <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x410>
   9e068:	e5843108 	str	r3, [r4, #264]	@ 0x108
   9e06c:	eb0c4c45 	bl	3b1188 <juce::String::String(char const*)>
   9e070:	eef27a04 	vmov.f32	s15, #36	@ 0x41200000  10.0
   9e074:	e3a03000 	mov	r3, #0
   9e078:	e5843128 	str	r3, [r4, #296]	@ 0x128
   9e07c:	eddf0bb9 	vldr	d16, [pc, #740]	@ 9e368 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3dc>
   9e080:	e3a02001 	mov	r2, #1
   9e084:	edc40b44 	vstr	d16, [r4, #272]	@ 0x110
   9e088:	edc40b46 	vstr	d16, [r4, #280]	@ 0x118
   9e08c:	edc40b48 	vstr	d16, [r4, #288]	@ 0x120
   9e090:	e5c42134 	strb	r2, [r4, #308]	@ 0x134
   9e094:	f2c70f10 	vmov.f32	d16, #1	@ 0x3f800000
   9e098:	e28d0014 	add	r0, sp, #20
   9e09c:	edc40b48 	vstr	d16, [r4, #288]	@ 0x120
   9e0a0:	edc40b46 	vstr	d16, [r4, #280]	@ 0x118
   9e0a4:	eddf0baf 	vldr	d16, [pc, #700]	@ 9e368 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3dc>
   9e0a8:	edc40b44 	vstr	d16, [r4, #272]	@ 0x110
   9e0ac:	e2845f4f 	add	r5, r4, #316	@ 0x13c
   9e0b0:	ee287a27 	vmul.f32	s14, s16, s15
   9e0b4:	eddf7aae 	vldr	s15, [pc, #696]	@ 9e374 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3e8>
   9e0b8:	eec77a27 	vdiv.f32	s15, s14, s15
   9e0bc:	eefc7ae7 	vcvt.u32.f32	s15, s15
   9e0c0:	ee173a90 	vmov	r3, s15
   9e0c4:	e3530000 	cmp	r3, #0
   9e0c8:	edc47a4b 	vstr	s15, [r4, #300]	@ 0x12c
   9e0cc:	0584212c 	streq	r2, [r4, #300]	@ 0x12c
   9e0d0:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   9e0d4:	1ef87a67 	vcvtne.f32.u32	s15, s15
   9e0d8:	1ec77a27 	vdivne.f32	s15, s14, s15
   9e0dc:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   9e0e0:	edc47a4c 	vstr	s15, [r4, #304]	@ 0x130
   9e0e4:	eb0c4b21 	bl	3b0d70 <juce::String::~String()>
   9e0e8:	e3a03000 	mov	r3, #0
   9e0ec:	e1560003 	cmp	r6, r3
   9e0f0:	e5843138 	str	r3, [r4, #312]	@ 0x138
   9e0f4:	e1a00005 	mov	r0, r5
   9e0f8:	e3a02001 	mov	r2, #1
   9e0fc:	13a01087 	movne	r1, #135	@ 0x87
   9e100:	03a01086 	moveq	r1, #134	@ 0x86
   9e104:	e3a0c01e 	mov	ip, #30
   9e108:	e58dc000 	str	ip, [sp]
   9e10c:	ebfe2af1 	bl	28cd8 <common::GpioManager::GpioManager(unsigned int, common::GpioManager::EnDirection, common::GpioCallback*, unsigned long)>
   9e110:	e3a03000 	mov	r3, #0
   9e114:	e28d0018 	add	r0, sp, #24
   9e118:	e58431b0 	str	r3, [r4, #432]	@ 0x1b0
   9e11c:	e3a03001 	mov	r3, #1
   9e120:	e59f1278 	ldr	r1, [pc, #632]	@ 9e3a0 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x414>
   9e124:	e5c431b4 	strb	r3, [r4, #436]	@ 0x1b4
   9e128:	eb0c4c16 	bl	3b1188 <juce::String::String(char const*)>
   9e12c:	eddf7a91 	vldr	s15, [pc, #580]	@ 9e378 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3ec>
   9e130:	ee287a27 	vmul.f32	s14, s16, s15
   9e134:	eddf7a8e 	vldr	s15, [pc, #568]	@ 9e374 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3e8>
   9e138:	e3a03000 	mov	r3, #0
   9e13c:	e58431d0 	str	r3, [r4, #464]	@ 0x1d0
   9e140:	eddf0b88 	vldr	d16, [pc, #544]	@ 9e368 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3dc>
   9e144:	e3a02001 	mov	r2, #1
   9e148:	edc40b6e 	vstr	d16, [r4, #440]	@ 0x1b8
   9e14c:	edc40b70 	vstr	d16, [r4, #448]	@ 0x1c0
   9e150:	edc40b72 	vstr	d16, [r4, #456]	@ 0x1c8
   9e154:	e5c421dc 	strb	r2, [r4, #476]	@ 0x1dc
   9e158:	eddf0b82 	vldr	d16, [pc, #520]	@ 9e368 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3dc>
   9e15c:	e28d0018 	add	r0, sp, #24
   9e160:	edc40b72 	vstr	d16, [r4, #456]	@ 0x1c8
   9e164:	edc40b70 	vstr	d16, [r4, #448]	@ 0x1c0
   9e168:	edc40b6e 	vstr	d16, [r4, #440]	@ 0x1b8
   9e16c:	eec77a27 	vdiv.f32	s15, s14, s15
   9e170:	eefc7ae7 	vcvt.u32.f32	s15, s15
   9e174:	ee173a90 	vmov	r3, s15
   9e178:	e3530000 	cmp	r3, #0
   9e17c:	edc47a75 	vstr	s15, [r4, #468]	@ 0x1d4
   9e180:	058421d4 	streq	r2, [r4, #468]	@ 0x1d4
   9e184:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   9e188:	1ef87a67 	vcvtne.f32.u32	s15, s15
   9e18c:	1ec77a27 	vdivne.f32	s15, s14, s15
   9e190:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   9e194:	edc47a76 	vstr	s15, [r4, #472]	@ 0x1d8
   9e198:	eb0c4af4 	bl	3b0d70 <juce::String::~String()>
   9e19c:	e3a03000 	mov	r3, #0
   9e1a0:	e28d001c 	add	r0, sp, #28
   9e1a4:	e5c431e4 	strb	r3, [r4, #484]	@ 0x1e4
   9e1a8:	e59f11f4 	ldr	r1, [pc, #500]	@ 9e3a4 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x418>
   9e1ac:	eb0c4bf5 	bl	3b1188 <juce::String::String(char const*)>
   9e1b0:	eddf7a71 	vldr	s15, [pc, #452]	@ 9e37c <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3f0>
   9e1b4:	ee287a27 	vmul.f32	s14, s16, s15
   9e1b8:	eddf7a6d 	vldr	s15, [pc, #436]	@ 9e374 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3e8>
   9e1bc:	e3a03000 	mov	r3, #0
   9e1c0:	e5843200 	str	r3, [r4, #512]	@ 0x200
   9e1c4:	eddf0b67 	vldr	d16, [pc, #412]	@ 9e368 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3dc>
   9e1c8:	e3a02001 	mov	r2, #1
   9e1cc:	edc40b7a 	vstr	d16, [r4, #488]	@ 0x1e8
   9e1d0:	edc40b7c 	vstr	d16, [r4, #496]	@ 0x1f0
   9e1d4:	edc40b7e 	vstr	d16, [r4, #504]	@ 0x1f8
   9e1d8:	e5c4220c 	strb	r2, [r4, #524]	@ 0x20c
   9e1dc:	eddf0b61 	vldr	d16, [pc, #388]	@ 9e368 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3dc>
   9e1e0:	e28d001c 	add	r0, sp, #28
   9e1e4:	edc40b7e 	vstr	d16, [r4, #504]	@ 0x1f8
   9e1e8:	edc40b7c 	vstr	d16, [r4, #496]	@ 0x1f0
   9e1ec:	edc40b7a 	vstr	d16, [r4, #488]	@ 0x1e8
   9e1f0:	eec77a27 	vdiv.f32	s15, s14, s15
   9e1f4:	eefc7ae7 	vcvt.u32.f32	s15, s15
   9e1f8:	ee173a90 	vmov	r3, s15
   9e1fc:	e3530000 	cmp	r3, #0
   9e200:	edc47a81 	vstr	s15, [r4, #516]	@ 0x204
   9e204:	05842204 	streq	r2, [r4, #516]	@ 0x204
   9e208:	1eb77a00 	vmovne.f32	s14, #112	@ 0x3f800000  1.0
   9e20c:	1ef87a67 	vcvtne.f32.u32	s15, s15
   9e210:	1ec77a27 	vdivne.f32	s15, s14, s15
   9e214:	0ef77a00 	vmoveq.f32	s15, #112	@ 0x3f800000  1.0
   9e218:	edc47a82 	vstr	s15, [r4, #520]	@ 0x208
   9e21c:	eb0c4ad3 	bl	3b0d70 <juce::String::~String()>
   9e220:	e59d3040 	ldr	r3, [sp, #64]	@ 0x40
   9e224:	e5847210 	str	r7, [r4, #528]	@ 0x210
   9e228:	e3a0004c 	mov	r0, #76	@ 0x4c
   9e22c:	e5848214 	str	r8, [r4, #532]	@ 0x214
   9e230:	e5843218 	str	r3, [r4, #536]	@ 0x218
   9e234:	ebfdc03b 	bl	e328 <operator new(unsigned int)@plt>
   9e238:	e1a06000 	mov	r6, r0
   9e23c:	eb006f89 	bl	ba068 <mixerengine::Equalizer::Equalizer()>
   9e240:	e58461a4 	str	r6, [r4, #420]	@ 0x1a4
   9e244:	e3a00078 	mov	r0, #120	@ 0x78
   9e248:	ebfdc036 	bl	e328 <operator new(unsigned int)@plt>
   9e24c:	e1a06000 	mov	r6, r0
   9e250:	eb0071c8 	bl	ba978 <mixerengine::Isolator::Isolator()>
   9e254:	e59431a4 	ldr	r3, [r4, #420]	@ 0x1a4
   9e258:	e58461a8 	str	r6, [r4, #424]	@ 0x1a8
   9e25c:	e59400cc 	ldr	r0, [r4, #204]	@ 0xcc
   9e260:	e58431ac 	str	r3, [r4, #428]	@ 0x1ac
   9e264:	e5941014 	ldr	r1, [r4, #20]
   9e268:	ebff9d46 	bl	85788 <djengine::MixerRouteMngr::setRoute(djengine::EnPlayerChannel, djengine::EnMixerInput)>
   9e26c:	e5941104 	ldr	r1, [r4, #260]	@ 0x104
   9e270:	e1a00005 	mov	r0, r5
   9e274:	e2711001 	rsbs	r1, r1, #1
   9e278:	33a01000 	movcc	r1, #0
   9e27c:	ebfe2b1e 	bl	28efc <common::GpioManager::write(bool)>
   9e280:	e59430cc 	ldr	r3, [r4, #204]	@ 0xcc
   9e284:	e3530008 	cmp	r3, #8
   9e288:	9a000017 	bls	9e2ec <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x360>
   9e28c:	eddf7a3b 	vldr	s15, [pc, #236]	@ 9e380 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3f4>
   9e290:	edd41b36 	vldr	d17, [r4, #216]	@ 0xd8
   9e294:	edd42b3a 	vldr	d18, [r4, #232]	@ 0xe8
   9e298:	f2421da1 	vadd.f32	d17, d18, d17
   9e29c:	f3fc0c07 	vdup.32	d16, d7[1]
   9e2a0:	e59430f8 	ldr	r3, [r4, #248]	@ 0xf8
   9e2a4:	edc40b38 	vstr	d16, [r4, #224]	@ 0xe0
   9e2a8:	e3a00088 	mov	r0, #136	@ 0x88
   9e2ac:	f2601da1 	vsub.f32	d17, d16, d17
   9e2b0:	ee823b90 	vdup.32	d18, r3
   9e2b4:	e3a03000 	mov	r3, #0
   9e2b8:	e58430f0 	str	r3, [r4, #240]	@ 0xf0
   9e2bc:	e5c430fc 	strb	r3, [r4, #252]	@ 0xfc
   9e2c0:	f3410db2 	vmul.f32	d16, d17, d18
   9e2c4:	edc40b36 	vstr	d16, [r4, #216]	@ 0xd8
   9e2c8:	ebfdc016 	bl	e328 <operator new(unsigned int)@plt>
   9e2cc:	e1a01004 	mov	r1, r4
   9e2d0:	e1a06000 	mov	r6, r0
   9e2d4:	eb0075a5 	bl	bb970 <mixerengine::SoundColorFxManager::SoundColorFxManager(mixerengine::MixerChannel*)>
   9e2d8:	e58461e0 	str	r6, [r4, #480]	@ 0x1e0
   9e2dc:	e1a00004 	mov	r0, r4
   9e2e0:	e28dd020 	add	sp, sp, #32
   9e2e4:	ecbd8b02 	vpop	{d8}
   9e2e8:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
   9e2ec:	e3a01001 	mov	r1, #1
   9e2f0:	e3002183 	movw	r2, #387	@ 0x183
   9e2f4:	e1a03311 	lsl	r3, r1, r3
   9e2f8:	e0032002 	and	r2, r3, r2
   9e2fc:	e3520000 	cmp	r2, #0
   9e300:	1ddf7a1f 	vldrne	s15, [pc, #124]	@ 9e384 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3f8>
   9e304:	1affffe1 	bne	9e290 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x304>
   9e308:	e3130030 	tst	r3, #48	@ 0x30
   9e30c:	0affffde 	beq	9e28c <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x300>
   9e310:	e5943104 	ldr	r3, [r4, #260]	@ 0x104
   9e314:	eddf7a1b 	vldr	s15, [pc, #108]	@ 9e388 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3fc>
   9e318:	ed9f7a1b 	vldr	s14, [pc, #108]	@ 9e38c <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x400>
   9e31c:	e3530001 	cmp	r3, #1
   9e320:	1ef07a47 	vmovne.f32	s15, s14
   9e324:	eaffffd9 	b	9e290 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x304>
   9e328:	e1a00006 	mov	r0, r6
   9e32c:	ebfdc267 	bl	ecd0 <operator delete(void*)@plt>
   9e330:	e1a00005 	mov	r0, r5
   9e334:	ebfe2a0f 	bl	28b78 <common::GpioManager::~GpioManager()>
   9e338:	e1a00004 	mov	r0, r4
   9e33c:	ebfffbe3 	bl	9d2d0 <mixerengine::InputChannel::~InputChannel()>
   9e340:	ebfdc2dd 	bl	eebc <__cxa_end_cleanup@plt>
   9e344:	eafffff7 	b	9e328 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x39c>
   9e348:	eafffff6 	b	9e328 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x39c>
   9e34c:	eafffff7 	b	9e330 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3a4>
   9e350:	eafffff6 	b	9e330 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3a4>
   9e354:	eafffff5 	b	9e330 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3a4>
   9e358:	eafffff6 	b	9e338 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3ac>
   9e35c:	eafffff5 	b	9e338 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3ac>
   9e360:	eafffff4 	b	9e338 <mixerengine::MixerChannel::MixerChannel(djengine::EnMixerInput, djengine::EnBeatEffectSelectChannel, djengine::EnBeatEffectSelectChannel, mixerengine::BeatEffectManager&)+0x3ac>
   9e364:	e320f000 	nop	{0}
	...
   9e370:	40551eb8 	.word	0x40551eb8
   9e374:	447a0000 	.word	0x447a0000
   9e378:	4039999a 	.word	0x4039999a
   9e37c:	40533333 	.word	0x40533333
   9e380:	00000000 	.word	0x00000000
   9e384:	3f2d46d1 	.word	0x3f2d46d1
   9e388:	3f7a2c38 	.word	0x3f7a2c38
   9e38c:	40508916 	.word	0x40508916
   9e390:	00423a30 	.word	0x00423a30
   9e394:	00423aa0 	.word	0x00423aa0
   9e398:	004172c0 	.word	0x004172c0
   9e39c:	00423ab0 	.word	0x00423ab0
   9e3a0:	00423ac4 	.word	0x00423ac4
   9e3a4:	00423ad8 	.word	0x00423ad8

0009e3a8 <mixerengine::MixerChannel::changeEqualizerMode(djengine::EnEqualizerMode)>:
   9e3a8:	e3510002 	cmp	r1, #2
   9e3ac:	e92d4008 	push	{r3, lr}
   9e3b0:	08bd8008 	popeq	{r3, pc}
   9e3b4:	e3510000 	cmp	r1, #0
   9e3b8:	1a000006 	bne	9e3d8 <mixerengine::MixerChannel::changeEqualizerMode(djengine::EnEqualizerMode)+0x30>
   9e3bc:	e59021a4 	ldr	r2, [r0, #420]	@ 0x1a4
   9e3c0:	e5923000 	ldr	r3, [r2]
   9e3c4:	e58021ac 	str	r2, [r0, #428]	@ 0x1ac
   9e3c8:	e1a00002 	mov	r0, r2
   9e3cc:	e5933014 	ldr	r3, [r3, #20]
   9e3d0:	e12fff33 	blx	r3
   9e3d4:	e8bd8008 	pop	{r3, pc}
   9e3d8:	e3510001 	cmp	r1, #1
   9e3dc:	18bd8008 	popne	{r3, pc}
   9e3e0:	e59021a8 	ldr	r2, [r0, #424]	@ 0x1a8
   9e3e4:	e5923000 	ldr	r3, [r2]
   9e3e8:	e58021ac 	str	r2, [r0, #428]	@ 0x1ac
   9e3ec:	e1a00002 	mov	r0, r2
   9e3f0:	e5933014 	ldr	r3, [r3, #20]
   9e3f4:	e12fff33 	blx	r3
   9e3f8:	e8bd8008 	pop	{r3, pc}
