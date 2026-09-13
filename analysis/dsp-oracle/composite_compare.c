/* Reuse the established Filter snapshot serialization/oracle layout, but run
 * the manager with the actual native Filter callbacks in this separate suite. */
#define main coefficient_suite_not_invoked
#include "cfx_compare.c"
#undef main
#include "cfx_composed.h"
#ifndef HOST_REPLAY
typedef struct {void **vt;uint32_t unused[5];int position;float color,parameter;} OffEffect;
typedef struct {Stereo step,target,current;uint32_t count,length;float inverse;uint8_t done,pad[3];} NativeManagerRamp;
typedef struct {void *active,*effects[7];int current,next,previous;Stereo *buffer;NativeManagerRamp wet,dry;int phase;void *channel;} CompositeNativeManager;
_Static_assert(offsetof(CompositeNativeManager,phase)==128,"manager ABI");
extern void manager_native(CompositeNativeManager *,Stereo *,int);
extern void manager_native_set_type(CompositeNativeManager *,int);
extern void cfx_native_adjust(void *,int,float);
extern void cfx_native_color(void *);
extern void cfx_native_parameter(void *);
static CompositeNativeManager manager;
static OffEffect off,sweep;
static Stereo buffer[64];static unsigned inits[2],processes[2],ticks;
static void off_process(void *p,const Stereo *in,Stereo *out,int n){(void)p;processes[0]++;memcpy(out,in,(size_t)n*sizeof(Stereo));}
static void filter_process(void *p,const Stereo *in,Stereo *out,int n){processes[1]++;cfx_native_execute(p,in,out,n);}
static void off_init(void *p){(void)p;inits[0]++;}
static void filter_init(void *p){inits[1]++;cfx_native_initialize(p);}
static void sweep_tick(void *p){(void)p;ticks++;}
static void noop(void *p){(void)p;}
static void *off_vt[10]={0,0,(void *)off_process,(void *)cfx_native_adjust,(void *)off_init,(void *)sweep_tick,(void *)noop,(void *)noop,0,0};
static void *filter_vt[10]={0,0,(void *)filter_process,(void *)cfx_native_adjust,(void *)filter_init,0,(void *)cfx_native_color,(void *)cfx_native_parameter,0,0};
static void reset_composite_native(void){
 reset_native(0.5f,0.5f);native.unused[0]=(uint32_t)filter_vt;native.unused[6]=1;
 cfx_native_initialize(&native);
 memset(&manager,0,sizeof manager);memset(&off,0,sizeof off);memset(&sweep,0,sizeof sweep);
 off.vt=off_vt;off.position=1;off.color=off.parameter=0.5f;sweep=off;
 manager.active=&off;manager.effects[0]=&off;manager.effects[1]=&native;manager.effects[3]=&sweep;manager.buffer=buffer;
 manager.wet.current=manager.wet.target=(Stereo){1,1};manager.wet.length=manager.dry.length=191;
 manager.wet.inverse=manager.dry.inverse=1.0f/191.0f;manager.wet.done=manager.dry.done=1;
 memset(inits,0,sizeof inits);memset(processes,0,sizeof processes);ticks=0;
}
static ManagerRamp snap_ramp(const NativeManagerRamp *r){return (ManagerRamp){r->step.l,r->target.l,r->current.l,r->count,r->length,r->inverse,r->done};}
static FilterManager snap_manager(void){
 FilterManager m;memset(&m,0,sizeof m);m.current=manager.current;m.active=manager.current;m.next=manager.next;m.phase=manager.phase;
 m.wet=snap_ramp(&manager.wet);m.dry=snap_ramp(&manager.dry);
 m.color[0]=off.color;m.color[1]=native.color;m.parameter[0]=off.parameter;m.parameter[1]=native.parameter;
 for(int j=0;j<2;j++){m.initialized[j]=inits[j];m.processed[j]=processes[j];}m.sweep_ticks=ticks;return m;
}
#endif
static unsigned long composite_frames,composite_calls,busy;
static void test_block(ComposedCfx *c,size_t n,unsigned seed){
 Stereo input[65],actual[64],expected[64];
 for(size_t i=0;i<n;i++){
  seed=seed*1664525u+1013904223u;input[i].l=((int)(seed&65535)-32768)/131072.0f;
  seed=seed*1664525u+1013904223u;input[i].r=((int)(seed&65535)-32768)/131072.0f;
 }
 input[n]=(Stereo){0,0};if(seed%7==0)memset(input,0,n*sizeof(Stereo));
 memcpy(actual,input,n*sizeof(Stereo));FilterManager em;CfxHistory eh;
#ifndef HOST_REPLAY
 manager_native(&manager,input,(int)n);memcpy(expected,input,n*sizeof(Stereo));
 em=snap_manager();for(int j=0;j<2;j++){memcpy(eh.x[j],mocks[j].x,sizeof mocks[j].x);memcpy(eh.y[j],mocks[j].y,sizeof mocks[j].y);}
#endif
 composed_process(c,actual,n);check(&c->filter);
#ifndef HOST_REPLAY
 if(fwrite(&em,sizeof em,1,records)!=1||fwrite(&eh,sizeof eh,1,records)!=1||fwrite(expected,sizeof(Stereo),n,records)!=n)exit(2);
#else
 if(fread(&em,sizeof em,1,records)!=1||fread(&eh,sizeof eh,1,records)!=1||fread(expected,sizeof(Stereo),n,records)!=n)exit(2);
#endif
 /* Padding is cleared at initialization and these structs contain no pointers. */
 if(memcmp(&em,&c->manager,sizeof em)){mismatches++;if(mismatches<5)fprintf(stderr,"Composite manager mismatch call %lu\n",calls);}
 for(int j=0;j<2;j++)for(int k=0;k<2;k++){
  compare_float(eh.x[j][k].l,c->history.x[j][k].l);compare_float(eh.x[j][k].r,c->history.x[j][k].r);
  compare_float(eh.y[j][k].l,c->history.y[j][k].l);compare_float(eh.y[j][k].r,c->history.y[j][k].r);
 }
 for(size_t i=0;i<n;i++){compare_float(expected[i].l,actual[i].l);compare_float(expected[i].r,actual[i].r);}
 composite_frames+=n;composite_calls++;
}
int main(int argc,char **argv){
 if(argc!=2)return 2;
#ifdef HOST_REPLAY
 records=fopen(argv[1],"rb");
#else
 records=fopen(argv[1],"wb");
#endif
 if(!records)return 2;
 ComposedCfx c;composed_init(&c);
#ifndef HOST_REPLAY
 reset_composite_native();
#endif
 const size_t lengths[]={0,1,2,3,7,16,31,63,64};
 for(unsigned j=0;j<12000;j++){
  if(j%19==0||j%41<4){int target=(j/3)%2;if(!filter_manager_request(&c.manager,target))busy++;
#ifndef HOST_REPLAY
   manager_native_set_type(&manager,target);
#endif
  }
  if(j%17==0){float color=(j%1024)/1023.0f,parameter=(j%33)/32.0f;composed_controls(&c,color,parameter);
#ifndef HOST_REPLAY
   cfx_native_adjust(manager.active,7,color);cfx_native_adjust(manager.active,8,parameter);
#endif
  }
  test_block(&c,lengths[j%9],j+51);
 }
#ifdef HOST_REPLAY
 if(fgetc(records)!=EOF)return 2;
#endif
 fclose(records);
 printf("{\"calls\":%lu,\"stereo_frames\":%lu,\"numeric_values_compared\":%lu,\"mismatches\":%lu,\"max_abs_error\":%.17g,\"busy_requests\":%lu}\n",composite_calls,composite_frames,compared,mismatches,maxerr,busy);
 return mismatches?1:0;
}
