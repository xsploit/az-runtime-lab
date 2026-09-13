/* Original lab mixer, not recovered Pioneer DSP. No allocation or I/O. */
#ifndef LAB_DECK_MIX_H
#define LAB_DECK_MIX_H
#include <stddef.h>
typedef struct {
 float channel_gain[4]; /* 0..1 post-decode fader; no EQ/trim stage yet */
 int cross_assign[4];   /* -1 left, 0 bypass, +1 right */
 unsigned cue_mask;     /* bit0 deck1 ... bit3 deck4; pre-fader cue */
 float cross_position; /* 0 left ... 1 right; equal-power law */
 float master_gain, headphones_gain;
 float cue_master_mix; /* 0 cue sum ... 1 master output */
} LabMix;
int lab_mix_valid(const LabMix *s);
/* Input: AZ ten-channel interleaved float PCM. Output: master L/R, phones L/R.
   Channels9/10 unused. Buffers must not overlap. Summation is unclipped.
   Caller supplies constant settings per block; smoothing is not implemented. */
void lab_mix(const LabMix *s,const float *input,float *output,size_t frames);
/* Stateful smoothing: update from the audio thread at a block boundary.
   Ramp length is in frames, independent of block size; zero means immediate.
   Smooths final routing coefficients, including cue/assignment switches.
   Not thread-safe; caller owns delivery of control snapshots. */
typedef struct {
 float current[8], target[8], step[8];
 size_t remaining;
} LabMixRamp;
int lab_mix_ramp_init(LabMixRamp *r,const LabMix *s);
int lab_mix_ramp_target(LabMixRamp *r,const LabMix *s,size_t frames);
void lab_mix_ramped(LabMixRamp *r,const float *input,float *output,size_t frames);
#endif
