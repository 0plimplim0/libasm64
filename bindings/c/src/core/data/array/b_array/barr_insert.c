#include "array.h"
#include "array_private.h"
#include "defs.h"

int barr_insert(B_ARRAY *addr, uint8_t v, uint32_t pos) {
  return b_array_insert(addr, v, pos);
}