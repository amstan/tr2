/*
 * STM32F4 GPIO Driver
 */

#ifndef SYSTEMGPIO_H
#define SYSTEMGPIO_H

#include <stdint.h>

typedef enum SystemGpioPort_t {
    SystemGpioPortA,
    SystemGpioPortB,
    SystemGpioPortC,
    SystemGpioPortD,
    SystemGpioPortE,
    SystemGpioPortF,
    SystemGpioPortG,
    SystemGpioPortH,
    SystemGpioPortI,
    SystemGpioPortJ,
    SystemGpioPortK
} SystemGpioPort_t;

typedef enum SystemGpioMode_t {
    SystemGpioMode_Input,
    SystemGpioMode_Output,
    SystemGpioMode_Alternate,
    SystemGpioMode_Analog
} SystemGpioMode_t;

typedef union SystemGpioPortMode_t {
    struct {
        uint32_t P0  : 2;
        uint32_t P1  : 2;
        uint32_t P2  : 2;
        uint32_t P3  : 2;
        uint32_t P4  : 2;
        uint32_t P5  : 2;
        uint32_t P6  : 2;
        uint32_t P7  : 2;
        uint32_t P8  : 2;
        uint32_t P9  : 2;
        uint32_t P10 : 2;
        uint32_t P11 : 2;
        uint32_t P12 : 2;
        uint32_t P13 : 2;
        uint32_t P14 : 2;
        uint32_t P15 : 2;
    } Pins;
    uint32_t Port;
} SystemGpioPortMode_t;

#define ADDR_GPIO       0x40020C00
#define ADDR_GPIO_MODER       0x00

#define SystemGpioPortMode                                            \
            (*((SystemGpioPortMode_t *)(ADDR_GPIO + ADDR_GPIO_MODER)))


#endif

