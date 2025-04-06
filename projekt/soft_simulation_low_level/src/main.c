#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#define NUMBER_OF_ITERATIONS 16
#define SCALING_COSINUS_PRODUCT 0x4DBA // In Q15

void low_level_simulation(uint16_t* theta, uint16_t* sin, uint16_t* cos, uint16_t* atantable, uint16_t* phi){
    uint16_t cos_next;
    int i;

    for(i = 0; i < NUMBER_OF_ITERATIONS; i++){
        // Edge cases
        if(*theta == 0x4000) {
            printf("Sine: %f\r\nCosine: %f\r\nphi: %f\r\n", 0.707107, 0.707107, 45.0);
            break;
        } else if(*theta == 0){
            printf("Sine: %f\r\nCosine: %f\r\nphi: %f\r\n", 0.0, 1.0, 0.0);
            break;
        }
        // Standard cases
        if(*phi < *theta){
            cos_next = *cos - (*sin >> i);
            *sin += (*cos >> i); 
            *cos = cos_next;
            *phi += atantable[i];
        } else if (*phi > *theta){
            cos_next = *cos + (*sin >> i);
            *sin -= (*cos >> i); 
            *cos = cos_next;
            *phi -= atantable[i];
        }
    }
}

int main(int argc, char* argv[]){
    uint16_t theta, phi = 0;
    uint16_t cos = SCALING_COSINUS_PRODUCT, cos_next, sin = 0;

    // Representation: <angle_deg> * 2^16 / 180
    uint16_t atantable[NUMBER_OF_ITERATIONS] = {  
        0x4000,   //atan(2^0) = 45 degrees
        0x25C8,   //atan(2^-1) = 26.5651
        0x13F6,   //atan(2^-2) = 14.0362
        0x0A22,   //7.12502
        0x0516,   //3.57633
        0x028B,   //1.78981
        0x0145,   //0.895174
        0x00A2,   //0.447614
        0x0051,   //0.223808
        0x0029,   //0.111904
        0x0014,   //0.05595
        0x000A,   //0.0279765
        0x0005,   //0.0139882
        0x0003,   //0.0069941
        0x0002,   //0.0035013
        0x0001    //0.0017485
    };

    double sin_res, cos_res;
    double theta_f = atof(argv[1]);

    // Make theta [0;360)
    while(theta_f >= 360)
        theta_f -= 360;

    uint8_t quarter = 1;
    // Make theta [0;90)
    while(theta_f > 90){
        theta_f -= 90;
        quarter++;
    }

    // Convert angle in degrees to <angle_deg> * 2^16 / 180
    theta = (uint16_t) (theta_f * (2 << 15) / 180);

    low_level_simulation(&theta, &sin, &cos, atantable, &phi);

    // Correct signs according to quarter
    switch(quarter){
        case 2:
            cos_res = (float) sin / (2 << 14);
            sin_res = ((float) cos / (2 << 14)) * -1;
            theta_f = ((float) phi / (2 << 15) * 180) + 90;
            break;
        case 3:
            sin_res = ((float) sin / (2 << 14)) * -1;
            cos_res = ((float) cos / (2 << 14)) * -1;
            theta_f = ((float) phi / (2 << 15) * 180) + 180;
            break;
        case 4:
            cos_res = ((float) sin / (2 << 14)) * -1;
            sin_res = (float) cos / (2 << 14);
            theta_f = ((float) phi / (2 << 15) * 180) + 270;
            break;
        default:
            sin_res = (float) sin / (2 << 14);
            cos_res = (float) cos / (2 << 14);
            theta_f = (float) phi / (2 << 15) * 180;
            break;
    }

    // Results converted to floats
    if (theta != 0x4000 && theta != 0)
        printf("Sine: %f\r\nCosine: %f\r\nphi: %f\r\n", sin_res, cos_res, theta_f);

    return 0;
}