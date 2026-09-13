#include "beat_grid.h"
#include <assert.h>
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
static void init_ramp(EchoRamp *r,unsigned n,float v){*r=(EchoRamp){0};r->length=n;r->inverse=1.0f/n;r->done=1;for(unsigned k=0;k<2;k++)r->current[k]=r->target[k]=v;}
int main(void){
 EchoAudio a={0};a.control.rate=44100;a.control.max_samples=352800;a.control.depth=.8f;a.time_ms=500;a.ring_length=352800;a.feedback=(Stereo){.7f,.7f};
 init_ramp(&a.control.gate,191,0);init_ramp(&a.control.dry,147,1);init_ramp(&a.control.wet,147,0);init_ramp(&a.cross,147,0);
 EchoQuantize q={0};q.last_index=-1;q.beat_button=5;
 EchoPlayerFixture p={0};p.channel_valid=p.mixer_quantize=p.grid_enabled=1;
 BeatGridBinding b={0};BeatManagerEcho m;beat_manager_echo_init(&m);m.next_type=5;
 Stereo *ring=calloc(a.ring_length,sizeof *ring);assert(ring);
 unsigned n=BEAT_GRID_MAX_BEATS;EchoBeat *raw=malloc(n*sizeof *raw);assert(raw);
 for(unsigned i=0;i<n;i++)raw[i]=(EchoBeat){i%4+1,12000,i*500};
 BeatGridSnapshot *large=beat_grid_prepare(raw,n);assert(large&&beat_grid_count(large)==n);
 raw[0].time=999;assert(!beat_grid_prepare(raw,n));raw[0].time=0;
 assert(!beat_grid_prepare(raw,n+1));assert(!beat_grid_prepare(NULL,1));
 BeatGridSnapshot *empty=beat_grid_prepare(NULL,0);assert(empty);free(raw);
 assert(!beat_grid_bind(&b,large,3,&p,&q));
 p.playing_time=(n-2)*500+1;echo_quantize_time(&a,&q,&p);assert(q.last_index==(int)n-1&&a.time_ms==500);
 p.grid_enabled=0;echo_quantize_set(&a,&q,&p);assert(a.time_ms==500);p.grid_enabled=1;
 /* Same immutable grid/source keeps cached iterator; changing source invalidates. */
 q.last_index=123;assert(!beat_grid_bind(&b,large,3,&p,&q));assert(q.last_index==123);
 assert(!beat_grid_bind(&b,large,9,&p,&q));assert(q.last_index==-1&&m.target==0);
 const BeatGridSnapshot *retired=beat_grid_bind(&b,empty,9,&p,&q);assert(retired==large&&!p.beat_present&&q.last_index==-1);beat_grid_destroy(retired);
 assert(!echo_quantize_check(&q,&p));echo_quantize_set(&a,&q,&p);
 for(unsigned iteration=0;iteration<1000;iteration++){
  EchoBeat beats[3]={{1,12000,0},{2,17400,500},{3,17400,1000}};
  BeatGridSnapshot *next=beat_grid_prepare(beats,iteration%4);assert(next);
  retired=beat_grid_bind(&b,next,iteration%4,&p,&q);beat_grid_destroy(retired);
  p.playing_time=iteration%1200;p.tempo=.02f;
  beat_manager_begin_round(&m);Stereo audio[64];for(unsigned j=0;j<64;j++)audio[j]=(Stereo){.01f,-.01f};
  beat_manager_echo_process(&m,&a,&q,&p,ring,audio,64,0);
  for(unsigned j=0;j<64;j++)assert(isfinite(audio[j].l)&&isfinite(audio[j].r));
 }
 retired=beat_grid_bind(&b,NULL,0,&p,&q);beat_grid_destroy(retired);free(ring);
 puts("grid ownership: maximum, empty, invalid, source change and 1000 replace/free/process cycles passed");return 0;
}
