/*
 * STM32F4 Timer Driver
 */

#ifndef SYSTEMTIMER_H
#define SYSTEMTIMER_H

#include <stdint.h>

/* Simple Timer ***************************************************************/

typedef enum SystemGenTimerDirection_t {
    SystemGenTimerDirection_Up,
    SystemGenTimerDirection_Down
} SystemGenTimerDirection_t;

typedef enum SystemGenTimerAlign_t {
    SystemGenTimerAlign_Edge,
    SystemGenTimerAlign_Center1,
    SystemGenTimerAlign_Center2,
    SystemGenTimerAlign_Center3
} SystemGenTimerAlign_t;

typedef enum SystemGenTimerPrescaler_t {
    SystemGenTimerPrescaler_None,
    SystemGenTimerPrescaler_2,
    SystemGenTimerPrescaler_4
} SystemGenTimerPrescaler_t;

typedef enum SystemGenTimerDmaCapture_t {
    SystemGenTimerDmaCapture_CCx,
    SystemGenTimerDmaCapture_Dma
} SystemGenTimerDmaCapture_t;

typedef enum SystemGenTimerMasterMode_t {
    SystemGenTimerMasterMode_Oc1 = 4,
    SystemGenTimerMasterMode_Oc2,
    SystemGenTimerMasterMode_Oc3,
    SystemGenTimerMasterMode_Oc4
} SystemGenTimerMasterMode_t;

typedef enum SystemGenTimerSource_t {
    SystemGenTimerSource_Ch1,
    SystemGenTimerSource_Ch2Ch3
} SystemGenTimerCh1Source_t;

typedef struct SystemGenTimerControl_t {
    // TIMx_CR1
    bool                       CounterEnable       : 1;
    bool                       UpdateDisable       : 1;
    bool                       UpdateRequestSource : 1;
    bool                       OnePulseMode        : 1;
    SystemGenTimerDirection_t  Direction           : 1;
    SystemGenTimerAlign_t      Alignment           : 2;
    bool                       AutoReloadEnabled   : 1;
    SystemGenTimerPrescaler_t  ClockDivision       : 2;
    unsigned                   /* Pad */           : 22;

    // TIMx_CR2
    unsigned                   /* Pad */           : 3;
    SystemGenTimerDmaCapture_t DmaSelection        : 1;
    SystemGenTimerMasterMode_t MasterMode          : 3;
    SystemGenTimerSource_t     T1Selection         : 1;
    unsigned                   /* Pad */           : 24;
} SystemGenTimerControl_t;



#endif
