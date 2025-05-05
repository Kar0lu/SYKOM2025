#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include "../include/functions.h"

// Function populating LUT with corresponding tan values
fixed_t* create_tan_lut() {
    fixed_t* table = malloc(PRECISION * sizeof(fixed_t));
    if (!table) return NULL;

    double scale = pow(2, PRECISION) / 180.0;
    for (int i = 0; i < PRECISION; i++) {
        double angle_deg = atan(pow(2, -i)) * 180.0 / M_PI;
        
        table[i] = (fixed_t)round(angle_deg * scale);
    }

    return table;
}

// Function to free the memory used by the tan LUT
void free_tan_lut(fixed_t* table) {
    free(table);
}