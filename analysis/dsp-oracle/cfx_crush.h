#ifndef LAB_CFX_CRUSH_COMPOSED_H
#define LAB_CFX_CRUSH_COMPOSED_H
#include "crush.h"
#include "cfx_manager_filter.h"
typedef struct {Crush crush;FilterManager manager;Stereo scratch[64];} CrushComposite;
void cfx_crush_init(CrushComposite *);
/* Native enum0 Off /6 Crush; 1 accepted,0 busy,-1 invalid. Atomic snapshot. */
int cfx_crush_set(CrushComposite *,unsigned type,float color,float parameter);
void cfx_crush_controls(CrushComposite *,float color,float parameter);
void cfx_crush_process(CrushComposite *,Stereo *,size_t frames);
#endif
