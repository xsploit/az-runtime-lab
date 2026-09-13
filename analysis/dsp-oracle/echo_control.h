#ifndef LAB_ECHO_CONTROL_H
#define LAB_ECHO_CONTROL_H
#include <stdint.h>
typedef struct {float step[2],target[2],current[2];uint32_t count,length;float inverse;uint8_t done,pad[3];} EchoRamp;
typedef struct {uint32_t rate,max_samples,counter,time_changed;float depth;EchoRamp gate,dry,wet;} EchoControl;
enum {ECHO_INIT,ECHO_KEEP,ECHO_TIME,ECHO_ON,ECHO_OFF,ECHO_DEPTH};
/* Native control callbacks only, not a delay processor or complete BeatFX. */
void echo_control(EchoControl *,unsigned action);
#endif
