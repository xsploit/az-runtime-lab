/* Scalar consistency probe for inferred exponent rewrite, no DSP execution. */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <fenv.h>

static uint32_t fbits(float value) {
    uint32_t bits;
    memcpy(&bits, &value, sizeof(bits));
    return bits;
}

static float from_bits(uint32_t bits) {
    float value;
    memcpy(&value, &bits, sizeof(value));
    return value;
}

int main(void) {
    if (fesetround(FE_TONEAREST)) return 2;
    const uint32_t gains[2] = {0x402e0d69u, 0x3f61ceefu};
    uint64_t mismatches = 0;
    for (int32_t sample = -8388608; sample <= 8388607; ++sample) {
        float converted = (float)sample; /* signed 24-bit integer is exactly representable */
        uint32_t bits = fbits(converted);
        uint32_t exponent = (bits >> 23) & 0xffu;
        uint32_t adjusted = sample ? ((bits & 0x807fffffu) | ((exponent - 23u) << 23)) : 0u;
        float rewrite = from_bits(adjusted);
        float multiply = converted * 0x1p-23f;
        if (fbits(rewrite) != fbits(multiply)) {
            if (mismatches < 4) printf("core mismatch sample=%d rewrite=%08x multiply=%08x\n", sample, fbits(rewrite), fbits(multiply));
            ++mismatches;
        }
        for (unsigned mode = 0; mode < 2; ++mode) {
            float a = rewrite * from_bits(gains[mode]);
            float b = multiply * from_bits(gains[mode]);
            if (fbits(a) != fbits(b)) {
                if (mismatches < 4) printf("gain mismatch sample=%d mode=%u a=%08x b=%08x\n", sample, mode + 1, fbits(a), fbits(b));
                ++mismatches;
            }
        }
    }
    printf("signed24_samples=16777216 modes=2 mismatches=%llu rounding=nearest\n", (unsigned long long)mismatches);
    return mismatches ? 1 : 0;
}
