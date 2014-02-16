/*
 * Ring Buffer
 */

#ifndef SYSTEMRINGBUFFER_H
#define SYSTEMRINGBUFFER_H

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

/* Ring Buffer ****************************************************************/

typedef struct SystemRingBuffer_t {
    uint32_t *Buffer;
    uint32_t ReadPos;
    uint32_t WritePos;
    uint32_t Count;
    uint32_t Size;
} SystemRingBuffer_t;

/* Read/Write *****************************************************************/

bool SystemRingBufferRead(SystemRingBuffer_t *buf, uint32_t *elem);
bool SystemRingBufferWrite(SystemRingBuffer_t *buf, const uint32_t *elem);

/* Status *********************************************************************/

bool SystemRingBufferIsEmpty(SystemRingBuffer_t *buf);
bool SystemRingBufferIsFull(SystemRingBuffer_t *buf);

#endif

