#include "heap.h"

static BlockHeader *heap = NULL;

void heap_init(void) {
    heap = (BlockHeader *)&_heap_start;
    heap->size = (size_t)(&_heap_end - &_heap_start) - BLOCK_HEADER_SIZE;
    heap->is_free = 1;
    heap->next = NULL;
}


void *malloc(size_t size) {
    size = ALIGN(size);
    BlockHeader *current = heap;

    // While current is not NULL (end of heap)
    while (current) {

        // If current block is not taken and is at least of size we want to allocate
        if (current->is_free && current->size >= size) {

            // If current block is bigger, then split it (If we can later use it)
            if (current->size >= size + BLOCK_HEADER_SIZE + 4) {

                // New block will be after current block (that we are taking)
                BlockHeader *new_block = (BlockHeader *)((unsigned char *)current + BLOCK_HEADER_SIZE + size);
                new_block->size = current->size - size - BLOCK_HEADER_SIZE;
                new_block->is_free = 1;
                new_block->next = current->next;

                // And will be next for our block
                current->next = new_block;
                current->size = size;
            }

            // We are taking it and returning address (after header)
            current->is_free = 0;
            return (void *)((unsigned char *)current + BLOCK_HEADER_SIZE);
        }

        // Ocupied and/or too small
        current = current->next;
    }

    // Couldn't allocate space
    return NULL;
}


void free(void *ptr) {
    if (!ptr) return;

    BlockHeader *block = (BlockHeader *)((unsigned char *)ptr - BLOCK_HEADER_SIZE);
    block->is_free = 1;

    // Integrate free neighbours
    BlockHeader *current = heap;
    while (current && current->next) {
        if (current->is_free && current->next->is_free) {
            current->size += BLOCK_HEADER_SIZE + current->next->size;
            current->next = current->next->next;
        } else {
            current = current->next;
        }
    }
}

void handle_out_of_heap(void){
    send_UART_chars("\nApplication couldn't allocate enogh memory.\n"
                    "Would you like to clear heap or exit application?\n"
                    "c - clear memory\nanything else - exit application\n");
    
    if(recive_UART_char() == 'c')
        heap_init();

    exit_simulation();
}