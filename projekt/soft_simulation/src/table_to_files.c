#include <stdio.h>
#include <stdlib.h>
#include "../include/functions.h"
#include <math.h>
#include <inttypes.h>

// Function to write the LUT data to two text files
void table_to_files(fixed_t* table) {
    // Open file to store hex values for benchmarking
    FILE *file_hex = fopen("data/tan_lut_hex.txt", "w");
    if (file_hex == NULL) {
        printf("Failed to open file for hex values.\n");
        return;
    }

    // Open file to store detailed information (hex, angle, decimal)
    FILE *file_detailed = fopen("data/tan_lut_detailed.txt", "w");
    if (file_detailed == NULL) {
        printf("Failed to open file for detailed data.\n");
        fclose(file_hex);
        return;
    }

    // Format strings for data rows and header columns
    const char* hex_format = NULL;
    const char* detailed_format = NULL;
    const char* hex_header = NULL;
    const char* separator = NULL;

    switch (PRECISION) {
        case 64:
            hex_format = "0x%016" PRIX64 "\n";
            detailed_format = "| 0x%016" PRIX64 " | %031.28f | %030.30f |\n";
            hex_header = "%-20s";  // 2 chars for '0x' + 16 hex digits + 2 for spacing
            separator = "|----------------------|---------------------------------|----------------------------------|\n";
            break;
        case 32:
            hex_format = "0x%08" PRIX32 "\n";
            detailed_format = "| 0x%08" PRIX32 " | %031.28f | %030.30f |\n";
            hex_header = "%-10s";  // 2 chars for '0x' + 8 hex digits + 2
            separator = "|------------|---------------------------------|----------------------------------|\n";
            break;
        case 16:
            hex_format = "0x%04" PRIX16 "\n";
            detailed_format = "| 0x%04" PRIX16 "    | %024.21f | %030.30f |\n";
            hex_header = "%-8s";   // 2 chars for '0x' + 4 hex digits + 2
            separator = "|-----------|--------------------------|----------------------------------|\n";
            break;
        default:
            fprintf(stderr, "Unsupported precision: %d\n", PRECISION);
            return;
    }

    // Header with dynamic width
    fprintf(file_detailed, "| ");
    fprintf(file_detailed, hex_header, "Hex Value");
    fprintf(file_detailed, " | %-31s | %-32s |\n", "Angle (Degrees)", "Decimal Value");
    fprintf(file_detailed, "%s", separator);

    // Write the LUT data (hex, angle, decimal value) to the files
    for (int i = 0; i < PRECISION; i++) {
        double angle_deg = atan(pow(2, -i)) * 180.0 / M_PI;
        fixed_t value = table[i];
        double decimal_value = (double)value / pow(2, PRECISION);

        // Cast based on precision
        if (PRECISION == 64) {
            fprintf(file_hex, hex_format, (fixed_t)value);
            fprintf(file_detailed, detailed_format, (fixed_t)value, angle_deg, decimal_value);
        } else if (PRECISION == 32) {
            fprintf(file_hex, hex_format, (fixed_t)value);
            fprintf(file_detailed, detailed_format, (fixed_t)value, angle_deg, decimal_value);
        } else if (PRECISION == 16) {
            fprintf(file_hex, hex_format, (fixed_t)value);
            fprintf(file_detailed, detailed_format, (fixed_t)value, angle_deg, decimal_value);
        }
    }

    fclose(file_hex);
    fclose(file_detailed);
}
