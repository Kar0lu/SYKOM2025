#include <stdint.h>
#include "./common.h"
#include <stdio.h>



void postprocess_quarters(fixed_t* sin_fixed, fixed_t* cos_fixed, int8_t* flips, float* sin_float, float* cos_float, int8_t debug){
    if (debug) printf("\n=== ANGLE POSTPROCESSING ===\n");
    if (debug) { printf("sin_fixed:\t\t%d\t", *sin_fixed); print_binary(stdout, *sin_fixed, 32); printf("\n"); }
    if (debug) { printf("cos_fixed:\t\t%d\t", *cos_fixed); print_binary(stdout, *cos_fixed, 32); printf("\n"); }

    if (debug) { printf("sin_fixed_float:\t%12.10f\t", (float)(*sin_fixed) / (1LL << 31)); print_binary_float(stdout, (float)*sin_fixed / (1LL << 31), 32); printf("\n"); }
    if (debug) { printf("cos_fixed_float:\t%12.10f\t", (float)(*cos_fixed) / (1LL << 31)); print_binary_float(stdout, (float)*cos_fixed / (1LL << 31), 32); printf("\n"); }
    
    
    // correct signs according to quarter
    switch(*flips){
        case 1:
            // edge case for 90
            *cos_float = -1 * (float) *sin_fixed / (1 << WIDTH-1);
            *sin_float =(*cos_fixed != (fixed_t) 0x80000000) ? (float) *cos_fixed / (1 << WIDTH-1) : -1 * (float) *cos_fixed / (1 << WIDTH-1);
            break;

        case -1:
            // edge case for -90
            *cos_float = (float) *sin_fixed / (1 << WIDTH-1);
            *sin_float = (*cos_fixed != (fixed_t) 0x80000000) ? -1 * (float) *cos_fixed / (1 << WIDTH-1) : (float) *cos_fixed / (1 << WIDTH-1);
        break;

        case 2:
        case -2:
            // edge case for 180/-180
            *cos_float = (*cos_fixed != (fixed_t) 0x80000000) ? (float) *cos_fixed / (1 << WIDTH-1) : -1 * (float) *cos_fixed / (1 << WIDTH-1);
            *sin_float = (float) *sin_fixed / (1 << WIDTH-1);
            break;

        default:
            // edge case for 0
            *cos_float = ( *cos_fixed < 0 ) ? (float) *cos_fixed / (1 << WIDTH-1) : -1 * (float) *cos_fixed / (1 << WIDTH-1);
            *sin_float = -1 * (float) *sin_fixed / (1 << WIDTH-1);
    }
    return;
}