/*
 * Base C file for the STM32F4 Bare Metal Bring Up
 */

#include <stdint.h>

#include "SystemResetClock.h"
#include "SystemGpio.h"
#include "SystemUart.h"
#include "SystemInterrupts.h"

void __attribute__ ((interrupt ("IRQ"))) IsrUsart2(void) {
    SystemGpio.D.Output.P14 = true;
    SystemUart.U2.Config.TxEmptyIntEnabled = false;
}

int main(void)
{
    // GPIO Config
    PeripheralClockEnabled.GpioA = true;
    PeripheralClockEnabled.GpioD = true;
    
    SystemGpio.A.Mode.P0 = SystemGpioMode_Input;
    SystemGpio.D.Mode.P15 = SystemGpioMode_Output;
    SystemGpio.D.Mode.P14 = SystemGpioMode_Output;
    
    // USART2 Config
    PeripheralClockEnabled.Usart2 = true;
    SystemGpio.A.Mode.P2 = SystemGpioMode_Alternate;
    SystemGpio.A.Mode.P3 = SystemGpioMode_Alternate;
    SystemGpio.A.Function.P2 = 7;
    SystemGpio.A.Function.P3 = 7;
    
    // 19200 Baud, Make a macro/function to handle this.
    SystemNvic.SetEnable.Usart2 = true;
    SystemIrqEnable();
    
    //SystemUart.U2.Config.TxDoneIntEnabled = true;
    SystemUart.U2.Config.TxEmptyIntEnabled = true;
    
    SystemUart.U2.Config.Baud.Mantissa = 52;
    SystemUart.U2.Config.Baud.Fraction = 1;
    SystemUart.U2.Config.RxEnabled = true;
    SystemUart.U2.Config.TxEnabled = true;
    SystemUart.U2.Config.Enabled = true;
    
    //SystemUart.U2.Data = 'A';
    
    bool prevState = false;

    while(1)
    {
        bool state = SystemGpio.A.Input.P0;
        for(volatile int i = 0; i < 10000; i++);
        if(state == SystemGpio.A.Input.P0)
        {
            if(state && !prevState) {
                SystemGpio.D.Output.P15 = !SystemGpio.D.Output.P15;
                SystemUart.U2.Data = 'A';
                prevState = true;
            } else if(!state && prevState) {
                prevState = false;
            }
        }
    }
    
    while(1);
    return 0;
}

