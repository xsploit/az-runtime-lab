/* Replay original ARM output on a persistent portable candidate. Private
 * records contain original PCM/state; do not publish the record file. */
#include "beat-port/beat_pair.h"
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
static FILE *input;
static void read_bytes(void *p,size_t n){if(fread(p,1,n,input)!=n){fprintf(stderr,"truncated record\n");exit(2);}}
static void check(const void *a,const void *b,size_t n,const char *name,unsigned block){
 if(memcmp(a,b,n)){fprintf(stderr,"mismatch %s block %u\n",name,block);exit(1);}
}
int main(void){
 input=fopen("native-beat-pair-audio-records.bin","rb");if(!input)return 2;
 uint32_t layout[8],expected[]={0x42504131,4800,sizeof(BeatManagerEcho),sizeof(EchoAudio),sizeof(DelayAudio),sizeof(EchoQuantize),sizeof(DelayQuantize),offsetof(EchoPlayerFixture,beats)+sizeof(((EchoPlayerFixture*)0)->beats)};
 read_bytes(layout,sizeof layout);check(layout,expected,sizeof layout,"record ABI",0);
 BeatManagerEcho m;EchoAudio e;DelayAudio d;EchoQuantize eq;DelayQuantize dq;
 read_bytes(&m,sizeof m);read_bytes(&e,sizeof e);read_bytes(&d,sizeof d);read_bytes(&eq,sizeof eq);read_bytes(&dq,sizeof dq);
 Stereo *er=calloc(352800,sizeof *er),*dr=calloc(352800,sizeof *dr),*reference=malloc(352800*sizeof *reference);
 if(!er||!dr||!reference)return 2;
 EchoPlayerFixture ep={0};DelayPlayerFixture dp={0};
 _Static_assert(sizeof ep==sizeof dp,"player fixture layouts");
 BeatPair pair={.manager=m,.echo=&e,.echo_q=&eq,.echo_player=&ep,.echo_ring=er,.delay=&d,.delay_q=&dq,.delay_player=&dp,.delay_ring=dr};
 for(unsigned block=0;block<layout[1];block++){
  uint32_t request[4];Stereo audio[64],native[64];
  read_bytes(request,sizeof request);read_bytes(&ep,layout[7]);memcpy(&dp,&ep,sizeof dp);read_bytes(audio,sizeof audio);
  pair.manager.next_type=request[0];pair.manager.next_target=request[1];pair.manager.quantize=request[2];pair.manager.consumed=0;
  beat_pair_process(&pair,audio,64,request[3]);
  BeatManagerEcho nm;EchoAudio ne;DelayAudio nd;EchoQuantize neq;DelayQuantize ndq;
  read_bytes(&nm,sizeof nm);read_bytes(&ne,sizeof ne);read_bytes(&nd,sizeof nd);read_bytes(&neq,sizeof neq);read_bytes(&ndq,sizeof ndq);read_bytes(native,sizeof native);
  check(&pair.manager,&nm,sizeof nm,"manager",block);check(&e,&ne,sizeof ne,"echo",block);check(&d,&nd,sizeof nd,"delay",block);
  check(&eq,&neq,sizeof neq,"echo quantize",block);check(&dq,&ndq,sizeof ndq,"delay quantize",block);check(audio,native,sizeof native,"PCM",block);
 }
 read_bytes(reference,352800*sizeof *reference);check(er,reference,352800*sizeof *reference,"final Echo ring",layout[1]);
 read_bytes(reference,352800*sizeof *reference);check(dr,reference,352800*sizeof *reference,"final Delay ring",layout[1]);
 if(fgetc(input)!=EOF||ferror(input))return 2;
 fclose(input);free(er);free(dr);free(reference);
 puts("PASS persistent host replay: 4800 blocks, state/PCM each block, full final rings");return 0;
}
