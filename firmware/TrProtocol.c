/*
 * TR2 Protocol Implementation
 */

#include "TrProtocol.h"

/* Core Protocol **************************************************************/

void TrParseCommand(void)
{
    static uint32_t commandBuf[CMD_BUFSIZE];
    static uint32_t bytesReceived = 0;
    
    int32_t bytesToRead = SystemUartBytesToRead(&SystemUart1);
    if(bytesToRead)
    {
        SystemUartRxBuf(&SystemUart1, &commandBuf[bytesReceived], bytesToRead);
        bytesReceived += bytesToRead;
    
        TrMessageClass_t messageClass = commandBuf[0];

        switch(messageClass)
        {
            case TrMessageClass_UserLed:
                TrParseUserLedCommand(commandBuf, &bytesReceived);
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
        TrBadCrc();
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

/* User LEDs ******************************************************************/

void TrParseUserLedCommand(uint32_t *buf, uint32_t *length)
{
    if(*length < 5)
    {
        return;
    }
    
    if(TrValidateChecksum(buf, *length))
    {
        TrUserLedCommand_t command = buf[1];
        uint32_t ledNum = buf[2];
        
        if(ledNum >= LED_COUNT)
        {
            TrNegativeAcknowledge();
        }
        else
        {
            switch(command)
            {
                case TrUserLedCommand_Enable:
                    SystemGpio.E.Set.Port |= (1 << (ledNum + LED_START));
                    TrAcknowledge();
                    break;
                case TrUserLedCommand_Disable:
                    SystemGpio.E.Output.Port &= ~(1 << (ledNum + LED_START));
                    TrAcknowledge();
                    break;
                case TrUserLedCommand_Toggle:
                    SystemGpio.E.Output.Port ^= (1 << (ledNum + LED_START));
                    TrAcknowledge();
                    break;
                default:
                    TrNegativeAcknowledge();
                    break;
            }
        }
    }

    *length = 0;
}
