#pragma once

#define _JOINPIN(port, pin) port##_##pin

// USB
#define USB_VBUS PB13
#define USB_DM   PB14 // not a bootloader D:
#define USB_DP   PB15

// FTDI
#define FTDI_USART(x) _JOINPIN(USART1, x) // + bootloader
#define USART1_TX  PA9
#define USART1_RX  PA10
#define USART1_CTS PA11
#define USART1_RTS PA12

// AUX_UART
#define AUX_USART(x) _JOINPIN(USART6, x)
#define USART6_TX PC6
#define USART6_RX PC7

// UEXT0
#define UEXT0_USART(x) _JOINPIN(USART3, x)
#define USART3_TX PD8
#define USART3_RX PD9

#define UEXT0_I2C(x) _JOINPIN(I2C2, x) // 4.7k pullups
#define I2C2_SDA  PF0
#define I2C2_SCL  PF1

#define UEXT0_SPI(x) _JOINPIN(SPI1, x) // Same as UEXT1
#define UEXT0_CS  PA4

// UEXT1
#define UEXT1_USART(x) _JOINPIN(USART2, x)
#define USART2_TX PD5
#define USART2_RX PD6

#define UEXT1_I2C(x) _JOINPIN(I2C1, x) // 4.7k pullups
#define I2C1_SDA  PB9
#define I2C1_SCL  PB8

#define UEXT1_SPI(x) _JOINPIN(SPI1, x) // Same as UEXT0
#define UEXT1_CS  PA4

#define SPI1_MOSI PA7
#define SPI1_MISO PA6
#define SPI1_SCK  PA5

// Misc
#define BOOT1 PB2 // 10k ext pulldown

#define NJTRST PB4
#define JTDI   PA15
#define JTMS   PA13
#define JTCK   PA14
#define JTDO   PB3

#define XTAL_IN  PH0
#define XTAL_OUT PH1

// RGB LED connectors
#define LED_DATA0 PE9
#define LED_DATA1 PE11
// Note: need rework to bypass broken "booster"

// Board LEDs
#define LED_PWR PE5 // Active low, HiZ also means on

#define LED0 PE15 // Active high
#define LED1 PE14
#define LED2 PE13
#define LED3 PE12

// Board Buttons, 10uF, need software pulldowns
#define SW0 PF12
#define SW1 PF13
#define SW2 PF14
#define SW3 PF15

// Analog
#define SUPPLY_SENSE   PC0 // ADC123_IN10, 1.1k / (1.1k + 15k) * 24V
#define STEPPERS_SENSE PC1 // ADC123,IN11, Settable potentiometer, ideally at 0.5 * 3.3V, goes to ADCIN on L6470

// Industrial Inputs
// 48kHz Single Pole Low Pass Filter (3.3k, 1nF)
// 0.7mA @ 24V Input, 210mV drop on Schottky array
// Max 40V
#define IND_INPUT0 PF3  // ADC3_IN9
#define IND_INPUT1 PF4  // ADC3_IN14
#define IND_INPUT2 PF5  // ADC3_IN15
#define IND_INPUT3 PF10 // ADC3_IN8
#define IND_INPUT4 PB0  // ADC12_IN8
#define IND_INPUT5 PC5  // ADC12_IN15
#define IND_INPUT6 PC4  // ADC12_IN14
#define IND_INPUT7 PA0  // ADC123_IN0
#define IND_INPUT0_TIM PD12
#define IND_INPUT1_TIM PD13
#define IND_INPUT2_TIM PD14
#define IND_INPUT3_TIM PD15

// Industrial Outputs
// 3A Max Sinking
// NJT4031NT1G NPN transistors + flyback diodes to 24V
#define IND_OUTPUT0 PC12
#define IND_OUTPUT1 PD0
#define IND_OUTPUT2 PD1
#define IND_OUTPUT3 PD2
#define IND_OUTPUT4 PD3
#define IND_OUTPUT5 PA3
#define IND_OUTPUT6 PA2
#define IND_OUTPUT7 PA1

// MAX6675
#define TEMP_SPI(x)  _JOINPIN(SPI3, x)
#define SPI3_MISO PC11
#define SPI3_SCK  PC10
#define TEMP0_CS  PD10
#define TEMP1_CS  PD11

// L6470 Steppers
#define STEPPERS_RST      PB6
#define STEPPERS_OSCIN    PC8
#define STEPPERS_OSC_SYNC PC9

#define STEPPERS_SPI(x) _JOINPIN(SPI2, x)
#define SPI2_MOSI PC3
#define SPI2_MISO PC2
#define SPI2_SCK  PB10

#define STEPPER0_CS PG4
#define STEPPER1_CS PG5
#define STEPPER2_CS PG6
#define STEPPER3_CS PG7

#define STEPPER0_STCK PF6
#define STEPPER1_STCK PF7
#define STEPPER2_STCK PF8
#define STEPPER3_STCK PF9

#define STEPPER0_FLAG PD7 // Error when low
#define STEPPER1_FLAG PG10
#define STEPPER2_FLAG PG12
#define STEPPER3_FLAG PG14

#define STEPPER0_BUSY PG9 // !BUSY/FLAG
#define STEPPER1_BUSY PG11
#define STEPPER2_BUSY PG13
#define STEPPER3_BUSY PG15
