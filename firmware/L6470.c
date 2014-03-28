/*
 * Driver for the L6470
 */

#include "L6470.h"

/* Commands *******************************************************************/

void L6470RawSpi(volatile SystemSpiModule_t *spi,
    uint32_t *buf,
    uint32_t length,
    volatile SystemGpioModule_t *csPort,
    uint32_t csPin)
{
    for(int i = 0; i < length; i++)
    {
        csPort->Output.Port &= ~(1 << csPin);
        SpiWriteRead(spi, buf[i]);
        csPort->Output.Port |= (1 << csPin);
    }
}

