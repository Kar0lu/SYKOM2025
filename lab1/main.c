#include <stdio.h>

#include <stdio.h> 
#define u32 unsigned int

#define UART0_BASE 0xe0000000
struct XUARTPS{
        u32 control_reg0;       /* UART Control Register def=0x128 */
        u32 mode_reg0;          /* UART Mode Register def=0 */
        u32 intrpt_en_reg0;     /* Interrupt Enable Register def=0 */
        u32 intrpt_dis_reg0;    /* Interrupt Disable Register def=0 */
        u32 intrpt_mask_reg0;   /* Interrupt Mask Register def=0 */
        u32 chnl_int_sts_reg0;  /* Channel Interrupt Status Register def=x200 */
        u32 baud_rate_gen;      /* Baud Rate Generator Register def=0x28B */
        u32 Rcvr_timeout_reg0;          /* Receiver Timeout Register def=0 */
        u32 Rcvr_FIFO_trigger_level0;   /* Receiver FIFO Trigger Level Register */
        u32 Modem_ctrl_reg0;            /* Modem Control Register def=0 */
        u32 Modem_sts_reg0;     /* Modem Status Register */
        u32 channel_sts_reg0;   /* Channel Status Register def=0 */
        u32 tx_rx_fifo;         /* Transmit and Receive FIFO def=0 */
        u32 baud_rate_divider;  /* Baud Rate Divider def=0xf */
        u32 Flow_delay_reg0;            /* Flow Control Delay Register  def=0*/
        u32 Tx_FIFO_trigger_level;};    /* Transmitter FIFO Trigger Level Register */

static struct XUARTPS *UART0=(struct XUARTPS*) UART0_BASE;

#define UART_STS_TXFULL 1<<4

void sendUART1char(char s)
{
  /*Make sure that the uart is ready for new char's before continuing*/
  while ((( UART1->channel_sts_reg0 ) & UART_STS_TXFULL) > 0) ;
  
  /* Loop until end of string */
  UART1->tx_rx_fifo= (unsigned int) s; /* Transmit char */
}

int sendUARTstring(const char *s) 
{
    while(*s != '\0') 
    { 
	  if(*s=='\n')
		  sendUART1char('\r');
	   
	    sendUART1char(*s); /*Send char to the UART1*/	   
	   s++; /* Next char */
    }
    return 0;
}

int main() {
    
    sendUARTstring("\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, sem in tincidunt malesuada, nisl ipsum dignissim diam, at venenatis massa lorem at mauris. Nulla fringilla, justo nec pretium consequat, dui nibh tempus felis, id porttitor leo urna ac elit. Proin non turpis neque. Morbi aliquet velit id consequat molestie. Fusce egestas ullamcorper lectus, id vestibulum neque dignissim ut. Donec aliquam non augue quis tristique. Vivamus nisi leo, varius eget tincidunt eu, commodo ut sapien. Duis pretium dolor sed erat blandit volutpat. Aliquam nunc elit, fringilla id est sit amet, congue blandit arcu. Pellentesque id nisi et tortor tincidunt dignissim. Suspendisse aliquam sodales nisi, eget fringilla ipsum faucibus eget. Praesent pellentesque hendrerit tellus, quis viverra dolor posuere vel.\n");
    return 0;
}