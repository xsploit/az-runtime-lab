#ifndef LAB_BEAT_MANAGER_ECHO_H
#define LAB_BEAT_MANAGER_ECHO_H
#include "echo_quantize.h"
typedef struct {
 unsigned target,next_target,active,remembered,type,next_type,phase;
 EchoRamp fade,dry,long_ramp;float depth;
 unsigned beat,next_beat,quantize,force_change,previous_bypass,consumed;
 unsigned off_on;float off_depth;unsigned off_time,off_beat,off_max_time,off_max_beat,bfx_bpm;
} BeatManagerEcho;
void beat_manager_echo_init(BeatManagerEcho *);
void beat_manager_echo_set_beat(BeatManagerEcho *,EchoAudio *,EchoQuantize *,EchoPlayerFixture *,unsigned force_time);
void beat_manager_echo_process(BeatManagerEcho *,EchoAudio *,EchoQuantize *,EchoPlayerFixture *,Stereo *ring,Stereo *in,unsigned frames,unsigned bypass);
#endif
