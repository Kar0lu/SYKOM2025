#include "common.h"

char val2hex(unsigned int i) {
    if (i < 10)
        return '0' + i;
    else
        return 'A' + (i - 10);
}

void print_32b(unsigned int v) {
    int i;
    for(i = 0 ; i < 8; i++) {
        char x = (v >> (28 - 4*i)) & 0xF;
        send_UART_char(val2hex(x));
    }
}

// Convert char* to uint
unsigned int chars_to_uint(char* chars){
    unsigned int to_return = 0;

    for(int i = 0; i < 8; i++){
        // Starting from LSB
        if('0' <= chars[i] && chars[i] <= '9')
            to_return |= ((chars[i] - '0') << (28 - i*4));
        else if('A' <= chars[i] && chars[i] <= 'F')
            to_return |= ((chars[i] + 10 - 'A') << (28 - i*4));
        else if('a' <= chars[i] && chars[i] <= 'f')
            to_return |= ((chars[i] + 10 - 'a') << (28 - i*4));
        else {
            send_UART_chars("\nUnsupported character: \"");
            send_UART_char(chars[i]);
            send_UART_chars("\" assuming 0\n");
        }
    }

    return to_return;
}