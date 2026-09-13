#include "delay_audio.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
static uint32_t rng=0xabc39837;
static uint32_t next(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
static float rnd(void){return ((int)(next()&65535)-32768)/32768.0f;}
#define SMALL_RING 2048
#ifndef HOST_REPLAY
extern void delay_init(void*),delay_time(void*),delay_on(void*),delay_off(void*),delay_depth(void*);
extern void delay_execute(void*,const Stereo*,Stereo*,int);
static uint32_t obj[38],vtable[16];static DelayRamp gate,dry,wet,cross;
static unsigned enabled,checks,timechecks,injected;
int oracle_quantize(void *o){(void)o;checks++;return (int)enabled;}
void oracle_time(void *o){uint32_t *p=o;timechecks++;if(injected){p[9]=injected;p[34]=1;}}
static void set_native(const DelayAudio *s,Stereo *ring){const DelayControl *c=&s->control;memset(obj,0,sizeof obj);vtable[14]=(uint32_t)delay_depth;obj[0]=(uint32_t)vtable;obj[1]=c->rate;memcpy(&obj[8],&c->depth,4);obj[30]=c->max_samples;obj[31]=c->counter;obj[34]=c->time_changed;gate=c->gate;dry=c->dry;wet=c->wet;cross=s->cross;obj[35]=(uint32_t)&gate;obj[36]=(uint32_t)&dry;obj[37]=(uint32_t)&wet;obj[33]=(uint32_t)&cross;obj[6]=(uint32_t)ring;obj[7]=s->ring_length;obj[9]=s->time_ms;obj[15]=s->on;obj[28]=s->delay;obj[29]=s->write_index;obj[32]=s->previous_delay;enabled=s->quantize_enabled;checks=s->quantize_checks;timechecks=s->time_checks;injected=s->injected_time_ms;}
static DelayAudio get_native(void){DelayAudio s={0};DelayControl *c=&s.control;c->rate=obj[1];c->max_samples=obj[30];c->counter=obj[31];c->time_changed=obj[34];memcpy(&c->depth,&obj[8],4);c->gate=gate;c->dry=dry;c->wet=wet;s.cross=cross;s.time_ms=obj[9];s.on=obj[15];s.delay=obj[28];s.write_index=obj[29];s.previous_delay=obj[32];s.ring_length=obj[7];s.quantize_enabled=enabled;s.quantize_checks=checks;s.time_checks=timechecks;s.injected_time_ms=injected;return s;}
#endif
static void ramp(DelayRamp *r,unsigned length,float v){memset(r,0,sizeof *r);r->length=length;r->inverse=1.0f/(float)length;r->done=1;r->current[0]=r->current[1]=r->target[0]=r->target[1]=v;}
static FILE *records;
static void transfer(void *p,size_t n){
#ifdef HOST_REPLAY
 if(fread(p,1,n,records)!=n)exit(2);
#else
 if(fwrite(p,1,n,records)!=n)exit(2);
#endif
}
static unsigned mismatches,calls;static unsigned long long frames,words;
static void compare(const void *a,const void *b,size_t bytes,const char *name,unsigned scenario,unsigned block){const unsigned char *x=a,*y=b;for(size_t i=0;i<bytes/4;i++){uint32_t xx,yy;memcpy(&xx,x+4*i,4);memcpy(&yy,y+4*i,4);words++;if(xx!=yy){mismatches++;if(mismatches<8)fprintf(stderr,"%s scenario%u block%u word%zu %08x!=%08x\n",name,scenario,block,i,xx,yy);}}}
int main(int argc,char **argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
 records=fopen(argv[1],"rb");
#else
 records=fopen(argv[1],"wb");void(*controls[])(void*)={delay_init,delay_time,delay_on,delay_off,delay_depth};
#endif
 if(!records)return 2;
 for(unsigned scenario=0;scenario<84;scenario++){
  unsigned ring_size=scenario<80?SMALL_RING:352800;
  DelayAudio s={0};s.control.rate=44100;s.control.max_samples=352800;s.control.depth=.8f;s.time_ms=1+scenario%40;s.delay=s.previous_delay=((unsigned)floor(2*s.time_ms*44.1)+1)>>1;s.ring_length=ring_size;s.on=1;
  ramp(&s.control.gate,191,0);ramp(&s.control.dry,147,1);ramp(&s.control.wet,147,0);ramp(&s.cross,147,0);
  if(scenario%4==1)s.control.counter=1;
  if(scenario%4==2){s.control.counter=(s.control.max_samples+5);s.write_index=ring_size-2;}
  if(scenario%4==3)s.control.counter=(s.delay+1);
  Stereo *ring=malloc(ring_size*sizeof(Stereo)),*native_ring=malloc(ring_size*sizeof(Stereo));if(!ring||!native_ring)return 2;for(unsigned k=0;k<ring_size;k++)ring[k]=native_ring[k]=(Stereo){rnd()*.1f,rnd()*.1f};
#ifndef HOST_REPLAY
  set_native(&s,native_ring);
#endif
  for(unsigned block=0;block<(scenario<80?70:8);block++){
   unsigned ns[]={0,1,2,3,63,64,65,127,256,511};unsigned n=ns[(scenario+block)%10];
   if(block%7==0&&(scenario<64||scenario>=80||block==0)){s.control.depth=(rnd()+1)*.5f;unsigned action=block==0?DELAY_ON:next()%5;
#ifndef HOST_REPLAY
    memcpy(&obj[8],&s.control.depth,4);controls[action](obj);
#endif
    delay_control(&s.control,action);
   }
   if(block%9==0&&(scenario<64||scenario>=80||block==0)){s.time_ms=1+next()%40;if(scenario>=80){unsigned long_times[]={1,499,500,4000};s.time_ms=long_times[scenario-80];}s.control.time_changed=1;s.on=next()%2;
#ifndef HOST_REPLAY
    obj[9]=s.time_ms;obj[34]=1;obj[15]=s.on;
#endif
   }
   s.quantize_enabled=(block%3==0)&&(scenario<64||scenario>=80);s.injected_time_ms=scenario<80&&block%11==0?1+next()%40:0;
#ifndef HOST_REPLAY
   enabled=s.quantize_enabled;injected=s.injected_time_ms;
#endif
   if(scenario>=64&&scenario<80&&block==8){s.on=0;delay_control(&s.control,DELAY_OFF);
#ifndef HOST_REPLAY
    obj[15]=0;delay_off(obj);
#endif
   }
   Stereo *in=malloc((n?n:1)*sizeof(Stereo)),*out=malloc((n?n:1)*sizeof(Stereo)),*refout=malloc((n?n:1)*sizeof(Stereo));if(!in||!out||!refout)return 2;for(unsigned i=0;i<n;i++)in[i]=(block%5==0||(scenario>=64&&scenario<80&&block>5))?(Stereo){0,0}:(Stereo){rnd()*.2f,rnd()*.2f};
   if(n&&block%13==0)in[0]=(Stereo){1,-.5f};
   if(n>1&&block%17==0)in[1]=(Stereo){0x1p-140f,-0x1p-140f};
#ifndef HOST_REPLAY
   delay_execute(obj,in,refout,(int)n);DelayAudio ref=get_native();
#else
   DelayAudio ref;
#endif
   transfer(&ref,sizeof ref);transfer(refout,n*sizeof(Stereo));transfer(native_ring,ring_size*sizeof(Stereo));
   delay_audio(&s,ring,in,out,n);calls++;frames+=n;
   compare(&s,&ref,sizeof s,"state",scenario,block);compare(out,refout,n*sizeof(Stereo),"audio",scenario,block);compare(ring,native_ring,ring_size*sizeof(Stereo),"ring",scenario,block);
   free(in);free(out);free(refout);
  }
  free(ring);free(native_ring);
 }
 fclose(records);printf("{\"calls\":%u,\"stereo_frames\":%llu,\"compared_words\":%llu,\"mismatches\":%u}\n",calls,frames,words,mismatches);return mismatches?1:0;
}
