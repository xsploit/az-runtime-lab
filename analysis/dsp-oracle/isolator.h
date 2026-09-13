#ifndef RX3_ISOLATOR_ORACLE_H
#define RX3_ISOLATOR_ORACLE_H
#include "eq_control.h"
#include "../../mixer/cfx_filter.h"
typedef struct {Stereo coefficients[5],x[2],y[2];} EqIir;
typedef struct {EqIir filter[8]; EqGainRamp gain[3]; Stereo scratch[5][66];} Isolator;
void isolator_setup(Isolator *,const float[4][5],unsigned);
void isolator_reset(Isolator *);
/* Isolated oracle API: 1..64 frames, distinct input/output and two input
 * padding frames. Initialization has native constructor-oracle coverage. */
void isolator_execute(Isolator *,const Stereo *,Stereo *,unsigned);
#endif
