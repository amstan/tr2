/*
 * TR2 Protocol
 */

#ifndef TRPROTOCOL_H
#define TRPROTOCOL_H

#include <stdint.h>
#include <stdbool.h>

#include "SystemUart.h"
#include "SystemGpio.h"

#define CMD_BUFSIZE 512

/* Protocol Message Classes ***************************************************/

typedef enum TrMessageClass_t {
    TrMessageClass_UserLed,
    TrMessageClass_Protocol,
    TrMessageClass_MotorDriver
} TrMessageClass_t;

/* Protocol Message Types *****************************************************/

typedef enum TrProtocolCommand_t {
    TrProtocolCommand_BadCrc,
    TrProtocolCommand_Acknowledge,
    TrProtocolCommand_NegativeAcknowledge,
    TrProtocolCommand_InvalidMessageClass
} TrProtocolCommand_t;

typedef enum TrUserLedCommand_t {
    TrUserLedCommand_Enable,
    TrUserLedCommand_Disable,
    TrUserLedCommand_Toggle
} TrUserLedCommand_t;

/* Core Protocol **************************************************************/

void TrParseCommand(void);

void TrBadCrc(void);
void TrAcknowledge(void);
void TrNegativeAcknowledge(void);
void TrInvalidMessageClass(void);

bool TrValidateChecksum(uint32_t *buf, uint32_t length);
void TrAppendChecksum(uint32_t *buf, uint32_t length);
uint16_t TrComputeChecksum(uint32_t *buf, uint32_t length);

/* User LEDs ******************************************************************/

#define LED_COUNT 4
#define LED_START 12

void TrParseUserLedCommand(uint32_t *buf, uint32_t *length);

#endif

