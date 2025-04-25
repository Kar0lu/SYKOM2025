#ifndef COMMON_H
#define NUMBER_OF_ITERATIONS 16

#define SCALING_COSINUS_PRODUCT 0x4DBA // In Q15

#define WRONG_USAGE "Expected arguments:\r\n" \
                    "t: run testbench and write results to file\r\n" \
                    "s <int16>: calculate sine and cosine values for angle given in degrees (whole number from -32768 to +32767)\r\n"

void low_level_simulation(int16_t* theta, int16_t* sin, int16_t* cos);

void preprocess_angle(int16_t* angle, int8_t* flips);

void postprocess_quarters(int16_t* cos_reg, int16_t* sin_reg, double* cos_res, double* sin_res, int8_t flips);

#endif