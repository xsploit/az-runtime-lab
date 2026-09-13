#ifndef CFX_MANAGER_FILTER_LAB_H
#define CFX_MANAGER_FILTER_LAB_H
#include "cfx_filter.h"
#include "cfx_crush.h"
#include "cfx_noise.h"
#include "cfx_sweep.h"
#include "cfx_dubecho.h"
#include "cfx_space.h"
#include <stdint.h>
/* RX3 CFX: Off0, Filter1, Noise2, Sweep3, DubEcho4, Space5, Crush6. */
typedef struct {float step,target,current;uint32_t count,length;float inverse;int done;} ManagerRamp;
typedef struct {
 int current,next,phase;ManagerRamp wet,dry;
 float color[7],parameter[7];
 unsigned initialized[7],processed[7],sweep_ticks,eq_reset_requests;
 /* current may be internal tail sentinel7; active is the actual processor. */
 int previous,active;
} FilterManager;
void filter_manager_init(FilterManager *,unsigned);
int filter_manager_request(FilterManager *,int);
typedef struct {
 void *context;
 void (*process)(void *,int,const Stereo *,Stereo *,size_t);
 void (*initialize)(void *,int,float,float);
 int (*on)(void *,int);
 int (*off)(void *,int);
} FilterManagerCallbacks;
void filter_manager_process(FilterManager *,Stereo *,Stereo *,size_t,const FilterManagerCallbacks *);
#endif

#ifndef CFX_COMPOSED_LAB_H
#define CFX_COMPOSED_LAB_H
#include "cfx_filter.h"

typedef struct {
 FilterManager manager;CfxFilter filter;CfxHistory history;
 Stereo low[64],high[64],scratch[64];Crush crush;Noise noise;NoiseFilter noise_filter;SweepRuntime sweep;DubRuntime dub;SpaceRuntime space;
} LabCfxManager;
void lab_cfx_manager_init(LabCfxManager *);
void lab_cfx_manager_controls(LabCfxManager *,float,float);
void lab_cfx_manager_process(LabCfxManager *,Stereo *,size_t);
#endif
