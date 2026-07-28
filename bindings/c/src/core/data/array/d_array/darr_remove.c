#include "array.h"
#include "array_private.h"
#include "defs.h"

int darr_remove(D_ARRAY *addr, uint32_t pos) {
  return d_array_remove(addr, pos);
}