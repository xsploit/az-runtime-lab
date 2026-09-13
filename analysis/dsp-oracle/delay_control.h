#ifndef LAB_DELAY_CONTROL_H
#define LAB_DELAY_CONTROL_H
#include <stdint.h>
typedef struct {float step[2],target[2],current[2];uint32_t count,length;float inverse;uint8_t done,pad[3];} DelayRamp;
typedef struct {uint32_t rate,max_samples,counter,time_changed;float depth;DelayRamp gate,dry,wet;} DelayControl;
enum {DELAY_INIT,DELAY_TIME,DELAY_ON,DELAY_OFF,DELAY_DEPTH,DELAY_SELECT};
/* Native control callbacks only, not a delay processor or complete BeatFX. */
void delay_control(DelayControl *,unsigned action);
#endif
