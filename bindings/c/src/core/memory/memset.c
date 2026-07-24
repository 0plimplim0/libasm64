#include "memory.h"
#include "memory_private.h"
#include "defs.h"

void memset(void *m, uint8_t b, size_t n) {
  if (!m || !n) { return; }
  mem_set(m, n, b);
}