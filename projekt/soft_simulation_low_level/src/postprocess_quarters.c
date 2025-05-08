#include <stdint.h>
#include "./common.h"
#include <stdio.h>

void postprocess_quarters(fixed_t* cos_reg, fixed_t* sin_reg, float* cos_res, float* sin_res, int8_t flips, int8_t debug){
    if (debug) printf("=== ANGLE POSTPROCESSING ===\n");
    
    // Correct signs according to quarter
    switch(flips){
        case 1:
            // Edge case for 90
            *cos_res = -1 * (float) *sin_reg / (1 << WIDTH-1);
            *sin_res =(*cos_reg != (fixed_t) 0x80000000) ? (float) *cos_reg / (1 << WIDTH-1) : -1 * (float) *cos_reg / (1 << WIDTH-1);
            break;

        case -1:
            // Edge case for -90
            *cos_res = (float) *sin_reg / (1 << WIDTH-1);
            *sin_res = (*cos_reg != (fixed_t) 0x80000000) ? -1 * (float) *cos_reg / (1 << WIDTH-1) : (float) *cos_reg / (1 << WIDTH-1);
        break;

        case 2:

        case -2:
            // Edge case for 180/-180
            *cos_res = (*cos_reg != (fixed_t) 0x80000000) ? (float) *cos_reg / (1 << WIDTH-1) : -1 * (float) *cos_reg / (1 << WIDTH-1);
            *sin_res = (float) *sin_reg / (1 << WIDTH-1);
            break;

        default:
            // Edge case for 0
            *cos_res = ( *cos_reg < 0 ) ? (float) *cos_reg / (1 << WIDTH-1) : -1 * (float) *cos_reg / (1 << WIDTH-1);
            *sin_res = -1 * (float) *sin_reg / (1 << WIDTH-1);
    }
    return;
}