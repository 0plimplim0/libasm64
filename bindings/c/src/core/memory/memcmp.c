#include "memory.h"
#include "memory_private.h"
#include "defs.h"

int memcmp(const void *m1, const void *m2, size_t n) {
  if (!m1 || !m2 || !n) { return 0; }
  return mem_cmp(m1, m2, n);
}