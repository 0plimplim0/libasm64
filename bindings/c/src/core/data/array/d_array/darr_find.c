#include "array.h"
#include "array_private.h"
#include "defs.h"

uint32_t darr_find(const D_ARRAY *addr, uint32_t v) {
  return d_array_find(addr, v);
}