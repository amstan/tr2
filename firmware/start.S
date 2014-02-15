/*
 * Start code for the STM32F4
 */

.thumb

/* Weakly defined interrupt handlers
 */
.weak IsrNmi
.weak IsrHardFault
.weak IsrMemManage
.weak IsrBusFault
.weak IsrUsageFault
.weak IsrSvCall
.weak IsrDebugMonitor
.weak IsrPendSv
.weak IsrSysTick
.weak IsrWwdg
.weak IsrPvd
.weak IsrTampStamp
.weak IsrRtcWkup
.weak IsrFlash
.weak IsrRcc
.weak IsrExti0
.weak IsrExti1
.weak IsrExti2
.weak IsrExti3
.weak IsrExti4
.weak IsrDma1Stream0
.weak IsrDma1Stream1
.weak IsrDma1Stream2
.weak IsrDma1Stream3
.weak IsrDma1Stream4
.weak IsrDma1Stream5
.weak IsrDma1Stream6
.weak IsrAdc
.weak IsrCan1Tx
.weak IsrCan1Rx0
.weak IsrCan1Rx1
.weak IsrCan1Sce
.weak IsrExti95
.weak IsrTim1BrkTim9
.weak IsrTim1UpTim10
.weak IsrTim1TrgComTim11
.weak IsrTim1Cc
.weak IsrTim2
.weak IsrTim3
.weak IsrTim4
.weak IsrI2C1Ev
.weak IsrI2C1Er
.weak IsrI2C2Ev
.weak IsrI2C2Er
.weak IsrSpi1
.weak IsrSpi2
.weak IsrUsart1
.weak IsrUsart2
.weak IsrUsart3
.weak IsrExti1510
.weak IsrRtcAlarm
.weak IsrOtgFsWkup
.weak IsrTim8BrkTim12
.weak IsrTim8UpTim13
.weak IsrTim8TrgComTim14
.weak IsrTim8Cc
.weak IsrDma1Stream7
.weak IsrFsmc
.weak IsrSdio
.weak IsrTim5
.weak IsrSpi3
.weak IsrUart4
.weak IsrUart5
.weak IsrTim6Dac
.weak IsrTim7
.weak IsrDma2Stream0
.weak IsrDma2Stream1
.weak IsrDma2Stream2
.weak IsrDma2Stream3
.weak IsrDma2Stream4
.weak IsrEth
.weak IsrEthWkup
.weak IsrCan2Tx
.weak IsrCan2Rx0
.weak IsrCan2Rx1
.weak IsrCan2Sce
.weak IsrOtgFs
.weak IsrDma2Stream5
.weak IsrDma2Stream6
.weak IsrDma2Stream7
.weak IsrUsart6
.weak IsrI2C3Ev
.weak IsrI2C3Er
.weak IsrOtgHsEp1Out
.weak IsrOtgHsEp1In
.weak IsrOtgHsWkup
.weak IsrOtgHs
.weak IsrDcmi
.weak IsrCryp
.weak IsrHashRng
.weak IsrFpu

/* Interrupt handlers are assigned to the default handler unless
 * overridden at link time.
 */
.set IsrNmi, __defaultInterrupt
.set IsrHardFault, __defaultInterrupt
.set IsrMemManage, __defaultInterrupt
.set IsrBusFault, __defaultInterrupt
.set IsrUsageFault, __defaultInterrupt
.set IsrSvCall, __defaultInterrupt
.set IsrDebugMonitor, __defaultInterrupt
.set IsrPendSv, __defaultInterrupt
.set IsrSysTick, __defaultInterrupt
.set IsrWwdg, __defaultInterrupt
.set IsrPvd, __defaultInterrupt
.set IsrTampStamp, __defaultInterrupt
.set IsrRtcWkup, __defaultInterrupt
.set IsrFlash, __defaultInterrupt
.set IsrRcc, __defaultInterrupt
.set IsrExti0, __defaultInterrupt
.set IsrExti1, __defaultInterrupt
.set IsrExti2, __defaultInterrupt
.set IsrExti3, __defaultInterrupt
.set IsrExti4, __defaultInterrupt
.set IsrDma1Stream0, __defaultInterrupt
.set IsrDma1Stream1, __defaultInterrupt
.set IsrDma1Stream2, __defaultInterrupt
.set IsrDma1Stream3, __defaultInterrupt
.set IsrDma1Stream4, __defaultInterrupt
.set IsrDma1Stream5, __defaultInterrupt
.set IsrDma1Stream6, __defaultInterrupt
.set IsrAdc, __defaultInterrupt
.set IsrCan1Tx, __defaultInterrupt
.set IsrCan1Rx0, __defaultInterrupt
.set IsrCan1Rx1, __defaultInterrupt
.set IsrCan1Sce, __defaultInterrupt
.set IsrExti95, __defaultInterrupt
.set IsrTim1BrkTim9, __defaultInterrupt
.set IsrTim1UpTim10, __defaultInterrupt
.set IsrTim1TrgComTim11, __defaultInterrupt
.set IsrTim1Cc, __defaultInterrupt
.set IsrTim2, __defaultInterrupt
.set IsrTim3, __defaultInterrupt
.set IsrTim4, __defaultInterrupt
.set IsrI2C1Ev, __defaultInterrupt
.set IsrI2C1Er, __defaultInterrupt
.set IsrI2C2Ev, __defaultInterrupt
.set IsrI2C2Er, __defaultInterrupt
.set IsrSpi1, __defaultInterrupt
.set IsrSpi2, __defaultInterrupt
.set IsrUsart1, __defaultInterrupt
.set IsrUsart2, __defaultInterrupt
.set IsrUsart3, __defaultInterrupt
.set IsrExti1510, __defaultInterrupt
.set IsrRtcAlarm, __defaultInterrupt
.set IsrOtgFsWkup, __defaultInterrupt
.set IsrTim8BrkTim12, __defaultInterrupt
.set IsrTim8UpTim13, __defaultInterrupt
.set IsrTim8TrgComTim14, __defaultInterrupt
.set IsrTim8Cc, __defaultInterrupt
.set IsrDma1Stream7, __defaultInterrupt
.set IsrFsmc, __defaultInterrupt
.set IsrSdio, __defaultInterrupt
.set IsrTim5, __defaultInterrupt
.set IsrSpi3, __defaultInterrupt
.set IsrUart4, __defaultInterrupt
.set IsrUart5, __defaultInterrupt
.set IsrTim6Dac, __defaultInterrupt
.set IsrTim7, __defaultInterrupt
.set IsrDma2Stream0, __defaultInterrupt
.set IsrDma2Stream1, __defaultInterrupt
.set IsrDma2Stream2, __defaultInterrupt
.set IsrDma2Stream3, __defaultInterrupt
.set IsrDma2Stream4, __defaultInterrupt
.set IsrEth, __defaultInterrupt
.set IsrEthWkup, __defaultInterrupt
.set IsrCan2Tx, __defaultInterrupt
.set IsrCan2Rx0, __defaultInterrupt
.set IsrCan2Rx1, __defaultInterrupt
.set IsrCan2Sce, __defaultInterrupt
.set IsrOtgFs, __defaultInterrupt
.set IsrDma2Stream5, __defaultInterrupt
.set IsrDma2Stream6, __defaultInterrupt
.set IsrDma2Stream7, __defaultInterrupt
.set IsrUsart6, __defaultInterrupt
.set IsrI2C3Ev, __defaultInterrupt
.set IsrI2C3Er, __defaultInterrupt
.set IsrOtgHsEp1Out, __defaultInterrupt
.set IsrOtgHsEp1In, __defaultInterrupt
.set IsrOtgHsWkup, __defaultInterrupt
.set IsrOtgHs, __defaultInterrupt
.set IsrDcmi, __defaultInterrupt
.set IsrCryp, __defaultInterrupt
.set IsrHashRng, __defaultInterrupt
.set IsrFpu, __defaultInterrupt

/* Interrupt Vector Table
 */
.section .interruptVectorTable

.word __stackPointer
.word ([__crt0] + 1)
.word [IsrNmi]
.word [IsrHardFault]
.word [IsrMemManage]
.word [IsrBusFault]
.word [IsrUsageFault]
.fill 4, 4 /* Reserved */
.word [IsrSvCall]
.word [IsrDebugMonitor]
.fill 4, 1 /* Reserved */
.word [IsrPendSv]
.word [IsrSysTick]
.word [IsrWwdg]
.word [IsrPvd]
.word [IsrTampStamp]
.word [IsrRtcWkup]
.word [IsrFlash]
.word [IsrRcc]
.word [IsrExti0]
.word [IsrExti1]
.word [IsrExti2]
.word [IsrExti3]
.word [IsrExti4]
.word [IsrDma1Stream0]
.word [IsrDma1Stream1]
.word [IsrDma1Stream2]
.word [IsrDma1Stream3]
.word [IsrDma1Stream4]
.word [IsrDma1Stream5]
.word [IsrDma1Stream6]
.word [IsrAdc]
.word [IsrCan1Tx]
.word [IsrCan1Rx0]
.word [IsrCan1Rx1]
.word [IsrCan1Sce]
.word [IsrExti95]
.word [IsrTim1BrkTim9]
.word [IsrTim1UpTim10]
.word [IsrTim1TrgComTim11]
.word [IsrTim1Cc]
.word [IsrTim2]
.word [IsrTim3]
.word [IsrTim4]
.word [IsrI2C1Ev]
.word [IsrI2C1Er]
.word [IsrI2C2Ev]
.word [IsrI2C2Er]
.word [IsrSpi1]
.word [IsrSpi2]
.word [IsrUsart1]
.word [IsrUsart2]
.word [IsrUsart3]
.word [IsrExti1510]
.word [IsrRtcAlarm]
.word [IsrOtgFsWkup]
.word [IsrTim8BrkTim12]
.word [IsrTim8UpTim13]
.word [IsrTim8TrgComTim14]
.word [IsrTim8Cc]
.word [IsrDma1Stream7]
.word [IsrFsmc]
.word [IsrSdio]
.word [IsrTim5]
.word [IsrSpi3]
.word [IsrUart4]
.word [IsrUart5]
.word [IsrTim6Dac]
.word [IsrTim7]
.word [IsrDma2Stream0]
.word [IsrDma2Stream1]
.word [IsrDma2Stream2]
.word [IsrDma2Stream3]
.word [IsrDma2Stream4]
.word [IsrEth]
.word [IsrEthWkup]
.word [IsrCan2Tx]
.word [IsrCan2Rx0]
.word [IsrCan2Rx1]
.word [IsrCan2Sce]
.word [IsrOtgFs]
.word [IsrDma2Stream5]
.word [IsrDma2Stream6]
.word [IsrDma2Stream7]
.word [IsrUsart6]
.word [IsrI2C3Ev]
.word [IsrI2C3Er]
.word [IsrOtgHsEp1Out]
.word [IsrOtgHsEp1In]
.word [IsrOtgHsWkup]
.word [IsrOtgHs]
.word [IsrDcmi]
.word [IsrCryp]
.word [IsrHashRng]
.word [IsrFpu]

/* C Runtime
 */
__crt0:

/*
 * Copies initialized global and static variables into SRAM
 */
copyData:
    // Address of .data start in r0
    ldr r0, =__dataStart
    
    // Address of .data end in r1
    ldr r1, =__dataEnd
    
    // Current SRAM address
    mov r2, #0

initData:
    // If r1 is equal to r0, branch to initializing zeros
    cmp r1, r0
    beq copyBss
    
    // Copy a word, increment pointers and repeat
    ldr r3, [r0]
    str r3, [r2]
    add r0, #1
    add r2, #1
    b initData

/*
 * Initializes the bss segment of SRAM to zero
 *
 * - Branches to main when complete
 */
copyBss:
    // Address of .bss start in r0
    ldr r0, =__bssStart
    
    // Address of .bss end in r1
    
    // Zero
    mov r2, #0

initBss:
    // If r1 is equal to r0, branch to main
    cmp r1, r0
    beq main
    
    // Store zero
    str r2, [r0]
    add r0, #0
    b initBss

__defaultInterrupt:
    b __defaultInterrupt

/* Catch an evil main that returned and busy loop
 */
__exitTrap:
    b __exitTrap
