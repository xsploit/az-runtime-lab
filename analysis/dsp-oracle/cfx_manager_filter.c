#include "cfx_manager_filter.h"
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
 if(type!=0&&type!=1&&type!=6)return -1;
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
  if(fabsf(m->dry.current)>0.00000011920928955078125f)target(&m->dry,0);
  target(&m->wet,0);
 }
 m->processed[m->current]++;cb->process(cb->context,m->current,in,scratch,n);
 if(m->phase==1||m->phase==3){
  for(size_t i=0;i<n;i++){
   float w=m->wet.current,d=msub(1.0f,w);
   scratch[i].l=madd(mmul(scratch[i].l,w),mmul(in[i].l,d));
   scratch[i].r=madd(mmul(scratch[i].r,w),mmul(in[i].r,d));tick(&m->wet);
  }
  if(m->wet.done){
   if(m->phase==1){
    if(m->current!=m->next){
     m->color[m->next]=m->color[m->current];m->parameter[m->next]=m->parameter[m->current];
     cb->initialize(cb->context,m->next,m->color[m->next],m->parameter[m->next]);
     m->initialized[m->next]++;m->current=m->next;m->active=m->current;target(&m->wet,1);
    }
    m->phase=3;
   }else m->phase=0;
  }
 }
 for(size_t i=0;i<n;i++){
  in[i].l=madd(mmul(in[i].l,m->dry.current),scratch[i].l);
  in[i].r=madd(mmul(in[i].r,m->dry.current),scratch[i].r);
  if(!m->dry.done)tick(&m->dry);
 }
}
static void mock_process(void *unused,int type,const Stereo *in,Stereo *out,size_t n){
 (void)unused;float gain=type?0.25f:1.0f;
 for(size_t i=0;i<n;i++)out[i]=(Stereo){in[i].l*gain,in[i].r*gain};
}
static void mock_initialize(void *unused,int type,float color,float parameter){(void)unused;(void)type;(void)color;(void)parameter;}
void filter_manager_mock_process(FilterManager *m,Stereo *in,Stereo *scratch,size_t n){
 const FilterManagerCallbacks cb={0,mock_process,mock_initialize};filter_manager_process(m,in,scratch,n,&cb);
}
