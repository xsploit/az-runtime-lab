#include "beat_delay.h"
#include <string.h>
#include <math.h>
static float fz(float x){uint32_t u;memcpy(&u,&x,4);if((u&0x7f800000)==0){u&=0x80000000;memcpy(&x,&u,4);}return x;}
static float add(float a,float b){return fz(fz(a)+fz(b));}
static float sub(float a,float b){return fz(fz(a)-fz(b));}
static float mul(float a,float b){return fz(fz(a)*fz(b));}
static void tick(DelayRamp *r){if(r->done)return;for(int k=0;k<2;k++)r->current[k]=add(r->current[k],r->step[k]);if(r->count>=r->length){memcpy(r->current,r->target,8);r->done=1;}r->count++;}
static void snap(DelayRamp *r,float value){for(int k=0;k<2;k++){r->current[k]=value;r->target[k]=value;r->step[k]=0;}}
static void start(DelayRamp *r){snap(r,0);for(int k=0;k<2;k++){r->target[k]=1;r->step[k]=mul(1,r->inverse);}r->count=0;r->done=0;}
static uint32_t delay_for(uint32_t ms){return ((uint32_t)floor((double)(ms<<1)*44.1)+1)>>1;}
void beat_delay_process(DelayAudio *s,DelayQuantize *q,DelayPlayerFixture *player,Stereo *ring,const Stereo *in,Stereo *out,unsigned n){
 DelayControl *c=&s->control;int increment=0,suppress=0;
 if(c->counter==0){s->write_index=0;c->time_changed=1;start(&c->gate);s->delay=s->previous_delay=delay_for(s->time_ms);snap(&s->cross,0);}
 int32_t age=(int32_t)c->counter;
 if(age<(int32_t)c->max_samples){
  increment=1;
  if(age<=(int32_t)s->delay){
   snap(&c->dry,1);snap(&c->wet,0);suppress=1;
  }else if(age<=(int32_t)(s->delay+n))delay_control(c,DELAY_DEPTH);
 }
 for(unsigned i=0;i<n;i++){
  int ix=(int)s->write_index-(int)s->delay;if(ix<0)ix+=(int)s->ring_length;
  int prev=(int)s->write_index-(int)s->previous_delay;if(prev<0)prev+=(int)s->ring_length;
  Stereo d=ring[ix],old=ring[prev];
  if(increment){if(suppress){if((int32_t)s->delay<=((int32_t)c->counter))suppress=0;else d=old=(Stereo){0,0};}c->counter++;}
  if(!s->cross.done){d.l=add(old.l,mul(sub(d.l,old.l),s->cross.current[0]));d.r=add(old.r,mul(sub(d.r,old.r),s->cross.current[1]));tick(&s->cross);}
  else if(c->time_changed){if(!suppress){c->time_changed=0;start(&s->cross);s->previous_delay=s->delay;}s->delay=delay_for(s->time_ms);}
  float gate[2]={c->gate.current[0],c->gate.current[1]};
  Stereo gated={mul(in[i].l,gate[0]),mul(in[i].r,gate[1])};
  tick(&c->gate);
  Stereo dry={mul(in[i].l,c->dry.current[0]),mul(in[i].r,c->dry.current[1])};
  out[i]=(Stereo){add(dry.l,mul(d.l,c->wet.current[0])),add(dry.r,mul(d.r,c->wet.current[1]))};
  tick(&c->dry);tick(&c->wet);ring[s->write_index]=gated;
  s->write_index++;if(s->write_index>=s->ring_length)s->write_index-=s->ring_length;
 }
 if(delay_quantize_check(q,player))delay_quantize_time(s,q,player);
}
