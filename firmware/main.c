/*
 * Base C file for the STM32F4 Bare Metal Bring Up
 */

#include <stdint.h>
#include <stdbool.h>

#include "SystemResetClock.h"
#include "SystemInterrupts.h"
#include "SystemGpio.h"
#include "SystemUart.h"

#include "TrProtocol.h"

#define UART_BUFSIZE 256
#define UART_BAUD 115200

#define cmd_bufsize 512

void userLedInit(void);
void ftdiUartInit(void);

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
    // Enable global interrupts
    SystemIrqEnable();
    
    // User LED configuration
    userLedInit();
    ftdiUartInit();

    while(1)
    {
        TrParseCommand();
    }
    
    return 0;
}

/*
 * Initialize the user LEDs
 */
void userLedInit(void)
{
    // Enable clock rates
    SystemClockEnabled.GpioE = true;
    
    // Enable outputs
    SystemGpio.E.Mode.P12 = SystemGpioMode_Output;
    SystemGpio.E.Mode.P13 = SystemGpioMode_Output;
    SystemGpio.E.Mode.P14 = SystemGpioMode_Output;
    SystemGpio.E.Mode.P15 = SystemGpioMode_Output;

    // Initial state is off
    SystemGpio.E.Reset.P12 = true;
    SystemGpio.E.Reset.P13 = true;
    SystemGpio.E.Reset.P14 = true;
    SystemGpio.E.Reset.P15 = true;
}

/*
 * Initialize the FTDI UART
 */
void ftdiUartInit(void)
{
    // Enable the UART
    SystemClockEnabled.GpioA = true;
    
    // Configure the UART
    SystemGpio.A.Mode.P9 = SystemGpioMode_Alternate;
    SystemGpio.A.Mode.P10 = SystemGpioMode_Alternate;
    SystemGpio.A.Function.P9 = 7;
    SystemGpio.A.Function.P10 = 7;

    SystemUartInit(&SystemUart1, &uartBuf, UART_BAUD);
}

