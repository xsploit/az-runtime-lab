#include "cfx_composed.h"
#include <string.h>
void composed_init(ComposedCfx *c){
 memset(c,0,sizeof *c);filter_manager_init(&c->manager,191);
 c->filter.color=c->filter.parameter=0.5f;c->filter.blend=c->filter.dry=c->filter.dry_target=1;c->filter.low_side=1;
 cfx_filter_initialize(&c->filter);
}
void composed_controls(ComposedCfx *c,float color,float parameter){
 int active=c->manager.current;c->manager.color[active]=color;c->manager.parameter[active]=parameter;
 if(active){cfx_filter_color(&c->filter,color);cfx_filter_parameter(&c->filter,parameter);}
}
static void process(void *context,int type,const Stereo *in,Stereo *out,size_t n){
 ComposedCfx *c=context;if(!type){memcpy(out,in,n*sizeof(Stereo));return;}
 cfx_filter_process(&c->filter,&c->history,in,out,c->low,c->high,n);
}
static void initialize(void *context,int type,float color,float parameter){
 ComposedCfx *c=context;if(!type)return;
 cfx_filter_color(&c->filter,color);cfx_filter_parameter(&c->filter,parameter);
 cfx_filter_initialize(&c->filter);memset(&c->history,0,sizeof c->history);
}
void composed_process(ComposedCfx *c,Stereo *in,size_t n){
 const FilterManagerCallbacks cb={c,process,initialize};filter_manager_process(&c->manager,in,c->scratch,n,&cb);
}
