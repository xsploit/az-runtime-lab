#ifndef LAB_CFX_CRUSH_H
#define LAB_CFX_CRUSH_H
#include "cfx_filter.h"
#include <stdint.h>
typedef struct {uint32_t vtable,rate,rate2;float inverse;uint32_t block,unused,position;float color,parameter;uint32_t dirty,mode,flip;int color_step,param_step;float hold,phase;int count;uint32_t padding;Stereo held;float coef[8];Stereo history[4];float feedback,blend;} Crush;
void crush_color(Crush *);void crush_parameter(Crush *);void crush_coeff(Crush *,int);void crush_init(Crush *);void crush_execute(Crush *,const Stereo *,Stereo *,unsigned);
#endif
