#include "echo_quantize_compare.c"
#undef main
#include "quantize_phase.h"
#ifndef HOST_REPLAY
extern void native_check_phase(void *);
extern int native_calc_play(void *,int),native_calc_zero(void *);
extern void *native_nearest(void *,int,unsigned);
extern unsigned native_duration(void *,int,void **);
static int32_t native_position;
int fixture_position(void *engine,unsigned channel){(void)engine;(void)channel;return native_position;}
static void set_phase(const QuantizePhase *s){unsigned char *b=(void*)obj;b[92]=(unsigned char)s->flag92;obj[25]=s->aux100;obj[26]=s->divisor104;obj[21]=s->phase_index<0?0:(uint32_t)(np.beats+s->phase_index);}
static QuantizePhase get_phase(void){QuantizePhase s={0};s.q=get_quantize();s.flag92=((unsigned char*)obj)[92];s.aux100=obj[25];s.divisor104=obj[26];s.phase_index=obj[21]?(int32_t)(((EchoBeat*)obj[21])-np.beats):-1;return s;}
#endif
int main(int argc,char **argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
 records=fopen(argv[1],"rb");
#else
 records=fopen(argv[1],"wb");
#endif
 if(!records)return 2;
 for(unsigned scenario=0;scenario<72;scenario++){
  EchoAudio a={0};a.control.rate=44100;a.time_ms=500;QuantizePhase s={0};s.q.last_index=-1;s.phase_index=-1;s.q.flag94=1;s.q.beat_button=scenario%12;
  cp=(EchoPlayerFixture){0};cp.channel_valid=cp.beat_present=cp.mixer_quantize=cp.grid_enabled=1;cp.offset=100;cp.count=16;
  for(unsigned i=0;i<=cp.count;i++)cp.beats[i]=(EchoBeat){(uint16_t)(i%4+1),(uint16_t)(i<8?12800:17400),i*500};
#ifndef HOST_REPLAY
  set_native(&a,NULL);set_player();cq=s.q;set_quantize();set_phase(&s);
#endif
  for(unsigned step=0;step<100;step++){
   cp.playing_time=(step*97+scenario*53)%8500;
   if(step%11==0){int edges[]={-1,0,1,124,125,126,249,250,251,374,375,376};cp.playing_time=cp.offset+500+(unsigned)edges[scenario%12];}cp.tempo=((int)((scenario+step/5)%9)-4)*.08f;
   cp.reverse=step%29==12;cp.scratch=step%29==13;cp.spin=step%29==14;cp.scan=step%29==15;
   cp.channel_valid=step%31!=16;cp.beat_present=step%31!=17;
   if(scenario%11==0)cp.beats[step%16].bpm100=3000;
   int32_t position=(int32_t)((double)cp.playing_time*44.1)+((int)(step%3)-1);
   if(step%14==0)position=-1-(int32_t)scenario;
#ifndef HOST_REPLAY
   set_player();native_position=position;
#endif
   unsigned action=step%7;int32_t r1=0,r2=0;
   if(action==0){int compensation=(int)(step%129);
#ifndef HOST_REPLAY
    r1=native_calc_play(obj,compensation);
#endif
    r2=phase_playing_time(&cp,position,compensation);
   }else if(action==1){
#ifndef HOST_REPLAY
    r1=native_calc_zero(obj);
#endif
    r2=phase_playing_time(&cp,position,0);
   }else if(action==2){unsigned initial=step%2;
#ifndef HOST_REPLAY
    void *it=native_nearest(obj,(int)cp.playing_time,initial);r1=it?(int32_t)(((EchoBeat*)it)-np.beats):-1;
#endif
    r2=phase_nearest(&s,&cp,(int32_t)cp.playing_time,initial);
   }else if(action==3){int ix=(int)(step%15);
#ifndef HOST_REPLAY
    void *it=np.beats+ix;r1=(int32_t)native_duration(obj,(int)cp.playing_time,&it);
#endif
    r2=(int32_t)phase_duration(&s,&cp,(int32_t)cp.playing_time,ix);
   }else{
#ifndef HOST_REPLAY
    native_check_phase(obj);
#endif
    phase_check(&a,&s,&cp,position);
   }
#ifndef HOST_REPLAY
   QuantizePhase ref=get_phase();EchoAudio ra=get_native();unsigned relative=beatinfo[12];
#else
   QuantizePhase ref;EchoAudio ra;unsigned relative;
#endif
   transfer(&r1,4);transfer(&ref,sizeof ref);transfer(&ra,sizeof ra);transfer(&relative,4);calls++;
   compare(&r2,&r1,4,"return",scenario,step);compare(&s,&ref,sizeof s,"phase",scenario,step);compare(&a,&ra,sizeof a,"effect",scenario,step);compare(&cp.relative,&relative,4,"relative",scenario,step);
  }
 }
 fclose(records);printf("{\"calls\":%u,\"compared_words\":%llu,\"mismatches\":%u}\n",calls,words,mismatches);return mismatches?1:0;
}
