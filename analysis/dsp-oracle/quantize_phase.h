#ifndef LAB_QUANTIZE_PHASE_H
#define LAB_QUANTIZE_PHASE_H
#include "echo_quantize.h"
typedef struct {EchoQuantize q;uint32_t flag92,aux100,divisor104;int32_t phase_index;} QuantizePhase;
int32_t phase_playing_time(const EchoPlayerFixture *,int32_t position,int32_t frames);
int32_t phase_nearest(QuantizePhase *,EchoPlayerFixture *,int32_t time,unsigned initial);
uint32_t phase_duration(QuantizePhase *,EchoPlayerFixture *,int32_t time,int32_t index);
void phase_check(EchoAudio *,QuantizePhase *,EchoPlayerFixture *,int32_t position);
#endif
