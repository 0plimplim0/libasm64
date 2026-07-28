#include "array.h"
#include "array_private.h"
#include "defs.h"

int barr_remove(B_ARRAY *addr, uint32_t pos) {
  return b_array_remove(addr, pos);
}