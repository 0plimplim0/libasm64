#include "array.h"
#include "array_private.h"
#include "defs.h"

uint32_t darr_get(const D_ARRAY *addr, uint32_t pos) {
  return d_array_get(addr, pos);
}