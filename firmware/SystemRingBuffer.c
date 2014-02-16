/*
 * Ring Buffer Implementation
 */

#include "SystemRingBuffer.h"

/* Read/Write *****************************************************************/

bool SystemRingBufferRead(SystemRingBuffer_t *buf, uint32_t *elem)
{
    if(!SystemRingBufferIsEmpty(buf))
    {
        elem = &(buf->Buffer[buf->ReadPos]);
        buf->Count--;
        buf->ReadPos++;
        return true;
    }
    else
    {
        elem = NULL;
        return false;
    }
}

bool SystemRingBufferWrite(SystemRingBuffer_t *buf, const uint32_t *elem)
{
    if(!SystemRingBufferIsFull(buf))
    {
        buf->Buffer[buf->WritePos] = *elem;
        buf->WritePos++;
        buf->Count++;
        return true;
    }
    else
    {
        return false;
    }
}

/* Status *********************************************************************/

bool SystemRingBufferIsEmpty(SystemRingBuffer_t *buf)
{
    return (buf->Count == 0);
}

bool SystemRingBufferIsFull(SystemRingBuffer_t *buf)
{
    return (buf->Count == buf->Size);
}

