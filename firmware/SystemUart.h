/*
 * STM32F4 UART Driver
 */

#ifndef SYSTEMUART_H
#define SYSTEMUART_H

#include <stdbool.h>
#include <stdint.h>

/* UART Receiver Mode *********************************************************/

typedef enum SystemUartRxMode_t {
    SystemUartRxMode_Active,
    SystemUartRxMode_Mute
} SystemUartRxMode_t;

/* UART Parity Mode ***********************************************************/

typedef enum SystemUartParity_t {
    SystemUartParity_Odd,
    SystemUartParity_Even
} SystemUartParity_t;

/* UART Wakeup Mode ***********************************************************/

typedef enum SystemUartWakeup_t {
    SystemUartWakeup_Idle,
    SystemUartWakeup_Address
} SystemUartWakeup_t;

/* UART Frame Length **********************************************************/

typedef enum SystemUartFrameLength_t {
    SystemUartFrameLength_8,
    SystemUartFrameLength_9
} SystemUartFrameLength_t;

/* UART Oversample ************************************************************/

typedef enum SystemUartOversample_t {
    SystemUartOversample_16,
    SystemUartOversample_8
} SystemUartOversample_t;

/* UART Line Break Detection Length *******************************************/

typedef enum SystemUartBreakLength_t {
    SystemUartBreakLength_10,
    SystemUartBreakLength_11
} SystemUartBreakLength_t;

/* UART Clock Phase ***********************************************************/

typedef enum SystemUartClockPhase_t {
    SystemUartClockPhase_First,
    SystemUartClockPhase_Second
} SystemUartClockPhase_t;

/* Uart Clock Idle State ******************************************************/

typedef enum SystemUartClockIdle_t {
    SystemUartClockIdle_Low,
    SystemUartClockIdle_High
} SystemUartClockIdle_t;

/* UART Stop Bits *************************************************************/

typedef enum SystemUartStopBits_t {
    SystemUartStopBits_One,
    SystemUartStopBits_Half,
    SystemUartStopBits_Two,
    SystemUartStopBits_OneAndHalf
} SystemUartStopBits_t;

/* UART Sample Bit Method *****************************************************/

typedef enum SystemUartBitSample_t {
    SystemUartBitSample_3,
    SystemUartBitSample_1
} SystemUartBitSample_t;

/* UART Configuration *********************************************************/

typedef union SystemUartConfiguration_t {
    struct {
        //USART_BRR
        uint32_t Fraction  : 4;
        uint32_t Mantissa  : 12;
        unsigned /* Pad */ : 16;
        
        // USART_CR1
        bool     SendBreak           : 1;
        uint32_t RxMode              : 1;
        bool     RxEnabled           : 1;
        bool     TxEnabled           : 1;
        bool     IdleIntEnabled      : 1;
        bool     RxDoneIntEnabled    : 1;
        bool     TxDoneIntEnabled    : 1;
        bool     ParityErrIntEnabled : 1;
        uint32_t ParityMode          : 1;
        bool     ParityEnabled       : 1;
        uint32_t WakeupMode          : 1;
        uint32_t FrameLength         : 1;
        bool     UartEnabled         : 1;
        unsigned /* Pad */           : 1;
        uint32_t OversampleMode      : 1;
        unsigned /* Pad */           : 16;

        // USART_CR2
        uint32_t Address             : 4;
        unsigned /* Pad */           : 1;
        uint32_t LineBreakLength     : 1;
        bool     LineBreakIntEnabled : 1;
        unsigned /* Pad */           : 1;
        bool     LastClockSent       : 1;
        uint32_t ClockPhase          : 1;
        uint32_t ClockIdle           : 1;
        bool     ClockEnabled        : 1;
        uint32_t StopBits            : 2;
        bool     LinEnabled          : 1;
        unsigned /* Pad */           : 16;

        // USART_CR3
        bool     ErrIntEnabled       : 1;
        bool     IrdaEnabled         : 1;
        bool     IrdaLowPower        : 1;
        bool     HalfDuplex          : 1;
        bool     NackEnabled         : 1;
        bool     SmartCardEnabled    : 1;
        bool     RxDmaEnabled        : 1;
        bool     TxDmaEnabled        : 1;
        bool     RtsEnabled          : 1;
        bool     CtsEnabled          : 1;
        bool     CtsIntEnabled       : 1;
        uint32_t BitSampleMethod     : 1;
        unsigned /* Pad */           : 20;
        unsigned /* IrDA/Smart Card */ : 32;
    };
    
    uint32_t Baud      : 16;
    unsigned /* Pad */ : 16;
    uint32_t Config1;
    uint32_t Config2;
    uint32_t Config3;
    unsigned /* IrDA/Smart Card */ : 32;
} SystemUartConfiguration_t;

#endif
