/*
 * Base C file for the STM32F4 Bare Metal Bring Up
 */

#include <stdint.h>

#include "SystemResetClock.h"
#include "SystemGpio.h"

#define LED_BLUE 15

int main(void)
{
    PeripheralClockEnabled.GpioD = true;

    SystemGpio[SystemGpioD].Mode.Pins.P15 = SystemGpioMode_Output;
    
    while(1)
    {
        SystemGpio[SystemGpioD].Set.Pins.P15 = true;
        for(int i = 0; i < 400000; i++);
        SystemGpio[SystemGpioD].Reset.Pins.P15 = true;
        for(int i = 0; i < 400000; i++);
    }
    
    while(1);
    return 0;
}

