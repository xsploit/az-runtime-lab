#include "eq_channel.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef HOST_REPLAY
unsigned native_eq_rate;
uint32_t native_eq_iir_vtable[7];
extern void native_channel_ctor(void*,int,int,int,void*);
extern void native_eq_ctor(void*),native_iso_ctor(void*),native_eq_resources(void*,int),native_iso_resources(void*,int),native_eq_iir_set(void*,const float*);
static void*allocations[1024];static unsigned allocated;
void*native_eq_alloc(unsigned n){void*p=malloc(n+16);if(!p||allocated==1024)abort();memset(p,0,n+16);allocations[allocated++]=p;return p;}
void native_eq_string(void*p,...){(void)p;}
void native_eq_abort(void){abort();}
static void snapshot_filter(EqIir*out,uint32_t*p){memcpy(out->coefficients,(void*)(uintptr_t)p[8],40);memcpy(out->x,(void*)(uintptr_t)p[11],16);memcpy(out->y,(void*)(uintptr_t)p[12],16);}
#endif
typedef struct {EqGainRamp gain;unsigned pending,requested,active;} ModeInitial;
int main(int argc,char**argv){if(argc!=3)return 2;float tables[276];FILE*t=fopen(argv[2],"rb");if(!t||fread(tables,sizeof tables,1,t)!=1)return 2;fclose(t);
#ifdef HOST_REPLAY
FILE*f=fopen(argv[1],"rb");
#else
FILE*f=fopen(argv[1],"wb");native_eq_iir_vtable[2]=(uint32_t)native_eq_iir_set;
#endif
if(!f)return 2;
unsigned errors=0;const unsigned rates[]={1,1000,12345,32000,44100,48000,96000,192000};
for(unsigned k=0;k<80;k++){
 unsigned rate=rates[k%8];EqChannel ec;eq_channel_setup(&ec,(const float(*)[5])(tables+256),rate,0);ModeInitial mi={ec.mode_gain,ec.pending,(unsigned)ec.requested,(unsigned)ec.active},mr={0};Equalizer eq,req={0};Isolator iso,riso={0};equalizer_setup(&eq);isolator_setup(&iso,(const float(*)[5])(tables+256),rate);
#ifndef HOST_REPLAY
 uint32_t a[19]={0},b[30]={0};native_eq_rate=rate;native_eq_ctor(a);native_iso_ctor(b);native_eq_resources(a,64);native_iso_resources(b,64);
 for(unsigned j=0;j<3;j++){snapshot_filter(&req.filter[j],(void*)(uintptr_t)a[9+j]);memcpy(&req.index[j],(void*)(uintptr_t)a[14+j],28);memcpy(&riso.gain[j],(void*)(uintptr_t)b[27+j],40);}
 memcpy(req.cached,(char*)a+68,6);for(unsigned j=0;j<2;j++)memcpy(req.scratch[j],(void*)(uintptr_t)a[12+j],512);
 unsigned slots[8]={9,10,13,14,15,16,17,18};for(unsigned j=0;j<8;j++)snapshot_filter(&riso.filter[j],(void*)(uintptr_t)b[slots[j]]);
 for(unsigned j=0;j<5;j++)memcpy(riso.scratch[j],(void*)(uintptr_t)b[21+j],512);
 uint32_t ch[136]={0};native_channel_ctor(ch,0,0,0,0);memcpy(&mr.gain,(char*)ch+440,40);mr.pending=((unsigned char*)ch)[436];mr.requested=ch[108];mr.active=ch[107]==ch[106];fwrite(&mr,sizeof mr,1,f);fwrite(&req,sizeof req,1,f);fwrite(&riso,sizeof riso,1,f);
 while(allocated)free(allocations[--allocated]);
#else
 if(fread(&mr,sizeof mr,1,f)!=1||fread(&req,sizeof req,1,f)!=1||fread(&riso,sizeof riso,1,f)!=1)return 3;
#endif
 if(memcmp(&mr,&mi,sizeof mi)||memcmp(&req,&eq,sizeof eq)||memcmp(&riso,&iso,sizeof iso)){if(errors<8)fprintf(stderr,"constructor rate %u differs\n",rate);errors++;}
}
fclose(f);printf("{\"processor_constructors\":320,\"channel_mode_initializations\":80,\"sample_rates\":8,\"mismatches\":%u}\n",errors);return errors?1:0;}
