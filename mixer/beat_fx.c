#include "beat_fx.h"
#include <string.h>
#include <math.h>
static void ramp(EchoRamp *r,unsigned n,float value){r->length=n;r->inverse=1.0f/n;r->done=1;for(unsigned k=0;k<2;k++)r->current[k]=r->target[k]=value;}
void lab_beat_fx_init(LabBeatFx *b){memset(b,0,sizeof *b);beat_manager_echo_init(&b->manager);b->manager.off_time=500;b->echo.control.rate=44100;b->echo.control.max_samples=352800;b->echo.control.depth=.8f;b->echo.time_ms=500;b->echo.delay=b->echo.previous_delay=22050;b->echo.ring_length=352800;b->echo.feedback=(Stereo){.7f,.7f};ramp(&b->echo.control.gate,191,0);ramp(&b->echo.control.dry,147,1);ramp(&b->echo.control.wet,147,0);ramp(&b->echo.cross,147,0);b->quantize.last_index=-1;b->quantize.flag94=1;b->quantize.beat_button=5;b->player.grid_enabled=1;}
int lab_beat_fx_set(LabBeatFx *b,unsigned type,unsigned target,unsigned beat,float depth){if(!b||(type!=0&&type!=5)||target>4||beat>11||!isfinite(depth)||depth<0||depth>1)return -1;b->manager.next_type=type;b->manager.next_target=target;b->manager.next_beat=beat;b->manager.depth=depth;return 1;}
int lab_beat_fx_source(LabBeatFx *b,unsigned source,unsigned bpm,unsigned time,float tempo,unsigned loaded,unsigned quantize){if(!b||source>3||(bpm>100000&&bpm!=UINT32_MAX)||!isfinite(tempo)||tempo<=-1||tempo>4||loaded>1||quantize>1)return -1;if(source!=b->source_id){b->quantize.last_index=-1;b->quantize.flag96=b->quantize.flag93=b->quantize.wait=0;b->quantize.flag94=1;}b->source_id=source;b->player.beat_present=b->grid.grid&&b->grid.source_id==source&&beat_grid_count(b->grid.grid)>0;b->manager.bfx_bpm=bpm;b->player.channel_valid=loaded;b->player.playing_time=time;b->player.tempo=tempo;b->player.mixer_quantize=quantize;beat_manager_echo_set_beat(&b->manager,&b->echo,&b->quantize,&b->player,1);return 1;}
void lab_beat_fx_offer(LabBeatFx *b,unsigned target,Stereo block[64]){if(b&&b->manager.target==target)beat_manager_echo_process(&b->manager,&b->echo,&b->quantize,&b->player,b->ring,block,64,0);}

void lab_beat_fx_reset(LabBeatFx *b){unsigned type=b->manager.next_type,target=b->manager.next_target,beat=b->manager.next_beat,bpm=b->manager.bfx_bpm,source=b->source_id;float depth=b->manager.depth;EchoPlayerFixture player=b->player;BeatGridBinding grid=b->grid;lab_beat_fx_init(b);b->player=player;b->grid=grid;b->source_id=source;b->player.beat_present=b->grid.grid&&b->grid.source_id==source&&beat_grid_count(b->grid.grid)>0;b->manager.bfx_bpm=bpm;lab_beat_fx_set(b,type,target,beat,depth);}

const BeatGridSnapshot *lab_beat_fx_grid(LabBeatFx *b,const BeatGridSnapshot *next,unsigned source){const BeatGridSnapshot *old=beat_grid_bind(&b->grid,next,source,&b->player,&b->quantize);if(source!=b->source_id)b->player.beat_present=0;return old;}

int lab_beat_fx_snapshot(const LabBeatFx *b,LabBeatFxSnapshot *out){
 if(!b||!out)return -1;
 const BeatManagerEcho *m=&b->manager;
 LabBeatFxSnapshot s={0};
 s.scheduled_type=m->next_type;s.scheduled_target=m->next_target;s.scheduled_beat=m->next_beat;
 s.active_type=m->active;s.target=m->target;s.phase=m->phase;s.manager_beat=m->beat;
 s.effect_beat=m->active==5?b->quantize.beat_button:m->off_beat;
 s.on=m->active==5?b->echo.on:m->off_on;
 s.time_ms=m->active==5?b->echo.time_ms:m->off_time;
 /* Echo tail history remains meaningful when switching to Off. */
 s.delay_samples=b->echo.delay;s.previous_delay_samples=b->echo.previous_delay;
 s.delay_change_pending=b->echo.control.time_changed||!b->echo.cross.done;
 s.source_id=b->source_id;s.source_bpm100=m->bfx_bpm;
 s.quantize_requested=b->player.mixer_quantize;s.grid_present=b->player.beat_present;
 *out=s;return 1;
}
