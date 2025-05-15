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

// Convert char* (hex representation) to uint
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


// 10^exp (only positive exp)
unsigned int pow10(unsigned int exp){
    unsigned int result = 10;

    if(exp == 0)
        return 1;

    for(int i = 0; i < exp - 1; i++){
        result *= 10;
    }

    return result;
}


float chars2float(char* chars){
    int i, integral_len, decimal_len,
        integral_val = 0, decimal_val = 0,
        sign = 0;

    // TODO: handle and illegal characters
    if(chars[0] == '-'){
        sign = 1;
        chars++;
    }

    // Handle integral len
    for(i = 0; chars[i] != '\0' && chars[i] != '.'; i++);
    integral_len = i;

    // Handle decimal len
    for(i; chars[i] != '\0'; i++);
    decimal_len = i - (integral_len + 1);

    // Integral part handling
    for(i = 0; i < integral_len; i++){
        integral_val += (chars[0] - '0') * pow10(integral_len - (i + 1));
        chars++;
    }

    // . goes here
    chars++;

    // Decimal part
    for(i = 0; i < decimal_len; i++){
        decimal_val += (chars[0] - '0') * pow10(decimal_len - (i + 1));
        chars++;
    }

    // printf("\nSign: %c\n", *(chars - (decimal_len + integral_len + 1)));

    return (sign) ? -integral_val - ((float) decimal_val / pow10(decimal_len)):
                    integral_val + ((float) decimal_val / pow10(decimal_len));
}