#ifndef LAB_ECHO_QUANTIZE_H
#define LAB_ECHO_QUANTIZE_H
#include "echo_audio.h"
typedef struct {uint16_t number,bpm100;uint32_t time;} EchoBeat;
typedef struct {
 uint32_t channel_valid,beat_present,mixer_quantize,reverse,scratch,spin,scan,playing_time;
 float tempo;uint32_t grid_enabled,offset,count,relative;EchoBeat beats[17];const EchoBeat *external_beats;
} EchoPlayerFixture;
typedef struct {uint32_t wait,flag93,flag94,flag95,flag96,flag97;int32_t last_index;uint32_t beat_button;} EchoQuantize;
const EchoBeat *echo_player_beats(const EchoPlayerFixture *);
unsigned echo_player_beat_index(EchoPlayerFixture *);
int echo_quantize_check(EchoQuantize *,const EchoPlayerFixture *);
void echo_quantize_time(EchoAudio *,EchoQuantize *,EchoPlayerFixture *);
void echo_quantize_set(EchoAudio *,EchoQuantize *,EchoPlayerFixture *);
void echo_effect_set_on(EchoAudio *,EchoQuantize *,const EchoPlayerFixture *,unsigned on);
#endif
