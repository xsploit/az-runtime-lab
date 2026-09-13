#include "beat_grid.h"
#include <stdlib.h>
#include <string.h>
struct BeatGridSnapshot {unsigned count;EchoBeat beats[];};
BeatGridSnapshot *beat_grid_prepare(const EchoBeat *beats,unsigned n){
 if(n>BEAT_GRID_MAX_BEATS||(n&&!beats))return NULL;
 for(unsigned i=1;i<n;i++)if(beats[i].time<beats[i-1].time)return NULL;
 BeatGridSnapshot *s=calloc(1,sizeof *s+((size_t)n+1)*sizeof(EchoBeat));if(!s)return NULL;
 s->count=n;if(n){memcpy(s->beats,beats,n*sizeof *beats);s->beats[n]=beats[n-1];}return s;
}
void beat_grid_destroy(const BeatGridSnapshot *s){free((void*)s);}
unsigned beat_grid_count(const BeatGridSnapshot *s){return s?s->count:0;}
const BeatGridSnapshot *beat_grid_bind(BeatGridBinding *b,const BeatGridSnapshot *next,unsigned source,EchoPlayerFixture *p,EchoQuantize *q){
 const BeatGridSnapshot *old=b->grid;
 if(old!=next||source!=b->source_id){q->last_index=-1;q->wait=q->flag93=q->flag96=0;q->flag94=1;}
 b->grid=next;b->source_id=source;
 p->external_beats=next?next->beats:NULL;p->count=next?next->count:0;p->beat_present=p->count!=0;
 p->relative=0;
 return old!=next?old:NULL;
}
