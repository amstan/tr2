/*
 * STM32F4 SPI Driver
 */

#ifndef SYSTEMSPI_H
#define SYSTEMSPI_H

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

/* Frame Format ***************************************************************/

typedef enum SystemSpiFrameFormat_t {
    SystemSpiFrameFormat_MsbFirst,
    SystemSpiFrameFormat_LsbFirst
} SystemSpiFrameFormat_t;

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

/* SPI Configuration **********************************************************/

typedef union SystemSpiConfiguration_t {
    struct {
    uint32_t ClockPhase : 1;
    
} SystemSpiConfiguration_t;


#endif
