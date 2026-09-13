/* Private FIFO bridge: AZ float32LE x10 -> master/cue float32LE x4.
   Optional local control snapshots; no physical audio device. */
#include "deck_mix.h"
#ifdef LAB_DSP_GRAPH
#include "dsp_graph.h"
#include "dsp_control.h"
static LabBeatFx *prepared_beat;
#endif
#include <math.h>
#include <errno.h>
#include <signal.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <string.h>
#include <stdlib.h>
/* Opt-in diagnostic only: no file I/O or allocation in the sample loop. */
static int input_stats_enabled;
static double input_energy[10];
static float input_peak[10];
static uint64_t input_nonfinite[10],input_stat_frames;
static void input_stats(const float *samples,size_t count){
 if(!input_stats_enabled)return;
 for(size_t i=0;i<count;i++)for(size_t ch=0;ch<10;ch++){
  float v=samples[i*10+ch];
  if(!isfinite(v)){input_nonfinite[ch]++;continue;}
  input_energy[ch]+=(double)v*v;
  if(fabsf(v)>input_peak[ch])input_peak[ch]=fabsf(v);
 }
 input_stat_frames+=count;
}
static int write_all(int fd,const void *p,size_t n){
 const char *s=p;
 while(n){ssize_t k=write(fd,s,n);if(k<0&&errno==EINTR)continue;if(k<=0)return 0;s+=k;n-=k;}
 return 1;
}
/* Full snapshot protocol, bounded work per audio block. Private directory required. */
static int control_open(const char *path){
 struct sockaddr_un a={.sun_family=AF_UNIX};
 if(strlen(path)>=sizeof a.sun_path){errno=ENAMETOOLONG;return -1;}
 strcpy(a.sun_path,path);
 int fd=socket(AF_UNIX,SOCK_DGRAM|SOCK_NONBLOCK|SOCK_CLOEXEC,0);
 if(fd<0)return -1;
 if(bind(fd,(struct sockaddr*)&a,sizeof a)||chmod(path,0600)){close(fd);return -1;}
 return fd;
}
static void controls(int fd,LabMixRamp *r,uint64_t frame
#ifdef LAB_DSP_GRAPH
 ,LabDspGraph *graph
#endif
){
 if(fd<0)return;
 for(int i=0;i<16;i++){
  char b[512],tail;LabMix s={0};unsigned ramp=0;
  struct sockaddr_un peer={0};socklen_t peer_len=sizeof peer;
  ssize_t n=recvfrom(fd,b,sizeof b-1,MSG_DONTWAIT|MSG_TRUNC,(struct sockaddr*)&peer,&peer_len);
  if(n<0)return;
  if(n>=(ssize_t)sizeof b-1||memchr(b,0,(size_t)n))continue;
  b[n]=0;
#ifdef LAB_DSP_GRAPH
  if(!strcmp(b,"Q1")){
   /* Reply only to the local bound requester. No allocation, retry or wait;
      a full/disappeared receiver drops this snapshot, never stalls audio. */
   if(peer_len<=sizeof peer&&peer_len>sizeof(peer.sun_family)&&peer.sun_path[0]){
    LabBeatFxSnapshot s;
    if(lab_beat_fx_snapshot(prepared_beat,&s)==1){
     char reply[768];
     int size=snprintf(reply,sizeof reply,
      "{\"version\":1,\"audio_frame\":%llu,\"attached\":%u,"
      "\"scheduled_type\":%u,\"scheduled_target\":%u,\"scheduled_beat\":%u,"
      "\"active_type\":%u,\"target\":%u,\"phase\":%u,\"manager_beat\":%u,\"effect_beat\":%u,\"on\":%u,"
      "\"time_ms\":%u,\"delay_samples\":%u,\"previous_delay_samples\":%u,\"delay_change_pending\":%u,"
      "\"source_id\":%u,\"source_bpm100\":%u,\"quantize_requested\":%u,\"grid_present\":%u}",
      (unsigned long long)frame,graph->beat!=NULL,s.scheduled_type,s.scheduled_target,s.scheduled_beat,
      s.active_type,s.target,s.phase,s.manager_beat,s.effect_beat,s.on,
      s.time_ms,s.delay_samples,s.previous_delay_samples,s.delay_change_pending,
      s.source_id,s.source_bpm100,s.quantize_requested,s.grid_present);
     if(size>0&&(size_t)size<sizeof reply)
      (void)sendto(fd,reply,(size_t)size,MSG_DONTWAIT|MSG_NOSIGNAL,(struct sockaddr*)&peer,peer_len);
    }
   }
   continue;
  }
  unsigned type,target,beat,source,bpm,time,loaded,quantize;float depth,tempo;
  if(sscanf(b,"E1 %u %u %u %f %c",&type,&target,&beat,&depth,&tail)==4){
   int result=lab_beat_fx_set(prepared_beat,type,target,beat,depth);
   if(result==1&&!graph->beat)result=lab_dsp_graph_attach_beat(graph,prepared_beat);
   fprintf(stderr,"{\"beat_frame\":%llu,\"type\":%u,\"target\":%u,\"result\":%d}\n",(unsigned long long)frame,type,target,result);continue;
  }
  if(sscanf(b,"P1 %u %u %u %f %u %u %c",&source,&bpm,&time,&tempo,&loaded,&quantize,&tail)==6){
   int result=lab_beat_fx_source(prepared_beat,source,bpm,time,tempo,loaded,quantize);
   fprintf(stderr,"{\"source_frame\":%llu,\"source\":%u,\"result\":%d}\n",(unsigned long long)frame,source,result);continue;
  }
#ifdef LAB_HEADPHONE_DSP
  unsigned mode;
  if(sscanf(b,"H1 %u %c",&mode,&tail)==1){
   int result=graph->headphones?lab_headphone_mode(graph->headphones,mode):0;
   fprintf(stderr,"{\"headphone_frame\":%llu,\"mode\":%u,\"result\":%d}\n",(unsigned long long)frame,mode,result);continue;
  }
#endif
  LabEqCommand eq;
  if(lab_eq_command_parse(b,(size_t)n,&eq)){
   int result=lab_dsp_graph_set_eq(graph,eq.channel,eq.mode,eq.high,eq.mid,eq.low);
   fprintf(stderr,"{\"eq_frame\":%llu,\"channel\":%u,\"mode\":%u,\"result\":%d}\n",(unsigned long long)frame,eq.channel,eq.mode,result);
   continue;
  }
  LabFilterCommand effect;
  if(lab_filter_command_parse(b,(size_t)n,&effect)){
   int result=lab_dsp_graph_set_cfx(graph,effect.channel,effect.type,effect.color,effect.parameter);
   fprintf(stderr,"{\"filter_frame\":%llu,\"channel\":%u,\"result\":%d}\n",(unsigned long long)frame,effect.channel,result);
   continue;
  }
#endif
  int k=sscanf(b,"M1 %u %f %f %f %f %d %d %d %d %u %f %f %f %f %c",
   &ramp,&s.channel_gain[0],&s.channel_gain[1],&s.channel_gain[2],&s.channel_gain[3],
   &s.cross_assign[0],&s.cross_assign[1],&s.cross_assign[2],&s.cross_assign[3],
   &s.cue_mask,&s.cross_position,&s.master_gain,&s.headphones_gain,&s.cue_master_mix,&tail);
  if(k!=14||ramp>441000||!lab_mix_valid(&s))continue;
#ifdef LAB_DSP_GRAPH
  (void)r;
  if(lab_dsp_graph_set_mix(graph,&s,ramp)!=1)continue;
#else
  if(!lab_mix_ramp_target(r,&s,ramp))continue;
#endif
  fprintf(stderr,"{\"control_frame\":%llu,\"ramp_frames\":%u}\n",(unsigned long long)frame,ramp);
 }
}
/* The DSP graph runs at its verified cadence even on terminal FIFO fragments. */
static int process_block(LabMixRamp *r,float *input,float *output,size_t frames
#ifdef LAB_DSP_GRAPH
 ,LabDspGraph *graph
#endif
){
#ifdef LAB_DSP_GRAPH
 (void)r;
 if(frames<64)memset(input+frames*10,0,(64-frames)*10*sizeof(float));
 return lab_dsp_graph_process(graph,input,output,64)==1;
#else
 lab_mix_ramped(r,input,output,frames);return 1;
#endif
}
static volatile sig_atomic_t stopping=0;
static void stop(int sig){(void)sig;stopping=1;}
int main(int argc,char **argv){
 uint16_t endian=1;if((argc!=3&&argc!=4)||*(uint8_t*)&endian!=1||sizeof(float)!=4)return 2;
 int ctl=argc==4?control_open(argv[3]):-1;
 if(argc==4&&ctl<0){perror("control");return 11;}
 int in=-1;struct stat st;struct sigaction sa={0};sa.sa_handler=stop;sigemptyset(&sa.sa_mask);sigaction(SIGTERM,&sa,0);sigaction(SIGINT,&sa,0);
 int out=open(argv[2],O_WRONLY|O_CREAT|O_TRUNC|O_NOFOLLOW,0600);if(out<0){perror("output");return 5;}
 LabMix s={.channel_gain={1,1,1,1},.cross_position=.5f,.master_gain=.25f,.headphones_gain=.5f,.cue_mask=1};LabMixRamp ramp;
 if(!lab_mix_ramp_init(&ramp,&s))return 6;
#ifdef LAB_DSP_GRAPH
 prepared_beat=calloc(1,sizeof *prepared_beat);if(!prepared_beat)return 12;lab_beat_fx_init(prepared_beat);
 /* All delay banks are allocated once before opening the audio FIFO. */
 LabDspGraph *graph=calloc(1,sizeof *graph);
 if(!graph){free(prepared_beat);return 12;}
 if(lab_dsp_graph_init(graph,44100,&s)!=1){free(graph);free(prepared_beat);return 12;}
 LabEqTables *eq_tables=NULL;
 const char *eq_path=getenv("LAB_EQ_TABLES");
 if(eq_path){
  eq_tables=malloc(sizeof *eq_tables);if(!eq_tables)return 14;
  FILE *f=fopen(eq_path,"rb");if(!f){free(eq_tables);return 14;}
  size_t count=fread(eq_tables,1,sizeof *eq_tables,f);int extra=fgetc(f),failed=ferror(f);fclose(f);
  if(count!=sizeof *eq_tables||extra!=EOF||failed||lab_dsp_graph_attach_eq(graph,eq_tables)!=1){free(eq_tables);return 14;}
 }
#ifdef LAB_HEADPHONE_DSP
 LabHeadphoneDsp headphones;
 const char *table_path=getenv("LAB_HEADPHONE_TABLES");
 if(table_path){
  float tables[776];const char *scale_text=getenv("LAB_HEADPHONE_SCALE");char *end;
  if(!scale_text)return 13;
  errno=0;float scale=strtof(scale_text,&end);if(errno||end==scale_text||*end||!isfinite(scale))return 13;
  FILE *table_file=fopen(table_path,"rb");if(!table_file)return 13;
  size_t count=fread(tables,sizeof(float),776,table_file);int extra=fgetc(table_file),failed=ferror(table_file);fclose(table_file);
  if(count!=776||extra!=EOF||failed||!lab_headphone_init(&headphones,44100,tables,776)||lab_dsp_graph_attach_headphones(graph,&headphones,scale)!=1)return 13;
 }
#endif
 #define GRAPH_ARG ,graph
#else
 #define GRAPH_ARG
#endif
 input_stats_enabled=getenv("LAB_AUDIO_STATS")!=NULL;
 float samples[640],mixed[256];size_t filled=0;uint64_t frames=0;
reopen:
 if(stopping)goto done;
 in=open(argv[1],O_RDONLY|O_NOFOLLOW);
 if(in<0){if(errno==EINTR&&stopping)goto done;perror("input");return 3;}
 if(fstat(in,&st)||!S_ISFIFO(st.st_mode))return 4;
 for(;;){
  if(stopping)break;
  ssize_t n=read(in,(char*)samples+filled,sizeof(samples)-filled);
  if(n<0&&errno==EINTR)continue;
  if(n<0){perror("read");return 7;}
  if(n==0){
   if(filled%40){fprintf(stderr,"incomplete frame: %zu bytes\n",filled);return 8;}
   if(filled){controls(ctl,&ramp,frames GRAPH_ARG);size_t count=filled/40;input_stats(samples,count);if(!process_block(&ramp,samples,mixed,count GRAPH_ARG))return 12;if(!write_all(out,mixed,count*16))return 9;frames+=count;}
#ifdef LAB_DSP_GRAPH
   if(lab_dsp_graph_reset(graph)!=1)return 12;
#endif
   filled=0;close(in);in=-1;goto reopen;
  }
  filled+=(size_t)n;
  if(filled==sizeof(samples)){
   input_stats(samples,64);controls(ctl,&ramp,frames GRAPH_ARG);if(!process_block(&ramp,samples,mixed,64 GRAPH_ARG))return 12;if(!write_all(out,mixed,sizeof mixed))return 9;frames+=64;filled=0;
  }
 }
done:
#ifdef LAB_DSP_GRAPH
 free(eq_tables);free(graph);free(prepared_beat);
#endif
 if(ctl>=0){close(ctl);unlink(argv[3]);}
 if(in>=0)close(in);
 if(close(out))return 10;
 if(input_stats_enabled)for(unsigned ch=0;ch<10;ch++)
  fprintf(stderr,"{\"input_audio_channel\":%u,\"frames\":%llu,\"peak\":%.9g,\"energy\":%.17g,\"nonfinite\":%llu}\n",ch,(unsigned long long)input_stat_frames,input_peak[ch],input_energy[ch],(unsigned long long)input_nonfinite[ch]);
 fprintf(stderr,"{\"frames\":%llu,\"status\":\"stopped\"}\n",(unsigned long long)frames);return 0;
}
