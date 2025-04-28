#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "./common.h"

struct Results {
    double sin_diff_square_sum;
    double cos_diff_square_sum;
    double sin_square_sum;
    double cos_square_sum;
};



int main(int argc, char* argv[]){
    char mode;
    int16_t theta, cos_c, sin_c;
    int8_t flips;
    double sin_res, cos_res, sin_lib, cos_lib;
    FILE *file;
    struct Results* results;

    if (argc > 1)
        mode = argv[1][0];
    else{
        printf("No arguments specified.\r\n" WRONG_USAGE);
        return EXIT_FAILURE;
    }

    switch(mode){
        case 's':
            theta = atoi(argv[2]);

            // Check if the input was 0 for sure (atoi usage)
            if (theta == 0){
                char* text = "If your input was 0 please specify \"fs\" as second argument. Otherwise check if input data was correct integer (16 bit signed).\r\n";
                switch(argc){
                    case 3:
                        printf("%s", text);
                        return EXIT_FAILURE;
                    default:
                        if (strcmp(argv[3], "fs") != 0){
                            printf("%s", text);
                            return EXIT_FAILURE;
                        }
                        break;                
                }
            }

            preprocess_angle(&theta, &flips);
            low_level_simulation(&theta, &sin_c, &cos_c);
            postprocess_quarters(&cos_c, &sin_c, &cos_res, &sin_res, flips);
            printf("Sine: %f\r\nCosine: %f\r\n", sin_res, cos_res);
            break;
        case 't':
            // Opening file for writing (wb for compatibility with explicit CRLF in Windows)
            file = fopen("data/calculation_results.txt", "wb");
            if (file == NULL) {
                printf("Failed to open file for writing.\r\n");
                return 1;
            }

            // Allocating memory for error assesment struct          
            results = (struct Results*) malloc(sizeof(struct Results));

            results->sin_diff_square_sum = 0;
            results->cos_diff_square_sum = 0;
            results->sin_square_sum = 0;
            results->cos_square_sum = 0;

            fprintf(file, "%6s %12s %25s %12s %25s\r\n", "Angle", "sin", "sin (from math lib)", "cos", "cos (from math lib)");

            // Calculating angles from -180 to 179
            for(int16_t i = -180; i < 180; i++){
                theta = i;
                preprocess_angle(&theta, &flips);
                low_level_simulation(&theta, &sin_c, &cos_c);
                postprocess_quarters(&cos_c, &sin_c, &cos_res, &sin_res, flips);

                sin_lib = sin((double) i * M_PI / 180);
                cos_lib = cos((double) i * M_PI / 180);

                // Storing square sum for error assessment
                results->sin_diff_square_sum += pow((sin_res - sin_lib), 2);
                results->cos_diff_square_sum += pow((cos_res - cos_lib), 2);
                results->sin_square_sum += pow(sin_lib, 2);
                results->cos_square_sum += pow(cos_lib, 2);

                fprintf(file, "%6hd %12.6f %25.6f %12.6f %25.6f\r\n", i, sin_res, sin_lib,
                                                                         cos_res, cos_lib);
                
            }

            fprintf(file, "Accumulated relative sinus error: %.6f\r\n", sqrt(results->sin_diff_square_sum / results->sin_square_sum));
            fprintf(file, "Accumulated relative cosinus error: %.6f\r\n", sqrt(results->cos_diff_square_sum / results->cos_square_sum));

            // Cleaning up
            free(results);
            fclose(file);

            printf("Succesfuly saved results to data/caluculation_results.txt\r\n");

            break;
        default:
            printf("Unknown argument: %c\r\n" WRONG_USAGE, mode);
            return EXIT_FAILURE;
    }

    return 0;

}