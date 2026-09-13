#ifndef LAB_HEADPHONE_DSP_H
#define LAB_HEADPHONE_DSP_H
#include <stddef.h>
#include <stdint.h>
/* Reconstructed RX3 headphone DSP for AZ software-mixer integration.
 * Original hardware calibration is retained: output is NOT device-normalized.
 * Caller supplies private extracted 776-float lookup region at init.
 * Audio-thread owned, no allocation, I/O, or mutable global state. */
typedef struct {unsigned char state[256];float tables[776];uint32_t ready;} LabHeadphoneDsp;
int lab_headphone_init(LabHeadphoneDsp*,unsigned rate,const float *tables,size_t count);
int lab_headphone_level(LabHeadphoneDsp*,float normalized);
int lab_headphone_mix(LabHeadphoneDsp*,float normalized);
int lab_headphone_master_cue(LabHeadphoneDsp*,unsigned enabled);
/* AZ/H1 enum: 0 stereo, 1 mono split; translated to RX3 enum. */
int lab_headphone_mode(LabHeadphoneDsp*,unsigned az_mode);
/* Disjoint interleaved stereo buses; finite samples, 1..4096 frames.
 * Preserves original negative calibration multiplier. */
int lab_headphone_process(LabHeadphoneDsp*,const float *master,const float *cue,float *out,size_t frames);
#endif
