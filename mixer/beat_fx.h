#ifndef LAB_BEAT_FX_H
#define LAB_BEAT_FX_H
#include "beat_manager.h"
#include "beat_grid.h"
/* Allocate outside audio callback. One shared effect owns eight seconds history. */
typedef struct {BeatManagerEcho manager;EchoAudio echo;EchoQuantize quantize;EchoPlayerFixture player;BeatGridBinding grid;unsigned source_id;Stereo ring[352800];} LabBeatFx;
void lab_beat_fx_reset(LabBeatFx *);
void lab_beat_fx_init(LabBeatFx *);
/* Supported selections only: Off0, Echo5; logical decks0..3, Master4. */
int lab_beat_fx_set(LabBeatFx *,unsigned type,unsigned target,unsigned beat,float depth);
int lab_beat_fx_source(LabBeatFx *,unsigned source,unsigned bpm100,unsigned time,float tempo,unsigned loaded,unsigned quantize);
const BeatGridSnapshot *lab_beat_fx_grid(LabBeatFx *,const BeatGridSnapshot *,unsigned source);
void lab_beat_fx_offer(LabBeatFx *,unsigned target,Stereo block[64]);
/* Host telemetry, not a native firmware ABI. Read only on the processing
 * thread between blocks, then hand off a copy; this does not synchronize threads.
 * time_ms can lead delay_samples during the native delay crossfade.
 * Scheduled values can be range-adjusted by the native manager; they are
 * not a history of the original E1 request. source_bpm100 is the manager
 * input, not necessarily a quantized track grid's effective tempo. */
typedef struct {
 unsigned scheduled_type,scheduled_target,scheduled_beat;
 unsigned active_type,target,phase,manager_beat,effect_beat,on;
 unsigned time_ms,delay_samples,previous_delay_samples,delay_change_pending;
 unsigned source_id,source_bpm100,quantize_requested,grid_present;
} LabBeatFxSnapshot;
int lab_beat_fx_snapshot(const LabBeatFx *,LabBeatFxSnapshot *);
#endif
