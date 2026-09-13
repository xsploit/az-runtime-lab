#include "cfx_manager_filter.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stddef.h>
#include <math.h>
static unsigned calls,mismatches,busy_requests,accepted_requests;
static double max_error;static FILE *records;
#ifndef HOST_REPLAY
typedef struct {void **vt;uint32_t unused[5];int position;float color,parameter;unsigned id,init,process,adjust,tick;} Effect;
typedef struct {Stereo step,target,current;uint32_t count,length;float inverse;uint8_t done,pad[3];} NativeRamp;
typedef struct {Effect *active,*effects[7];int current,next,previous;Stereo *buffer;NativeRamp wet,dry;int phase;void *channel;} NativeManager;
_Static_assert(sizeof(NativeRamp)==40,"ramp ABI");
_Static_assert(offsetof(Effect,color)==28,"effect ABI");
_Static_assert(offsetof(NativeManager,phase)==128,"manager ABI");
extern void manager_native(NativeManager *,Stereo *,int);
extern void manager_native_set_type(NativeManager *,int);
static void process(Effect *e,const Stereo *in,Stereo *out,int n){
 float gain=e->id?0.25f:1.0f;e->process++;
 for(int i=0;i<n;i++)out[i]=(Stereo){in[i].l*gain,in[i].r*gain};
}
static void adjust(Effect *e,int id,float p){if(id==7)e->color=p;if(id==8)e->parameter=p;e->adjust++;}
static void init(Effect *e){e->init++;}
static void tick(Effect *e){e->tick++;}
static int onoff(Effect *e){(void)e;return 1;}
static void *vt[10]={0,0,(void *)process,(void *)adjust,(void *)init,(void *)tick,0,0,(void *)onoff,(void *)onoff};
static Effect effects[7];static NativeManager nm;static Stereo native_buffer[256];
static void reset_native(unsigned length){
 memset(&nm,0,sizeof nm);memset(effects,0,sizeof effects);
 for(int j=0;j<7;j++){effects[j].vt=vt;effects[j].position=1;effects[j].color=effects[j].parameter=0.5f;effects[j].id=j;nm.effects[j]=effects+j;}
 nm.active=effects;nm.buffer=native_buffer;nm.wet.current=nm.wet.target=(Stereo){1,1};
 nm.wet.length=nm.dry.length=length;nm.wet.inverse=nm.dry.inverse=1.0f/length;nm.wet.done=nm.dry.done=1;
}
static ManagerRamp snapshot_ramp(const NativeRamp *r){return (ManagerRamp){r->step.l,r->target.l,r->current.l,r->count,r->length,r->inverse,r->done};}
static FilterManager snapshot(void){
 FilterManager s;memset(&s,0,sizeof s);s.current=nm.current;s.active=nm.current;s.next=nm.next;s.phase=nm.phase;
 s.wet=snapshot_ramp(&nm.wet);s.dry=snapshot_ramp(&nm.dry);
 for(int j=0;j<2;j++){s.color[j]=effects[j].color;s.parameter[j]=effects[j].parameter;s.initialized[j]=effects[j].init;s.processed[j]=effects[j].process;}
 s.sweep_ticks=effects[3].tick;return s;
}
#endif
static void checkfloat(float a,float b){
 if(memcmp(&a,&b,4)){mismatches++;double d=fabs((double)a-b);if(d>max_error)max_error=d;if(mismatches<5)fprintf(stderr,"Manager float mismatch call %u: %.9g / %.9g\n",calls,a,b);}
}
static void checkramp(const ManagerRamp *a,const ManagerRamp *b){
 checkfloat(a->step,b->step);checkfloat(a->target,b->target);checkfloat(a->current,b->current);checkfloat(a->inverse,b->inverse);
 if(a->count!=b->count||a->length!=b->length||a->done!=b->done)mismatches++;
}
static void run(FilterManager *m,size_t n,unsigned seed){
 Stereo expected[256],actual[256],scratch[256];
 for(size_t i=0;i<n;i++){seed=seed*1664525u+1013904223u;actual[i].l=((int)(seed&65535)-32768)/65536.0f;seed=seed*1664525u+1013904223u;actual[i].r=((int)(seed&65535)-32768)/65536.0f;}
 memcpy(expected,actual,n*sizeof(Stereo));FilterManager ns;
#ifndef HOST_REPLAY
 manager_native(&nm,expected,(int)n);ns=snapshot();
 if(fwrite(&ns,sizeof ns,1,records)!=1||fwrite(expected,sizeof(Stereo),n,records)!=n)exit(2);
#else
 if(fread(&ns,sizeof ns,1,records)!=1||fread(expected,sizeof(Stereo),n,records)!=n)exit(2);
#endif
 filter_manager_mock_process(m,actual,scratch,n);calls++;
 if(m->current!=ns.current||m->next!=ns.next||m->phase!=ns.phase||m->sweep_ticks!=ns.sweep_ticks){mismatches++;if(mismatches<5)fprintf(stderr,"Manager state mismatch call%u phases %d/%d\n",calls,ns.phase,m->phase);}
 checkramp(&ns.wet,&m->wet);checkramp(&ns.dry,&m->dry);
 for(int j=0;j<2;j++){
  checkfloat(ns.color[j],m->color[j]);checkfloat(ns.parameter[j],m->parameter[j]);
  if(ns.initialized[j]!=m->initialized[j]||ns.processed[j]!=m->processed[j])mismatches++;
 }
 for(size_t i=0;i<n;i++){checkfloat(expected[i].l,actual[i].l);checkfloat(expected[i].r,actual[i].r);}
}
int main(int argc,char **argv){
 if(argc!=2)return 2;
#ifdef HOST_REPLAY
 records=fopen(argv[1],"rb");
#else
 records=fopen(argv[1],"wb");
#endif
 if(!records)return 2;
 const unsigned lengths[]={1,2,7,64,191,256};const size_t blocks[]={0,1,2,3,7,16,63,64,65,128,256};
 FilterManager m;
 for(unsigned trial=0;trial<6;trial++){
  filter_manager_init(&m,lengths[trial]);
#ifndef HOST_REPLAY
  reset_native(lengths[trial]);
#endif
  for(unsigned j=0;j<2200;j++){
   if(j%13==0||j%29<5){int type=(j/3)%2;int accepted=filter_manager_request(&m,type);if(accepted)accepted_requests++;else busy_requests++;
#ifndef HOST_REPLAY
    manager_native_set_type(&nm,type);
#endif
   }
   if(j%17==0){m.color[m.current]=(j%1024)/1023.0f;m.parameter[m.current]=(j%33)/32.0f;
#ifndef HOST_REPLAY
    nm.active->color=m.color[m.current];nm.active->parameter=m.parameter[m.current];
#endif
   }
   run(&m,blocks[j%11],j+51);
  }
 }
#ifdef HOST_REPLAY
 if(fgetc(records)!=EOF)return 2;
#endif
 fclose(records);printf("{\"block_calls\":%u,\"mismatches\":%u,\"max_abs_error\":%.17g,\"accepted_requests\":%u,\"busy_requests_ignored\":%u}\n",calls,mismatches,max_error,accepted_requests,busy_requests);
 return mismatches?1:0;
}
