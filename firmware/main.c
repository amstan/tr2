/*
 * TR2 Robot Controller Application
 */

#include <stdint.h>
#include <stdbool.h>

#include "SystemResetClock.h"
#include "SystemInterrupts.h"
#include "SystemGpio.h"
#include "SystemUart.h"

#include "TrLeds.h"
#include "TrProtocol.h"

int main(void)
{
    SystemIrqEnable();
    
    TrLedsInit();
    TrProtocolInit();

    while(1)
    {
        TrParseCommand();
    }
    
    return 0;
}

