#ifndef RX3_LAB_IIR_RECONSTRUCTED_H
#define RX3_LAB_IIR_RECONSTRUCTED_H
#include <stddef.h>
typedef struct { float l, r; } Stereo;
/* coefficient order b0,b1,b2,a1,a2; history order older,newer.
 * Inputs and outputs must not alias. Caller validates finite coefficients.
 * An independently written recurrence derived from the inspected instruction
 * data flow; this is not the CFX Filter wrapper or its coefficient generator. */
void iir_reconstructed(const Stereo *, Stereo *, const Stereo *, Stereo *, Stereo *, size_t);
#endif
