#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "./common.h"
#include <string.h>

void print_binary(int64_t value, int bits) {
    for (int i = bits - 1; i >= 0; i--) {
        printf("%u", (value >> i) & 1);
    }
}


int main(int argc, char* argv[]) {
    char mode;

    float angle_float;
    char *endptr;

    fixed_t angle_fixed, cos_c, sin_c;
    int8_t flips;

    float sin_res, sin_square_sum, sin_diff_square_sum, sin_lib, 
          cos_res, cos_square_sum, cos_diff_square_sum, cos_lib;
    FILE *file;

    if (argc > 1) {
        if (strlen(argv[1]) == 1) {
            switch(argv[1][0]) {
                case 's':
                    if (argc == 3) {
                        angle_float = (float)strtod(argv[2], &endptr);
                        if (*endptr == '\0') {
                            mode = argv[1][0];
                        } else {
                            printf("Invalid angle.\r\n" WRONG_USAGE);
                            return EXIT_FAILURE;
                        }
                    } else {
                        printf("No angle specified.\r\n" WRONG_USAGE);
                        return EXIT_FAILURE;
                    }
                    break;
                case 't':
                    file = fopen("data/calculation_results.txt", "wb");
                    if (file == NULL) {
                        printf("Failed to open file for writing.\r\n");
                        return 1;
                    } else {
                        mode = argv[1][0];
                    }
                    break;
            }
        } else {
            printf("Second argument length is invalid.\r\n" WRONG_USAGE);
            return EXIT_FAILURE;
        }
    } else {
        printf("No arguments specified.\r\n" WRONG_USAGE);
        return EXIT_FAILURE;
    }

    switch(mode){
        case 's':
            preprocess_angle(&angle_float, &angle_fixed, &flips, 1);
            low_level_simulation(&angle_fixed, &sin_c, &cos_c, 1);
            postprocess_quarters(&cos_c, &sin_c, &cos_res, &sin_res, flips, 1);
            printf("Sine: %20.17f\r\nCosine: %20.17f\r\n", sin_res, cos_res);
            break;
        case 't':
            sin_diff_square_sum = 0;
            cos_diff_square_sum = 0;
            sin_square_sum = 0;
            cos_square_sum = 0;

            fprintf(file, "%6s %12s %12s %12s %12s %6s\r\n", "angle", "sin_res", "sin_lib", "cos_res", "cos_lib", "flips");

            // Calculating angles from -180 to 179
            for(float i = -720.0; i < 720.0; i += 0.01){
                angle_float = i;
                preprocess_angle(&angle_float, &angle_fixed, &flips, 0);
                low_level_simulation(&angle_fixed, &sin_c, &cos_c, 0);
                postprocess_quarters(&cos_c, &sin_c, &cos_res, &sin_res, flips, 0);

                sin_lib = sin((double) i * M_PI / 180);
                cos_lib = cos((double) i * M_PI / 180);

                // Storing square sum for error assessment
                sin_diff_square_sum += pow((sin_res - sin_lib), 2);
                cos_diff_square_sum += pow((cos_res - cos_lib), 2);
                sin_square_sum += pow(sin_lib, 2);
                cos_square_sum += pow(cos_lib, 2);

                fprintf(file, "%6.2f %12.8f %12.8f %12.8f %12.8f %6d\r\n",
                        i, sin_res, sin_lib,
                        cos_res, cos_lib,
                        flips                                                  
                );
                
            }

            fprintf(file, "Accumulated relative sinus error: %.9f\r\n", sqrt(sin_diff_square_sum / sin_square_sum));
            fprintf(file, "Accumulated relative cosinus error: %.9f\r\n", sqrt(cos_diff_square_sum / cos_square_sum));

            // Cleaning up
            fclose(file);

            printf("Succesfuly saved results to data/caluculation_results.txt\r\n");

            break;
        default:
            printf("Unknown argument: %c\r\n" WRONG_USAGE, mode);
            return EXIT_FAILURE;
    }

    return 0;

}