.include "waveform-coefficients.inc"
.text
.global lab_waveform_coefficients
.type lab_waveform_coefficients,%function
lab_waveform_coefficients:
 lab_smooth_waveform_coefficients
 scvtf d9,w19
 b native_resume
.size lab_waveform_coefficients,.-lab_waveform_coefficients
.section .note.GNU-stack,"",%progbits
