# Usage
Every angle is interpreted as degrees. Simulation accepts negative values and floats.

## Single calculation
Execute `main s <angle>`, if one wish to calculate values for 0 degrees use `main s 0 fs`. Outputs the computation steps, the final result, and the differences between the math.h sin and cos functions in both single-precision (float) and double-precision formats.

## Testbench
Execute `main t <start_angle> <end_angle> <step>`. Outputs the final results for angles within the given range, compares them to the results from math.h functions, and writes the data to the file `/data/testbench_results.txt`. It also computes the accumulated relative errors.

## Input data
Execute `main i <start_angle> <end_angle> <step>`. Outputs data in a format that details all key computation steps and allows for comparison of Verilog model results with the simulation.