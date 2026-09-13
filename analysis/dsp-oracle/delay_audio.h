#ifndef LAB_DELAY_AUDIO_H
#define LAB_DELAY_AUDIO_H
#include "delay_control.h"
#include "iir_reconstructed.h"
typedef struct {DelayControl control;uint32_t time_ms,on,delay,previous_delay,write_index,ring_length;DelayRamp cross;unsigned quantize_enabled,quantize_checks,time_checks;unsigned injected_time_ms;} DelayAudio;
void delay_audio(DelayAudio *,Stereo *ring,const Stereo *input,Stereo *output,unsigned frames);
#endif
