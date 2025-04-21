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

    int16_t theta = atoi(argv[1]);
    int16_t cos = SCALING_COSINUS_PRODUCT, sin = 0;
    int8_t flips = 0;

    float sin_res, cos_res;

    // Check if the input was 0 for sure (atoi usage)
    if (theta == 0)
    {
        char* text = "If your input was 0 please specify \"fs\" as second argument. Otherwise check if input data was correct float.\r\n";
        switch(argc){
            case 2:
                printf("%s", text);
                return EXIT_FAILURE;
            default:
                if (strcmp(argv[2], "fs") != 0){
                    printf("%s", text);
                    return EXIT_FAILURE;
                }
                break;                
        }
    }
    

    // Make theta [-180;180]
    while(theta < -180) theta += 360;
    while(theta > 180) theta -= 360;

    // Make theta [-45;45]
    while (theta > 45){
        theta -= 90;
        flips -= 1;
    } 
    while (theta < -45)
    {
        theta += 90;
        flips += 1;
    }

    // Convert angle in degrees to <angle_deg> * 2^16 / 180
    theta = (int16_t) (theta * (2 << 15) / 180);

    low_level_simulation(&theta, &sin, &cos);

    // Correct signs according to quarter
    switch(flips){
        case 1:
            cos_res = (float) sin / (2 << 14);
            sin_res = -1 * (float) cos / (2 << 14);
            break;

        case -1:
            cos_res = -1 * (float) sin / (2 << 14);
            sin_res = (float) cos / (2 << 14);
        break;

        case 2:

        case -2:
            cos_res = -1 * (float) cos / (2 << 14);
            sin_res = -1 * (float) sin / (2 << 14);
            break;

        default:
            cos_res = (float) cos / (2 << 14);
            sin_res = (float) sin / (2 << 14);
    }

    printf("Sine: %f\r\nCosine: %f\r\n", sin_res, cos_res);

    return 0;
}