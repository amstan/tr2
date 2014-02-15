/*
 * STM32F4 SPI Driver
 */

#ifndef SYSTEMSPI_H
#define SYSTEMSPI_H

#include <stdint.h>
#include <stdbool.h>

#define ADDR_SPI 0x40003800
#define SystemSpi ((volatile SystemSpi_t *)ADDR_SPI)

/* Clock Phase ****************************************************************/

typedef enum SystemSpiClockPhase_t {
    SystemSpiClockPhase_First,
    SystemSpiClockPhase_Second
} SystemSpiClockPhase_t;

/* Clock Idle State ***********************************************************/

typedef enum SystemSpiClockIdle_t {
    SystemSpiClockIdle_Low,
    SystemSpiClockIdle_High
} SystemSpiClockPolarity_t;

/* Device Mode ****************************************************************/

typedef enum SystemSpiDeviceMode_t {
    SystemSpiDeviceMode_Slave,
    SystemSpiDeviceMode_Master
} SystemSpiDeviceMode_t;

/* Clock Prescaler ************************************************************/

typedef enum SystemSpiPrescaler_t {
    SystemSpiPrescaler_2   = 0x00,
    SystemSpiPrescaler_4   = 0x01,
    SystemSpiPrescaler_8   = 0x02,
    SystemSpiPrescaler_16  = 0x03,
    SystemSpiPrescaler_32  = 0x04,
    SystemSpiPrescaler_64  = 0x05,
    SystemSpiPrescaler_128 = 0x06,
    SystemSpiPrescaler_256 = 0x07
} SystemSpiPrescaler_t;

/* Frame Endianness ***********************************************************/

typedef enum SystemSpiEndianness_t {
    SystemSpiEndianness_MsbFirst,
    SystemSpiEndianness_LsbFirst
} SystemSpiEndianness_t;

/* Frame Size *****************************************************************/

typedef enum SystemSpiFrameSize_t {
    SystemSpiFrameSize_8,
    SystemSpiFrameSize_16
} SystemSpiFrameSize_t;

/* Bidirectional Mode *********************************************************/

typedef enum SystemSpiBidirectionMode_t {
    SystemSpiBidirectionMode_2Wire,
    SystemSpiBidirectionMode_1Wire
} SystemSpiBidirectionMode_t;

/* Frame Format ***************************************************************/

typedef enum SystemSpiFrameFormat_t {
    SystemSpiFrameFormat_Motorola,
    SystemSpiFrameFormat_TI
} SystemSpiFrameFormat_t;

/* SPI Status *****************************************************************/

typedef union SystemSpiStatus_t {
    struct {
        bool     RxFull         : 1;
        bool     TxEmpty        : 1;
        unsigned /* I2S Only */ : 2;
        bool     CrcError       : 1;
        bool     ModeFault      : 1;
        bool     Overrun        : 1;
        bool     Busy           : 1;
        bool     FrameError     : 1;
        unsigned /* Pad */      : 23;
    };
    uint32_t Status    : 9;
    unsigned /* Pad */ : 23;
} SystemSpiStatus_t;

/* SPI Configuration **********************************************************/

typedef union SystemSpiConfiguration_t {
    struct {
        // SPI_CR1
        uint32_t ClockPhase        : 1;
        uint32_t ClockIdle         : 1;
        uint32_t DeviceMode        : 1;
        uint32_t Prescaler         : 3;
        bool     Enabled           : 1;
        uint32_t FrameEndianness   : 1;
        bool     InternalSelect    : 1;
        bool     SlaveManageEnable : 1;
        bool     RxOnly            : 1;
        uint32_t FrameSize         : 1;
        bool     CrcNext           : 1;
        bool     CrcEnabled        : 1;
        bool     OutputEnabled     : 1;
        uint32_t BidirectionMode   : 1;
        unsigned /* Pad */         : 16;

        // SPI_CR2
        bool     RxDmaEnabled      : 1;
        bool     TxDmaEnabled      : 1;
        bool     SSEnabled         : 1;
        unsigned /* Pad */         : 1;
        uint32_t FrameFormat       : 1;
        bool     ErrIntEnabled     : 1;
        bool     RxDoneIntEnabled  : 1;
        bool     TxDoneIntEnabled  : 1;
        unsigned /* Pad */         : 24;
    };
    uint32_t Config1;
    uint32_t Config2;
} SystemSpiConfiguration_t;

/* SPI Register Set ***********************************************************/

typedef struct SystemSpi_t {
    SystemSpiConfiguration_t Config;
    SystemSpiStatus_t Status;
    uint32_t Data        : 16;
    unsigned /* Pad */   : 16;
    uint32_t Polynomial  : 16;
    unsigned /* Pad */   : 16;
    const uint32_t RxCrc : 16;
    unsigned /* Pad */   : 16;
    const uint32_t TxCrc : 16;
    unsigned /* Pad */   : 16;
} SystemSpi_t;

// TODO Put SPI at addresses in a struct

#endif
