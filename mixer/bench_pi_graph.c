#define _POSIX_C_SOURCE 200809L
#include "dsp_graph.h"
#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
static double stamp(clockid_t id){struct timespec t;assert(!clock_gettime(id,&t));return t.tv_sec+t.tv_nsec*1e-9;}
static int order(const void *a,const void *b){double x=*(const double*)a,y=*(const double*)b;return (x>y)-(x<y);}
int main(void){
 LabEqTables *tables=NULL;unsigned eq_mode=0;
 const char *path=getenv("LAB_EQ_TABLES"),*mode=getenv("LAB_EQ_MODE");
 if(mode){assert(!strcmp(mode,"0")||!strcmp(mode,"1"));eq_mode=(unsigned)(mode[0]-'0');}
 if(path){tables=malloc(sizeof *tables);assert(tables);FILE *f=fopen(path,"rb");assert(f);assert(fread(tables,1,sizeof *tables,f)==sizeof *tables);assert(fgetc(f)==EOF);fclose(f);assert(lab_eq_tables_valid(tables));}
 const unsigned blocks=12000;double *times=calloc(blocks,sizeof *times);assert(times);
 LabDspGraph *g=calloc(1,sizeof *g);LabBeatFx *fx=calloc(1,sizeof *fx);assert(g&&fx);
 LabMix m={.channel_gain={.25,.25,.25,.25},.cross_position=.5,.master_gain=.5,.headphones_gain=.5,.cue_mask=15};
 float input[640],out[256];for(unsigned i=0;i<640;i++)input[i]=.1f*sinf(i*.031f);
 for(unsigned type=0;type<=6;type++){
  assert(lab_dsp_graph_init(g,44100,&m)==1);lab_beat_fx_init(fx);assert(lab_dsp_graph_attach_beat(g,fx)==1);
  assert(lab_beat_fx_source(fx,3,12000,0,0,1,0)==1);assert(lab_beat_fx_set(fx,5,4,5,.5)==1);
  if(tables){assert(lab_dsp_graph_attach_eq(g,tables)==1);for(unsigned c=0;c<4;c++)assert(lab_dsp_graph_set_eq(g,c,eq_mode,.5,.5,.5)==1);}
  for(unsigned c=0;c<4;c++)assert(lab_dsp_graph_set_cfx(g,c,type,.8,.5)==1);
  for(unsigned b=0;b<1000;b++)assert(lab_dsp_graph_process(g,input,out,64)==1);
  for(unsigned c=0;c<4;c++){assert(g->channel[c].manager.active==(int)type);assert(g->channel[c].manager.phase==0);}
  if(tables)for(unsigned c=0;c<4;c++)assert(g->equalizer[c].active==(int)eq_mode);
  LabBeatFxSnapshot snap;assert(lab_beat_fx_snapshot(fx,&snap)==1);assert(snap.active_type==5);
  double sum=0,wall=stamp(CLOCK_MONOTONIC),cpu=stamp(CLOCK_PROCESS_CPUTIME_ID);
  for(unsigned b=0;b<blocks;b++){
   double t=stamp(CLOCK_MONOTONIC);assert(lab_dsp_graph_process(g,input,out,64)==1);times[b]=stamp(CLOCK_MONOTONIC)-t;
   assert(isfinite(out[b%256]));sum+=out[b%256];
  }
  cpu=stamp(CLOCK_PROCESS_CPUTIME_ID)-cpu;wall=stamp(CLOCK_MONOTONIC)-wall;qsort(times,blocks,sizeof *times,order);
  printf("{\"cfx_type\":%u,\"channels\":4,\"echo_on_master\":true,\"blocks\":%u,\"audio_seconds\":%.9f,\"cpu_seconds\":%.9f,\"wall_seconds\":%.9f,\"p50_us\":%.3f,\"p99_us\":%.3f,\"max_us\":%.3f,\"graph_bytes\":%zu,\"beat_bytes\":%zu,\"checksum\":%.9g}\n",type,blocks,blocks*64.0/44100,cpu,wall,times[blocks/2]*1e6,times[blocks*99/100]*1e6,times[blocks-1]*1e6,sizeof *g,sizeof *fx,sum);fflush(stdout);
 }
 free(tables);free(times);free(g);free(fx);return 0;
}
