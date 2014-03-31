/*
 * TR2 External WS2812 LEDs
 */

#include "TrWs2812.h"

TrWs2812Color_t channel0Buf[NUM_LEDS_0];
TrWs2812Color_t channel1Buf[NUM_LEDS_1];

TrWs2812Buf_t channel0 = {
    .Buffer = channel0Buf,
    .Length = NUM_LEDS_0,
    .Port = &SystemGpioE,
    .Pin = 9
};

TrWs2812Buf_t channel1 = {
    .Buffer = channel1Buf,
    .Length = NUM_LEDS_1,
    .Port = &SystemGpioE,
    .Pin = 11
};

void TrWs2812Write(TrWs2812Buf_t *buf);
TrWs2812Buf_t *TrWs2812GetBuf(uint32_t channel);
inline void TrWs2812WriteByte(uint8_t byte,
    volatile SystemGpioModule_t *port,
    uint32_t pin);

void TrWs2812Init()
{
    SystemGpioE.Mode.P9 = SystemGpioMode_Output;
    SystemGpioE.Mode.P11 = SystemGpioMode_Output;
    SystemGpioE.Reset.P9 = true;
    SystemGpioE.Reset.P11 = true;
}

bool TrWs2812SetRange(uint32_t channel,
    uint32_t startIndex,
    uint32_t stopIndex,
    TrWs2812Color_t color)
{
    TrWs2812Buf_t *buf = TrWs2812GetBuf(channel);

    if(buf != NULL)
    {
        for(int i = startIndex; i < stopIndex; i++)
        {
            buf->Buffer[i] = color;
        }

        TrWs2812Write(buf);
        
        return true;
    }

    return false;
}

TrWs2812Buf_t *TrWs2812GetBuf(uint32_t channel)
{
    if(channel == 0)
    {
        return &channel0;
    }
    else if(channel == 1)
    {
        return &channel1;
    }
    else
    {
        return NULL;
    }
}

__attribute__((optimize("unroll-loops")))
void TrWs2812Write(TrWs2812Buf_t *buf)
{
    for(volatile int i = 0; i < 100; i++);
    
    for(int i = 0; i < buf->Length; i++)
    {
        TrWs2812WriteByte(buf->Buffer[i].Green, buf->Port, buf->Pin);
        TrWs2812WriteByte(buf->Buffer[i].Red, buf->Port, buf->Pin);
        TrWs2812WriteByte(buf->Buffer[i].Blue, buf->Port, buf->Pin);
    }
}

__attribute__((optimize("unroll-loops")))
__attribute__((always_inline))
inline void TrWs2812WriteByte(uint8_t byte,
    volatile SystemGpioModule_t *port,
    uint32_t pin)
{
    for(int j = 7; j >= 0; j--)
    {
        bool bit = (byte & (1 << j)) == 0;
        port->Output.Port |= (1 << pin);
        __asm__("nop");
        __asm__("nop");
        port->Output.Port ^= (bit << pin);
        __asm__("nop");
        __asm__("nop");
        __asm__("nop");
        __asm__("nop");
        __asm__("nop");
        port->Output.Port &= ~(1 << pin);
        __asm__("nop");
        __asm__("nop");
        __asm__("nop");
        __asm__("nop");
        __asm__("nop");
        __asm__("nop");
        __asm__("nop");
        __asm__("nop");
        __asm__("nop");
        __asm__("nop");
        __asm__("nop");
    }
}

