#include <math.h>
#define QUANTIZE_PHASE_BUILD 1
#include "delay_quantize_compare.c"
#undef main
#ifdef BEAT_MANAGER_COMPARE_BUILD
#define main beat_probe_prior_main
#endif
extern void native_manager_operate(void *,Stereo *,int,unsigned);
extern void native_switch_type(void *),native_switch_target(void *);
extern void native_off_execute(void*,const Stereo*,Stereo*,int),native_off_status(void*),native_off_beat(void*,unsigned,unsigned),native_noop(void*),native_delay_notify(void*);
extern void native_delay_beat(void*,unsigned,unsigned);
static unsigned manager_bpm=12000;
unsigned fixture_bfx_bpm(void *p){(void)p;return manager_bpm;}
static uint32_t manager[60] __attribute__((aligned(8))),off_object[21],off_vtable[19],sentinels[15][21];
static void init_off(void){memset(off_object,0,sizeof off_object);off_object[0]=(uint32_t)off_vtable;off_object[1]=off_object[2]=44100;float inv=1.0f/44100;memcpy(&off_object[3],&inv,4);off_object[9]=20;off_object[10]=64000;off_object[11]=1;off_object[12]=50;off_object[13]=100;off_object[14]=(uint32_t)-100;off_object[15]=1;off_object[16]=1;off_object[17]=5;off_object[18]=11;
 for(unsigned i=0;i<19;i++)off_vtable[i]=(uint32_t)native_noop;
 off_vtable[2]=(uint32_t)native_off_execute;off_vtable[3]=(uint32_t)native_adjust;off_vtable[6]=(uint32_t)native_off_beat;off_vtable[7]=(uint32_t)native_off_status;
}

extern void native_delay_keep(void *);
