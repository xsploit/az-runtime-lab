#ifndef CFX_FILTER_LAB_H
#define CFX_FILTER_LAB_H
#include <stdint.h>
#include "iir_reconstructed.h"
typedef struct {
 float color, parameter;
 float gain_target, gain, blend, dry_target, dry, dry_step, lpf, hpf;
 uint8_t low_side, dirty;
 int32_t step, target;
 float coefficients[2][5];
} CfxFilter;
/* Finite normalized controls are a harness precondition. The recovered
 * parameter callback itself does not establish public validation rules. */
void cfx_filter_color(CfxFilter *,float);
void cfx_filter_parameter(CfxFilter *,float);
void cfx_filter_calc(CfxFilter *);
void cfx_filter_initialize(CfxFilter *);
typedef struct { Stereo x[2][2], y[2][2]; } CfxHistory;
/* Scratch buffers each hold n stereo frames; input/output/scratch disjoint.
 * Reset history separately when initialize is requested. */
void cfx_filter_process(CfxFilter *,CfxHistory *,const Stereo *,Stereo *,Stereo *,Stereo *,size_t);
#endif
