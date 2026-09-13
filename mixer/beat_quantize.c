#include "beat_echo.h"
int echo_quantize_check(EchoQuantize *q,const EchoPlayerFixture *p){
 q->flag97=p->mixer_quantize;
 if(p->channel_valid&&p->beat_present&&p->mixer_quantize)return 1;
 q->flag96=q->flag93=q->wait=0;q->flag94=1;return 0;
}
const EchoBeat *echo_player_beats(const EchoPlayerFixture *p){return p->external_beats?p->external_beats:p->beats;}
unsigned echo_player_beat_index(EchoPlayerFixture *p){
 if(!p->grid_enabled)return p->count;
 uint32_t rel=p->playing_time-p->offset;
 if((int32_t)rel<0)return 0;
 p->relative=rel;unsigned low=0,high=p->count;
 while(low<high){unsigned mid=low+(high-low)/2;if(echo_player_beats(p)[mid].time<rel)low=mid+1;else high=mid;}
 if(low&&low==p->count)low--;
 return low;
}
void echo_quantize_set(EchoAudio *s,EchoQuantize *q,EchoPlayerFixture *p){
 if(!p->channel_valid||!p->beat_present)return;
 unsigned ix=echo_player_beat_index(p);
 float scaled=(float)echo_player_beats(p)[ix].bpm100*(p->tempo+1.0f);
 uint32_t bpm=scaled>0?(uint32_t)scaled:0;
 if(bpm<4000)return;
 static const uint32_t num[12]={1,1,1,1,3,1,2,4,8,16,32,64};
 static const uint32_t den[12]={16,8,4,2,4,1,1,1,1,1,1,1};
 uint32_t time=(6000000u*num[q->beat_button]/den[q->beat_button])/bpm;
 if(time<1)time=1;
 if(time>4000)time=4000;
 s->time_ms=time;s->control.time_changed=1;
}
void echo_quantize_time(EchoAudio *s,EchoQuantize *q,EchoPlayerFixture *p){
 if(!p->channel_valid||!p->beat_present||p->reverse||p->scratch||p->spin||p->scan)return;
 unsigned ix=echo_player_beat_index(p);
 if((int32_t)ix!=q->last_index){echo_quantize_set(s,q,p);q->last_index=(int32_t)ix;}
}
/* Actual Echo status path: eligibility does not defer this switch. */
void echo_effect_set_on(EchoAudio *s,EchoQuantize *q,const EchoPlayerFixture *p,unsigned on){
 if(s->on==on)return;
 if(s->on){echo_control(&s->control,ECHO_OFF);s->on=0;}
 else{echo_control(&s->control,ECHO_ON);s->on=1;q->flag96=q->flag93=q->wait=0;q->flag94=1;q->flag97=p->mixer_quantize;}
}
