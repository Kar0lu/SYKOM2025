#ifndef FUNCTIONS_H
#define FUNCTIONS_H

#include "config.h"

fixed_t* create_tan_lut();
void free_tan_lut(fixed_t* table);

void cordic_cos(double theta, fixed_t *tan_lut);

void table_to_files(fixed_t* table);

#endif