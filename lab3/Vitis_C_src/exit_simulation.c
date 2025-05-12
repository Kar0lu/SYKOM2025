#include "common.h"

#define PSS_RST_CTRL (*(volatile unsigned long *)((0xF80000000 + 0x200)))
#define PSS_RST_VAL (0x00000000)

void exit_simulation() {
    PSS_RST_CTRL = PSS_RST_VAL;
}