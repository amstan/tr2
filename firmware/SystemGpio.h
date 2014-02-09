/*
 * STM32F4 GPIO Driver
 */

#ifndef SYSTEMGPIO_H
#define SYSTEMGPIO_H

#include <stdint.h>
#include <stdbool.h>

#define ADDR_GPIO 0x40020000
#define SystemGpio ((volatile SystemGpio_t *)ADDR_GPIO)

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
        uint32_t P0  : 2;
        uint32_t P1  : 2;
        uint32_t P2  : 2;
        uint32_t P3  : 2;
        uint32_t P4  : 2;
        uint32_t P5  : 2;
        uint32_t P6  : 2;
        uint32_t P7  : 2;
        uint32_t P8  : 2;
        uint32_t P9  : 2;
        uint32_t P10 : 2;
        uint32_t P11 : 2;
        uint32_t P12 : 2;
        uint32_t P13 : 2;
        uint32_t P14 : 2;
        uint32_t P15 : 2;
    };
    uint32_t Port;
} SystemGpioPortMode_t;

/* GPIO Drive Type *************************************************************/

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
        uint32_t P0  : 1;
        uint32_t P1  : 1;
        uint32_t P2  : 1;
        uint32_t P3  : 1;
        uint32_t P4  : 1;
        uint32_t P5  : 1;
        uint32_t P6  : 1;
        uint32_t P7  : 1;
        uint32_t P8  : 1;
        uint32_t P9  : 1;
        uint32_t P10 : 1;
        uint32_t P11 : 1;
        uint32_t P12 : 1;
        uint32_t P13 : 1;
        uint32_t P14 : 1;
        uint32_t P15 : 1;
        unsigned     : 16;
    };
    uint32_t Port : 16;
    unsigned      : 16;
} SystemGpioPortDrive_t;

/* GPIO Speed ******************************************************************/

typedef enum SystemGpioSpeed_t {
    SystemGpioSpeed_Low,
    SystemGpioSpeed_Medium,
    SystemGpioSpeed_Fast,
    SystemGpioSpeed_High
} SystemGpioSpeed_t;

typedef union SystemGpioPortSpeed_t {
    struct {
        uint32_t P0  : 2;
        uint32_t P1  : 2;
        uint32_t P2  : 2;
        uint32_t P3  : 2;
        uint32_t P4  : 2;
        uint32_t P5  : 2;
        uint32_t P6  : 2;
        uint32_t P7  : 2;
        uint32_t P8  : 2;
        uint32_t P9  : 2;
        uint32_t P10 : 2;
        uint32_t P11 : 2;
        uint32_t P12 : 2;
        uint32_t P13 : 2;
        uint32_t P14 : 2;
        uint32_t P15 : 2;
    };
    uint32_t Port;
} SystemGpioPortSpeed_t;

/* GPIO Pull Up/Down ***********************************************************/

typedef enum SystemGpioPull_t {
    SystemGpioPull_None,
    SystemGpioPull_Up,
    SystemGpioPull_Down
} SystemGpioPull_t;

typedef union SystemGpioPortPull_t {
    struct {
        uint32_t P0  : 2;
        uint32_t P1  : 2;
        uint32_t P2  : 2;
        uint32_t P3  : 2;
        uint32_t P4  : 2;
        uint32_t P5  : 2;
        uint32_t P6  : 2;
        uint32_t P7  : 2;
        uint32_t P8  : 2;
        uint32_t P9  : 2;
        uint32_t P10 : 2;
        uint32_t P11 : 2;
        uint32_t P12 : 2;
        uint32_t P13 : 2;
        uint32_t P14 : 2;
        uint32_t P15 : 2;
    };
    uint32_t Port;
} SystemGpioPortPull_t;

/* GPIO Data Input/Output Register *********************************************/

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

/* GPIO Alternate Functions ****************************************************/

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

/* GPIO Register Set ***********************************************************/

/*
 * A GPIO register set
 */
typedef struct SystemGpio_t {
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
    SystemGpioAltFunction_t AltFunction;
    unsigned : 32;
    unsigned : 32;
    unsigned : 32;
    unsigned : 32;
    unsigned : 32;
    unsigned : 32;
} SystemGpio_t;

/* GPIO Ports ******************************************************************/

/*
 * The available GPIO ports
 */
typedef enum SystemGpioPort_t {
    SystemGpioA = 0,
    SystemGpioB = 16,
    SystemGpioC = 32,
    SystemGpioD = 48,
    SystemGpioE = 64,
    SystemGpioF = 80,
    SystemGpioG = 96,
    SystemGpioH = 112,
    SystemGpioI = 128,
    SystemGpioJ = 144,
    SystemGpioK = 160
} SystemGpioPort_t;

#endif

