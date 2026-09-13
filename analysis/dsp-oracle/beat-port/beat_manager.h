#ifndef LAB_BEAT_MANAGER_PORT_H
#define LAB_BEAT_MANAGER_PORT_H
#include "../beat_manager_echo.h"
#include "beat_echo.h"
/* Exactly once per mixer block, before any channel/master insertion offers. */
void beat_manager_begin_round(BeatManagerEcho *);
#endif
