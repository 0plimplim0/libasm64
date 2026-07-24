#ifndef MEMORY_H
#define MEMORY_H

#include "defs.h"

void* malloc(size_t size);
int memcmp(const void *m1, const void *m2, size_t n);
void memcpy(void *dest, const void *src, size_t n);
void free(void *m);
void memmov(void *dest, const void *src, size_t n);
void memset(void *m, uint8_t b, size_t n);

#endif