#include "dsp_graph.h"
#include "../analysis/dsp-oracle/eq_channel.h"
#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
static LabEqTables tables;
static LabDspGraph graph,before;
static LabCfxManager reference_cfx[4];
static EqChannel reference_eq[4];
static unsigned requests,events;
static LabMix base_mix(void){LabMix m={0};for(unsigned c=0;c<4;c++)m.channel_gain[c]=.17f+.03f*c;m.master_gain=.8f;m.headphones_gain=.5f;m.cue_mask=15;m.cue_master_mix=.2f;m.cross_position=.5f;return m;}
static void fixture(const char*eq,const char*iso){FILE*f=fopen(eq,"rb");assert(f&&fread(tables.coefficients,sizeof tables.coefficients,1,f)==1);fclose(f);f=fopen(iso,"rb");assert(f&&fread(tables.isolator_gain,sizeof tables.isolator_gain,1,f)==1&&fread(tables.isolator_coefficients,sizeof tables.isolator_coefficients,1,f)==1);fclose(f);assert(lab_eq_tables_valid(&tables));}
static void rejected(void){LabMix m=base_mix();assert(lab_dsp_graph_init(&graph,44100,&m)==1);before=graph;
 assert(lab_dsp_graph_set_eq(&graph,0,0,.5f,.5f,.5f)==-1);assert(!memcmp(&graph,&before,sizeof graph));
 assert(lab_dsp_graph_attach_eq(&graph,(const LabEqTables*)&graph)==-1);assert(!memcmp(&graph,&before,sizeof graph));
 LabEqTables bad=tables;bad.coefficients[1][128][2]=NAN;assert(lab_dsp_graph_attach_eq(&graph,&bad)==-1);assert(!memcmp(&graph,&before,sizeof graph));
 assert(lab_dsp_graph_attach_eq(&graph,&tables)==1);before=graph;
 assert(lab_dsp_graph_attach_eq(&graph,&tables)==-1);assert(lab_dsp_graph_set_eq(&graph,4,0,.5f,.5f,.5f)==-1);assert(lab_dsp_graph_set_eq(&graph,0,2,.5f,.5f,.5f)==-1);assert(lab_dsp_graph_set_eq(&graph,0,0,.5f,NAN,.5f)==-1);assert(lab_dsp_graph_set_eq(&graph,0,0,.5f,.5f,1.01f)==-1);assert(!memcmp(&graph,&before,sizeof graph));}
static void process_cfx(unsigned c,Stereo*audio){unsigned old=reference_cfx[c].manager.eq_reset_requests;lab_cfx_manager_process(&reference_cfx[c],audio,64);if(old!=reference_cfx[c].manager.eq_reset_requests){EqChannel*s=&reference_eq[c];s->resets[s->active]++;if(s->active)isolator_reset(&s->iso);else equalizer_reset(&s->eq);events++;}}
static void four_channels(void){LabMix m=base_mix();LabMixRamp ramp;assert(lab_mix_ramp_init(&ramp,&m));assert(lab_dsp_graph_init(&graph,44100,&m)==1);assert(lab_dsp_graph_attach_eq(&graph,&tables)==1);
 for(unsigned c=0;c<4;c++){lab_cfx_manager_init(&reference_cfx[c]);eq_channel_setup(&reference_eq[c],tables.isolator_coefficients,44100,0);}
 double energy=0;unsigned types[]={1,3,1,6,2,3};
 for(unsigned block=0;block<2400;block++){
  if(block%41==0)for(unsigned c=0;c<4;c++){unsigned mode=((block/41)+c)%2;float high=(float)((block+31*c)%101)/100,mid=.3f+.1f*c,low=(float)((block*3+17*c)%101)/100;assert(lab_dsp_graph_set_eq(&graph,c,mode,high,mid,low)==1);eq_channel_mode(&reference_eq[c],(int)mode);eq_channel_volume(&reference_eq[c],0,high,tables.isolator_gain);eq_channel_volume(&reference_eq[c],1,mid,tables.isolator_gain);eq_channel_volume(&reference_eq[c],2,low,tables.isolator_gain);}
  if(block%73==0)for(unsigned c=0;c<4;c++){unsigned type=types[((block/73)+c)%6];int accepted=lab_dsp_graph_set_cfx(&graph,c,type,.92f,.3f+.1f*c);int want=filter_manager_request(&reference_cfx[c].manager,(int)type);assert(accepted==want);if(accepted==1){lab_cfx_manager_controls(&reference_cfx[c],.92f,.3f+.1f*c);requests++;}}
  if(block%101==0){m.channel_gain[(block/101)%4]=block%202?0:.29f;assert(lab_dsp_graph_set_mix(&graph,&m,79)==1);assert(lab_mix_ramp_target(&ramp,&m,79));}
  float in[640]={0},processed[640]={0},got[256],want[256];
  for(unsigned i=0;i<64;i++)for(unsigned c=0;c<4;c++){float x=.13f*sinf((block*64+i)*(.023f+.051f*c));in[i*10+2*c]=x;in[i*10+2*c+1]=x*.73f;}
  for(unsigned c=0;c<4;c++){Stereo input[66]={0},audio[66]={0};for(unsigned i=0;i<64;i++)input[i]=(Stereo){in[i*10+2*c],in[i*10+2*c+1]};int active=reference_cfx[c].manager.active;int pre=active==2||active==3;if(pre)process_cfx(c,input);eq_channel_execute(&reference_eq[c],tables.coefficients,input,audio,64);if(!pre)process_cfx(c,audio);for(unsigned i=0;i<64;i++){processed[i*10+2*c]=audio[i].l;processed[i*10+2*c+1]=audio[i].r;}}
  lab_mix_ramped(&ramp,processed,want,64);assert(lab_dsp_graph_process(&graph,in,got,64)==1);
  assert(!memcmp(want,got,sizeof want));for(unsigned c=0;c<4;c++){assert(sizeof reference_eq[c]==sizeof graph.equalizer[c]);assert(!memcmp(&reference_eq[c],&graph.equalizer[c],sizeof reference_eq[c]));assert(!memcmp(&reference_cfx[c],&graph.channel[c],sizeof reference_cfx[c]));}for(unsigned i=0;i<256;i++){assert(isfinite(got[i]));energy+=got[i]*got[i];}
 }
 assert(energy>1&&events>0);printf("four-channel EQ/CFX: 153600 frames, %u accepted CFX requests, %u selected-history resets, exact output/state match\n",requests,events);
}
static void reconnect(void){LabMix m=graph.mix_target;LabEqControl eq[4];LabCfxControl fx[4];memcpy(eq,graph.eq_controls,sizeof eq);memcpy(fx,graph.controls,sizeof fx);assert(lab_dsp_graph_reset(&graph)==1);assert(graph.eq_tables==&tables);assert(lab_dsp_graph_init(&before,44100,&m)==1);assert(lab_dsp_graph_attach_eq(&before,&tables)==1);for(unsigned c=0;c<4;c++){assert(lab_dsp_graph_set_eq(&before,c,eq[c].mode,eq[c].high,eq[c].mid,eq[c].low)==1);assert(lab_dsp_graph_set_cfx(&before,c,fx[c].type,fx[c].color,fx[c].parameter)==1);}float in[640]={0},a[256],b[256];for(unsigned k=0;k<30;k++){assert(lab_dsp_graph_process(&graph,in,a,64)==1);assert(lab_dsp_graph_process(&before,in,b,64)==1);assert(!memcmp(a,b,sizeof a));}assert(!memcmp(graph.equalizer,before.equalizer,sizeof graph.equalizer));}
static void post_fader(unsigned type){LabMix m=base_mix();for(unsigned c=0;c<4;c++)m.channel_gain[c]=c==0?1:0;m.master_gain=m.headphones_gain=1;m.cue_mask=1;m.cue_master_mix=0;assert(lab_dsp_graph_init(&graph,44100,&m)==1);assert(lab_dsp_graph_init(&before,44100,&m)==1);assert(lab_dsp_graph_attach_eq(&graph,&tables)==1);assert(lab_dsp_graph_attach_eq(&before,&tables)==1);assert(lab_dsp_graph_set_mix(&graph,&m,0)==1);assert(lab_dsp_graph_set_mix(&before,&m,0)==1);assert(lab_dsp_graph_set_eq(&graph,0,1,.6f,.4f,.7f)==1);assert(lab_dsp_graph_set_eq(&before,0,1,.6f,.4f,.7f)==1);assert(lab_dsp_graph_set_cfx(&graph,0,type,.15f,.2f)==1);double tail=0;
 for(unsigned block=0;block<700;block++){if(block==450){m.channel_gain[0]=0;assert(lab_dsp_graph_set_mix(&graph,&m,0)==1);assert(lab_dsp_graph_set_mix(&before,&m,0)==1);}float in[640]={0},a[256],b[256];for(unsigned j=0;j<64;j++){in[j*10]=.15f*sinf((block*64+j)*.09f);in[j*10+1]=.13f*cosf((block*64+j)*.031f);}assert(lab_dsp_graph_process(&graph,in,a,64)==1);assert(lab_dsp_graph_process(&before,in,b,64)==1);for(unsigned j=0;j<64;j++){assert(isfinite(a[4*j])&&isfinite(a[4*j+1]));assert(fabsf(a[4*j+2]-b[4*j+2])<1e-7f);assert(fabsf(a[4*j+3]-b[4*j+3])<1e-7f);if(block>=450){assert(b[4*j]==0&&b[4*j+1]==0);tail+=a[4*j]*a[4*j]+a[4*j+1]*a[4*j+1];}}assert(!memcmp(&graph.equalizer[0],&before.equalizer[0],sizeof graph.equalizer[0]));}
 assert(tail>1e-5);printf("EQ + post-fader CFX %u: preserved cue/independent EQ state; closed-fader tail energy %.9g\n",type,tail);}
int main(int argc,char**argv){assert(argc==3);fixture(argv[1],argv[2]);rejected();four_channels();reconnect();post_fader(4);post_fader(5);printf("EQ attachment, atomic rejection, native startup, mode/CFX transitions and reset persistence passed; graph bytes=%zu\n",sizeof graph);return 0;}
