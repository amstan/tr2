/*
 * Base C file for the STM32F4 Bare Metal Bring Up
 */

#include <stdint.h>

#include "SystemResetClock.h"
#include "SystemGpio.h"

int main(void)
{
    PeripheralClockEnabled.GpioD = true;

    SystemGpio[SystemGpioD].Mode.Pins.P15 = SystemGpioMode_Output;
    
    while(1)
    {
        SystemGpio[SystemGpioD].Set.Pins.P15 = true;
        for(int i = 0; i < 100000; i++);
        SystemGpio[SystemGpioD].Reset.Pins.P15 = true;
        for(int i = 0; i < 200000; i++);
    }
    
    while(1);
    return 0;
}

