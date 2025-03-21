#include <stdio.h>
#include "../include/cordic_cos.h"

// Function to normalize the given angle theta into the range -45 to 45 degrees
// Also sets the quadrant (quad) and shift values based on the angle's position
void normalize_theta(float *theta, char *quad, char *shift) {
    while (*theta > 180) *theta -= 360;
    while (*theta < -180) *theta += 360;

    if (*theta > 90) {
        *theta -= 180;
        *quad = -1;
    } else if (*theta < -90) {
        *theta += 180;
        *quad = -1;
    } else {
        *quad = 1;
    }

    if (*theta < -45) {
        *theta += 90;
        *shift = -1;
    } else if (*theta > 45) {
        *theta -= 90;
        *shift = 1;
    } else {
        *shift = 0;
    }
}

// Function to simulate the CORDIC cosine calculation for a given angle theta
void cordic_cos(float theta) {
    char quad, shift;

    normalize_theta(&theta, &quad, &shift);
}