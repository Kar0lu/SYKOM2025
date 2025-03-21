#include "../include/tan_lut.h"

// Function populating LUT with corresponding tan values
TanLUT create_tan_lut(unsigned int accuracy) {
    TanLUT table;
    table.angles = malloc(accuracy * sizeof(double));
    table.values = malloc(accuracy * sizeof(double));

    if (!table.angles || !table.values) {
        free(table.angles);
        free(table.values);
        table.angles = NULL;
        table.values = NULL;
        return table;
    }

    for (int i = 0; i < accuracy; i++) {
        table.angles[i] = pow(2, -i);
        table.values[i] = atan(table.angles[i]) * (180.0 / M_PI);
    }

    return table;
}

// Function to free the memory used by the tan LUT
void free_tan_lut(TanLUT table) {
    free(table.angles);
    free(table.values);
}