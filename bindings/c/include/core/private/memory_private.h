#ifndef MEMORY_PRIVATE_H
#define MEMORY_PRIVATE_H

#include "defs.h"

extern void* mem_alloc(size_t size);
extern int mem_cmp(const void *m1, const void *m2, size_t n);
extern void mem_cpy(const void *src, void *dest, size_t n);   // Yeah, the args are inverted
extern void mem_free(void *m);
extern void mem_mov(const void *src, void *dest, size_t n);   // This too :p
extern void mem_set(void *m, size_t n, uint8_t byte);

#endif