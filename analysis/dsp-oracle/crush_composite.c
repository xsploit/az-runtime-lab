#define main prior_crush_main
#include "crush_compare.c"
#undef main
#include "cfx_crush.h"
#ifndef HOST_REPLAY
typedef struct {uint32_t *vt,unused[5];int position;float color,parameter;} Off;
typedef struct {Stereo step,target,current;uint32_t count,length;float inverse;uint8_t done,pad[3];} NRamp;
typedef struct {void *active,*effects[7];int current,next,previous;Stereo *buffer;NRamp wet,dry;int phase;void *channel;} NManager;
extern void manager_native(NManager*,Stereo*,int),manager_native_set_type(NManager*,int),cfx_native_adjust(void*,int,float);
static NManager manager;static Crush native;static Off off,sweep;static uint32_t ovt[12];static unsigned ni[2],np[2],nt;static Stereo nscratch[64];
static void no_op(void *p){(void)p;}
static void off_exec(void *p,const Stereo *a,Stereo *b,int n){(void)p;np[0]++;memcpy(b,a,(size_t)n*sizeof *a);}
static void n_exec(Crush *p,const Stereo *a,Stereo *b,int n){np[1]++;native_crush_execute(p,a,b,n);}
static void n_init(Crush *p){ni[1]++;native_crush_init(p);}
static void off_init(void *p){(void)p;ni[0]++;}static void tick(void *p){(void)p;nt++;}
static ManagerRamp nr(const NRamp *r){return (ManagerRamp){r->step.l,r->target.l,r->current.l,r->count,r->length,r->inverse,r->done};}
static FilterManager capture(void){FilterManager m={0};m.current=!!manager.current;m.next=!!manager.next;m.phase=manager.phase;m.wet=nr(&manager.wet);m.dry=nr(&manager.dry);m.color[0]=off.color;m.color[1]=native.color;m.parameter[0]=off.parameter;m.parameter[1]=native.parameter;memcpy(m.initialized,ni,sizeof ni);memcpy(m.processed,np,sizeof np);m.sweep_ticks=nt;return m;}
#endif
int main(int argc,char **argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
FILE *f=fopen(argv[1],"rb");
#else
FILE *f=fopen(argv[1],"wb");
#endif
if(!f)return 2;
CrushComposite c;cfx_crush_init(&c);
#ifndef HOST_REPLAY
vt[2]=(uint32_t)n_exec;vt[3]=(uint32_t)cfx_native_adjust;vt[4]=(uint32_t)n_init;vt[6]=(uint32_t)native_crush_color;vt[7]=(uint32_t)native_crush_parameter;
native=c.crush;native.vtable=(uint32_t)vt;
for(unsigned i=0;i<12;i++){ovt[i]=(uint32_t)no_op;}ovt[2]=(uint32_t)off_exec;ovt[3]=(uint32_t)cfx_native_adjust;ovt[4]=(uint32_t)off_init;ovt[5]=(uint32_t)tick;off.vt=ovt;off.position=1;off.color=off.parameter=.5f;sweep=off;
manager.active=&off;manager.effects[0]=&off;manager.effects[6]=&native;manager.effects[3]=&sweep;manager.buffer=nscratch;manager.wet.current=manager.wet.target=(Stereo){1,1};manager.wet.length=manager.dry.length=191;manager.wet.inverse=manager.dry.inverse=1.0f/191;manager.wet.done=manager.dry.done=1;
#endif
unsigned long frames=0;const unsigned sizes[]={0,1,2,3,7,16,31,63,64};
for(unsigned j=0;j<12000;j++){
if(j%19==0||j%41<4){int target=(j/3)%2;filter_manager_request(&c.manager,target);
#ifndef HOST_REPLAY
manager_native_set_type(&manager,target?6:0);
#endif
}
if(j%17==0){float color=(j%1024)/1023.0f,param=(j%33)/32.0f;cfx_crush_controls(&c,color,param);
#ifndef HOST_REPLAY
cfx_native_adjust(manager.active,7,color);cfx_native_adjust(manager.active,8,param);
#endif
}
unsigned n=sizes[j%9];Stereo audio[64],expected[64];for(unsigned i=0;i<n;i++)audio[i]=expected[i]=(Stereo){rnd(),rnd()};Crush ref;FilterManager mr;
#ifndef HOST_REPLAY
manager_native(&manager,expected,n);ref=native;ref.vtable=0;mr=capture();fwrite(&ref,sizeof ref,1,f);fwrite(&mr,sizeof mr,1,f);fwrite(expected,sizeof *expected,n,f);
#else
if(fread(&ref,sizeof ref,1,f)!=1||fread(&mr,sizeof mr,1,f)!=1||fread(expected,sizeof *expected,n,f)!=n)return 2;
#endif
cfx_crush_process(&c,audio,n);compare(&c.crush,&ref,sizeof ref,j,"Crush");compare(&c.manager,&mr,sizeof mr,j,"manager");compare(audio,expected,n*sizeof *audio,j,"audio");frames+=n;
}
fclose(f);printf("{\"calls\":12000,\"frames\":%lu,\"words\":%u,\"mismatches\":%u}\n",frames,checks,differences);return differences?1:0;}
