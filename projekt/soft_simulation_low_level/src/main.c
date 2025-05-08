#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "./common.h"
#include <string.h>


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
                case 'i':
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
            preprocess_angle(&angle_float, &angle_fixed, &flips);
            low_level_simulation(&angle_fixed, &sin_c, &cos_c);
            postprocess_quarters(&cos_c, &sin_c, &cos_res, &sin_res, flips);
            printf("Sine: %f\r\nCosine: %f\r\n", sin_res, cos_res);
            break;
        // case 't':
        //     sin_diff_square_sum = 0;
        //     cos_diff_square_sum = 0;
        //     sin_square_sum = 0;
        //     cos_square_sum = 0;

        //     fprintf(file, "%6s %12s %25s %12s %25s\r\n", "Angle", "sin", "sin (from math lib)", "cos", "cos (from math lib)");

        //     // Calculating angles from -180 to 179
        //     for(fixed_t i = -180; i < 180; i++){
        //         angle_fixed = i;
        //         preprocess_angle(&angle_fixed, &flips);
        //         low_level_simulation(&angle_fixed, &sin_c, &cos_c);
        //         postprocess_quarters(&cos_c, &sin_c, &cos_res, &sin_res, flips);

        //         sin_lib = sin((double) i * M_PI / 180);
        //         cos_lib = cos((double) i * M_PI / 180);

        //         // Storing square sum for error assessment
        //         sin_diff_square_sum += pow((sin_res - sin_lib), 2);
        //         cos_diff_square_sum += pow((cos_res - cos_lib), 2);
        //         sin_square_sum += pow(sin_lib, 2);
        //         cos_square_sum += pow(cos_lib, 2);

        //         fprintf(file, "%6hd %12.6f %25.6f %12.6f %25.6f %3d\r\n",
        //                 i, sin_res, sin_lib,
        //                 cos_res, cos_lib,
        //                 flips                                                  
        //         );
                
        //     }

        //     fprintf(file, "Accumulated relative sinus error: %.6f\r\n", sqrt(sin_diff_square_sum / sin_square_sum));
        //     fprintf(file, "Accumulated relative cosinus error: %.6f\r\n", sqrt(cos_diff_square_sum / cos_square_sum));

        //     // Cleaning up
        //     fclose(file);

        //     printf("Succesfuly saved results to data/caluculation_results.txt\r\n");

        //     break;
        // case 'i':
        //     printf("Case i");
        default:
            printf("Unknown argument: %c\r\n" WRONG_USAGE, mode);
            return EXIT_FAILURE;
    }

    return 0;

}