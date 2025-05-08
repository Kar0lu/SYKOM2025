#include <stdint.h>
#include "./common.h"
#include <stdio.h>
#include <math.h>

void print_binary(int64_t value, int bits) {
    for (int i = bits - 1; i >= 0; i--) {
        printf("%u", (value >> i) & 1);
    }
}

void preprocess_angle(float* angle_float, fixed_t* angle_fixed, int8_t* flips) {
    printf("=== ANGLE PREPROCESSING ===\n");
    union {
        float f;
        uint32_t u;
    } un;

    un.f = *angle_float;

    int8_t sign = (un.u >> 31) & 0x1;
    uint8_t exponent_raw = (un.u >> 23) & 0xFF;
    uint32_t mantissa_bits = un.u & 0x7FFFFF;

    if (exponent_raw == 0 || exponent_raw == 255) {
        *angle_fixed = 0;
        *flips = 0;
        return;
    }

    uint32_t mantissa = mantissa_bits | (1 << 23);  // 24-bit normalized mantissa
    int32_t exp = ((int32_t)exponent_raw) - 127;


    printf("sign:\t\t\t"); print_binary(sign, 1); printf("\n");
    printf("exp:\t\t\t%d\n", exp);
    printf("mantissa:\t\t"); print_binary(mantissa, 24); printf("\n\n");

    int32_t angle_int, angle_frac;
    if (exp >= 23) {
        // All bits of mantissa become integer part
        angle_int = mantissa << (exp - 23);
        angle_frac = 0;
    } else if (exp >= 0) {
        // Integer is upper bits, fraction is lower bits
        uint32_t int_mask = mantissa >> (23 - exp);
        uint32_t frac_mask = mantissa & ((1U << (23 - exp)) - 1);

        angle_int = int_mask;

        // Align fraction to Q1.31
        angle_frac = (int32_t)(frac_mask << (8 + exp)); // (8 + exp) = 31 - (23 - exp)
    } else {
        // Integer is 0, all bits are fractional
        angle_int = 0;

        int32_t full = (1U << 23) | mantissa;
        int shift = exp + 8;

        if (shift >= 0) {
            angle_frac = (int32_t)(full << shift);
        } else if (shift >= -31) {
            angle_frac = (int32_t)(full >> -shift);
        } else {
            angle_frac = 0; // too small to represent
        }
    }
    char is_int = angle_frac == 0x00000000 ? 1 : 0;

    if(sign) {
        angle_frac = -angle_frac;
        angle_int = -angle_int;
    }

    float angle_frac_float = (float)angle_frac / (1LL << 31);

    printf("angle_float:\t\t%f\n", *angle_float);
    printf("angle_int:\t\t%d\t", angle_int); print_binary(angle_int, 32); printf("\n\n");
    printf("angle_frac_float:\t%f\n", angle_frac_float);
    printf("angle_frac_q31:\t\t0x%08X\t", angle_frac); print_binary(angle_frac, 32); printf("\n\n");

    
    // Make theta [-180;180]
    *flips = 0;
    while (angle_int < -180 || (angle_int == -180 && angle_frac < 0)) angle_int += 360;
    while (angle_int > 180 || (angle_int == 180 && angle_frac > 0)) angle_int -= 360;

    // Make theta [-45;45]
    while (angle_int > 45 || (angle_int == 45 && angle_frac > 0)) {
        angle_int -= 90;
        *flips -= 1;
    }

    while (angle_int < -45 || (angle_int == -45 && angle_frac < 0)) {
        angle_int += 90;
        *flips += 1;
    }

    // Convert angle in degrees to fixed-point representation (scaling factor 2^32)
    int64_t angle_combined = ((int64_t)angle_int << 32) + ((int64_t)angle_frac << 1); // No shift here, combine the integer and fractional parts directly.
    printf("angle_combined:\t\t"); print_binary(angle_combined, 64); printf("\n");

    // Scaling factor for fixed-point conversion (1 << 32) 
    int64_t scale = (1ULL << 32) / 180; // scale factor for conversion
    *angle_fixed = (angle_combined * scale) >> 32; // convert to fixed-point
    printf("angle_fixed:\t\t"); print_binary(*angle_fixed, 32); printf("\n");

    // Convert back to floating-point for validation
    float angle_fixed_float = (float)(*angle_fixed) * (180.0 / (1ULL << 32));
    printf("angle_fixed_float:\t%f\n", angle_fixed_float);
    return;
}
