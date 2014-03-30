/*
 * TR2 Robot Controller Application
 */

#include <stdint.h>
#include <stdbool.h>

#include "SystemResetClock.h"
#include "SystemInterrupts.h"

#include "TrLeds.h"
#include "TrProtocol.h"

__attribute__((optimize("unroll-loops")))
void writeWs2812(uint8_t *buf)
{
    for(volatile int i = 0; i < 10000; i++);
    
    SystemGpioE.Set.P11 = true;
    
    for(int i = 0; i < 360; i++)
    {
        for(int j = 7; j >= 0; j--)
        {
            bool bit = (buf[i] & (1 << j)) != 0;
            SystemGpioE.Output.P9 = true;
            SystemGpioE.Output.P9 = true;
            SystemGpioE.Output.P9 = true;
            SystemGpioE.Output.P9 = true;
            SystemGpioE.Output.P9 = bit;
            SystemGpioE.Output.P9 = bit;
            SystemGpioE.Output.P9 = bit;
            SystemGpioE.Output.P9 = false;
            SystemGpioE.Output.P9 = false;
            SystemGpioE.Output.P9 = false;
        }
    }

    SystemGpioE.Reset.P11 = true;
}

int main(void)
{
    SystemIrqEnable();
    
    TrInit();
    
    SystemGpioE.Mode.P9 = SystemGpioMode_Output;
    SystemGpioE.Mode.P11 = SystemGpioMode_Output;
    SystemGpioE.Reset.P9 = true;
    SystemGpioE.Reset.P11 = true;

    uint8_t ledBytes[360];
    
    uint16_t color = 0;
    bool up = true;
    uint8_t limitIndex = 0;
    uint8_t limit[] = { 10, 250, 210, 180, 40, 255, 210, 120 };

    while(1)
    {
        for(int i = 0; i < 360; i++)
        {
                ledBytes[i] = color;
        }

        writeWs2812(ledBytes);

        for(volatile int i = 0; i < 10000; i++);

        if(up)
        {
            color++;

            if(color == limit[limitIndex])
            {
                up = false;
            }
        }
        else
        {
            color--;

            if(color == 0)
            {
                up = true;
                limitIndex++;

                if(limitIndex >= 8)
                    limitIndex = 0;
             }
         }
    }

    while(1)
    {
        TrParseCommand();
    }
    
    return 0;
}

