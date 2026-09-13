#include "echo_audio.h"
#include <string.h>
#include <math.h>
#ifdef ECHO_NATIVE_QUANTIZE
extern void echo_post_block(EchoAudio *);
#endif
static float fz(float x){uint32_t u;memcpy(&u,&x,4);if((u&0x7f800000)==0){u&=0x80000000;memcpy(&x,&u,4);}return x;}
static float add(float a,float b){return fz(fz(a)+fz(b));}
static float sub(float a,float b){return fz(fz(a)-fz(b));}
static float mul(float a,float b){return fz(fz(a)*fz(b));}
static void tick(EchoRamp *r){if(r->done)return;for(int k=0;k<2;k++)r->current[k]=add(r->current[k],r->step[k]);if(r->count>=r->length){memcpy(r->current,r->target,8);r->done=1;}r->count++;}
static void snap(EchoRamp *r,float value){for(int k=0;k<2;k++){r->current[k]=value;r->target[k]=value;r->step[k]=0;}}
static void start(EchoRamp *r){snap(r,0);for(int k=0;k<2;k++){r->target[k]=1;r->step[k]=mul(1,r->inverse);}r->count=0;r->done=0;}
static void retarget(EchoRamp *r,float v){for(int k=0;k<2;k++){r->target[k]=v;r->step[k]=mul(sub(v,add(r->current[k],r->step[k])),r->inverse);}r->count=0;r->done=0;}
static uint32_t delay_for(uint32_t ms){return ((uint32_t)floor((double)(ms<<1)*44.1)+1)>>1;}
void echo_audio(EchoAudio *s,Stereo *ring,const Stereo *in,Stereo *out,unsigned n){
 EchoControl *c=&s->control;int increment=0,suppress=0;
 if(c->counter==0){s->write_index=0;c->time_changed=1;start(&c->gate);s->delay=s->previous_delay=delay_for(s->time_ms);snap(&s->cross,0);}
 int32_t age=(int32_t)c->counter>>1;
 if(age<(int32_t)c->max_samples){
  increment=1;
  if(age<=(int32_t)s->delay){
   if(!(c->counter&1)){snap(&c->dry,1);snap(&c->wet,0);suppress=1;}
   else if((c->dry.target[0]+c->dry.target[1])*.5f<1)retarget(&c->dry,1);
  }else if(age<=(int32_t)(s->delay+n))echo_control(c,ECHO_DEPTH);
 }
 uint32_t desired=s->delay;
 if(c->time_changed){desired=delay_for(s->time_ms);if(desired==s->delay)c->time_changed=0;}
 for(unsigned i=0;i<n;i++){
  int ix=(int)s->write_index-(int)s->delay;if(ix<0)ix+=(int)s->ring_length;
  int prev=(int)s->write_index-(int)s->previous_delay;if(prev<0)prev+=(int)s->ring_length;
  Stereo d=ring[ix],old=ring[prev];
  if(increment){if(suppress){if((int32_t)s->delay<=((int32_t)c->counter>>1))suppress=0;else d=old=(Stereo){0,0};}c->counter+=2;}
  if(!s->cross.done){d.l=add(old.l,mul(sub(d.l,old.l),s->cross.current[0]));d.r=add(old.r,mul(sub(d.r,old.r),s->cross.current[1]));tick(&s->cross);}
  else if(c->time_changed&&!suppress){c->time_changed=0;start(&s->cross);s->previous_delay=s->delay;s->delay=desired;}
  float gate[2]={c->gate.current[0],c->gate.current[1]};
  Stereo feedback={add(mul(in[i].l,gate[0]),mul(d.l,s->feedback.l)),add(mul(in[i].r,gate[1]),mul(d.r,s->feedback.r))};
  tick(&c->gate);
  Stereo dry={mul(in[i].l,c->dry.current[0]),mul(in[i].r,c->dry.current[1])};
  if(!s->on||(c->counter&1)){dry.l=mul(dry.l,gate[0]);dry.r=mul(dry.r,gate[1]);}
  out[i]=(Stereo){add(dry.l,mul(d.l,c->wet.current[0])),add(dry.r,mul(d.r,c->wet.current[1]))};
  tick(&c->dry);tick(&c->wet);ring[s->write_index]=feedback;
  s->write_index++;if(s->write_index>=s->ring_length)s->write_index-=s->ring_length;
 }
 /* Harness-mode external hooks: order is tested, native quantize logic pending. */
#ifdef ECHO_NATIVE_QUANTIZE
 echo_post_block(s);
#else
 s->quantize_checks++;
 if(s->quantize_enabled){s->time_checks++;if(s->injected_time_ms){s->time_ms=s->injected_time_ms;c->time_changed=1;}}
#endif
}
