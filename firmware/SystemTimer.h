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

typedef struct SystemGenTimerControl_t {
    bool                      CounterEnable       : 1;
    bool                      UpdateDisable       : 1;
    bool                      UpdateRequestSource : 1;
    bool                      OnePulseMode        : 1;
    SystemGenTimerDirection_t Direction           : 1;
    SystemGenTimerAlign_t     Alignment           : 2;
    bool                      AutoReloadEnabled   : 1;

} SystemGenTimerControl_t;

#endif
