#include "tr2_pins.h"

// Arduino pin style adapters
#define LED_BUILTIN           LED0
#define USER_BTN              SW0
#define PIN_SPI_SS            UEXT0_CS
#define PIN_SPI_SS1           UEXT1_CS
#define PIN_SPI_MOSI          UEXT0_SPI(MOSI)
#define PIN_SPI_MISO          UEXT0_SPI(MISO)
#define PIN_SPI_SCK           UEXT0_SPI(SCK)
#define PIN_WIRE_SDA          UEXT0_I2C(SDA)
#define PIN_WIRE_SCL          UEXT0_I2C(SCL)
#define SERIAL_UART_INSTANCE  1 // FTDI_USART
#define FTDI_SERIAL           Serial1
#define PIN_SERIAL_RX         FTDI_USART(RX)
#define PIN_SERIAL_TX         FTDI_USART(TX)

#include <Arduino.h>

HardwareSerial FTDI_SERIAL(FTDI_USART(RX), FTDI_USART(TX));

void setup()
{
  { // LED_PWR
    HardwareTimer *led_pwr_pwm_timer;
    uint32_t led_pwr_pwm_channel;

    TIM_TypeDef *Instance = (TIM_TypeDef *)pinmap_peripheral(digitalPinToPinName(LED_PWR), PinMap_PWM);
    led_pwr_pwm_channel = STM_PIN_CHANNEL(pinmap_function(digitalPinToPinName(LED_PWR), PinMap_PWM));
    led_pwr_pwm_timer = new HardwareTimer(Instance);

    led_pwr_pwm_timer->setPWM(led_pwr_pwm_channel, LED_PWR, 1000, 100 - (5 /*%*/ ));
  }

  pinMode(LED0, OUTPUT);
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);

  pinMode(SW0, INPUT_PULLDOWN);
  pinMode(SW1, INPUT_PULLDOWN);
  pinMode(SW2, INPUT_PULLDOWN);
  pinMode(SW3, INPUT_PULLDOWN);

  FTDI_SERIAL.begin(115200);
}

void loop()
{
  digitalWrite(LED0,digitalRead(SW0));
  digitalWrite(LED1,digitalRead(SW1));
  digitalWrite(LED2,digitalRead(SW2));
  digitalWrite(LED3,digitalRead(SW3));

  FTDI_SERIAL.println("Hello world!");
  delay(100);
}
