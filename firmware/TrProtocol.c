/*
 * TR2 Protocol Implementation
 */

#include "TrProtocol.h"

/* Core Protocol **************************************************************/

uint32_t uartTxBuf[UART_BUFSIZE];
uint32_t uartRxBuf[UART_BUFSIZE];
SystemUartBuffer_t uartBuf = {
    .Tx.Buffer = uartTxBuf,
    .Tx.Size = UART_BUFSIZE,
    .Rx.Buffer = uartRxBuf,
    .Rx.Size = UART_BUFSIZE
};

void TrInit(void)
{
    TrLedsInit();
    
    // Configure the PLL for 42MHz. TODO: Make a nice clock API
    SystemPll.PllPrescaler = 40;
    SystemPll.Multiplier = 210;
    SystemPll.SystemClockPrescaler = SystemPllMainPrescaler_2;
    SystemPll.ClockSource = SystemPllClockSource_Hsi;
    
    bool pllEnabled = SystemClockEnable(SystemClockType_Pll);
    while(!pllEnabled)
    {
        TrPowerLedSet(true);
        for(volatile int i = 0; i < 500000; i++);
        TrPowerLedSet(false);
        for(volatile int i = 0; i < 500000; i++);
    }
    
    SystemClockConfig.ClockSource = SystemClockSource_Pll;
    
    TrMotorDriversInit();
    TrWs2812Init();
    
    // Enable the UART
    SystemClockEnabled.GpioA = true;
    
    // Configure the UART
    SystemGpioA.Mode.P9 = SystemGpioMode_Alternate;
    SystemGpioA.Mode.P10 = SystemGpioMode_Alternate;
    SystemGpioA.Function.P9 = 7;
    SystemGpioA.Function.P10 = 7;

    SystemUartInit(&SystemUart1, &uartBuf, UART_BAUD);
}

void TrParseCommand(void)
{
    static uint32_t commandBuf[CMD_BUFSIZE];
    static uint32_t bytesReceived = 0;
    
    int32_t bytesToRead = SystemUartBytesToRead(&SystemUart1);
    if(bytesToRead > 0)
    {
        SystemUartRxBuf(&SystemUart1, &commandBuf[bytesReceived], bytesToRead);
        bytesReceived += bytesToRead;
        
        TrMessageClass_t messageClass = commandBuf[0];

        switch(messageClass)
        {
            case TrMessageClass_Nop:
                TrAcknowledge();
                bytesReceived = 0;
                break;
            case TrMessageClass_Protocol:
                TrParseProtocolCommand(commandBuf, &bytesReceived);
                break;
            case TrMessageClass_MotorDriver:
                TrParseMotorDriverCommand(commandBuf, &bytesReceived);
                break;
            case TrMessageClass_UserLed:
                TrParseUserLedCommand(commandBuf, &bytesReceived);
                break;
            case TrMessageClass_Ws2812:
                TrParseWs2812Command(commandBuf, &bytesReceived);
                break;
            default:
                TrInvalidMessageClass();
                bytesReceived = 0;
                break;
        }
    }
}

void TrBadCrc(void)
{
    uint32_t command[4];
    command[0] = TrMessageClass_Protocol;
    command[1] = TrProtocolCommand_BadCrc;

    TrAppendChecksum(command, 2);
    SystemUartTxBuf(&SystemUart1, command, 4);
}

void TrAcknowledge(void)
{
    uint32_t command[4];
    command[0] = TrMessageClass_Protocol;
    command[1] = TrProtocolCommand_Acknowledge;
    
    TrAppendChecksum(command, 2);
    SystemUartTxBuf(&SystemUart1, command, 4);
}

void TrNegativeAcknowledge(void)
{
    uint32_t command[4];
    command[0] = TrMessageClass_Protocol;
    command[1] = TrProtocolCommand_NegativeAcknowledge;

    TrAppendChecksum(command, 2);
    SystemUartTxBuf(&SystemUart1, command, 4);
}

void TrInvalidMessageClass(void)
{
    uint32_t command[4];
    command[0] = TrMessageClass_Protocol;
    command[1] = TrProtocolCommand_InvalidMessageClass;

    TrAppendChecksum(command, 2);
    SystemUartTxBuf(&SystemUart1, command, 4);
}

bool TrValidateChecksum(uint32_t *buf, uint32_t length)
{
    uint16_t checksum = (buf[length - 2] << 8) | buf[length - 1];
    uint16_t computedChecksum = TrComputeChecksum(buf, length);
    
    if(checksum != computedChecksum)
    {
        return false;
    }

    return true;
}

void TrAppendChecksum(uint32_t *buf, uint32_t length)
{
    uint16_t checksum = TrComputeChecksum(buf, length + 2);
    
    buf[length] = (checksum >> 8) & 0xFF;
    buf[length + 1] = checksum & 0xFF;
}

uint16_t TrComputeChecksum(uint32_t *buf, uint32_t length)
{
    uint16_t checksum = 0;
    
    for(uint32_t i = 0; i < length - 2; i++)
    {
        checksum += buf[i];
    }
    
    return checksum;
}

/* Protocol *******************************************************************/

void TrParseProtocolCommand(uint32_t *buf, uint32_t *length)
{
    if(*length < 4)
        return;

    if(!TrValidateChecksum(buf, *length))
    {
        TrBadCrc();
        *length = 0;
        return;
    }

    uint32_t command = buf[1];
    switch(command)
    {
        case TrProtocolCommand_Nop:
            TrAcknowledge();
            break;
        default:
            TrNegativeAcknowledge();
            break;
    }
}

/* User LEDs ******************************************************************/

void TrExecuteLedCommand(bool (*ledCommand)(uint32_t), uint32_t ledNum)
{
    if(ledCommand(ledNum))
    {
        TrAcknowledge();
    }
    else
    {
        TrNegativeAcknowledge();
    }
}

void TrParseUserLedCommand(uint32_t *buf, uint32_t *length)
{
    if(*length < 5)
        return;
    
    if(!TrValidateChecksum(buf, *length))
    {
        TrBadCrc();
        *length = 0;
        return;
    }
    
    TrUserLedCommand_t command = buf[1];
    uint32_t ledNum = buf[2];
    
    switch(command)
    {
        case TrUserLedCommand_Enable:
            TrExecuteLedCommand(&TrLedsSet, ledNum);
            break;
        case TrUserLedCommand_Disable:
            TrExecuteLedCommand(&TrLedsClear, ledNum);
            break;
        case TrUserLedCommand_Toggle:
            TrExecuteLedCommand(&TrLedsToggle, ledNum);
            break;
        default:
            TrNegativeAcknowledge();
            break;
    }
    
    *length = 0;
}

/* Motor Drivers **************************************************************/

void TrParseMotorDriverCommand(uint32_t *buf, uint32_t *length)
{
    if(*length < 5)
        return;
    
    TrMotorDriverCommand_t command = buf[1];
    uint32_t driverNum = buf[2];
    uint32_t spiLength = buf[3];
    
    switch(command)
    {
        case TrMotorDriverCommand_RawSpi:
            if(*length < spiLength + 6)
                return;
            
            if(!TrValidateChecksum(buf, *length))
            {
                TrBadCrc();
                *length = 0;
                return;
            }
            
            if(TrMotorRawSpi(driverNum, &buf[4], spiLength))
            {
                TrAppendChecksum(buf, *length - 2);
                SystemUartTxBuf(&SystemUart1, buf, *length);
            }
            else
            {
                TrNegativeAcknowledge();
            }
            
            *length = 0;
            break;
        default:
            TrNegativeAcknowledge();
            *length = 0;
            break;
    }
}

/* WS2812 *********************************************************************/

void TrParseWs2812Command(uint32_t *buf, uint32_t *length)
{
    if(*length < 5)
        return;

    TrWs2812Command_t command = buf[1];
    uint32_t channel = buf[2];
    
    switch(command)
    {
        case TrWs2812Command_WriteRange:
            if(*length < 12)
                return;
            
            if(!TrValidateChecksum(buf, *length))
            {
                TrBadCrc();
                *length = 0;
                return;
            }
            
            uint32_t startIndex = (buf[3] << 8) | buf[4];
            uint32_t stopIndex = (buf[5] << 8) | buf[6];
            TrWs2812Color_t color = {
                .Red = buf[7],
                .Green = buf[8],
                .Blue = buf[9]
            };

            if(TrWs2812SetRange(channel, startIndex, stopIndex, color))
            {
                TrAcknowledge();
            }
            else
            {
                TrNegativeAcknowledge();
            }
            
            *length = 0;
            break;
        case TrWs2812Command_WriteBuffer:
            TrNegativeAcknowledge();
            *length = 0;
            break;
        default:
            *length = 0;
            TrNegativeAcknowledge();
            break;
    }
}

