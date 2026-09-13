#ifndef LAB_ECHO_AUDIO_H
#define LAB_ECHO_AUDIO_H
#include "echo_control.h"
#include "iir_reconstructed.h"
typedef struct {EchoControl control;uint32_t time_ms,on,delay,previous_delay,write_index,ring_length;EchoRamp cross;Stereo feedback;unsigned quantize_enabled,quantize_checks,time_checks;unsigned injected_time_ms;} EchoAudio;
void echo_audio(EchoAudio *,Stereo *ring,const Stereo *input,Stereo *output,unsigned frames);
#endif
