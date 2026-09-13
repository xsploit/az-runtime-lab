#include <math.h>
#define QUANTIZE_PHASE_BUILD 1
#include "echo_quantize_compare.c"
#undef main
#ifdef BEAT_MANAGER_COMPARE_BUILD
#define main beat_probe_prior_main
#endif
extern void native_manager_operate(void *,Stereo *,int,unsigned);
extern void native_switch_type(void *),native_switch_target(void *);
extern void native_off_execute(void*,const Stereo*,Stereo*,int),native_off_status(void*),native_off_beat(void*,unsigned,unsigned),native_noop(void*),native_echo_notify(void*);
extern void native_echo_beat(void*,unsigned,unsigned);
static unsigned manager_bpm=12000;
unsigned fixture_bfx_bpm(void *p){(void)p;return manager_bpm;}
static uint32_t manager[60] __attribute__((aligned(8))),off_object[21],off_vtable[19],sentinels[15][21];
static void init_off(void){memset(off_object,0,sizeof off_object);off_object[0]=(uint32_t)off_vtable;off_object[1]=off_object[2]=44100;float inv=1.0f/44100;memcpy(&off_object[3],&inv,4);off_object[9]=20;off_object[10]=64000;off_object[11]=1;off_object[12]=50;off_object[13]=100;off_object[14]=(uint32_t)-100;off_object[15]=1;off_object[16]=1;off_object[17]=5;off_object[18]=11;
 for(unsigned i=0;i<19;i++)off_vtable[i]=(uint32_t)native_noop;
 off_vtable[2]=(uint32_t)native_off_execute;off_vtable[3]=(uint32_t)native_adjust;off_vtable[6]=(uint32_t)native_off_beat;off_vtable[7]=(uint32_t)native_off_status;
}
int main(void){EchoAudio s={0};s.control.rate=44100;s.control.max_samples=352800;s.control.depth=.8f;s.time_ms=20;s.delay=s.previous_delay=882;s.ring_length=352800;s.feedback=(Stereo){.7f,.7f};
 ramp(&s.control.gate,191,0);ramp(&s.control.dry,147,1);ramp(&s.control.wet,147,0);ramp(&s.cross,147,0);
 Stereo *ring=calloc(s.ring_length,sizeof(Stereo)),scratch[64];if(!ring)return 2;
 cp=(EchoPlayerFixture){0};cp.channel_valid=cp.beat_present=cp.grid_enabled=1;cp.count=16;for(unsigned i=0;i<=16;i++)cp.beats[i]=(EchoBeat){1,12000,i*500};cq=(EchoQuantize){0,0,1,0,0,0,-1,5};
 set_native(&s,ring);set_player();set_quantize();obj[2]=44100;float inv=1.0f/44100;memcpy(&obj[3],&inv,4);obj[4]=64;obj[12]=50;obj[13]=100;obj[14]=(uint32_t)-100;obj[16]=2;obj[18]=9;obj[19]=0;obj[20]=1;
 vtable[2]=(uint32_t)echo_execute;vtable[4]=(uint32_t)echo_init;vtable[6]=(uint32_t)native_echo_beat;vtable[7]=(uint32_t)native_status;vtable[8]=(uint32_t)echo_off;vtable[9]=(uint32_t)echo_on;vtable[10]=(uint32_t)native_echo_notify;vtable[11]=(uint32_t)echo_keep;
 init_off();memset(manager,0,sizeof manager);manager[2]=(uint32_t)off_object;manager[3]=(uint32_t)obj;manager[4]=(uint32_t)off_object;
 for(unsigned i=5;i<=18;i++)manager[i]=(uint32_t)sentinels[i-5];
 manager[9]=(uint32_t)obj;manager[22]=(uint32_t)scratch;
 EchoRamp f,d,l;ramp(&f,191,1);ramp(&d,191,0);ramp(&l,66112,0);memcpy(manager+24,&f,40);memcpy(manager+36,&d,40);memcpy(manager+46,&l,40);manager[56]=manager[57]=5;float depth=.8f;memcpy(manager+58,&depth,4);
 puts("[");
 for(unsigned block=0;block<90;block++){
  if(block==0||block==35)manager[20]=5;
  if(block==18||block==66)manager[20]=0;
  if(block==52)manager[1]=1;
  if(block==75)manager[1]=2;
  ((unsigned char*)manager)[239]=0; /* MixerEngine::update 0x581ec */
  Stereo audio[64];for(unsigned i=0;i<64;i++)audio[i]=(Stereo){(float)sin((block*64+i)*.1)*.1f,(float)cos((block*64+i)*.17)*.08f};
  native_manager_operate(manager,audio,64,0);double energy=0;for(unsigned i=0;i<64;i++){if(!isfinite(audio[i].l)||!isfinite(audio[i].r))return 3;energy+=audio[i].l*audio[i].l+audio[i].r*audio[i].r;}
  unsigned current=manager[2]==(uint32_t)obj?5:manager[2]==(uint32_t)off_object?0:99;float fade,drygain;memcpy(&fade,manager+28,4);memcpy(&drygain,manager+40,4);
  printf("%s{\"block\":%u,\"active_object\":%u,\"type\":%u,\"requested_type\":%u,\"phase\":%u,\"target\":%u,\"requested_target\":%u,\"consumed\":%u,\"echo_on\":%u,\"echo_counter\":%u,\"echo_write\":%u,\"fade\":%.9g,\"extra_dry\":%.9g,\"energy\":%.9g}",block?",\n":"",block,current,manager[19],manager[20],manager[34],manager[0],manager[1],((unsigned char*)manager)[239],obj[15]&255,obj[32],obj[30],fade,drygain,energy);
 }
 puts("\n]");free(ring);return 0;
}
