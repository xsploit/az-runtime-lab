#include "beat_manager_probe.c"
#undef main
extern void direct_delay_init(void*),direct_delay_time(void*),direct_delay_on(void*),direct_delay_off(void*),direct_delay_depth(void*),direct_delay_notify(void*),direct_delay_keep(void*);
static uint32_t dobj[38],dvt[16];
static EchoRamp dg,dd,dw,dc;
static void require(int yes,const char *label){if(!yes){fprintf(stderr,"FAIL %s\n",label);exit(1);}}
extern void direct_delay_execute(void*,const Stereo*,Stereo*,int);
int main(void){
 EchoAudio s={0};s.control.rate=44100;s.control.max_samples=352800;s.control.depth=.8f;s.time_ms=20;s.delay=s.previous_delay=882;s.ring_length=352800;s.feedback=(Stereo){.7f,.7f};
 ramp(&s.control.gate,191,0);ramp(&s.control.dry,147,1);ramp(&s.control.wet,147,0);ramp(&s.cross,147,0);
 Stereo *ring=calloc(s.ring_length,sizeof(Stereo)),*native_ring=calloc(s.ring_length,sizeof(Stereo));if(!ring||!native_ring)return 2;
 cp=(EchoPlayerFixture){0};cp.channel_valid=cp.beat_present=cp.grid_enabled=1;cp.count=16;for(unsigned i=0;i<=16;i++)cp.beats[i]=(EchoBeat){1,12000,i*500};cq=(EchoQuantize){0,0,1,0,0,0,-1,5};
 Stereo scratch[64];
 set_native(&s,native_ring);set_player();set_quantize();obj[2]=44100;float inv=1.0f/44100;memcpy(&obj[3],&inv,4);obj[4]=64;obj[12]=50;obj[13]=100;obj[14]=(uint32_t)-100;obj[16]=2;obj[18]=9;obj[19]=0;obj[20]=1;
 vtable[2]=(uint32_t)echo_execute;vtable[4]=(uint32_t)echo_init;vtable[6]=(uint32_t)native_echo_beat;vtable[7]=(uint32_t)native_status;vtable[8]=(uint32_t)echo_off;vtable[9]=(uint32_t)echo_on;vtable[10]=(uint32_t)native_echo_notify;vtable[11]=(uint32_t)echo_keep;
 init_off();memset(manager,0,sizeof manager);manager[2]=(uint32_t)off_object;manager[3]=(uint32_t)obj;manager[4]=(uint32_t)off_object;
 for(unsigned i=5;i<=18;i++)manager[i]=(uint32_t)sentinels[i-5];
 manager[9]=(uint32_t)obj;manager[22]=(uint32_t)scratch;
 EchoRamp f,d,l;ramp(&f,191,1);ramp(&d,191,0);ramp(&l,66112,0);memcpy(manager+24,&f,40);memcpy(manager+36,&d,40);memcpy(manager+46,&l,40);manager[56]=manager[57]=5;float depth=.8f;memcpy(manager+58,&depth,4);


 memset(dobj,0,sizeof dobj);memcpy(dvt,vtable,sizeof dvt);
 dvt[4]=(uint32_t)direct_delay_init;dvt[8]=(uint32_t)direct_delay_off;dvt[9]=(uint32_t)direct_delay_on;dvt[10]=(uint32_t)direct_delay_notify;dvt[11]=(uint32_t)direct_delay_keep;dvt[14]=(uint32_t)direct_delay_depth;dvt[15]=(uint32_t)direct_delay_time;
 dobj[0]=(uint32_t)dvt;dobj[1]=dobj[2]=44100;dobj[9]=777;dobj[10]=4000;dobj[11]=1;dobj[17]=5;dobj[18]=9;dobj[28]=dobj[32]=1;dobj[30]=352800;
 ramp(&dg,191,0);ramp(&dd,147,1);ramp(&dw,147,0);ramp(&dc,147,0);
 dobj[33]=(uint32_t)&dc;dobj[35]=(uint32_t)&dg;dobj[36]=(uint32_t)&dd;dobj[37]=(uint32_t)&dw;
 manager[5]=(uint32_t)dobj;

 Stereo *dring=calloc(352800,sizeof(Stereo));if(!dring)return 2;
 dobj[6]=(uint32_t)dring;dobj[7]=352800;dobj[9]=20;dobj[4]=64;memcpy(dobj+3,&inv,4);
 dvt[2]=(uint32_t)direct_delay_execute;
 unsigned transitions=0,prior=0,echo_blocks=0,delay_blocks=0,tail_blocks=0,delay_wet_blocks=0,echo_wet_blocks=0;double energy=0;
 unsigned schedule[]={1,5,1,0,5,0,1,5};
 puts("[");
 for(unsigned block=0;block<4800;block++){
  manager[20]=schedule[block/600];
  if(block==2700)manager[1]=1;
  if(block==3300)manager[1]=2;
  cp.playing_time=(block*2)%7900;cp.mixer_quantize=block>=1200;
  cp.tempo=block>=2400?.05f:0;set_player();
  ((unsigned char*)manager)[236]=block>=1200;
  ((unsigned char*)manager)[239]=0;
  Stereo audio[64];for(unsigned i=0;i<64;i++)audio[i]=(Stereo){.1f*sinf((block*64+i)*.07f),.1f*cosf((block*64+i)*.11f)};
  native_manager_operate(manager,audio,64,block>=4200&&block<4220);
  require(manager[2]==(uint32_t)obj||manager[2]==(uint32_t)dobj||manager[2]==(uint32_t)off_object,"known active object");
  require(obj[30]<352800&&dobj[29]<352800,"ring write indices");
  for(unsigned i=0;i<64;i++){require(isfinite(audio[i].l)&&isfinite(audio[i].r),"finite audio");energy+=(double)audio[i].l*audio[i].l+(double)audio[i].r*audio[i].r;}
  if(manager[2]==(uint32_t)obj){echo_blocks++;if(obj[32]/2>obj[29]&&wet.current[0]>0)echo_wet_blocks++;}
  if(manager[2]==(uint32_t)dobj){delay_blocks++;if(dobj[31]>dobj[28]&&dw.current[0]>0)delay_wet_blocks++;}
  if(manager[34]==3){require(manager[2]==(uint32_t)obj,"only Echo retains tail");tail_blocks++;}
  if(manager[19]!=prior){
   printf("%s{\"block\":%u,\"from\":%u,\"to\":%u,\"phase\":%u,\"echo_time\":%u,\"delay_time\":%u}",transitions?",\n":"",block,prior,manager[19],manager[34],obj[9],dobj[9]);prior=manager[19];transitions++;
  }
 }
 require(transitions>=6&&echo_blocks&&delay_blocks&&tail_blocks&&delay_wet_blocks&&echo_wet_blocks&&energy>0,"transition and audio coverage");
 printf("\n]\n");fprintf(stderr,"PASS blocks=4800 frames=307200 transitions=%u echo_blocks=%u delay_blocks=%u tail_blocks=%u delay_wet_blocks=%u echo_wet_blocks=%u energy=%.9g\n",transitions,echo_blocks,delay_blocks,tail_blocks,delay_wet_blocks,echo_wet_blocks,energy);
 free(dring);free(ring);free(native_ring);return 0;
}
