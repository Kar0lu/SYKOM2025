#ifndef TAN_LUT_H
#define TAN_LUT_H

#include "config.h"

fixed_t* create_tan_lut();
void free_tan_lut(fixed_t* table);

#endif