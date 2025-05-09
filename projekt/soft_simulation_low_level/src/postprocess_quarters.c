#include <stdint.h>
#include "./common.h"
#include <stdio.h>



void postprocess_quarters(fixed_t* sin_c, fixed_t* cos_c, int8_t* flips, float* sin_float, float* cos_float, int8_t debug){
    if (debug) printf("\n=== ANGLE POSTPROCESSING ===\n");
    if (debug) { printf("sin_c:\t\t%d\t", *sin_c); print_binary(stdout, *sin_c, 32); printf("\n"); }
    if (debug) { printf("cos_c:\t\t%d\t", *cos_c); print_binary(stdout, *cos_c, 32); printf("\n"); }


    if (debug) { printf("sin_c_float:\t%12.10f\t", (float)(*sin_c) / (1LL << 31)); print_binary_float(stdout, (float)*sin_c / (1LL << 31), 32); printf("\n"); }
    if (debug) { printf("cos_c_float:\t%12.10f\t", (float)(*cos_c) / (1LL << 31)); print_binary_float(stdout, (float)*cos_c / (1LL << 31), 32); printf("\n"); }
    
    
    // Correct signs according to quarter
    switch(*flips){
        case 1:
            // Edge case for 90
            *cos_float = -1 * (float) *sin_c / (1 << WIDTH-1);
            *sin_float =(*cos_c != (fixed_t) 0x80000000) ? (float) *cos_c / (1 << WIDTH-1) : -1 * (float) *cos_c / (1 << WIDTH-1);
            break;

        case -1:
            // Edge case for -90
            *cos_float = (float) *sin_c / (1 << WIDTH-1);
            *sin_float = (*cos_c != (fixed_t) 0x80000000) ? -1 * (float) *cos_c / (1 << WIDTH-1) : (float) *cos_c / (1 << WIDTH-1);
        break;

        case 2:
        case -2:
            // Edge case for 180/-180
            *cos_float = (*cos_c != (fixed_t) 0x80000000) ? (float) *cos_c / (1 << WIDTH-1) : -1 * (float) *cos_c / (1 << WIDTH-1);
            *sin_float = (float) *sin_c / (1 << WIDTH-1);
            break;

        default:
            // Edge case for 0
            *cos_float = ( *cos_c < 0 ) ? (float) *cos_c / (1 << WIDTH-1) : -1 * (float) *cos_c / (1 << WIDTH-1);
            *sin_float = -1 * (float) *sin_c / (1 << WIDTH-1);
    }
    return;
}