#include <stdio.h>
#include <stdlib.h>
#include "../include/functions.h"


int main(int argc, char *argv[]) {
    // Check if exactly one argument (theta) is passed
    if (argc != 2) {
        printf("Usage: ./high_level <theta>\n");
        return 1;
    }

    // Create ATAN lookup table
    fixed_t* tan_lut = create_tan_lut();

    // Write data to files
    table_to_files(tan_lut);

    // Call the CORDIC cosine function for the given angle
    cordic_cos(atoi(argv[1]), tan_lut);

    // Free the allocated memory for the LUT
    free_tan_lut(tan_lut);
    return 0;
}