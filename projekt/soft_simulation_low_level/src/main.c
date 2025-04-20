#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "./common.h"


int main(int argc, char* argv[]){
    // Checking if user gave argument
    if (argc == 1){
        printf("Specify float argument.\r\n");
        return EXIT_FAILURE;
    }
    uint16_t theta, phi = 0;
    uint16_t cos = SCALING_COSINUS_PRODUCT, sin = 0;

    double sin_res, cos_res;
    double theta_f = atof(argv[1]);

    // Check if the input was 0 for sure (atof usage)
    if (theta_f == 0)
    {
        char* text = "If your input was 0 please specify \"fs\" as second argument. Otherwise check if input data was correct float.\r\n";
        switch(argc){
            case 2:
                printf("%s", text);
                return EXIT_FAILURE;
            default:
                if (strcmp(&argv[2][0], "fs") != 0){
                    printf("%s", text);
                    return EXIT_FAILURE;
                }
                break;                
        }
    }
    

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

    low_level_simulation(&theta, &sin, &cos, &phi);

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

    printf("Sine: %f\r\nCosine: %f\r\nphi: %f\r\n", sin_res, cos_res, theta_f);

    return 0;
}