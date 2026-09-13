#define _POSIX_C_SOURCE 200809L
#include "dsp_graph.h"
#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
static LabMix mix_default(void){
 LabMix m={0};for(int c=0;c<4;c++)m.channel_gain[c]=0.25f;
 m.cue_mask=15;m.cross_position=0.5f;m.master_gain=0.8f;m.headphones_gain=0.3f;m.cue_master_mix=0.2f;return m;
}
static void signal(float *x,unsigned block){
 for(unsigned i=0;i<64;i++)for(unsigned c=0;c<10;c++)
  x[i*10+c]=sinf((float)(block*64+i)*(0.013f+0.017f*c))*0.2f;
}
static void dry_equivalence(void){
 LabMix mix=mix_default();static LabDspGraph g;LabMixRamp r;float in[640],a[256],b[256];
 assert(lab_dsp_graph_init(&g,44100,&mix)==1);assert(lab_mix_ramp_init(&r,&mix));
 for(unsigned block=0;block<100;block++){
  if(block==40){mix.channel_gain[2]=0;mix.cross_assign[0]=-1;mix.cross_position=0.1f;
   assert(lab_dsp_graph_set_mix(&g,&mix,191)==1);assert(lab_mix_ramp_target(&r,&mix,191));}
  signal(in,block);assert(lab_dsp_graph_process(&g,in,a,64)==1);lab_mix_ramped(&r,in,b,64);
  assert(!memcmp(a,b,sizeof a));
 }
}
static void reject_without_mutation(void){
 LabMix mix=mix_default();static LabDspGraph g,old;float in[640]={0},out[256],before[256];
 assert(lab_dsp_graph_init(&g,44100,&mix)==1);old=g;memset(out,0x5a,sizeof out);memcpy(before,out,sizeof out);
 assert(lab_dsp_graph_init(&g,48000,&mix)==-1);assert(!memcmp(&g,&old,sizeof g));
 assert(lab_dsp_graph_set_cfx(&g,4,1,0.5f,0.5f)==-1);
 assert(lab_dsp_graph_set_cfx(&g,0,7,0.5f,0.5f)==-1);
 assert(lab_dsp_graph_set_cfx(&g,0,1,NAN,0.5f)==-1);
 assert(lab_dsp_graph_set_cfx(&g,0,1,0.5f,1.1f)==-1);
 assert(lab_dsp_graph_process(&g,in,out,63)==-1);assert(!memcmp(out,before,sizeof out));
 in[10]=NAN;assert(lab_dsp_graph_process(&g,in,out,64)==-1);in[10]=0;
 assert(lab_dsp_graph_process(&g,in,in,64)==-1);assert(!memcmp(&g,&old,sizeof g));
 assert(lab_dsp_graph_set_cfx(&g,0,1,0.1f,0.6f)==1);
 assert(lab_dsp_graph_process(&g,in,out,64)==1);assert(g.channel[0].manager.phase!=0);old=g;
 assert(lab_dsp_graph_set_cfx(&g,0,0,0.9f,0.1f)==0);assert(!memcmp(&g,&old,sizeof g));
}
static double tone(float *in,unsigned block){
 double energy=0;memset(in,0,640*sizeof(float));
 for(unsigned i=0;i<64;i++){
  float x=0.25f*sinf((float)(block*64+i)*2000.0f*6.283185307179586f/44100.0f);
  in[i*10]=in[i*10+1]=x;energy+=(double)x*x;
 }return energy;
}
static void filter_cue_bypass_reset(void){
 LabMix mix=mix_default();mix.cue_mask=1;mix.master_gain=mix.headphones_gain=1;mix.cue_master_mix=0;
 static LabDspGraph g,fresh;float in[640],out[256],again[256];
 assert(lab_dsp_graph_init(&g,44100,&mix)==1);assert(lab_dsp_graph_set_cfx(&g,0,1,0,0.5f)==1);
 double filtered=0,original=0;
 for(unsigned b=0;b<160;b++){
  double e=tone(in,b);assert(lab_dsp_graph_process(&g,in,out,64)==1);
  for(int i=0;i<64;i++){assert(isfinite(out[i*4]));assert(out[i*4]*4==out[i*4+2]);
   if(b>80)filtered+=(double)out[i*4+2]*out[i*4+2];}
  if(b>80)original+=e;
 }
 assert(filtered>0&&filtered<original*0.0001);
 mix.channel_gain[0]=0;assert(lab_dsp_graph_set_mix(&g,&mix,0)==1);
 tone(in,160);assert(lab_dsp_graph_process(&g,in,out,64)==1);double cue=0;
 for(int i=0;i<64;i++){assert(out[i*4]==0);cue+=fabs(out[i*4+2]);}assert(cue>0);
 assert(lab_dsp_graph_set_cfx(&g,0,0,0,0.5f)==1);
 for(unsigned b=161;b<180;b++){tone(in,b);assert(lab_dsp_graph_process(&g,in,out,64)==1);}
 assert(g.channel[0].manager.phase==0&&g.channel[0].manager.current==0);
 for(int i=0;i<64;i++)assert(out[i*4+2]==in[i*10]);
 assert(lab_dsp_graph_set_cfx(&g,0,1,0.83f,0.4f)==1);
 for(int b=0;b<7;b++){tone(in,180+b);assert(lab_dsp_graph_process(&g,in,out,64)==1);}
 assert(lab_dsp_graph_reset(&g)==1);
 assert(lab_dsp_graph_init(&fresh,44100,&mix)==1);
 assert(lab_dsp_graph_set_cfx(&fresh,0,1,0.83f,0.4f)==1);
 memset(in,0,sizeof in);
 for(int b=0;b<20;b++){
  assert(lab_dsp_graph_process(&g,in,out,64)==1);assert(lab_dsp_graph_process(&fresh,in,again,64)==1);
  assert(!memcmp(out,again,sizeof out));for(int j=0;j<256;j++)assert(out[j]==0);
 }
 printf("Filter 2kHz energy ratio: %.9g\n",filtered/original);
}
static void four_independent_channels(unsigned type){
 static LabDspGraph all,individual[4];LabMix mix=mix_default();float in[640],single[640],out[256],parts[4][256];
 assert(lab_dsp_graph_init(&all,44100,&mix)==1);
 for(int c=0;c<4;c++){
  assert(lab_dsp_graph_init(&individual[c],44100,&mix)==1);
  assert(lab_dsp_graph_set_cfx(&all,c,type,0.12f+0.23f*c,0.2f+0.17f*c)==1);
  assert(lab_dsp_graph_set_cfx(&individual[c],c,type,0.12f+0.23f*c,0.2f+0.17f*c)==1);
 }
 for(unsigned b=0;b<(type==5?640u:128u);b++){
  signal(in,b);assert(lab_dsp_graph_process(&all,in,out,64)==1);
  for(int c=0;c<4;c++){
   memset(single,0,sizeof single);for(int i=0;i<64;i++){single[i*10+c*2]=in[i*10+c*2];single[i*10+c*2+1]=in[i*10+c*2+1];}
   assert(lab_dsp_graph_process(&individual[c],single,parts[c],64)==1);
   if(type==5)assert(!memcmp(&all.channel[c].space,&individual[c].channel[c].space,sizeof(SpaceRuntime)));
   assert(!memcmp(&all.channel[c].filter,&individual[c].channel[c].filter,sizeof(CfxFilter)));
   assert(!memcmp(&all.channel[c].history,&individual[c].channel[c].history,sizeof(CfxHistory)));
  }
  for(int i=0;i<256;i++){double sum=0;for(int c=0;c<4;c++)sum+=parts[c][i];assert(fabs(sum-out[i])<1e-6);}
 }
}
static double now(void){struct timespec t;clock_gettime(CLOCK_MONOTONIC,&t);return t.tv_sec+t.tv_nsec*1e-9;}
static void benchmark(void){
 static LabDspGraph g;LabMix mix=mix_default();float in[640],out[256];signal(in,0);
 lab_dsp_graph_init(&g,44100,&mix);for(int c=0;c<4;c++)lab_dsp_graph_set_cfx(&g,c,1,0.2f+0.2f*c,0.5f);
 for(int b=0;b<100;b++)lab_dsp_graph_process(&g,in,out,64);
 double start=now();for(int b=0;b<20000;b++)lab_dsp_graph_process(&g,in,out,64);double elapsed=now()-start;
 printf("{\"graph_bytes\":%zu,\"benchmark_blocks\":20000,\"four_filter_seconds\":%.9g,\"mean_us_per_64frames\":%.9g}\n",sizeof g,elapsed,elapsed*1e6/20000);
}
int main(void){dry_equivalence();reject_without_mutation();filter_cue_bypass_reset();four_independent_channels(1);four_independent_channels(5);benchmark();puts("DSP graph tests passed");return 0;}
