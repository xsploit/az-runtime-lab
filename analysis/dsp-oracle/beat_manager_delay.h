#ifndef LAB_BEAT_MANAGER_DELAY_H
#define LAB_BEAT_MANAGER_DELAY_H
#include "delay_quantize.h"
typedef struct {
 unsigned target,next_target,active,remembered,type,next_type,phase;
 DelayRamp fade,dry,long_ramp;float depth;
 unsigned beat,next_beat,quantize,force_change,previous_bypass,consumed;
 unsigned off_on;float off_depth;unsigned off_time,off_beat,off_max_time,off_max_beat,bfx_bpm;
} BeatManagerDelay;
void beat_manager_delay_init(BeatManagerDelay *);
void beat_manager_delay_set_beat(BeatManagerDelay *,DelayAudio *,DelayQuantize *,DelayPlayerFixture *,unsigned force_time);
void beat_manager_delay_process(BeatManagerDelay *,DelayAudio *,DelayQuantize *,DelayPlayerFixture *,Stereo *ring,Stereo *in,unsigned frames,unsigned bypass);
#endif
