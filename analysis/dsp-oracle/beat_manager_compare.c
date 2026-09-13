#ifndef HOST_REPLAY
#include "beat_manager_probe.c"
#else
#define QUANTIZE_PHASE_BUILD 1
#include "echo_quantize_compare.c"
#endif
#undef main
#include "beat_manager_echo.h"
#ifndef HOST_REPLAY
static BeatManagerEcho capture_manager(void){BeatManagerEcho m={0};m.target=manager[0];m.next_target=manager[1];m.active=manager[2]==(uint32_t)obj?5:0;m.remembered=manager[3]==(uint32_t)obj?5:0;m.type=manager[19];m.next_type=manager[20];m.phase=manager[34];memcpy(&m.fade,manager+24,40);memcpy(&m.dry,manager+36,40);memcpy(&m.long_ramp,manager+46,40);memcpy(&m.depth,manager+58,4);m.beat=manager[56];m.next_beat=manager[57];unsigned char *b=(void*)manager;m.quantize=b[236];m.force_change=b[237];m.previous_bypass=b[238];m.consumed=b[239];m.off_on=off_object[15]&255;memcpy(&m.off_depth,off_object+8,4);m.off_time=off_object[9];m.off_beat=off_object[17];m.off_max_time=off_object[10];m.off_max_beat=off_object[18];m.bfx_bpm=manager_bpm;return m;}
#endif
int main(int argc,char **argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
 records=fopen(argv[1],"rb");
#else
 records=fopen(argv[1],"wb");
#endif
 if(!records)return 2;
 EchoAudio s={0};s.control.rate=44100;s.control.max_samples=352800;s.control.depth=.8f;s.time_ms=20;s.delay=s.previous_delay=882;s.ring_length=352800;s.feedback=(Stereo){.7f,.7f};
 ramp(&s.control.gate,191,0);ramp(&s.control.dry,147,1);ramp(&s.control.wet,147,0);ramp(&s.cross,147,0);
 Stereo *ring=calloc(s.ring_length,sizeof(Stereo)),*native_ring=calloc(s.ring_length,sizeof(Stereo));if(!ring||!native_ring)return 2;
 cp=(EchoPlayerFixture){0};cp.channel_valid=cp.beat_present=cp.grid_enabled=1;cp.count=16;for(unsigned i=0;i<=16;i++)cp.beats[i]=(EchoBeat){1,12000,i*500};cq=(EchoQuantize){0,0,1,0,0,0,-1,5};
#ifndef HOST_REPLAY
 Stereo scratch[64];
 set_native(&s,native_ring);set_player();set_quantize();obj[2]=44100;float inv=1.0f/44100;memcpy(&obj[3],&inv,4);obj[4]=64;obj[12]=50;obj[13]=100;obj[14]=(uint32_t)-100;obj[16]=2;obj[18]=9;obj[19]=0;obj[20]=1;
 vtable[2]=(uint32_t)echo_execute;vtable[4]=(uint32_t)echo_init;vtable[6]=(uint32_t)native_echo_beat;vtable[7]=(uint32_t)native_status;vtable[8]=(uint32_t)echo_off;vtable[9]=(uint32_t)echo_on;vtable[10]=(uint32_t)native_echo_notify;vtable[11]=(uint32_t)echo_keep;
 init_off();memset(manager,0,sizeof manager);manager[2]=(uint32_t)off_object;manager[3]=(uint32_t)obj;manager[4]=(uint32_t)off_object;
 for(unsigned i=5;i<=18;i++)manager[i]=(uint32_t)sentinels[i-5];
 manager[9]=(uint32_t)obj;manager[22]=(uint32_t)scratch;
 EchoRamp f,d,l;ramp(&f,191,1);ramp(&d,191,0);ramp(&l,66112,0);memcpy(manager+24,&f,40);memcpy(manager+36,&d,40);memcpy(manager+46,&l,40);manager[56]=manager[57]=5;float depth=.8f;memcpy(manager+58,&depth,4);

#endif
 BeatManagerEcho m;beat_manager_echo_init(&m);
 const char *initial=getenv("BEAT_INITIAL_CASE");
 unsigned initial_case=initial?(unsigned)strtoul(initial,0,10):0;
 static const unsigned initial_bpms[]={0,4000,12000,12800,100000,UINT32_MAX};
 if(initial){
  if(initial_case>=72)return 2;
  m.bfx_bpm=initial_bpms[initial_case/12];m.next_beat=initial_case%12;m.next_type=5;
  cp.beat_present=cp.mixer_quantize=0;
#ifndef HOST_REPLAY
  extern void native_switch_beat(void *,unsigned);
  manager_bpm=m.bfx_bpm;manager[57]=m.next_beat;set_player();native_switch_beat(manager,1);
#endif
  beat_manager_echo_set_beat(&m,&s,&cq,&cp,1);
 }
 for(unsigned block=0;block<(initial?12u:180u);block++){
 unsigned bypass=!initial&&((block>=108&&block<116)||(block>=128&&block<138));
 if(!initial){
  if(block==0||block==35)m.next_type=5;
  if(block==18||block==66)m.next_type=0;
  if(block==52)m.next_target=1;
  if(block==75)m.next_target=2;
  if(block==100||block==150)m.next_type=5;
  if(block==120||block==165)m.next_type=0;
  
  if(block>=95)m.depth=(float)((block/7)%11)/10.0f;
  cp.mixer_quantize=block>=90 && block%19!=0;
  cp.playing_time=(block*233)%7900;cp.tempo=((int)(block%7)-3)*.05f;
  cp.reverse=block%23==0;cp.scratch=block%23==1;
  if(block%9==0)m.next_beat=(block/9)%13;
  static const unsigned bpms[]={3000,4000,12000,17405,99999,UINT32_MAX};
  m.bfx_bpm=bpms[(block/11)%6];
  m.quantize=block%3==0;
  if(block==27||block==125||block==171)m.force_change=1;
  }
  m.consumed=0;
#ifndef HOST_REPLAY
  manager_bpm=m.bfx_bpm;manager[57]=m.next_beat;((unsigned char*)manager)[236]=m.quantize;((unsigned char*)manager)[237]=m.force_change;set_player();memcpy(manager+58,&m.depth,4);manager[20]=m.next_type;manager[1]=m.next_target;((unsigned char*)manager)[239]=0;
#endif
  if(!initial&&block%7==3){
#ifndef HOST_REPLAY
   extern void native_switch_beat(void *,unsigned);native_switch_beat(manager,block%2);
#endif
   beat_manager_echo_set_beat(&m,&s,&cq,&cp,block%2);
  }
  Stereo audio[64],native_audio[64];for(unsigned i=0;i<64;i++)audio[i]=native_audio[i]=(Stereo){rnd()*.1f,rnd()*.1f};
#ifndef HOST_REPLAY
  native_manager_operate(manager,native_audio,64,bypass);BeatManagerEcho ref=capture_manager();EchoAudio ra=get_native();EchoQuantize rq=get_quantize();
#else
  BeatManagerEcho ref;EchoAudio ra;EchoQuantize rq;
#endif
  transfer(&ref,sizeof ref);transfer(&ra,sizeof ra);transfer(&rq,sizeof rq);transfer(native_audio,sizeof native_audio);transfer(native_ring,s.ring_length*sizeof(Stereo));
#ifdef BEAT_PORT_CONTEXT_TEST
  EchoQuantize local_q=cq;EchoPlayerFixture local_p=cp;memset(&cq,0,sizeof cq);memset(&cp,0,sizeof cp);
  beat_manager_echo_process(&m,&s,&local_q,&local_p,ring,audio,64,bypass);cq=local_q;cp=local_p;
#else
  beat_manager_echo_process(&m,&s,&cq,&cp,ring,audio,64,bypass);
#endif
  calls++;frames+=64;
  if(m.consumed){
#ifndef HOST_REPLAY
   native_manager_operate(manager,native_audio,64,bypass);
   BeatManagerEcho repeated=capture_manager();compare(&repeated,&ref,sizeof ref,"native-round-guard",0,block);
#endif
   beat_manager_echo_process(&m,&s,&cq,&cp,ring,audio,64,bypass);
  }
  compare(&m,&ref,sizeof m,"manager",0,block);compare(&s,&ra,sizeof s,"echo",0,block);compare(&cq,&rq,sizeof cq,"quantize",0,block);compare(audio,native_audio,sizeof audio,"audio",0,block);compare(ring,native_ring,s.ring_length*sizeof(Stereo),"ring",0,block);
 }
 free(ring);free(native_ring);fclose(records);printf("{\"calls\":%u,\"stereo_frames\":%llu,\"compared_words\":%llu,\"mismatches\":%u}\n",calls,frames,words,mismatches);return mismatches?1:0;
}
