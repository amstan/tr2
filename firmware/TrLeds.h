/*
 * Tr2 Robot Controller Board LEDs
 */

#ifndef TRLEDS_H
#define TRLEDS_H

#include <stdint.h>
#include <stdbool.h>

#include "SystemResetClock.h"
#include "SystemGpio.h"

#define LED_COUNT 4
#define LED_START 12

/* Initialization *************************************************************/

void TrLedsInit(void);
bool TrLedsValidateNum(uint32_t ledNum);

/* Control ********************************************************************/

bool TrLedsSet(uint32_t ledNum);
bool TrLedsClear(uint32_t ledNum);
bool TrLedsToggle(uint32_t ledNum);

/* Power LED ******************************************************************/

bool TrPowerLedSet(bool state);

#endif
