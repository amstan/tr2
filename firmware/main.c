/*
 * Base C file for the STM32F4 Bare Metal Bring Up
 */

#include <stdint.h>

#include "SystemResetClock.h"
#include "SystemGpio.h"
#include "SystemUart.h"
#include "SystemInterrupts.h"

#define UART_BUFSIZE 256
#define UART_BAUD    19200

uint32_t uartBuf[UART_BUFSIZE];
SystemRingBuffer_t uartRingBuf = {
    .Buffer = uartBuf,
    .Size = UART_BUFSIZE
};

int main(void)
{
    // Enable Global IRQs
    SystemIrqEnable();

    // GPIO Config
    PeripheralClockEnabled.GpioA = true;
    PeripheralClockEnabled.GpioD = true;
    
    SystemGpio.A.Mode.P0 = SystemGpioMode_Input;
    SystemGpio.D.Mode.P15 = SystemGpioMode_Output;
    SystemGpio.D.Mode.P14 = SystemGpioMode_Output;
    
    // USART2 Config
    SystemGpio.A.Mode.P2 = SystemGpioMode_Alternate;
    SystemGpio.A.Mode.P3 = SystemGpioMode_Alternate;
    SystemGpio.A.Function.P2 = 7;
    SystemGpio.A.Function.P3 = 7;
    
    // TODO: Create pin a sets enum to pass in to configure ports inside
    SystemUartInit(&SystemUart.U2, &uartRingBuf, UART_BAUD);
    
    bool prevState = false;

    while(1)
    {
        bool state = SystemGpio.A.Input.P0;
        for(volatile int i = 0; i < 10000; i++);
        if(state == SystemGpio.A.Input.P0)
        {
            if(state && !prevState) {
                SystemGpio.D.Output.P15 = !SystemGpio.D.Output.P15;
                SystemUart.U2.Data = 'A';
                prevState = true;
            } else if(!state && prevState) {
                prevState = false;
            }
        }
    }
    
    while(1);
    return 0;
}

