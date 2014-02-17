/*
 * STM32F4 GPIO Driver
 */

#ifndef SYSTEMGPIO_H
#define SYSTEMGPIO_H

#include <stdint.h>
#include <stdbool.h>

#define ADDR_GPIO 0x40020000
#define GPIO_REG_SPACING 0x0400
#define SystemGpio (*((volatile SystemGpio_t *)ADDR_GPIO))

/* GPIO Pin Definitions *******************************************************/

typedef enum SystemGpioPin_t {
    SystemGpioPin_0,
    SystemGpioPin_1,
    SystemGpioPin_2,
    SystemGpioPin_3,
    SystemGpioPin_4,
    SystemGpioPin_5,
    SystemGpioPin_6,
    SystemGpioPin_7,
    SystemGpioPin_8,
    SystemGpioPin_9,
    SystemGpioPin_10,
    SystemGpioPin_11,
    SystemGpioPin_12,
    SystemGpioPin_13,
    SystemGpioPin_14,
    SystemGpioPin_15
} SystemGpioPin_t;

/* GPIO Pin Modes *************************************************************/

/*
 * The possible modes that a pin can take on
 */
typedef enum SystemGpioMode_t {
    SystemGpioMode_Input,
    SystemGpioMode_Output,
    SystemGpioMode_Alternate,
    SystemGpioMode_Analog
} SystemGpioMode_t;

/*
 * The modes of the pins in a GPIO register
 */
typedef union SystemGpioPortMode_t {
    struct {
        SystemGpioMode_t P0  : 2;
        SystemGpioMode_t P1  : 2;
        SystemGpioMode_t P2  : 2;
        SystemGpioMode_t P3  : 2;
        SystemGpioMode_t P4  : 2;
        SystemGpioMode_t P5  : 2;
        SystemGpioMode_t P6  : 2;
        SystemGpioMode_t P7  : 2;
        SystemGpioMode_t P8  : 2;
        SystemGpioMode_t P9  : 2;
        SystemGpioMode_t P10 : 2;
        SystemGpioMode_t P11 : 2;
        SystemGpioMode_t P12 : 2;
        SystemGpioMode_t P13 : 2;
        SystemGpioMode_t P14 : 2;
        SystemGpioMode_t P15 : 2;
    };
    uint32_t Port;
} SystemGpioPortMode_t;

/* GPIO Drive Type ************************************************************/

/*
 * The drive types that a pin can take on
 */
typedef enum SystemGpioDrive_t {
    SystemGpioDrive_PushPull,
    SystemGpioDrive_OpenDrain
} SystemGpioDrive_t;

/*
 * The drive types of the pins in a GPIO register
 */
typedef union SystemGpioPortDrive_t {
    struct {
        SystemGpioDrive_t P0  : 1;
        SystemGpioDrive_t P1  : 1;
        SystemGpioDrive_t P2  : 1;
        SystemGpioDrive_t P3  : 1;
        SystemGpioDrive_t P4  : 1;
        SystemGpioDrive_t P5  : 1;
        SystemGpioDrive_t P6  : 1;
        SystemGpioDrive_t P7  : 1;
        SystemGpioDrive_t P8  : 1;
        SystemGpioDrive_t P9  : 1;
        SystemGpioDrive_t P10 : 1;
        SystemGpioDrive_t P11 : 1;
        SystemGpioDrive_t P12 : 1;
        SystemGpioDrive_t P13 : 1;
        SystemGpioDrive_t P14 : 1;
        SystemGpioDrive_t P15 : 1;
        unsigned     : 16;
    };
    uint32_t Port : 16;
    unsigned      : 16;
} SystemGpioPortDrive_t;

/* GPIO Speed *****************************************************************/

typedef enum SystemGpioSpeed_t {
    SystemGpioSpeed_Low,
    SystemGpioSpeed_Medium,
    SystemGpioSpeed_Fast,
    SystemGpioSpeed_High
} SystemGpioSpeed_t;

typedef union SystemGpioPortSpeed_t {
    struct {
        SystemGpioSpeed_t P0  : 2;
        SystemGpioSpeed_t P1  : 2;
        SystemGpioSpeed_t P2  : 2;
        SystemGpioSpeed_t P3  : 2;
        SystemGpioSpeed_t P4  : 2;
        SystemGpioSpeed_t P5  : 2;
        SystemGpioSpeed_t P6  : 2;
        SystemGpioSpeed_t P7  : 2;
        SystemGpioSpeed_t P8  : 2;
        SystemGpioSpeed_t P9  : 2;
        SystemGpioSpeed_t P10 : 2;
        SystemGpioSpeed_t P11 : 2;
        SystemGpioSpeed_t P12 : 2;
        SystemGpioSpeed_t P13 : 2;
        SystemGpioSpeed_t P14 : 2;
        SystemGpioSpeed_t P15 : 2;
    };
    uint32_t Port;
} SystemGpioPortSpeed_t;

/* GPIO Pull Up/Down **********************************************************/

typedef enum SystemGpioPull_t {
    SystemGpioPull_None,
    SystemGpioPull_Up,
    SystemGpioPull_Down
} SystemGpioPull_t;

typedef union SystemGpioPortPull_t {
    struct {
        SystemGpioPull_t P0  : 2;
        SystemGpioPull_t P1  : 2;
        SystemGpioPull_t P2  : 2;
        SystemGpioPull_t P3  : 2;
        SystemGpioPull_t P4  : 2;
        SystemGpioPull_t P5  : 2;
        SystemGpioPull_t P6  : 2;
        SystemGpioPull_t P7  : 2;
        SystemGpioPull_t P8  : 2;
        SystemGpioPull_t P9  : 2;
        SystemGpioPull_t P10 : 2;
        SystemGpioPull_t P11 : 2;
        SystemGpioPull_t P12 : 2;
        SystemGpioPull_t P13 : 2;
        SystemGpioPull_t P14 : 2;
        SystemGpioPull_t P15 : 2;
    };
    uint32_t Port;
} SystemGpioPortPull_t;

/* GPIO Data Input/Output Register ********************************************/

typedef union SystemGpioInputOutput_t {
    struct {
        bool P0  : 1;
        bool P1  : 1;
        bool P2  : 1;
        bool P3  : 1;
        bool P4  : 1;
        bool P5  : 1;
        bool P6  : 1;
        bool P7  : 1;
        bool P8  : 1;
        bool P9  : 1;
        bool P10 : 1;
        bool P11 : 1;
        bool P12 : 1;
        bool P13 : 1;
        bool P14 : 1;
        bool P15 : 1;
        unsigned : 16;
    };
    uint32_t Port : 16;
    unsigned      : 16;
} SystemGpioInputOutput_t;

/* GPIO Alternate Functions ***************************************************/

typedef union SystemGpioAltFunction_t {
    struct {
        uint32_t P0  : 4;
        uint32_t P1  : 4;
        uint32_t P2  : 4;
        uint32_t P3  : 4;
        uint32_t P4  : 4;
        uint32_t P5  : 4;
        uint32_t P6  : 4;
        uint32_t P7  : 4;
        uint32_t P8  : 4;
        uint32_t P9  : 4;
        uint32_t P10 : 4;
        uint32_t P11 : 4;
        uint32_t P12 : 4;
        uint32_t P13 : 4;
        uint32_t P14 : 4;
        uint32_t P15 : 4;
    };
    uint32_t PortLow;
    uint32_t PortHigh;
} SystemGpioAltFunction_t;

/* GPIO Register Set **********************************************************/

/*
 * A GPIO register set
 */
typedef struct SystemGpioModule_t {
    SystemGpioPortMode_t Mode;
    SystemGpioPortDrive_t Drive;
    SystemGpioPortSpeed_t Speed;
    SystemGpioPortPull_t Pull;
    SystemGpioInputOutput_t Input;
    SystemGpioInputOutput_t Output;
    union {
        struct __attribute__ ((packed)) {
            bool P0  : 1;
            bool P1  : 1;
            bool P2  : 1;
            bool P3  : 1;
            bool P4  : 1;
            bool P5  : 1;
            bool P6  : 1;
            bool P7  : 1;
            bool P8  : 1;
            bool P9  : 1;
            bool P10 : 1;
            bool P11 : 1;
            bool P12 : 1;
            bool P13 : 1;
            bool P14 : 1;
            bool P15 : 1;
        };
        uint32_t Port : 16;
    } __attribute__ ((packed)) Set;
    union {
        struct __attribute__ ((packed)) {
            bool P0  : 1;
            bool P1  : 1;
            bool P2  : 1;
            bool P3  : 1;
            bool P4  : 1;
            bool P5  : 1;
            bool P6  : 1;
            bool P7  : 1;
            bool P8  : 1;
            bool P9  : 1;
            bool P10 : 1;
            bool P11 : 1;
            bool P12 : 1;
            bool P13 : 1;
            bool P14 : 1;
            bool P15 : 1;
        };
        uint32_t Port : 16;
    } __attribute__ ((packed)) Reset;
    uint32_t Lock;
    SystemGpioAltFunction_t Function;
} SystemGpioModule_t;

/* GPIO Ports *****************************************************************/

typedef struct SystemGpio_t {
    SystemGpioModule_t A;
    uint8_t __pad1[GPIO_REG_SPACING - sizeof(SystemGpioModule_t)];
    SystemGpioModule_t B;
    uint8_t __pad2[GPIO_REG_SPACING - sizeof(SystemGpioModule_t)];
    SystemGpioModule_t C;
    uint8_t __pad3[GPIO_REG_SPACING - sizeof(SystemGpioModule_t)];
    SystemGpioModule_t D;
    uint8_t __pad4[GPIO_REG_SPACING - sizeof(SystemGpioModule_t)];
    SystemGpioModule_t E;
    uint8_t __pad5[GPIO_REG_SPACING - sizeof(SystemGpioModule_t)];
    SystemGpioModule_t F;
    uint8_t __pad6[GPIO_REG_SPACING - sizeof(SystemGpioModule_t)];
    SystemGpioModule_t G;
    uint8_t __pad7[GPIO_REG_SPACING - sizeof(SystemGpioModule_t)];
    SystemGpioModule_t H;
    uint8_t __pad8[GPIO_REG_SPACING - sizeof(SystemGpioModule_t)];
    SystemGpioModule_t I;
    uint8_t __pad9[GPIO_REG_SPACING - sizeof(SystemGpioModule_t)];
    SystemGpioModule_t J;
    uint8_t __pad10[GPIO_REG_SPACING - sizeof(SystemGpioModule_t)];
    SystemGpioModule_t K;
    uint8_t __pad11[GPIO_REG_SPACING - sizeof(SystemGpioModule_t)];
} SystemGpio_t;

#endif

