#include "pair_runtime.h"
#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
static void round_all(PairRuntime *s,Stereo audio[5][64]){
 pair_runtime_begin(s);unsigned offers=0;
 for(unsigned t=0;t<5;t++)offers+=(pair_runtime_offer(s,t,audio[t])==1);
 assert(offers==1);
 Stereo unchanged[64];memcpy(unchanged,audio[4],sizeof unchanged);
 assert(pair_runtime_offer(s,4,audio[4])==0);assert(!memcmp(unchanged,audio[4],sizeof unchanged));
}
int main(void){
 PairRuntime *s=malloc(sizeof *s),*other=malloc(sizeof *other),*saved=malloc(sizeof *saved);
 assert(s&&other&&saved);pair_runtime_init(s);pair_runtime_init(other);
 memcpy(saved,s,sizeof *s);
 assert(pair_runtime_set(s,2,0,5,.8f)==-1);
 assert(pair_runtime_set(s,1,5,5,.8f)==-1);
 assert(pair_runtime_set(s,1,0,12,.8f)==-1);
 assert(pair_runtime_set(s,1,0,5,NAN)==-1);
 assert(pair_runtime_source(s,4,12000,0,0,1,0)==-1);
 assert(pair_runtime_source(s,0,12000,0,INFINITY,1,0)==-1);
 assert(!memcmp(s,saved,sizeof *s));
 const char *bad[]={"", "E1 1 0 0", "E1 1 0 0 .8 extra", "E1 -1 0 0 .8",
  "E1 4294967297 0 0 .8", "E1 1 0 0 nan", "E1 1 0 0 1e100",
  "P1 0 12000 0 0 1 0 extra", "P1 0 12000 0 0 2 0",
  "P1 0 12000 0 -1 1 0", "P1 0 12000 0 0 1 0junk"};
 for(unsigned i=0;i<sizeof bad/sizeof *bad;i++){
  assert(pair_runtime_command(s,bad[i])==-1);assert(!memcmp(s,saved,sizeof *s));
 }
 char long_command[257];memset(long_command,' ',256);long_command[256]=0;
 assert(pair_runtime_command(s,long_command)==-1);assert(!memcmp(s,saved,sizeof *s));
 assert(pair_runtime_command(s,"P1 0 12000 0 0 1 0")==1);
 assert(pair_runtime_command(s," E1 1 0 0 .8\n")==1);
 double tail=0;
 for(unsigned block=0;block<700;block++){
  Stereo audio[5][64]={0};
  for(unsigned t=1;t<5;t++)for(unsigned i=0;i<64;i++)audio[t][i]=(Stereo){.123f,-.456f};
  if(block==10)audio[0][0]=(Stereo){1,-.5f};
  round_all(s,audio);
  for(unsigned t=1;t<5;t++)for(unsigned i=0;i<64;i++)assert(audio[t][i].l==.123f&&audio[t][i].r==-.456f);
  for(unsigned i=0;i<64;i++){assert(isfinite(audio[0][i].l));if(block>12)tail+=audio[0][i].l*audio[0][i].l;}
 }
 assert(s->manager.active==1&&tail>1e-5);
 assert(!memcmp(other,saved,sizeof *other)); /* no shared history */
 /* Move the processor to master, then switch algorithm and verify delivery. */
 assert(pair_runtime_command(s,"E1 5 4 0 .8")==1);
 for(unsigned block=0;block<30;block++){Stereo audio[5][64]={0};round_all(s,audio);}
 assert(s->manager.active==5&&s->manager.target==4);
 double master_tail=0;
 for(unsigned block=0;block<700;block++){
  Stereo audio[5][64]={0};if(block==0)audio[4][0]=(Stereo){1,1};round_all(s,audio);
  for(unsigned t=0;t<4;t++)for(unsigned i=0;i<64;i++)assert(audio[t][i].l==0&&audio[t][i].r==0);
  for(unsigned i=0;i<64;i++)if(block>2)master_tail+=audio[4][i].l*audio[4][i].l;
 }
 assert(master_tail>1e-5);
 s->echo_q.last_index=s->delay_q.last_index=9;s->echo_q.wait=s->delay_q.wait=1;
 s->player.beat_present=1;s->player.external_beats=s->player.beats;s->player.count=3;
 assert(pair_runtime_source(s,2,12800,100,.02f,1,0)==1);
 assert(s->echo_q.last_index==-1&&s->delay_q.last_index==-1);
 assert(!s->player.beat_present&&!s->player.external_beats&&!s->player.count);
 EchoBeat beats[2]={{0}};beats[1].time=500;
 BeatGridSnapshot *grid=beat_grid_prepare(beats,2),*replacement=beat_grid_prepare(beats,2);
 assert(grid&&replacement);
 assert(pair_runtime_grid(s,grid,2)==NULL&&s->player.beat_present);
 s->echo_q.last_index=s->delay_q.last_index=1;
 assert(pair_runtime_grid(s,replacement,2)==grid);
 assert(s->echo_q.last_index==-1&&s->delay_q.last_index==-1);
 beat_grid_destroy(grid);
 assert(pair_runtime_source(s,1,12800,100,.02f,1,1)==1&&!s->player.beat_present);
 assert(pair_runtime_source(s,2,12800,100,.02f,1,1)==1&&s->player.beat_present);
 assert(pair_runtime_source(s,2,12800,101,.02f,1,1)==1&&s->player.beat_present);
 s->player.playing_time=100;
 pair_runtime_reset(s);
 assert(s->grid.grid==replacement&&s->player.beat_present);

 assert(s->manager.next_type==5&&s->manager.next_target==4&&s->source_id==2);
 assert(s->player.playing_time==100&&s->manager.bfx_bpm==12800);
 for(unsigned i=0;i<352800;i++)assert(s->echo_ring[i].l==0&&s->echo_ring[i].r==0&&s->delay_ring[i].l==0&&s->delay_ring[i].r==0);
 for(unsigned block=0;block<30;block++){Stereo audio[5][64]={0};round_all(s,audio);for(unsigned t=0;t<5;t++)for(unsigned i=0;i<64;i++)assert(audio[t][i].l==0&&audio[t][i].r==0);}
 printf("PASS commands/routing/reset/source isolation; delay tail=%g master echo tail=%g bytes=%zu\n",tail,master_tail,sizeof *s);
 assert(pair_runtime_grid(s,NULL,2)==replacement&&!s->player.beat_present);
 beat_grid_destroy(replacement);
 free(s);free(other);free(saved);return 0;
}
