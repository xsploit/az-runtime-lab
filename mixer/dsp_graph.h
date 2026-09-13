#ifndef LAB_DSP_GRAPH_H
#define LAB_DSP_GRAPH_H
#include "deck_mix.h"
#include "cfx_manager.h"
#include <stdint.h>
#include "beat_fx.h"
#include "channel_eq.h"
#ifdef LAB_HEADPHONE_DSP
#include "headphone_dsp.h"
#endif
typedef struct {unsigned type;float color,parameter;} LabCfxControl;
typedef struct {unsigned mode;float high,mid,low;} LabEqControl;
typedef struct LabDspGraph {
 uint32_t initialized;
 unsigned sample_rate;
 LabMix mix_target;
 LabMixRamp mix;
 LabCfxControl controls[4];
 LabCfxManager channel[4];
 Stereo channel_input[4][64];
 float processed[640];
#ifdef LAB_HEADPHONE_DSP
 LabHeadphoneDsp *headphones;
 float headphone_output_scale; /* explicit host/device calibration */
#endif
 LabBeatFx *beat; /* caller owns allocation and lifetime */
 float route_current[15],route_target[15],route_step[15];size_t route_remaining;
 Stereo master_bus[64],cue_bus[64];
 const LabEqTables *eq_tables; /* borrowed immutable startup fixture */
 LabChannelEq equalizer[4];
 LabEqControl eq_controls[4];unsigned eq_control_valid[4];
 Stereo eq_input[66];
} LabDspGraph;
/* Returns 1 on success, -1 invalid; failed calls leave state/output unchanged.
 * Graph is caller-owned and audio-thread-only. No internal allocation or I/O.
 * Source/destination must be disjoint. Only 44100 Hz and 64-frame blocks.
 * EQ is opt-in; trim not implemented. Cue uses lab pre-fader routing policy. */
int lab_dsp_graph_init(LabDspGraph *,unsigned sample_rate,const LabMix *);
int lab_dsp_graph_set_mix(LabDspGraph *,const LabMix *,size_t ramp_frames);
/* Atomic snapshot: 1 accepted, 0 transition busy, -1 invalid.
 * Busy/invalid changes no controls, target, parameter or DSP state.
 * This atomic host policy differs from separate native parameter setters. */
int lab_dsp_graph_set_cfx(LabDspGraph *,unsigned channel,unsigned type,float color,float parameter);
int lab_dsp_graph_attach_beat(LabDspGraph *,LabBeatFx *);
/* Startup-only, one attachment. Fixture must remain immutable and alive until
 * graph destruction; it must not reside within graph storage. */
int lab_dsp_graph_attach_eq(LabDspGraph *,const LabEqTables *);
/* Atomic validation; native retargeting stays available throughout transitions.
 * Mode 0 EQ / 1 isolator; band order HIGH, MID, LOW. Requires attachment. */
int lab_dsp_graph_set_eq(LabDspGraph *,unsigned channel,unsigned mode,float high,float mid,float low);
#ifdef LAB_HEADPHONE_DSP
/* Caller initializes/owns headphone instance. scale is explicit hardware-output
 * normalization, not a recovered RX3 constant. Attach only at stream startup. */
int lab_dsp_graph_attach_headphones(LabDspGraph *,LabHeadphoneDsp *,float scale);
#endif
int lab_dsp_graph_process(LabDspGraph *,const float *input10,float *output4,size_t frames);
/* Clears all effect/history/ramp state; keeps last accepted mix/CFX controls.
 * Routing snaps to mix target; enabled filters re-enter via Off->Filter fade. */
int lab_dsp_graph_reset(LabDspGraph *);
#endif
