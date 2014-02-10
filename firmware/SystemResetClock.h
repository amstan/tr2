/*
 * STM32F4 Reset/Clock Driver
 */

#ifndef SYSTEMRESETCLOCK_H
#define SYSTEMRESETCLOCK_H

#include <stdint.h>
#include <stdbool.h>

#define ADDR_RCC     0x40023800
#define ADDR_CLOCKEN       0x30

#define PeripheralClockEnabled                                          \
    (*((volatile PeripheralClockEnabled_t *)(ADDR_RCC + ADDR_CLOCKEN)))

typedef struct PeripheralClockEnabled_t {
    // RCC_AHB1ENR
    bool     GpioA         :  1;
    bool     GpioB         :  1;
    bool     GpioC         :  1;
    bool     GpioD         :  1;
    bool     GpioE         :  1;
    bool     GpioF         :  1;
    bool     GpioG         :  1;
    bool     GpioH         :  1;
    bool     GpioI         :  1;
    unsigned /* Pad */     :  3;
    bool     Crc           :  1;
    unsigned /* Pad */     :  5;
    bool     BackupSram    :  1;
    unsigned /* Pad */     :  1;
    bool     CcmRam        :  1;
    bool     Dma1          :  1;
    bool     Dma2          :  1;
    unsigned /* Pad */     :  2;
    bool     EthMac        :  1;
    bool     EthTx         :  1;
    bool     EthRx         :  1;
    bool     EthPtp        :  1;
    bool     UsbOtgHs      :  1;
    bool     UsbOtgHsUlpi  :  1;
    unsigned /* Pad */     :  1;

    // RCC_AHB2ENR
    bool     DigCamIntf    :  1;
    unsigned /* Pad */     :  3;
    bool     Crypto        :  1;
    bool     Hash          :  1;
    bool     RandGen       :  1;
    bool     UsbOtgFs      :  1;
    unsigned /* Pad */     : 24;

    // RCC_AHB3ENR
    bool     FlexStaticMem :  1;
    unsigned /* Pad */     : 31;

    // RCC_APB1ENR
    bool     Timer2        :  1;
    bool     Timer3        :  1;
    bool     Timer4        :  1;
    bool     Timer5        :  1;
    bool     Timer6        :  1;
    bool     Timer7        :  1;
    bool     Timer12       :  1;
    bool     Timer13       :  1;
    bool     Timer14       :  1;
    unsigned /* Pad */     :  2;
    bool     WinWatchDog   :  1;
    unsigned /* Pad */     :  2;
    bool     SPI2          :  1;
    bool     SPI3          :  1;
    unsigned /* Pad */     :  1;
    bool     Usart2        :  1;
    bool     Usart3        :  1;
    bool     Uart4         :  1;
    bool     Uart5         :  1;
    bool     I2C1          :  1;
    bool     I2C2          :  1;
    bool     I2C3          :  1;
    unsigned /* Pad */     :  1;
    bool     CAN1          :  1;
    bool     CAN2          :  1;
    unsigned /* Pad */     :  1;
    bool     PowerIntf     :  1;
    bool     DAC           :  1;
    unsigned /* Pad */     :  2;

    // RCC_APB2ENR
    bool     Timer1        :  1;
    bool     Timer8        :  1;
    unsigned /* Pad */     :  2;
    bool     Usart1        :  1;
    bool     Usart6        :  1;
    unsigned /* Pad */     :  2;
    bool     ADC1          :  1;
    bool     ADC2          :  1;
    bool     ADC3          :  1;
    bool     SDIO          :  1;
    bool     SPI1          :  1;
    unsigned /* Pad */     :  1;
    bool     SysConfig     :  1;
    unsigned /* Pad */     :  1;
    bool     Timer9        :  1;
    bool     Timer10       :  1;
    bool     Timer11       :  1;
    unsigned /* Pad */     :  1;
    bool     SPI5          :  1;
    bool     SPI6          :  1;
    unsigned /* Pad */     : 10;
} PeripheralClockEnabled_t;

#endif
