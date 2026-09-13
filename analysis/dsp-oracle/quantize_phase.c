#include "quantize_phase.h"
#include <math.h>
static const unsigned num[12]={1,1,1,1,3,1,2,4,8,16,32,64};
static const unsigned den[12]={16,8,4,2,4,1,1,1,1,1,1,1};
int32_t phase_playing_time(const EchoPlayerFixture *p,int32_t position,int32_t frames){
 if(!p->channel_valid)return 0;
 int32_t correction=(int32_t)((float)frames*(p->tempo+1.0f));
 if(position>correction)position-=correction;
 double time=(double)position*0x1.7384ef2a605cep-6;
 return (int32_t)(time>=0?ceil(time):floor(time));
}
static int index_for(EchoPlayerFixture *p,int32_t t){
 if(!p->grid_enabled)return (int)p->count;
 int32_t relative=t-(int32_t)p->offset;if(relative<0)return 0;
 p->relative=(uint32_t)relative;unsigned lo=0,hi=p->count;
 while(lo<hi){unsigned m=lo+(hi-lo)/2;if(p->beats[m].time<(uint32_t)relative)lo=m+1;else hi=m;}
 return (int)(lo&&lo==p->count?lo-1:lo);
}
static int32_t timestamp(const EchoPlayerFixture *p,int ix){return p->grid_enabled?(int32_t)(p->offset+p->beats[ix].time):0;}
int32_t phase_nearest(QuantizePhase *s,EchoPlayerFixture *p,int32_t t,unsigned initial){
 if(!p->channel_valid||!p->beat_present)return -1;
 int ix=index_for(p,t);unsigned half=0;s->flag92=0;
 if(ix==0)s->flag92=1;
 else{
  int32_t right=timestamp(p,ix),left=timestamp(p,ix-1),mid=left+(right-left)/2;
  if(ix==(int)p->count-1&&t>=right)half=0;
  else if(t<=mid){half=t-left>mid-t;ix--;}
  else if(t-mid<=right-t){half=1;ix--;}
  else s->flag92=1;
 }
 s->q.flag95=half;if(initial)s->q.flag96=s->q.flag93=half;return ix;
}
uint32_t phase_duration(QuantizePhase *s,EchoPlayerFixture *p,int32_t t,int32_t ix){
 if(!p->channel_valid||!p->beat_present||ix+1==(int32_t)p->count)return 0;
 float bpm=(float)p->beats[ix].bpm100,speed=p->tempo+1.0f;
 unsigned effective=(unsigned)(bpm*speed);
 if(effective<4000){if(bpm==0)return 0;speed=4000.0f/bpm;}
 unsigned d=den[s->q.beat_button],n=num[s->q.beat_button];
 unsigned steps=d&1?n:n>>1;s->divisor104=d&1?d:d>>1;
 while(steps--){ix++;if(ix==(int32_t)p->count)return 0;}
 int32_t target=timestamp(p,ix);
 if(d&1){if(s->q.flag96){if(ix+1==(int32_t)p->count)return 0;target+=(timestamp(p,ix+1)-target)/2;}}
 else{if(ix+1==(int32_t)p->count)return 0;if(!s->q.flag95)target+=(timestamp(p,ix+1)-target)/2;else target=timestamp(p,ix+1);}
 if(t>=target)return 0;
 uint32_t duration=(uint32_t)(int32_t)((float)(target-t)/speed);
 uint32_t q=duration/s->divisor104;
 return q+(q%s->divisor104!=0);
}
static void update(EchoAudio *a,QuantizePhase *s,EchoPlayerFixture *p,int32_t pos,unsigned initial){
 s->aux100=0;int32_t t=phase_playing_time(p,pos,0);int32_t ix=phase_nearest(s,p,t,initial);
 unsigned duration=phase_duration(s,p,t,ix);
 if(duration){if(duration>4000)duration=4000;a->time_ms=duration;a->control.time_changed=1;}
}
void phase_check(EchoAudio *a,QuantizePhase *s,EchoPlayerFixture *p,int32_t pos){
 if(!p->channel_valid||!p->beat_present||p->reverse||p->scratch||p->spin||p->scan)return;
 int32_t t=(int32_t)p->playing_time;int ix=index_for(p,t);int32_t boundary=timestamp(p,ix);
 if(t<timestamp(p,0)||(ix+1==(int)p->count&&t>=boundary)){s->phase_index=ix;return;}
 if(s->phase_index!=ix){s->phase_index=ix;if(s->q.wait)s->q.wait--;}
 if(s->q.wait)return;
 unsigned d=den[s->q.beat_button],n=num[s->q.beat_button];
 if(s->q.flag93){int32_t left=timestamp(p,ix-1),mid=left+(boundary-left)/2;if(t<mid)return;
  if(s->q.flag94)s->q.flag94=0;else update(a,s,p,pos,0);
  if(!(d&1)){s->q.flag93=0;s->q.wait=(n>>1)+1;}else s->q.wait=n;
 }else{
  update(a,s,p,pos,s->q.flag94);
  if(!(d&1)){s->q.flag93=1;s->q.wait=n>>1;if(!s->q.flag96)s->q.flag94=0;}
  else{s->q.wait=n;s->q.flag94=0;}
 }
 if(s->flag92)s->q.wait++;
}
