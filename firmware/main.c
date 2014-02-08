/*
 * Base C file for the STM32F4 Bare Metal Bring Up
 */

#include <stdint.h>

#include "SystemResetClock.h"
#include "SystemGpio.h"

#define PORTD_BASE 0x40020C00
#define PORTD_MODE *((uint32_t *)(PORTD_BASE + 0x00))
#define PORTD *((uint32_t *)(PORTD_BASE + 0x14))

#define LED_BLUE 15

int main(void)
{
    PeripheralClockEnabled.GpioD = true;
    SystemGpioPortMode.Pins.P15 = SystemGpioMode_Output;
    
    while(1)
    {
        PORTD = (1 << LED_BLUE);
        for(int i = 0; i < 400000; i++);
        PORTD = (0 << LED_BLUE);
        for(int i = 0; i < 400000; i++);
    }
    
    while(1);
    return 0;
}

