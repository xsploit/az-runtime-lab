#ifndef PCM_TEMPLATE_ALLOCATION_H
#define PCM_TEMPLATE_ALLOCATION_H
#include "pcm-template-store.h"
#include <stdint.h>
/* For a coordinated, verified constructor guard-store replacement only.
 * Other call sites are passed through without inspecting/writing their data.
 * No automatic hooks or firmware changes are installed by this function. */
void *pcm_template_allocate(struct pcm_store *store, size_t bytes,
                            uintptr_t caller, void *(*normal_malloc)(size_t));
#endif
