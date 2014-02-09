/*
 * Base C file for the STM32F4 Bare Metal Bring Up
 */

#include <stdint.h>

#include "SystemResetClock.h"
#include "SystemGpio.h"

int main(void)
{
    PeripheralClockEnabled.GpioA = true;
    PeripheralClockEnabled.GpioD = true;

    SystemGpio[SystemGpioA].Mode.P0 = SystemGpioMode_Input;
    SystemGpio[SystemGpioD].Mode.P15 = SystemGpioMode_Output;
    
    while(1)
    {
        bool state = SystemGpio[SystemGpioA].Input.P0;
        SystemGpio[SystemGpioD].Output.P15 = state;
    }
    
    while(1);
    return 0;
}

