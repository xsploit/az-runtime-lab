#ifndef LAB_DSP_CONTROL_H
#define LAB_DSP_CONTROL_H
#include <stddef.h>
/* F1 channel(0..3) type(0=Off,1=Filter) color(0..1) parameter(0..1).
   Parsing only: caller applies the complete command at an audio block boundary.
   No DSP state changes on malformed input; other effects need future versions. */
typedef struct { unsigned channel, type; float color, parameter; } LabFilterCommand;
int lab_filter_command_parse(const char *, size_t, LabFilterCommand *);
/* EQ1 channel(0..3) mode(0=EQ,1=isolator) HIGH MID LOW, normalized0..1. */
typedef struct {unsigned channel,mode;float high,mid,low;} LabEqCommand;
int lab_eq_command_parse(const char *,size_t,LabEqCommand *);
#endif
