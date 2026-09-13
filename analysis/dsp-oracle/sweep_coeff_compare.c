#include "sweep.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef HOST_REPLAY
extern void native_sweep_parameters(Sweep *,float);
extern const float sweep_lpf_endpoint[5],sweep_hpf_endpoint[5];
typedef struct {uint32_t vtable;float coeff[5];unsigned updates;} NativeFilter;
static uint32_t vtable[3];
static void setcoeff(NativeFilter *f,const float *c){memcpy(f->coeff,c,20);f->updates++;}
#endif
static unsigned seed=122373;
static unsigned rnd(void){seed=seed*1664525u+1013904223u;return seed;}
int main(int argc,char **argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
FILE *f=fopen(argv[1],"rb");
#else
FILE *f=fopen(argv[1],"wb");
#endif
if(!f)return 2;
Sweep s={{0}},r;SweepCoefficients c={0},ref;unsigned errors=0;
#ifndef HOST_REPLAY
memcpy(c.endpoint[0],sweep_lpf_endpoint,20);memcpy(c.endpoint[1],sweep_hpf_endpoint,20);fwrite(c.endpoint,sizeof c.endpoint,1,f);
NativeFilter filter[4]={{0}};vtable[2]=(uint32_t)setcoeff;
for(unsigned k=0;k<4;k++)filter[k].vtable=(uint32_t)vtable;
#else
if(fread(c.endpoint,sizeof c.endpoint,1,f)!=1)return 3;
#endif
for(unsigned call=0;call<16000;call++){
 float step=(float)(call<256?call:rnd()%256);
 sweep_put_float(&s,32,(float)(rnd()%10001)/10000);
 r=s;
#ifndef HOST_REPLAY
 for(unsigned k=0;k<4;k++)r.word[14+k]=(uint32_t)&filter[k];
 native_sweep_parameters(&r,step);
 ref=c;
 for(unsigned k=0;k<4;k++){r.word[14+k]=0;memcpy(ref.coeff[k],filter[k].coeff,20);ref.updates[k]=filter[k].updates;}
 fwrite(&r,sizeof r,1,f);fwrite(&ref,sizeof ref,1,f);
#else
 if(fread(&r,sizeof r,1,f)!=1||fread(&ref,sizeof ref,1,f)!=1)return 3;
#endif
 sweep_parameters(&s,&c,step);
 for(unsigned k=0;k<67;k++)if(s.word[k]!=r.word[k]){if(errors<8)fprintf(stderr,"state call%u word%u %08x != %08x\n",call,k,s.word[k],r.word[k]);errors++;}
 if(memcmp(&c,&ref,sizeof c)){if(errors<8){fprintf(stderr,"coeff call%u\n",call);for(unsigned a=0;a<4;a++)for(unsigned k=0;k<5;k++)if(c.coeff[a][k]!=ref.coeff[a][k])fprintf(stderr," %u %u %.9g != %.9g\n",a,k,c.coeff[a][k],ref.coeff[a][k]);}errors++;}
}
fclose(f);printf("{\"calls\":16000,\"mismatches\":%u}\n",errors);return errors?1:0;
}
