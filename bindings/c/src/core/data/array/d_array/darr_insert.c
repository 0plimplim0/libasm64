#include "array.h"
#include "array_private.h"
#include "defs.h"

void darr_insert(D_ARRAY *addr, uint32_t v, uint32_t pos) {
  d_array_insert(addr, v, pos);
}