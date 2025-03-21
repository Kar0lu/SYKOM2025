#ifndef TAN_LUT_H
#define TAN_LUT_H

#include <stdlib.h>
#include <math.h>

typedef struct {
    double *angles;
    double *values;
} TanLUT;

TanLUT create_tan_lut(unsigned int accuracy);
void free_tan_lut(TanLUT table);

#endif