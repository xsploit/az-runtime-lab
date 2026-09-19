#include "pair_runtime.h"
#include <math.h>
#include <ctype.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
static void ramp(EchoRamp *r,unsigned length,float value){
 memset(r,0,sizeof *r);r->length=length;r->inverse=1.0f/length;r->done=1;
 for(unsigned i=0;i<2;i++)r->current[i]=r->target[i]=value;
}
static void delay_ramp(DelayRamp *r,unsigned length,float value){
 memset(r,0,sizeof *r);r->length=length;r->inverse=1.0f/length;r->done=1;
 for(unsigned i=0;i<2;i++)r->current[i]=r->target[i]=value;
}
static BeatPair bind(PairRuntime *s,DelayPlayerFixture *dp){
 _Static_assert(sizeof *dp==sizeof s->player,"player layout");
 memcpy(dp,&s->player,sizeof *dp);
 return (BeatPair){.manager=s->manager,.echo=&s->echo,.echo_q=&s->echo_q,
  .echo_player=&s->player,.echo_ring=s->echo_ring,.delay=&s->delay,
  .delay_q=&s->delay_q,.delay_player=dp,.delay_ring=s->delay_ring};
}
void pair_runtime_init(PairRuntime *s){
 memset(s,0,sizeof *s);beat_manager_echo_init(&s->manager);s->manager.off_time=500;
 s->echo.control.rate=s->delay.control.rate=44100;
 s->echo.control.max_samples=s->delay.control.max_samples=352800;
 s->echo.control.depth=s->delay.control.depth=.8f;
 s->echo.time_ms=s->delay.time_ms=500;
 s->echo.delay=s->echo.previous_delay=s->delay.delay=s->delay.previous_delay=22050;
 s->echo.ring_length=s->delay.ring_length=352800;s->echo.feedback=(Stereo){.7f,.7f};
 ramp(&s->echo.control.gate,191,0);ramp(&s->echo.control.dry,147,1);
 ramp(&s->echo.control.wet,147,0);ramp(&s->echo.cross,147,0);
 delay_ramp(&s->delay.control.gate,191,0);delay_ramp(&s->delay.control.dry,147,1);
 delay_ramp(&s->delay.control.wet,147,0);delay_ramp(&s->delay.cross,147,0);
 s->echo_q.last_index=s->delay_q.last_index=-1;
 s->echo_q.flag94=s->delay_q.flag94=1;s->echo_q.beat_button=s->delay_q.beat_button=5;
 s->player.grid_enabled=1;
}
int pair_runtime_set(PairRuntime *s,unsigned type,unsigned target,unsigned beat,float depth){
 if(!s||(type!=0&&type!=1&&type!=5)||target>4||beat>11||!isfinite(depth)||depth<0||depth>1)return -1;
 s->manager.next_type=type;s->manager.next_target=target;s->manager.next_beat=beat;s->manager.depth=depth;return 1;
}
int pair_runtime_source(PairRuntime *s,unsigned source,unsigned bpm,unsigned time,float tempo,unsigned loaded,unsigned quantize){
 if(!s||source>3||(bpm>100000&&bpm!=UINT32_MAX)||!isfinite(tempo)||tempo<=-1||tempo>4||loaded>1||quantize>1)return -1;
 unsigned changed=source!=s->source_id;
 if(changed){
  s->echo_q.last_index=s->delay_q.last_index=-1;
  s->echo_q.flag96=s->echo_q.flag93=s->echo_q.wait=0;
  s->delay_q.flag96=s->delay_q.flag93=s->delay_q.wait=0;
  s->echo_q.flag94=s->delay_q.flag94=1;
  /* No new grid was bound: never apply the previous track's grid. */
  s->player.beat_present=0;s->player.external_beats=NULL;s->player.count=0;
 }
 s->source_id=source;
 s->player.beat_present=s->grid.grid&&s->grid.source_id==source&&beat_grid_count(s->grid.grid)>0;
 if(changed&&s->player.beat_present)beat_grid_bind(&s->grid,s->grid.grid,source,&s->player,&s->echo_q);
 s->manager.bfx_bpm=bpm;s->player.channel_valid=loaded;
 s->player.playing_time=time;s->player.tempo=tempo;s->player.mixer_quantize=quantize;
 DelayPlayerFixture dp;BeatPair pair=bind(s,&dp);beat_pair_set_beat(&pair,1);s->manager=pair.manager;return 1;
}
void pair_runtime_begin(PairRuntime *s){s->manager.consumed=0;s->offered=0;}
int pair_runtime_offer(PairRuntime *s,unsigned target,Stereo block[64]){
 if(!s||!block||target>4)return -1;
 if(s->offered||s->manager.target!=target)return 0;
 DelayPlayerFixture dp;BeatPair pair=bind(s,&dp);beat_pair_process(&pair,block,64,0);
 s->manager=pair.manager;s->offered=1;return 1;
}
void pair_runtime_reset(PairRuntime *s){
 unsigned type=s->manager.next_type,target=s->manager.next_target,beat=s->manager.next_beat,bpm=s->manager.bfx_bpm,source=s->source_id;
 float depth=s->manager.depth;EchoPlayerFixture player=s->player;BeatGridBinding grid=s->grid;
 pair_runtime_init(s);s->player=player;s->grid=grid;s->source_id=source;
 s->player.beat_present=s->grid.grid&&s->grid.source_id==source&&beat_grid_count(s->grid.grid)>0;
 s->manager.bfx_bpm=bpm;
 pair_runtime_set(s,type,target,beat,depth);
}

/* Deliberately stricter than sscanf: reject unsigned wrap, extra tokens and
 * nonfinite floats before changing the live object. Control-thread adapter. */
static int uint_token(const char *text,unsigned *out){
 if(!text||!*text)return 0;
 for(const char *p=text;*p;p++)if(!isdigit((unsigned char)*p))return 0;
 errno=0;char *end;unsigned long n=strtoul(text,&end,10);
 if(errno||*end||n>UINT32_MAX)return 0;
 *out=(unsigned)n;return 1;
}
static int float_token(const char *text,float *out){
 if(!text||!*text)return 0;
 errno=0;char *end;float n=strtof(text,&end);
 if(errno||*end||!isfinite(n))return 0;
 *out=n;return 1;
}
int pair_runtime_command(PairRuntime *s,const char *command){
 if(!s||!command)return -1;
 size_t length=0;while(length<256&&command[length])length++;
 if(length==256)return -1;
 char buffer[256];memcpy(buffer,command,length+1);
 char *tokens[8];unsigned count=0;char *p=buffer;
 while(*p){
  while(isspace((unsigned char)*p))p++;
  if(!*p)break;
  if(count==8)return -1;
  tokens[count++]=p;while(*p&&!isspace((unsigned char)*p))p++;
  if(*p)*p++=0;
 }
 unsigned a,b,c,d,e;float f;
 if(count==5&&!strcmp(tokens[0],"E1")&&uint_token(tokens[1],&a)&&
    uint_token(tokens[2],&b)&&uint_token(tokens[3],&c)&&float_token(tokens[4],&f))
  return pair_runtime_set(s,a,b,c,f);
 if(count==7&&!strcmp(tokens[0],"P1")&&uint_token(tokens[1],&a)&&
    uint_token(tokens[2],&b)&&uint_token(tokens[3],&c)&&float_token(tokens[4],&f)&&
    uint_token(tokens[5],&d)&&uint_token(tokens[6],&e))
  return pair_runtime_source(s,a,b,c,f,d,e);
 return -1;
}

const BeatGridSnapshot *pair_runtime_grid(PairRuntime *s,const BeatGridSnapshot *next,unsigned source){
 /* Same-deck track replacement must invalidate Delay as well as Echo. */
 if(s->grid.grid!=next||s->grid.source_id!=source){
  s->delay_q.last_index=-1;s->delay_q.wait=s->delay_q.flag93=s->delay_q.flag96=0;
  s->delay_q.flag94=1;
 }
 const BeatGridSnapshot *old=beat_grid_bind(&s->grid,next,source,&s->player,&s->echo_q);
 if(source!=s->source_id)s->player.beat_present=0;
 return old;
}
