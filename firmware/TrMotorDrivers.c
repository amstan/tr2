/*
 * Tr2 Board Motor Drivers
 */

#include "TrMotorDrivers.h"

/* Initialization *************************************************************/

void TrMotorDriversInit(void)
{
    // Enable chip select lines
    SystemClockEnabled.GpioG = true;

    // As outputs
    SystemGpioG.Mode.P4 = SystemGpioMode_Output;
    SystemGpioG.Mode.P5 = SystemGpioMode_Output;
    SystemGpioG.Mode.P6 = SystemGpioMode_Output;
    SystemGpioG.Mode.P7 = SystemGpioMode_Output;
    
    // Initial state is high
    SystemGpioG.Set.P4 = true;
    SystemGpioG.Set.P5 = true;
    SystemGpioG.Set.P6 = true;
    SystemGpioG.Set.P7 = true;

    // Spi Pins
    SystemClockEnabled.GpioB = true;
    SystemClockEnabled.GpioC = true;
    
    // As alternate functions
    SystemGpioB.Mode.P10 = SystemGpioMode_Alternate;
    SystemGpioC.Mode.P2 = SystemGpioMode_Alternate;
    SystemGpioC.Mode.P3 = SystemGpioMode_Alternate;
    SystemGpioB.Function.P10 = 5;
    SystemGpioC.Function.P2 = 5;
    SystemGpioC.Function.P3 = 5;
    
    // Spi Module
    SystemClockEnabled.SPI2 = true;
    SystemSpi2.Config.SlaveManageEnable = true;
    SystemSpi2.Config.InternalSelect = true;
    SystemSpi2.Config.DeviceMode = SystemSpiDeviceMode_Master;
    SystemSpi2.Config.Prescaler = SystemSpiPrescaler_128;
    SystemSpi2.Config.ClockPhase = SystemSpiClockPhase_Second;
    SystemSpi2.Config.ClockIdle = SystemSpiClockIdle_High;
    SystemSpi2.Config.Enabled = true;
}

bool TrMotorDriversValidateNum(uint32_t driverNum)
{
    return driverNum < MOTOR_COUNT;
}

/* Commands *******************************************************************/

bool TrMotorRawSpi(uint32_t driverNum,
    uint32_t *buf,
    uint32_t length)
{
    if(TrMotorDriversValidateNum(driverNum))
    {
        L6470RawSpi(&SystemSpi2,
            buf,
            length,
            &SystemGpioG,
            driverNum + MOTORCS_START);
        return true;
    }

    return false;
}

