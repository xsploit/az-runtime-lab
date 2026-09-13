#ifndef LAB_BEAT_DELAY_PORT_H
#define LAB_BEAT_DELAY_PORT_H
#include "../delay_quantize.h"
/* Caller owns state, player snapshot and ring; no global context or allocation.
 * Native reconstruction is verified at 44.1 kHz. Inputs must obey native bounds.
 */
void beat_delay_process(DelayAudio *,DelayQuantize *,DelayPlayerFixture *,Stereo *,const Stereo *,Stereo *,unsigned);
#endif
