#include "array.h"
#include "array_private.h"
#include "defs.h"

int darr_fill(D_ARRAY *addr, uint32_t v) {
  return d_array_fill(addr, v);
}