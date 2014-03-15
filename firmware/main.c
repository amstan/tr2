/*
 * Base C file for the STM32F4 Bare Metal Bring Up
 */

#include <stdint.h>

#include "SystemResetClock.h"
#include "SystemGpio.h"

int main(void)
{
    // GPIO Config
    SystemClockEnabled.GpioE = true;
    
    SystemGpio.E.Mode.P12 = SystemGpioMode_Output;
    SystemGpio.E.Mode.P13 = SystemGpioMode_Output;
    SystemGpio.E.Mode.P14 = SystemGpioMode_Output;
    SystemGpio.E.Mode.P15 = SystemGpioMode_Output;
    
    while(1)
    {
        for(int i = 12; i <= 15; i++)
        {
            SystemGpio.E.Output.Port = (1 << i);
            
            for(volatile int j = 0; j < 100000; j++);
        }
    }
    
    return 0;
}

