#include "echo_control.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stddef.h>
_Static_assert(sizeof(EchoRamp)==40,"native ramp ABI");
static uint32_t rng=0x87654321;
static uint32_t next(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
static float rnd(void){return ((int)(next()&65535)-32768)/32768.0f;}
#ifndef HOST_REPLAY
extern void echo_init(void*),echo_keep(void*),echo_time(void*),echo_on(void*),echo_off(void*),echo_depth(void*);
static uint32_t obj[39],vtable[15];static EchoRamp gate,dry,wet;
static void set_native(const EchoControl *s){memset(obj,0,sizeof obj);vtable[14]=(uint32_t)echo_depth;obj[0]=(uint32_t)vtable;obj[1]=s->rate;memcpy(&obj[8],&s->depth,4);obj[31]=s->max_samples;obj[32]=s->counter;obj[35]=s->time_changed;gate=s->gate;dry=s->dry;wet=s->wet;obj[36]=(uint32_t)&gate;obj[37]=(uint32_t)&dry;obj[38]=(uint32_t)&wet;}
static EchoControl get_native(void){EchoControl s={0};s.rate=obj[1];s.max_samples=obj[31];s.counter=obj[32];s.time_changed=obj[35];memcpy(&s.depth,&obj[8],4);s.gate=gate;s.dry=dry;s.wet=wet;return s;}
#endif
static void randramp(EchoRamp *r){memset(r,0,sizeof *r);for(int k=0;k<2;k++){r->step[k]=rnd()*.01f;r->target[k]=rnd();r->current[k]=rnd();}r->count=next()%300;r->length=1+next()%400;r->inverse=1.0f/(float)r->length;r->done=next()%2;}
int main(int argc,char **argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
 FILE *f=fopen(argv[1],"rb");
#else
 FILE *f=fopen(argv[1],"wb");void(*fn[])(void*)={echo_init,echo_keep,echo_time,echo_on,echo_off,echo_depth};
#endif
 if(!f)return 2;
 unsigned calls=0,bad=0;float boundaries[]={0,.009765625f,.75f,.990234375f,1};
 for(unsigned scenario=0;scenario<1200;scenario++){
  EchoControl s={0};s.rate=44100;s.counter=next();s.max_samples=next();s.time_changed=next()%2;
  randramp(&s.gate);randramp(&s.dry);randramp(&s.wet);
  if(scenario<45){float b=boundaries[scenario/9];s.depth=scenario%3==0?b:nextafterf(b,scenario%3==1?-INFINITY:INFINITY);}
  else s.depth=(rnd()+1)*.5f;
  /* Include subnormal NEON ramp operands and signed zero, independently per side. */
  if(scenario%7==0){s.gate.current[0]=0x1p-140f;s.dry.step[1]=-0x1p-140f;s.wet.inverse=0x1p-140f;}
#ifndef HOST_REPLAY
  set_native(&s);
#endif
  for(unsigned j=0;j<64;j++){
   unsigned action=j<6?j:next()%6;
#ifndef HOST_REPLAY
   fn[action](obj);EchoControl ref=get_native();if(fwrite(&ref,sizeof ref,1,f)!=1)return 2;
#else
   EchoControl ref;if(fread(&ref,sizeof ref,1,f)!=1)return 2;
#endif
   echo_control(&s,action);calls++;
   if(memcmp(&s,&ref,sizeof s)){bad++;if(bad<5)fprintf(stderr,"mismatch scenario %u action %u\n",scenario,action);}
  }
 }
 fclose(f);printf("{\"calls\":%u,\"state_bytes_per_call\":%zu,\"mismatching_calls\":%u}\n",calls,sizeof(EchoControl),bad);return bad?1:0;
}
