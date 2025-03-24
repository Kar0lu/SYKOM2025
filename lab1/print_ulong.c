#include "include/functions.h"

char val2hex(unsigned int i) {
    if (i < 10)
        return '0' + i;
    else
        return 'A' + (i - 10);
}

void print_ulong(unsigned long v) {
    int i;
    for(i = 0 ; i < 8; i++) {
        char x = (v >> (28 - 4*i)) & 0xF;
        send_UART_char(val2hex(x));
    }
}