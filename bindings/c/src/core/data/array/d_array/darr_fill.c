#include "array.h"
#include "array_private.h"
#include "defs.h"

void darr_fill(D_ARRAY *addr, uint32_t v) {
  d_array_fill(addr, v);
}