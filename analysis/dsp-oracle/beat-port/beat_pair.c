#include "beat_pair.h"
#include <math.h>
#include <string.h>
static float fz(float x){uint32_t u;memcpy(&u,&x,4);if(!(u&0x7f800000)){u&=0x80000000;memcpy(&x,&u,4);}return x;}
static float add(float a,float b){return fz(fz(a)+fz(b));}
static float sub(float a,float b){return fz(fz(a)-fz(b));}
static float mul(float a,float b){return fz(fz(a)*fz(b));}
static void tick(EchoRamp *r){for(unsigned k=0;k<2;k++)r->current[k]=add(r->current[k],r->step[k]);if(r->count>=r->length){memcpy(r->current,r->target,8);r->done=1;}r->count++;}
static void snap(EchoRamp *r,float v){for(unsigned k=0;k<2;k++){r->current[k]=r->target[k]=v;r->step[k]=0;}}
static void target(EchoRamp *r,float v){for(unsigned k=0;k<2;k++){r->target[k]=v;r->step[k]=mul(sub(v,add(r->current[k],r->step[k])),r->inverse);}r->count=0;r->done=0;}
static void start(EchoRamp *r){snap(r,0);for(unsigned k=0;k<2;k++){r->target[k]=1;r->step[k]=mul(1,r->inverse);}r->count=0;r->done=0;}
typedef struct {unsigned *on,*time,*beat;float *depth;unsigned max_time,max_beat;} View;
static View view(BeatPair *s,unsigned id){
 if(id==1)return (View){&s->delay->on,&s->delay->time_ms,&s->delay_q->beat_button,&s->delay->control.depth,4000,9};
 if(id==5)return (View){&s->echo->on,&s->echo->time_ms,&s->echo_q->beat_button,&s->echo->control.depth,4000,9};
 BeatManagerEcho *m=&s->manager;
 return (View){&m->off_on,&m->off_time,&m->off_beat,&m->off_depth,m->off_max_time,m->off_max_beat};
}
static void depth_changed(BeatPair *s,unsigned id){if(id==1)delay_control(&s->delay->control,DELAY_DEPTH);if(id==5)echo_control(&s->echo->control,ECHO_DEPTH);}
static void toggle(BeatPair *s,unsigned id){
 if(id==1)delay_effect_set_on(s->delay,s->delay_q,s->delay_player,!s->delay->on);
 else if(id==5)echo_effect_set_on(s->echo,s->echo_q,s->echo_player,!s->echo->on);
 else s->manager.off_on=!s->manager.off_on;
}
static void notify(BeatPair *s,unsigned id){
 if(id==1)delay_control(&s->delay->control,DELAY_SELECT);
 if(id==5){s->echo->control.counter=0;echo_control(&s->echo->control,ECHO_ON);}
}
static void gate(BeatPair *s,unsigned id,unsigned on){
 if(id==1)delay_control(&s->delay->control,on?DELAY_ON:DELAY_OFF);
 if(id==5)echo_control(&s->echo->control,on?ECHO_ON:ECHO_OFF);
}
static void setbeat(BeatPair *s,unsigned id,unsigned beat,unsigned write_time){
 BeatManagerEcho *m=&s->manager;View v=view(s,id);
 if(beat>11)return;
 static const float ratios[12]={.0625f,.125f,.25f,.5f,.75f,1,2,4,8,16,32,64};
 if(m->bfx_bpm!=UINT32_MAX){
  float period=m->bfx_bpm<4000?1500.0f:(float)(600000u/((m->bfx_bpm+5)/10));
  for(unsigned guard=0;guard<24;guard++){
   unsigned time=(unsigned)(.5f+period*ratios[beat]);
   if(time<1){if(++beat==12)break;continue;}
   if(time>v.max_time){if(beat==0)break;beat--;continue;}
   *v.beat=beat;if(write_time)*v.time=time;
   if(id==1)s->delay->control.time_changed=1;
   if(id==5)s->echo->control.time_changed=1;
   break;
  }
 }
 if(id==1&&delay_quantize_check(s->delay_q,s->delay_player)){
  delay_quantize_set(s->delay,s->delay_q,s->delay_player);
  if(s->delay_player->channel_valid&&s->delay_player->beat_present)s->delay_q->last_index=(int32_t)delay_player_beat_index(s->delay_player);
 }
 if(id==5&&echo_quantize_check(s->echo_q,s->echo_player)){
  echo_quantize_set(s->echo,s->echo_q,s->echo_player);
  if(s->echo_player->channel_valid&&s->echo_player->beat_present)s->echo_q->last_index=(int32_t)echo_player_beat_index(s->echo_player);
 }
}
void beat_pair_set_beat(BeatPair *s,unsigned force){
 BeatManagerEcho *m=&s->manager;View a=view(s,m->active);
 if(*a.on){if(m->next_beat>a.max_beat)return;m->beat=m->next_beat;}
 else{if(m->next_beat>m->off_max_beat)return;m->beat=m->next_beat;if(m->beat>a.max_beat)return;}
 setbeat(s,m->active,m->beat,force);setbeat(s,m->remembered,m->beat,force);
}
void beat_pair_switch(BeatPair *s){
 BeatManagerEcho *m=&s->manager;if(m->type==m->next_type)return;
 unsigned old=m->active,selected=m->next_type;
 View a=view(s,old),b=view(s,selected);float depth=*a.depth;
 if((old==0||selected==0)&&*a.beat==*b.beat)*b.time=*a.time;
 unsigned previous=old==0?m->remembered:old;
 m->remembered=selected==0?old:0;m->type=selected;
 if(previous!=selected){if(m->active==1||m->active==5)notify(s,previous);}
 m->off_time=*b.time;m->off_max_time=b.max_time;m->off_max_beat=b.max_beat;
 setbeat(s,0,*b.beat,m->quantize);
 *b.depth=depth;depth_changed(s,selected);
 m->beat=m->next_beat=m->off_beat;
 if(!*b.on)toggle(s,selected);
 m->active=selected;notify(s,selected);
 if(*b.beat!=m->beat)setbeat(s,selected,m->beat,m->quantize);
 if(m->next_beat>b.max_beat)m->next_beat=b.max_beat;
 target(&m->fade,1);m->phase=2;
 if(*a.on)toggle(s,old);
}
void beat_pair_process(BeatPair *s,Stereo *in,unsigned n,unsigned bypass){
 BeatManagerEcho *m=&s->manager;if(m->consumed)return;
 if(m->previous_bypass!=bypass){if(!bypass&&(m->type==1||m->type==5))notify(s,m->active);m->previous_bypass=bypass;}
 View a=view(s,m->active);float depth=bypass?0:m->depth;
 if(bypass||fabsf(depth-*a.depth)>0x1p-23f){*a.depth=depth;depth_changed(s,m->active);}
 if(m->beat!=m->next_beat){beat_pair_set_beat(s,1);m->next_beat=m->beat;}
 if(m->phase!=1&&m->phase!=2){
  if(m->type!=m->next_type){
   if(m->phase==3&&m->next_type==0){if(m->target!=m->next_target||m->force_change||bypass){m->phase=1;target(&m->fade,0);target(&m->dry,0);snap(&m->long_ramp,1);}}
   else if(m->next_type==0&&m->active==5&&!bypass){toggle(s,5);target(&m->dry,1);start(&m->long_ramp);m->phase=3;}
   else{m->phase=1;target(&m->fade,0);target(&m->dry,0);snap(&m->long_ramp,1);}
  }else if(m->target!=m->next_target){gate(s,m->active,0);m->phase=1;target(&m->fade,0);target(&m->dry,0);snap(&m->long_ramp,1);}
  else if(m->phase==3){if(m->active==5)echo_control(&s->echo->control,ECHO_KEEP);toggle(s,m->active);target(&m->dry,0);snap(&m->long_ramp,1);m->phase=0;}
 }
 Stereo scratch[64];
 if(m->active==1)beat_delay_process(s->delay,s->delay_q,s->delay_player,s->delay_ring,in,scratch,n);
 else if(m->active==5)beat_echo_process(s->echo,s->echo_q,s->echo_player,s->echo_ring,in,scratch,n);
 else memcpy(scratch,in,n*sizeof(Stereo));
 if(m->phase==1||m->phase==2){unsigned was=m->phase;
  for(unsigned i=0;i<n;i++){scratch[i].l=add(mul(scratch[i].l,m->fade.current[0]),mul(in[i].l,sub(1,m->fade.current[0])));scratch[i].r=add(mul(scratch[i].r,m->fade.current[1]),mul(in[i].r,sub(1,m->fade.current[1])));tick(&m->fade);}
  if(m->fade.done){if(was==2)m->phase=0;else{m->force_change=0;beat_pair_switch(s);if(m->target!=m->next_target){m->target=m->next_target;gate(s,m->active,1);target(&m->fade,1);m->phase=2;}m->consumed=1;}}
 }
 unsigned advance_mix_ramps=!m->dry.done||!m->long_ramp.done;
 for(unsigned i=0;i<n;i++){in[i].l=add(mul(in[i].l,m->dry.current[0]),scratch[i].l);in[i].r=add(mul(in[i].r,m->dry.current[1]),scratch[i].r);if(advance_mix_ramps){tick(&m->dry);tick(&m->long_ramp);}}
}
