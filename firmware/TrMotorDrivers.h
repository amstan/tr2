/*
 * Tr2 Board Motor Drivers
 */

#ifndef TRMOTORDRIVERS_H
#define TRMOTORDRIVERS_H

#include <stdbool.h>
#include <stdint.h>

#include "SystemSpi.h"

#include "L6470.h"

#define MOTOR_COUNT 4
#define MOTORCS_START 4

/* Initialization *************************************************************/

void TrMotorDriversInit(void);
bool TrMotorDriversValidateNum(uint32_t driverNum);

/* Commands *******************************************************************/

bool TrMotorRawSpi(uint32_t driverNum,
    uint32_t *buf,
    uint32_t length);

#endif
