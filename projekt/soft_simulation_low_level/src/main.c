#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "./common.h"
#include <string.h>

void print_binary(FILE *out, int64_t value, int bits) {
    for (int i = bits - 1; i >= 0; i--) {
        fprintf(out, "%u", (value >> i) & 1);
    }
}

void print_binary_float(FILE *out, float value, int bits) {
    union {
        float f;
        uint32_t i;
    } u;

    u.f = value;  // reinterpret float as integer (bit pattern)
    
    for (int i = bits - 1; i >= 0; i--) {
        fprintf(out, "%u", (u.i >> i) & 1);
    }
}

int main(int argc, char* argv[]) {
    char mode;

    float angle_float, sin_float, cos_float;
    char *endptr;

    int32_t angle_int, angle_frac;
    fixed_t angle_fixed, cos_fixed, sin_fixed;
    int8_t flips;

    float start, end, step;
    char *endptr1, *endptr2, *endptr3;

    float sin_square_sum, sin_diff_square_sum, sin_lib_float, 
          cos_square_sum, cos_diff_square_sum, cos_lib_float;
    double sin_lib_double, cos_lib_double;
    FILE *file;

    union {
        float f;
        uint32_t u;
    } fconv;

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
                    file = fopen("data/testbench_results.txt", "wb");
                    if (file == NULL) {
                        printf("Failed to open file for writing.\r\n");
                        return 1;
                    } else {
                        if (argc == 5) {
                            start = (float)strtod(argv[2], &endptr1);
                            end = (float)strtod(argv[3], &endptr2);
                            step = (float)strtod(argv[4], &endptr3);
                            if (*endptr1 != '\0') {
                                printf("Invalid start.\r\n");
                                return EXIT_FAILURE;
                            } else if (*endptr2 != '\0') {
                                printf("Invalid end.\r\n");
                                return EXIT_FAILURE;
                            } else if (*endptr3 != '\0') {
                                printf("Invalid step.\r\n");
                                return EXIT_FAILURE;
                            } else {
                                mode = argv[1][0];
                            }
                        } else {
                            printf("Not enough arguments.\r\n" WRONG_USAGE);
                        }
                    }
                    break;
                case 'i':
                    file = fopen("data/input_data.txt", "wb");
                    if (file == NULL) {
                        printf("Failed to open file for writing.\r\n");
                        return 1;
                    } else {
                        if (argc == 5) {
                            start = (float)strtod(argv[2], &endptr1);
                            end = (float)strtod(argv[3], &endptr2);
                            step = (float)strtod(argv[4], &endptr3);
                            if (*endptr1 != '\0') {
                                printf("Invalid start.\r\n");
                                return EXIT_FAILURE;
                            } else if (*endptr2 != '\0') {
                                printf("Invalid end.\r\n");
                                return EXIT_FAILURE;
                            } else if (*endptr3 != '\0') {
                                printf("Invalid step.\r\n");
                                return EXIT_FAILURE;
                            } else {
                                mode = argv[1][0];
                            }
                        } else {
                            printf("Not enough arguments.\r\n" WRONG_USAGE);
                        }
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
            preprocess_angle(&angle_float, &angle_int, &angle_frac, &angle_fixed, &flips, 1);
            low_level_simulation(&angle_fixed, &sin_fixed, &cos_fixed, 1);
            postprocess_quarters(&sin_fixed, &cos_fixed, &flips, &sin_float, &cos_float, 1);

            sin_lib_float = sinf(angle_float * M_PI / 180);
            cos_lib_float = cosf(angle_float * M_PI / 180);
            sin_lib_double = sin(angle_float * M_PI / 180);
            cos_lib_double = cos(angle_float * M_PI / 180);


            printf("\n=== FINAL RESULTS ===\n");
            printf("sin_float: %12.8f\tsin_err_float: %12.8f\tsin_err_double: %12.8f\r\ncos_float: %12.8f\tcos_err_float: %12.8f\tcos_err_double: %12.8f\r\n", sin_float, sin_float - sin_lib_float, sin_float - sin_lib_double, cos_float, cos_float - cos_lib_float, cos_float - cos_lib_double);
            break;
        case 't':
            sin_diff_square_sum = 0;
            cos_diff_square_sum = 0;
            sin_square_sum = 0;
            cos_square_sum = 0;

            fprintf(file, "%13s %13s %13s %13s %13s %5s\r\n", "angle", "sin_float", "sin_lib_float", "cos_float", "cos_lib_float", "flips");

            // calculating angles from -180 to 179
            for(; start < end+step; start = start + step){
                angle_float = start;
                preprocess_angle(&angle_float, &angle_int, &angle_frac, &angle_fixed, &flips, 0);
                low_level_simulation(&angle_fixed, &sin_fixed, &cos_fixed, 0);
                postprocess_quarters(&sin_fixed, &cos_fixed, &flips, &sin_float, &cos_float, 0);

                sin_lib_float = sinf(start * M_PI / 180);
                cos_lib_float = cosf(start * M_PI / 180);

                // storing square sum for error assessment
                sin_diff_square_sum += pow((sin_float - sin_lib_float), 2);
                cos_diff_square_sum += pow((cos_float - cos_lib_float), 2);
                sin_square_sum += pow(sin_lib_float, 2);
                cos_square_sum += pow(cos_lib_float, 2);

                fprintf(file, "%13.8f %13.8f %13.8f %13.8f %13.8f %5d\r\n",
                        start, sin_float, sin_lib_float,
                        cos_float, cos_lib_float,
                        flips                                                  
                );
                
            }

            fprintf(file, "Accumulated relative sinus error: %.9f\r\n", sqrt(sin_diff_square_sum / sin_square_sum));
            fprintf(file, "Accumulated relative cosinus error: %.9f\r\n", sqrt(cos_diff_square_sum / cos_square_sum));

            // cleaning up
            fclose(file);

            printf("Succesfuly saved results to data/caluculation_results.txt\r\n");

            break;
        case 'i':
            fprintf(file, "%s %s %s %s %s %s %s %s %s %s %s %s \r\n", "angle", "angle_hex", "angle_int", "angle_frac", "angle_fixed", "flips", "sin_fixed", "cos_fixed", "sin_fixed_float", "cos_fixed_float", "sin_lib_float", "cos_lib_float");

            // calculating angles from -180 to 179
            for(; start < end+step; start = start + step){
                angle_float = start;
                preprocess_angle(&angle_float, &angle_int, &angle_frac, &angle_fixed, &flips, 0);
                low_level_simulation(&angle_fixed, &sin_fixed, &cos_fixed, 0);
                postprocess_quarters(&sin_fixed, &cos_fixed, &flips, &sin_float, &cos_float, 0);

                sin_lib_float = sinf(start * M_PI / 180);
                cos_lib_float = cosf(start * M_PI / 180);

                fprintf(file, "%13.8f ", start);
                fconv.f = start;
                fprintf(file, "%08x ", fconv.u);
                // print_binary(file, angle_int, 32); fprintf(file, " ");
                // print_binary(file, angle_frac, 32); fprintf(file, " ");
                // print_binary(file, angle_fixed, 32); fprintf(file, " ");
                fprintf(file, "%08x ", angle_int);
                fprintf(file, "%08x ", angle_frac);
                fprintf(file, "%08x ", angle_fixed);
                fprintf(file, "%2d ", flips);
                // print_binary(file, sin_fixed, 32); fprintf(file, " ");
                // print_binary(file, cos_fixed, 32); fprintf(file, " ");
                // print_binary_float(file, (float)sin_fixed / (1LL << 31), 32); fprintf(file, " ");
                // print_binary_float(file, (float)cos_fixed / (1LL << 31), 32); fprintf(file, " ");
                fprintf(file, "%08x ", sin_fixed);
                fprintf(file, "%08x ", cos_fixed);
                fconv.f = sin_float;
                fprintf(file, "%08x ", fconv.u);
                fconv.f = cos_float;
                fprintf(file, "%08x ", fconv.u);
                fconv.f = sin_lib_float;
                fprintf(file, "%08x ", fconv.u);
                fconv.f = cos_lib_float;
                fprintf(file, "%08x\n", fconv.u);
                // i, angle_int, angle_frac, angle_fixed, flips,
                // sin_fixed, cos_fixed,
                // sin_fixed_float, cos_fixed_float,
                // sin_lib_float, cos_lib_float                                               
                
            }
            // cleaning up
            fclose(file);

            printf("Succesfuly saved results to data/input_data.txt\r\n");

            break;
        default:
            printf("Unknown argument: %c\r\n" WRONG_USAGE, mode);
            return EXIT_FAILURE;
    }

    return 0;

}