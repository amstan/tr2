/*
 * Base C file for the STM32F4 Bare Metal Bring Up
 */

#include <stdint.h>

#define RCC_BASE 0x40023800
#define RCC_AHB1ENR *((uint32_t *)(RCC_BASE + 0x30))

#define RCC_GPIOD 3

#define PORTD_BASE 0x40020C00
#define PORTD_MODE *((uint32_t *)(PORTD_BASE + 0x00))
#define PORTD *((uint32_t *)(PORTD_BASE + 0x14))

#define LED_BLUE 15

int main(void)
{
    RCC_AHB1ENR |= (1 << RCC_GPIOD);
    
    PORTD_MODE = (1 << (LED_BLUE * 2));
    PORTD = (1 << LED_BLUE);
    
    while(1);
    return;
}

