#include "channel_eq.h"
#include <string.h>
#include <math.h>
_Static_assert(sizeof(LabEqTables)==16464,"private table layout");
static float eq_control_fz(float x){uint32_t u;memcpy(&u,&x,4);if(!(u&0x7f800000u)){u&=0x80000000u;memcpy(&x,&u,4);}return x;}
static void eq_index_target(LabEqIndexRamp *s,float value){
 unsigned index=(uint16_t)(uint32_t)(.5f+value*255.f);
 if((int32_t)index==s->target)return;
 s->target=(int32_t)index;s->step=s->target>s->current?s->magnitude:-s->magnitude;
 s->count=0;s->done=0;
}
static void eq_gain_target(LabEqGainRamp *s,float value,const float table[256]){
 int index=(int32_t)(.5f+value*255.f);float gain=table[index];
 for(unsigned i=0;i<2;i++){
  float upcoming=eq_control_fz(eq_control_fz(s->current[i])+eq_control_fz(s->step[i]));
  float difference=eq_control_fz(eq_control_fz(gain)-upcoming);
  s->target[i]=gain;s->step[i]=eq_control_fz(difference*eq_control_fz(s->inverse));
 }
 s->count=0;s->done=0;
}
static float isolator_fz(float x){uint32_t u;memcpy(&u,&x,4);if(!(u&0x7f800000u)){u&=0x80000000u;memcpy(&x,&u,4);}return x;}
static float isolator_add(float a,float b){return isolator_fz(isolator_fz(a)+isolator_fz(b));}
static float isolator_mul(float a,float b){return isolator_fz(isolator_fz(a)*isolator_fz(b));}
static void isolator_reset(LabIsolator*s){for(unsigned i=0;i<8;i++){memset(s->filter[i].x,0,sizeof s->filter[i].x);memset(s->filter[i].y,0,sizeof s->filter[i].y);}}
static void isolator_setup(LabIsolator*s,const float coeff[4][5],unsigned rate){
 memset(s,0,sizeof*s);for(unsigned i=0;i<8;i++)for(unsigned j=0;j<5;j++)s->filter[i].coefficients[j]=(Stereo){coeff[i/2][j],coeff[i/2][j]};
 for(unsigned i=0;i<3;i++){LabEqGainRamp*g=&s->gain[i];uint32_t bits=0x3eb5a965;float initial;memcpy(&initial,&bits,4);g->target[0]=g->target[1]=g->current[0]=g->current[1]=initial;g->length=(unsigned)((float)rate*3.3f/1000.f);if(!g->length)g->length=1;g->inverse=1.f/(float)g->length;g->done=1;}
}
static void isolator_process(LabEqIir*f,const Stereo*in,Stereo*out,unsigned n){iir_reconstructed(in,out,f->coefficients,f->x,f->y,n);}
static void isolator_execute(LabIsolator*s,const Stereo*in,Stereo*out,unsigned n){
 isolator_process(&s->filter[0],in,s->scratch[0],n);isolator_process(&s->filter[1],s->scratch[0],s->scratch[2],n);
 isolator_process(&s->filter[2],in,s->scratch[0],n);isolator_process(&s->filter[3],s->scratch[0],s->scratch[1],n);
 isolator_process(&s->filter[4],s->scratch[1],s->scratch[0],n);isolator_process(&s->filter[5],s->scratch[0],s->scratch[3],n);
 isolator_process(&s->filter[6],in,s->scratch[0],n);isolator_process(&s->filter[7],s->scratch[0],s->scratch[4],n);
 for(unsigned i=0;i<n;i++){
  out[i].l=isolator_add(isolator_add(isolator_mul(s->scratch[2][i].l,s->gain[0].current[0]),isolator_mul(s->scratch[3][i].l,s->gain[1].current[0])),isolator_mul(s->scratch[4][i].l,s->gain[2].current[0]));
  out[i].r=isolator_add(isolator_add(isolator_mul(s->scratch[2][i].r,s->gain[0].current[1]),isolator_mul(s->scratch[3][i].r,s->gain[1].current[1])),isolator_mul(s->scratch[4][i].r,s->gain[2].current[1]));
  for(unsigned j=0;j<3;j++){LabEqGainRamp*g=&s->gain[j];if(!g->done){for(unsigned k=0;k<2;k++)g->current[k]=isolator_add(g->current[k],g->step[k]);if(g->count>=g->length){memcpy(g->current,g->target,8);g->done=1;}g->count++;}}
 }
}
static void equalizer_setup(LabEqualizer*s){memset(s,0,sizeof*s);for(unsigned i=0;i<3;i++){s->index[i].magnitude=1;s->index[i].timing=14;s->index[i].done=1;s->cached[i]=127;}}
static void equalizer_reset(LabEqualizer*s){for(unsigned i=0;i<3;i++){memset(s->filter[i].x,0,16);memset(s->filter[i].y,0,16);}}
static void equalizer_step(LabEqIndexRamp*r){if(r->done)return;if(r->target==r->current){r->count=0;r->done=1;return;}if(r->count%r->timing==0)r->current+=r->step;r->count++;}
static void equalizer_segment(LabEqualizer*s,const float tables[3][256][5],const Stereo*in,Stereo*out,unsigned offset,unsigned n){
 for(unsigned i=0;i<3;i++)for(unsigned j=0;j<5;j++)s->filter[i].coefficients[j]=(Stereo){tables[i][s->cached[i]][j],tables[i][s->cached[i]][j]};
 for(unsigned i=0;i<3;i++){LabEqIir*f=&s->filter[i];iir_reconstructed(i?s->scratch[i-1]+offset:in+offset,i==2?out+offset:s->scratch[i]+offset,f->coefficients,f->x,f->y,n);}
}
static void equalizer_execute(LabEqualizer*s,const float tables[3][256][5],const Stereo*in,Stereo*out,unsigned n){
 unsigned offset=0,pending=0;
 for(unsigned i=0;i+1<n;i++){
  int16_t current[3];for(unsigned j=0;j<3;j++)current[j]=(int16_t)s->index[j].current;
  if(memcmp(current,s->cached,6)){equalizer_segment(s,tables,in,out,offset,pending);offset+=pending;pending=1;}else pending++;
  for(unsigned j=0;j<3;j++){equalizer_step(&s->index[j]);s->cached[j]=current[j];}
 }
 int16_t current[3];for(unsigned j=0;j<3;j++)current[j]=(int16_t)s->index[j].current;
 equalizer_segment(s,tables,in,out,offset,pending+1);
 for(unsigned j=0;j<3;j++){equalizer_step(&s->index[j]);s->cached[j]=current[j];}
}
static float eq_channel_fz(float x){uint32_t u;memcpy(&u,&x,4);if(!(u&0x7f800000u)){u&=0x80000000u;memcpy(&x,&u,4);}return x;}
static float eq_channel_add(float a,float b){return eq_channel_fz(eq_channel_fz(a)+eq_channel_fz(b));}
static void eq_channel_target(LabEqGainRamp*g,float v){for(unsigned k=0;k<2;k++){float next=eq_channel_add(g->current[k],g->step[k]);g->target[k]=v;g->step[k]=eq_channel_fz(eq_channel_fz(eq_channel_fz(v)-next)*eq_channel_fz(g->inverse));}g->count=0;g->done=0;}
static void eq_channel_setup(LabChannelEq*s,const float coeff[4][5],unsigned rate,unsigned length){memset(s,0,sizeof*s);equalizer_setup(&s->eq);isolator_setup(&s->iso,coeff,rate);if(!length){length=(unsigned)((float)rate*2.9f/1000.f);if(!length)length=1;}s->pending=1;s->mode_gain.length=length;s->mode_gain.inverse=1.f/length;s->mode_gain.done=1;for(unsigned j=0;j<3;j++)s->volume[j]=.5f;}
static void eq_channel_volume(LabChannelEq*s,unsigned band,float v,const float table[256]){s->volume[band]=v;eq_index_target(&s->eq.index[band],v);eq_gain_target(&s->iso.gain[band],v,table);}
static void eq_channel_mode(LabChannelEq*s,int mode){if((unsigned)mode>1||mode==s->requested)return;s->requested=mode;s->pending=1;eq_channel_target(&s->mode_gain,0);}
static void eq_channel_execute(LabChannelEq*s,const float tables[3][256][5],const Stereo*in,Stereo*out,unsigned n){
 if(s->active)isolator_execute(&s->iso,in,out,n);else equalizer_execute(&s->eq,tables,in,out,n);
 LabEqGainRamp*g=&s->mode_gain;
 if(s->pending||!g->done){
  for(unsigned i=0;i<n;i++){
   for(unsigned k=0;k<2;k++)g->current[k]=eq_channel_add(g->current[k],g->step[k]);
   if(g->count>=g->length){memcpy(g->current,g->target,8);g->done=1;}g->count++;
   out[i].l=eq_channel_fz(eq_channel_fz(out[i].l)*eq_channel_fz(g->current[0]));out[i].r=eq_channel_fz(eq_channel_fz(out[i].r)*eq_channel_fz(g->current[1]));
  }
  if(g->done&&s->pending){eq_channel_target(g,1);s->pending=0;s->active=s->requested;s->resets[s->active]++;if(s->active)isolator_reset(&s->iso);else equalizer_reset(&s->eq);}
 }
}

int lab_eq_tables_valid(const LabEqTables*t){
 if(!t)return 0;
 for(unsigned b=0;b<3;b++)for(unsigned i=0;i<256;i++)for(unsigned k=0;k<5;k++)if(!isfinite(t->coefficients[b][i][k]))return 0;
 for(unsigned i=0;i<256;i++)if(!isfinite(t->isolator_gain[i]))return 0;
 for(unsigned i=0;i<4;i++)for(unsigned k=0;k<5;k++)if(!isfinite(t->isolator_coefficients[i][k]))return 0;
 return 1;
}
void lab_channel_eq_init(LabChannelEq*s,const LabEqTables*t){eq_channel_setup(s,t->isolator_coefficients,44100,0);}
int lab_channel_eq_set(LabChannelEq*s,const LabEqTables*t,unsigned mode,float high,float mid,float low){
 if(!s||!t||mode>1||!isfinite(high)||high<0||high>1||!isfinite(mid)||mid<0||mid>1||!isfinite(low)||low<0||low>1)return -1;
 eq_channel_mode(s,(int)mode);eq_channel_volume(s,0,high,t->isolator_gain);eq_channel_volume(s,1,mid,t->isolator_gain);eq_channel_volume(s,2,low,t->isolator_gain);return 1;
}
void lab_channel_eq_process(LabChannelEq*s,const LabEqTables*t,const Stereo*in,Stereo*out){eq_channel_execute(s,t->coefficients,in,out,64);}
void lab_channel_eq_reset_selected(LabChannelEq*s){s->resets[s->active]++;if(s->active)isolator_reset(&s->iso);else equalizer_reset(&s->eq);}
