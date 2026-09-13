#ifndef LAB_CFX_NOISE_H
#define LAB_CFX_NOISE_H
#include "iir_reconstructed.h"
#include <stdint.h>
typedef struct {uint32_t vtable,rate,rate2;float inverse;uint32_t block,allocated,position;float color,parameter;uint32_t filter;Stereo feedback,feedback_gain;uint32_t buffer;float mix_step,mix_target,mix,res_step,res_target,res,level,inv_block,noise_gain;int current,target;uint32_t seed[2];} Noise;
typedef struct {Stereo coeff[5],x[2],y[2];unsigned clears;} NoiseFilter;
void noise_color(Noise *);void noise_coeff(int,float *);void noise_calc(Noise *,NoiseFilter *);void noise_init(Noise *,NoiseFilter *);void noise_execute(Noise *,NoiseFilter *,const Stereo *,Stereo *,unsigned);
#endif
