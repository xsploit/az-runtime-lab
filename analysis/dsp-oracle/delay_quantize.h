#ifndef LAB_DELAY_QUANTIZE_H
#define LAB_DELAY_QUANTIZE_H
#include "delay_audio.h"
typedef struct {uint16_t number,bpm100;uint32_t time;} DelayBeat;
typedef struct {
 uint32_t channel_valid,beat_present,mixer_quantize,reverse,scratch,spin,scan,playing_time;
 float tempo;uint32_t grid_enabled,offset,count,relative;DelayBeat beats[17];const DelayBeat *external_beats;
} DelayPlayerFixture;
typedef struct {uint32_t wait,flag93,flag94,flag95,flag96,flag97;int32_t last_index;uint32_t beat_button;} DelayQuantize;
const DelayBeat *delay_player_beats(const DelayPlayerFixture *);
unsigned delay_player_beat_index(DelayPlayerFixture *);
int delay_quantize_check(DelayQuantize *,const DelayPlayerFixture *);
void delay_quantize_time(DelayAudio *,DelayQuantize *,DelayPlayerFixture *);
void delay_quantize_set(DelayAudio *,DelayQuantize *,DelayPlayerFixture *);
void delay_effect_set_on(DelayAudio *,DelayQuantize *,const DelayPlayerFixture *,unsigned on);
#endif
