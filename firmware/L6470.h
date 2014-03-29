/*
 * Driver for the L6470 Stepper Driver
 */

#ifndef L6470_H
#define L6470_H

#include <stdint.h>
#include <stdbool.h>

#include "SystemGpio.h"
#include "SystemSpi.h"

/* Commands *******************************************************************/

void L6470RawSpi(volatile SystemSpiModule_t *spi,
    uint32_t *buf,
    uint32_t length,
    volatile SystemGpioModule_t *csPort,
    uint32_t csPin);

#endif
