#include "eq_channel.h"
#include "../../mixer/cfx_manager.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef HOST_REPLAY
unsigned native_eq_rate;
uint32_t native_eq_iir_vtable[7];
extern void native_eq_ctor(void*),native_iso_ctor(void*),native_eq_resources(void*,int),native_iso_resources(void*,int),native_eq_iir_set(void*,const float*);
static void*allocations[256];static unsigned allocated;
void*native_eq_alloc(unsigned n){void*p=malloc(n+16);if(!p||allocated==256)abort();memset(p,0,n+16);allocations[allocated++]=p;return p;}
void native_eq_string(void*p,...){(void)p;}
void native_eq_abort(void){abort();}
static void snapshot_filter(EqIir*out,uint32_t*p){memcpy(out->coefficients,(void*)(uintptr_t)p[8],40);memcpy(out->x,(void*)(uintptr_t)p[11],16);memcpy(out->y,(void*)(uintptr_t)p[12],16);}
#endif

#ifndef HOST_REPLAY
extern void native_eq_execute(void*,const Stereo*,Stereo*,int),native_iso_execute(void*,const Stereo*,Stereo*,int),native_eq_reset(void*),native_iso_reset(void*),native_eq_volume(void*,int,float),native_iso_volume(void*,int,float);
extern void native_channel_execute(void*,int),native_channel_mode(void*,int),native_channel_volume(void*,int,float);
extern void iir_native(const Stereo*,Stereo*,const Stereo*,Stereo*,Stereo*,unsigned long);
static uint32_t eq_vt[8],iso_vt[8],*eq_object,*iso_object;static unsigned resets[2],inside_cfx,cfx_resets;
static void eq_reset_hook(void*p){resets[0]++;if(inside_cfx)cfx_resets++;native_eq_reset(p);}
static void iso_reset_hook(void*p){resets[1]++;if(inside_cfx)cfx_resets++;native_iso_reset(p);}
static void iir_process(uint32_t*p,const Stereo*in,Stereo*out,int n){iir_native(in,out,(void*)(uintptr_t)p[8],(void*)(uintptr_t)p[11],(void*)(uintptr_t)p[12],(unsigned)n);}
static void iir_clear(uint32_t*p){memset((void*)(uintptr_t)p[11],0,16);memset((void*)(uintptr_t)p[12],0,16);}
int native_channel_no_effect(void*p){(void)p;return -1;}
typedef struct {uint32_t vt,unused[5];int position;float color,parameter;int type;} MockFx;
typedef struct {Stereo step,target,current;uint32_t count,length;float inverse;uint8_t done,pad[3];} NR;
typedef struct {void*active,*effects[7];int current,next,previous;Stereo*buffer;NR wet,dry;int phase;void*channel;} NM;
static NM nm;static MockFx effects[7];static uint32_t mvt[10];static Stereo mscratch[64];static unsigned inits[7],processes[7],ticks;
extern void manager_native(NM*,Stereo*,int),manager_native_set_type(NM*,int);
static void mock_process(MockFx*s,const Stereo*in,Stereo*out,int n){processes[s->type]++;memcpy(out,in,(unsigned)n*8);}
static void mock_init(MockFx*s){inits[s->type]++;}
static void mock_tick(void*p){(void)p;ticks++;}
static void mock_noop(void*p,...){(void)p;}
int native_channel_cfx_position(NM*m){return ((MockFx*)m->active)->position;}
void native_channel_cfx(NM*m,Stereo*audio,int n){inside_cfx=1;manager_native(m,audio,n);inside_cfx=0;}
static ManagerRamp sr(NR*r){ManagerRamp a={r->step.l,r->target.l,r->current.l,r->count,r->length,r->inverse,r->done};return a;}
static FilterManager snap_cfx(void){FilterManager m={0};m.current=nm.current;m.next=nm.next;m.previous=nm.previous;m.active=((MockFx*)nm.active)->type;m.phase=nm.phase;m.wet=sr(&nm.wet);m.dry=sr(&nm.dry);m.sweep_ticks=ticks;m.eq_reset_requests=cfx_resets;for(unsigned i=0;i<7;i++){m.color[i]=effects[i].color;m.parameter[i]=effects[i].parameter;m.initialized[i]=inits[i];m.processed[i]=processes[i];}return m;}
static void snapshot(EqChannel*s,uint32_t*ch){
 uint32_t*a=eq_object,*b=iso_object;
 for(unsigned j=0;j<3;j++){snapshot_filter(&s->eq.filter[j],(void*)(uintptr_t)a[9+j]);memcpy(&s->eq.index[j],(void*)(uintptr_t)a[14+j],28);memcpy(&s->iso.gain[j],(void*)(uintptr_t)b[27+j],40);}
 memcpy(s->eq.cached,(char*)a+68,6);for(unsigned j=0;j<2;j++)memcpy(s->eq.scratch[j],(void*)(uintptr_t)a[12+j],512);
 unsigned slots[8]={9,10,13,14,15,16,17,18};for(unsigned j=0;j<8;j++)snapshot_filter(&s->iso.filter[j],(void*)(uintptr_t)b[slots[j]]);
 for(unsigned j=0;j<5;j++)memcpy(s->iso.scratch[j],(void*)(uintptr_t)b[21+j],512);
 memcpy(&s->mode_gain,(char*)ch+440,40);s->requested=(int)ch[108];s->pending=((unsigned char*)ch)[436];s->active=ch[107]==(uint32_t)iso_object;memcpy(s->resets,resets,8);memcpy(s->volume,a+6,12);
 if(memcmp(a+6,b+6,12))abort();
}
#endif
static unsigned seed=4223344,errors;
static unsigned rnd(void){seed=seed*1664525u+1013904223u;return seed;}
static void compare(const void*x,const void*y,size_t bytes,unsigned call,const char*label){const unsigned char*a=x,*b=y;for(size_t i=0;i<bytes;i++)if(a[i]!=b[i]){if(errors<10)fprintf(stderr,"%s call %u byte %zu %02x != %02x\n",label,call,i,a[i],b[i]);errors++;}}
static void host_fx(void*p,int type,const Stereo*in,Stereo*out,size_t n){(void)p;(void)type;memcpy(out,in,n*8);}
static void host_init(void*p,int type,float c,float v){(void)p;(void)type;(void)c;(void)v;}
static int host_on(void*p,int type){(void)p;(void)type;return 0;}
static void host_cfx(EqChannel*s,FilterManager*m,Stereo*audio,unsigned n){Stereo scratch[64];unsigned old=m->eq_reset_requests;FilterManagerCallbacks cb={0,host_fx,host_init,host_on,host_on};filter_manager_process(m,audio,scratch,n,&cb);if(old!=m->eq_reset_requests){s->resets[s->active]++;if(s->active)isolator_reset(&s->iso);else equalizer_reset(&s->eq);}}
int main(int argc,char**argv){if(argc!=4)return 2;float tables[276],eqtables[3][256][5];FILE*t=fopen(argv[2],"rb");if(!t||fread(tables,sizeof tables,1,t)!=1)return 2;fclose(t);t=fopen(argv[3],"rb");if(!t||fread(eqtables,sizeof eqtables,1,t)!=1)return 2;fclose(t);
#ifdef HOST_REPLAY
FILE*f=fopen(argv[1],"rb");
#else
FILE*f=fopen(argv[1],"wb");native_eq_iir_vtable[2]=(uint32_t)native_eq_iir_set;native_eq_iir_vtable[5]=(uint32_t)iir_process;native_eq_iir_vtable[6]=(uint32_t)iir_clear;
eq_vt[2]=(uint32_t)native_eq_execute;eq_vt[5]=(uint32_t)eq_reset_hook;eq_vt[7]=(uint32_t)native_eq_volume;
iso_vt[2]=(uint32_t)native_iso_execute;iso_vt[5]=(uint32_t)iso_reset_hook;iso_vt[7]=(uint32_t)native_iso_volume;
#endif
if(!f)return 2;
FilterManager cm;filter_manager_init(&cm,145);cm.current=cm.next=cm.active=1;for(unsigned i=0;i<7;i++){cm.color[i]=.9f;cm.parameter[i]=.5f;}
EqChannel s,ref={0};eq_channel_setup(&s,(const float(*)[5])(tables+256),44100,0);
#ifndef HOST_REPLAY
uint32_t a[19]={0},b[30]={0},ch[136]={0};Stereo native_audio[66]={0},post[66]={0},cue[66]={0};native_eq_rate=44100;native_eq_ctor(a);native_iso_ctor(b);native_eq_resources(a,64);native_iso_resources(b,64);eq_object=a;iso_object=b;a[0]=(uint32_t)eq_vt;b[0]=(uint32_t)iso_vt;
mvt[2]=(uint32_t)mock_process;mvt[3]=(uint32_t)mock_noop;mvt[4]=(uint32_t)mock_init;mvt[5]=(uint32_t)mock_tick;mvt[6]=mvt[7]=(uint32_t)mock_noop;
for(unsigned i=0;i<7;i++){effects[i].vt=(uint32_t)mvt;effects[i].position=i==3?0:1;effects[i].color=.9f;effects[i].parameter=.5f;effects[i].type=(int)i;nm.effects[i]=&effects[i];}
nm.active=&effects[1];nm.current=nm.next=1;nm.buffer=mscratch;nm.channel=ch;nm.wet.current=nm.wet.target=(Stereo){1,1};nm.wet.length=nm.dry.length=145;nm.wet.inverse=nm.dry.inverse=1.f/145;nm.wet.done=nm.dry.done=1;ch[120]=(uint32_t)&nm;
ch[105]=(uint32_t)a;ch[106]=(uint32_t)b;ch[107]=(uint32_t)a;ch[7]=(uint32_t)native_audio;ch[8]=(uint32_t)post;ch[9]=(uint32_t)cue;memcpy((char*)ch+440,&s.mode_gain,40);((unsigned char*)ch)[436]=(unsigned char)s.pending;
for(unsigned k=0;k<2;k++){ch[28+k]=ch[40+k]=ch[126+k]=0x3f800000;}((unsigned char*)ch)[132]=((unsigned char*)ch)[180]=((unsigned char*)ch)[524]=1;
#endif
unsigned frames=0;
for(unsigned call=0;call<8000;call++){
 if(call%47==0||call%211==0){int type=rnd()%2?1:3;
#ifndef HOST_REPLAY
 manager_native_set_type(&nm,type);
#endif
 filter_manager_request(&cm,type);
 }

 if(call%7==0){unsigned band=rnd()%3;float v=(float)(rnd()%10001)/10000.f;
#ifndef HOST_REPLAY
 native_channel_volume(ch,(int)band,v);
#endif
 eq_channel_volume(&s,band,v,tables);
 }
 if(call%97==0||call%97<12){int mode=(int)(rnd()%5)-1;
#ifndef HOST_REPLAY
 native_channel_mode(ch,mode);
#endif
 eq_channel_mode(&s,mode);
 }
 const unsigned sizes[]={1,2,3,7,31,63,64};unsigned n=sizes[call%7];frames+=n;Stereo in[66]={0},out[64]={0},expected[64]={0};
 for(unsigned i=0;i<n;i++)in[i]=(Stereo){((int)(rnd()%10001)-5000)*.0001f,((int)(rnd()%10001)-5000)*.0001f};
#ifndef HOST_REPLAY
 memcpy(native_audio,in,sizeof in);native_channel_execute(ch,(int)n);memcpy(expected,native_audio,n*8);snapshot(&ref,ch);fwrite(&ref,sizeof ref,1,f);fwrite(expected,sizeof expected,1,f);FilterManager rm=snap_cfx();fwrite(&rm,sizeof rm,1,f);
#else
 FilterManager rm;if(fread(&ref,sizeof ref,1,f)!=1||fread(expected,sizeof expected,1,f)!=1||fread(&rm,sizeof rm,1,f)!=1)return 3;
#endif
 Stereo local[66];memcpy(local,in,sizeof local);int pre=cm.active==3;if(pre)host_cfx(&s,&cm,local,n);eq_channel_execute(&s,eqtables,local,out,n);if(!pre)host_cfx(&s,&cm,out,n);compare(&cm,&rm,sizeof cm,call,"CFX state");compare(&s,&ref,sizeof s,call,"state");compare(out,expected,sizeof out,call,"audio");
}
#ifndef HOST_REPLAY
while(allocated)free(allocations[--allocated]);
#endif
fclose(f);printf("{\"blocks\":8000,\"frames\":%u,\"eq_resets\":%u,\"isolator_resets\":%u,\"cfx_resets\":%u,\"mismatches\":%u}\n",frames,s.resets[0],s.resets[1],cm.eq_reset_requests,errors);return errors?1:0;}
