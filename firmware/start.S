/*
 * Start code for the STM32F4
 */

.thumb

/* Interrupt Vector Table
 */
.section .interruptVectorTable

.word __stackPointer
.word ([__crt0] + 1)
.word ([__defaultNMIHandler] + 1)
.word ([__defaultHardFaultHandler] + 1)

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

__defaultNMIHandler:
    b __defaultNMIHandler

__defaultHardFaultHandler:
    b __defaultHardFaultHandler

/* Catch an evil main that return and busy loop
 */
__exitTrap:
    b __exitTrap
