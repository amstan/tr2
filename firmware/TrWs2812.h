/*
 * TR2 External WS2812 LEDs
 */

#ifndef TRWS2812_H
#define TRWS2812_H

#include <stdio.h>

#include "SystemGpio.h"

#define NUM_LEDS_0 120
#define NUM_LEDS_1 0

typedef struct TrWs2812Color_t {
    uint8_t Green;
    uint8_t Red;
    uint8_t Blue;
} TrWs2812Color_t;

typedef struct TrWs2812Buf_t {
    TrWs2812Color_t *Buffer;
    uint32_t Length;
    volatile SystemGpioModule_t *Port;
    uint32_t Pin;
} TrWs2812Buf_t;

void TrWs2812Init();

bool TrWs2812SetRange(uint32_t channel,
    uint32_t startIndex,
    uint32_t stopIndex,
    TrWs2812Color_t color);

#endif
