#ifndef LAB_BEAT_ECHO_PORT_H
#define LAB_BEAT_ECHO_PORT_H
#include "../echo_quantize.h"
/* Isolated production candidate: explicit per-instance player/grid context. */
void beat_echo_process(EchoAudio *,EchoQuantize *,EchoPlayerFixture *,Stereo *ring,const Stereo *in,Stereo *out,unsigned frames);
#endif
