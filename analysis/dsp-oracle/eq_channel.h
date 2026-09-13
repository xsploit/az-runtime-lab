#ifndef RX3_EQ_CHANNEL_ORACLE_H
#define RX3_EQ_CHANNEL_ORACLE_H
#include "equalizer.h"
typedef struct{Equalizer eq;Isolator iso;EqGainRamp mode_gain;int requested,active;unsigned pending,resets[2];float volume[3];} EqChannel;
void eq_channel_setup(EqChannel*,const float[4][5],unsigned,unsigned);
void eq_channel_volume(EqChannel*,unsigned,float,const float[256]);
void eq_channel_mode(EqChannel*,int);
void eq_channel_execute(EqChannel*,const float[3][256][5],const Stereo*,Stereo*,unsigned);
#endif
