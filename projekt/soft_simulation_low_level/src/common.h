#ifndef COMMON_H
#define COMMON_H

#include <stdint.h>  // for fixed-width integer types
#include <stdio.h>


// set number of iterations here
#define WIDTH 32

// select fixed-point type based on WIDTH
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
                    "s <angle>:                          calculate sine and cosine values for angle given in degrees\r\n" \
                    "t <start_angle> <end_angle> <step>: run testbench and write results to file\r\n" \
                    "i <start_angle> <end_angle> <step>: calculate input data compatible with testbench"

void low_level_simulation(fixed_t* theta, fixed_t* sin, fixed_t* cos, int8_t debug);

void preprocess_angle(float* angle_float, int32_t* angle_int, int32_t* angle_frac, fixed_t* angle_fixed, int8_t* flips, int8_t debug);

void postprocess_quarters(fixed_t* sin_fixed, fixed_t* cos_fixed, int8_t* flips, float* sin_float, float* cos_float, int8_t debug);

void print_binary(FILE *out, int64_t value, int bits);

void print_binary_float(FILE *out, float value, int bits);

#endif
