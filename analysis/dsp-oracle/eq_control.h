#ifndef RX3_EQ_CONTROL_H
#define RX3_EQ_CONTROL_H
#include <stdint.h>
typedef struct { int32_t step,magnitude,timing,target,current,count; uint8_t done,pad[3]; } EqIndexRamp;
typedef struct { float step[2],target[2],current[2]; uint32_t count,length; float inverse; uint8_t done,pad[3]; } EqGainRamp;
/* Normalized finite input and band 0..2 are caller preconditions. */
void eq_index_target(EqIndexRamp *,float);
void eq_gain_target(EqGainRamp *,float,const float[256]);
#endif
