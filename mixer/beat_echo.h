#ifndef LAB_BEAT_ECHO_H
#define LAB_BEAT_ECHO_H
#include "cfx_filter.h"
#include <stdint.h>
typedef struct {float step[2],target[2],current[2];uint32_t count,length;float inverse;uint8_t done,pad[3];} EchoRamp;
typedef struct {uint32_t rate,max_samples,counter,time_changed;float depth;EchoRamp gate,dry,wet;} EchoControl;
enum {ECHO_INIT,ECHO_KEEP,ECHO_TIME,ECHO_ON,ECHO_OFF,ECHO_DEPTH};
/* Native control callbacks only, not a delay processor or complete BeatFX. */
void echo_control(EchoControl *,unsigned action);
typedef struct {EchoControl control;uint32_t time_ms,on,delay,previous_delay,write_index,ring_length;EchoRamp cross;Stereo feedback;unsigned quantize_enabled,quantize_checks,time_checks;unsigned injected_time_ms;} EchoAudio;
void echo_audio(EchoAudio *,Stereo *ring,const Stereo *input,Stereo *output,unsigned frames);
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
void beat_echo_process(EchoAudio *,EchoQuantize *,EchoPlayerFixture *,Stereo *,const Stereo *,Stereo *,unsigned);
#endif
