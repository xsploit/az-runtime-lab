#ifndef LAB_PAIR_RUNTIME_H
#define LAB_PAIR_RUNTIME_H
#include "beat_pair.h"
#include "beat_grid.h"
/* Experimental integration boundary. Heap-allocate outside the audio thread.
 * Fixed 44.1kHz /64-frame blocks. IDs are RX3 IDs, not AZ selector identities.
 * Player grid pointers, if supplied, remain caller-owned. */
typedef struct {
 BeatManagerEcho manager;
 EchoAudio echo; EchoQuantize echo_q; EchoPlayerFixture player;
 DelayAudio delay; DelayQuantize delay_q;
 unsigned source_id,offered;
 BeatGridBinding grid;
 Stereo echo_ring[352800],delay_ring[352800];
} PairRuntime;
void pair_runtime_init(PairRuntime *);
int pair_runtime_set(PairRuntime *,unsigned type,unsigned target,unsigned beat,float depth);
int pair_runtime_source(PairRuntime *,unsigned source,unsigned bpm100,unsigned time,float tempo,unsigned loaded,unsigned quantize);
/* Offline E1/P1 adapter. NUL-terminated command, max255 bytes.
 * Returns1 accepted,-1 malformed/unsupported; rejection is atomic. */
int pair_runtime_command(PairRuntime *,const char *);
/* Between blocks; returned retired grid must be reclaimed off audio thread. */
const BeatGridSnapshot *pair_runtime_grid(PairRuntime *,const BeatGridSnapshot *,unsigned source);
void pair_runtime_begin(PairRuntime *);
/* One processing offer per round. Nonmatching targets remain untouched.
 * Returned1=processed,0=skipped,-1=invalid. Target0..3=deck,4=master. */
int pair_runtime_offer(PairRuntime *,unsigned target,Stereo block[64]);
/* Control-thread/stopped-audio only: clears both histories, keeps selection
 * and player context. This is a lab reset policy, not a recovered RX3 API. */
void pair_runtime_reset(PairRuntime *);
#endif
