#include "array.h"
#include "array_private.h"
#include "defs.h"

D_ARRAY* darr_new(uint32_t size, void *addr) {
  return d_array_new(size, addr);
}