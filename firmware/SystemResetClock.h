/*
 * STM32F4 Reset/Clock Driver
 */

#ifndef SYSTEMRESETCLOCK_H
#define SYSTEMRESETCLOCK_H

#include <stdint.h>
#include <stdbool.h>

typedef struct PeripheralClockEnabled_t {
    bool     GpioA   : 1;
    bool     GpioB   : 1;
    bool     GpioC   : 1;
    bool     GpioD   : 1;
    bool     GpioE   : 1;
    bool     GpioF   : 1;
    bool     GpioG   : 1;
    bool     GpioH   : 1;
    bool     GpioI   : 1;
    unsigned /* Pad */ : 23;
} PeripheralClockEnabled_t;

#define ADDR_RCC     0x40023800
#define ADDR_CLOCKEN       0x30

#define PeripheralClockEnabled                                         \
            (*((PeripheralClockEnabled_t *)(ADDR_RCC + ADDR_CLOCKEN)))

#endif
