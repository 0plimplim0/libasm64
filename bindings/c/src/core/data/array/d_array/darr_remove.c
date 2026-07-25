#include "array.h"
#include "array_private.h"
#include "defs.h"

void darr_remove(D_ARRAY *addr, uint32_t pos) {
  d_array_remove(addr, pos);
}