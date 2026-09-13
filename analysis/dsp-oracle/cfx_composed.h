#ifdef CFX_SHARED
#include "../../mixer/cfx_manager.h"
#else
#ifndef CFX_COMPOSED_LAB_H
#define CFX_COMPOSED_LAB_H
#include "cfx_filter.h"
#include "cfx_manager_filter.h"
typedef struct {
 FilterManager manager;CfxFilter filter;CfxHistory history;
 Stereo low[64],high[64],scratch[64];
} ComposedCfx;
void composed_init(ComposedCfx *);
void composed_controls(ComposedCfx *,float,float);
void composed_process(ComposedCfx *,Stereo *,size_t);
#endif

#endif
