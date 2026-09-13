#ifndef RX3_DUBECHO_H
#define RX3_DUBECHO_H
#include <stdint.h>
typedef struct {uint32_t word[44];} DubEcho;
float dub_float(const DubEcho *,unsigned);
void dub_put_float(DubEcho *,unsigned,float);
void dub_color(DubEcho *);
int dub_on(DubEcho *),dub_off(DubEcho *);
void dub_feedback(DubEcho *),dub_parameter(DubEcho *),dub_calculate(DubEcho *),dub_calculate_inner(DubEcho *);
#include "cfx_filter.h"
typedef struct {Stereo coeff[5],x[2],y[2];unsigned clears;} DubFilter;
typedef struct {DubEcho state;DubFilter filter[4];Stereo buffer[6][66];Stereo ring[2][8448];unsigned write[2],length[2];} DubRuntime;
void dub_runtime_construct(DubRuntime *,const float coefficients[4][5]);
void dub_runtime_default(DubRuntime *);
void dub_runtime_init(DubRuntime *);
void dub_runtime_execute(DubRuntime *,const Stereo *,Stereo *,int);
#endif
