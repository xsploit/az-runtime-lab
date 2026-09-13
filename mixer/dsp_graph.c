#include "dsp_graph.h"
#include <math.h>
#include <string.h>
#define GRAPH_READY UINT32_C(0x43465831)
static int ready(const LabDspGraph *g){return g&&g->initialized==GRAPH_READY&&g->sample_rate==44100;}
static int unit(float x){return isfinite(x)&&x>=0&&x<=1;}
static void routes(const LabMix *m,float *v){
 float left=cosf(m->cross_position*1.5707963267948966f),right=sinf(m->cross_position*1.5707963267948966f);
 if(m->cross_position==0)right=0;
 if(m->cross_position==1)left=0;
 for(unsigned c=0;c<4;c++){v[c]=m->channel_gain[c];v[c+4]=m->cross_assign[c]<0?left:m->cross_assign[c]>0?right:1;v[c+9]=(m->cue_mask>>c)&1;}
 v[8]=m->master_gain;v[13]=m->headphones_gain;v[14]=m->cue_master_mix;
}
int lab_dsp_graph_attach_beat(LabDspGraph *g,LabBeatFx *b){if(!ready(g)||!b)return -1;g->beat=b;routes(&g->mix_target,g->route_current);memcpy(g->route_target,g->route_current,sizeof g->route_target);g->route_remaining=0;return 1;}
int lab_dsp_graph_attach_eq(LabDspGraph*g,const LabEqTables*t){
 if(!ready(g)||g->eq_tables||!t)return -1;
 uintptr_t a=(uintptr_t)g,b=(uintptr_t)t;
 if(a<=b?b-a<sizeof*g:a-b<sizeof*t)return -1;
 if(!lab_eq_tables_valid(t))return -1;
 for(unsigned c=0;c<4;c++)lab_channel_eq_init(&g->equalizer[c],t);
 g->eq_tables=t;routes(&g->mix_target,g->route_current);memcpy(g->route_target,g->route_current,sizeof g->route_target);g->route_remaining=0;return 1;
}
int lab_dsp_graph_set_eq(LabDspGraph*g,unsigned c,unsigned mode,float high,float mid,float low){
 if(!ready(g)||!g->eq_tables||c>=4||mode>1||!unit(high)||!unit(mid)||!unit(low))return -1;
 lab_channel_eq_set(&g->equalizer[c],g->eq_tables,mode,high,mid,low);
 g->eq_controls[c]=(LabEqControl){mode,high,mid,low};g->eq_control_valid[c]=1;return 1;
}
static void cfx(LabDspGraph*g,unsigned c,Stereo*audio){
 unsigned previous=g->channel[c].manager.eq_reset_requests;
 lab_cfx_manager_process(&g->channel[c],audio,64);
 if(g->eq_tables&&previous!=g->channel[c].manager.eq_reset_requests)lab_channel_eq_reset_selected(&g->equalizer[c]);
}
#ifdef LAB_HEADPHONE_DSP
int lab_dsp_graph_attach_headphones(LabDspGraph*g,LabHeadphoneDsp*h,float scale){
 if(!ready(g)||!h||!isfinite(scale)||scale==0||fabsf(scale)>16)return -1;
 /* mode setter also verifies initialization without exposing raw state. */
 uint32_t mode;memcpy(&mode,h->state+200,4);if(mode>1||!lab_headphone_mode(h,1-mode))return -1;
 lab_headphone_level(h,g->mix_target.headphones_gain);lab_headphone_mix(h,g->mix_target.cue_master_mix);lab_headphone_master_cue(h,1);
 g->headphones=h;g->headphone_output_scale=scale;
 routes(&g->mix_target,g->route_current);memcpy(g->route_target,g->route_current,sizeof g->route_target);g->route_remaining=0;return 1;
}
#endif
int lab_dsp_graph_init(LabDspGraph *g,unsigned rate,const LabMix *mix){
 if(!g||rate!=44100||!lab_mix_valid(mix))return -1;
 /* Copy before clearing in case caller supplies &g->mix_target. */
 LabMix initial=*mix;memset(g,0,sizeof *g);g->sample_rate=rate;g->mix_target=initial;
 lab_mix_ramp_init(&g->mix,&initial);
 for(unsigned c=0;c<4;c++){lab_cfx_manager_init(&g->channel[c]);g->controls[c]=(LabCfxControl){0,0.5f,0.5f};}
 g->initialized=GRAPH_READY;return 1;
}
int lab_dsp_graph_set_mix(LabDspGraph *g,const LabMix *s,size_t frames){
 if(!ready(g)||!lab_mix_valid(s))return -1;
 LabMix next=*s;
#ifdef LAB_HEADPHONE_DSP
 if(g->headphones){if(next.headphones_gain!=g->mix_target.headphones_gain)lab_headphone_level(g->headphones,next.headphones_gain);if(next.cue_master_mix!=g->mix_target.cue_master_mix)lab_headphone_mix(g->headphones,next.cue_master_mix);}
#endif
 lab_mix_ramp_target(&g->mix,&next,frames);g->mix_target=next;routes(&next,g->route_target);g->route_remaining=frames;
 for(unsigned i=0;i<15;i++){g->route_step[i]=frames?(g->route_target[i]-g->route_current[i])/(float)frames:0;if(!frames)g->route_current[i]=g->route_target[i];}return 1;
}
int lab_dsp_graph_set_cfx(LabDspGraph *g,unsigned c,unsigned type,float color,float parameter){
 if(!ready(g)||c>=4||(type!=0&&type!=1&&type!=2&&type!=3&&type!=4&&type!=5&&type!=6)||!unit(color)||!unit(parameter))return -1;
 LabCfxManager *m=&g->channel[c];
 if(m->manager.phase!=0&&m->manager.phase!=5)return 0;
 filter_manager_request(&m->manager,(int)type);
 lab_cfx_manager_controls(m,color,parameter);
 g->controls[c]=(LabCfxControl){type,color,parameter};return 1;
}
int lab_dsp_graph_process(LabDspGraph *g,const float *in,float *out,size_t n){
 if(!ready(g)||!in||!out||n!=64)return -1;
 /* Reject overlapping ranges before any graph changes. */
 uintptr_t a=(uintptr_t)in,b=(uintptr_t)out;
 if(a<=b?b-a<640*sizeof(float):a-b<256*sizeof(float))return -1;
 for(size_t i=0;i<640;i++)if(!isfinite(in[i]))return -1;
 /* Native placement is chosen before operate; a type change completed inside
  * operate takes its new insertion point on the following block. */
 int post[4],pre_eq[4],any_post=0;
 for(unsigned c=0;c<4;c++){FilterManager*m=&g->channel[c].manager;int active=m->active;post[c]=active==4||active==5;pre_eq[c]=active==2||active==3;any_post|=post[c];}
 float coefficients[64][15];
 for(unsigned i=0;i<64;i++){if(g->route_remaining){g->route_remaining--;for(unsigned k=0;k<15;k++)g->route_current[k]=g->route_remaining?g->route_current[k]+g->route_step[k]:g->route_target[k];}memcpy(coefficients[i],g->route_current,sizeof g->route_current);g->master_bus[i]=g->cue_bus[i]=(Stereo){0,0};}
 memcpy(g->processed,in,sizeof g->processed);
 for(unsigned c=0;c<4;c++){
  Stereo *block=g->channel_input[c];
  for(size_t i=0;i<64;i++)block[i]=(Stereo){in[i*10+c*2],in[i*10+c*2+1]};
  if(g->eq_tables){
   if(pre_eq[c])cfx(g,c,block);
   memcpy(g->eq_input,block,64*sizeof(Stereo));g->eq_input[64]=g->eq_input[65]=(Stereo){0,0};
   lab_channel_eq_process(&g->equalizer[c],g->eq_tables,g->eq_input,block);
   if(!post[c]&&!pre_eq[c])cfx(g,c,block);
  }else if(!post[c])cfx(g,c,block);
  for(size_t i=0;i<64;i++){g->processed[i*10+c*2]=block[i].l;g->processed[i*10+c*2+1]=block[i].r;}
 }
 int buses=g->beat!=NULL||any_post;
#ifdef LAB_HEADPHONE_DSP
 buses=buses||g->headphones!=NULL;
#endif
 if(!buses){lab_mix_ramped(&g->mix,g->processed,out,64);return 1;}
 /* Keep legacy coefficient smoothing current while the staged path owns
  * output, so later removal of the postfader effect cannot revive an old ramp. */
 lab_mix_ramped(&g->mix,g->processed,out,64);
 if(g->beat)beat_manager_begin_round(&g->beat->manager);
 for(unsigned c=0;c<4;c++){
  Stereo *block=g->channel_input[c];
  for(unsigned i=0;i<64;i++){g->cue_bus[i].l+=block[i].l*coefficients[i][c+9];g->cue_bus[i].r+=block[i].r*coefficients[i][c+9];block[i].l*=coefficients[i][c];block[i].r*=coefficients[i][c];}
  if(post[c])cfx(g,c,block);
  if(g->beat)lab_beat_fx_offer(g->beat,c,block);
  for(unsigned i=0;i<64;i++){g->master_bus[i].l+=block[i].l*coefficients[i][c+4];g->master_bus[i].r+=block[i].r*coefficients[i][c+4];}
 }
 if(g->beat)lab_beat_fx_offer(g->beat,4,g->master_bus);
 for(unsigned i=0;i<64;i++){g->master_bus[i].l*=coefficients[i][8];g->master_bus[i].r*=coefficients[i][8];out[i*4]=g->master_bus[i].l;out[i*4+1]=g->master_bus[i].r;float hp=coefficients[i][13],mix=coefficients[i][14];out[i*4+2]=hp*((1-mix)*g->cue_bus[i].l+mix*g->master_bus[i].l);out[i*4+3]=hp*((1-mix)*g->cue_bus[i].r+mix*g->master_bus[i].r);}
#ifdef LAB_HEADPHONE_DSP
 if(g->headphones){
  float master[128],cue[128],phones[128];
  for(unsigned i=0;i<64;i++){master[2*i]=g->master_bus[i].l;master[2*i+1]=g->master_bus[i].r;cue[2*i]=g->cue_bus[i].l;cue[2*i+1]=g->cue_bus[i].r;}
  if(!lab_headphone_process(g->headphones,master,cue,phones,64))return -1;
  for(unsigned i=0;i<64;i++){out[4*i+2]=phones[2*i]*g->headphone_output_scale;out[4*i+3]=phones[2*i+1]*g->headphone_output_scale;}
 }
#endif
 return 1;
}
int lab_dsp_graph_reset(LabDspGraph *g){
 if(!ready(g))return -1;
 LabBeatFx *beat=g->beat;
 const LabEqTables *tables=g->eq_tables;LabEqControl eq_controls[4];unsigned eq_valid[4];
 memcpy(eq_controls,g->eq_controls,sizeof eq_controls);memcpy(eq_valid,g->eq_control_valid,sizeof eq_valid);
#ifdef LAB_HEADPHONE_DSP
 LabHeadphoneDsp *hp=g->headphones;float scale=g->headphone_output_scale;uint32_t mode=1;
 if(hp)memcpy(&mode,hp->state+200,4);
#endif
 LabMix mix=g->mix_target;LabCfxControl controls[4];memcpy(controls,g->controls,sizeof controls);
 lab_dsp_graph_init(g,44100,&mix);
 if(tables){lab_dsp_graph_attach_eq(g,tables);for(unsigned c=0;c<4;c++)if(eq_valid[c])lab_dsp_graph_set_eq(g,c,eq_controls[c].mode,eq_controls[c].high,eq_controls[c].mid,eq_controls[c].low);}
#ifdef LAB_HEADPHONE_DSP
 if(hp){lab_headphone_init(hp,44100,hp->tables,776);lab_headphone_mode(hp,1-mode);lab_dsp_graph_attach_headphones(g,hp,scale);}
#endif
 if(beat){lab_beat_fx_reset(beat);lab_dsp_graph_attach_beat(g,beat);}
 for(unsigned c=0;c<4;c++)lab_dsp_graph_set_cfx(g,c,controls[c].type,controls[c].color,controls[c].parameter);
 return 1;
}
