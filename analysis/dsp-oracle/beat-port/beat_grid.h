#ifndef LAB_BEAT_GRID_H
#define LAB_BEAT_GRID_H
#include "beat_manager.h"
#define BEAT_GRID_MAX_BEATS 262144u
/* Immutable after preparation. The last entry is a safe native end sentinel. */
typedef struct BeatGridSnapshot BeatGridSnapshot;
typedef struct {const BeatGridSnapshot *grid;unsigned source_id;} BeatGridBinding;
/* Control/worker thread only: allocation, validation and copies. Empty is valid. */
BeatGridSnapshot *beat_grid_prepare(const EchoBeat *,unsigned count);
void beat_grid_destroy(const BeatGridSnapshot *);
unsigned beat_grid_count(const BeatGridSnapshot *);
/* Audio owner only, between blocks: no allocation/free/lock. Returns retired
   snapshot (or NULL if retained). Caller reclaims later off the audio thread.
   Source selector is independent from BeatManagerEcho.target. */
const BeatGridSnapshot *beat_grid_bind(BeatGridBinding *,const BeatGridSnapshot *,unsigned source_id,EchoPlayerFixture *,EchoQuantize *);
#endif
