#include "common.h"

int main() {
    heap_init();
    volatile registers* const our_regs = (registers*) BASE_ADDR;
    char* scan;

    send_UART_chars("\nARMv7-APP: SYKOM lab.3 ("__FILE__", "__DATE__", "__TIME__")\n");
    while(1){

        send_UART_chars("1. Test AXI-Lite\n2. Exit application\n");
        scan = recive_UART_chars(1);
        switch (scan[0])
        {
        case '1':
            
            // Reading from RX and writing to registers 0x0 and 0x4
            send_UART_chars("\nInput to ctrl_reg: ");
            scan = recive_UART_chars(8);

            our_regs->ctrl_reg = chars_to_uint(scan);
            free(scan);

            send_UART_chars("\nInput to in_angle_reg: ");
            scan = recive_UART_chars(8);

            our_regs->in_angle_reg = chars_to_uint(scan);
            free(scan);
            send_UART_chars("\n");

            // Reading rewritten values from registers 0x8 and 0x12
            send_UART_chars("Value from 0x8:\n");
            send_UART_chars("0x");
            print_32b(our_regs->out_cos_reg);

            send_UART_chars("\nValue from 0x12:\n");
            send_UART_chars("0x");
            print_32b(our_regs->out_sin_reg);
            send_UART_chars("\n");
            break;

        case '2':
            send_UART_chars("\nGoodbye World!\n");
            exit_simulation();
            // We shouldn't need break here

        default:
            break;
        }
        
    }
    return 0;
}