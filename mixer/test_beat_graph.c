#include "dsp_graph.h"
#include <assert.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
int main(void){
 LabMix mix={.channel_gain={1,1,1,1},.cross_position=.5f,.master_gain=.5f,.headphones_gain=1,.cue_mask=1};
 LabDspGraph graph;LabBeatFx *b=malloc(sizeof *b);assert(b);lab_beat_fx_init(b);assert(lab_dsp_graph_init(&graph,44100,&mix)==1);assert(lab_dsp_graph_attach_beat(&graph,b)==1);
 assert(lab_beat_fx_set(b,1,0,5,.8f)==-1);assert(lab_beat_fx_set(b,5,5,5,.8f)==-1);assert(lab_beat_fx_source(b,3,12000,0,0,1,0)==1);assert(b->manager.target==0&&b->source_id==3);
 assert(lab_beat_fx_set(b,5,0,0,.8f)==1);
 double delayed=0,cue=0;float in[640]={0},out[256];
 for(unsigned block=0;block<100;block++){
  for(unsigned i=0;i<640;i++)in[i]=0;
  if(block==10){in[0]=1;in[1]=.5f;}
  assert(lab_dsp_graph_process(&graph,in,out,64)==1);
  if(block>11)for(unsigned i=0;i<64;i++){delayed+=out[i*4]*out[i*4];cue+=out[i*4+2]*out[i*4+2];}
 }
 assert(delayed>1e-5&&cue==0);
 /* A closed input fader must not erase existing post-fader Echo history. */
 assert(lab_beat_fx_set(b,5,0,0,.8f)==1);mix.channel_gain[0]=0;assert(lab_dsp_graph_set_mix(&graph,&mix,0)==1);
 unsigned before=b->echo.control.counter;assert(lab_dsp_graph_process(&graph,in,out,64)==1);assert(b->echo.control.counter==before+128);
 /* Cross-channel switch can advance only one block even when new target is later. */
 assert(lab_beat_fx_set(b,5,3,0,.8f)==1);
 for(unsigned k=0;k<8;k++){before=b->echo.control.counter;assert(lab_dsp_graph_process(&graph,in,out,64)==1);assert(b->echo.control.counter==before+128);}
 assert(b->manager.target==3);
 assert(lab_beat_fx_set(b,5,4,0,.8f)==1);for(unsigned k=0;k<8;k++)assert(lab_dsp_graph_process(&graph,in,out,64)==1);assert(b->manager.target==4);
 assert(lab_dsp_graph_reset(&graph)==1);assert(b->echo.control.counter==0&&b->source_id==3&&b->manager.next_target==4&&b->manager.next_type==5);
 printf("Echo graph: delayed_energy=%.9g pre_fader_cue_tail=%.9g; source, post-fader history, target round guard, master and reset passed\n",delayed,cue);free(b);return 0;
}
