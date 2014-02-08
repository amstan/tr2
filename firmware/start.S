/*
 * Start code for the STM32F4
 */

/* Interrupt Vector Table
 */
.section .interruptVectorTable

.word __stackPointer
.word [__crt0]
.word [__unhandledInterrupt]
.word [__unhandledInterrupt]

/* C Runtime
 */
__crt0:

/*
 * Copies initialized global and static variables into SRAM
 */
copyData:
    // Address of .data start in r0
    movw r0, #:lower16:__dataStart
    movt r0, #:upper16:__dataStart
    
    // Address of .data end in r1
    movw r1, #:lower16:__dataEnd
    movt r1, #:upper16:__dataEnd
    
    // Current SRAM address
    mov r2, #0
    
initData:
    // If r1 is equal to r0, branch to initializing zeros
    cmp r1, r0
    beq copyBss
    
    // Copy a word, increment pointers and repeat
    ldr r3, [r0, #1]!
    str r3, [r2, #1]!
    b initData

/*
 * Initializes the bss segment of SRAM to zero
 *
 * - Branches to main when complete
 */
copyBss:
    // Address of .bss start in r0
    movw r0, #:lower16:__bssStart
    movt r0, #:upper16:__bssStart

    // Address of .bss end in r1
    movw r1, #:lower16:__bssEnd
    movt r1, #:upper16:__bssEnd

    // Zero
    mov r2, #0

initBss:
    // If r1 is equal to r0, branch to main
    cmp r1, r0
    beq main
    
    // Store zero
    str r2, [r0, #1]!
    b initBss

__unhandledInterrupt:
    b __unhandledInterrupt

/* Catch an evil main that return and busy loop
 */
__exitTrap:
    b __exitTrap
