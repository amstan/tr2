/*
 * TR2 Protocol
 */

#ifndef TRPROTOCOL_H
#define TRPROTOCOL_H

#include <stdint.h>
#include <stdbool.h>

#include "SystemUart.h"
#include "SystemGpio.h"

#include "TrLeds.h"
#include "TrMotorDrivers.h"
#include "TrWs2812.h"

#define UART_BUFSIZE 256
#define UART_BAUD 115200
#define CMD_BUFSIZE 512

/* Protocol Message Classes ***************************************************/

typedef enum TrMessageClass_t {
    TrMessageClass_Nop,
    TrMessageClass_Protocol,
    TrMessageClass_UserLed,
    TrMessageClass_MotorDriver,
    TrMessageClass_Ws2812
} TrMessageClass_t;

/* Protocol Message Types *****************************************************/

typedef enum TrProtocolCommand_t {
    TrProtocolCommand_Nop,
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

typedef enum TrMotorDriverCommand_t {
    TrMotorDriverCommand_RawSpi
} TrMotorDriverCommand_t;

typedef enum TrWs2812Command_t {
    TrWs2812Command_WriteRange,
    TrWs2812Command_WriteBuffer
} TrWs2812Command_t;

/* Core Protocol **************************************************************/

void TrInit(void);
void TrParseCommand(void);

void TrBadCrc(void);
void TrAcknowledge(void);
void TrNegativeAcknowledge(void);
void TrInvalidMessageClass(void);

bool TrValidateChecksum(uint32_t *buf, uint32_t length);
void TrAppendChecksum(uint32_t *buf, uint32_t length);
uint16_t TrComputeChecksum(uint32_t *buf, uint32_t length);

/* Protocol *******************************************************************/

void TrParseProtocolCommand(uint32_t *buf, uint32_t *length);

/* User LEDs ******************************************************************/

void TrParseUserLedCommand(uint32_t *buf, uint32_t *length);

/* Motor Drivers **************************************************************/

void TrParseMotorDriverCommand(uint32_t *buf, uint32_t *length);

/* WS2812 *********************************************************************/

void TrParseWs2812Command(uint32_t *buf, uint32_t *length);

#endif

