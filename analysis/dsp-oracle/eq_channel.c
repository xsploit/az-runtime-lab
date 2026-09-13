#include "eq_channel.h"
#include <string.h>
static float fz(float x){uint32_t u;memcpy(&u,&x,4);if(!(u&0x7f800000u)){u&=0x80000000u;memcpy(&x,&u,4);}return x;}
static float add(float a,float b){return fz(fz(a)+fz(b));}
static void target(EqGainRamp*g,float v){for(unsigned k=0;k<2;k++){float next=add(g->current[k],g->step[k]);g->target[k]=v;g->step[k]=fz(fz(fz(v)-next)*fz(g->inverse));}g->count=0;g->done=0;}
void eq_channel_setup(EqChannel*s,const float coeff[4][5],unsigned rate,unsigned length){memset(s,0,sizeof*s);equalizer_setup(&s->eq);isolator_setup(&s->iso,coeff,rate);if(!length){length=(unsigned)((float)rate*2.9f/1000.f);if(!length)length=1;}s->pending=1;s->mode_gain.length=length;s->mode_gain.inverse=1.f/length;s->mode_gain.done=1;for(unsigned j=0;j<3;j++)s->volume[j]=.5f;}
void eq_channel_volume(EqChannel*s,unsigned band,float v,const float table[256]){s->volume[band]=v;eq_index_target(&s->eq.index[band],v);eq_gain_target(&s->iso.gain[band],v,table);}
void eq_channel_mode(EqChannel*s,int mode){if((unsigned)mode>1||mode==s->requested)return;s->requested=mode;s->pending=1;target(&s->mode_gain,0);}
void eq_channel_execute(EqChannel*s,const float tables[3][256][5],const Stereo*in,Stereo*out,unsigned n){
 if(s->active)isolator_execute(&s->iso,in,out,n);else equalizer_execute(&s->eq,tables,in,out,n);
 EqGainRamp*g=&s->mode_gain;
 if(s->pending||!g->done){
  for(unsigned i=0;i<n;i++){
   for(unsigned k=0;k<2;k++)g->current[k]=add(g->current[k],g->step[k]);
   if(g->count>=g->length){memcpy(g->current,g->target,8);g->done=1;}g->count++;
   out[i].l=fz(fz(out[i].l)*fz(g->current[0]));out[i].r=fz(fz(out[i].r)*fz(g->current[1]));
  }
  if(g->done&&s->pending){target(g,1);s->pending=0;s->active=s->requested;s->resets[s->active]++;if(s->active)isolator_reset(&s->iso);else equalizer_reset(&s->eq);}
 }
}
