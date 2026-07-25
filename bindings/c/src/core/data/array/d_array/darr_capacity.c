#include "array.h"
#include "array_private.h"
#include "defs.h"

uint32_t darr_capacity(const D_ARRAY *addr) {
  return d_array_capacity(addr);
}