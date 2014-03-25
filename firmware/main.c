/*
 * Base C file for the STM32F4 Bare Metal Bring Up
 */

#include <stdint.h>

#include "SystemResetClock.h"
#include "SystemInterrupts.h"
#include "SystemGpio.h"
#include "SystemUart.h"

#define UART_BUFSIZE 256
#define UART_BAUD 9600

void userLedInit(void);
void ftdiUartInit(void);

void parseUart(void);

typedef enum TrCommandState_t {
    TrCommandState_Idle,
    TrCommandState_Classified,
    TrCommandState_Typed,
    TrCommandState_Parameter1,
    TrCommandState_Parameter2,
    TrCommandState_Parameter3,
    TrCommandState_Parameter4
} TrCommandState_t;

typedef enum TrMessageClass_t {
    TrMessageClass_UserLed
} TrMessageClass_t;

typedef enum TrUserLedCommand_t {
    TrUserLedCommand_Enable,
    TrUserLedCommand_Disable,
    TrUserLedCommand_Toggle,
    TrUserLedCommand_Acknowledge,
    TrUserLedCommand_NegativeAcknowledge
} TrUserLedCommand_t;

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

    uint32_t uartBuf[UART_BUFSIZE];
    
    while(1)
    {
        for(int i = 12; i <= 15; i++)
        {
            SystemGpio.E.Output.Port = (1 << i);
            
            for(volatile int j = 0; j < 100000; j++);
        }
        
        bool parsingCommand = false;
        uint32_t bytesToRead = SystemUartBytesToRead(&SystemUart1);
        
        SystemUartRxBuf(&SystemUart1, uartBuf, bytesToRead);
        SystemUartTxBuf(&SystemUart1, uartBuf, bytesToRead);
        
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
    
    // Enable outputs and initital state is cleared
    SystemGpio.E.Mode.P12 = SystemGpioMode_Output;
    SystemGpio.E.Mode.P13 = SystemGpioMode_Output;
    SystemGpio.E.Mode.P14 = SystemGpioMode_Output;
    SystemGpio.E.Mode.P15 = SystemGpioMode_Output;
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

