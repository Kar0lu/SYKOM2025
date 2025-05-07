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
    int32_t exponent, mantissa;

    if (exponent_raw == 0) {
        exponent = -126; // subnormal
        mantissa = (un.u & 0x7FFFFF); // no implicit 1
    } else {
        exponent = exponent_raw - 127;
        mantissa = (un.u & 0x7FFFFF) | 0x800000;
    }

    printf("sign:\t\t\t"); print_binary(sign, 1); printf("\n");
    printf("exponent:\t\t%d\n", exponent);
    printf("mantissa:\t\t"); print_binary(mantissa, 24); printf("\n\n");

    int32_t angle_int, angle_frac;
    if (exponent >= 0) {
        angle_int = mantissa >> (23 - exponent);
        angle_frac = (mantissa << (exponent + 8)) & 0xFFFFFFFF;
    } else {
        angle_int = 0;
        angle_frac = (mantissa >> (-(exponent + 1))) << 8;
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
    int64_t angle_combined = ((int64_t)angle_int << 32) + (int64_t)angle_frac; // No shift here, combine the integer and fractional parts directly.
    printf("angle_combined:\t\t"); print_binary(angle_combined, 64); printf("\n");

    // Scaling factor for fixed-point conversion (1 << 32) 
    int64_t temp1 = (1ULL << 32) / 180; // scale factor for conversion
    *angle_fixed = (angle_combined * temp1) >> 32; // convert to fixed-point
    printf("angle_fixed:\t\t"); print_binary(*angle_fixed, 64); printf("\n");

    // Convert back to floating-point for validation
    float angle_fixed_float = (float)(*angle_fixed) * (180.0 / (1ULL << 32));
    printf("angle_fixed_float (before division): %f\n", angle_fixed_float); // Debugging line

    printf("angle_fixed:\t\t"); print_binary(*angle_fixed, 32); printf("\n");
    printf("angle_fixed_float:\t%f\n", angle_fixed_float);
    return;
}
