#include "memory.h"
#include "memory_private.h"

void free(void *m) {
  if (!m) { return; }
  mem_free(m);
}