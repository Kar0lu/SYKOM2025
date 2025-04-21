#include <stdint.h>
#include "./common.h"

void preprocess_angle(int16_t* angle, int8_t* flips){
    // Make theta [-180;180]
    *flips = 0;
    while(*angle < -180) *angle += 360;
    while(*angle > 180) *angle -= 360;

    // Make theta [-45;45]
    while (*angle > 45){
        *angle -= 90;
        *flips -= 1;
    } 
    while (*angle < -45)
    {
        *angle += 90;
        *flips += 1;
    }

    // Convert angle in degrees to <angle_deg> * 2^16 / 180
    *angle = (*angle * (2 << 15) / 180);
    return;
}