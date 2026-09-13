#include "cfx_manager.h"
#include <string.h>
#include <math.h>
static float mfz(float x){uint32_t u;memcpy(&u,&x,4);if(!(u&0x7f800000u)){u&=0x80000000u;memcpy(&x,&u,4);}return x;}
static float mmul(float a,float b){return mfz(mfz(a)*mfz(b));}
static float madd(float a,float b){return mfz(mfz(a)+mfz(b));}
static float msub(float a,float b){return mfz(mfz(a)-mfz(b));}
void filter_manager_init(FilterManager *m,unsigned length){
 memset(m,0,sizeof *m);m->wet.current=m->wet.target=1;
 m->wet.length=m->dry.length=length;m->wet.inverse=m->dry.inverse=1.0f/(float)length;
 m->wet.done=m->dry.done=1;m->color[0]=m->color[1]=m->parameter[0]=m->parameter[1]=0.5f;
}
int filter_manager_request(FilterManager *m,int type){
 if(type!=0&&type!=1&&type!=2&&type!=3&&type!=4&&type!=5&&type!=6)return -1;
 if(m->phase!=0&&m->phase!=5)return 0;
 m->next=type;return 1;
}
static void target(ManagerRamp *r,float v){
 float next=madd(r->current,r->step);r->target=v;r->step=mmul(msub(v,next),r->inverse);r->count=0;r->done=0;
}
static void tick(ManagerRamp *r){
 r->current=madd(r->current,r->step);
 if(r->count>=r->length){r->current=r->target;r->done=1;}
 r->count++;
}
void filter_manager_process(FilterManager *m,Stereo *in,Stereo *scratch,size_t n,const FilterManagerCallbacks *cb){
 m->sweep_ticks++;
 if((m->phase==0||m->phase==5)&&m->current!=m->next){
  m->phase=1;
  int active=m->active;
  if(m->next==0&&(active==4||active==5)&&cb->off(cb->context,active)){
   m->previous=m->current;m->current=m->next=7;m->phase=5;goto process_active;
  }
  if(m->current==7&&(m->next==4||m->next==5)&&m->previous==m->next){cb->on(cb->context,active);m->current=m->next;m->phase=0;goto process_active;}

  if((m->current==1&&m->next==3)||(m->current==3&&m->next==1)){float color=m->color[m->current];if(color<.41796875f||color>.578125f)m->phase=2;}
  if(fabsf(m->dry.current)>0.00000011920928955078125f)target(&m->dry,0);
  target(&m->wet,0);
 }
process_active:;
 int active=m->active;
 m->processed[active]++;cb->process(cb->context,active,in,scratch,n);
 if(m->phase==3&&m->current==2){
  float step;uint32_t u=UINT32_C(0x3cba2e8c);memcpy(&step,&u,4);float alpha=step;
  for(size_t i=0;i<n;i++){scratch[i].l=madd(mmul(scratch[i].l,alpha),mmul(in[i].l,msub(1,alpha)));scratch[i].r=madd(mmul(scratch[i].r,alpha),mmul(in[i].r,msub(1,alpha)));if(i+1<n){alpha+=step;if(alpha>1){alpha=1;step=0;}}}
  if(n&&alpha>=1){m->wet.current=m->wet.target=1;m->wet.step=0;m->phase=0;}
 }else if(m->phase>=1&&m->phase<=4){
  unsigned old_phase=m->phase;
  for(size_t i=0;i<n;i++){
   float w=m->wet.current,d=old_phase==2||old_phase==4?0:msub(1.0f,w);
   scratch[i].l=old_phase==2||old_phase==4?mmul(scratch[i].l,w):madd(mmul(scratch[i].l,w),mmul(in[i].l,d));
   scratch[i].r=old_phase==2||old_phase==4?mmul(scratch[i].r,w):madd(mmul(scratch[i].r,w),mmul(in[i].r,d));tick(&m->wet);
  }
  if(m->wet.done){
   if(old_phase==1||old_phase==2){
    if(old_phase==2&&m->current==1&&m->next==3)m->eq_reset_requests++;
    if(m->current!=m->next){
     m->color[m->next]=m->color[active];m->parameter[m->next]=m->parameter[active];
     cb->initialize(cb->context,m->next,m->color[m->next],m->parameter[m->next]);
     m->initialized[m->next]++;m->current=m->next;m->active=m->current;target(&m->wet,1);
    }
    m->phase=old_phase==2?4:3;
   }else m->phase=0;
  }
 }
 for(size_t i=0;i<n;i++){
  in[i].l=madd(mmul(in[i].l,m->dry.current),scratch[i].l);
  in[i].r=madd(mmul(in[i].r,m->dry.current),scratch[i].r);
  if(!m->dry.done)tick(&m->dry);
 }
}

#include "cfx_manager.h"
#include <string.h>
void lab_cfx_manager_init(LabCfxManager *c){
 memset(c,0,sizeof *c);dub_runtime_default(&c->dub);space_default(&c->space);sweep_runtime_construct(&c->sweep);filter_manager_init(&c->manager,191);
 c->filter.color=c->filter.parameter=0.5f;c->filter.blend=c->filter.dry=c->filter.dry_target=1;c->filter.low_side=1;
 cfx_filter_initialize(&c->filter);
 c->crush.rate=c->crush.rate2=44100;c->crush.inverse=1.0f/44100;c->crush.position=1;c->crush.color=c->crush.parameter=.5f;crush_init(&c->crush);
 Noise *s=&c->noise;s->rate=s->rate2=44100;s->inverse=1.0f/44100;s->block=s->allocated=64;s->color=s->parameter=.5f;s->mix_target=s->mix=1;s->res_target=s->res=.7f;s->feedback_gain=(Stereo){.7f,.7f};s->inv_block=1.0f/64;s->current=s->target=127;s->seed[0]=0x67452301;s->seed[1]=0xefcdab89;noise_init(s,&c->noise_filter);
}
void lab_cfx_manager_controls(LabCfxManager *c,float color,float parameter){
 int active=c->manager.active;c->manager.color[active]=color;c->manager.parameter[active]=parameter;
 if(active==5){space_put_float(&c->space.state,28,color);space_put_float(&c->space.state,32,parameter);}
 if(active==4){dub_put_float(&c->dub.state,28,color);dub_put_float(&c->dub.state,32,parameter);dub_color(&c->dub.state);dub_parameter(&c->dub.state);}
 if(active==3){sweep_put_float(&c->sweep.state,28,color);sweep_put_float(&c->sweep.state,32,parameter);c->sweep.state.word[64]=(unsigned)((int)(color*1023)>>2);((unsigned char*)&c->sweep.state)[260]=1;}
 if(active==2){c->noise.color=color;c->noise.parameter=parameter;noise_color(&c->noise);}
 if(active==6){c->crush.color=color;c->crush.parameter=parameter;crush_color(&c->crush);crush_parameter(&c->crush);}
 if(active==1){cfx_filter_color(&c->filter,color);cfx_filter_parameter(&c->filter,parameter);}
}
static void process(void *context,int type,const Stereo *in,Stereo *out,size_t n){
 LabCfxManager *c=context;if(!type){memcpy(out,in,n*sizeof(Stereo));return;}
 if(type==5){space_execute(&c->space,in,out,(int)n);return;}
 if(type==4){dub_runtime_execute(&c->dub,in,out,(int)n);return;}
 if(type==3){sweep_runtime_execute(&c->sweep,in,out,(int)n);return;}
 if(type==2){noise_execute(&c->noise,&c->noise_filter,in,out,(unsigned)n);return;}
 if(type==6){crush_execute(&c->crush,in,out,(unsigned)n);return;}
 cfx_filter_process(&c->filter,&c->history,in,out,c->low,c->high,n);
}
static void initialize(void *context,int type,float color,float parameter){
 LabCfxManager *c=context;if(!type)return;
 if(type==5){space_put_float(&c->space.state,28,color);space_put_float(&c->space.state,32,parameter);space_init(&c->space);return;}
 if(type==4){dub_put_float(&c->dub.state,28,color);dub_put_float(&c->dub.state,32,parameter);dub_runtime_init(&c->dub);return;}
 if(type==3){sweep_put_float(&c->sweep.state,28,color);sweep_put_float(&c->sweep.state,32,parameter);sweep_runtime_init(&c->sweep);return;}
 if(type==2){c->noise.color=color;c->noise.parameter=parameter;noise_init(&c->noise,&c->noise_filter);return;}
 if(type==6){c->crush.color=color;c->crush.parameter=parameter;crush_init(&c->crush);return;}
 cfx_filter_color(&c->filter,color);cfx_filter_parameter(&c->filter,parameter);
 cfx_filter_initialize(&c->filter);memset(&c->history,0,sizeof c->history);
}
static int effect_on(void*context,int type){LabCfxManager*c=context;return type==5?space_on(&c->space.state):type==4?dub_on(&c->dub.state):0;}
static int effect_off(void*context,int type){LabCfxManager*c=context;return type==5?space_off(&c->space.state):type==4?dub_off(&c->dub.state):0;}
void lab_cfx_manager_process(LabCfxManager *c,Stereo *in,size_t n){
 sweep_runtime_detect(&c->sweep,in,(int)n);
 const FilterManagerCallbacks cb={c,process,initialize,effect_on,effect_off};filter_manager_process(&c->manager,in,c->scratch,n,&cb);
}
