#ifndef RX3_SPACE_H
#define RX3_SPACE_H
#include "cfx_filter.h"
#include <stdint.h>
typedef struct {uint32_t word[44];} Space;
typedef struct {float coeff[5],x[2],y[2];unsigned updates,clears;} SpaceFilter;
typedef struct {Space state;SpaceFilter filter[2];float coefficients[4][5];float scratch[8][64];float ring[6][32768];} SpaceRuntime;
float space_float(const Space*,unsigned);void space_put_float(Space*,unsigned,float);
void space_default(SpaceRuntime*);
void space_construct(SpaceRuntime*,const float[4][5]);void space_init(SpaceRuntime*);
int space_on(Space*),space_off(Space*);
void space_execute(SpaceRuntime*,const Stereo*,Stereo*,int);
#endif
