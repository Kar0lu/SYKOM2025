#ifndef FUNCTIONS_H
#define FUNCTIONS_H

#define RAW_SPACE(addr)    (*(volatile unsigned long *)(addr))

void send_UART_char(char s);
int send_UART_chars(const char *s);
void exit_simulation();
void print_ulong(unsigned long v);
unsigned long get_id();

#endif