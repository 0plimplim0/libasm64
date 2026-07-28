#include "array.h"
#include "array_private.h"
#include "defs.h"

int darr_insert(D_ARRAY *addr, uint32_t v, uint32_t pos) {
  return d_array_insert(addr, v, pos);
}