#include "dsp_graph.h"
#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <string.h>
static void close_to(float a,float b){assert(fabsf(a-b)<2e-6f);}
int main(int argc,char**argv){
 assert(argc==2);float tables[776];FILE*f=fopen(argv[1],"rb");assert(f);assert(fread(tables,sizeof(float),776,f)==776);fclose(f);
 LabMix mix={{0,1,0,0},{0,0,0,0},1,.5f,.25f,1,.5f};LabDspGraph graph;LabHeadphoneDsp hp;
 assert(lab_headphone_init(&hp,44100,tables,776));assert(lab_dsp_graph_init(&graph,44100,&mix)==1);
 uint32_t bits=0xc0eff755;float calibration;memcpy(&calibration,&bits,4);
 /* Explicit digital unity normalization for this synthetic test, not FLX6 calibration. */
 assert(lab_dsp_graph_attach_headphones(&graph,&hp,1.f/calibration)==1);
 float in[640]={0},out[256];for(unsigned i=0;i<64;i++){in[10*i]=.2f;in[10*i+1]=.6f;in[10*i+2]=.8f;in[10*i+3]=.4f;}
 for(unsigned j=0;j<100;j++)assert(lab_dsp_graph_process(&graph,in,out,64)==1);
 for(unsigned i=0;i<64;i++){close_to(out[4*i],.2f);close_to(out[4*i+1],.1f);close_to(out[4*i+2],.4f);close_to(out[4*i+3],.7f);}
 assert(lab_headphone_mode(&hp,1));for(unsigned j=0;j<100;j++)assert(lab_dsp_graph_process(&graph,in,out,64)==1);
 for(unsigned i=0;i<64;i++){close_to(out[4*i],.2f);close_to(out[4*i+1],.1f);close_to(out[4*i+2],.4f);close_to(out[4*i+3],.15f);}
 assert(lab_dsp_graph_reset(&graph)==1);for(unsigned j=0;j<100;j++)assert(lab_dsp_graph_process(&graph,in,out,64)==1);
 close_to(out[2],.4f);close_to(out[3],.15f);
 mix.channel_gain[1]=0;assert(lab_dsp_graph_set_mix(&graph,&mix,100)==1);
 for(unsigned j=0;j<100;j++)assert(lab_dsp_graph_process(&graph,in,out,64)==1);
 close_to(out[0],0);close_to(out[1],0);close_to(out[2],.4f);close_to(out[3],0);
 puts("PASS AZ graph: no-Echo headphone buses, stereo/split, mode-preserving reset, master fader/cue isolation");
}
