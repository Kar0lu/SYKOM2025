#include <stdint.h>
#include "./common.h"

void postprocess_quarters(int16_t* cos_reg, int16_t* sin_reg, double* cos_res, double* sin_res, int8_t flips){
    // Correct signs according to quarter
    switch(flips){
        case 1:
            *cos_res = (double) *sin_reg / (2 << 14);
            *sin_res = -1 * (double) *cos_reg / (2 << 14);
            break;

        case -1:
            *cos_res = -1 * (double) *sin_reg / (2 << 14);
            *sin_res = (double) *cos_reg / (2 << 14);
        break;

        case 2:

        case -2:
            *cos_res = -1 * (double) *cos_reg / (2 << 14);
            *sin_res = -1 * (double) *sin_reg / (2 << 14);
            break;

        default:
            *cos_res = ( *cos_reg < 0 ) ? ( (double) -*cos_reg ) : ( (double) *cos_reg );
            *cos_res /= (2 << 14);
            *sin_res = (double) *sin_reg / (2 << 14);
    }
    return;
}