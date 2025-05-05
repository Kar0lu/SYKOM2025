#ifndef CONFIG_H
#define CONFIG_H

#include <stdint.h>

#define PRECISION 32     // Bit width: 16, 32, or 64

#if PRECISION == 16
    typedef int16_t fixed_t;
    #define MAX_VALUE 0x7FFF;
    #define MAGIC_NUMBER 0x4DBA;
#elif PRECISION == 32
    typedef int32_t fixed_t;
    #define MAX_VALUE 0x7FFFFFFF
    #define MAGIC_NUMBER 0x4dba76d4;
#elif PRECISION == 64
    typedef int64_t fixed_t;
    #define MAX_VALUE 0x7FFFFFFFFFFFFFFF
    #define MAGIC_NUMBER 0x4dba76d421af2c00;
#else
#error "Unsupported PRECISION"
#endif

#endif
