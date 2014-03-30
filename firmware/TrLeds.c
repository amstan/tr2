/*
 * Tr2 Robot Controller Board LEDs Driver
 */

#include "TrLeds.h"

/* Initialization *************************************************************/

void TrLedsInit(void)
{
    // Enable clock rates
    SystemClockEnabled.GpioE = true;
    
    // Enable outputs
    SystemGpioE.Mode.P12 = SystemGpioMode_Output;
    SystemGpioE.Mode.P13 = SystemGpioMode_Output;
    SystemGpioE.Mode.P14 = SystemGpioMode_Output;
    SystemGpioE.Mode.P15 = SystemGpioMode_Output;

    // Initial state is off
    SystemGpioE.Reset.P12 = true;
    SystemGpioE.Reset.P13 = true;
    SystemGpioE.Reset.P14 = true;
    SystemGpioE.Reset.P15 = true;

    SystemGpioE.Mode.P5 = SystemGpioMode_Output;
    SystemGpioE.Reset.P5 = true;
}

bool TrLedsValidateNum(uint32_t ledNum)
{
    return ledNum < LED_COUNT;
}

/* Control ********************************************************************/

bool TrLedsSet(uint32_t ledNum)
{
    if(TrLedsValidateNum(ledNum))
    {
        SystemGpioE.Set.Port |= (1 << (ledNum + LED_START));
        return true;
    }
    
    return false;
}

bool TrLedsClear(uint32_t ledNum)
{
    if(TrLedsValidateNum(ledNum))
    {
        SystemGpioE.Reset.Port |= (1 << (ledNum + LED_START));
        return true;
    }
    
    return false;
}

bool TrLedsToggle(uint32_t ledNum)
{
    if(TrLedsValidateNum(ledNum))
    {
        SystemGpioE.Output.Port ^= (1 << (ledNum + LED_START));
        return true;
    }
    
    return false;
}

/* Power LED ******************************************************************/

void TrPowerLedSet(bool state)
{
    SystemGpioE.Output.P5 = !state;
}

