#ifndef COMMON_H
#define COMMON_H
#include <stddef.h>

// Address Space
#define RAW_SPACE(addr) (*(volatile unsigned long *)(addr))
#define BASE_ADDR 0x40000000

// UART
#define XUART0_PS 0xe0000000
#define XUARTPS_SR_OFFSET (XUART0_PS + 0x0000002C)
#define XUARTPS_SR_TXFULL 1 << 4
#define XUARTPS_FIFO_OFFSET (XUART0_PS + 0x00000030)

#define XUARTPS_SR_RXFULL 1 << 2
#define XUARTPS_SR_RXEMPTY 1 << 1

typedef struct
{
unsigned int ctrl_reg;
unsigned int in_angle_reg;
unsigned int out_cos_reg;
unsigned int out_sin_reg;
} registers;

unsigned int chars_to_uint(char* chars);

void send_UART_char(char s);

int send_UART_chars(const char *s);

char recive_UART_char(void);

char* recive_UART_chars(int max_len);

void exit_simulation();

void print_32b(unsigned int v);

void heap_init(void);

void *malloc(size_t size);

void free(void *ptr);

void handle_out_of_heap(void);

#endif