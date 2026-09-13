#ifndef LAB_BEAT_PAIR_H
#define LAB_BEAT_PAIR_H
#include "../beat_manager_echo.h"
#include "beat_echo.h"
#include "beat_delay.h"
/* Research candidate. IDs 0/1/5 only; caller owns all storage and snapshots.
 * Not enabled in the live graph. Processing supports at most 64 frames. */
typedef struct {
 BeatManagerEcho manager;
 EchoAudio *echo;EchoQuantize *echo_q;EchoPlayerFixture *echo_player;Stereo *echo_ring;
 DelayAudio *delay;DelayQuantize *delay_q;DelayPlayerFixture *delay_player;Stereo *delay_ring;
} BeatPair;
void beat_pair_switch(BeatPair *);
void beat_pair_set_beat(BeatPair *,unsigned);
void beat_pair_process(BeatPair *,Stereo *,unsigned,unsigned);
#endif
