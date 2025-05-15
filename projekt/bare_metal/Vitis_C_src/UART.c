#include "common.h"
#include <stddef.h>

void send_UART_char(char s) {
  while ((RAW_SPACE(XUARTPS_SR_OFFSET) & XUARTPS_SR_TXFULL) > 0);
  RAW_SPACE(XUARTPS_FIFO_OFFSET) = (unsigned int) s;
}

int send_UART_chars(const char *s) {
    while(*s != '\0') { 
	    if(*s == '\n') send_UART_char('\r');
	    send_UART_char(*s);   
	    s++;
    }
    return 0;
}

char recive_UART_char(void) {
    while ((RAW_SPACE(XUARTPS_SR_OFFSET) & XUARTPS_SR_RXEMPTY));
    return RAW_SPACE(XUARTPS_FIFO_OFFSET);
}

char* recive_UART_chars(int max_len) {
    int current_len = 0;
    char* ptr = (char *) malloc(max_len+1);

    if(ptr == NULL)
        handle_out_of_heap();

    char tmp;

    while(1) {
        tmp = recive_UART_char();

        if(tmp) {
            if(tmp == '\r') {
                ptr[current_len] = '\0';
                break;
            } else {
            ptr[current_len] = tmp;
            current_len++;
            }
        }
            
        if(current_len == max_len){
            ptr[current_len+1] = '\0';
            break;
        }
    }

    return ptr;
}