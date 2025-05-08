#ifndef COMMON_H
#define COMMON_H

#include <stdint.h>  // For fixed-width integer types

// Set number of iterations here
#define WIDTH 32

// Select fixed-point type based on WIDTH
#if WIDTH == 16
    typedef int16_t fixed_t;
    #define SCALING_FACTOR 0x4DBA;
#elif WIDTH == 32
    typedef int32_t fixed_t;
    #define SCALING_FACTOR 0x4DBA76D4;
#elif WIDTH == 64
    typedef int64_t fixed_t;
    #define SCALING_FACTOR 0x4DBA76D421AF2D34;
#else
    #error "Unsupported WIDTH. Only 16, 32, or 64 are allowed."
#endif

#define WRONG_USAGE "Expected arguments:\r\n" \
                    "t:                      run testbench and write results to file\r\n" \
                    "s <angle>:              calculate sine and cosine values for angle given in degrees\r\n" \
                    "i <start> <end> <step>: calculate input data compatible with testbench"

void low_level_simulation(fixed_t* theta, fixed_t* sin, fixed_t* cos);

void preprocess_angle(float* angle_float, fixed_t* angle_fixed, int8_t* flips);

void postprocess_quarters(fixed_t* cos_reg, fixed_t* sin_reg, float* cos_res, float* sin_res, int8_t flips);

#endif
