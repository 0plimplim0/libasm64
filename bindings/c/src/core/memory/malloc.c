#include "memory.h"
#include "memory_private.h"
#include "defs.h"

void* malloc(size_t size) {
  if (!size) { return NULL; }
  return mem_alloc(size);
}