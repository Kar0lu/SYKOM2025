#include "common.h"
#include <stdlib.h>

int main() {

volatile registers* const our_regs = (registers*) BASE_ADDR;
char* scanf;

send_UART_chars("\nARMv7-APP: SYKOM lab.3 ("__FILE__", "__DATE__", "__TIME__")\n");

// Reading from RX and writing to registers 0x0 and 0x4
send_UART_chars("Input to ctrl_reg: ");
scanf = recive_UART_chars(8);
our_regs->ctrl_reg = chars_to_uint(scanf);
free(scanf);

send_UART_chars("\nInput to in_angle_reg: ");
scanf = recive_UART_chars(8);
our_regs->in_angle_reg = chars_to_uint(scanf);
free(scanf);
send_UART_chars("\n");

// Reading rewritten values from registers 0x8 and 0x12
send_UART_chars("Value from 0x8:\n");
send_UART_chars("0x");
print_32b(our_regs->out_cos_reg);

send_UART_chars("\nValue from 0x12:\n");
send_UART_chars("0x");
print_32b(our_regs->out_sin_reg);
send_UART_chars("\n");

exit_simulation();
return 0;
}