#ifndef RX3_SWEEP_H
#define RX3_SWEEP_H
#include <stdint.h>
#include "cfx_filter.h"
/* Original 32-bit object state; pointer slots reserved, never dereferenced by port. */
typedef struct {uint32_t word[67];} Sweep;
float sweep_float(const Sweep *,unsigned byte_offset);
void sweep_put_float(Sweep *,unsigned byte_offset,float value);
void sweep_gate_parameters(Sweep *,float step);
void sweep_prepare_gain(Sweep *,float difference,unsigned side,int frames);
void sweep_gate_process(Sweep *,Stereo bands[2][64],const float levels[2][64],int frames);
/* Four variable sweep stages; immutable endpoint coefficients supplied privately. */
typedef struct {float coeff[4][5], endpoint[2][5];unsigned updates[4];} SweepCoefficients;
void sweep_parameters(Sweep *,SweepCoefficients *,float step);

void sweep_detect_envelopes(Sweep *,const Stereo bands[][64],float levels[][64],float memory[][60],int frames);
typedef struct {Stereo coeff[5],x[2],y[2];unsigned updates,clears;} SweepFilter;
typedef struct {Sweep state;SweepCoefficients coefficients;SweepFilter filter[9];Stereo bands[2][64],temporary[2][64],output[64];float levels[2][64],memory[2][60];} SweepRuntime;
void sweep_runtime_init(SweepRuntime *);
void sweep_runtime_detect(SweepRuntime *,const Stereo *,int);
void sweep_runtime_execute(SweepRuntime *,const Stereo *,Stereo *,int);
void sweep_filter_set(SweepFilter *,const float *);
void sweep_runtime_construct(SweepRuntime *);
#endif
