#include <stdio.h>
#include "../include/cordic_cos.h"
#include "../include/tan_lut.h"

#define TAN_LUT_ACCURACY 50

int main(int argc, char *argv[]) {
    // Check if exactly one argument (theta) is passed
    if (argc != 2) {
        printf("Usage: ./high_level <theta>\n");
        return 1;
    }

    // Create the tangent LUT with specified accuracy
    TanLUT tan_lut = create_tan_lut(TAN_LUT_ACCURACY);

    // Check if memory allocation for LUT was successful
    if (tan_lut.angles == NULL || tan_lut.values == NULL) {
        printf("Failed to allocate memory for the LUT.\n");
        return 1;
    }

    // Open a file to back up the LUT data for later analysis
    FILE *file = fopen("data/tan_lut.txt", "w");
    if (file == NULL) {
        printf("Failed to open file for writing.\n");
        free_tan_lut(tan_lut);
        return 1;
    }

    // Write the LUT data (angles and corresponding tan values) to a file
    for (int i = 0; i < TAN_LUT_ACCURACY; i++) {
        fprintf(file, "%.20f\t%.20f\n", tan_lut.angles[i], tan_lut.values[i]);
    }
    fclose(file);

    // Call the CORDIC cosine function for the given angle
    cordic_cos(atoi(argv[1]));

    // Free the allocated memory for the LUT
    free_tan_lut(tan_lut);
    return 0;
}