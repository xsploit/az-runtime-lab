#include "cfx_crush.h"
#include <string.h>
#include <math.h>
void cfx_crush_init(CrushComposite *c){memset(c,0,sizeof *c);c->crush.rate=c->crush.rate2=44100;c->crush.inverse=1.0f/44100;c->crush.position=1;c->crush.color=c->crush.parameter=.5f;crush_init(&c->crush);filter_manager_init(&c->manager,191);}
static void initialize(void *ctx,int type,float color,float parameter){if(!type)return;Crush *s=&((CrushComposite*)ctx)->crush;s->color=color;s->parameter=parameter;crush_init(s);}
static void process(void *ctx,int type,const Stereo *in,Stereo *out,size_t n){if(type)crush_execute(&((CrushComposite*)ctx)->crush,in,out,n);else memcpy(out,in,n*sizeof *out);}
void cfx_crush_controls(CrushComposite *c,float color,float param){int active=c->manager.current;c->manager.color[active]=color;c->manager.parameter[active]=param;if(active){c->crush.color=color;c->crush.parameter=param;crush_color(&c->crush);crush_parameter(&c->crush);}}
int cfx_crush_set(CrushComposite *c,unsigned type,float color,float param){if(!c||(type!=0&&type!=6)||!isfinite(color)||!isfinite(param)||color<0||color>1||param<0||param>1)return -1;int r=filter_manager_request(&c->manager,type!=0);if(r)cfx_crush_controls(c,color,param);return r;}
void cfx_crush_process(CrushComposite *c,Stereo *in,size_t n){FilterManagerCallbacks cb={c,process,initialize};filter_manager_process(&c->manager,in,c->scratch,n,&cb);}
