/*
 * TR2 Robot Controller Application
 */

#include <stdint.h>
#include <stdbool.h>

#include "SystemResetClock.h"
#include "SystemInterrupts.h"

#include "TrProtocol.h"

int main(void)
{
    SystemIrqEnable();
    
    /*
    // Configure the PLL
    SystemPll.PllPrescaler = 16;
    SystemPll.Multiplier = 300;
    SystemPll.SystemClockPrescaler = SystemPllMainPrescaler_2;
    SystemPll.ClockSource = SystemPllClockSource_Hsi;
    
    SystemClockControl.PllEnabled = true;
    while(!SystemClockControl.PllReady);
    
    SystemClockConfig.AhbPrescaler = 0x09;
    SystemClockConfig.ClockSource = SystemClockSource_Pll;
    
    // Enable chip select lines
    SystemClockEnabled.GpioG = true;

    // As outputs
    SystemGpioG.Speed.P4 = SystemGpioSpeed_High;
    SystemGpioG.Mode.P4 = SystemGpioMode_Output;
    
    while(1)
    {
        SystemGpioG.Set.P4 = true;
        SystemGpioG.Reset.P4 = true;
        SystemGpioG.Set.P4 = true;
        SystemGpioG.Reset.P4 = true;
        SystemGpioG.Set.P4 = true;
        SystemGpioG.Reset.P4 = true;
        SystemGpioG.Set.P4 = true;
        SystemGpioG.Reset.P4 = true;
        SystemGpioG.Set.P4 = true;
        SystemGpioG.Reset.P4 = true;
        SystemGpioG.Set.P4 = true;
        SystemGpioG.Reset.P4 = true;
        SystemGpioG.Set.P4 = true;
        SystemGpioG.Reset.P4 = true;
        SystemGpioG.Set.P4 = true;
        SystemGpioG.Reset.P4 = true;
        SystemGpioG.Set.P4 = true;
        SystemGpioG.Reset.P4 = true;
        SystemGpioG.Set.P4 = true;
        SystemGpioG.Reset.P4 = true;
    }
    
    while(1);
    */
    
    TrInit();

    while(1)
    {
        TrParseCommand();
    }
    
    return 0;
}

