#include <stdio.h>
#include <math.h>
#include "../include/functions.h"

// Function to normalize the given angle theta into the range -45 to 45 degrees
// Also sets the quadrant (quad) and shift values based on the angle's position
fixed_t normalize_theta(double t, char *quad, char *shift) {
    while (t > 180) t -= 360;
    while (t < -180) t += 360;

    if (t > 90) {
        t -= 180;
        *quad = -1;
    } else if (t < -90) {
        t += 180;
        *quad = -1;
    } else {
        *quad = 1;
    }

    if (t < -45) {
        t += 90;
        *shift = -1;
    } else if (t > 45) {
        t -= 90;
        *shift = 1;
    } else {
        *shift = 0;
    }
    
    if(t < 0){
        t = -t;
        t = (( fixed_t)t<<PRECISION-6)/45;   //Convert to decimal representation of angle
        t = ( fixed_t)t<<4;
        t = -t;
      } else{
        t = (( fixed_t)t<<PRECISION-6)/45;   //Convert to decimal representation of angle
        t = ( fixed_t)t<<4;
    }
}

void calc_cos(fixed_t *tan_lut, fixed_t theta, char quad, char shift, fixed_t *sin_result, fixed_t *cos_result) {
    char sigma;
    fixed_t s, x1, x2, y;
    x1 = MAGIC_NUMBER;    // this will be the cosine result, initially the magic number 0.60725293
    y = 0;          // y will contain the sine result
    s = 0;          // s will contain the final angle
    sigma = 1;      // direction from target angle

    // Print headers for the table
    printf("| %-2s | %-8s | %-8s | %-8s | %-5s | %-8s |\n", "i", "x1", "y", "s", "sigma", "tan_lut[i+1]");
    printf("|----|----------|----------|----------|-------|--------------|\n");

    for (int i = 0; i < PRECISION; i++) {
        // Update sigma based on the angle
        sigma = (theta - s) > 0 ? 1 : -1;

        if (sigma < 0) {
            x2 = x1 + (y >> i);  // x2 is the updated cosine value
            y = y - (x1 >> i);    // update sine value
            x1 = x2;              // update cosine value
            s -= *tan_lut++;      // subtract the tan value from s
        } else {
            x2 = x1 - (y >> i);  // x2 is the updated cosine value
            y = y + (x1 >> i);    // update sine value
            x1 = x2;              // update cosine value
            s += *tan_lut++;      // add the tan value to s
        }

        // Print the values in hexadecimal format
        printf("| %2d | %08x | %08x | %08x | %5d | %12x |\n", 
            i, x1, y, s, sigma, *tan_lut);
    }

    // Ensure x1 is positive for the final cosine result
    if (x1 < 0) x1 = -x1;

    // Depending on shift, assign the correct values for sine and cosine
    if (shift > 0) {
        *sin_result = x1;
        *cos_result = -y;
    } else if (shift < 0) {
        *sin_result = -x1;
        *cos_result = y;
    } else {
        *sin_result = y;
        *cos_result = x1;
    }

    // Adjust sine and cosine values based on quadrant
    *sin_result = quad * *sin_result;
    *cos_result = quad * *cos_result;
}

// Function to simulate the CORDIC cosine calculation for a given angle theta
void cordic_cos(double theta, fixed_t *tan_lut) {

    // Initialize values
    char quad, shift;
    fixed_t sin_result, cos_result;

    fixed_t theta_norm = normalize_theta(theta, &quad, &shift);

    // Test
    printf("CORDIC Iterations\n");
    calc_cos(tan_lut, theta_norm, quad, shift, &sin_result, &cos_result);

    double sin_result_d = sin_result/pow(2.0,PRECISION-1);
    double cos_result_d = cos_result/pow(2.0,PRECISION-1);
    printf("%f", theta);
    printf("\nsin(x) = %2.16f\ncos(x) = %2.16f\n", sin_result_d, cos_result_d);
    printf("\nsin(x) error = %2.16f\ncos(x) error = %2.16f\n", sin_result_d-sin(theta* (M_PI / 180.0)), cos_result_d-cos(theta* (M_PI / 180.0)));
}