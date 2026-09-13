#include "beat_manager_probe.c"
#undef main
extern void direct_delay_init(void*),direct_delay_time(void*),direct_delay_on(void*),direct_delay_off(void*),direct_delay_depth(void*),direct_delay_notify(void*),direct_delay_keep(void*);
static uint32_t dobj[38],dvt[16];
static EchoRamp dg,dd,dw,dc;
static void require(int yes,const char *label){if(!yes){fprintf(stderr,"FAIL %s\n",label);exit(1);}}
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
 unsigned checked=0;
 puts("[");
 for(unsigned i=0;i<24;i++){
  unsigned old=i%2?1:5,selected=i%2?5:1;
  uint32_t *from=old==5?obj:dobj,*to=selected==5?obj:dobj;
  manager[2]=(uint32_t)from;manager[3]=(uint32_t)to;manager[19]=old;manager[20]=selected;
  from[15]=1;to[15]=0;from[17]=i%10;to[17]=i%4<2?from[17]:(i+3)%10;
  from[9]=111+i;to[9]=777+i;
  float depth=.1f+(i%8)*.1f;memcpy(from+8,&depth,4);
  obj[32]=12345;dobj[31]=23456;
  unsigned expected_time=to[9];
  native_switch_type(manager);
  require(manager[2]==(uint32_t)to,"active destination");
  require(manager[3]==(uint32_t)off_object,"remembered Off holder");
  require(manager[19]==selected&&manager[34]==2,"selected type and fade-in");
  require(to[9]==expected_time,"destination manual time retained");
  require(to[8]==from[8],"depth transferred");
  require((to[15]&255)==1&&(from[15]&255)==0,"destination on/source off");
  require(obj[32]==0&&dobj[31]==0,"old and new selected callbacks reset counters");
  printf("%s{\"from\":%u,\"to\":%u,\"time_ms\":%u,\"remembered\":0,\"phase\":%u}",i?",\n":"",old,selected,to[9],manager[34]);checked++;
 }
 printf("\n]\n");fprintf(stderr,"PASS %u direct native switches\n",checked);free(ring);free(native_ring);return 0;
}
