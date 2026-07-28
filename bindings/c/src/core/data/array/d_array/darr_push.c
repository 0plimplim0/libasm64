#include "array.h"
#include "array_private.h"
#include "defs.h"

int darr_push(D_ARRAY *addr, uint32_t v) {
  return d_array_push(addr, v);
}