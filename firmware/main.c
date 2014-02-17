/*
 * Base C file for the STM32F4 Bare Metal Bring Up
 */

#include <stdint.h>
#include <string.h>

#include "SystemResetClock.h"
#include "SystemGpio.h"
#include "SystemUart.h"
#include "SystemInterrupts.h"

#define UART_BUFSIZE 256
#define UART_BAUD    115200

uint32_t uartTxBuf[UART_BUFSIZE];
uint32_t uartRxBuf[UART_BUFSIZE];
SystemUartBuffer_t uartBuf = {
    .Tx.Buffer = uartTxBuf,
    .Tx.Size = UART_BUFSIZE,
    .Rx.Buffer = uartRxBuf,
    .Rx.Size = UART_BUFSIZE
};

int main(void)
{
    // Enable Global IRQs
    SystemIrqEnable();

    // GPIO Config
    SystemClockEnabled.GpioA = true;
    SystemClockEnabled.GpioD = true;
    
    SystemGpio.A.Mode.P0 = SystemGpioMode_Input;
    SystemGpio.D.Mode.P15 = SystemGpioMode_Output;
    SystemGpio.D.Mode.P14 = SystemGpioMode_Output;
    
    // USART2 Config
    SystemGpio.A.Mode.P2 = SystemGpioMode_Alternate;
    SystemGpio.A.Mode.P3 = SystemGpioMode_Alternate;
    SystemGpio.A.Function.P2 = 7;
    SystemGpio.A.Function.P3 = 7;
    
    SystemUartInit(&SystemUart.U2, &uartBuf, UART_BAUD);
    
    bool prevState = false;
    
    while(1)
    {
        bool state = SystemGpio.A.Input.P0;
        for(volatile int i = 0; i < 10000; i++);
        if(state == SystemGpio.A.Input.P0)
        {
            if(state && !prevState) {
                SystemGpio.D.Output.P15 = !SystemGpio.D.Output.P15;
                char *str = "Andrew Rossignol\n";
                SystemUartTxStr(&SystemUart.U2, str, 17);
                prevState = true;
            } else if(!state && prevState) {
                prevState = false;
            }
        }
        
        uint32_t bytesToRead = SystemUartBytesToRead(&SystemUart.U2);

        char buf[1];
        if(bytesToRead >= 1)
        {
            SystemUartRxStr(&SystemUart.U2, buf, 1);
            SystemUartTxStr(&SystemUart.U2, buf, 1);
        }
    }
    
    while(1);
    return 0;
}

