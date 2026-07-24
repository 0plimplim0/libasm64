#include "memory.h"
#include "memory_private.h"
#include "defs.h"

void memmov(void *dest, const void *src, size_t n) {
  if (!dest || !src || !n) { return; }
  mem_mov(src, dest, n);
}