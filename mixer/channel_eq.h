/* RX3 channel EQ/isolator, reconstructed and compared with original ARM.
 * Native evidence: analysis/dsp-oracle/EQ-ISOLATOR.md. */
#ifndef LAB_CHANNEL_EQ_H
#define LAB_CHANNEL_EQ_H
#include "cfx_filter.h"
#include <stdint.h>
typedef struct { int32_t step,magnitude,timing,target,current,count; uint8_t done,pad[3]; } LabEqIndexRamp;
typedef struct { float step[2],target[2],current[2]; uint32_t count,length; float inverse; uint8_t done,pad[3]; } LabEqGainRamp;
typedef struct {Stereo coefficients[5],x[2],y[2];} LabEqIir;
typedef struct {LabEqIir filter[8]; LabEqGainRamp gain[3]; Stereo scratch[5][66];} LabIsolator;
typedef struct{LabEqIir filter[3];LabEqIndexRamp index[3];int16_t cached[3],pad;Stereo scratch[2][66];} LabEqualizer;
typedef struct{LabEqualizer eq;LabIsolator iso;LabEqGainRamp mode_gain;int requested,active;unsigned pending,resets[2];float volume[3];} LabChannelEq;
typedef struct {
 float coefficients[3][256][5];
 float isolator_gain[256];
 float isolator_coefficients[4][5];
} LabEqTables;
/* Private immutable fixture, all values finite; caller verifies provenance.
 * Native band order is HIGH, MID, LOW. No allocation or I/O in this module. */
int lab_eq_tables_valid(const LabEqTables *);
void lab_channel_eq_init(LabChannelEq *,const LabEqTables *);
/* Complete snapshot validated before mutation. Return 1 accepted, -1 invalid.
 * Both active/inactive processors receive controls; native mode retargeting
 * stays available throughout a transition. */
int lab_channel_eq_set(LabChannelEq *,const LabEqTables *,unsigned mode,float high,float mid,float low);
/* Internal audio boundary: valid initialized state/tables, 64 finite frames,
 * input/output disjoint, input has two padding frames. */
void lab_channel_eq_process(LabChannelEq *,const LabEqTables *,const Stereo *,Stereo *);
/* Consume CFX reset event at its exact insertion point. */
void lab_channel_eq_reset_selected(LabChannelEq *);
#endif
