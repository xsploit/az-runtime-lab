#ifndef LAB_GRID_PHASE_H
#define LAB_GRID_PHASE_H
#include <math.h>
#include <stdint.h>
/* Match the grid's float32 integer origin and the waveform's double origin.
 * No extrapolation: pause/seek/reverse inherit the actual supplied position.
 */
static inline int lab_grid_phase(int64_t position, float zoom, float *result) {
    if (!isfinite(zoom) || zoom < 0.01f || zoom > 64.0f) return 0;
    float integer_origin = (float)position * 0.15f;
    integer_origin *= zoom;
    if (!isfinite(integer_origin) || fabsf(integer_origin) >= 2147483520.0f) return 0;
    double waveform_origin = (double)position * 150.0 / 1000.0 * (double)zoom;
    double correction = (double)truncf(integer_origin) - waveform_origin;
    if (!isfinite(correction) || fabs(correction) > 1.01) return 0;
    *result = (float)correction;
    return 1;
}
#endif
