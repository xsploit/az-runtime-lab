/* Replay the exact channel/CFX native composition using the landed module. */
#include "../../mixer/channel_eq.c"
typedef LabEqIir EqIir;
typedef LabEqGainRamp EqGainRamp;
typedef LabChannelEq EqChannel;
#define RX3_EQ_CHANNEL_ORACLE_H
#include "eq_cfx_channel_compare.c"
