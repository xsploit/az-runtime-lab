#ifndef RX3_EQUALIZER_ORACLE_H
#define RX3_EQUALIZER_ORACLE_H
#include "isolator.h"
typedef struct{EqIir filter[3];EqIndexRamp index[3];int16_t cached[3],pad;Stereo scratch[2][66];} Equalizer;
void equalizer_setup(Equalizer *);
void equalizer_reset(Equalizer *);
/* Isolated oracle API: 1..64 frames, distinct input/output and two input
 * padding frames. Private tables must contain all 3*256*5 coefficients. */
void equalizer_execute(Equalizer *,const float[3][256][5],const Stereo*,Stereo*,unsigned);
#endif
