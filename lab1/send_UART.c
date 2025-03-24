#include "include/functions.h"

#define XUART0_PS 0xe0000000
#define XUARTPS_SR_OFFSET (XUART0_PS + 0x0000002C)
#define XUARTPS_SR_TXFULL 1<<4
#define XUARTPS_FIFO_OFFSET (XUART0_PS + 0x00000030)

void send_UART_char(char s)
{
  while ((RAW_SPACE(XUARTPS_SR_OFFSET) & XUARTPS_SR_TXFULL) > 0);
  RAW_SPACE(XUARTPS_FIFO_OFFSET) = (unsigned int) s;
}

int send_UART_chars(const char *s) 
{
    while(*s != '\0') { 
	    if(*s == '\n') send_UART_char('\r');
	    send_UART_char(*s);   
	    s++;
    }
    return 0;
}