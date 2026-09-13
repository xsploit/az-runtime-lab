#include "eq_control.h"
#include <string.h>
static float fz(float x){uint32_t u;memcpy(&u,&x,4);if(!(u&0x7f800000u)){u&=0x80000000u;memcpy(&x,&u,4);}return x;}
void eq_index_target(EqIndexRamp *s,float value){
 unsigned index=(uint16_t)(uint32_t)(.5f+value*255.f);
 if((int32_t)index==s->target)return;
 s->target=(int32_t)index;s->step=s->target>s->current?s->magnitude:-s->magnitude;
 s->count=0;s->done=0;
}
void eq_gain_target(EqGainRamp *s,float value,const float table[256]){
 int index=(int32_t)(.5f+value*255.f);float gain=table[index];
 for(unsigned i=0;i<2;i++){
  float upcoming=fz(fz(s->current[i])+fz(s->step[i]));
  float difference=fz(fz(gain)-upcoming);
  s->target[i]=gain;s->step[i]=fz(difference*fz(s->inverse));
 }
 s->count=0;s->done=0;
}
