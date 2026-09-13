#include "../beat_manager_delay.h"
#include "beat_delay.h"
#include <math.h>
#include <string.h>
static float fz(float x){uint32_t u;memcpy(&u,&x,4);if(!(u&0x7f800000)){u&=0x80000000;memcpy(&x,&u,4);}return x;}
static float add(float a,float b){return fz(fz(a)+fz(b));}
static float sub(float a,float b){return fz(fz(a)-fz(b));}
static float mul(float a,float b){return fz(fz(a)*fz(b));}
static void tick(DelayRamp *r){for(unsigned k=0;k<2;k++)r->current[k]=add(r->current[k],r->step[k]);if(r->count>=r->length){memcpy(r->current,r->target,8);r->done=1;}r->count++;}
static void snap(DelayRamp *r,float v){for(unsigned k=0;k<2;k++){r->current[k]=r->target[k]=v;r->step[k]=0;}}
static void target(DelayRamp *r,float v){for(unsigned k=0;k<2;k++){r->target[k]=v;r->step[k]=mul(sub(v,add(r->current[k],r->step[k])),r->inverse);}r->count=0;r->done=0;}
static void initr(DelayRamp *r,unsigned n,float v){memset(r,0,sizeof *r);r->length=n;r->inverse=1.0f/(float)n;r->done=1;snap(r,v);}
void beat_manager_delay_init(BeatManagerDelay *m){memset(m,0,sizeof *m);m->remembered=1;m->off_on=1;m->off_time=20;m->off_beat=5;m->off_max_time=64000;m->off_max_beat=11;m->bfx_bpm=12000;m->depth=.8f;m->beat=m->next_beat=5;initr(&m->fade,191,1);initr(&m->dry,191,0);initr(&m->long_ramp,66112,0);}
static void setbeat(BeatManagerDelay *m,DelayAudio *a,DelayQuantize *q,DelayPlayerFixture *p,unsigned effect,unsigned beat,unsigned write_time){
 if(beat>11)return;
 static const float ratios[12]={.0625f,.125f,.25f,.5f,.75f,1,2,4,8,16,32,64};
 if(m->bfx_bpm!=UINT32_MAX){
  float period=m->bfx_bpm<4000?1500.0f:(float)(600000u/((m->bfx_bpm+5)/10));
  unsigned max=effect==1?4000:m->off_max_time;
  for(unsigned guard=0;guard<24;guard++){
   unsigned time=(unsigned)(.5f+period*ratios[beat]);
   if(time<1){if(++beat==12)break;continue;}
   if(time>max){if(beat==0)break;beat--;continue;}
   if(effect==1){q->beat_button=beat;if(write_time)a->time_ms=time;a->control.time_changed=1;}
   else{m->off_beat=beat;if(write_time)m->off_time=time;}
   break;
  }
 }
 if(effect==1&&delay_quantize_check(q,p)){
  delay_quantize_set(a,q,p);
  if(p->channel_valid&&p->beat_present){
   unsigned ix=delay_player_beat_index(p);
   q->last_index=(int32_t)ix;
  }
 }
}
void beat_manager_delay_set_beat(BeatManagerDelay *m,DelayAudio *a,DelayQuantize *q,DelayPlayerFixture *p,unsigned write_time){
 unsigned on=m->active==1?a->on:m->off_on;
 unsigned max=m->active==1?9:m->off_max_beat;
 if(on){if(m->next_beat>max)return;m->beat=m->next_beat;setbeat(m,a,q,p,m->active,m->beat,write_time);setbeat(m,a,q,p,m->remembered,m->beat,write_time);}
 else{if(m->next_beat>m->off_max_beat)return;m->beat=m->next_beat;if(m->beat<=max){setbeat(m,a,q,p,m->active,m->beat,write_time);setbeat(m,a,q,p,m->remembered,m->beat,write_time);}}
}
static void toggle(BeatManagerDelay *m,DelayAudio *a,DelayQuantize *q,DelayPlayerFixture *p,unsigned effect){if(effect==1)delay_effect_set_on(a,q,p,!a->on);else m->off_on=!m->off_on;}
static void notify(DelayAudio *a){a->control.counter=0;delay_control(&a->control,DELAY_ON);}
static void switchtype(BeatManagerDelay *m,DelayAudio *a,DelayQuantize *q,DelayPlayerFixture *p){
 if(m->type==m->next_type)return;
 unsigned old=m->active,selected=m->next_type;float depth=old==1?a->control.depth:m->off_depth;
 /* Native 0x8a434..0x8a450 transfers manual time only for equal beat selections. */
 if((old==0||selected==0)&&m->off_beat==q->beat_button){if(old==0)a->time_ms=m->off_time;else m->off_time=a->time_ms;}
 m->remembered=old;m->type=m->next_type;
 if(selected==1){m->off_max_time=4000;m->off_max_beat=9;setbeat(m,a,q,p,0,q->beat_button,m->quantize);}
 else setbeat(m,a,q,p,0,m->off_beat,m->quantize);
 m->beat=m->next_beat=m->off_beat;
 if(selected==1){m->off_time=a->time_ms;a->control.depth=depth;delay_control(&a->control,DELAY_DEPTH);if(!a->on)toggle(m,a,q,p,1);m->active=1;notify(a);}
 else{m->off_depth=depth;if(!m->off_on)toggle(m,a,q,p,0);m->active=0;}
 /* Native 0x8a260..0x8a278 schedules the selected effect beat bounds. */
 if(selected==1&&m->next_beat>9)m->next_beat=9;
 target(&m->fade,1);m->phase=2;
 if(old==1?a->on:m->off_on)toggle(m,a,q,p,old);
}
void beat_manager_delay_process(BeatManagerDelay *m,DelayAudio *a,DelayQuantize *q,DelayPlayerFixture *p,Stereo *ring,Stereo *in,unsigned n,unsigned bypass){
 if(m->consumed)return;
 if(m->previous_bypass!=bypass){if(!bypass&&m->type==1)notify(a);m->previous_bypass=bypass;}
 float depth=bypass?0:m->depth;
 if(m->active==1){if(bypass||fabsf(depth-a->control.depth)>0x1p-23f){a->control.depth=depth;delay_control(&a->control,DELAY_DEPTH);}}
 else if(bypass||fabsf(depth-m->off_depth)>0x1p-23f)m->off_depth=depth;
 if(m->beat!=m->next_beat){beat_manager_delay_set_beat(m,a,q,p,1);m->next_beat=m->beat;}
 if(m->phase!=1&&m->phase!=2){
  if(m->type!=m->next_type){
   if(m->phase==3&&m->next_type==0){if(m->target!=m->next_target||m->force_change||bypass){m->phase=1;target(&m->fade,0);target(&m->dry,0);snap(&m->long_ramp,1);}}
   else{m->phase=1;target(&m->fade,0);target(&m->dry,0);snap(&m->long_ramp,1);}
  }else if(m->target!=m->next_target){if(m->active==1)delay_control(&a->control,DELAY_OFF);m->phase=1;target(&m->fade,0);target(&m->dry,0);snap(&m->long_ramp,1);}
  else if(m->phase==3){/* Delay keep callback is a no-op. */toggle(m,a,q,p,m->active);target(&m->dry,0);snap(&m->long_ramp,1);m->phase=0;}
 }
 Stereo scratch[64];
 if(m->active==1)beat_delay_process(a,q,p,ring,in,scratch,n);else memcpy(scratch,in,n*sizeof(Stereo));
 if(m->phase==1||m->phase==2){unsigned was=m->phase;for(unsigned i=0;i<n;i++){scratch[i].l=add(mul(scratch[i].l,m->fade.current[0]),mul(in[i].l,sub(1,m->fade.current[0])));scratch[i].r=add(mul(scratch[i].r,m->fade.current[1]),mul(in[i].r,sub(1,m->fade.current[1])));tick(&m->fade);}
  if(m->fade.done){if(was==2)m->phase=0;else{m->force_change=0;switchtype(m,a,q,p);if(m->target!=m->next_target){m->target=m->next_target;if(m->active==1)delay_control(&a->control,DELAY_ON);target(&m->fade,1);m->phase=2;}m->consumed=1;}}
 }
 if(!m->dry.done||!m->long_ramp.done){for(unsigned i=0;i<n;i++){in[i].l=add(mul(in[i].l,m->dry.current[0]),scratch[i].l);in[i].r=add(mul(in[i].r,m->dry.current[1]),scratch[i].r);tick(&m->dry);tick(&m->long_ramp);}}
 else for(unsigned i=0;i<n;i++){in[i].l=add(mul(in[i].l,m->dry.current[0]),scratch[i].l);in[i].r=add(mul(in[i].r,m->dry.current[1]),scratch[i].r);}
}
