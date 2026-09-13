#include "eq_control.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef HOST_REPLAY
extern void native_eq_volume(void*,int,float),native_iso_volume(void*,int,float);
#endif
static unsigned seed=4232345;
static unsigned rnd(void){seed=seed*1664525u+1013904223u;return seed;}
int main(int argc,char**argv){if(argc!=3)return 2;float table[256];FILE*t=fopen(argv[2],"rb");if(!t||fread(table,sizeof table,1,t)!=1)return 2;fclose(t);
#ifdef HOST_REPLAY
FILE*f=fopen(argv[1],"rb");
#else
FILE*f=fopen(argv[1],"wb");
#endif
if(!f)return 2;
EqIndexRamp eq[3]={{0}},refeq[3];EqGainRamp iso[3]={0},refiso[3];unsigned errors=0,repeated=0;
for(unsigned call=0;call<48000;call++){
 unsigned band=rnd()%3;float value=(float)(rnd()%10001)/10000.f;
 if(call%19==0)value=0;
 if(call%23==0)value=1;
 if(call%29==0)value=.5f;
 if(call%31==0){value=(float)eq[band].target/255.f;repeated++;}
 /* Independent valid mid-ramp fixtures, including exact and fractional states. */
 for(unsigned j=0;j<3;j++){
  eq[j].current=(int)(rnd()%256);eq[j].magnitude=1+(int)(rnd()%8);eq[j].timing=1+(int)(rnd()%12);eq[j].count=(int)(rnd()%32);eq[j].done=rnd()%2;
  iso[j].length=1+rnd()%300;iso[j].inverse=1.f/(float)iso[j].length;iso[j].count=rnd()%300;iso[j].done=rnd()%2;
  for(unsigned side=0;side<2;side++){iso[j].current[side]=(float)(rnd()%20001)/10000.f;iso[j].step[side]=((int)(rnd()%2001)-1000)/100000.f;}
 }
 memcpy(refeq,eq,sizeof eq);memcpy(refiso,iso,sizeof iso);
#ifndef HOST_REPLAY
 uint32_t object_eq[30]={0},object_iso[30]={0};
 for(unsigned j=0;j<3;j++){object_eq[14+j]=(uint32_t)(uintptr_t)&refeq[j];object_iso[27+j]=(uint32_t)(uintptr_t)&refiso[j];}
 object_iso[26]=(uint32_t)(uintptr_t)table;
 native_eq_volume(object_eq,(int)band,value);native_iso_volume(object_iso,(int)band,value);
 fwrite(refeq,sizeof refeq,1,f);fwrite(refiso,sizeof refiso,1,f);
#else
 if(fread(refeq,sizeof refeq,1,f)!=1||fread(refiso,sizeof refiso,1,f)!=1)return 3;
#endif
 eq_index_target(&eq[band],value);eq_gain_target(&iso[band],value,table);
 if(memcmp(eq,refeq,sizeof eq)||memcmp(iso,refiso,sizeof iso)){
  if(errors<8){fprintf(stderr,"call %u band %u value %.9g\n",call,band,value);uint32_t a[30],b[30];memcpy(a,iso,sizeof iso);memcpy(b,refiso,sizeof iso);for(unsigned k=0;k<30;k++)if(a[k]!=b[k])fprintf(stderr,"iso word %u %08x != %08x\n",k,a[k],b[k]);}errors++;
 }
}
fclose(f);printf("{\"calls\":48000,\"state_bytes\":9792000,\"repeated_target_cases\":%u,\"mismatches\":%u}\n",repeated,errors);return errors?1:0;}
