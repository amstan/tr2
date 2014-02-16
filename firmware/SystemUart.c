/*
 * STM32F4 UART Driver Implementation
 */

#include "SystemUart.h"

/* Buffers for the UART Modules ***********************************************/

volatile SystemRingBuffer_t *uart1buf;
volatile SystemRingBuffer_t *uart2buf;
volatile SystemRingBuffer_t *uart3buf;
volatile SystemRingBuffer_t *uart4buf;
volatile SystemRingBuffer_t *uart5buf;
volatile SystemRingBuffer_t *uart6buf;

/* Initialization *************************************************************/

bool SystemUartInit(volatile SystemUartModule_t *uart,
    volatile SystemRingBuffer_t *buf,
    uint32_t baud)
{
    if(buf == NULL)
    {
        return false;
    }
    
    if(uart == &SystemUart.U1)
    {
        uart1buf = buf;
        SystemNvic.SetEnable.Usart1 = true;
        PeripheralClockEnabled.Usart1 = true;
    }
    else if(uart == &SystemUart.U2)
    {
        uart2buf = buf;
        SystemNvic.SetEnable.Usart2 = true;
        PeripheralClockEnabled.Usart2 = true;
    }
    else if(uart == &SystemUart.U3)
    {
        uart3buf = buf;
        SystemNvic.SetEnable.Usart3 = true;
        PeripheralClockEnabled.Usart3 = true;
    }
    else if(uart == &SystemUart.U4)
    {
        uart4buf = buf;
        SystemNvic.SetEnable.Uart4 = true;
        PeripheralClockEnabled.Uart4 = true;
    }
    else if(uart == &SystemUart.U5)
    {
        uart5buf = buf;
        SystemNvic.SetEnable.Uart5 = true;
        PeripheralClockEnabled.Uart5 = true;
    }
    else if(uart == &SystemUart.U6)
    {
        uart6buf = buf;
        SystemNvic.SetEnable.Usart6 = true;
        PeripheralClockEnabled.Usart6 = true;
    }
    else
    {
        return false;
    }

    uart->Config.Baud.Mantissa =
        F_CPU / (8 * (2 - uart->Config.OversampleMode) * baud);
    uart->Config.Baud.Fraction =
        (16 * F_CPU) / (8 * (2 - uart->Config.OversampleMode) * baud);
    
    uart->Config.RxEnabled = true;
    uart->Config.TxEnabled = true;
    uart->Config.TxDoneIntEnabled = true;
    uart->Config.RxDoneIntEnabled = true;
    uart->Config.Enabled = true;
    
    return true;
}

/* Utility ********************************************************************/

volatile SystemRingBuffer_t *SystemUartRingBuf(
    volatile SystemUartModule_t *uart)
{
    if(uart == &SystemUart.U1)
    {
        return uart1buf;
    }
    else if(uart == &SystemUart.U2)
    {
        return uart2buf;
    }
    else if(uart == &SystemUart.U3)
    {
        return uart3buf;
    }
    else if(uart == &SystemUart.U4)
    {
        return uart4buf;
    }
    else if(uart == &SystemUart.U5)
    {
        return uart5buf;
    }
    else if(uart == &SystemUart.U6)
    {
        return uart6buf;
    }
    else
    {
        return NULL;
    }
}

/* Transmit/Receive ***********************************************************/

bool SystemUartTx(volatile SystemUartModule_t *uart, const uint32_t data)
{
    volatile SystemRingBuffer_t *buf = SystemUartRingBuf(uart);
    
    if(buf != NULL)
    {
        if(uart->Status.TxEmpty)
        {
            uart->Data = data;
        }
        else
        {
            while(!SystemRingBufferWrite(buf, data));
        }
        
        return true;
    }
    else
    {
        return false;
    }
}

bool SystemUartTxBuf(volatile SystemUartModule_t *uart,
    const uint32_t *data,
    const uint32_t length)
{
    volatile SystemRingBuffer_t *buf = SystemUartRingBuf(uart);
   
    if(buf != NULL)
    {
        for(uint32_t i = 0; i < length; i++)
        {
            if(i == 0 && uart->Status.TxEmpty)
            {
                uart->Data = data[i];
            }
            else
            {
                while(!SystemRingBufferWrite(buf, data[i]));
            }
        }
        
        return true;
    }
    else
    {
        return false;
    }
}

bool SystemUartTxStr(volatile SystemUartModule_t *uart, const char *str)
{
    volatile SystemRingBuffer_t *buf = SystemUartRingBuf(uart);
   
    if(buf != NULL)
    {
        for(uint32_t i = 0; str[i] != '\0'; i++)
        {
            if(i == 0 && uart->Status.TxEmpty)
            {
                uart->Data = str[i];
            }
            else
            {
                while(!SystemRingBufferWrite(buf, str[i]));
            }
        }
        
        return true;
    }
    else
    {
        return false;
    }
}


/* Interrupt Handlers *********************************************************/

void __attribute__ ((interrupt ("IRQ"))) IsrUsart2(void)
{
    if(SystemUart.U2.Status.TxComplete)
    {
        uint32_t nextData = 0;
        if(SystemRingBufferRead(uart2buf, &nextData))
        {
            SystemUart.U2.Data = nextData;
        }
        else
        {
            SystemUart.U2.Status.TxComplete = false;
        }
    }
    else if(SystemUart.U2.Status.RxComplete)
    {
        SystemUart.U2.Status.RxComplete = false;
    }
}

