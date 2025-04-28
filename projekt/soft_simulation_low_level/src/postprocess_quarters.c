#include <stdint.h>
#include "./common.h"

void postprocess_quarters(int16_t* cos_reg, int16_t* sin_reg, double* cos_res, double* sin_res, int8_t flips){
    // Correct signs according to quarter
    switch(flips){
        case 1:
            // Edge case for 90
            *cos_res = (double) *sin_reg / (1 << 15);
            *sin_res =(*cos_reg != (int16_t) 0x8000) ? -1 * (double) *cos_reg / (1 << 15) : (double) *cos_reg / (1 << 15);
            break;

        case -1:
            // Edge case for -90
            *cos_res = -1 * (double) *sin_reg / (1 << 15);
            *sin_res = (*cos_reg != (int16_t) 0x8000) ? (double) *cos_reg / (1 << 15) : -1 * (double) *cos_reg / (1 << 15);
        break;

        case 2:

        case -2:
            // Edge case for 180/-180
            *cos_res = (*cos_reg != (int16_t) 0x8000) ? -1 * (double) *cos_reg / (1 << 15) : (double) *cos_reg / (1 << 15);
            *sin_res = -1 * (double) *sin_reg / (1 << 15);
            break;

        default:
            // Edge case for 0
            *cos_res = ( *cos_reg < 0 ) ? ( (double) -*cos_reg / (1 << 15)) : ( (double) *cos_reg / (1 << 15));
            *sin_res = (double) *sin_reg / (1 << 15);
    }
    return;
}