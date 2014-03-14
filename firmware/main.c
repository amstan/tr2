/*
 * Base C file for the STM32F4 Bare Metal Bring Up
 */

#include <stdint.h>
#include <string.h>

#include "SystemResetClock.h"
#include "SystemGpio.h"
#include "SystemUart.h"
#include "SystemSpi.h"
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
    SystemClockEnabled.GpioB = true;
    SystemClockEnabled.GpioD = true;
    
    SystemGpio.A.Mode.P0 = SystemGpioMode_Input;
    SystemGpio.D.Mode.P15 = SystemGpioMode_Output;
    SystemGpio.D.Mode.P14 = SystemGpioMode_Output;
    
    // USART3 Config
    SystemGpio.A.Mode.P2 = SystemGpioMode_Alternate;
    SystemGpio.A.Mode.P3 = SystemGpioMode_Alternate;
    SystemGpio.A.Function.P2 = 7;
    SystemGpio.A.Function.P3 = 7;
    
    SystemUartInit(&SystemUart.U2, &uartBuf, UART_BAUD);

    // SPI1 Config
    SystemGpio.B.Mode.P13 = SystemGpioMode_Alternate;
    SystemGpio.B.Mode.P14 = SystemGpioMode_Alternate;
    SystemGpio.B.Mode.P15 = SystemGpioMode_Alternate;
    SystemGpio.B.Speed.P13 = SystemGpioSpeed_High;
    SystemGpio.B.Speed.P14 = SystemGpioSpeed_High;
    SystemGpio.B.Speed.P15 = SystemGpioSpeed_High;
    SystemGpio.B.Function.P13 = 5;
    SystemGpio.B.Function.P14 = 5;
    SystemGpio.B.Function.P15 = 5;

    SystemClockEnabled.SPI2 = true;
    SystemSpi.S2.Config.SlaveManageEnable = true;
    SystemSpi.S2.Config.InternalSelect = true;
    SystemSpi.S2.Config.DeviceMode = SystemSpiDeviceMode_Master;
    SystemSpi.S2.Config.Prescaler = SystemSpiPrescaler_128;
    SystemSpi.S2.Config.Enabled = true;
    
    while(1)
    {
        for(uint16_t i = 1; i <= 4; i++)
        {
            SpiWriteRead(&SystemSpi.S2, i);
        }
    }

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

