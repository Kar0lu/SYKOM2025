#include "functions.h"

int main() {
    send_UART_chars("\nARMv7-APP: SYKOM lab.1 ("__FILE__", "__DATE__", "__TIME__")\n");
    send_UART_chars("0x");
    print_ulong(get_id());
    send_UART_chars("\n");
    exit_simulation();
    return 0;
}