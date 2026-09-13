#define main delay_audio_prior_main
#include "delay_audio_compare.c"
#undef main
#ifdef QUANTIZE_PHASE_BUILD
#define main quantize_prior_main
#endif
#include "delay_quantize.h"
static DelayQuantize cq;static DelayPlayerFixture cp;
void delay_post_block(DelayAudio *s){if(delay_quantize_check(&cq,&cp))delay_quantize_time(s,&cq,&cp);}
#ifndef HOST_REPLAY
extern void native_quantize_set(void *),native_time_update(void *),native_adjust(void *,unsigned,float);
extern int native_quantize_check(void *);
#ifdef DELAY_STATUS_ORACLE
extern void native_status(void *),native_manager_on(void *,unsigned);
static uint32_t native_manager[3];
#endif
static DelayPlayerFixture np;static uint32_t beatinfo[15];
int fixture_channel(unsigned *channel){*channel=0;return (int)np.channel_valid;}
void *fixture_engine(void){return &np;}
void *fixture_beat(void *engine,unsigned channel){(void)engine;(void)channel;return np.beat_present?beatinfo:NULL;}
int fixture_quantize(void *engine){(void)engine;return (int)np.mixer_quantize;}
int fixture_reverse(void *engine,unsigned channel){(void)engine;(void)channel;return (int)np.reverse;}
int fixture_scratch(void *engine,unsigned channel){(void)engine;(void)channel;return (int)np.scratch;}
int fixture_spin(void *engine,unsigned channel){(void)engine;(void)channel;return (int)np.spin;}
int fixture_scan(void *engine,unsigned channel){(void)engine;(void)channel;return (int)np.scan;}
unsigned fixture_time(void *engine,unsigned channel){(void)engine;(void)channel;return np.playing_time;}
float fixture_tempo(void *engine,unsigned channel,unsigned adjusted){(void)engine;(void)channel;(void)adjusted;return np.tempo;}
static void set_player(void){np=cp;beatinfo[9]=np.grid_enabled;beatinfo[10]=np.offset;beatinfo[12]=np.relative;beatinfo[13]=(uint32_t)np.beats;beatinfo[14]=(uint32_t)(np.beats+np.count);}
static void set_quantize(void){unsigned char *b=(void*)obj;obj[22]=cq.wait;b[93]=cq.flag93;b[94]=cq.flag94;b[95]=cq.flag95;b[96]=cq.flag96;b[97]=cq.flag97;obj[27]=cq.last_index<0?0:(uint32_t)(np.beats+cq.last_index);obj[17]=cq.beat_button;obj[10]=4000;obj[11]=1;vtable[3]=(uint32_t)native_adjust;vtable[15]=(uint32_t)delay_time;
#ifdef DELAY_STATUS_ORACLE
 vtable[7]=(uint32_t)native_status;vtable[8]=(uint32_t)delay_off;vtable[9]=(uint32_t)delay_on;native_manager[2]=(uint32_t)obj;
#endif
}
static DelayQuantize get_quantize(void){unsigned char *b=(void*)obj;DelayQuantize q={obj[22],b[93],b[94],b[95],b[96],b[97],obj[27]?(int32_t)(((DelayBeat*)obj[27])-np.beats):-1,obj[17]};return q;}
#endif
int main(int argc,char **argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
 records=fopen(argv[1],"rb");
#else
 records=fopen(argv[1],"wb");
#endif
 if(!records)return 2;
 for(unsigned scenario=0;scenario<96;scenario++){
  DelayAudio s={0};s.control.rate=44100;s.control.max_samples=352800;s.control.depth=.85f;s.control.counter=705610;s.time_ms=500;s.delay=s.previous_delay=22050;s.ring_length=352800;s.on=1;
  const unsigned ages[]={0,1,22050,22051,352799,352805};
  s.control.counter=ages[scenario%6];s.write_index=scenario%2?s.ring_length-2:0;
  ramp(&s.control.gate,191,1);ramp(&s.control.dry,147,1);ramp(&s.control.wet,147,.5f);ramp(&s.cross,147,1);
  cq=(DelayQuantize){123,1,0,1,1,0,-1,scenario%10};
  cp=(DelayPlayerFixture){0};cp.channel_valid=cp.beat_present=cp.mixer_quantize=cp.grid_enabled=1;cp.offset=100;cp.count=16;
  for(unsigned i=0;i<=cp.count;i++)cp.beats[i]=(DelayBeat){(uint16_t)(i%4+1),(uint16_t)(i<8?12800:17400),i*500};
  Stereo *ring=calloc(s.ring_length,sizeof(Stereo)),*nr=calloc(s.ring_length,sizeof(Stereo));if(!ring||!nr)return 2;
#ifndef HOST_REPLAY
  set_native(&s,nr);set_player();set_quantize();
#endif
  for(unsigned block=0;block<40;block++){
   cp.playing_time=(block*233+scenario*113)%9200;cp.tempo=((int)((scenario+block)%9)-4)*.08f;
   cp.reverse=block%13==2;cp.scratch=block%13==3;cp.spin=block%13==4;cp.scan=block%13==5;
   cp.channel_valid=block%17!=3;cp.beat_present=block%17!=4;cp.mixer_quantize=block%17!=5;
   cp.grid_enabled=block%19!=3;
   if(block%7==0)cp.playing_time=cp.offset+(block%16)*500; /* exact boundary */
   if(block%11==0)cp.playing_time=cp.offset-1; /* before first beat */
   if(scenario%11==0)cp.beats[block%16].bpm100=4000;
   if(scenario%7==0)cp.beats[block%16].bpm100=3000; /* below threshold */
   cq.beat_button=(scenario+block/8)%10;
#ifndef HOST_REPLAY
   /* Beat storage address is stable. Copy new player inputs without resetting
      native quantize state or cached beat iterator between blocks. */
   set_player();obj[17]=cq.beat_button;
#endif
#ifdef DELAY_STATUS_ORACLE
   unsigned request=block%8<4;
#ifndef HOST_REPLAY
   native_manager_on(native_manager,request);
#endif
   delay_effect_set_on(&s,&cq,&cp,request);
#endif
   unsigned n=block%9==0?0:block%9==1?1:block%9==2?127:64;
   Stereo in[127],out[127],no[127];for(unsigned k=0;k<n;k++)in[k]=(Stereo){rnd()*.1f,rnd()*.1f};
   if(block%8==0){
#ifndef HOST_REPLAY
    native_quantize_set(obj);
#endif
    delay_quantize_set(&s,&cq,&cp);
   }
#ifndef HOST_REPLAY
   delay_execute(obj,in,no,(int)n);DelayAudio ref=get_native();DelayQuantize nq=get_quantize();uint32_t relative=beatinfo[12];
#else
   DelayAudio ref;DelayQuantize nq;uint32_t relative;
#endif
   transfer(&ref,sizeof ref);transfer(&nq,sizeof nq);transfer(&relative,4);transfer(no,n*sizeof(Stereo));
   /* Compare all changed ring cells, plus complete ring at scenario end.
      Native write index increments once per sample; store corresponding range. */
   unsigned before=s.write_index;
   for(unsigned k=0;k<n;k++)transfer(&nr[(before+k)%s.ring_length],sizeof(Stereo));
   delay_audio(&s,ring,in,out,n);calls++;frames+=n;
   compare(&s,&ref,sizeof s,"state",scenario,block);compare(&cq,&nq,sizeof cq,"quantize",scenario,block);compare(&cp.relative,&relative,4,"beat-relative",scenario,block);compare(out,no,n*sizeof(Stereo),"audio",scenario,block);
   for(unsigned k=0;k<n;k++){unsigned ix=(before+k)%s.ring_length;compare(&ring[ix],&nr[ix],sizeof(Stereo),"ring-write",scenario,block);}
  }
  transfer(nr,s.ring_length*sizeof(Stereo));compare(ring,nr,s.ring_length*sizeof(Stereo),"full-ring",scenario,40);
  free(ring);free(nr);
 }
 fclose(records);printf("{\"calls\":%u,\"stereo_frames\":%llu,\"compared_words\":%llu,\"mismatches\":%u}\n",calls,frames,words,mismatches);return mismatches?1:0;
}
