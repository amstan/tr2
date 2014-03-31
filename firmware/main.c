/*
 * TR2 Robot Controller Application
 */

#include <stdint.h>
#include <stdbool.h>

#include "SystemResetClock.h"
#include "SystemInterrupts.h"

#include "TrProtocol.h"
#include "TrWs2812.h"


int main(void)
{
    SystemIrqEnable();
    
    TrInit();

    while(1)
    {
        TrParseCommand();
    }
    
    return 0;
}

