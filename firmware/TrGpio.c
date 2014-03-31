/*
 * TR2 Industrial GPIO
 */

#include "TrGpio.h"

#define NUM_CHANNELS 8

typedef struct IndustrialInput_t {
    volatile SystemGpioModule_t *Port;
    uint32_t Pin;
} IndustrialInput_t;

IndustrialInput_t inputs[] = {
    {
        .Port = &SystemGpioD,
        .Pin = 12
    },
    {
        .Port = &SystemGpioD,
        .Pin = 13
    },
    {
        .Port = &SystemGpioD,
        .Pin = 14
    },
    {
        .Port = &SystemGpioD,
        .Pin = 15
    },
    {
        .Port = &SystemGpioB,
        .Pin = 0
    },
    {
        .Port = &SystemGpioC,
        .Pin = 5
    },
    {
        .Port = &SystemGpioC,
        .Pin = 4
    },
    {
        .Port = &SystemGpioA,
        .Pin = 0
    }
};

bool validateChannelNum(int inputNum)
{
    return inputNum < NUM_CHANNELS;
}

void TrGpioInit()
{
    SystemClockEnabled.GpioA = true;
    SystemClockEnabled.GpioB = true;
    SystemClockEnabled.GpioC = true;
    SystemClockEnabled.GpioD = true;
    
    for(int i = 0; i < NUM_CHANNELS; i++)
    {
        inputs[i].Port->Mode.Port =
            (SystemGpioMode_Input << inputs[i].Pin * 2);
    }
}

bool TrGpioGet(int channelNum, bool *state)
{
    if(validateChannelNum(channelNum))
    {
        IndustrialInput_t input = inputs[channelNum];
        return (input.Port->Input.Port & (1 << input.Pin)) > 0;
    }
    
    return false;
}

