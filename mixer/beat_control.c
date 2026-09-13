#include "beat_echo.h"
#include <string.h>
static float fz(float x){uint32_t u;memcpy(&u,&x,4);if((u&0x7f800000)==0){u&=0x80000000;memcpy(&x,&u,4);}return x;}
static float add(float a,float b){return fz(fz(a)+fz(b));}
static float sub(float a,float b){return fz(fz(a)-fz(b));}
static float mul(float a,float b){return fz(fz(a)*fz(b));}
static void retarget(EchoRamp *r,float target){for(int k=0;k<2;k++){r->target[k]=target;r->step[k]=mul(sub(target,add(r->current[k],r->step[k])),r->inverse);}r->count=0;r->done=0;}
void echo_control(EchoControl *s,unsigned action){
 switch(action){
 case ECHO_INIT:s->counter=0;s->max_samples=s->rate<<3;break;
 case ECHO_KEEP:s->counter=1;break;
 case ECHO_TIME:s->time_changed=1;break;
 case ECHO_ON:
  for(int k=0;k<2;k++){s->gate.current[k]=0;s->gate.target[k]=1;s->gate.step[k]=mul(1,s->gate.inverse);}s->gate.count=0;s->gate.done=0;
  echo_control(s,ECHO_DEPTH);break;
 case ECHO_OFF:retarget(&s->gate,0);break;
 case ECHO_DEPTH:{
  float dry,wet;
  if(s->depth<0.009765625f){dry=1;wet=0;}
  else if(s->depth<0.75f){dry=1;wet=(s->depth-0.009765625f)*0x1.59d62p+0f;}
  else if(s->depth<0.990234375f){wet=1;dry=(0.990234375f-s->depth)*0x1.0a681p+2f;}
  else{dry=0;wet=1;}
  retarget(&s->dry,dry);retarget(&s->wet,wet);break;}
 }
}
