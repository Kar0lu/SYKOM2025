#ifndef HEAP_H
#define HEAP_H
#include "common.h"

extern char _heap_start;
extern char _heap_end;

typedef struct BlockHeader {
    size_t size;
    unsigned char is_free;
    struct BlockHeader *next;
} BlockHeader;

#define ALIGN(x)   (((x) + 3) & ~3)
#define BLOCK_HEADER_SIZE  ALIGN(sizeof(BlockHeader))

#endif