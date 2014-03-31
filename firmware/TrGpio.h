/*
 * TR2 Industrial GPIO
 */

#ifndef TRGPIO_H
#define TRGPIO_H

#include <stdint.h>
#include <stdbool.h>

#include "SystemResetClock.h"
#include "SystemGpio.h"

#define NUM_CHANNELS 8

void TrGpioInit();
bool TrGpioGet(int channelNum, bool *state);

#endif

