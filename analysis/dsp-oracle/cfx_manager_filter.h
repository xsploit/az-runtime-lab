#ifndef CFX_MANAGER_FILTER_LAB_H
#define CFX_MANAGER_FILTER_LAB_H
#include "iir_reconstructed.h"
#include <stdint.h>
/* Verified subset: Off(0), Filter(1), Crush(6). Other effects have extra paths. */
typedef struct {float step,target,current;uint32_t count,length;float inverse;int done;} ManagerRamp;
typedef struct {
 int current,next,phase;ManagerRamp wet,dry;
 float color[7],parameter[7];
 unsigned initialized[7],processed[7],sweep_ticks,eq_reset_requests;
 int previous,active;
} FilterManager;
void filter_manager_init(FilterManager *,unsigned);
int filter_manager_request(FilterManager *,int);
typedef struct {
 void *context;
 void (*process)(void *,int,const Stereo *,Stereo *,size_t);
 void (*initialize)(void *,int,float,float);
} FilterManagerCallbacks;
void filter_manager_process(FilterManager *,Stereo *,Stereo *,size_t,const FilterManagerCallbacks *);
/* Candidate lifecycle applied to deterministic fake effects for validation.
 * Off copies input, Filter multiplies by .25. NOT the actual Filter DSP. */
void filter_manager_mock_process(FilterManager *,Stereo *,Stereo *,size_t);
#endif
