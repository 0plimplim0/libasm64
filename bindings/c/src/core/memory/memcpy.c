#include "memory.h"
#include "memory_private.h"
#include "defs.h"

void memcpy(void *dest, const void *src, size_t n) {
  if (!dest || !src || !n) { return; }
  mem_cpy(src, dest, n);
}