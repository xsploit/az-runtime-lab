#include "../../mixer/cfx_manager.h"
#define CFX_SHARED 1
#define ComposedCfx LabCfxManager
#define composed_init lab_cfx_manager_init
#define composed_controls lab_cfx_manager_controls
#define composed_process lab_cfx_manager_process
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
static OffEffect off,sweep_unused;
static Stereo buffer[64];static unsigned inits[7],processes[7],ticks;
typedef struct {uint32_t *vtable;NoiseFilter f;} NativeNoiseFilter;
static Noise nnoise;static NativeNoiseFilter nnf;static uint32_t noise_vt[12],nfilter_vt[8];static Stereo noise_buffer[64];
extern void native_noise_color(Noise*),native_noise_init(Noise*),native_noise_execute(Noise*,const Stereo*,Stereo*,int);
static void noise_coeff_native(NativeNoiseFilter *f,const Stereo *v){memcpy(f->f.coeff,v,40);}
static void noise_clear_native(NativeNoiseFilter *f){f->f.clears++;memset(f->f.x,0,32);}
static void noise_filter_native(NativeNoiseFilter *f,const Stereo *a,Stereo *b,unsigned n){iir_native(a,b,f->f.coeff,f->f.x,f->f.y,n);}
static void noise_process_native(Noise *s,const Stereo *a,Stereo *b,int n){processes[2]++;native_noise_execute(s,a,b,n);}
static void noise_init_native(Noise *s){inits[2]++;native_noise_init(s);}
static Crush ncrush;static uint32_t crush_vt[12];
extern void native_crush_execute(Crush*,const Stereo*,Stereo*,int),native_crush_init(Crush*),native_crush_color(Crush*),native_crush_parameter(Crush*);
static void crush_process_native(Crush *c,const Stereo *a,Stereo *b,int n){processes[6]++;native_crush_execute(c,a,b,n);}
static void crush_init_native(Crush *c){inits[6]++;native_crush_init(c);}
static void off_process(void *p,const Stereo *in,Stereo *out,int n){(void)p;processes[0]++;memcpy(out,in,(size_t)n*sizeof(Stereo));}
static void filter_process(void *p,const Stereo *in,Stereo *out,int n){processes[1]++;cfx_native_execute(p,in,out,n);}
static void off_init(void *p){(void)p;inits[0]++;}
static void filter_init(void *p){inits[1]++;cfx_native_initialize(p);}
extern void native_sweep_init(Sweep *),native_sweep_execute(Sweep *,const Stereo *,Stereo *,int),native_sweep_detect(Sweep *,const Stereo *,int);
static SweepRuntime nsweep;typedef struct{uint32_t vt;SweepFilter f;} SNF;static SNF snf[9];static uint32_t svt[10],sfvt[7],eqvt[6],eqobject,channel[108];static unsigned eq_clears;
static void scoeff(SNF*f,const float*c){sweep_filter_set(&f->f,c);}static void sclear(SNF*f){f->f.clears++;memset(f->f.x,0,32);}static void sprocess(SNF*f,const Stereo*a,Stereo*b,int n){iir_native(a,b,f->f.coeff,f->f.x,f->f.y,n);}
static void sdetect(Sweep*s,const Stereo*a,int n){ticks++;native_sweep_detect(s,a,n);}
static void sexecute(Sweep*s,const Stereo*a,Stereo*b,int n){processes[3]++;native_sweep_execute(s,a,b,n);}
static void sinit(Sweep*s){inits[3]++;native_sweep_init(s);}
static void scolor(Sweep*s){s->word[64]=(unsigned)((int)(sweep_float(s,28)*1023)>>2);}static void sparameter(Sweep*s){((unsigned char*)s)[260]=1;}
static void eqclear(void*p){(void)p;eq_clears++;}
static void sweep_tick(void *p){(void)p;ticks++;}
static void noop(void *p){(void)p;}
static void *off_vt[10]={0,0,(void *)off_process,(void *)cfx_native_adjust,(void *)off_init,(void *)sweep_tick,(void *)noop,(void *)noop,0,0};
static void *filter_vt[10]={0,0,(void *)filter_process,(void *)cfx_native_adjust,(void *)filter_init,0,(void *)cfx_native_color,(void *)cfx_native_parameter,0,0};
static DubRuntime ndub;typedef struct {uint32_t vt;DubFilter f;} DNF;typedef struct {int write,length;Stereo*data;} DND;
static DNF dnf[4];static DND dnd[2];static uint32_t dvt[10],dfvt[7];static unsigned alloc_index;
extern void native_dub_init(DubEcho*),native_dub_execute(DubEcho*,const Stereo*,Stereo*,int),native_dub_color(DubEcho*),native_dub_parameter(DubEcho*);
extern int native_dub_on(DubEcho*),native_dub_off(DubEcho*);
void *dub_alloc(unsigned n){if(n!=512)abort();return ndub.buffer[alloc_index++%6];}void dub_free(void*p){(void)p;}
static void dclear(DNF*f){memset(f->f.x,0,32);f->f.clears++;}static void dprocess(DNF*f,const Stereo*a,Stereo*b,int n){iir_native(a,b,f->f.coeff,f->f.x,f->f.y,(unsigned)n);}
static void dinit(DubEcho*s){inits[4]++;native_dub_init(s);}static void dexecute(DubEcho*s,const Stereo*a,Stereo*b,int n){processes[4]++;native_dub_execute(s,a,b,n);}
static SpaceRuntime nspace;typedef struct {uint32_t word[18];SpaceFilter f;} SPF;static SPF spf[2];static uint32_t spvt[10],spfiltervt[7];float native_space_scratch[8][64];
extern void native_space_init(Space*),native_space_execute(Space*,const Stereo*,Stereo*,int),native_space_iir(void*,const float*,float*,unsigned);extern int native_space_on(Space*),native_space_off(Space*);
static void spclear(SPF*f){memset(f->f.x,0,16);f->f.clears++;}static void spset(SPF*f,const float*c){memcpy(f->f.coeff,c,20);f->f.updates++;}
static void spinit(Space*s){inits[5]++;native_space_init(s);}static void spexecute(Space*s,const Stereo*a,Stereo*b,int n){processes[5]++;native_space_execute(s,a,b,n);}
static void reset_composite_native(void){
 reset_native(0.5f,0.5f);native.unused[0]=(uint32_t)filter_vt;native.unused[6]=1;
 cfx_native_initialize(&native);
 memset(&manager,0,sizeof manager);memset(&off,0,sizeof off);memset(&sweep_unused,0,sizeof sweep_unused);
 off.vt=off_vt;off.position=1;off.color=off.parameter=0.5f;sweep_unused=off;
 manager.active=&off;manager.effects[0]=&off;manager.effects[1]=&native;manager.effects[3]=&sweep_unused;manager.buffer=buffer;
 memset(&ncrush,0,sizeof ncrush);ncrush.rate=ncrush.rate2=44100;ncrush.inverse=1.0f/44100;ncrush.position=1;ncrush.color=ncrush.parameter=.5f;
 crush_vt[2]=(uint32_t)crush_process_native;crush_vt[3]=(uint32_t)cfx_native_adjust;crush_vt[4]=(uint32_t)crush_init_native;crush_vt[6]=(uint32_t)native_crush_color;crush_vt[7]=(uint32_t)native_crush_parameter;ncrush.vtable=(uint32_t)crush_vt;native_crush_init(&ncrush);manager.effects[6]=&ncrush;
 memset(&nnoise,0,sizeof nnoise);memset(&nnf,0,sizeof nnf);nnoise.rate=nnoise.rate2=44100;nnoise.inverse=1.0f/44100;nnoise.block=nnoise.allocated=64;nnoise.color=nnoise.parameter=.5f;nnoise.mix_target=nnoise.mix=1;nnoise.res_target=nnoise.res=.7f;nnoise.feedback_gain=(Stereo){.7f,.7f};nnoise.inv_block=1.0f/64;nnoise.current=nnoise.target=127;nnoise.seed[0]=0x67452301;nnoise.seed[1]=0xefcdab89;
 nfilter_vt[3]=(uint32_t)noise_coeff_native;nfilter_vt[5]=(uint32_t)noise_filter_native;nfilter_vt[6]=(uint32_t)noise_clear_native;nnf.vtable=nfilter_vt;nnoise.filter=(uint32_t)&nnf;nnoise.buffer=(uint32_t)noise_buffer;
 noise_vt[2]=(uint32_t)noise_process_native;noise_vt[3]=(uint32_t)cfx_native_adjust;noise_vt[4]=(uint32_t)noise_init_native;noise_vt[6]=(uint32_t)native_noise_color;noise_vt[7]=(uint32_t)noop;nnoise.vtable=(uint32_t)noise_vt;native_noise_init(&nnoise);manager.effects[2]=&nnoise;
 sweep_runtime_construct(&nsweep);sfvt[2]=(uint32_t)scoeff;sfvt[5]=(uint32_t)sprocess;sfvt[6]=(uint32_t)sclear;
 for(unsigned k=0;k<9;k++){snf[k].vt=(uint32_t)sfvt;snf[k].f=nsweep.filter[k];nsweep.state.word[9+k]=(uint32_t)&snf[k];}
 for(unsigned a=0;a<2;a++){nsweep.state.word[18+a]=(uint32_t)nsweep.bands[a];nsweep.state.word[20+a]=(uint32_t)nsweep.temporary[a];nsweep.state.word[23+a]=(uint32_t)nsweep.levels[a];nsweep.state.word[25+a]=(uint32_t)nsweep.memory[a];}
 nsweep.state.word[22]=(uint32_t)nsweep.output;
 svt[2]=(uint32_t)sexecute;svt[3]=(uint32_t)cfx_native_adjust;svt[4]=(uint32_t)sinit;svt[5]=(uint32_t)sdetect;svt[6]=(uint32_t)scolor;svt[7]=(uint32_t)sparameter;nsweep.state.word[0]=(uint32_t)svt;manager.effects[3]=&nsweep.state;
 eqvt[5]=(uint32_t)eqclear;eqobject=(uint32_t)eqvt;channel[107]=(uint32_t)&eqobject;manager.channel=channel;eq_clears=0;
 dub_runtime_default(&ndub);dfvt[5]=(uint32_t)dprocess;dfvt[6]=(uint32_t)dclear;
 for(unsigned k=0;k<4;k++){dnf[k].vt=(uint32_t)dfvt;dnf[k].f=ndub.filter[k];ndub.state.word[10+k]=(uint32_t)&dnf[k];}
 for(unsigned k=0;k<6;k++)ndub.state.word[14+k]=(uint32_t)ndub.buffer[k];
 for(unsigned k=0;k<2;k++){dnd[k]=(DND){0,(int)ndub.length[k],ndub.ring[k]};ndub.state.word[20+k]=(uint32_t)&dnd[k];}
 dvt[2]=(uint32_t)dexecute;dvt[3]=(uint32_t)cfx_native_adjust;dvt[4]=(uint32_t)dinit;dvt[6]=(uint32_t)native_dub_color;dvt[7]=(uint32_t)native_dub_parameter;dvt[8]=(uint32_t)native_dub_on;dvt[9]=(uint32_t)native_dub_off;ndub.state.word[0]=(uint32_t)dvt;manager.effects[4]=&ndub.state;
 space_default(&nspace);spfiltervt[2]=(uint32_t)spset;spfiltervt[4]=(uint32_t)native_space_iir;spfiltervt[6]=(uint32_t)spclear;
 for(unsigned k=0;k<2;k++){spf[k].f=nspace.filter[k];spf[k].word[0]=(uint32_t)spfiltervt;spf[k].word[7]=(uint32_t)spf[k].f.coeff;spf[k].word[9]=(uint32_t)spf[k].f.x;spf[k].word[10]=(uint32_t)spf[k].f.y;nspace.state.word[33+k]=(uint32_t)&spf[k];}
 for(unsigned k=0;k<6;k++)nspace.state.word[14+k]=(uint32_t)nspace.ring[k];
 spvt[2]=(uint32_t)spexecute;spvt[3]=(uint32_t)cfx_native_adjust;spvt[4]=(uint32_t)spinit;spvt[6]=(uint32_t)noop;spvt[7]=(uint32_t)noop;spvt[8]=(uint32_t)native_space_on;spvt[9]=(uint32_t)native_space_off;nspace.state.word[0]=(uint32_t)spvt;manager.effects[5]=&nspace.state;
 manager.wet.current=manager.wet.target=(Stereo){1,1};manager.wet.length=manager.dry.length=191;
 manager.wet.inverse=manager.dry.inverse=1.0f/191.0f;manager.wet.done=manager.dry.done=1;
 memset(inits,0,sizeof inits);memset(processes,0,sizeof processes);ticks=0;
}
static ManagerRamp snap_ramp(const NativeManagerRamp *r){return (ManagerRamp){r->step.l,r->target.l,r->current.l,r->count,r->length,r->inverse,r->done};}
static FilterManager snap_manager(void){
 FilterManager m;memset(&m,0,sizeof m);m.current=manager.current;m.next=manager.next;m.phase=manager.phase;m.previous=manager.previous;for(int k=0;k<7;k++)if(manager.active==manager.effects[k])m.active=k;
 m.wet=snap_ramp(&manager.wet);m.dry=snap_ramp(&manager.dry);
 m.color[0]=off.color;m.color[1]=native.color;m.parameter[0]=off.parameter;m.parameter[1]=native.parameter;
 if(inits[5]){m.color[5]=space_float(&nspace.state,28);m.parameter[5]=space_float(&nspace.state,32);}
 if(inits[4]){m.color[4]=dub_float(&ndub.state,28);m.parameter[4]=dub_float(&ndub.state,32);}
 if(inits[3]){m.color[3]=sweep_float(&nsweep.state,28);m.parameter[3]=sweep_float(&nsweep.state,32);}
 if(inits[2]){m.color[2]=nnoise.color;m.parameter[2]=nnoise.parameter;}
 if(inits[6]){m.color[6]=ncrush.color;m.parameter[6]=ncrush.parameter;}
 for(int j=0;j<7;j++){m.initialized[j]=inits[j];m.processed[j]=processes[j];}m.sweep_ticks=ticks;m.eq_reset_requests=eq_clears;return m;
}
#endif
static unsigned transitions[8][8];
static unsigned long composite_frames,composite_calls,busy,to_crush,to_filter;
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
 int previous=c->manager.current;composed_process(c,actual,n);if(previous!=c->manager.current)transitions[previous][c->manager.current]++;if(previous==1&&c->manager.current==6)to_crush++;if(previous==6&&c->manager.current==1)to_filter++;check(&c->filter);
 SweepRuntime expected_sweep;
#ifndef HOST_REPLAY
 expected_sweep=nsweep;expected_sweep.state.word[0]=0;for(unsigned k=9;k<=26;k++)expected_sweep.state.word[k]=0;
 for(unsigned k=0;k<9;k++)expected_sweep.filter[k]=snf[k].f;
 for(unsigned k=0;k<4;k++){for(unsigned j=0;j<5;j++)expected_sweep.coefficients.coeff[k][j]=snf[k+5].f.coeff[j].l;expected_sweep.coefficients.updates[k]=snf[k+5].f.updates;}
 fwrite(&expected_sweep,sizeof expected_sweep,1,records);
#else
 if(fread(&expected_sweep,sizeof expected_sweep,1,records)!=1)exit(2);
#endif
 const uint32_t *sr=(void*)&expected_sweep,*sa=(void*)&c->sweep;for(unsigned i=0;i<sizeof(SweepRuntime)/4;i++){compared++;if(sr[i]!=sa[i]){mismatches++;if(mismatches<10)fprintf(stderr,"Sweep call%lu field%u %08x %08x\n",composite_calls,i,sr[i],sa[i]);}}
 static SpaceRuntime expected_space;
#ifndef HOST_REPLAY
 expected_space=nspace;expected_space.state.word[0]=0;for(unsigned k=14;k<20;k++)expected_space.state.word[k]=0;expected_space.state.word[33]=expected_space.state.word[34]=0;for(unsigned k=0;k<2;k++)expected_space.filter[k]=spf[k].f;memcpy(expected_space.scratch,native_space_scratch,sizeof expected_space.scratch);fwrite(&expected_space,sizeof expected_space,1,records);
#else
 if(fread(&expected_space,sizeof expected_space,1,records)!=1)exit(2);
#endif
 const uint32_t*spr=(void*)&expected_space,*spa=(void*)&c->space;for(unsigned k=0;k<sizeof expected_space/4;k++){compared++;if(spr[k]!=spa[k]){mismatches++;if(mismatches<15)fprintf(stderr,"Space call%lu word%u %08x != %08x\n",composite_calls,k,spr[k],spa[k]);}}
 static DubRuntime expected_dub;
#ifndef HOST_REPLAY
 expected_dub=ndub;expected_dub.state.word[0]=0;for(unsigned k=10;k<=21;k++)expected_dub.state.word[k]=0;for(unsigned k=0;k<4;k++)expected_dub.filter[k]=dnf[k].f;for(unsigned k=0;k<2;k++)expected_dub.write[k]=(unsigned)dnd[k].write;fwrite(&expected_dub,sizeof expected_dub,1,records);
#else
 if(fread(&expected_dub,sizeof expected_dub,1,records)!=1)exit(2);
#endif
 const uint32_t*dr=(void*)&expected_dub,*da=(void*)&c->dub;for(unsigned k=0;k<sizeof expected_dub/4;k++){compared++;if(dr[k]!=da[k]){mismatches++;if(mismatches<15)fprintf(stderr,"Dub call%lu word%u %08x != %08x\n",composite_calls,k,dr[k],da[k]);}}
 Crush expected_crush;
#ifndef HOST_REPLAY
 expected_crush=ncrush;expected_crush.vtable=0;fwrite(&expected_crush,sizeof expected_crush,1,records);
#else
 if(fread(&expected_crush,sizeof expected_crush,1,records)!=1)exit(2);
#endif
 const uint32_t *cr=(void*)&expected_crush,*ca=(void*)&c->crush;
 for(unsigned i=0;i<sizeof(Crush)/4;i++){compared++;if(cr[i]!=ca[i]){mismatches++;if(mismatches<5)fprintf(stderr,"Crush field%u %08x %08x\n",i,cr[i],ca[i]);}}

 Noise expected_noise;NoiseFilter expected_nf;
#ifndef HOST_REPLAY
 expected_noise=nnoise;expected_noise.vtable=expected_noise.filter=expected_noise.buffer=0;expected_nf=nnf.f;fwrite(&expected_noise,sizeof expected_noise,1,records);fwrite(&expected_nf,sizeof expected_nf,1,records);
#else
 if(fread(&expected_noise,sizeof expected_noise,1,records)!=1||fread(&expected_nf,sizeof expected_nf,1,records)!=1)exit(2);
#endif
 const uint32_t *nr=(void*)&expected_noise,*na=(void*)&c->noise;for(unsigned i=0;i<sizeof(Noise)/4;i++){compared++;if(nr[i]!=na[i]){mismatches++;if(mismatches<5)fprintf(stderr,"Noise field%u %08x %08x\n",i,nr[i],na[i]);}}
 nr=(void*)&expected_nf;na=(void*)&c->noise_filter;for(unsigned i=0;i<sizeof(NoiseFilter)/4;i++){compared++;if(nr[i]!=na[i]){mismatches++;if(mismatches<5)fprintf(stderr,"NoiseFilter field%u %08x %08x\n",i,nr[i],na[i]);}}

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
 static ComposedCfx c;composed_init(&c);
#ifndef HOST_REPLAY
 reset_composite_native();
#endif
 const size_t lengths[]={64,64,64,64,64,64,64,64,64};
 for(unsigned j=0;j<8000;j++){
  if((j<5600&&(j%400==0||j%400==330||(j%400==350&&(j/400)%2==0)||j%400==370))||(j>=5600&&(j%19==0||j%41<4))){const int types[]={5,1,5,2,5,3,5,6,5,4};int target=(j%400==330||j%400==350)?0:j%400==370?5:types[(j/400)%10];if(j>=5600){const int random_types[]={0,1,2,3,4,5,6};target=random_types[(j/3)%7];}if(!filter_manager_request(&c.manager,target))busy++;
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
 fclose(records);fprintf(stderr,"Space tail entries%u resumes%u Space>Dub%u Dub>Space%u\n",transitions[5][7],transitions[7][5],transitions[5][4],transitions[4][5]);fprintf(stderr,"Dub tails enter%u resume%u directFilter%u directSweep%u\n",transitions[4][7],transitions[7][4],transitions[4][1],transitions[4][3]);
 fprintf(stderr,"Sweep transitions F>S%u S>F%u N>S%u S>N%u C>S%u S>C%u\n",transitions[1][3],transitions[3][1],transitions[2][3],transitions[3][2],transitions[6][3],transitions[3][6]);
 if(!transitions[5][7]||!transitions[7][5]||!transitions[5][4]||!transitions[4][5]||!busy||!transitions[4][2]||!transitions[2][4]||!transitions[4][6]||!transitions[6][4]||!transitions[4][7]||!transitions[7][4]||!transitions[4][1]||!transitions[4][3])return 3;
 fprintf(stderr,"Noise transitions F>N %u N>F %u C>N %u N>C %u Off>N %u N>Off %u\n",transitions[1][2],transitions[2][1],transitions[6][2],transitions[2][6],transitions[0][2],transitions[2][0]);
 fprintf(stderr,"Verified direct Filter->Crush %lu and Crush->Filter %lu completed transitions\n",to_crush,to_filter);
 printf("{\"calls\":%lu,\"stereo_frames\":%lu,\"numeric_values_compared\":%lu,\"mismatches\":%lu,\"max_abs_error\":%.17g,\"busy_requests\":%lu}\n",composite_calls,composite_frames,compared,mismatches,maxerr,busy);
 return mismatches?1:0;
}
